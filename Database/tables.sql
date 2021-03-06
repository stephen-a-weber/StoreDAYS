CREATE SCHEMA IF NOT EXISTS StoreDAYS DEFAULT CHARACTER SET utf8;
USE StoreDAYS;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `User` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `UserName`  TEXT NULL ,
  `FirstName` TEXT NULL,
  `LastName` TEXT NULL,
  `DateOfBirth` DATE NULL,
  `Password` TEXT NULL,
  `Email`  TEXT NULL ,
  `Admin` INT NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Address` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Street` TEXT NULL,
  `City` TEXT NULL,
  `User_ID` INT NOT NULL,
  `State` TEXT NULL,
  `Zip` TEXT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Address_User1_idx` (`User_ID` ASC) ,
  CONSTRAINT `fk_Address_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Shipping` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ShippingType` TEXT NULL,
  `Cost` DOUBLE(15, 4)	 NULL,
  `ETA` VARCHAR(45) NULL,
  `User_ID` INT NOT NULL,
  `Status` VARCHAR(45) NULL,
  `Address_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Shipping_User1_idx` (`User_ID` ASC) ,
  INDEX `fk_Shipping_Address1_idx` (`Address_ID` ASC) ,
  CONSTRAINT `fk_Shipping_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shipping_Address1`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `Address` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `PaymentMethods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PaymentMethods` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CardNumber` TEXT NULL,
  `CVC` TEXT NULL,
  `Expiration` TEXT NULL,
  `Name` VARCHAR(45) NULL,
  `User_ID` INT NOT NULL,
  `Address_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_PaymentMethods_User1_idx` (`User_ID` ASC) ,
  INDEX `fk_PaymentMethods_Address1_idx` (`Address_ID` ASC) ,
  CONSTRAINT `fk_PaymentMethods_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PaymentMethods_Address1`
    FOREIGN KEY (`Address_ID`)
    REFERENCES `Address` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Invoice` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Cost` DOUBLE(15, 4)	  NULL,
  `User_ID` INT NOT NULL,
  `Shipping_ID` INT NOT NULL,
  `PaymentMethods_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Invoice_User1_idx` (`User_ID` ASC) ,
  INDEX `fk_Invoice_Shipping1_idx` (`Shipping_ID` ASC) ,
  INDEX `fk_Invoice_PaymentMethods1_idx` (`PaymentMethods_ID` ASC) ,
  CONSTRAINT `fk_Invoice_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Shipping1`
    FOREIGN KEY (`Shipping_ID`)
    REFERENCES `Shipping` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_PaymentMethods1`
    FOREIGN KEY (`PaymentMethods_ID`)
    REFERENCES `PaymentMethods` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Orders` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Cost` DOUBLE(15, 4)	 NULL,
  `Description` TEXT NULL,
  `Invoice_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Orders_Invoice1_idx` (`Invoice_ID` ASC) ,
  CONSTRAINT `fk_Orders_Invoice1`
    FOREIGN KEY (`Invoice_ID`)
    REFERENCES `Invoice` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Catagory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Catagory` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Title` TEXT NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Items` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` TEXT NULL,
  `Description` TEXT NULL,
  `Cost` DOUBLE(15, 4)	 NULL,
  `Catagory_ID` INT NOT NULL,
  `Img` TEXT NULL,
  `Availability` INT NULL,
  `Longitude` DOUBLE(15, 4)	 NULL,
  `Latitude` DOUBLE(15, 4)	 NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Items_Catagory_idx` (`Catagory_ID` ASC) ,
  CONSTRAINT `fk_Items_Catagory`
    FOREIGN KEY (`Catagory_ID`)
    REFERENCES `Catagory` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Review` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Body` TEXT NULL,
  `User_ID` INT NOT NULL,
  `Rate` INT NULL,
  `Items_ID` INT NULL,
  `Catagory_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Review_User1_idx` (`User_ID` ASC) ,
  INDEX `fk_Review_Items1_idx` (`Items_ID` ASC) ,
  INDEX `fk_Review_Catagory1_idx` (`Catagory_ID` ASC) ,
  CONSTRAINT `fk_Review_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Items1`
    FOREIGN KEY (`Items_ID`)
    REFERENCES `Items` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Catagory1`
    FOREIGN KEY (`Catagory_ID`)
    REFERENCES `Catagory` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `Orders_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Orders_Details` (
  `Items_ID` INT NOT NULL,
  `Orders_ID` INT NOT NULL,
  `Quantity` INT NULL,
  `ID` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_Items_has_Orders_Orders1_idx` (`Orders_ID` ASC) ,
  INDEX `fk_Items_has_Orders_Items1_idx` (`Items_ID` ASC) ,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Items_has_Orders_Items1`
    FOREIGN KEY (`Items_ID`)
    REFERENCES `Items` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Items_has_Orders_Orders1`
    FOREIGN KEY (`Orders_ID`)
    REFERENCES `Orders` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
