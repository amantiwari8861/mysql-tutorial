-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `category` varchar(233) DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `account_no` int NOT NULL,
  PRIMARY KEY (`account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('saving',290000,111111),('saving',290000,111112),('saving',400000,111122),('saving',2301,111133),('current',280000,111144),('current',70000,111177),('current',90000,111199);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banker`
--

DROP TABLE IF EXISTS `banker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banker` (
  `banker_id` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`banker_id`,`customer_id`),
  KEY `customer2_id_fk` (`customer_id`),
  CONSTRAINT `banker_id_fk` FOREIGN KEY (`banker_id`) REFERENCES `banker_information` (`banker_id`),
  CONSTRAINT `customer2_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banker`
--

LOCK TABLES `banker` WRITE;
/*!40000 ALTER TABLE `banker` DISABLE KEYS */;
INSERT INTO `banker` VALUES (10011,1),(10012,2),(10014,3),(10013,4);
/*!40000 ALTER TABLE `banker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banker_information`
--

DROP TABLE IF EXISTS `banker_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banker_information` (
  `banker_id` int NOT NULL,
  `banker_email` varchar(233) DEFAULT NULL,
  `banker_name` varchar(233) DEFAULT NULL,
  PRIMARY KEY (`banker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banker_information`
--

LOCK TABLES `banker_information` WRITE;
/*!40000 ALTER TABLE `banker_information` DISABLE KEYS */;
INSERT INTO `banker_information` VALUES (10011,'alias@gmail.com','alias'),(10012,'alexa@gmail.com','alexa'),(10013,'varun12s@gmail.com','varun'),(10014,'mohit@gmail.com','mohit');
/*!40000 ALTER TABLE `banker_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrow` (
  `customer_id` int NOT NULL,
  `loan_number` bigint NOT NULL,
  PRIMARY KEY (`customer_id`,`loan_number`),
  KEY `lno_fk` (`loan_number`),
  CONSTRAINT `c_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `lno_fk` FOREIGN KEY (`loan_number`) REFERENCES `loan` (`loan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (1,11),(4,12),(2,13),(3,14);
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `ifsc_code` int NOT NULL,
  `branch_name` varchar(233) DEFAULT NULL,
  `branch_address` varchar(233) DEFAULT NULL,
  PRIMARY KEY (`ifsc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (313131,'hdfc-4 gurugram','sector-102 gurugram'),(414141,'hdfc-3 gurugram','sector 14 gurugram'),(717171,'hdfc-2 gurugram','old dlf colony gurugram'),(818181,'hdfc-1 gurugram','sadar bazar gurugram');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `card_no` int NOT NULL,
  `card_limit` int DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  PRIMARY KEY (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (123123,300000,'2029-12-28'),(123321,200000,'2028-12-11'),(124124,400000,'2028-12-12'),(127127,400000,'2028-07-09'),(128128,70000000,'2027-10-10'),(129129,700000,'2027-12-30');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(233) DEFAULT NULL,
  `customer_street` varchar(77) DEFAULT NULL,
  `customer_city` varchar(233) DEFAULT NULL,
  `mobile_phone` bigint DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'jyoti','acharypuri street no-7','sirsa',987710879),(2,'vaanyaa','acharypuri street no-2','faridabad',888710839),(3,'sidhi','acharypuri street no-4','delhi',7877108221),(4,'mukul','acharypuri street no-8','gurugram',9977101211),(7,'sahil','aggarsain colony street no 8','sirsa',9988771122),(8,'jatin','aggarsain colony stret no.8','sirsa',9878978987),(9,'ram','acharypuri street no-3','rewari',7899001211),(12,'pooja','ram colony stret no.8','sirsa',8888978987);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_credit_card`
--

DROP TABLE IF EXISTS `customer_credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_credit_card` (
  `card_no` int NOT NULL,
  `customer_id` int NOT NULL,
  `Account_no` int DEFAULT NULL,
  PRIMARY KEY (`card_no`,`customer_id`),
  KEY `customer_id_fk` (`customer_id`),
  KEY `Acc_no_fk` (`Account_no`),
  CONSTRAINT `Acc_no_fk` FOREIGN KEY (`Account_no`) REFERENCES `account` (`account_no`),
  CONSTRAINT `card_no_fk` FOREIGN KEY (`card_no`) REFERENCES `credit_card` (`card_no`),
  CONSTRAINT `customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_credit_card`
--

LOCK TABLES `customer_credit_card` WRITE;
/*!40000 ALTER TABLE `customer_credit_card` DISABLE KEYS */;
INSERT INTO `customer_credit_card` VALUES (128128,12,111111),(123321,1,111122),(123123,2,111133),(124124,3,111144),(127127,4,111177),(129129,9,111199);
/*!40000 ALTER TABLE `customer_credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `id_account_card`
--

DROP TABLE IF EXISTS `id_account_card`;
/*!50001 DROP VIEW IF EXISTS `id_account_card`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `id_account_card` AS SELECT 
 1 AS `card_no`,
 1 AS `card_limit`,
 1 AS `expire_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_number` bigint NOT NULL,
  `ammount` bigint DEFAULT NULL,
  PRIMARY KEY (`loan_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (11,200000),(12,240000),(13,220000),(14,210000);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_branch`
--

DROP TABLE IF EXISTS `loan_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_branch` (
  `ifsc_code` int NOT NULL,
  `loan_number` bigint NOT NULL,
  PRIMARY KEY (`ifsc_code`,`loan_number`),
  CONSTRAINT `ifsc_cd_fk` FOREIGN KEY (`ifsc_code`) REFERENCES `branch` (`ifsc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_branch`
--

LOCK TABLES `loan_branch` WRITE;
/*!40000 ALTER TABLE `loan_branch` DISABLE KEYS */;
INSERT INTO `loan_branch` VALUES (313131,11),(414141,11),(717171,13),(818181,12);
/*!40000 ALTER TABLE `loan_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `id_account_card`
--

/*!50001 DROP VIEW IF EXISTS `id_account_card`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `id_account_card` AS select `credit_card`.`card_no` AS `card_no`,`credit_card`.`card_limit` AS `card_limit`,`credit_card`.`expire_date` AS `expire_date` from (`credit_card` join `customer_credit_card` on((`credit_card`.`card_no` = `customer_credit_card`.`card_no`))) order by `customer_credit_card`.`customer_id` */;
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

-- Dump completed on 2024-07-28 17:53:31
