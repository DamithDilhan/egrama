-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: grama_niladari_db
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `log_cultivated_land`
--

DROP TABLE IF EXISTS `log_cultivated_land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_cultivated_land` (
  `ASSESMENT_NUMBER` char(5) NOT NULL,
  `CROPS` varchar(20) NOT NULL,
  `DOM` date NOT NULL,
  KEY `ASSESMENT_NUMBER` (`ASSESMENT_NUMBER`),
  CONSTRAINT `log_cultivated_land_ibfk_1` FOREIGN KEY (`ASSESMENT_NUMBER`) REFERENCES `tbl_property` (`ASSESMENT_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_cultivated_land`
--

LOCK TABLES `log_cultivated_land` WRITE;
/*!40000 ALTER TABLE `log_cultivated_land` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_cultivated_land` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_house`
--

DROP TABLE IF EXISTS `log_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_house` (
  `HASSESMENT_NO` char(5) NOT NULL,
  `ASSESMENT_NUMBER` char(5) NOT NULL,
  `DOM` date NOT NULL,
  KEY `log_house_ibfk_1` (`ASSESMENT_NUMBER`),
  CONSTRAINT `log_house_ibfk_1` FOREIGN KEY (`ASSESMENT_NUMBER`) REFERENCES `tbl_property` (`ASSESMENT_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_house`
--

LOCK TABLES `log_house` WRITE;
/*!40000 ALTER TABLE `log_house` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_person`
--

DROP TABLE IF EXISTS `log_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_person` (
  `ID` char(12) NOT NULL,
  `DOM` date NOT NULL,
  `FNAME` varchar(15) NOT NULL,
  `MNAME` varchar(15) NOT NULL,
  `LNAME` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `ADDRESS` varchar(40) NOT NULL,
  `GENDER` char(1) NOT NULL,
  `MARITAL_STATUS` varchar(8) NOT NULL,
  KEY `ID` (`ID`),
  CONSTRAINT `log_person_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tbl_person` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_person`
--

LOCK TABLES `log_person` WRITE;
/*!40000 ALTER TABLE `log_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_property`
--

DROP TABLE IF EXISTS `log_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_property` (
  `ID` char(12) NOT NULL,
  `ASSESMENT_NUMBER` char(5) NOT NULL,
  `DOM` datetime NOT NULL,
  `ADDRESS` varchar(40) NOT NULL,
  `OWNED_DATE` date NOT NULL,
  `CULTIVATE_FLAG` char(1) NOT NULL,
  `MEAN_INCOME` decimal(12,2) NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  KEY `ID` (`ID`),
  CONSTRAINT `log_property_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tbl_person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_property`
--

LOCK TABLES `log_property` WRITE;
/*!40000 ALTER TABLE `log_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_shop`
--

DROP TABLE IF EXISTS `log_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_shop` (
  `REG_NO` char(5) NOT NULL,
  `ASSESMENT_NUMBER` char(5) NOT NULL,
  `NAME` varchar(15) NOT NULL,
  `DOM` date NOT NULL,
  KEY `log_shop_ibfk_1` (`ASSESMENT_NUMBER`),
  CONSTRAINT `log_shop_ibfk_1` FOREIGN KEY (`ASSESMENT_NUMBER`) REFERENCES `tbl_property` (`ASSESMENT_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_shop`
--

LOCK TABLES `log_shop` WRITE;
/*!40000 ALTER TABLE `log_shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_works`
--

DROP TABLE IF EXISTS `log_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_works` (
  `ID` char(12) NOT NULL,
  `POST` varchar(10) NOT NULL,
  `ADDRESS` varchar(40) NOT NULL,
  `SALARY` decimal(10,2) NOT NULL,
  `DOA` date NOT NULL,
  `DOM` date NOT NULL,
  KEY `log_works_ibfk_1` (`ID`),
  CONSTRAINT `log_works_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tbl_person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_works`
--

LOCK TABLES `log_works` WRITE;
/*!40000 ALTER TABLE `log_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cultivated_land`
--

DROP TABLE IF EXISTS `tbl_cultivated_land`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cultivated_land` (
  `ASSESMENT_NUMBER` char(5) NOT NULL,
  `CROPS` varchar(20) NOT NULL,
  KEY `ASSESMENT_NUMBER` (`ASSESMENT_NUMBER`),
  CONSTRAINT `tbl_cultivated_land_ibfk_1` FOREIGN KEY (`ASSESMENT_NUMBER`) REFERENCES `tbl_property` (`ASSESMENT_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cultivated_land`
--

LOCK TABLES `tbl_cultivated_land` WRITE;
/*!40000 ALTER TABLE `tbl_cultivated_land` DISABLE KEYS */;
INSERT INTO `tbl_cultivated_land` VALUES ('10004','Rice');
/*!40000 ALTER TABLE `tbl_cultivated_land` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_cultivated_land_update` BEFORE UPDATE ON `tbl_cultivated_land` FOR EACH ROW insert into log_cultivated_land values(OLD.ASSESMENT_NUMBER ,OLD.CROPS ,now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_dependent`
--

DROP TABLE IF EXISTS `tbl_dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dependent` (
  `ID` char(12) NOT NULL,
  `NAME` varchar(15) NOT NULL,
  KEY `ID` (`ID`),
  CONSTRAINT `tbl_dependent_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tbl_person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dependent`
--

LOCK TABLES `tbl_dependent` WRITE;
/*!40000 ALTER TABLE `tbl_dependent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_house`
--

DROP TABLE IF EXISTS `tbl_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_house` (
  `HASSESMENT_NO` char(5) NOT NULL,
  `ASSESMENT_NUMBER` char(5) NOT NULL,
  PRIMARY KEY (`HASSESMENT_NO`),
  KEY `ASSESMENT_NUMBER` (`ASSESMENT_NUMBER`),
  CONSTRAINT `tbl_house_ibfk_1` FOREIGN KEY (`ASSESMENT_NUMBER`) REFERENCES `tbl_property` (`ASSESMENT_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_house`
--

LOCK TABLES `tbl_house` WRITE;
/*!40000 ALTER TABLE `tbl_house` DISABLE KEYS */;
INSERT INTO `tbl_house` VALUES ('00021','10034');
/*!40000 ALTER TABLE `tbl_house` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_house_update` BEFORE UPDATE ON `tbl_house` FOR EACH ROW insert into log_house values(OLD.HASSESMENT_NO ,OLD.ASSESMENT_NUMBER ,now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_person`
--

DROP TABLE IF EXISTS `tbl_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_person` (
  `ID` char(12) NOT NULL,
  `FNAME` varchar(15) NOT NULL,
  `MNAME` varchar(15) NOT NULL,
  `LNAME` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `GENDER` char(1) NOT NULL,
  `ADDRESS` varchar(40) NOT NULL,
  `MARITAL_STATUS` varchar(8) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_person`
--

LOCK TABLES `tbl_person` WRITE;
/*!40000 ALTER TABLE `tbl_person` DISABLE KEYS */;
INSERT INTO `tbl_person` VALUES ('651245963V','Anil','Asoka','Perera','1965-10-27','M','No127,Welegedara,Dapiligoda','Married'),('701562364V','Nirmali','Ayesha','Perera','1970-02-15','F','No127,Welegedara,Dapiligoda','Married'),('882456361V','Dewmini','Lochana','Hewage','1988-04-20','F','No20,BaduraliyaPara,Dapiligoda','Single'),('905678129V','Kavindu','Rukshan','Kaluarachchi','1990-05-28','M','Siriniwasa,Maddepara,Dapiligoda','Single');
/*!40000 ALTER TABLE `tbl_person` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_person_update` BEFORE UPDATE ON `tbl_person` FOR EACH ROW insert into log_person values(OLD.id ,now() ,OLD.FNAME ,OLD.MNAME ,OLD.LNAME ,OLD.DOB ,OLD.ADDRESS ,OLD.GENDER ,OLD.MARITAL_STATUS) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_property`
--

DROP TABLE IF EXISTS `tbl_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_property` (
  `ASSESMENT_NUMBER` char(5) NOT NULL,
  `ID` char(12) NOT NULL,
  `OWNED_DATE` date NOT NULL,
  `ADDRESS` varchar(40) NOT NULL,
  `CULTIVATE_FLAG` char(1) NOT NULL,
  `MEAN_INCOME` decimal(12,2) NOT NULL,
  `STATUS` varchar(20) NOT NULL,
  PRIMARY KEY (`ASSESMENT_NUMBER`),
  KEY `ID` (`ID`),
  CONSTRAINT `tbl_property_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tbl_person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_property`
--

LOCK TABLES `tbl_property` WRITE;
/*!40000 ALTER TABLE `tbl_property` DISABLE KEYS */;
INSERT INTO `tbl_property` VALUES ('10002','905678129V','2020-01-05','No32,BaduraliyaPara,Dapiligoda','N',15000.00,''),('10004','651245963V','1980-06-20','Maddepara,Dapiligoda','Y',5000.00,''),('10034','651245963V','2000-03-08','No21,BaduraliyaPara,Dapiligoda','N',15000.00,'Rent');
/*!40000 ALTER TABLE `tbl_property` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_property_update` BEFORE UPDATE ON `tbl_property` FOR EACH ROW insert into log_property (id ,ASSESMENT_NUMBER ,dom ,ADDRESS ,OWNED_DATE,CULTIVATE_FLAG ,MEAN_INCOME ,STATUS) values(OLD.ID ,OLD.ASSESMENT_NUMBER ,now() ,OLD.ADDRESS ,OLD.OWNED_DATE ,OLD.CULTIVATE_FLAG ,OLD.MEAN_INCOME ,OLD.STATUS) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_relation`
--

DROP TABLE IF EXISTS `tbl_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_relation` (
  `ID` char(12) NOT NULL,
  `PID` char(12) NOT NULL,
  `STATUS` varchar(10) NOT NULL,
  KEY `tbl_relation_ibfk_1` (`ID`),
  CONSTRAINT `tbl_relation_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tbl_person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_relation`
--

LOCK TABLES `tbl_relation` WRITE;
/*!40000 ALTER TABLE `tbl_relation` DISABLE KEYS */;
INSERT INTO `tbl_relation` VALUES ('651245963V','701562364V','Wife'),('701562364V','651245963V','Husband');
/*!40000 ALTER TABLE `tbl_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shop`
--

DROP TABLE IF EXISTS `tbl_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_shop` (
  `REG_NO` char(5) NOT NULL,
  `ASSESMENT_NUMBER` char(5) NOT NULL,
  `NAME` varchar(15) NOT NULL,
  PRIMARY KEY (`REG_NO`),
  KEY `ASSESMENT_NUMBER` (`ASSESMENT_NUMBER`),
  CONSTRAINT `tbl_shop_ibfk_1` FOREIGN KEY (`ASSESMENT_NUMBER`) REFERENCES `tbl_property` (`ASSESMENT_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shop`
--

LOCK TABLES `tbl_shop` WRITE;
/*!40000 ALTER TABLE `tbl_shop` DISABLE KEYS */;
INSERT INTO `tbl_shop` VALUES ('00134','10002','Kavindu Stores');
/*!40000 ALTER TABLE `tbl_shop` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_shop_update` BEFORE UPDATE ON `tbl_shop` FOR EACH ROW insert into log_shop values(OLD.REG_NO ,OLD.ASSESMENT_NUMBER ,OLD.NAME ,now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_works`
--

DROP TABLE IF EXISTS `tbl_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_works` (
  `ID` char(12) NOT NULL,
  `POST` varchar(10) NOT NULL,
  `ADDRESS` varchar(40) NOT NULL,
  `SALARY` decimal(10,2) NOT NULL,
  `DOA` date NOT NULL COMMENT 'Date of appointment',
  PRIMARY KEY (`ID`(5)),
  KEY `tbl_works_ibfk_1` (`ID`),
  CONSTRAINT `tbl_works_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `tbl_person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_works`
--

LOCK TABLES `tbl_works` WRITE;
/*!40000 ALTER TABLE `tbl_works` DISABLE KEYS */;
INSERT INTO `tbl_works` VALUES ('651245963V','Farmer','',0.00,'0000-00-00'),('882456361V','Cashier','BOC,Agalawatta',38000.00,'2012-01-03'),('905678129V','Merchant','No32,BaduraliyaPara,Dapiligoda',0.00,'0000-00-00');
/*!40000 ALTER TABLE `tbl_works` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_works_update` BEFORE UPDATE ON `tbl_works` FOR EACH ROW insert into log_works values(OLD.ID ,OLD.POST ,OLD.ADDRESS ,OLD.SALARY ,OLD.DOA,now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-11 22:02:05
