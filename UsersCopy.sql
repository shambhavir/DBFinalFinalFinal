SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0; CREATE DATABASE  IF NOT EXISTS `Users` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Users`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: Users
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `belongs`
--

DROP TABLE IF EXISTS `belongs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongs` (
    `AID` INT,
    PRIMARY KEY (`AID`),
    KEY `fk_belongs_priceAID` (`AID`),
    CONSTRAINT `fk_belongs_AID` FOREIGN KEY (`AID`)
        REFERENCES `Events` (`AID`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongs`
--

LOCK TABLES `belongs` WRITE;
/*!40000 ALTER TABLE `belongs` DISABLE KEYS */;
/*!40000 ALTER TABLE `belongs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
	`AID` INT,
    `username` VARCHAR(45) NOT NULL,
    `itemCurrentPrice` FLOAT,
    KEY `fk_buy_AID` (`AID`),
    KEY `fk_buy_username` (`username`),
    CONSTRAINT `fk_bid_AID` FOREIGN KEY (`AID`)
        REFERENCES `Events` (`AID`),
    CONSTRAINT `fk_bid_username` FOREIGN KEY (`username`)
        REFERENCES `login` (`username`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buy` (
    `username` VARCHAR(45) NOT NULL,
    `AID` INT,
    `isWinner` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`AID`),
    KEY `fk_buy_AID` (`AID`),
    KEY `fk_buy_username` (`username`),
    CONSTRAINT `fk_buy_AID` FOREIGN KEY (`AID`)
        REFERENCES `Events` (`AID`),
    CONSTRAINT `fk_buy_username` FOREIGN KEY (`username`)
        REFERENCES `login` (`username`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Emp_Ad_Rep`
--

DROP TABLE IF EXISTS `Emp_Ad_Rep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Emp_Ad_Rep` (
    `empUserName` VARCHAR(45) NOT NULL,
    `empPassword` VARCHAR(45) NOT NULL,
    `eID` VARCHAR(10) NOT NULL,
    `earningsPerITEM` MEDIUMTEXT NOT NULL,
    `earningsPerITEMTYPE` MEDIUMTEXT NOT NULL,
    `earningsPerENDUSER` MEDIUMTEXT NOT NULL,
    `totalEarnings` MEDIUMTEXT NOT NULL,
    `bestSellingEndUser` VARCHAR(45) NOT NULL,
    `bestSellingItems` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`eID`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Emp_Ad_Rep`
--

LOCK TABLES `Emp_Ad_Rep` WRITE;
/*!40000 ALTER TABLE `Emp_Ad_Rep` DISABLE KEYS */;
/*!40000 ALTER TABLE `Emp_Ad_Rep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--


DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
    `username` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `userType` VARCHAR(8) NOT NULL,
    PRIMARY KEY (`username`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('Admin','pass1','admin'),('CustomerRep1','pass2','rep'),('User1','pass3','customer'), ('User2', 'pass4', 'customer');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
    `AID` INT NOT NULL,
    `itemName` VARCHAR(50) NOT NULL,
    `itemType` VARCHAR(50) NOT NULL,
    `itemStartingPrice` FLOAT NOT NULL,
    `itemCurrentPrice` FLOAT,
    `itemReserveAmount` FLOAT,
    `itemEndDateTime` TIMESTAMP NOT NULL ,
    `status` VARCHAR(10) NOT NULL,
    `ownerUsername` VARCHAR(45) NOT NULL,
    `username` VARCHAR(45),
    PRIMARY KEY (`AID`),
    FOREIGN KEY (`username`)
        REFERENCES login (`username`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `Events` VALUES (0, 'DMUMT','LP',50.00, 50.00, 100.00, '2020-05-10 21:00:00', 'Open', 'CustomerRep1', 'CustomerRep1');
INSERT INTO `Events` VALUES (1, 'XOXO','INST',5000.00, 5500.00, 100.00, '2021-04-21 15:50:00', 'Open', 'CustomerRep1', 'CustomerRep1');
INSERT INTO `Events` VALUES (2, 'For Life','CD', 30.00, 30.00, 40.00, '2022-10-10 15:05:00', 'Open', 'CustomerRep1', 'CustomerRep1');
INSERT INTO `Events` VALUES (3, 'Universe','CD', 30.00, 30.00, 40.00, '2021-03-10 16:00:00', 'Open', 'CustomerRep1', 'CustomerRep1');
INSERT INTO `Events` VALUES (4, 'MAMA','CD', 30.00, 30.00, 40.00, '2021-10-15 16:00:00', 'Open', 'CustomerRep1', 'CustomerRep1');
UPDATE `Events` SET `itemCurrentPrice` = 35,  `username` = 'user1' WHERE `AID` = 2;
-- SELECT Max(AID) FROM Events WHERE AID <= 0;
--
-- Dumping data for table `Events`
 -- KEY `fk_sends_mID` (`mID`),
--   KEY `fk_sends_username` (`username`),
 --  CONSTRAINT `fk_sends_mID` FOREIGN KEY (`mID`) REFERENCES `notif` (`mID`),
 -- CONSTRAINT `fk_sends_username` FOREIGN KEY (`username`) REFERENCES `login` (`username`)
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `login`
--


--
-- Table structure for table `Musicals`
--

DROP TABLE IF EXISTS `Musicals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musicals` (
	-- `alertID` int NOT NULL,
    `itemName` VARCHAR(50) NOT NULL,
    `itemType` VARCHAR(50) NOT NULL,
    `username` VARCHAR(45) NOT NULL,
    `isAvaliable` VARCHAR(4) NOT NULL,
    PRIMARY KEY(`itemName`, `username`, `itemType`),
    FOREIGN KEY (`username`)
        REFERENCES login (`username`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `Musicals` VALUES ('Love Shot','CD', 'Admin', 'No');
--
-- Dumping data for table `Musicals`
--

LOCK TABLES `Musicals` WRITE;
/*!40000 ALTER TABLE `Musicals` DISABLE KEYS */;
/*!40000 ALTER TABLE `Musicals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notif`
--

DROP TABLE IF EXISTS `notif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notif` (
    `mID` int NOT NULL,
    `messageTime` TIMESTAMP NOT NULL,
    `AID` INT NOT NULL,
    `username` VARCHAR(45) NOT NULL,
    `subject` VARCHAR(30) NOT NULL,
    `message` VARCHAR(1000) NOT NULL,
    PRIMARY KEY (`mID`),
    KEY `fk_notif_AID` (`AID`),
    KEY `fk_notif_username` (`username`),
    CONSTRAINT `fk_notif_AID` FOREIGN KEY (`AID`)
        REFERENCES `Events` (`AID`),
    CONSTRAINT `fk_notif_username` FOREIGN KEY (`username`)
        REFERENCES `login` (`username`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;
-- INSERT INTO `notif` VALUES (12,'Admin', 'dummySubject','dummyMessage');
-- SELECT * FROM notif;

--
-- Dumping data for table `notif`
--

LOCK TABLES `notif` WRITE;
/*!40000 ALTER TABLE `notif` DISABLE KEYS */;
/*!40000 ALTER TABLE `notif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sends`
--

DROP TABLE IF EXISTS `sends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sends` (
    -- `mID` int NOT NULL,
    `username` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`username`),
    -- KEY `fk_sends_mID` (`mID`),
    KEY `fk_sends_username` (`username`),
    -- CONSTRAINT `fk_sends_mID` FOREIGN KEY (`mID`)
        -- REFERENCES `notif` (`mID`),
    CONSTRAINT `fk_sends_username` FOREIGN KEY (`username`)
        REFERENCES `login` (`username`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sends`
--

LOCK TABLES `sends` WRITE;
/*!40000 ALTER TABLE `sends` DISABLE KEYS */;
/*!40000 ALTER TABLE `sends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Manages`
--

DROP TABLE IF EXISTS `User_Manages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Manages` (
    `userManageName` VARCHAR(45) NOT NULL,
    `firstName` VARCHAR(45) NOT NULL,
    `lastName` VARCHAR(45) NOT NULL,
    `middleName` VARCHAR(45) NOT NULL,
    `phone` MEDIUMTEXT NOT NULL,
    `uID` VARCHAR(10) NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `managePassword` VARCHAR(50) NOT NULL,
    `bankAccount` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`uID`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Manages`
--

LOCK TABLES `User_Manages` WRITE;
/*!40000 ALTER TABLE `User_Manages` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Manages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
    `QID` INT NOT NULL,
    `question` VARCHAR(1000) NOT NULL,
    `answer` VARCHAR(1000) DEFAULT 'TBA' NOT NULL,
    `customerRepUsername` VARCHAR(45) DEFAULT 'TBA' NOT NULL,
    `username` VARCHAR(45),
    PRIMARY KEY (`QID`),
    FOREIGN KEY (`username`)
        REFERENCES login (`username`)
)  ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_0900_AI_CI;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `Messages` VALUES (0, 'Where was XOXO made?','It was made in USA','CustomerRep1', 'user1');
INSERT INTO `Messages` VALUES (1, 'How long is the warranty for MAMA?','2 years','CustomerRep1', 'user1');



-- Dump completed on 2021-03-19 20:20:32

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;
SET SQL_NOTES=@OLD_SQL_NOTES; 

