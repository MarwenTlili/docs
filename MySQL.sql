-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ems
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ems
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ems` DEFAULT CHARACTER SET utf8mb4 ;
USE `ems` ;

-- -----------------------------------------------------
-- Table `ems`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `is_valid` TINYINT NULL,
  `created_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ems`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `salary` DECIMAL(18,0) NULL,
  `joining_date` DATETIME NULL,
  `departement` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_employee_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_employee_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ems`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ems`.`reward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ems`.`reward` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_reward` DATETIME NULL,
  `amount` INT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reward_employee_idx` (`employee_id` ASC),
  CONSTRAINT `fk_reward_employee`
    FOREIGN KEY (`employee_id`)
    REFERENCES `ems`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
