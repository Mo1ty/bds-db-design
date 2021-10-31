-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema car_service
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema car_service
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_service` DEFAULT CHARACTER SET utf8 ;
USE `car_service` ;

-- -----------------------------------------------------
-- Table `car_service`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`clients` (
  `clients_id` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`clients_id`),
  UNIQUE INDEX `user_ID_UNIQUE` (`clients_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`brands_support_numbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`brands_support_numbers` (
  `brand` VARCHAR(45) NOT NULL,
  `support_mail` VARCHAR(45) NULL,
  `support_number` VARCHAR(45) NULL,
  PRIMARY KEY (`brand`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`cars` (
  `cars_id` INT NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `cars_number` VARCHAR(15) NOT NULL,
  `rent_cost` INT NOT NULL,
  PRIMARY KEY (`cars_id`),
  INDEX `fk_cars_brands_support_numbers1_idx` (`brand` ASC),
  UNIQUE INDEX `cars_number_UNIQUE` (`cars_number` ASC),
  CONSTRAINT `fk_cars_brands_support_numbers1`
    FOREIGN KEY (`brand`)
    REFERENCES `car_service`.`brands_support_numbers` (`brand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`car_was_rented`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`car_was_rented` (
  `rent_id` INT NOT NULL,
  `rent_start` DATETIME NOT NULL,
  `rent_end` DATETIME NOT NULL,
  PRIMARY KEY (`rent_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`parking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`parking` (
  `parking_id` INT NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `street_number` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`parking_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`payment_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`payment_method` (
  `payment_id` INT NOT NULL,
  `method` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`contact_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`contact_info` (
  `clients_id` INT NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `house` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`clients_id`),
  INDEX `fk_contact_info_clients1_idx` (`clients_id` ASC),
  CONSTRAINT `fk_contact_info_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `car_service`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`roles` (
  `roles_id` INT NOT NULL,
  `role_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`roles_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`cars_has_car_was_rented`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`cars_has_car_was_rented` (
  `cars_id` INT NOT NULL,
  `rent_id` INT NOT NULL,
  PRIMARY KEY (`cars_id`, `rent_id`),
  INDEX `fk_cars_has_car_was_rented_car_was_rented1_idx` (`rent_id` ASC),
  INDEX `fk_cars_has_car_was_rented_cars1_idx` (`cars_id` ASC),
  CONSTRAINT `fk_cars_has_car_was_rented_cars1`
    FOREIGN KEY (`cars_id`)
    REFERENCES `car_service`.`cars` (`cars_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_has_car_was_rented_car_was_rented1`
    FOREIGN KEY (`rent_id`)
    REFERENCES `car_service`.`car_was_rented` (`rent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`clients_has_car_was_rented`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`clients_has_car_was_rented` (
  `clients_id` INT NOT NULL,
  `rent_id` INT NOT NULL,
  PRIMARY KEY (`clients_id`, `rent_id`),
  INDEX `fk_clients_has_car_was_rented_car_was_rented1_idx` (`rent_id` ASC),
  INDEX `fk_clients_has_car_was_rented_clients1_idx` (`clients_id` ASC),
  CONSTRAINT `fk_clients_has_car_was_rented_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `car_service`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_has_car_was_rented_car_was_rented1`
    FOREIGN KEY (`rent_id`)
    REFERENCES `car_service`.`car_was_rented` (`rent_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`clients_has_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`clients_has_roles` (
  `clients_id` INT NOT NULL,
  `roles_id` INT NOT NULL,
  PRIMARY KEY (`clients_id`, `roles_id`),
  INDEX `fk_clients_has_roles_roles1_idx` (`roles_id` ASC),
  INDEX `fk_clients_has_roles_clients1_idx` (`clients_id` ASC),
  CONSTRAINT `fk_clients_has_roles_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `car_service`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_has_roles_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `car_service`.`roles` (`roles_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`clients_has_payment_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`clients_has_payment_method` (
  `clients_id` INT NOT NULL,
  `payment_id` INT NOT NULL,
  PRIMARY KEY (`clients_id`, `payment_id`),
  INDEX `fk_clients_has_payment_method_payment_method1_idx` (`payment_id` ASC),
  INDEX `fk_clients_has_payment_method_clients1_idx` (`clients_id` ASC),
  CONSTRAINT `fk_clients_has_payment_method_clients1`
    FOREIGN KEY (`clients_id`)
    REFERENCES `car_service`.`clients` (`clients_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clients_has_payment_method_payment_method1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `car_service`.`payment_method` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `car_service`.`cars_has_parking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_service`.`cars_has_parking` (
  `cars_id` INT NOT NULL,
  `parking_id` INT NOT NULL,
  PRIMARY KEY (`cars_id`, `parking_id`),
  INDEX `fk_cars_has_parking_parking1_idx` (`parking_id` ASC),
  INDEX `fk_cars_has_parking_cars1_idx` (`cars_id` ASC),
  CONSTRAINT `fk_cars_has_parking_cars1`
    FOREIGN KEY (`cars_id`)
    REFERENCES `car_service`.`cars` (`cars_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_has_parking_parking1`
    FOREIGN KEY (`parking_id`)
    REFERENCES `car_service`.`parking` (`parking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
