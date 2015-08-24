-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: inventar
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `Id_Address` int(11) NOT NULL AUTO_INCREMENT,
  `Street` varchar(100) DEFAULT NULL,
  `StreetNumber` varchar(8) DEFAULT NULL,
  `Plz` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `IsoCountry` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Id_Address`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (15,'Hintermwäldli','3 c','9015','St. Gallen','CH'),(16,'Hauptstrasse','15 a','9000','St. Gallen','CH'),(12,'Hauptstrasse','15 b','9000','St. Gallen','CH'),(13,'Rue des Alpes','2','1700','Fribourg','CH'),(14,'Brooklyn','23W4c','18278','New York City NY','US'),(1,'Musterstrasse','1','9000','St. Gallen','CH'),(2,'Musterstrasse','2','9000','St. Gallen','CH'),(3,'Musterstrasse','3','9000','St. Gallen','CH'),(4,'Musterstrasse','4','9000','St. Gallen','CH'),(5,'Rechnungsstrasse','5','9000','St. Gallen','CH'),(6,'Rechnungsstrasse','6','9000','St. Gallen','CH'),(7,'Rechnungsstrasse','7','9000','St. Gallen','CH'),(8,'Rechnungsstrasse','8','9000','St. Gallen','CH'),(9,'Bahnhofstrasse','6','9000','St. Gallen','CH'),(10,'Rechnungsstrasse','10','9000','St. Gallen','CH'),(11,'Lafayette Street','200','10003','New York','US');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication`
--

