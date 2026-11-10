import "@tanstack/react-start/server-only";
import { sql, type SQL } from "drizzle-orm";
import { db } from "./index.js";
import { importLegacyData } from "./import-legacy.js";

// Parameterize every value while retaining the existing, allowlisted SQL queries.
export function parameterized(query: string, values: unknown[]): SQL {
  const parts = query.split("?");
  if (parts.length !== values.length + 1) throw new Error("Invalid database parameters");
  return sql.join(parts.flatMap((part, i) => i < values.length ? [sql.raw(part), sql`${values[i]}`] : [sql.raw(part)]), sql.raw(""));
}
async function execute(query: string, values: unknown[]) {
  await importLegacyData();
  const result = await db.execute(parameterized(query, values));
  return result.rows as Record<string, unknown>[];
}
export const database = {
  prepare(query: string) {
    return {
      all: (...values: unknown[]) => execute(query, values),
      get: async (...values: unknown[]) => (await execute(query, values))[0],
      run: async (...values: unknown[]) => { await execute(query, values); },
    };
  },
};
