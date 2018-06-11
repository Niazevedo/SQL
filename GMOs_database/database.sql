-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema GMOs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GMOs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GMOs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema northwind
-- -----------------------------------------------------
USE `GMOs` ;

-- -----------------------------------------------------
-- Table `GMOs`.`Espécie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Espécie` (
  `Espécie_ID` INT NOT NULL COMMENT '',
  `Nome Científico` VARCHAR(45) NOT NULL COMMENT '',
  `Nome Comum` VARCHAR(45) NULL COMMENT '',
  `Reino` VARCHAR(45) NOT NULL COMMENT '',
  `Filo` VARCHAR(45) NOT NULL COMMENT '',
  `Classe` VARCHAR(45) NOT NULL COMMENT '',
  `Ordem` VARCHAR(45) NOT NULL COMMENT '',
  `Família` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`Espécie_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Espécie Modificada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Espécie Modificada` (
  `Espécie Modificada_ID` INT NOT NULL COMMENT '',
  `Nome Variante` VARCHAR(45) NOT NULL COMMENT '',
  `Espécie_Espécie_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Espécie Modificada_ID`, `Espécie_Espécie_ID`)  COMMENT '',
  INDEX `fk_Espécie Modificada_Espécie1_idx` (`Espécie_Espécie_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Espécie Modificada_Espécie1`
    FOREIGN KEY (`Espécie_Espécie_ID`)
    REFERENCES `GMOs`.`Espécie` (`Espécie_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`País`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`País` (
  `País_ID` INT NOT NULL COMMENT '',
  `País_Nome` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`País_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Aprovação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Aprovação` (
  `Instituição` VARCHAR(150) NULL COMMENT '',
  `Lei de Comércio` MEDIUMTEXT NULL COMMENT '',
  `País_País_ID` INT NOT NULL COMMENT '',
  `Espécie Modificada_Espécie Modificada_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`País_País_ID`, `Espécie Modificada_Espécie Modificada_ID`)  COMMENT '',
  INDEX `fk_Aprovação_Espécie Modificada2_idx` (`Espécie Modificada_Espécie Modificada_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Aprovação_País1`
    FOREIGN KEY (`País_País_ID`)
    REFERENCES `GMOs`.`País` (`País_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aprovação_Espécie Modificada2`
    FOREIGN KEY (`Espécie Modificada_Espécie Modificada_ID`)
    REFERENCES `GMOs`.`Espécie Modificada` (`Espécie Modificada_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Sequencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Sequencia` (
  `Sequencia_ID` INT NOT NULL COMMENT '',
  `Sequência` LONGTEXT NOT NULL COMMENT '',
  `Tipo de Sequência` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`Sequencia_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Transgene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Transgene` (
  `Transgene_ID` VARCHAR(15) NOT NULL COMMENT '',
  `Abreviatura + Nome` VARCHAR(100) NOT NULL COMMENT '',
  `Espécie Origem` VARCHAR(45) NOT NULL COMMENT '',
  `Função` MEDIUMTEXT NOT NULL COMMENT '',
  `Efeito Pretendido` VARCHAR(200) NOT NULL COMMENT '',
  `Sequencia_Sequencia_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Transgene_ID`, `Sequencia_Sequencia_ID`)  COMMENT '',
  INDEX `fk_Transgene_Sequencia1_idx` (`Sequencia_Sequencia_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Transgene_Sequencia1`
    FOREIGN KEY (`Sequencia_Sequencia_ID`)
    REFERENCES `GMOs`.`Sequencia` (`Sequencia_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Promotor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Promotor` (
  `Promotor_ID` INT NOT NULL COMMENT '',
  `Nome_Promotor` VARCHAR(45) NOT NULL COMMENT '',
  `Espécie Origem` VARCHAR(45) NOT NULL COMMENT '',
  `Método de Selecção` MEDIUMTEXT NULL COMMENT '',
  PRIMARY KEY (`Promotor_ID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Não Aprovação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Não Aprovação` (
  `Razões` MEDIUMTEXT NULL COMMENT '',
  `Instituição` VARCHAR(100) NULL COMMENT '',
  `País_País_ID` INT NOT NULL COMMENT '',
  `Espécie Modificada_Espécie Modificada_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`País_País_ID`, `Espécie Modificada_Espécie Modificada_ID`)  COMMENT '',
  INDEX `fk_Não Aprovação_Espécie Modificada2_idx` (`Espécie Modificada_Espécie Modificada_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Não Aprovação_País1`
    FOREIGN KEY (`País_País_ID`)
    REFERENCES `GMOs`.`País` (`País_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Não Aprovação_Espécie Modificada2`
    FOREIGN KEY (`Espécie Modificada_Espécie Modificada_ID`)
    REFERENCES `GMOs`.`Espécie Modificada` (`Espécie Modificada_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Espécie Modificada_has_Transgene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Espécie Modificada_has_Transgene` (
  `Espécie Modificada_Espécie Modificada_ID` INT NOT NULL COMMENT '',
  `Transgene_Transgene_ID` VARCHAR(15) NOT NULL COMMENT '',
  PRIMARY KEY (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`)  COMMENT '',
  INDEX `fk_Espécie Modificada_has_Transgene_Espécie Modificada1_idx` (`Espécie Modificada_Espécie Modificada_ID` ASC)  COMMENT '',
  INDEX `fk_Espécie Modificada_has_Transgene_Transgene1_idx` (`Transgene_Transgene_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Espécie Modificada_has_Transgene_Espécie Modificada1`
    FOREIGN KEY (`Espécie Modificada_Espécie Modificada_ID`)
    REFERENCES `GMOs`.`Espécie Modificada` (`Espécie Modificada_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Espécie Modificada_has_Transgene_Transgene1`
    FOREIGN KEY (`Transgene_Transgene_ID`)
    REFERENCES `GMOs`.`Transgene` (`Transgene_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Transgene_has_Promotor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Transgene_has_Promotor` (
  `Transgene_Transgene_ID` VARCHAR(15) NOT NULL COMMENT '',
  `Promotor_Promotor_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`)  COMMENT '',
  INDEX `fk_Transgene_has_Promotor_Promotor1_idx` (`Promotor_Promotor_ID` ASC)  COMMENT '',
  INDEX `fk_Transgene_has_Promotor_Transgene1_idx` (`Transgene_Transgene_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Transgene_has_Promotor_Transgene1`
    FOREIGN KEY (`Transgene_Transgene_ID`)
    REFERENCES `GMOs`.`Transgene` (`Transgene_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transgene_has_Promotor_Promotor1`
    FOREIGN KEY (`Promotor_Promotor_ID`)
    REFERENCES `GMOs`.`Promotor` (`Promotor_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GMOs`.`Artigos Publicados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GMOs`.`Artigos Publicados` (
  `Artigos_ID` INT NOT NULL COMMENT '',
  `Artigo` LONGTEXT NOT NULL COMMENT '',
  `Espécie Modificada_Espécie Modificada_ID` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Artigos_ID`, `Espécie Modificada_Espécie Modificada_ID`)  COMMENT '',
  INDEX `fk_Artigos Publicados_Espécie Modificada1_idx` (`Espécie Modificada_Espécie Modificada_ID` ASC)  COMMENT '',
  CONSTRAINT `fk_Artigos Publicados_Espécie Modificada1`
    FOREIGN KEY (`Espécie Modificada_Espécie Modificada_ID`)
    REFERENCES `GMOs`.`Espécie Modificada` (`Espécie Modificada_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE gmos;

#Espécie
INSERT INTO `GMOs`.`Espécie` (`Espécie_ID`, `Nome Científico`, `Nome Comum`, `Reino`, `Filo`, `Classe`, `Ordem`, `Família`) VALUES (001548, 'Oryza sativa', 'Rice', 'Plantae', 'Magnoliophyta', 'Liliopsida', 'Poales', 'Poaceae');
INSERT INTO `GMOs`.`Espécie` (`Espécie_ID`, `Nome Científico`, `Nome Comum`, `Reino`, `Filo`, `Classe`, `Ordem`, `Família`) VALUES (001238, 'Salmo Salar', 'Salmon', 'Animalia', 'Chordata', 'Actinopterygii', 'Salmoniformes', 'Salmonidae');
INSERT INTO `GMOs`.`Espécie` (`Espécie_ID`, `Nome Científico`, `Nome Comum`, `Reino`, `Filo`, `Classe`, `Ordem`, `Família`) VALUES (017953, 'Gossypium hirsutum L', 'Cotton', 'Plantae', 'Angioesperms', 'Eudicots', 'Malvales', 'Malvaceae');

SELECT * FROM espécie;

#Espécie Modificada
INSERT INTO `GMOs`.`Espécie Modificada` (`Espécie Modificada_ID`, `Nome Variante`, `Espécie_Espécie_ID`) VALUES (0001, 'GR1', 001548);
INSERT INTO `GMOs`.`Espécie Modificada` (`Espécie Modificada_ID`, `Nome Variante`, `Espécie_Espécie_ID`) VALUES (0002, 'GR2', 001548);
INSERT INTO `GMOs`.`Espécie Modificada` (`Espécie Modificada_ID`, `Nome Variante`, `Espécie_Espécie_ID`) VALUES (0003, 'AquAdvantage', 001238);
INSERT INTO `GMOs`.`Espécie Modificada` (`Espécie Modificada_ID`, `Nome Variante`, `Espécie_Espécie_ID`) VALUES (0004, 'Bollgard II® with Roundup Ready® Flex', 017953);

SELECT * FROM `espécie modificada`;

#País
INSERT INTO `GMOs`.`País` (`País_ID`, `País_Nome`) VALUES (0000, 'Worldwide');
INSERT INTO `GMOs`.`País` (`País_ID`, `País_Nome`) VALUES (0015, 'USA');
INSERT INTO `GMOs`.`País` (`País_ID`, `País_Nome`) VALUES (0024, 'EU');
INSERT INTO `GMOs`.`País` (`País_ID`, `País_Nome`) VALUES (0145, 'Philippines');

SELECT * FROM país;

#Aprovação
INSERT INTO `GMOs`.`Aprovação` (`Instituição`, `Lei de Comércio`, `País_País_ID`, `Espécie Modificada_Espécie Modificada_ID`) VALUES ('Philippine Bureau of Plant Industry', NULL, 0145, 0002);
INSERT INTO `GMOs`.`Aprovação` (`Instituição`, `Lei de Comércio`, `País_País_ID`, `Espécie Modificada_Espécie Modificada_ID`) VALUES ('Food Drug Administration', NULL, 0015, 0003);
INSERT INTO `GMOs`.`Aprovação` (`Instituição`, `Lei de Comércio`, `País_País_ID`, `Espécie Modificada_Espécie Modificada_ID`) VALUES ('Food Drug Administration', NULL, 0000, 0004);

SELECT * FROM aprovação;

#Sequencia
INSERT INTO `GMOs`.`Sequencia` (`Sequencia_ID`, `Sequência`, `Tipo de Sequência`) VALUES (0001, 'ATCTTCGTTCTCTGATGCCATCCCGGCGACGCCCCGGCTCCCAGCGACTCTAACCCTAGCCTCTCGAGCT', 'mRNA');
INSERT INTO `GMOs`.`Sequencia` (`Sequencia_ID`, `Sequência`, `Tipo de Sequência`) VALUES (0002, 'GAGAGACAGAAATTAGAAAAAGCTCTCTTCGTGTGTATACTGTATACAGAGCTTTTTGCTATTTCTCTAT', 'mRNA');
INSERT INTO `GMOs`.`Sequencia` (`Sequencia_ID`, `Sequência`, `Tipo de Sequência`) VALUES (0003, 'GTAGATTGTTAACACCCTGGGTCAAAAATTGATATTTAGTAAAATTAGTTGCACTTTGTGCATTTTTTCA', 'linear DNA');
INSERT INTO `GMOs`.`Sequencia` (`Sequencia_ID`, `Sequência`, `Tipo de Sequência`) VALUES (0000, 'NotPublished', 'none');

SELECT * FROM sequencia;

#Trangene
INSERT INTO `GMOs`.`Transgene` (`Transgene_ID`, `Abreviatura + Nome`, `Espécie Origem`, `Função`, `Efeito Pretendido`, `Sequencia_Sequencia_ID`) VALUES ('O100284678', 'PSY, phytoene synthase gene', 'Zea mays', 'Synthesized geranylgeranyl-diphosphate(GGPP) to form phytoene', 'pro-vitamin A, Vitamin E, Zinc, Iron and protein improvement', 0001);
INSERT INTO `GMOs`.`Transgene` (`Transgene_ID`, `Abreviatura + Nome`, `Espécie Origem`, `Função`, `Efeito Pretendido`, `Sequencia_Sequencia_ID`) VALUES ('O780274', 'PSY, phytoene synthase gene', 'Narcissus pseudonarcissus', 'Synthesized geranylgeranyl-diphosphate(GGPP) to form phytoene', 'pro-vitamin A, Vitamin E, Zinc, Iron and protein improvement', 0002);
INSERT INTO `GMOs`.`Transgene` (`Transgene_ID`, `Abreviatura + Nome`, `Espécie Origem`, `Função`, `Efeito Pretendido`, `Sequencia_Sequencia_ID`) VALUES ('NI00001', 'Crt1, carotene desaturase gene', 'Pantoea ananatis', 'Introduces conjugation by adding four double bonds', 'pro-vitamin A, Vitamin E, Zinc, Iron and protein improvement', 0000);
INSERT INTO `GMOs`.`Transgene` (`Transgene_ID`, `Abreviatura + Nome`, `Espécie Origem`, `Função`, `Efeito Pretendido`, `Sequencia_Sequencia_ID`) VALUES ('NI00002', 'Pmi, phosphomannose isomerase gene', 'Escherichia coli', 'Positive selection', 'pro-vitamin A, Vitamin E, Zinc, Iron and protein improvement', 0000);
INSERT INTO `GMOs`.`Transgene` (`Transgene_ID`, `Abreviatura + Nome`, `Espécie Origem`, `Função`, `Efeito Pretendido`, `Sequencia_Sequencia_ID`) VALUES ('NI00003', 'cp4 epsp, EPSP synthase gene', 'Agrobacterium tumefaciens strain CP4', 'decreases binding affinity for glyphosate, thereby conferring increased tolerance to glyphosate herbicide', 'tolerance to glyphosate herbicide', 0000);
INSERT INTO `GMOs`.`Transgene` (`Transgene_ID`, `Abreviatura + Nome`, `Espécie Origem`, `Função`, `Efeito Pretendido`, `Sequencia_Sequencia_ID`) VALUES ('NI00004', 'opAFP-GHc2, Anti-freeze protein gene', 'Zoarces americanus', 'Anti-freeze proteins', 'Increased Growth Hormone production', 0000);
INSERT INTO `GMOs`.`Transgene` (`Transgene_ID`, `Abreviatura + Nome`, `Espécie Origem`, `Função`, `Efeito Pretendido`, `Sequencia_Sequencia_ID`) VALUES ('NI00005', 'cry2Ab2, delta-endotoxin gene', 'Bacillus thuringiensis ', 'onfers resistance to lepidopteran insects by selectively damaging their midgut lining', 'Pest Protection', 0000);
INSERT INTO `GMOs`.`Transgene` (`Transgene_ID`, `Abreviatura + Nome`, `Espécie Origem`, `Função`, `Efeito Pretendido`, `Sequencia_Sequencia_ID`) VALUES ('O171854383', 'cry1Ac, pesticidal crystal protein', 'Bacillus thuringiensis ', 'Promotes colloidosmotic lysis by binding to the midgut epithelial cells of many lepidopteran larvae.', 'Pest Protection', 0003);

SELECT * FROM transgene;

#Promotor
INSERT INTO `GMOs`.`Promotor` (`Promotor_ID`, `Nome_Promotor`, `Espécie Origem`, `Método de Selecção`) VALUES (0124, 'Glu', 'Oryza sativa', ' rice endosperm-specific glutelin promoter');
INSERT INTO `GMOs`.`Promotor` (`Promotor_ID`, `Nome_Promotor`, `Espécie Origem`, `Método de Selecção`) VALUES (1478, 'Ubi1', 'Zea mays', 'maize polyubiquitin promoter');
INSERT INTO `GMOs`.`Promotor` (`Promotor_ID`, `Nome_Promotor`, `Espécie Origem`, `Método de Selecção`) VALUES (102, 'CaMV 35S ', 'Cauliflower mosaic virus ', 'Global promotor - sequence overlap exists between this promoter and the coding sequences of P6');
INSERT INTO `GMOs`.`Promotor` (`Promotor_ID`, `Nome_Promotor`, `Espécie Origem`, `Método de Selecção`) VALUES (6327, 'AFP', 'Oncorhynchus tshawytscha', 'opAFP-GHc2 promoter');

SELECT * FROM promotor;

#Não Aprovação
INSERT INTO `GMOs`.`Não Aprovação` (`Razões`, `Instituição`, `País_País_ID`, `Espécie Modificada_Espécie Modificada_ID`) VALUES ('There wasn\'t enough testing', 'European Food Safety Authority', 0024, 0003);
INSERT INTO `GMOs`.`Não Aprovação` (`Razões`, `Instituição`, `País_País_ID`, `Espécie Modificada_Espécie Modificada_ID`) VALUES ('There wasn\'t enough testing', 'European Food Safety Authority', 0024, 0002);
INSERT INTO `GMOs`.`Não Aprovação` (`Razões`, `Instituição`, `País_País_ID`, `Espécie Modificada_Espécie Modificada_ID`) VALUES ('Not enough caratenoids', NULL, 0000, 0001);

SELECT * FROM `não aprovação`;

#Especiemodificada has trangene
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0002, 'O100284678');
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0001, 'O780274');
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0001, 'NI00001');
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0002, 'NI00001');
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0002, 'NI00002');
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0004, 'NI00003');
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0003, 'NI00004');
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0004, 'NI00005');
INSERT INTO `GMOs`.`Espécie Modificada_has_Transgene` (`Espécie Modificada_Espécie Modificada_ID`, `Transgene_Transgene_ID`) VALUES (0004, 'O171854383');

SELECT * FROM `espécie modificada_has_transgene`;

#transgene has promotor
INSERT INTO `GMOs`.`Transgene_has_Promotor` (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`) VALUES ('O100284678', 0124);
INSERT INTO `GMOs`.`Transgene_has_Promotor` (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`) VALUES ('O780274', 0124);
INSERT INTO `GMOs`.`Transgene_has_Promotor` (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`) VALUES ('NI00001', 0124);
INSERT INTO `GMOs`.`Transgene_has_Promotor` (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`) VALUES ('NI00002', 1478);
INSERT INTO `GMOs`.`Transgene_has_Promotor` (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`) VALUES ('NI00003', 102);
INSERT INTO `GMOs`.`Transgene_has_Promotor` (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`) VALUES ('NI00004', 6327);
INSERT INTO `GMOs`.`Transgene_has_Promotor` (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`) VALUES ('NI00005', 102);
INSERT INTO `GMOs`.`Transgene_has_Promotor` (`Transgene_Transgene_ID`, `Promotor_Promotor_ID`) VALUES ('O171854383', 102);

SELECT * FROM `transgene_has_promotor`;

#Artigos publicados
INSERT INTO `GMOs`.`Artigos Publicados` (`Artigos_ID`, `Artigo`, `Espécie Modificada_Espécie Modificada_ID`) VALUES (01, 'Hoa TTC, Al-Babili S, Schaub P, Potrykus I, Beyer P (2003) Golden indica and japonica rice lines amenable to deregulation. Plant Physiology 133:161-169.', 0001);
INSERT INTO `GMOs`.`Artigos Publicados` (`Artigos_ID`, `Artigo`, `Espécie Modificada_Espécie Modificada_ID`) VALUES (02, 'Al-Babili S, Hoa TTC, Schaub P (2006) Exploring the potential of the bacterial carotene desaturase CrtI to increase the β-carotene content in Golden Rice. J Exp Bot 57:1007-1014.', 0002);
INSERT INTO `GMOs`.`Artigos Publicados` (`Artigos_ID`, `Artigo`, `Espécie Modificada_Espécie Modificada_ID`) VALUES (03, 'Improving the nutritional value of Golden Rice through increased pro-vitamin A content', 0002);
INSERT INTO `GMOs`.`Artigos Publicados` (`Artigos_ID`, `Artigo`, `Espécie Modificada_Espécie Modificada_ID`) VALUES (04, 'A new specific reference gene based on growth hormone gene (GH1) used for detection and relative quantification of Aquadvantage® GM salmon (Salmo salar L.) in food products', 0003);
INSERT INTO `GMOs`.`Artigos Publicados` (`Artigos_ID`, `Artigo`, `Espécie Modificada_Espécie Modificada_ID`) VALUES (05, 'Yield, Quality, and Fruit Distribution in Bollgard/Roundup Ready and Bollgard II/Roundup Ready Flex Cottons', 0004);

SELECT * FROM `artigos publicados`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