DROP TABLE IF EXISTS `communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communication` (
  `ID_Person` int(11) NOT NULL,
  `ID_CommunicationType` int(11) NOT NULL,
  `CommunicationDetail` varchar(80) NOT NULL,
  PRIMARY KEY (`ID_Person`,`ID_CommunicationType`),
  KEY `ID_CommunicationType` (`ID_CommunicationType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication`
--

LOCK TABLES `communication` WRITE;
/*!40000 ALTER TABLE `communication` DISABLE KEYS */;
INSERT INTO `communication` VALUES (10,1,'+41553283232'),(10,2,'jemand@microsoft.com'),(10,3,'echo123'),(10,4,'uESfxauij5tSx8KGu3mA3YB7cJsQqQ');
/*!40000 ALTER TABLE `communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communicationtype`
--

DROP TABLE IF EXISTS `communicationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communicationtype` (
  `ID_CommunicationType` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CommunicationType`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communicationtype`
--

LOCK TABLES `communicationtype` WRITE;
/*!40000 ALTER TABLE `communicationtype` DISABLE KEYS */;
INSERT INTO `communicationtype` VALUES (1,'Direct Phone'),(2,'E-Mail'),(3,'Skype'),(4,'Push Notification Key');
/*!40000 ALTER TABLE `communicationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential` (
  `ID_Credential` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Customer` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `SNMP_Community` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Credential`),
  KEY `ID_Customer` (`ID_Customer`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES (1,1,'elias.schwarz','734hgsue4','234562dsaf'),(2,1,'melanie.mueller','asdf','dsafewr234'),(3,1,'hans.eberle','1234','234sa4dasf'),(4,1,'marcel.signer','','234sdfawer');
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `ID_Customer` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `ID_InvoiceAddress` int(11) DEFAULT NULL,
  `ID_Address` int(11) NOT NULL,
  `InvoiceThreshold` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Customer`),
  KEY `ID_InvoiceAddress` (`ID_InvoiceAddress`),
  KEY `ID_Address` (`ID_Address`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'GemDat Informatik AG',9,10,NULL),(2,'Testfirma',3,9,NULL),(3,'Meisterfirma',2,10,NULL),(4,'asdf',NULL,0,NULL),(9,'asdfdsaf',NULL,0,NULL),(10,'asdfdsaf',NULL,0,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `ID_Device` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DeviceType` int(11) NOT NULL,
  `ID_Location` int(11) NOT NULL,
  `Hostname` varchar(100) DEFAULT NULL,
  `SerialNumber` varchar(100) DEFAULT NULL,
  `IsPhysical` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_Device`),
  KEY `ID_Location` (`ID_Location`),
  KEY `ID_DeviceType` (`ID_DeviceType`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,1,1,'Main Switch','34054-4353-34534',1),(2,1,1,'L3-Switch','34054-4353-4534',1),(3,2,2,'My Router','45345-53453-345-345',1),(4,2,2,'Router 2','564564-453-453',0),(5,3,3,'WLAN 1','453-3453-3453-45',1),(6,3,3,'WLAN 2','43545-3453-5433',1),(7,4,4,'Printer 1','4534-345345-3453',1),(8,4,4,'Printer 2','45345-45-453-44',1),(9,5,1,'WS 1','54353-34534-3453-345',1),(10,5,1,'WS 2','345345-3453-34534-345',1),(11,6,2,'App-Server','4567-767-67676',1),(12,6,2,'Test Server','45f56-767-767',0),(28,1,1,NULL,NULL,NULL),(27,1,1,NULL,NULL,NULL),(26,1,1,NULL,NULL,NULL),(25,1,1,NULL,NULL,NULL),(24,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicecategory`
--

DROP TABLE IF EXISTS `devicecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicecategory` (
  `ID_DeviceCategory` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) DEFAULT NULL,
  `ValidFrom` date DEFAULT NULL,
  `ValidTo` date DEFAULT NULL,
  `Inactiv` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_DeviceCategory`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicecategory`
--

LOCK TABLES `devicecategory` WRITE;
/*!40000 ALTER TABLE `devicecategory` DISABLE KEYS */;
INSERT INTO `devicecategory` VALUES (1,'Switch',NULL,NULL,0),(2,'Router',NULL,NULL,0),(3,'WLAN Accesspoint',NULL,NULL,0),(4,'Printer',NULL,NULL,0),(5,'Workstation',NULL,NULL,0),(6,'Server',NULL,NULL,0);
/*!40000 ALTER TABLE `devicecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicemachine`
--

DROP TABLE IF EXISTS `devicemachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicemachine` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `Processors` varchar(100) DEFAULT NULL,
  `RAM` varchar(100) DEFAULT NULL,
  `StorageSize` varchar(100) DEFAULT NULL,
  `GPU` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicemachine`
--

LOCK TABLES `devicemachine` WRITE;
/*!40000 ALTER TABLE `devicemachine` DISABLE KEYS */;
INSERT INTO `devicemachine` VALUES (11,'Intel Core i7-5960X','12 GB','4 TB','Asus Geforce GTX 960 STRIX'),(12,'AMD FX-9590','8 GB','2 TB','Sapphire Radeon R9 285 Dual-X OC');
/*!40000 ALTER TABLE `devicemachine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviceprinter`
--

DROP TABLE IF EXISTS `deviceprinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceprinter` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `resolution` varchar(100) DEFAULT NULL,
  `pagesPerMinute` decimal(10,0) DEFAULT NULL,
  `isColorPrinter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceprinter`
--

LOCK TABLES `deviceprinter` WRITE;
/*!40000 ALTER TABLE `deviceprinter` DISABLE KEYS */;
INSERT INTO `deviceprinter` VALUES (7,'4800x2400 dpi',41,0),(8,'9600x2400 dpi',25,1);
/*!40000 ALTER TABLE `deviceprinter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicerouter`
--

DROP TABLE IF EXISTS `devicerouter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicerouter` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicerouter`
--

LOCK TABLES `devicerouter` WRITE;
/*!40000 ALTER TABLE `devicerouter` DISABLE KEYS */;
INSERT INTO `devicerouter` VALUES (3,'1. Stock links'),(4,'Serverraum');
/*!40000 ALTER TABLE `devicerouter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviceswitch`
--

DROP TABLE IF EXISTS `deviceswitch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviceswitch` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `isPoESupported` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceswitch`
--

LOCK TABLES `deviceswitch` WRITE;
/*!40000 ALTER TABLE `deviceswitch` DISABLE KEYS */;
INSERT INTO `deviceswitch` VALUES (1,0),(2,0);
/*!40000 ALTER TABLE `deviceswitch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicetype`
--

DROP TABLE IF EXISTS `devicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicetype` (
  `ID_DeviceType` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DeviceCategory` int(11) NOT NULL,
  `Manufacturer` varchar(100) DEFAULT NULL,
  `ManufacturerNumber` varchar(100) DEFAULT NULL,
  `NumInterfaces` int(11) NOT NULL,
  `ID_Rate` int(11) DEFAULT NULL,
  `ID_MediumType` int(11) NOT NULL DEFAULT '1',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`),
  KEY `ID_DeviceCategory` (`ID_DeviceCategory`),
  KEY `ID_Rate` (`ID_Rate`),
  KEY `ID_MediumType` (`ID_MediumType`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicetype`
--

LOCK TABLES `devicetype` WRITE;
/*!40000 ALTER TABLE `devicetype` DISABLE KEYS */;
INSERT INTO `devicetype` VALUES (1,1,'Cisco','CS4582',5,NULL,1,NULL),(2,2,'DELL','D-388',0,NULL,1,NULL),(3,3,'HP','H-2600',0,NULL,1,NULL),(4,4,'Canon','CN1234',0,NULL,1,NULL),(5,5,'Dell','D-2050',0,NULL,1,NULL),(6,6,'Dell','D-4093',0,NULL,1,NULL);
/*!40000 ALTER TABLE `devicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicewlanaccesspoint`
--

DROP TABLE IF EXISTS `devicewlanaccesspoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicewlanaccesspoint` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `ID_WLANStandard` int(11) DEFAULT NULL,
  `AntennaType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`),
  KEY `ID_WLANStandard` (`ID_WLANStandard`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicewlanaccesspoint`
--

LOCK TABLES `devicewlanaccesspoint` WRITE;
/*!40000 ALTER TABLE `devicewlanaccesspoint` DISABLE KEYS */;
INSERT INTO `devicewlanaccesspoint` VALUES (5,3,'Omnidirectional'),(6,7,'Directional');
/*!40000 ALTER TABLE `devicewlanaccesspoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `ID_Invoice` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceDate` date DEFAULT NULL,
  `ID_Customer` int(11) NOT NULL,
  `Closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Invoice`),
  KEY `ID_Customer` (`ID_Customer`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'2015-08-18',1,1),(2,'2015-08-18',2,1),(3,NULL,3,0),(4,NULL,2,0),(5,'2015-07-30',1,1),(6,NULL,1,0),(7,NULL,4,0),(8,NULL,9,0),(9,NULL,10,0);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoiceposition`
--

DROP TABLE IF EXISTS `invoiceposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoiceposition` (
  `ID_InvoicePosition` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Invoice` int(11) NOT NULL,
  `ID_ServiceType` int(11) DEFAULT NULL,
  `Amount` decimal(10,0) NOT NULL,
  `Price` decimal(11,0) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ID_Networkinterface` int(11) DEFAULT NULL,
  `ID_Device` int(11) DEFAULT NULL,
  `ID_Location` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_InvoicePosition`),
  KEY `ID_Invoice` (`ID_Invoice`),
  KEY `ID_ServiceType` (`ID_ServiceType`),
  KEY `ID_Networkinterface` (`ID_Networkinterface`),
  KEY `ID_Device` (`ID_Device`),
  KEY `ID_Location` (`ID_Location`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoiceposition`
--

LOCK TABLES `invoiceposition` WRITE;
/*!40000 ALTER TABLE `invoiceposition` DISABLE KEYS */;
INSERT INTO `invoiceposition` VALUES (1,1,1,100,NULL,'Fahrtweg zu Kunde',NULL,NULL,NULL),(2,1,1,3,NULL,'Installation Gerät XYZ',NULL,NULL,NULL),(3,1,2,1,600,'Gerät XYZ',NULL,NULL,NULL),(4,2,NULL,1,6000,NULL,NULL,NULL,NULL),(5,5,NULL,1,1100,NULL,NULL,NULL,NULL),(6,4,NULL,1,500,'TestMK',NULL,NULL,NULL);
/*!40000 ALTER TABLE `invoiceposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `ID_Location` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pod` int(11) NOT NULL,
  `ID_Address` int(11) NOT NULL,
  `ID_ParentLocation` int(11) DEFAULT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Location`),
  KEY `ID_Pod` (`ID_Pod`),
  KEY `ID_Address` (`ID_Address`),
  KEY `ID_ParentLocation` (`ID_ParentLocation`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1,11,NULL,'Uno'),(2,1,12,1,'Duett'),(3,2,11,NULL,'Tresses'),(4,3,14,NULL,'Quattro');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `ID_Log` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Severity` int(11) DEFAULT NULL,
  `Message` varchar(1000) DEFAULT NULL,
  `ID_Device` int(11) NOT NULL,
  `Acknowledged` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Log`),
  KEY `ID_Device` (`ID_Device`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (6,'2015-08-12 16:56:28',3,'Is was passiert.',5,0),(7,'2015-08-12 16:57:04',1,'Is was wichtiges passiert.',6,0);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediumtype`
--

DROP TABLE IF EXISTS `mediumtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediumtype` (
  `ID_MediumType` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `Speed` int(11) DEFAULT NULL,
  `FullDuplex` tinyint(4) NOT NULL DEFAULT '1',
  `Technology` varchar(100) NOT NULL DEFAULT '1000BASE-T',
  PRIMARY KEY (`ID_MediumType`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediumtype`
--

LOCK TABLES `mediumtype` WRITE;
/*!40000 ALTER TABLE `mediumtype` DISABLE KEYS */;
INSERT INTO `mediumtype` VALUES (1,'RJ-45 CAT6',NULL,1,'1000BASE-T');
/*!40000 ALTER TABLE `mediumtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `networkinterface`
--

DROP TABLE IF EXISTS `networkinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `networkinterface` (
  `ID_Networkinterface` int(11) NOT NULL AUTO_INCREMENT,
  `Physical` tinyint(1) DEFAULT NULL,
  `IPv4_Address` int(10) unsigned DEFAULT NULL,
  `IPv6_Address` varbinary(16) DEFAULT NULL,
  `ID_Device` int(11) NOT NULL,
  `PortNr` int(11) DEFAULT NULL,
  `ID_MediumType` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Networkinterface`),
  KEY `ID_Device` (`ID_Device`),
  KEY `ID_MediumType` (`ID_MediumType`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `networkinterface`
--

LOCK TABLES `networkinterface` WRITE;
/*!40000 ALTER TABLE `networkinterface` DISABLE KEYS */;
INSERT INTO `networkinterface` VALUES (1,1,NULL,NULL,1,NULL,1),(2,1,NULL,NULL,1,NULL,0),(3,1,NULL,NULL,1,NULL,0),(4,1,NULL,NULL,1,NULL,0),(5,1,NULL,NULL,1,NULL,0),(6,1,3232239617,NULL,3,NULL,0),(7,1,3232239873,NULL,3,NULL,0),(8,1,NULL,NULL,2,NULL,0),(9,1,NULL,NULL,2,NULL,0),(10,1,NULL,NULL,2,NULL,0),(11,1,NULL,NULL,2,NULL,0),(12,1,NULL,NULL,2,NULL,0),(13,1,3232240126,NULL,4,NULL,0),(14,1,3232241918,NULL,4,NULL,0),(15,1,NULL,NULL,5,NULL,0),(16,1,NULL,NULL,6,NULL,0),(17,1,3232239877,NULL,7,NULL,0),(18,1,3232239623,NULL,8,NULL,0),(19,1,NULL,NULL,9,NULL,0),(20,1,NULL,NULL,10,NULL,0),(21,1,3232239875,NULL,11,NULL,0),(22,1,3232239876,NULL,12,NULL,0),(23,1,NULL,NULL,12,23,1),(24,NULL,NULL,NULL,24,5,NULL),(25,NULL,NULL,NULL,24,4,NULL),(26,NULL,NULL,NULL,24,3,NULL),(27,NULL,NULL,NULL,24,2,NULL),(28,NULL,NULL,NULL,24,1,NULL),(29,NULL,NULL,NULL,25,5,NULL),(30,NULL,NULL,NULL,25,4,NULL),(31,NULL,NULL,NULL,25,3,NULL),(32,NULL,NULL,NULL,25,2,NULL),(33,NULL,NULL,NULL,25,1,NULL),(34,NULL,NULL,NULL,26,5,NULL),(35,NULL,NULL,NULL,26,4,NULL),(36,NULL,NULL,NULL,26,3,NULL),(37,NULL,NULL,NULL,26,2,NULL),(38,NULL,NULL,NULL,26,1,NULL),(39,NULL,NULL,NULL,27,5,NULL),(40,NULL,NULL,NULL,27,4,NULL),(41,NULL,NULL,NULL,27,3,NULL),(42,NULL,NULL,NULL,27,2,NULL),(43,NULL,NULL,NULL,27,1,NULL),(44,NULL,NULL,NULL,28,5,NULL),(45,NULL,NULL,NULL,28,4,NULL),(46,NULL,NULL,NULL,28,3,NULL),(47,NULL,NULL,NULL,28,2,NULL),(48,NULL,NULL,NULL,28,1,NULL);
/*!40000 ALTER TABLE `networkinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `ID_Payment` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Customer` int(11) NOT NULL,
  `Amount` decimal(10,0) NOT NULL,
  `PaymentDate` date NOT NULL,
  PRIMARY KEY (`ID_Payment`),
  KEY `ID_Customer` (`ID_Customer`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,100,'2001-01-20');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `ID_Person` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `SurName` varchar(100) DEFAULT NULL,
  `ID_Address` int(11) NOT NULL,
  PRIMARY KEY (`ID_Person`),
  KEY `ID_Address` (`ID_Address`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Elias','Schwarz',1),(2,'Nadine','Müller',2),(3,'Peter','Mittelholzer',3),(4,'Melanie','Egger',4),(10,'Gottfried','Mayer',10);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pod`
--

DROP TABLE IF EXISTS `pod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pod` (
  `ID_Pod` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Customer` int(11) NOT NULL,
  `ID_ContactPerson` int(11) NOT NULL,
  `TimeZone` varchar(50) DEFAULT 'Europe/Zurich',
  PRIMARY KEY (`ID_Pod`),
  KEY `ID_Customer` (`ID_Customer`),
  KEY `ID_ContactPerson` (`ID_ContactPerson`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pod`
--

LOCK TABLES `pod` WRITE;
/*!40000 ALTER TABLE `pod` DISABLE KEYS */;
INSERT INTO `pod` VALUES (1,1,10,'Europe/Zurich'),(2,3,1,'Europe/Zurich'),(3,3,10,'Europe/Zurich');
/*!40000 ALTER TABLE `pod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `ID_Rate` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ServiceType` int(11) DEFAULT NULL,
  `ID_Unit` int(11) DEFAULT NULL,
  `Price` decimal(10,0) NOT NULL,
  `ValidFrom` date NOT NULL,
  `ValidTo` date DEFAULT NULL,
  PRIMARY KEY (`ID_Rate`),
  KEY `ID_Unit` (`ID_Unit`),
  KEY `ID_ServiceType` (`ID_ServiceType`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
INSERT INTO `rate` VALUES (1,1,1,180,'2001-01-20','2031-12-20'),(2,1,1,200,'2001-01-20',NULL),(3,3,3,3,'2001-01-20',NULL);
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reldevicecredential`
--

DROP TABLE IF EXISTS `reldevicecredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reldevicecredential` (
  `ID_Device` int(11) NOT NULL,
  `ID_Credential` int(11) NOT NULL,
  PRIMARY KEY (`ID_Device`,`ID_Credential`),
  KEY `ID_Credential` (`ID_Credential`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reldevicecredential`
--

LOCK TABLES `reldevicecredential` WRITE;
/*!40000 ALTER TABLE `reldevicecredential` DISABLE KEYS */;
INSERT INTO `reldevicecredential` VALUES (1,1),(2,1),(3,3);
/*!40000 ALTER TABLE `reldevicecredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relnetworkinterface`
--

DROP TABLE IF EXISTS `relnetworkinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relnetworkinterface` (
  `ID_RelNetworkinterface` int(11) NOT NULL AUTO_INCREMENT,
  `ID_NetworkinterfaceA` int(11) NOT NULL,
  `ID_NetworkinterfaceB` int(11) NOT NULL,
  PRIMARY KEY (`ID_RelNetworkinterface`),
  KEY `ID_NetworkinterfaceA` (`ID_NetworkinterfaceA`),
  KEY `ID_NetworkinterfaceB` (`ID_NetworkinterfaceB`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relnetworkinterface`
--

LOCK TABLES `relnetworkinterface` WRITE;
/*!40000 ALTER TABLE `relnetworkinterface` DISABLE KEYS */;
INSERT INTO `relnetworkinterface` VALUES (1,1,8),(2,2,18),(3,3,19),(4,4,20),(5,5,6),(6,7,15),(7,9,21),(8,10,22),(9,11,17),(10,12,13),(11,14,16);
/*!40000 ALTER TABLE `relnetworkinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relnetworkinterfacevlan`
--

DROP TABLE IF EXISTS `relnetworkinterfacevlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relnetworkinterfacevlan` (
  `ID_RelNetworkinterface` int(11) NOT NULL,
  `ID_VLAN` int(11) NOT NULL,
  PRIMARY KEY (`ID_RelNetworkinterface`,`ID_VLAN`),
  KEY `ID_VLAN` (`ID_VLAN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relnetworkinterfacevlan`
--

LOCK TABLES `relnetworkinterfacevlan` WRITE;
/*!40000 ALTER TABLE `relnetworkinterfacevlan` DISABLE KEYS */;
INSERT INTO `relnetworkinterfacevlan` VALUES (8,1),(10,1),(11,1);
/*!40000 ALTER TABLE `relnetworkinterfacevlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicetype`
--

DROP TABLE IF EXISTS `servicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicetype` (
  `ID_ServiceType` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `ValidFrom` date NOT NULL,
  `ValidTo` date DEFAULT NULL,
  PRIMARY KEY (`ID_ServiceType`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicetype`
--

LOCK TABLES `servicetype` WRITE;
/*!40000 ALTER TABLE `servicetype` DISABLE KEYS */;
INSERT INTO `servicetype` VALUES (1,'Arbeitszeit','2001-01-20',NULL),(2,'Material','2001-01-20',NULL),(3,'Fahrtweg','2001-01-20',NULL);
/*!40000 ALTER TABLE `servicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `ID_Unit` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `Abbreviation` varchar(5) NOT NULL,
  PRIMARY KEY (`ID_Unit`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'Stunde','h'),(2,'Stück','Stk.'),(3,'Kilometer','km');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_devicecatalog`
--

DROP TABLE IF EXISTS `v_devicecatalog`;
/*!50001 DROP VIEW IF EXISTS `v_devicecatalog`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_devicecatalog` AS SELECT 
 1 AS `Manufacturer`,
 1 AS `TypeDescription`,
 1 AS `NumInterfaces`,
 1 AS `Speed`,
 1 AS `FullDuplex`,
 1 AS `Technology`,
 1 AS `Description`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_invoices`
--

DROP TABLE IF EXISTS `v_invoices`;
/*!50001 DROP VIEW IF EXISTS `v_invoices`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_invoices` AS SELECT 
 1 AS `ID_Invoice`,
 1 AS `InvoiceDate`,
 1 AS `ID_Customer`,
 1 AS `Closed`,
 1 AS `BetragOhneGutschrift`,
 1 AS `BetragMitGutschrift`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_logentries`
--

DROP TABLE IF EXISTS `v_logentries`;
/*!50001 DROP VIEW IF EXISTS `v_logentries`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_logentries` AS SELECT 
 1 AS `id`,
 1 AS `pod`,
 1 AS `location`,
 1 AS `hostname`,
 1 AS `severity`,
 1 AS `timestamp`,
 1 AS `message`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_usageperlocation`
--

DROP TABLE IF EXISTS `v_usageperlocation`;
/*!50001 DROP VIEW IF EXISTS `v_usageperlocation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_usageperlocation` AS SELECT 
 1 AS `id_location`,
 1 AS `ID_DeviceType`,
 1 AS `Usage`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_usageperpod`
--

DROP TABLE IF EXISTS `v_usageperpod`;
/*!50001 DROP VIEW IF EXISTS `v_usageperpod`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_usageperpod` AS SELECT 
 1 AS `id_pod`,
 1 AS `Usage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vlan`
--

DROP TABLE IF EXISTS `vlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vlan` (
  `ID_Vlan` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Location` int(11) NOT NULL,
  `Identifier` int(11) NOT NULL,
  `RangeStartIP4` int(10) unsigned DEFAULT NULL,
  `RangeSubnetMask4` int(10) unsigned DEFAULT NULL,
  `RangeDefaultGateway4` int(10) unsigned DEFAULT NULL,
  `RangeStartIP6` varbinary(16) DEFAULT NULL,
  `RangeLength6` int(10) unsigned DEFAULT NULL,
  `RangeDefaultGateway6` varbinary(16) DEFAULT NULL,
  PRIMARY KEY (`ID_Vlan`),
  KEY `ID_Location` (`ID_Location`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vlan`
--

LOCK TABLES `vlan` WRITE;
/*!40000 ALTER TABLE `vlan` DISABLE KEYS */;
INSERT INTO `vlan` VALUES (1,1,15,3232235522,4294967040,3232235521,NULL,1024,NULL);
/*!40000 ALTER TABLE `vlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wlanstandard`
--

DROP TABLE IF EXISTS `wlanstandard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wlanstandard` (
  `ID_WLANStandard` int(11) NOT NULL AUTO_INCREMENT,
  `Designation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_WLANStandard`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wlanstandard`
--

LOCK TABLES `wlanstandard` WRITE;
/*!40000 ALTER TABLE `wlanstandard` DISABLE KEYS */;
INSERT INTO `wlanstandard` VALUES (1,'802.11'),(2,'802.11a'),(3,'802.11a'),(4,'802.11g'),(5,'802.11n'),(6,'802.11ac'),(7,'802.11ad');
/*!40000 ALTER TABLE `wlanstandard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'inventar'
--
/*!50003 DROP FUNCTION IF EXISTS `BetragRechnungMitGutschrift_F` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `BetragRechnungMitGutschrift_F`(ID_Invoice int) RETURNS decimal(10,0)
begin
declare sumRechnungen decimal;
declare sumPayments decimal;
declare AmountAktuelleRechnung decimal;
declare differenz decimal;
declare result decimal;

set AmountAktuelleRechnung = BetragRechnungOhneGutschrift_F(ID_Invoice);

 select  ifnull(Sum(ifnull(ip.Price, ifnull(r.Price, 0)) * Amount), 0) into sumRechnungen
		   from InvoicePosition ip
		   join invoice i on ip.id_invoice = i.id_invoice
           left join Rate r
             on r.ID_ServiceType = ip.ID_ServiceType
             and ValidFrom <= InvoiceDate and ifnull(ValidTo, '01.01.2050') <= InvoiceDate
             
		   where i.id_customer = (select i2.id_customer from invoice i2 where i2.id_invoice = ID_Invoice);


select  
  ifnull(sum(amount), 0) into sumPayments
from 
  payment p
join customer c
  on p.id_customer = c.id_customer
join invoice i
  on i.id_customer = c.id_customer
  where i.id_invoice = ID_Invoice and p.PaymentDate <= i.InvoiceDate;

set differenz = sumRechnungen - sumPayments;

if differenz <= 0 then
  set result = 0;
elseif differenz <= AmountAktuelleRechnung then
  set result = AmountAktuelleRechnung - differenz;
else 
  set result = AmountAktuelleRechnung;
end if;

return result;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `BetragRechnungOhneGutschrift_F` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE FUNCTION `BetragRechnungOhneGutschrift_F`(ID_Invoice int) RETURNS decimal(10,0)
    READS SQL DATA
begin
declare sum decimal;
declare curdate datetime;
set curdate = curdate();
 select  ifnull(Sum(ifnull(ip.Price, ifnull(r.Price, 0)) * Amount), 0) into sum
		   from InvoicePosition ip
           left join Rate r
             on r.ID_ServiceType = ip.ID_ServiceType
             and ValidFrom <= curdate and ifnull(ValidTo, curdate) <= curdate
             
		   where ip.ID_Invoice = ID_Invoice;
           
return sum;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_DeviceAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `P_DeviceAdd`(in ID_Location int, in ID_DeviceType int, in NumDevice int)
begin
  declare DeviceCounter int default 0;
  declare ID_Device int default 0;
  declare InterfaceCounter int default 0;

  WHILE DeviceCounter < NumDevice DO
	
    insert into device(ID_DeviceType, ID_Location)
    values(ID_DeviceType, ID_Location);
    
    SET ID_Device =  LAST_INSERT_ID();
    
    set InterfaceCounter = (
    select 
      d.NumInterfaces
	from
      DeviceType d
	where 
      d.ID_DeviceType = ID_DeviceType);
    
    
    WHILE InterfaceCounter > 0 DO
    
	  insert into Networkinterface(ID_Device, PortNr)
      values(ID_Device, InterfaceCounter);
	  SET InterfaceCounter = InterfaceCounter - 1;
      
    END WHILE;
    
    SET DeviceCounter = DeviceCounter + 1;
  END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_LogClear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `P_LogClear`(in Id int)
begin
  if exists(select 'x' from Log where ID_Log = Id and Acknowledged = 0) then
    update Log set Acknowledged = 1 where ID_Log = Id;
  else
    SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Id not found or already acknowledged.';
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_LogMessageAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `P_LogMessageAdd`(in ID_Pod int, in Hostname varchar(100), in Severity int, in Message varchar(1000))
begin
  declare ID_Device int;
  Set ID_Device = null;
  Select d.ID_Device into ID_Device
	from Device d
    join Location l on l.ID_Location = d.ID_Location
    join POD p on p.ID_POD = l.ID_POD
    where d.Hostname = Hostname
    and p.ID_POD = ID_Pod;
  if ID_Device is not null then
	insert into Log(ID_Device,Severity,Message)
		values (ID_Device,Severity,Message);
  else
	SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Could not find Device with this Hostname and POD.';
  END if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_NightlyInvoicing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `P_NightlyInvoicing`()
begin
SET SQL_SAFE_UPDATES = 0;

  update Invoice i
    set InvoiceDate = CURDATE(),
        Closed = 1
    where (BetragRechnungOhneGutschrift_F(i.id_invoice) > 
             (select ifnull(InvoiceThreshold, 5000) 
             from Customer c where c.ID_Customer = i.ID_Customer))
		OR (
        (BetragRechnungOhneGutschrift_F(i.id_invoice) > 1000)
             AND 30 = DAYOFMONTH(CURDATE())) and i.closed = 0;
             
             
  insert into invoice(ID_Customer, InvoiceDate, Closed)
  select ID_Customer, null, 0
  from Customer c
  where not exists(select 'x' from Invoice i where i.ID_Customer = c.ID_Customer and Closed = 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_PodBill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_PodBill`(id_pod int)
begin
declare id_invoice int;


  if exists(select 'x' from invoiceposition ip 
                       join invoice i on ip.id_invoice = i.id_invoice
                       join location l on ip.id_location = l.id_location
                       where l.id_pod = id_pod and i.closed = 0) then
  
    insert into invoice(ID_Customer, InvoiceDate, Closed)
      select ID_Customer, curdate(), 1
      from Customer c
      join pod p on c.id_customer = p.id_customer
      where p.id_pod = id_pod;
      
	set id_invoice = LAST_INSERT_ID();
      
	update invoiceposition ip 
    set ip.id_invoice = id_invoice
    where exists(select 'x' from invoice i join location l on l.id_location = ip.id_location
							where i.closed = 0 and l.id_pod = pod and i.id_invoice = ip.id_invoice);
    
  
  end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_devicecatalog`
--

/*!50001 DROP VIEW IF EXISTS `v_devicecatalog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `v_devicecatalog` AS select `dt`.`Manufacturer` AS `Manufacturer`,`dc`.`Description` AS `TypeDescription`,`dt`.`NumInterfaces` AS `NumInterfaces`,`mt`.`Speed` AS `Speed`,`mt`.`FullDuplex` AS `FullDuplex`,`mt`.`Technology` AS `Technology`,`dt`.`Description` AS `Description`,`r`.`Price` AS `Price` from ((((`devicetype` `dt` join `devicecategory` `dc` on((`dt`.`ID_DeviceCategory` = `dc`.`ID_DeviceCategory`))) join `mediumtype` `mt` on(((`dt`.`ID_MediumType` = `mt`.`ID_MediumType`) and (`dc`.`Inactiv` = 0)))) join `networkinterface` `i` on((`mt`.`ID_MediumType` = `i`.`ID_MediumType`))) join `rate` `r` on((`dt`.`ID_Rate` = `r`.`ID_Rate`))) where (((`dc`.`ValidFrom` <= now()) or isnull(`dc`.`ValidFrom`)) and ((`dc`.`ValidTo` >= now()) or isnull(`dc`.`ValidTo`))) group by `dt`.`Manufacturer`,`dc`.`Description` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_invoices`
--

/*!50001 DROP VIEW IF EXISTS `v_invoices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `v_invoices` AS select `i`.`ID_Invoice` AS `ID_Invoice`,`i`.`InvoiceDate` AS `InvoiceDate`,`i`.`ID_Customer` AS `ID_Customer`,`i`.`Closed` AS `Closed`,`BetragRechnungOhneGutschrift_F`(`i`.`ID_Invoice`) AS `BetragOhneGutschrift`,`BetragRechnungMitGutschrift_F`(`i`.`ID_Invoice`) AS `BetragMitGutschrift` from `invoice` `i` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_logentries`
--

/*!50001 DROP VIEW IF EXISTS `v_logentries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`fuse314`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_logentries` AS select `l`.`ID_Log` AS `id`,concat((`c`.`Name` + ' / '),`p`.`ID_Pod`) AS `pod`,concat(`a`.`Street`,' ',`a`.`StreetNumber`,', ',`a`.`Plz`,' ',`a`.`Location`) AS `location`,`d`.`Hostname` AS `hostname`,`l`.`Severity` AS `severity`,`l`.`CreatedAt` AS `timestamp`,`l`.`Message` AS `message` from (((((`log` `l` join `device` `d` on((`d`.`ID_Device` = `l`.`ID_Device`))) join `location` `loc` on((`d`.`ID_Location` = `loc`.`ID_Location`))) left join `address` `a` on((`a`.`Id_Address` = `loc`.`ID_Address`))) join `pod` `p` on((`loc`.`ID_Pod` = `p`.`ID_Pod`))) join `customer` `c` on((`p`.`ID_Customer` = `c`.`ID_Customer`))) where (`l`.`Acknowledged` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_usageperlocation`
--

/*!50001 DROP VIEW IF EXISTS `v_usageperlocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `v_usageperlocation` AS select `l`.`ID_Location` AS `id_location`,`dt`.`ID_DeviceType` AS `ID_DeviceType`,((ifnull(sum(ifnull((select count('x') from (`networkinterface` `n` join `relnetworkinterface` `rn` on(((`n`.`ID_Networkinterface` = `rn`.`ID_NetworkinterfaceA`) or (`n`.`ID_Networkinterface` = `rn`.`ID_NetworkinterfaceB`)))) where (`n`.`ID_Device` = `d`.`ID_Device`)),0)),0) / sum(ifnull(`dt`.`NumInterfaces`,0))) * 100) AS `Usage` from ((`location` `l` join `device` `d` on((`l`.`ID_Location` = `d`.`ID_Location`))) join `devicetype` `dt` on((`d`.`ID_DeviceType` = `dt`.`ID_DeviceType`))) group by `dt`.`ID_DeviceType`,`l`.`ID_Location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_usageperpod`
--

/*!50001 DROP VIEW IF EXISTS `v_usageperpod`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `v_usageperpod` AS select `p`.`ID_Pod` AS `id_pod`,(sum(`u`.`Usage`) / count(`u`.`Usage`)) AS `Usage` from ((`v_usageperlocation` `u` join `location` `l` on((`u`.`id_location` = `l`.`ID_Location`))) join `pod` `p` on((`l`.`ID_Pod` = `p`.`ID_Pod`))) group by `p`.`ID_Pod` */;
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

-- Dump completed on 2015-08-24 18:36:40
