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
-- Table `mydb`.`Tipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Tipo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Tipo` (
  `TipCod` INT NOT NULL AUTO_INCREMENT,
  `TipNom` VARCHAR(45) NOT NULL,
  `TipEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`TipCod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ambiente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ambiente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ambiente` (
  `AmbCod` INT NOT NULL AUTO_INCREMENT,
  `AmbNom` VARCHAR(45) NOT NULL,
  `AmbEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`AmbCod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Electrodomesticos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Electrodomesticos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Electrodomesticos` (
  `EleCod` INT NOT NULL AUTO_INCREMENT,
  `EleNom` VARCHAR(45) NOT NULL,
  `ElePotCon` DOUBLE NOT NULL,
  `ambCod` INT NOT NULL,
  `EleEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`EleCod`),
  INDEX `ambiente_idx` (`ambCod` ASC),
  CONSTRAINT `ambiente`
    FOREIGN KEY (`ambCod`)
    REFERENCES `mydb`.`Ambiente` (`AmbCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bateria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Bateria` ;

CREATE TABLE IF NOT EXISTS Bateria (
  BatCod INT NOT NULL AUTO_INCREMENT,
  BatMod VARCHAR(45) NOT NULL,
  BatCap DOUBLE NOT NULL,
  BatCosMon DOUBLE NOT NULL,
  BatTieVid DOUBLE NOT NULL,
  BatCosMan DOUBLE NOT NULL,
  BatAlt DOUBLE NOT NULL,
  BatAnc DOUBLE NOT NULL,
  BatLag DOUBLE NOT NULL,
  BatTip VARCHAR(20) NOT NULL,
  BatVol DOUBLE NOT NULL,
  BatEstReg VARCHAR(1) NOT NULL,
  PRIMARY KEY (BatCod)
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`PanelSolar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PanelSolar` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PanelSolar` (
  `PanCod` INT NOT NULL AUTO_INCREMENT,
  `PanMod` VARCHAR(45) NOT NULL,
  `PanPot` DOUBLE NOT NULL,
  `PanCosMon` DOUBLE NOT NULL,
  `PanTieVid` DOUBLE NOT NULL,
  `PanCosMan` DOUBLE NOT NULL,
  `PanAnc` DOUBLE NOT NULL,
  `PanAlt` DOUBLE NOT NULL,
  `PanEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`PanCod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inversor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Inversor` ;

CREATE TABLE IF NOT EXISTS `Inversor` (
  `InvCod` INT NOT NULL AUTO_INCREMENT,
  `InvMod` VARCHAR(45) NOT NULL,
  `InvPot` DOUBLE NOT NULL,
  `InvCosMon` DOUBLE NOT NULL,
  `InvTieVid` DOUBLE NOT NULL,
  `InvCosMan` DOUBLE NOT NULL,
  `InvAdmVol` DOUBLE NOT NULL,
  `InvEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`InvCod`)
) ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `mydb`.`RecomendacionPV`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`RecomendacionPV` ;

CREATE TABLE IF NOT EXISTS `mydb`.`RecomendacionPV` (
  `RecPVCod` INT NOT NULL AUTO_INCREMENT,
  `PanCod` INT NOT NULL,
  `BatCod` INT NOT NULL,
  `InvCod` INT NOT NULL,
  `PanCan` INT NOT NULL,
  `BatCan` INT NOT NULL,
  `RecPVEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`RecPVCod`),
  INDEX `BatCod_idx` (`BatCod` ASC),
  INDEX `InvCod_idx` (`InvCod` ASC),
  INDEX `PanCod_idx` (`PanCod` ASC),
  CONSTRAINT `BatCod`
    FOREIGN KEY (`BatCod`)
    REFERENCES `mydb`.`Bateria` (`BatCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PanCod`
    FOREIGN KEY (`PanCod`)
    REFERENCES `mydb`.`PanelSolar` (`PanCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `InvCod`
    FOREIGN KEY (`InvCod`)
    REFERENCES `mydb`.`Inversor` (`InvCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recibo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Recibo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Recibo` (
  `RecCod` INT NOT NULL AUTO_INCREMENT,
  `RecConMen` DOUBLE NOT NULL,
  `RecCosTot` DOUBLE NOT NULL,
  `RecA` INT NOT NULL,
  `RecM` INT NOT NULL,
  `RecEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`RecCod`))
ENGINE = InnoDB
ROW_FORMAT = DEFAULT;


-- -----------------------------------------------------
-- Table `mydb`.`Region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Region` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Region` (
  `RegCod` INT NOT NULL AUTO_INCREMENT,
  `RegNom` VARCHAR(45) NOT NULL,
  `RegEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`RegCod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Radiacion_Mes_Temperatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Radiacion_Mes_Temperatura` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Radiacion_Mes_Temperatura` (
  `RadMesTemCod` INT NOT NULL AUTO_INCREMENT,
  `RadCod` DOUBLE NOT NULL,
  `TemCod` DOUBLE NOT NULL,
  `RegCod` INT NOT NULL,
  `RadMes` VARCHAR(10) NOT NULL,
  `RadMesTemEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`RadMesTemCod`),
  INDEX `RegCod_idx` (`RegCod` ASC),
  CONSTRAINT `RegCod`
    FOREIGN KEY (`RegCod`)
    REFERENCES `mydb`.`Region` (`RegCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Electrodomesticos_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Electrodomesticos_usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Electrodomesticos_usuario` (
  `EleUsuCod` INT NOT NULL AUTO_INCREMENT,
  `EleUsuFreDia` INT NOT NULL,
  `EleUsuFreSem` INT NOT NULL,
  `EleUsuFreNoc` INT NOT NULL,
  `EleUsuPot` DOUBLE NOT NULL,
  `TipCod` INT NOT NULL,
  `EleUsuEleCod` INT NOT NULL,
  `EleUsuEstReg` VARCHAR(1) NOT NULL,
  INDEX `Tipo_idx` (`TipCod` ASC),
  INDEX `Electrodomesticos_idx` (`EleUsuEleCod` ASC),
  PRIMARY KEY (`EleUsuCod`),
  CONSTRAINT `Electrodomesticos`
    FOREIGN KEY (`EleUsuEleCod`)
    REFERENCES `mydb`.`Electrodomesticos` (`EleCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Tipo`
    FOREIGN KEY (`TipCod`)
    REFERENCES `mydb`.`Tipo` (`TipCod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Costo_Kw_historial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Costo_Kw_historial` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Costo_Kw_historial` (
  `CosKHisCod` INT NOT NULL AUTO_INCREMENT,
  `CosKHisMon` DOUBLE NOT NULL,
  `CosKHisM` INT NOT NULL,
  `CosKHisA` INT NOT NULL,
  `CosKHisEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`CosKHisCod`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
