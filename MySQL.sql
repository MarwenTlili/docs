-- -----------------------------------------------------
-- Schema ems
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ems` DEFAULT CHARACTER SET utf8mb4 ;
USE `ems` ;

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
  PRIMARY KEY (`id`)
)
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
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;
