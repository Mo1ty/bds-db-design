-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS "mydb";

-- -----------------------------------------------------
-- Table "mydb"."clients"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."clients" (
  "clients_ID" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(20) NOT NULL,
  "surname" VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table "mydb"."brands_support_numbers"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."brands_support_numbers" (
  "brand" SERIAL PRIMARY KEY NOT NULL,
  "support_mail" VARCHAR(45) NULL,
  "support_number" VARCHAR(45) NULL
);


-- -----------------------------------------------------
-- Table "mydb"."cars"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."cars" (
  "cars_ID" SERIAL PRIMARY KEY NOT NULL,
  "brand" INT NOT NULL,
  "model" VARCHAR(45) NOT NULL,
  "rent_cost" INT NOT NULL,
  FOREIGN KEY ("brand") REFERENCES "mydb"."brands_support_numbers"
);


-- -----------------------------------------------------
-- Table "mydb"."car_was_rented"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."car_was_rented" (
  "rent_ID" SERIAL PRIMARY KEY NOT NULL,
  "rent_start" TIMESTAMP NOT NULL,
  "rent_end" TIMESTAMP NOT NULL
);

-- -----------------------------------------------------
-- Table "mydb"."cars_has_car_was_rented"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."cars_has_car_was_rented" (
  "cars_ID" INT NOT NULL,
  "rent_ID" INT NOT NULL,
  PRIMARY KEY ("cars_ID", "rent_ID"),
  FOREIGN KEY ("cars_ID") REFERENCES "mydb"."cars",
  FOREIGN KEY ("rent_ID") REFERENCES "mydb"."car_was_rented"
);


-- -----------------------------------------------------
-- Table "mydb"."clients_has_car_was_rented"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."clients_has_car_was_rented" (
  "clients_ID" INT NOT NULL,
  "rent_ID" INT NOT NULL,
  PRIMARY KEY ("clients_ID", "rent_ID"),
  FOREIGN KEY ("clients_ID") REFERENCES "mydb"."clients",
  FOREIGN KEY ("rent_ID") REFERENCES "mydb"."car_was_rented"
);


-- -----------------------------------------------------
-- Table "mydb"."parking"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."parking" (
  "parking_ID" SERIAL PRIMARY KEY NOT NULL,
  "Street" VARCHAR(45) NOT NULL,
  "street_number" VARCHAR(45) NOT NULL,
  "postal_code" VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table "mydb"."cars_has_parking"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."cars_has_parking" (
  "cars_ID" INT NOT NULL,
  "parking_ID" INT NOT NULL,
  PRIMARY KEY ("cars_ID", "parking_ID"),
  FOREIGN KEY ("cars_ID") REFERENCES "mydb"."cars",
  FOREIGN KEY ("parking_ID") REFERENCES "mydb"."parking"
);


-- -----------------------------------------------------
-- Table "mydb"."payment_method"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."payment_method" (
  "payment_ID" SERIAL PRIMARY KEY NOT NULL,
  "method" VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table "mydb"."clients_has_payment_method"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."clients_has_payment_method" (
  "clients_ID" INT NOT NULL,
  "payment_ID" INT NOT NULL,
  PRIMARY KEY ("clients_ID", "payment_ID"),
  FOREIGN KEY ("clients_ID") REFERENCES "mydb"."clients",
  FOREIGN KEY ("payment_ID") REFERENCES "mydb"."payment_method"
);


-- -----------------------------------------------------
-- Table "mydb"."contact_info"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."contact_info" (
  "clients_ID" INT PRIMARY KEY NOT NULL,
  "phone_number" VARCHAR(45) NOT NULL,
  "street" VARCHAR(45) NOT NULL,
  "house" VARCHAR(45) NOT NULL,
  "postal_code" VARCHAR(45) NOT NULL,
  FOREIGN KEY ("clients_ID") REFERENCES "mydb"."clients"
);


-- -----------------------------------------------------
-- Table "mydb"."roles"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."roles" (
  "roles_ID" SERIAL PRIMARY KEY NOT NULL,
  "role_type" VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table "mydb"."clients_has_roles"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "mydb"."clients_has_roles" (
  "clients_ID" INT NOT NULL,
  "roles_ID" INT NOT NULL,
  PRIMARY KEY ("clients_ID", "roles_ID"),
  FOREIGN KEY ("clients_ID") REFERENCES "mydb"."clients",
  FOREIGN KEY ("roles_ID") REFERENCES "mydb"."roles"
);
