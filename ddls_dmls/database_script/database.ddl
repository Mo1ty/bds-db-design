-- -----------------------------------------------------
-- Schema car_service
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS "car_service";

-- -----------------------------------------------------
-- Table "car_service"."clients"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."clients" (
  "clients_id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(20) NOT NULL,
  "surname" VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table "car_service"."brands_support_numbers"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."brands_support_numbers" (
  "brand" VARCHAR(45) PRIMARY KEY NOT NULL,
  "support_mail" VARCHAR(45) NULL,
  "support_number" VARCHAR(45) NULL
);


-- -----------------------------------------------------
-- Table "car_service"."cars"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."cars" (
  "cars_id" SERIAL PRIMARY KEY NOT NULL,
  "brand" VARCHAR(45) NOT NULL,
  "model" VARCHAR(45) NOT NULL,
  "cars_number" VARCHAR(15) UNIQUE NOT NULL,
  "rent_cost" INT NOT NULL,
  FOREIGN KEY ("brand") REFERENCES "car_service"."brands_support_numbers"
);


-- -----------------------------------------------------
-- Table "car_service"."car_was_rented"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."car_was_rented" (
  "rent_id" SERIAL PRIMARY KEY NOT NULL,
  "rent_start" TIMESTAMP NOT NULL,
  "rent_end" TIMESTAMP NOT NULL
);

-- -----------------------------------------------------
-- Table "car_service"."cars_has_car_was_rented"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."cars_has_car_was_rented" (
  "cars_id" INT NOT NULL,
  "rent_id" INT NOT NULL,
  PRIMARY KEY ("cars_id", "rent_id"),
  FOREIGN KEY ("cars_id") REFERENCES "car_service"."cars",
  FOREIGN KEY ("rent_id") REFERENCES "car_service"."car_was_rented"
);


-- -----------------------------------------------------
-- Table "car_service"."clients_has_car_was_rented"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."clients_has_car_was_rented" (
  "clients_id" INT NOT NULL,
  "rent_id" INT NOT NULL,
  PRIMARY KEY ("clients_id", "rent_id"),
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients",
  FOREIGN KEY ("rent_id") REFERENCES "car_service"."car_was_rented"
);


-- -----------------------------------------------------
-- Table "car_service"."parking"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."parking" (
  "parking_id" SERIAL PRIMARY KEY NOT NULL,
  "Street" VARCHAR(45) NOT NULL,
  "street_number" VARCHAR(45) NOT NULL,
  "postal_code" VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table "car_service"."cars_has_parking"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."cars_has_parking" (
  "cars_id" INT NOT NULL,
  "parking_id" INT NOT NULL,
  PRIMARY KEY ("cars_id", "parking_id"),
  FOREIGN KEY ("cars_id") REFERENCES "car_service"."cars",
  FOREIGN KEY ("parking_id") REFERENCES "car_service"."parking"
);


-- -----------------------------------------------------
-- Table "car_service"."payment_method"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."payment_method" (
  "payment_id" SERIAL PRIMARY KEY NOT NULL,
  "method" VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table "car_service"."clients_has_payment_method"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."clients_has_payment_method" (
  "clients_id" INT NOT NULL,
  "payment_id" INT NOT NULL,
  PRIMARY KEY ("clients_id", "payment_id"),
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients",
  FOREIGN KEY ("payment_id") REFERENCES "car_service"."payment_method"
);


-- -----------------------------------------------------
-- Table "car_service"."contact_info"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."contact_info" (
  "clients_id" INT PRIMARY KEY NOT NULL,
  "phone_number" VARCHAR(45) NOT NULL,
  "street" VARCHAR(45) NOT NULL,
  "house" VARCHAR(45) NOT NULL,
  "postal_code" VARCHAR(45) NOT NULL,
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients"
);


-- -----------------------------------------------------
-- Table "car_service"."roles"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."roles" (
  "roles_id" SERIAL PRIMARY KEY NOT NULL,
  "role_type" VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Table "car_service"."clients_has_roles"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."clients_has_roles" (
  "clients_id" INT NOT NULL,
  "roles_id" INT NOT NULL,
  PRIMARY KEY ("clients_id", "roles_id"),
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients",
  FOREIGN KEY ("roles_id") REFERENCES "car_service"."roles"
);
