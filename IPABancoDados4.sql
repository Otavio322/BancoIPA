-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bancodadosipa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bancodadosipa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bancodadosipa` DEFAULT CHARACTER SET utf8mb3 ;
USE `bancodadosipa` ;

-- -----------------------------------------------------
-- Table `bancodadosipa`.`ipa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`ipa` (
  `CNPJIPA` VARCHAR(18) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CNPJIPA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`cooperativa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`cooperativa` (
  `CNPJ` VARCHAR(18) NOT NULL,
  `Nome` VARCHAR(60) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Saida` DATE NOT NULL,
  `Entrada` DATE NOT NULL,
  `TipoGraos` VARCHAR(45) NOT NULL,
  `QntdGraos` INT NOT NULL,
  `ipa_CNPJIPA` VARCHAR(18) NOT NULL,
  `Email` VARCHAR(60) NOT NULL,
  `Telefone` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`CNPJ`),
  INDEX `fk_cooperativa_ipa1_idx` (`ipa_CNPJIPA` ASC) VISIBLE,
  CONSTRAINT `fk_cooperativa_ipa1`
    FOREIGN KEY (`ipa_CNPJIPA`)
    REFERENCES `bancodadosipa`.`ipa` (`CNPJIPA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`agricultores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`agricultores` (
  `CPF_CNPJ` VARCHAR(18) NOT NULL,
  `Nome` VARCHAR(60) NOT NULL,
  `Idade` INT NOT NULL,
  `TipoEntidade` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(16) NOT NULL,
  `Email` VARCHAR(60) NOT NULL,
  `DataCadastro` DATE NOT NULL,
  `Status` VARCHAR(20) NOT NULL,
  `Cooperativa_CNPJ` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`CPF_CNPJ`),
  INDEX `fk_Agricultores_Cooperativa` (`Cooperativa_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_Agricultores_Cooperativa`
    FOREIGN KEY (`Cooperativa_CNPJ`)
    REFERENCES `bancodadosipa`.`cooperativa` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`producaosementes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`producaosementes` (
  `idProducaoSementes` INT NOT NULL AUTO_INCREMENT,
  `TipoSemente` VARCHAR(50) NOT NULL,
  `QuantidadeSementes` INT NOT NULL,
  `Preco` DECIMAL(10,2) NOT NULL,
  `Validade` DATE NOT NULL,
  PRIMARY KEY (`idProducaoSementes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`agricultores_has_producaosementes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`agricultores_has_producaosementes` (
  `Agricultores_CPF_CNPJ` VARCHAR(18) NOT NULL,
  `ProducaoSementes_idProducaoSementes` INT NOT NULL,
  PRIMARY KEY (`Agricultores_CPF_CNPJ`, `ProducaoSementes_idProducaoSementes`),
  INDEX `fk_Agricultores_has_ProducaoSementes_ProducaoSementes` (`ProducaoSementes_idProducaoSementes` ASC) VISIBLE,
  CONSTRAINT `fk_Agricultores_has_ProducaoSementes_Agricultores`
    FOREIGN KEY (`Agricultores_CPF_CNPJ`)
    REFERENCES `bancodadosipa`.`agricultores` (`CPF_CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Agricultores_has_ProducaoSementes_ProducaoSementes`
    FOREIGN KEY (`ProducaoSementes_idProducaoSementes`)
    REFERENCES `bancodadosipa`.`producaosementes` (`idProducaoSementes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`transportadora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`transportadora` (
  `idTransportadora` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(60) NOT NULL,
  `CNPJ` VARCHAR(18) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idTransportadora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`transportesementes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`transportesementes` (
  `idTransporte` INT NOT NULL AUTO_INCREMENT,
  `Transportadora_idTransportadora` INT NOT NULL,
  `Origem` VARCHAR(100) NOT NULL,
  `DataEnvio` DATE NOT NULL,
  `DataEntrega` DATE NOT NULL,
  `Status` VARCHAR(20) NOT NULL DEFAULT 'Em transporte',
  PRIMARY KEY (`idTransporte`),
  INDEX `fk_TransporteSementes_Transportadora` (`Transportadora_idTransportadora` ASC) VISIBLE,
  CONSTRAINT `fk_TransporteSementes_Transportadora`
    FOREIGN KEY (`Transportadora_idTransportadora`)
    REFERENCES `bancodadosipa`.`transportadora` (`idTransportadora`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`agricultores_has_transportes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`agricultores_has_transportes` (
  `Agricultores_CPF_CNPJ` VARCHAR(18) NOT NULL,
  `Transporte_idTransporte` INT NOT NULL,
  PRIMARY KEY (`Agricultores_CPF_CNPJ`, `Transporte_idTransporte`),
  INDEX `fk_Agricultores_has_Transportes_Transporte` (`Transporte_idTransporte` ASC) VISIBLE,
  CONSTRAINT `fk_Agricultores_has_Transportes_Agricultores`
    FOREIGN KEY (`Agricultores_CPF_CNPJ`)
    REFERENCES `bancodadosipa`.`agricultores` (`CPF_CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Agricultores_has_Transportes_Transporte`
    FOREIGN KEY (`Transporte_idTransporte`)
    REFERENCES `bancodadosipa`.`transportesementes` (`idTransporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`cooperativa_has_transportes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`cooperativa_has_transportes` (
  `Cooperativa_CNPJ` VARCHAR(18) NOT NULL,
  `Transporte_idTransporte` INT NOT NULL,
  PRIMARY KEY (`Cooperativa_CNPJ`, `Transporte_idTransporte`),
  INDEX `fk_Cooperativa_has_Transportes_Transporte` (`Transporte_idTransporte` ASC) VISIBLE,
  CONSTRAINT `fk_Cooperativa_has_Transportes_Cooperativa`
    FOREIGN KEY (`Cooperativa_CNPJ`)
    REFERENCES `bancodadosipa`.`cooperativa` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Cooperativa_has_Transportes_Transporte`
    FOREIGN KEY (`Transporte_idTransporte`)
    REFERENCES `bancodadosipa`.`transportesementes` (`idTransporte`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`endereco` (
  `CEP` VARCHAR(9) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(60) NOT NULL,
  `Numero` INT NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Complemento` VARCHAR(45) NULL DEFAULT NULL,
  `ipa_CNPJIPA` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`ipa_CNPJIPA`),
  CONSTRAINT `fk_endereco_ipa1`
    FOREIGN KEY (`ipa_CNPJIPA`)
    REFERENCES `bancodadosipa`.`ipa` (`CNPJIPA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`enderecoagricultores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`enderecoagricultores` (
  `CEP` VARCHAR(9) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(60) NOT NULL,
  `Numero` INT NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Complemento` VARCHAR(45) NULL DEFAULT NULL,
  `Agricultores_CPF_CNPJ` VARCHAR(18) NOT NULL,
  INDEX `fk_EnderecoAgricultores_Agricultores` (`Agricultores_CPF_CNPJ` ASC) VISIBLE,
  PRIMARY KEY (`Agricultores_CPF_CNPJ`),
  CONSTRAINT `fk_EnderecoAgricultores_Agricultores`
    FOREIGN KEY (`Agricultores_CPF_CNPJ`)
    REFERENCES `bancodadosipa`.`agricultores` (`CPF_CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`enderecocooperativas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`enderecocooperativas` (
  `CEP` VARCHAR(9) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(60) NOT NULL,
  `Numero` INT NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Complemento` VARCHAR(45) NULL DEFAULT NULL,
  `Cooperativa_CNPJ` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`Cooperativa_CNPJ`),
  INDEX `fk_EnderecoCooperativas_Cooperativa` (`Cooperativa_CNPJ` ASC) VISIBLE,
  CONSTRAINT `fk_EnderecoCooperativas_Cooperativa`
    FOREIGN KEY (`Cooperativa_CNPJ`)
    REFERENCES `bancodadosipa`.`cooperativa` (`CNPJ`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `bancodadosipa`.`entradasementes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bancodadosipa`.`entradasementes` (
  `idEntradaSementes` INT NOT NULL AUTO_INCREMENT,
  `TipoSemente` VARCHAR(50) NOT NULL,
  `QuantidadeSementes` INT NOT NULL,
  `DataChegada` DATE NOT NULL,
  `ipa_CNPJIPA` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`idEntradaSementes`),
  INDEX `fk_entradasementes_ipa1_idx` (`ipa_CNPJIPA` ASC) VISIBLE,
  CONSTRAINT `fk_entradasementes_ipa1`
    FOREIGN KEY (`ipa_CNPJIPA`)
    REFERENCES `bancodadosipa`.`ipa` (`CNPJIPA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
