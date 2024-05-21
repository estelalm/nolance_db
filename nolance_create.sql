

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS db_nolance;
USE db_nolance ;

-- -----------------------------------------------------
-- Table `tbl_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `tbl_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `icone` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `tbl_comitente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_comitente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `tbl_modalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_modalidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `tbl_leilao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_leilao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `data_inicio` DATETIME NOT NULL,
  `data_final` DATETIME NOT NULL,
  `retirada` VARCHAR(200) NOT NULL,
  `categoria_id` INT NOT NULL,
  `comitente_id` INT NOT NULL,
  `modalidade_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_leilao_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `tbl_categoria` (`id`)
    ,
  CONSTRAINT `fk_leilao_comitente`
    FOREIGN KEY (`comitente_id`)
    REFERENCES `tbl_comitente` (`id`)
    ,
  CONSTRAINT `fk_tbl_leilao_modalidade`
    FOREIGN KEY (`modalidade_id`)
    REFERENCES `tbl_modalidade` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_lote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` TEXT NOT NULL,
  `data_inicio` DATETIME NOT NULL,
  `reserva` FLOAT NOT NULL,
  `status_id` INT NOT NULL,
  `leilao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_lote_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `tbl_status` (`id`)
    ,
  CONSTRAINT `fk_lote_leilao`
    FOREIGN KEY (`leilao_id`)
    REFERENCES `tbl_leilao` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(8) NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
;


-- -----------------------------------------------------
-- Table `tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) BINARY NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `icone` VARCHAR(200) NOT NULL,
  `data_nascimento` DATETIME NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `endereco_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_usuario_endereco`
    FOREIGN KEY (`endereco_id`)
    REFERENCES `tbl_endereco` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_lance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_lance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `valor` FLOAT NOT NULL,
  `lote_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_lance_lote`
    FOREIGN KEY (`lote_id`)
    REFERENCES `tbl_lote` (`id`)
    ,
  CONSTRAINT `fk_lance_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `tbl_usuario` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `tbl_forma_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_forma_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `icone` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
;


-- -----------------------------------------------------
-- Table `tbl_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lance_id` INT NOT NULL,
  `tbl_forma_pagamento_id` INT NOT NULL,
  `data` DATETIME NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pagamento_lance`
    FOREIGN KEY (`lance_id`)
    REFERENCES `tbl_lance` (`id`)
    ,
  CONSTRAINT `fk_pagamento_formapagamento`
    FOREIGN KEY (`tbl_forma_pagamento_id`)
    REFERENCES `tbl_forma_pagamento` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_interesse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_interesse` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoria_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_interesse_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `tbl_categoria` (`id`)
    ,
  CONSTRAINT `fk_interesse_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `tbl_usuario` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_subcategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_subcategoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_subcategoria_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `tbl_categoria` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_categoria_lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_categoria_lote` (
  `lote_id` INT NOT NULL AUTO_INCREMENT,
  `subcategoria_id` INT NOT NULL,
  CONSTRAINT `fk_categoria_lote`
    FOREIGN KEY (`lote_id`)
    REFERENCES `tbl_lote` (`id`)
    ,
  CONSTRAINT `fk_tbl_categoria_subcategoria`
    FOREIGN KEY (`subcategoria_id`)
    REFERENCES `tbl_subcategoria` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_pessoa_fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_pessoa_fisica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `rg` VARCHAR(45) NOT NULL,
  `comitente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pessoafisica_comitente`
    FOREIGN KEY (`comitente_id`)
    REFERENCES `tbl_comitente` (`id`)
    )
;


-- -----------------------------------------------------
-- Table `tbl_pessoa_juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbl_pessoa_juridica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(14) NOT NULL,
  `razao_social` VARCHAR(50) NOT NULL,
  `descricao` TEXT NOT NULL,
  `comitente_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pessoajuridica_comitente`
    FOREIGN KEY (`comitente_id`)
    REFERENCES `tbl_comitente` (`id`)
    )
;
