SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema trabalhobd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trabalhobd` DEFAULT CHARACTER SET utf8 ;
USE `trabalhobd` ;

-- -----------------------------------------------------
-- Table `trabalhobd`.`fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`fabricante` (
  `idfabricante` INT NOT NULL AUTO_INCREMENT,
  `nomefab` VARCHAR(30) NOT NULL,
  `ano_fundacao` INT NOT NULL,
  PRIMARY KEY (`idfabricante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`plataforma` (
  `idplataforma` INT NOT NULL AUTO_INCREMENT,
  `nomeplat` VARCHAR(30) NOT NULL,
  `ano_lancamento` INT NOT NULL,
  `memoria` BIGINT NOT NULL,
  `idfabricante` INT NOT NULL,
  PRIMARY KEY (`idplataforma`),
  INDEX `fk_plataforma_fabricante1_idx` (`idfabricante` ASC),
  CONSTRAINT `fk_plataforma_fabricante1`
    FOREIGN KEY (`idfabricante`)
    REFERENCES `trabalhobd`.`fabricante` (`idfabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`midia` (
  `idmidia` INT NOT NULL AUTO_INCREMENT,
  `nomemid` VARCHAR(30) NOT NULL,
  `velocidade_leitura` INT NOT NULL,
  PRIMARY KEY (`idmidia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`compativel_midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`compativel_midia` (
  `idplataforma` INT NOT NULL,
  `idmidia` INT NOT NULL,
  PRIMARY KEY (`idplataforma`, `idmidia`),
  INDEX `fk_compativel_midia_midia1_idx` (`idmidia` ASC),
  CONSTRAINT `fk_Compativel_midia_Plataforma`
    FOREIGN KEY (`idplataforma`)
    REFERENCES `trabalhobd`.`plataforma` (`idplataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compativel_midia_midia1`
    FOREIGN KEY (`idmidia`)
    REFERENCES `trabalhobd`.`midia` (`idmidia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`jogo` (
  `idjogo` INT NOT NULL AUTO_INCREMENT,
  `nomejogo` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idjogo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trabalhobd`.`compativel_jogo_plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trabalhobd`.`compativel_jogo_plataforma` (
  `idplataforma` INT NOT NULL,
  `idjogo` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `ano_lancamento_jogo` INT NOT NULL,
  PRIMARY KEY (`idplataforma`, `idjogo`),
  INDEX `fk_compativel_jogo_plataforma_jogo1_idx` (`idjogo` ASC),
  INDEX `fk_compativel_jogo_plataforma_plataforma1_idx` (`idplataforma` ASC),
  CONSTRAINT `fk_compativel_jogo_plataforma_jogo1`
    FOREIGN KEY (`idjogo`)
    REFERENCES `trabalhobd`.`jogo` (`idjogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compativel_jogo_plataforma_plataforma1`
    FOREIGN KEY (`idplataforma`)
    REFERENCES `trabalhobd`.`plataforma` (`idplataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
