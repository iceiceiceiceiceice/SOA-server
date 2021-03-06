-- MySQL Script generated by MySQL Workbench
-- Tue Apr 24 15:56:27 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema soa2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema soa2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `soa2` DEFAULT CHARACTER SET utf8 ;
USE `soa2` ;

-- -----------------------------------------------------
-- Table `soa2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soa2`.`users` (
  `ID` INT(11) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Username_UNIQUE` (`Username` ASC),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soa2`.`form`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soa2`.`form` (
  `User_ID` INT(11) NOT NULL,
  `Point1` INT(11) NOT NULL DEFAULT '0',
  `Point2` INT(11) NOT NULL DEFAULT '0',
  `Point3` INT(11) NOT NULL DEFAULT '0',
  `IDMonitor` INT(11) NOT NULL,
  `IDGV` INT(11) NOT NULL,
  `student_verify` TINYINT NULL DEFAULT NULL,
  `monitor_verify` TINYINT(4) NULL DEFAULT NULL,
  `teacher_verify` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  CONSTRAINT `FormUser`
    FOREIGN KEY (`User_ID`)
    REFERENCES `soa2`.`users` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `soa2`.`msg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `soa2`.`msg` (
  `IDMsg` INT(11) NOT NULL AUTO_INCREMENT,
  `IDSender` INT(11) NOT NULL,
  `Content` TEXT NOT NULL,
  `createdTime` DATETIME NOT NULL,
  `IDForm` INT(11) NOT NULL,
  `IDTarget` INT(11) NOT NULL,
  PRIMARY KEY (`IDMsg`, `IDForm`, `IDTarget`),
  INDEX `messageForm_idx` (`IDForm` ASC),
  CONSTRAINT `messageForm`
    FOREIGN KEY (`IDForm`)
    REFERENCES `soa2`.`form` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO `soa2`.`users` (`ID`, `Username`, `Password`, `Role`, `Name`) VALUES ('1', '15020881', '12345678', 'Student', 'Trieu Hoang An');
INSERT INTO `soa2`.`users` (`ID`, `Username`, `Password`, `Role`, `Name`) VALUES ('2', '15021234', '12345678', 'Student', 'Nguyen Hoang Long');
INSERT INTO `soa2`.`users` (`ID`, `Username`, `Password`, `Role`, `Name`) VALUES ('3', '12345678', '12345678', 'Student', 'Nguyen Trung Duc');
INSERT INTO `soa2`.`users` (`ID`, `Username`, `Password`, `Role`, `Name`) VALUES ('4', '15020000', '12345678', 'Monitor', 'Monitor');
INSERT INTO `soa2`.`users` (`ID`, `Username`, `Password`, `Role`, `Name`) VALUES ('5', 'Teacher', '12345678', 'Teacher', 'Teacher');

INSERT INTO `soa2`.`form` (`User_ID`, `Point1`, `Point2`, `Point3`, `student_verify`, `IDMonitor`, `IDGV`, `monitor_verify`, `teacher_verify`) VALUES ('1', '10', '12', '12', '0', '4', '5', '0', '0');
INSERT INTO `soa2`.`form` (`User_ID`, `Point1`, `Point2`, `Point3`, `student_verify`, `IDMonitor`, `IDGV`, `monitor_verify`, `teacher_verify`) VALUES ('2', '1', '42', '24', '0', '4', '5', '0', '0');
INSERT INTO `soa2`.`form` (`User_ID`, `Point1`, `Point2`, `Point3`, `student_verify`, `IDMonitor`, `IDGV`, `monitor_verify`, `teacher_verify`) VALUES ('3', '5', '14', '21', '1', '4', '5', '0', '0');

