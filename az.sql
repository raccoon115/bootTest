-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`member` (
  `userid` VARCHAR(45) NOT NULL,
  `userpwd` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `tel` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `zipcode` VARCHAR(45) NULL,
  `addr` VARCHAR(150) NULL,
  `detailaddr` VARCHAR(100) NULL,
  `writedate` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`userid`))

-- -----------------------------------------------------
-- Table `mydb`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`board` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(200) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `userid` VARCHAR(45) NOT NULL,
  `hit` INT NULL DEFAULT 0,
  `ip` VARCHAR(20) NOT NULL,
  `writedate` DATETIME NULL DEFAULT now(),
  PRIMARY KEY (`no`),
 
  CONSTRAINT `fk_board_member`
    FOREIGN KEY (`userid`)
    REFERENCES `mydb`.`member` (`userid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)



-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)



-- -----------------------------------------------------
-- Table `mydb`.`zipcode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`zipcode` (
  `zipcode` VARCHAR(5) NOT NULL,
  `sido` VARCHAR(45) NOT NULL,
  `doro` VARCHAR(45) NOT NULL,
  `blidnum1` VARCHAR(45) NULL,
  `blidnum2` VARCHAR(45) NULL,
  `blidname` VARCHAR(100) NULL,
  `dong` VARCHAR(45) NULL,
  `num1` VARCHAR(45) NULL,
  `num2` VARCHAR(45) NULL)



-- -----------------------------------------------------
-- Table `mydb`.`data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`data` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `userid` VARCHAR(45) NOT NULL,
  `downcount` INT NOT NULL DEFAULT 0,
  `hit` INT NOT NULL DEFAULT 0,
  `writedate` DATETIME NOT NULL DEFAULT now(),
  `filename1` VARCHAR(100) NOT NULL,
  `filename2` VARCHAR(100) NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_data_member1_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_data_member1`
    FOREIGN KEY (`userid`)
    REFERENCES `mydb`.`member` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `mydb`.`reply_board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reply_board` (
  `reply_no` INT NOT NULL AUTO_INCREMENT,
  `no` INT NOT NULL,
  `userid` VARCHAR(45) NOT NULL,
  `comment` VARCHAR(200) NOT NULL,
  `writedate` DATETIME NOT NULL DEFAULT now(),
  PRIMARY KEY (`reply_no`),
  CONSTRAINT `fk_reply_board_board1`
    FOREIGN KEY (`no`)
    REFERENCES `mydb`.`board` (`no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
