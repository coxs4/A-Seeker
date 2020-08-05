-- -----------------------------------------------------
-- Schema aseeker
-- MySQL Script generated by MySQL Workbench
-- Wed Jul  8 14:16:10 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Aseeker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aseeker` DEFAULT CHARACTER SET utf8 ;
USE `aseeker` ;

-- -----------------------------------------------------
-- Table `aseeker`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseeker`.`account` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aseeker`.`transcription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aseeker`.`transcription` (
  `email` VARCHAR(255) NOT NULL,
  `preview` VARCHAR(45) NULL,
  `full_transcription` JSON NOT NULL,
  `content_url` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`title`),
  CONSTRAINT `email`
    FOREIGN KEY (`email`)
    REFERENCES `aseeker`.`account` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

--- Load demo data ---

INSERT IGNORE INTO account (email, password) VALUES ('test@test.com', 'password123');
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
FLUSH PRIVILEGES;

CREATE USER 'root'@'%' IDENTIFIED BY 'toor';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

FLUSH PRIVILEGES;
