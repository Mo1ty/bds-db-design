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
  "surname" VARCHAR(45) NOT NULL,
  "phone_number" VARCHAR(15) UNIQUE NOT NULL,
  "passport_number" VARCHAR(15) UNIQUE NOT NULL,
  "email" VARCHAR(45) UNIQUE NOT NULL
);


-- -----------------------------------------------------
-- Table "car_service"."brands_support_numbers"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."brands_support_numbers" (
  "brand" VARCHAR(15) PRIMARY KEY NOT NULL,
  "address_id" INT UNIQUE NOT NULL,
  "support_mail" VARCHAR(45) NULL,
  "support_number" VARCHAR(20) NULL
);


-- -----------------------------------------------------
-- Table "car_service"."parking"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."parking" (
  "parking_id" SERIAL PRIMARY KEY NOT NULL,
  "capacity" SMALLINT NOT NULL,
  "city" VARCHAR(35) NOT NULL,
  "street" VARCHAR(20) NOT NULL,
  "house" VARCHAR(10) NOT NULL,
  "postal_code" VARCHAR(15) NOT NULL
);


-- -----------------------------------------------------
-- Table "car_service"."cars"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."cars" (
  "cars_id" SERIAL PRIMARY KEY NOT NULL,
  "brand" VARCHAR(20) NULL,
  "parking_id" INT NULL,
  "model" VARCHAR(20) NOT NULL,
  "cars_number" VARCHAR(15) UNIQUE NOT NULL,
  "rent_cost" INT NOT NULL,
  FOREIGN KEY ("brand") REFERENCES "car_service"."brands_support_numbers" ("brand") ON DELETE SET NULL,
  FOREIGN KEY ("parking_id") REFERENCES "car_service"."parking" ("parking_id") ON DELETE SET NULL
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
-- Table "car_service"."payment_method"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."payment_method" (
  "payment_id" SERIAL NOT NULL,
  "clients_id" INT NOT NULL,
  "sum_paid" REAL NOT NULL,
  "payment_time" TIMESTAMP NOT NULL,
  "method" VARCHAR(15) NOT NULL,
  "bank_account" VARCHAR(30) NULL,
  PRIMARY KEY ("payment_id", "clients_id"),
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients" ON DELETE CASCADE
);


-- -----------------------------------------------------
-- Table "car_service"."clients_contacts"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."clients_contacts" (
  "address_id" INT PRIMARY KEY NOT NULL,
  "city" VARCHAR(35) NOT NULL,
  "street" VARCHAR(25) NOT NULL,
  "house" VARCHAR(10) NOT NULL,
  "postal_code" VARCHAR(15) NOT NULL
);


-- -----------------------------------------------------
-- Table "car_service"."dealer_addresses"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."dealer_addresses" (
  "address_id" INT PRIMARY KEY NOT NULL,
  "city" VARCHAR(35) NOT NULL,
  "street" VARCHAR(25) NOT NULL,
  "house" VARCHAR(10) NOT NULL,
  "postal_code" VARCHAR(15) NOT NULL,
  FOREIGN KEY ("address_id") REFERENCES "car_service"."brands_support_numbers" ("address_id") ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table "car_service"."roles"
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS "car_service"."roles" (
  "roles_id" SERIAL PRIMARY KEY NOT NULL,
  "role_type" VARCHAR(25) NOT NULL
);


-- -----------------------------------------------------
-- Table "car_service"."clients_roles"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."clients_roles" (
  "clients_id" INT NOT NULL,
  "roles_id" INT NOT NULL,
  "expiration_date" TIMESTAMP NOT NULL,
  
  PRIMARY KEY ("clients_id", "roles_id"),
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients" ON DELETE CASCADE,
  FOREIGN KEY ("roles_id") REFERENCES "car_service"."roles" ON DELETE CASCADE
);


-- -----------------------------------------------------
-- Table "car_service"."cars_rents"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."cars_rents" (
  "cars_id" INT NOT NULL,
  "rent_id" INT NOT NULL,
  PRIMARY KEY ("cars_id", "rent_id"),
  FOREIGN KEY ("cars_id") REFERENCES "car_service"."cars" ON DELETE CASCADE, 
  FOREIGN KEY ("rent_id") REFERENCES "car_service"."car_was_rented" ON DELETE CASCADE
);


-- -----------------------------------------------------
-- Table "car_service"."clients_rents"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."clients_rents" (
  "clients_id" INT NOT NULL,
  "rent_id" INT NOT NULL,
  PRIMARY KEY ("clients_id", "rent_id"),
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients" ON DELETE CASCADE,
  FOREIGN KEY ("rent_id") REFERENCES "car_service"."car_was_rented" ON DELETE CASCADE
);


-- -----------------------------------------------------
-- Table "car_service"."user_login_data"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."user_login_data" (
  "clients_id" INT PRIMARY KEY NOT NULL,
  "user_login" VARCHAR(45) NOT NULL,
  "password_hash" VARCHAR(256) NOT NULL,
  "letter_letter_hash" VARCHAR(256) NULL,
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients" ON DELETE CASCADE
);
  
-- -----------------------------------------------------
-- Table "car_service"."clients_addresses"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "car_service"."clients_addresses" (
  "clients_id" INT NOT NULL,
  "address_id" INT NOT NULL,
  PRIMARY KEY ("clients_id", "address_id"),
  FOREIGN KEY ("clients_id") REFERENCES "car_service"."clients" ON DELETE CASCADE,
  FOREIGN KEY ("address_id") REFERENCES "car_service"."clients_contacts" ON DELETE CASCADE
);