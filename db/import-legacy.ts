import { existsSync } from "node:fs";
import { join } from "node:path";
import { sql } from "drizzle-orm";
import { db } from "./index.js";
import * as schema from "./schema.js";

const importId = "sqlite_sentinela_v1";
// A database marker and transaction lock make this safe across concurrent instances.
export async function importLegacyData() {
  const done = await db.select().from(schema.imports).where(sql`id = ${importId}`);
  if (done.length) return;
  const source = ["data/sentinela.db", "data/backups/before-role-split/sentinela.db"]
    .map(path => join(process.cwd(), path)).find(existsSync);
  if (!source) throw new Error("Backup SQLite ausente: importação interrompida para preservar os dados.");
  const { DatabaseSync } = await import("node:sqlite");
  const legacy = new DatabaseSync(source, {readOnly: true});
  try {
    await db.transaction(async tx => {
      await tx.execute(sql`SELECT pg_advisory_xact_lock(726361892)`);
      if ((await tx.select().from(schema.imports).where(sql`id = ${importId}`)).length) return;
      const existing = new Set(legacy.prepare("SELECT name FROM sqlite_master WHERE type = 'table'").all().map(row => String(row["name"])));
      const tables = ["users", "sessions", "user_accessibility_preferences", "occurrences", "predictions", "audits", "contests", "reports", "notifications", "patrols", "recommendations", "ai_decisions", "bias_alerts", "mitigations", "models", "data_quality"];
      for (const table of tables) {
        if (!existing.has(table)) continue;
        const columns = legacy.prepare(`PRAGMA table_info(${table})`).all().map(row => String(row["name"]));
        for (const row of legacy.prepare(`SELECT * FROM ${table}`).all()) {
          const names = [...columns];
          const values = columns.map(column => row[column]);
          if (table === "users" && !columns.includes("institutional_type")) {
            names.push("institutional_type"); values.push(row["role"] === "institutional" ? "auditor" : null);
          }
          // No conflict suppression: any collision rolls back the entire import.
          await tx.execute(sql`INSERT INTO ${sql.identifier(table)} (${sql.join(names.map(name => sql.identifier(name)), sql`, `)}) VALUES (${sql.join(values.map(value => sql`${value}`), sql`, `)})`);
        }
      }
      await tx.execute(sql`UPDATE occurrences SET status = 'Em análise' WHERE source = 'População' AND status IN ('Recebida', 'Informada')`);
      await tx.execute(sql`UPDATE occurrences SET status = 'Validação' WHERE source = 'População' AND status = 'Concluído'`);
      await tx.insert(schema.imports).values({id: importId});
    });
  } finally { legacy.close(); }
}
