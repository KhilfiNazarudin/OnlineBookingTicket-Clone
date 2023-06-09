-- MySQL Script generated by MySQL Workbench
-- Mon Aug  1 20:19:19 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`rewards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rewards` (
  `rewardId` VARCHAR(5) NOT NULL,
  `rewardType` ENUM('BOT MILES', 'CASHBACK') NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`rewardId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `userId` VARCHAR(5) NOT NULL,
  `fullName` VARCHAR(100) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `countryCode` VARCHAR(3) NOT NULL,
  `dateOfBirth` DATE NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `hpNumber` INT NOT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_rewards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_rewards` (
  `userId` VARCHAR(5) NOT NULL,
  `rewardId` VARCHAR(5) NOT NULL,
  `value` INT NOT NULL,
  PRIMARY KEY (`userId`, `rewardId`),
  INDEX `rewardId_idx` (`rewardId` ASC) VISIBLE,
  CONSTRAINT `rewardId`
    FOREIGN KEY (`rewardId`)
    REFERENCES `mydb`.`rewards` (`rewardId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tickets` (
  `ticketId` VARCHAR(5) NOT NULL,
  `seating` CHAR(3) NOT NULL,
  PRIMARY KEY (`ticketId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`operator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`operator` (
  `operatorId` VARCHAR(5) NOT NULL,
  `operatorName` VARCHAR(45) NOT NULL,
  `operatorDesc` VARCHAR(45) NOT NULL,
  `reschedulable` TINYINT NOT NULL,
  `refundable` TINYINT NOT NULL,
  PRIMARY KEY (`operatorId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehicle` (
  `vehicleId` VARCHAR(5) NOT NULL,
  `operatorId` VARCHAR(5) NOT NULL,
  `vehicleNo` CHAR(8) NOT NULL,
  `vehicleType` ENUM('ferry', 'bus', 'train') NOT NULL,
  PRIMARY KEY (`vehicleId`),
  INDEX `operatorId_idx` (`operatorId` ASC) VISIBLE,
  CONSTRAINT `operatorId`
    FOREIGN KEY (`operatorId`)
    REFERENCES `mydb`.`operator` (`operatorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`services` (
  `serviceId` VARCHAR(5) NOT NULL,
  `ticketId` VARCHAR(5) NOT NULL,
  `vehicleId` VARCHAR(45) NOT NULL,
  `operatorId` VARCHAR(5) NOT NULL,
  `prices` DECIMAL(3,2) NOT NULL,
  `departingTime` TIME NOT NULL,
  `departingDate` DATE NOT NULL,
  `destination` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`serviceId`, `ticketId`),
  INDEX `ticcketId_idx` (`ticketId` ASC) VISIBLE,
  INDEX `operatorId_idx` (`operatorId` ASC) VISIBLE,
  INDEX `vehicleId_idx` (`vehicleId` ASC) VISIBLE,
  CONSTRAINT `ticcketId`
    FOREIGN KEY (`ticketId`)
    REFERENCES `mydb`.`tickets` (`ticketId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `operatorId`
    FOREIGN KEY (`operatorId`)
    REFERENCES `mydb`.`operator` (`operatorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `vehicleId`
    FOREIGN KEY (`vehicleId`)
    REFERENCES `mydb`.`vehicle` (`vehicleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`bookings` (
  `userId` VARCHAR(5) NOT NULL,
  `serviceId` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`userId`, `serviceId`),
  INDEX `userid_idx` (`userId` ASC) VISIBLE,
  INDEX `serviceId_idx` (`serviceId` ASC) VISIBLE,
  CONSTRAINT `userid`
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `serviceId`
    FOREIGN KEY (`serviceId`)
    REFERENCES `mydb`.`services` (`serviceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`review` (
  `userId` VARCHAR(5) NOT NULL,
  `operatorId` VARCHAR(5) NOT NULL,
  `rating` DECIMAL(1,1) NOT NULL,
  `review` VARCHAR(254) NOT NULL,
  PRIMARY KEY (`userId`, `operatorId`),
  INDEX `operatorId_idx` (`operatorId` ASC) VISIBLE,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`user` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `operatorId`
    FOREIGN KEY (`operatorId`)
    REFERENCES `mydb`.`operator` (`operatorId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
