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
  `ID` INT NOT NULL,
  `TipNom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ambiente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Ambiente` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Ambiente` (
  `AmbCod` INT NOT NULL AUTO_INCREMENT,
  `AmbNom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AmbCod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Electrodomesticos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Electrodomesticos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Electrodomesticos` (
  `ID` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `potenciaConsumo` DOUBLE NULL,
  `tipCod` INT NULL,
  `ambCod` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Tipo_idx` (`tipCod` ASC),
  INDEX `ambiente_idx` (`ambCod` ASC),
  CONSTRAINT `Tipo`
    FOREIGN KEY (`tipCod`)
    REFERENCES `mydb`.`Tipo` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
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

CREATE TABLE IF NOT EXISTS `mydb`.`Bateria` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `capacidad` DOUBLE NOT NULL,
  `costo_compra` DOUBLE NOT NULL,
  `tiempo_vida` DOUBLE NOT NULL,
  `costo_mantenimiento` DOUBLE NOT NULL,
  `BateriaAlto` DOUBLE NOT NULL,
  `BateriaAncho` DOUBLE NOT NULL,
  `BateriaLargo` DOUBLE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PanelSolar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`PanelSolar` ;

CREATE TABLE IF NOT EXISTS `mydb`.`PanelSolar` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `potencia` DOUBLE NOT NULL,
  `costo_compra` DOUBLE NOT NULL,
  `tiempo_vida` DOUBLE NOT NULL,
  `costo_mantenimiento` DOUBLE NOT NULL,
  `PanelAncho` DOUBLE NOT NULL,
  `PanelAlto` DOUBLE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Inversor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Inversor` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Inversor` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `potencia` DOUBLE NOT NULL,
  `costo_compra` DOUBLE NOT NULL,
  `tiempo_vida` DOUBLE NOT NULL,
  `costo_mantenimiento` DOUBLE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RecomendacionPV`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`RecomendacionPV` ;

CREATE TABLE IF NOT EXISTS `mydb`.`RecomendacionPV` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `modelo_panel` INT NULL,
  `modelo_bateria` INT NULL,
  `modelo_inversor` INT ZEROFILL NULL,
  `cantidad_paneles` INT NULL,
  `cantidad_baterias` INT NULL,
  `cantidad_inversor` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `BatCod_idx` (`modelo_bateria` ASC),
  INDEX `InvCod_idx` (`cantidad_inversor` ASC),
  INDEX `PanCod_idx` (`cantidad_paneles` ASC),
  CONSTRAINT `BatCod`
    FOREIGN KEY (`modelo_bateria`)
    REFERENCES `mydb`.`Bateria` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PanCod`
    FOREIGN KEY (`cantidad_paneles`)
    REFERENCES `mydb`.`PanelSolar` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `InvCod`
    FOREIGN KEY (`cantidad_inversor`)
    REFERENCES `mydb`.`Inversor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recibo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Recibo` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Recibo` (
  `ID` INT NOT NULL,
  `consumoMensual` DOUBLE NOT NULL,
  `costoTotal` DOUBLE NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Radiacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Radiacion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Radiacion` (
  `ID` INT NOT NULL,
  `Potencia_Kw_:metro` DOUBLE NOT NULL,
  `RadEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Temperatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Temperatura` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Temperatura` (
  `ID` INT NOT NULL,
  `Tem_C` DOUBLE NOT NULL,
  `TemEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Region` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Region` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `RegNom` VARCHAR(45) NOT NULL,
  `RegEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Radiacion_Mes_Temperatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Radiacion_Mes_Temperatura` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Radiacion_Mes_Temperatura` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `RadCod` INT NOT NULL,
  `TemCod` INT NOT NULL,
  `RegCod` INT NOT NULL,
  `Mes` VARCHAR(10) NOT NULL,
  `RadMesTemEstReg` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `TemMes_idx` (`TemCod` ASC),
  INDEX `RadMes_idx` (`RadCod` ASC),
  INDEX `RegCod_idx` (`RegCod` ASC),
  CONSTRAINT `RadMes`
    FOREIGN KEY (`RadCod`)
    REFERENCES `mydb`.`Radiacion` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TemMes`
    FOREIGN KEY (`TemCod`)
    REFERENCES `mydb`.`Temperatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RegCod`
    FOREIGN KEY (`RegCod`)
    REFERENCES `mydb`.`Region` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Electrodomesticos_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Electrodomesticos_usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Electrodomesticos_usuario` (
  `ID_Ele` INT NOT NULL,
  `frecuenciaDia` INT NULL,
  `frecuenciaSemana` INT NULL,
  `frecuenciaNoche` INT NULL,
  `Potencia_Usuario` DOUBLE NULL,
  INDEX `Electrodomesticos_idx` (`ID_Ele` ASC),
  CONSTRAINT `Electrodomesticos`
    FOREIGN KEY (`ID_Ele`)
    REFERENCES `mydb`.`Electrodomesticos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Costo_Kw_historial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Costo_Kw_historial` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Costo_Kw_historial` (
  `ID` INT NOT NULL,
  `Costo_Kw` DOUBLE NOT NULL,
  `Costo_Kw_M` INT NOT NULL,
  `Costo_Kw_A` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
