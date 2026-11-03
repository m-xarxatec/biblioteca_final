CREATE SCHEMA IF NOT EXISTS "public";

CREATE TABLE "public"."User" (
    "id" serial NOT NULL,
    "name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "second_last_name" varchar,
    "email" varchar NOT NULL,
    "dni" varchar NOT NULL,
    "street_type" varchar NOT NULL,
    "street_name" varchar NOT NULL,
    "street_number" varchar NOT NULL,
    "block" varchar,
    "floor" varchar,
    "door" varchar,
    "additional_info" text,
    "postal_code" varchar NOT NULL,
    "city" varchar NOT NULL,
    "province" varchar NOT NULL,
    "phone_number" varchar NOT NULL,
    "role" bigint NOT NULL,
    "status" bigint NOT NULL,
    "birthdate" date NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Audit_log" (
    "id" serial NOT NULL,
    "id_user" int NOT NULL,
    "table_name" varchar NOT NULL,
    "id_record" int,
    "operation" bigint NOT NULL,
    "old_data" jsonb NOT NULL,
    "new_data" jsonb,
    "logged_at" timestamptz,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Loan" (
    "id" serial NOT NULL,
    "id_user" int NOT NULL,
    "id_item" int NOT NULL,
    "finish_date" timestamptz NOT NULL,
    "start_date" timestamptz NOT NULL,
    "return_date" timestamptz,
    "observations" text,
    "managed_by" int NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Item" (
    "id" serial NOT NULL,
    "title" varchar NOT NULL,
    "editorial" varchar,
    "isbn" varchar,
    "edition_number" int,
    "publication_date" timestamp,
    "synopsis" text,
    "ubication" int NOT NULL,
    "status" varchar NOT NULL,
    "quality" varchar NOT NULL,
    "observations" text,
    "language" varchar,
    "extention" int NOT NULL,
    "country" varchar,
    "type" varchar NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Reservation" (
    "id" serial NOT NULL,
    "id_item" int NOT NULL,
    "id_user" int NOT NULL,
    "observations" text,
    "status" varchar,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Item_writer_rel" (
    "id_item" int NOT NULL,
    "id_writer" int NOT NULL,
    PRIMARY KEY ("id_item", "id_writer")
);

CREATE TABLE "public"."Request" (
    "id" serial NOT NULL,
    "id_user" int NOT NULL,
    "created_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_by" int NOT NULL,
    "updated_at" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_by" int NOT NULL,
    "managed_by" int NOT NULL,
    "description" text NOT NULL,
    "status" varchar NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Sanction" (
    "id" serial NOT NULL,
    "id_user" int NOT NULL,
    "id_loan" int,
    "penalty_days" int,
    "type" varchar NOT NULL,
    "status" varchar NOT NULL,
    "observations" text,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Writer" (
    "id" serial NOT NULL,
    "name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "second_last_name" varchar,
    "country" varchar,
    "birthdate" timestamp,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Item_genre_rel" (
    "id_item" int NOT NULL,
    "id_genre" int NOT NULL,
    PRIMARY KEY ("id_item", "id_genre")
);

CREATE TABLE "public"."Genre" (
    "id" serial NOT NULL,
    "name" varchar NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "public"."Location" (
    "id" serial NOT NULL,
    "name" varchar NOT NULL,
    PRIMARY KEY ("id")
);

-- Foreign key constraints
-- Schema: public
ALTER TABLE "public"."Audit_log" ADD CONSTRAINT "fk_Audit_log_id_user_User_id" FOREIGN KEY("id_user") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Item" ADD CONSTRAINT "fk_Item_ubication_Location_id" FOREIGN KEY("ubication") REFERENCES "public"."Location"("id");
ALTER TABLE "public"."Item_genre_rel" ADD CONSTRAINT "fk_Item_genre_rel_id_item_Item_id" FOREIGN KEY("id_item") REFERENCES "public"."Item"("id");
ALTER TABLE "public"."Item_genre_rel" ADD CONSTRAINT "fk_Item_genre_rel_id_genre_Genre_id" FOREIGN KEY("id_genre") REFERENCES "public"."Genre"("id");
ALTER TABLE "public"."Item_writer_rel" ADD CONSTRAINT "fk_Item_writer_rel_id_item_Item_id" FOREIGN KEY("id_item") REFERENCES "public"."Item"("id");
ALTER TABLE "public"."Item_writer_rel" ADD CONSTRAINT "fk_Item_writer_rel_id_writer_Writer_id" FOREIGN KEY("id_writer") REFERENCES "public"."Writer"("id");
ALTER TABLE "public"."Loan" ADD CONSTRAINT "fk_Loan_id_user_User_id" FOREIGN KEY("id_user") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Loan" ADD CONSTRAINT "fk_Loan_id_item_Item_id" FOREIGN KEY("id_item") REFERENCES "public"."Item"("id");
ALTER TABLE "public"."Loan" ADD CONSTRAINT "fk_Loan_managed_by_User_id" FOREIGN KEY("managed_by") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Request" ADD CONSTRAINT "fk_Request_created_by_User_id" FOREIGN KEY("created_by") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Request" ADD CONSTRAINT "fk_Request_id_user_User_id" FOREIGN KEY("id_user") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Request" ADD CONSTRAINT "fk_Request_managed_by_User_id" FOREIGN KEY("managed_by") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Request" ADD CONSTRAINT "fk_Request_updated_by_User_id" FOREIGN KEY("updated_by") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Reservation" ADD CONSTRAINT "fk_Reservation_id_item_Item_id" FOREIGN KEY("id_item") REFERENCES "public"."Item"("id");
ALTER TABLE "public"."Reservation" ADD CONSTRAINT "fk_Reservation_id_user_User_id" FOREIGN KEY("id_user") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Sanction" ADD CONSTRAINT "fk_Sanction_id_user_User_id" FOREIGN KEY("id_user") REFERENCES "public"."User"("id");
ALTER TABLE "public"."Sanction" ADD CONSTRAINT "fk_Sanction_id_loan_Loan_id" FOREIGN KEY("id_loan") REFERENCES "public"."Loan"("id");
