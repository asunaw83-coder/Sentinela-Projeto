CREATE TABLE "user_accessibility_preferences" (
	"user_id" text PRIMARY KEY,
	"text_scale" integer DEFAULT 100 NOT NULL,
	"high_contrast" integer DEFAULT 0 NOT NULL,
	"reduce_motion" integer DEFAULT 0 NOT NULL,
	"screen_reader" integer DEFAULT 1 NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT "text_scale_range" CHECK ("text_scale" BETWEEN 80 AND 140)
);
--> statement-breakpoint
CREATE TABLE "ai_decisions" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "audits" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "bias_alerts" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "contests" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"evidence_name" text,
	"evidence_type" text,
	"evidence_data" text
);
--> statement-breakpoint
CREATE TABLE "data_quality" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "legacy_imports" (
	"id" text PRIMARY KEY,
	"completed_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "mitigations" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "models" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "notifications" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "occurrences" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"evidence_name" text,
	"evidence_type" text,
	"evidence_data" text,
	"priority" text DEFAULT 'Normal' NOT NULL,
	"contact_authorized" integer DEFAULT 0 NOT NULL,
	"anonymous" integer DEFAULT 0 NOT NULL,
	"latitude" double precision,
	"longitude" double precision,
	"city" text,
	"state" text
);
--> statement-breakpoint
CREATE TABLE "patrols" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"result" text,
	"recommendation_followed" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "predictions" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "recommendations" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "reports" (
	"id" text PRIMARY KEY,
	"title" text NOT NULL,
	"region" text DEFAULT 'Salvador' NOT NULL,
	"event_date" text NOT NULL,
	"event_time" text DEFAULT '' NOT NULL,
	"source" text DEFAULT 'Institucional' NOT NULL,
	"status" text DEFAULT 'Pendente' NOT NULL,
	"confidence" integer DEFAULT 0 NOT NULL,
	"details" text DEFAULT '' NOT NULL,
	"created_by" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"updated_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "sessions" (
	"token" text PRIMARY KEY,
	"user_id" text NOT NULL,
	"expires_at" text NOT NULL,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" text PRIMARY KEY,
	"role" text NOT NULL,
	"name" text NOT NULL,
	"email" text NOT NULL,
	"password_hash" text NOT NULL,
	"cpf" text UNIQUE,
	"birth_date" text,
	"phone" text,
	"postal_code" text,
	"state" text DEFAULT 'BA' NOT NULL,
	"city" text DEFAULT 'Salvador' NOT NULL,
	"neighborhood" text,
	"address" text,
	"institution" text,
	"functional_id" text UNIQUE,
	"created_at" text DEFAULT CURRENT_TIMESTAMP NOT NULL,
	"latitude" double precision,
	"longitude" double precision,
	"location_consent" integer DEFAULT 0 NOT NULL,
	"institutional_type" text,
	CONSTRAINT "users_role_check" CHECK ("role" IN ('citizen','institutional'))
);
--> statement-breakpoint
CREATE INDEX "sessions_user_id_idx" ON "sessions" ("user_id");--> statement-breakpoint
CREATE UNIQUE INDEX "users_email_unique" ON "users" (lower("email"));--> statement-breakpoint
ALTER TABLE "user_accessibility_preferences" ADD CONSTRAINT "user_accessibility_preferences_user_id_users_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE;--> statement-breakpoint
ALTER TABLE "ai_decisions" ADD CONSTRAINT "ai_decisions_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "audits" ADD CONSTRAINT "audits_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "bias_alerts" ADD CONSTRAINT "bias_alerts_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "contests" ADD CONSTRAINT "contests_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "data_quality" ADD CONSTRAINT "data_quality_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "mitigations" ADD CONSTRAINT "mitigations_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "models" ADD CONSTRAINT "models_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "notifications" ADD CONSTRAINT "notifications_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "occurrences" ADD CONSTRAINT "occurrences_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "patrols" ADD CONSTRAINT "patrols_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "predictions" ADD CONSTRAINT "predictions_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "recommendations" ADD CONSTRAINT "recommendations_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "reports" ADD CONSTRAINT "reports_created_by_users_id_fkey" FOREIGN KEY ("created_by") REFERENCES "users"("id");--> statement-breakpoint
ALTER TABLE "sessions" ADD CONSTRAINT "sessions_user_id_users_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE;