import { sql } from "drizzle-orm";
import { pgTable, text, integer, doublePrecision, check, index, uniqueIndex } from "drizzle-orm/pg-core";

// Keep legacy date strings and integer flags compatible with existing screens.
const now = () => text().notNull().default(sql`CURRENT_TIMESTAMP::text`);
export const users = pgTable("users", {
  id: text().primaryKey(), role: text().notNull(), name: text().notNull(), email: text().notNull(),
  password_hash: text().notNull(), cpf: text().unique(), birth_date: text(), phone: text(), postal_code: text(),
  state: text().notNull().default("BA"), city: text().notNull().default("Salvador"),
  neighborhood: text(), address: text(), institution: text(), functional_id: text().unique(),
  created_at: now(), latitude: doublePrecision(), longitude: doublePrecision(),
  location_consent: integer().notNull().default(0), institutional_type: text(),
}, t => [uniqueIndex("users_email_unique").on(sql`lower(${t.email})`), check("users_role_check", sql`${t.role} IN ('citizen','institutional')`)]);
export const sessions = pgTable("sessions", {
  token: text().primaryKey(), user_id: text().notNull().references(() => users.id, {onDelete: "cascade"}),
  expires_at: text().notNull(), created_at: now(),
}, t => [index("sessions_user_id_idx").on(t.user_id)]);
export const accessibility = pgTable("user_accessibility_preferences", {
  user_id: text().primaryKey().references(() => users.id, {onDelete: "cascade"}),
  text_scale: integer().notNull().default(100), high_contrast: integer().notNull().default(0),
  reduce_motion: integer().notNull().default(0), screen_reader: integer().notNull().default(1), updated_at: now(),
}, t => [check("text_scale_range", sql`${t.text_scale} BETWEEN 80 AND 140`)]);
const recordColumns = () => ({
  id: text().primaryKey(), title: text().notNull(), region: text().notNull().default("Salvador"),
  event_date: text().notNull(), event_time: text().notNull().default(""), source: text().notNull().default("Institucional"),
  status: text().notNull().default("Pendente"), confidence: integer().notNull().default(0), details: text().notNull().default(""),
  created_by: text().notNull().references(() => users.id), created_at: now(), updated_at: now(),
});
const evidenceColumns = () => ({evidence_name: text(), evidence_type: text(), evidence_data: text()});
export const occurrences = pgTable("occurrences", {...recordColumns(), ...evidenceColumns(), priority: text().notNull().default("Normal"), contact_authorized: integer().notNull().default(0), anonymous: integer().notNull().default(0), latitude: doublePrecision(), longitude: doublePrecision(), city: text(), state: text()});
export const contests = pgTable("contests", {...recordColumns(), ...evidenceColumns()});
export const patrols = pgTable("patrols", {...recordColumns(), result: text(), recommendation_followed: integer().notNull().default(0)});
export const predictions = pgTable("predictions", recordColumns());
export const audits = pgTable("audits", recordColumns());
export const reports = pgTable("reports", recordColumns());
export const notifications = pgTable("notifications", recordColumns());
export const recommendations = pgTable("recommendations", recordColumns());
export const aiDecisions = pgTable("ai_decisions", recordColumns());
export const biasAlerts = pgTable("bias_alerts", recordColumns());
export const mitigations = pgTable("mitigations", recordColumns());
export const models = pgTable("models", recordColumns());
export const dataQuality = pgTable("data_quality", recordColumns());
export const imports = pgTable("legacy_imports", {id: text().primaryKey(), completed_at: now()});
