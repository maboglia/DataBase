-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ifinances
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BANK_ID` bigint(20) DEFAULT NULL,
  `ACCOUNT_TYPE` varchar(45) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `INITIAL_BALANCE` decimal(10,2) NOT NULL,
  `CURRENT_BALANCE` decimal(10,2) NOT NULL,
  `OPEN_DATE` date NOT NULL,
  `CLOSE_DATE` date NOT NULL,
  `LAST_UPDATED_BY` varchar(45) NOT NULL,
  `LAST_UPDATED_DATE` datetime DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  KEY `BANK_FK` (`BANK_ID`),
  KEY `ACCOUNT_TYPE_FK_idx` (`ACCOUNT_TYPE`),
  CONSTRAINT `BANK_FK` FOREIGN KEY (`BANK_ID`) REFERENCES `bank` (`BANK_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,'CHECKING','Checking Account',1000.00,1000.00,'2014-12-04','2014-12-04','Kevin Bowersox','2014-12-04 17:30:30','Kevin Bowersox','2014-12-04 17:30:30');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `ACCOUNT_TYPE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `LAST_UPDATED_DATE` date DEFAULT NULL,
  `LAST_UPDATED_BY` varchar(45) DEFAULT NULL,
  `CREATED_DATE` date DEFAULT NULL,
  `CREATED_BY` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `BANK_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `ADDRESS_LINE_1` varchar(100) NOT NULL,
  `ADDRESS_LINE_2` varchar(100) NOT NULL,
  `CITY` varchar(100) NOT NULL,
  `STATE` varchar(2) NOT NULL,
  `ZIP_CODE` varchar(5) NOT NULL,
  `IS_INTERNATIONAL` tinyint(1) NOT NULL,
  `LAST_UPDATED_BY` varchar(45) NOT NULL,
  `LAST_UPDATED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(45) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `ADDRESS_TYPE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BANK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'Second National Trust','301 Snowy Lane','Suite 2','Adams','PA','10003',0,'system','2014-11-01 00:00:00','system','2014-11-01 00:00:00','PRIMARY'),(2,'Third National Trust','Sunrise Drive','Suite 22','Jonestown','MI','12303',0,'system','2014-11-01 00:00:00','system','2014-11-01 00:00:00','PRIMARY'),(3,'Third National Trust','Bellvue','Suite 2','Newport','RI','18943',0,'system','2014-11-01 00:00:00','system','2014-11-01 00:00:00','PRIMARY'),(4,'Forth National Trust','403 Park Ave','Suite 221','Madison','WI','10003',0,'system','2014-11-01 00:00:00','system','2014-11-01 00:00:00','PRIMARY');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_contact`
--

DROP TABLE IF EXISTS `bank_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_contact` (
  `BANK_ID` bigint(20) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `POSITION_TYPE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BANK_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_contact`
--

LOCK TABLES `bank_contact` WRITE;
/*!40000 ALTER TABLE `bank_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bond`
--

DROP TABLE IF EXISTS `bond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bond` (
  `BOND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `ISSUER` varchar(100) NOT NULL,
  `PURCHASE_DATE` datetime NOT NULL,
  `VALUE` decimal(10,2) NOT NULL,
  `INTEREST_RATE` decimal(10,2) NOT NULL,
  `MATURITY_DATE` datetime NOT NULL,
  `PORTFOLIO_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`BOND_ID`),
  KEY `PORTFOLIO_FK2_idx` (`PORTFOLIO_ID`),
  CONSTRAINT `PORTFOLIO_FK2` FOREIGN KEY (`PORTFOLIO_ID`) REFERENCES `portfolio` (`PORTFOLIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1453 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bond`
--

LOCK TABLES `bond` WRITE;
/*!40000 ALTER TABLE `bond` DISABLE KEYS */;
INSERT INTO `bond` VALUES (1451,'Long Term Bond Purchases','JP Morgan Chase','2014-12-05 15:40:08',10.22,123.22,'2014-12-05 00:00:00',2),(1452,'Long Term Bond Purchases','JP Morgan Chase','2014-12-13 16:45:53',10.22,123.22,'2014-12-13 00:00:00',NULL);
/*!40000 ALTER TABLE `bond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget` (
  `BUDGET_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `GOAL_AMOUNT` decimal(10,2) NOT NULL,
  `PERIOD` varchar(45) NOT NULL,
  PRIMARY KEY (`BUDGET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget_transaction`
--

DROP TABLE IF EXISTS `budget_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budget_transaction` (
  `TRANSACTION_ID` bigint(20) NOT NULL,
  `BUDGET_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`TRANSACTION_ID`,`BUDGET_ID`),
  UNIQUE KEY `TRANSACTION_ID_UNIQUE` (`TRANSACTION_ID`),
  KEY `BUDGET_FK_idx` (`BUDGET_ID`),
  CONSTRAINT `BUDGET_FK` FOREIGN KEY (`BUDGET_ID`) REFERENCES `budget` (`BUDGET_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TRANSACTION_FK2` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `transaction` (`TRANSACTION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget_transaction`
--

LOCK TABLES `budget_transaction` WRITE;
/*!40000 ALTER TABLE `budget_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `budget_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential` (
  `CREDENTIAL_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL,
  PRIMARY KEY (`CREDENTIAL_ID`),
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`),
  CONSTRAINT `FINANCES_USER_FK` FOREIGN KEY (`USER_ID`) REFERENCES `finances_user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `NAME` varchar(45) NOT NULL,
  `COUNTRY_NAME` varchar(45) NOT NULL,
  `SYMBOL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NAME`,`COUNTRY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES ('Dollar','United States','$'),('Pound','United Kingdom','Pound Sign');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finances_user`
--

DROP TABLE IF EXISTS `finances_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finances_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(45) NOT NULL,
  `LAST_NAME` varchar(45) NOT NULL,
  `BIRTH_DATE` date NOT NULL,
  `EMAIL_ADDRESS` varchar(100) NOT NULL,
  `LAST_UPDATED_BY` varchar(45) NOT NULL,
  `LAST_UPDATED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(45) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  `USER_ADDRESS_LINE_1` varchar(100) DEFAULT NULL,
  `USER_ADDRESS_LINE_2` varchar(100) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `ZIP_CODE` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finances_user`
--

LOCK TABLES `finances_user` WRITE;
/*!40000 ALTER TABLE `finances_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `finances_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifinances_keys`
--

DROP TABLE IF EXISTS `ifinances_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifinances_keys` (
  `PK_NAME` varchar(45) NOT NULL,
  `PK_VALUE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PK_NAME`),
  UNIQUE KEY `PK_VALUE_UNIQUE` (`PK_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifinances_keys`
--

LOCK TABLES `ifinances_keys` WRITE;
/*!40000 ALTER TABLE `ifinances_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifinances_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investment`
--

DROP TABLE IF EXISTS `investment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investment` (
  `INVESTMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PORTFOLIO_ID` bigint(20) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ISSUER` varchar(100) DEFAULT NULL,
  `PURCHASE_DATE` datetime DEFAULT NULL,
  `VALUE` decimal(10,2) DEFAULT NULL,
  `INTEREST_RATE` decimal(10,2) DEFAULT NULL,
  `MATURITY_DATE` datetime DEFAULT NULL,
  `SHARE_PRICE` decimal(10,2) DEFAULT NULL,
  `QUANTITY` bigint(20) DEFAULT NULL,
  `INVESTMENT_TYPE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`INVESTMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1508 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investment`
--

LOCK TABLES `investment` WRITE;
/*!40000 ALTER TABLE `investment` DISABLE KEYS */;
INSERT INTO `investment` VALUES (1,6,'Private American Stock Purchases','Allen Edmonds','2014-12-05 16:37:31',NULL,NULL,NULL,100.00,1922,'STOCK'),(2,6,'Long Term Bond Purchases','JP Morgan Chase','2014-12-05 16:37:31',10.22,123.22,'2014-12-05 00:00:00',NULL,NULL,'BOND'),(3,7,'Private American Stock Purchases','Allen Edmonds','2014-12-05 16:38:06',NULL,NULL,NULL,100.00,1922,'STOCK'),(4,7,'Long Term Bond Purchases','JP Morgan Chase','2014-12-05 16:38:06',10.22,123.22,'2014-12-05 00:00:00',NULL,NULL,'BOND'),(1500,8,'Private American Stock Purchases','Allen Edmonds','2014-12-05 17:14:37',NULL,NULL,NULL,100.00,1922,'Stock'),(1501,8,'Long Term Bond Purchases','JP Morgan Chase','2014-12-05 17:14:37',10.22,123.22,'2014-12-05 00:00:00',NULL,NULL,'Bond'),(1502,9,'Private American Stock Purchases','Allen Edmonds','2014-12-05 17:15:09',NULL,NULL,NULL,100.00,1922,'Stock'),(1503,9,'Long Term Bond Purchases','JP Morgan Chase','2014-12-05 17:15:09',10.22,123.22,'2014-12-05 00:00:00',NULL,NULL,'Bond'),(1504,10,'Private American Stock Purchases','Allen Edmonds','2014-12-05 17:16:28',NULL,NULL,NULL,100.00,1922,'ST'),(1505,10,'Long Term Bond Purchases','JP Morgan Chase','2014-12-05 17:16:28',10.22,123.22,'2014-12-05 00:00:00',NULL,NULL,'BND'),(1506,12,'Private American Stock Purchases','Allen Edmonds','2014-12-13 16:49:28',NULL,NULL,NULL,100.00,1922,'ST'),(1507,12,'Long Term Bond Purchases','JP Morgan Chase','2014-12-13 16:49:28',10.22,123.22,'2014-12-13 00:00:00',NULL,NULL,'BND');
/*!40000 ALTER TABLE `investment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market` (
  `MARKET_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CURRENCY_NAME` varchar(45) NOT NULL,
  `COUNTRY_NAME` varchar(45) NOT NULL,
  `MARKET_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MARKET_ID`),
  KEY `CURRENCY_FK_idx` (`CURRENCY_NAME`,`COUNTRY_NAME`),
  CONSTRAINT `CURRENCY_FK` FOREIGN KEY (`CURRENCY_NAME`, `COUNTRY_NAME`) REFERENCES `currency` (`NAME`, `COUNTRY_NAME`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` VALUES (12,'Pound','United Kingdom','London Stock Exchange');
/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio` (
  `PORTFOLIO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`PORTFOLIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` VALUES (1,'First Investments'),(2,'First Investments'),(6,'First Investments'),(7,'First Investments'),(8,'First Investments'),(9,'First Investments'),(10,'First Investments'),(12,'First Investments');
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `STOCK_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `ISSUER` varchar(45) NOT NULL,
  `PURCHASE_DATE` datetime NOT NULL,
  `SHARE_PRICE` decimal(10,2) NOT NULL,
  `QUANTITY` bigint(20) NOT NULL,
  `PORTFOLIO_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`STOCK_ID`),
  KEY `PORTFOLIO_FK_idx` (`PORTFOLIO_ID`),
  CONSTRAINT `PORTFOLIO_FK` FOREIGN KEY (`PORTFOLIO_ID`) REFERENCES `portfolio` (`PORTFOLIO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1452 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1450,'Private American Stock Purchases','Allen Edmonds','2014-12-05 15:40:08',100.00,1922,2),(1451,'Private American Stock Purchases','Allen Edmonds','2014-12-13 16:45:53',100.00,1922,NULL);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_test`
--

DROP TABLE IF EXISTS `time_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_test` (
  `TIME_TEST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DATETIME_COLUMN` datetime DEFAULT NULL,
  `TIMESTAMP_COLUMN` timestamp NULL DEFAULT NULL,
  `DATE_COLUMN` date DEFAULT NULL,
  `TIME_COLUMN` time DEFAULT NULL,
  `SQL_DATETIME_COLUMN` datetime DEFAULT NULL,
  `SQL_TIMESTAMP_COLUMN` timestamp NULL DEFAULT NULL,
  `SQL_DATE_COLUMN` date DEFAULT NULL,
  `SQL_TIME_COLUMN` time DEFAULT NULL,
  PRIMARY KEY (`TIME_TEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_test`
--

LOCK TABLES `time_test` WRITE;
/*!40000 ALTER TABLE `time_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `TRANSACTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_ID` bigint(20) NOT NULL,
  `TRANSACTION_TYPE` varchar(45) NOT NULL,
  `TITLE` varchar(100) NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL,
  `INITIAL_BALANCE` decimal(10,2) NOT NULL,
  `CLOSING_BALANCE` decimal(10,2) NOT NULL,
  `NOTES` mediumtext,
  `LAST_UPDATED_BY` varchar(45) NOT NULL,
  `LAST_UPDATED_DATE` datetime NOT NULL,
  `CREATED_BY` varchar(45) NOT NULL,
  `CREATED_DATE` datetime NOT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `ACCOUNT_FK2_idx` (`ACCOUNT_ID`),
  CONSTRAINT `ACCOUNT_FK2` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ACCOUNT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,'Withdrawl','Dress Belt',50.00,1000.00,950.00,'New Dress Belt','Kevin Bowersox','2014-12-06 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(2,1,'Withdrawl','Work Shoes',100.00,950.00,850.00,'Nice Pair of Shoes','Kevin Bowersox','2014-12-07 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(3,1,'Withdrawl','Shirt',100.00,850.00,750.00,'Nice Shirt','Kevin Bowersox','2014-12-08 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(4,1,'Withdrawl','Socks',10.00,750.00,740.00,'Nice Socks','Kevin Bowersox','2014-12-09 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(5,1,'Withdrawl','Tie',40.00,740.00,700.00,'Nice Tie','Kevin Bowersox','2014-12-09 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(6,1,'Withdrawl','Pants',100.00,700.00,600.00,'Nice Pants','Kevin Bowersox','2014-12-10 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(7,1,'Withdrawl','Lunch',20.00,600.00,580.00,'Nice Lunch','Kevin Bowersox','2014-12-11 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(8,1,'Withdrawl','Dinner',30.00,580.00,550.00,'Great Dinner','Kevin Bowersox','2014-12-11 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(9,1,'Withdrawl','Breakfast',10.00,550.00,540.00,'Breakfast at Tiffanys','Kevin Bowersox','2014-12-12 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(10,1,'Withdrawl','Groceries',100.00,540.00,440.00,'Healthy Food','Kevin Bowersox','2014-12-13 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(11,1,'Deposit','Pay Check',1000.00,440.00,1440.00,'Pay Day','Kevin Bowersox','2014-12-14 10:53:30','Kevin Bowersox','2014-12-06 10:53:30'),(12,1,'Deposit','Bonus',500.00,1440.00,1940.00,'Annual Bonus','Kevin Bowersox','2014-12-19 10:53:30','Kevin Bowersox','2014-12-06 10:53:30');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `USER_ID` bigint(20) NOT NULL,
  `ACCOUNT_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`USER_ID`,`ACCOUNT_ID`),
  KEY `ACCOUNT_FK_idx` (`ACCOUNT_ID`),
  CONSTRAINT `ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `account` (`ACCOUNT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `USER_FK` FOREIGN KEY (`USER_ID`) REFERENCES `finances_user` (`USER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_address`
--

DROP TABLE IF EXISTS `user_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_address` (
  `USER_ID` bigint(20) NOT NULL,
  `USER_ADDRESS_LINE_1` varchar(100) NOT NULL,
  `USER_ADDRESS_LINE_2` varchar(100) NOT NULL,
  `CITY` varchar(100) NOT NULL,
  `STATE` varchar(2) NOT NULL,
  `ZIP_CODE` varchar(5) NOT NULL,
  `ADDRESS_TYPE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`USER_ADDRESS_LINE_1`,`USER_ADDRESS_LINE_2`,`CITY`,`STATE`,`ZIP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_address`
--

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_user_credential`
--

DROP TABLE IF EXISTS `v_user_credential`;
/*!50001 DROP VIEW IF EXISTS `v_user_credential`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_user_credential` (
  `user_id` tinyint NOT NULL,
  `FIRST_NAME` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `USERNAME` tinyint NOT NULL,
  `password` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_user_credential`
--

/*!50001 DROP TABLE IF EXISTS `v_user_credential`*/;
/*!50001 DROP VIEW IF EXISTS `v_user_credential`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`infinite`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_credential` AS select `finances_user`.`USER_ID` AS `user_id`,`finances_user`.`FIRST_NAME` AS `FIRST_NAME`,`finances_user`.`LAST_NAME` AS `last_name`,`credential`.`USERNAME` AS `USERNAME`,`credential`.`PASSWORD` AS `password` from (`finances_user` join `credential` on((`finances_user`.`USER_ID` = `credential`.`USER_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-14 10:04:31
