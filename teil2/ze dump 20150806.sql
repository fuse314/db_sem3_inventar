-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: localhost    Database: usr_web98_5
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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
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
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (15,'Hintermwäldli','3 c','9015','St. Gallen','CH'),(16,'Hauptstrasse','15 a','9000','St. Gallen','CH'),(12,'Hauptstrasse','15 b','9000','St. Gallen','CH'),(13,'Rue des Alpes','2','1700','Fribourg','CH'),(14,'Brooklyn','23W4c','18278','New York City NY','US'),(1,'Musterstrasse','1','9000','St. Gallen','CH'),(2,'Musterstrasse','2','9000','St. Gallen','CH'),(3,'Musterstrasse','3','9000','St. Gallen','CH'),(4,'Musterstrasse','4','9000','St. Gallen','CH'),(5,'Rechnungsstrasse','5','9000','St. Gallen','CH'),(6,'Rechnungsstrasse','6','9000','St. Gallen','CH'),(7,'Rechnungsstrasse','7','9000','St. Gallen','CH'),(8,'Rechnungsstrasse','8','9000','St. Gallen','CH'),(9,'Bahnhofstrasse','6','9000','St. Gallen','CH'),(10,'Rechnungsstrasse','10','9000','St. Gallen','CH'),(11,'Lafayette Street','200','10003','New York','US');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Communication`
--

DROP TABLE IF EXISTS `Communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Communication` (
  `ID_Person` int(11) NOT NULL,
  `ID_CommunicationType` int(11) NOT NULL,
  `CommunicationDetail` varchar(80) NOT NULL,
  PRIMARY KEY (`ID_Person`,`ID_CommunicationType`),
  KEY `ID_CommunicationType` (`ID_CommunicationType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Communication`
--

LOCK TABLES `Communication` WRITE;
/*!40000 ALTER TABLE `Communication` DISABLE KEYS */;
INSERT INTO `Communication` VALUES (10,1,'+41553283232'),(10,2,'jemand@microsoft.com'),(10,3,'echo123'),(10,4,'uESfxauij5tSx8KGu3mA3YB7cJsQqQ');
/*!40000 ALTER TABLE `Communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommunicationType`
--

DROP TABLE IF EXISTS `CommunicationType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommunicationType` (
  `ID_CommunicationType` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_CommunicationType`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommunicationType`
--

LOCK TABLES `CommunicationType` WRITE;
/*!40000 ALTER TABLE `CommunicationType` DISABLE KEYS */;
INSERT INTO `CommunicationType` VALUES (1,'Direct Phone'),(2,'E-Mail'),(3,'Skype'),(4,'Push Notification Key');
/*!40000 ALTER TABLE `CommunicationType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Credential`
--

DROP TABLE IF EXISTS `Credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Credential` (
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
-- Dumping data for table `Credential`
--

LOCK TABLES `Credential` WRITE;
/*!40000 ALTER TABLE `Credential` DISABLE KEYS */;
INSERT INTO `Credential` VALUES (1,1,'elias.schwarz','734hgsue4','234562dsaf'),(2,1,'melanie.mueller','asdf','dsafewr234'),(3,1,'hans.eberle','1234','234sa4dasf'),(4,1,'marcel.signer','','234sdfawer');
/*!40000 ALTER TABLE `Credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `ID_Customer` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `ID_InvoiceAddress` int(11) DEFAULT NULL,
  `ID_Address` int(11) NOT NULL,
  `InvoiceThreshold` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Customer`),
  KEY `ID_InvoiceAddress` (`ID_InvoiceAddress`),
  KEY `ID_Address` (`ID_Address`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'GemDat Informatik AG',9,10,NULL),(2,'Testfirma',3,9,NULL),(3,'Meisterfirma',2,10,NULL);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Device`
--

DROP TABLE IF EXISTS `Device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Device` (
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
-- Dumping data for table `Device`
--

LOCK TABLES `Device` WRITE;
/*!40000 ALTER TABLE `Device` DISABLE KEYS */;
INSERT INTO `Device` VALUES (1,1,1,'Main Switch','34054-4353-34534',1),(2,1,1,'L3-Switch','34054-4353-4534',1),(3,2,2,'My Router','45345-53453-345-345',1),(4,2,2,'Router 2','564564-453-453',0),(5,3,3,'WLAN 1','453-3453-3453-45',1),(6,3,3,'WLAN 2','43545-3453-5433',1),(7,4,4,'Printer 1','4534-345345-3453',1),(8,4,4,'Printer 2','45345-45-453-44',1),(9,5,1,'WS 1','54353-34534-3453-345',1),(10,5,1,'WS 2','345345-3453-34534-345',1),(11,6,2,'App-Server','4567-767-67676',1),(12,6,2,'Test Server','45f56-767-767',0),(28,1,1,NULL,NULL,NULL),(27,1,1,NULL,NULL,NULL),(26,1,1,NULL,NULL,NULL),(25,1,1,NULL,NULL,NULL),(24,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceCategory`
--

DROP TABLE IF EXISTS `DeviceCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceCategory` (
  `ID_DeviceCategory` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceCategory`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceCategory`
--

LOCK TABLES `DeviceCategory` WRITE;
/*!40000 ALTER TABLE `DeviceCategory` DISABLE KEYS */;
INSERT INTO `DeviceCategory` VALUES (1,'Switch'),(2,'Router'),(3,'WLAN Accesspoint'),(4,'Printer'),(5,'Workstation'),(6,'Server');
/*!40000 ALTER TABLE `DeviceCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceMachine`
--

DROP TABLE IF EXISTS `DeviceMachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceMachine` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `Processors` varchar(100) DEFAULT NULL,
  `RAM` varchar(100) DEFAULT NULL,
  `StorageSize` varchar(100) DEFAULT NULL,
  `GPU` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceMachine`
--

LOCK TABLES `DeviceMachine` WRITE;
/*!40000 ALTER TABLE `DeviceMachine` DISABLE KEYS */;
INSERT INTO `DeviceMachine` VALUES (11,'Intel Core i7-5960X','12 GB','4 TB','Asus Geforce GTX 960 STRIX'),(12,'AMD FX-9590','8 GB','2 TB','Sapphire Radeon R9 285 Dual-X OC');
/*!40000 ALTER TABLE `DeviceMachine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DevicePrinter`
--

DROP TABLE IF EXISTS `DevicePrinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DevicePrinter` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `resolution` varchar(100) DEFAULT NULL,
  `pagesPerMinute` decimal(10,0) DEFAULT NULL,
  `isColorPrinter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DevicePrinter`
--

LOCK TABLES `DevicePrinter` WRITE;
/*!40000 ALTER TABLE `DevicePrinter` DISABLE KEYS */;
INSERT INTO `DevicePrinter` VALUES (7,'4800x2400 dpi',41,0),(8,'9600x2400 dpi',25,1);
/*!40000 ALTER TABLE `DevicePrinter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceRouter`
--

DROP TABLE IF EXISTS `DeviceRouter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceRouter` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceRouter`
--

LOCK TABLES `DeviceRouter` WRITE;
/*!40000 ALTER TABLE `DeviceRouter` DISABLE KEYS */;
INSERT INTO `DeviceRouter` VALUES (3,'1. Stock links'),(4,'Serverraum');
/*!40000 ALTER TABLE `DeviceRouter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceSwitch`
--

DROP TABLE IF EXISTS `DeviceSwitch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceSwitch` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `isPoESupported` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceSwitch`
--

LOCK TABLES `DeviceSwitch` WRITE;
/*!40000 ALTER TABLE `DeviceSwitch` DISABLE KEYS */;
INSERT INTO `DeviceSwitch` VALUES (1,0),(2,0);
/*!40000 ALTER TABLE `DeviceSwitch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceType`
--

DROP TABLE IF EXISTS `DeviceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceType` (
  `ID_DeviceType` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DeviceCategory` int(11) NOT NULL,
  `Manufacturer` varchar(100) DEFAULT NULL,
  `ManufacturerNumber` varchar(100) DEFAULT NULL,
  `NumInterfaces` int(11) NOT NULL,
  PRIMARY KEY (`ID_DeviceType`),
  KEY `ID_DeviceCategory` (`ID_DeviceCategory`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceType`
--

LOCK TABLES `DeviceType` WRITE;
/*!40000 ALTER TABLE `DeviceType` DISABLE KEYS */;
INSERT INTO `DeviceType` VALUES (1,1,'Cisco','CS4582',5),(2,2,'DELL','D-388',0),(3,3,'HP','H-2600',0),(4,4,'Canon','CN1234',0),(5,5,'Dell','D-2050',0),(6,6,'Dell','D-4093',0);
/*!40000 ALTER TABLE `DeviceType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeviceWLANAccesspoint`
--

DROP TABLE IF EXISTS `DeviceWLANAccesspoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DeviceWLANAccesspoint` (
  `ID_DeviceType` int(11) NOT NULL DEFAULT '0',
  `ID_WLANStandard` int(11) DEFAULT NULL,
  `AntennaType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_DeviceType`),
  KEY `ID_WLANStandard` (`ID_WLANStandard`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeviceWLANAccesspoint`
--

LOCK TABLES `DeviceWLANAccesspoint` WRITE;
/*!40000 ALTER TABLE `DeviceWLANAccesspoint` DISABLE KEYS */;
INSERT INTO `DeviceWLANAccesspoint` VALUES (5,3,'Omnidirectional'),(6,7,'Directional');
/*!40000 ALTER TABLE `DeviceWLANAccesspoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `ID_Invoice` int(11) NOT NULL AUTO_INCREMENT,
  `InvoiceDate` date DEFAULT NULL,
  `ID_Customer` int(11) NOT NULL,
  `Closed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Invoice`),
  KEY `ID_Customer` (`ID_Customer`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES (1,'2015-07-30',1,1),(2,'2015-07-30',2,1),(3,NULL,3,0),(4,NULL,2,0),(5,'2015-07-30',1,1),(6,NULL,1,0);
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoicePosition`
--

DROP TABLE IF EXISTS `InvoicePosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoicePosition` (
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoicePosition`
--

LOCK TABLES `InvoicePosition` WRITE;
/*!40000 ALTER TABLE `InvoicePosition` DISABLE KEYS */;
INSERT INTO `InvoicePosition` VALUES (1,1,1,100,NULL,'Fahrtweg zu Kunde',NULL,NULL,NULL),(2,1,1,3,NULL,'Installation Gerät XYZ',NULL,NULL,NULL),(3,1,2,1,600,'Gerät XYZ',NULL,NULL,NULL),(4,2,NULL,1,6000,NULL,NULL,NULL,NULL),(5,5,NULL,1,1100,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `InvoicePosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `ID_Location` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Pod` int(11) NOT NULL,
  `ID_Address` int(11) NOT NULL,
  `ID_ParentLocation` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Location`),
  KEY `ID_Pod` (`ID_Pod`),
  KEY `ID_Address` (`ID_Address`),
  KEY `ID_ParentLocation` (`ID_ParentLocation`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,1,11,NULL),(2,1,12,1),(3,2,11,NULL),(4,3,14,NULL);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log` (
  `ID_Log` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Severity` int(11) DEFAULT NULL,
  `Message` varchar(1000) DEFAULT NULL,
  `ID_Device` int(11) NOT NULL,
  PRIMARY KEY (`ID_Log`),
  KEY `ID_Device` (`ID_Device`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
INSERT INTO `Log` VALUES (1,'2015-03-16 23:00:00',2,'Warning: Could not connect to the server',1),(2,'2015-03-16 23:00:00',1,'Information: Connected to Server',2),(3,'2015-03-16 23:00:00',3,'Error: Server unknown',3);
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MediumType`
--

DROP TABLE IF EXISTS `MediumType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediumType` (
  `ID_MediumType` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_MediumType`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MediumType`
--

LOCK TABLES `MediumType` WRITE;
/*!40000 ALTER TABLE `MediumType` DISABLE KEYS */;
INSERT INTO `MediumType` VALUES (1,'RJ-45 CAT6');
/*!40000 ALTER TABLE `MediumType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Networkinterface`
--

DROP TABLE IF EXISTS `Networkinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Networkinterface` (
  `ID_Networkinterface` int(11) NOT NULL AUTO_INCREMENT,
  `FullDuplex` tinyint(1) DEFAULT NULL,
  `Speed` int(11) DEFAULT NULL,
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
-- Dumping data for table `Networkinterface`
--

LOCK TABLES `Networkinterface` WRITE;
/*!40000 ALTER TABLE `Networkinterface` DISABLE KEYS */;
INSERT INTO `Networkinterface` VALUES (1,1,1000,1,NULL,NULL,1,NULL,1),(2,1,1000,1,NULL,NULL,1,NULL,0),(3,1,1000,1,NULL,NULL,1,NULL,0),(4,1,1000,1,NULL,NULL,1,NULL,0),(5,1,1000,1,NULL,NULL,1,NULL,0),(6,1,1000,1,3232239617,NULL,3,NULL,0),(7,1,1000,1,3232239873,NULL,3,NULL,0),(8,1,1000,1,NULL,NULL,2,NULL,0),(9,1,1000,1,NULL,NULL,2,NULL,0),(10,1,1000,1,NULL,NULL,2,NULL,0),(11,1,1000,1,NULL,NULL,2,NULL,0),(12,1,1000,1,NULL,NULL,2,NULL,0),(13,1,1000,1,3232240126,NULL,4,NULL,0),(14,1,1000,1,3232241918,NULL,4,NULL,0),(15,1,1000,1,NULL,NULL,5,NULL,0),(16,1,1000,1,NULL,NULL,6,NULL,0),(17,1,100,1,3232239877,NULL,7,NULL,0),(18,1,100,1,3232239623,NULL,8,NULL,0),(19,1,1000,1,NULL,NULL,9,NULL,0),(20,1,1000,1,NULL,NULL,10,NULL,0),(21,1,1000,1,3232239875,NULL,11,NULL,0),(22,1,1000,1,3232239876,NULL,12,NULL,0),(23,1,100,1,NULL,NULL,12,23,1),(24,NULL,NULL,NULL,NULL,NULL,24,5,NULL),(25,NULL,NULL,NULL,NULL,NULL,24,4,NULL),(26,NULL,NULL,NULL,NULL,NULL,24,3,NULL),(27,NULL,NULL,NULL,NULL,NULL,24,2,NULL),(28,NULL,NULL,NULL,NULL,NULL,24,1,NULL),(29,NULL,NULL,NULL,NULL,NULL,25,5,NULL),(30,NULL,NULL,NULL,NULL,NULL,25,4,NULL),(31,NULL,NULL,NULL,NULL,NULL,25,3,NULL),(32,NULL,NULL,NULL,NULL,NULL,25,2,NULL),(33,NULL,NULL,NULL,NULL,NULL,25,1,NULL),(34,NULL,NULL,NULL,NULL,NULL,26,5,NULL),(35,NULL,NULL,NULL,NULL,NULL,26,4,NULL),(36,NULL,NULL,NULL,NULL,NULL,26,3,NULL),(37,NULL,NULL,NULL,NULL,NULL,26,2,NULL),(38,NULL,NULL,NULL,NULL,NULL,26,1,NULL),(39,NULL,NULL,NULL,NULL,NULL,27,5,NULL),(40,NULL,NULL,NULL,NULL,NULL,27,4,NULL),(41,NULL,NULL,NULL,NULL,NULL,27,3,NULL),(42,NULL,NULL,NULL,NULL,NULL,27,2,NULL),(43,NULL,NULL,NULL,NULL,NULL,27,1,NULL),(44,NULL,NULL,NULL,NULL,NULL,28,5,NULL),(45,NULL,NULL,NULL,NULL,NULL,28,4,NULL),(46,NULL,NULL,NULL,NULL,NULL,28,3,NULL),(47,NULL,NULL,NULL,NULL,NULL,28,2,NULL),(48,NULL,NULL,NULL,NULL,NULL,28,1,NULL);
/*!40000 ALTER TABLE `Networkinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POD`
--

DROP TABLE IF EXISTS `POD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POD` (
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
-- Dumping data for table `POD`
--

LOCK TABLES `POD` WRITE;
/*!40000 ALTER TABLE `POD` DISABLE KEYS */;
INSERT INTO `POD` VALUES (1,1,10,'Europe/Zurich'),(2,3,1,'Europe/Zurich'),(3,3,10,'Europe/Zurich');
/*!40000 ALTER TABLE `POD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment`
--

DROP TABLE IF EXISTS `Payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment` (
  `ID_Payment` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Customer` int(11) NOT NULL,
  `Amount` decimal(10,0) NOT NULL,
  `PaymentDate` date NOT NULL,
  PRIMARY KEY (`ID_Payment`),
  KEY `ID_Customer` (`ID_Customer`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment`
--

LOCK TABLES `Payment` WRITE;
/*!40000 ALTER TABLE `Payment` DISABLE KEYS */;
INSERT INTO `Payment` VALUES (1,1,100,'2001-01-20');
/*!40000 ALTER TABLE `Payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `ID_Person` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) DEFAULT NULL,
  `SurName` varchar(100) DEFAULT NULL,
  `ID_Address` int(11) NOT NULL,
  PRIMARY KEY (`ID_Person`),
  KEY `ID_Address` (`ID_Address`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'Elias','Schwarz',1),(2,'Nadine','Müller',2),(3,'Peter','Mittelholzer',3),(4,'Melanie','Egger',4),(10,'Gottfried','Mayer',10);
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rate`
--

DROP TABLE IF EXISTS `Rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rate` (
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
-- Dumping data for table `Rate`
--

LOCK TABLES `Rate` WRITE;
/*!40000 ALTER TABLE `Rate` DISABLE KEYS */;
INSERT INTO `Rate` VALUES (1,1,1,180,'2001-01-20','2031-12-20'),(2,1,1,200,'2001-01-20',NULL),(3,3,3,3,'2001-01-20',NULL);
/*!40000 ALTER TABLE `Rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RelDeviceCredential`
--

DROP TABLE IF EXISTS `RelDeviceCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RelDeviceCredential` (
  `ID_Device` int(11) NOT NULL,
  `ID_Credential` int(11) NOT NULL,
  PRIMARY KEY (`ID_Device`,`ID_Credential`),
  KEY `ID_Credential` (`ID_Credential`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RelDeviceCredential`
--

LOCK TABLES `RelDeviceCredential` WRITE;
/*!40000 ALTER TABLE `RelDeviceCredential` DISABLE KEYS */;
INSERT INTO `RelDeviceCredential` VALUES (1,1),(2,1),(3,3);
/*!40000 ALTER TABLE `RelDeviceCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RelNetworkinterface`
--

DROP TABLE IF EXISTS `RelNetworkinterface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RelNetworkinterface` (
  `ID_RelNetworkinterface` int(11) NOT NULL AUTO_INCREMENT,
  `ID_NetworkinterfaceA` int(11) NOT NULL,
  `ID_NetworkinterfaceB` int(11) NOT NULL,
  PRIMARY KEY (`ID_RelNetworkinterface`),
  KEY `ID_NetworkinterfaceA` (`ID_NetworkinterfaceA`),
  KEY `ID_NetworkinterfaceB` (`ID_NetworkinterfaceB`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RelNetworkinterface`
--

LOCK TABLES `RelNetworkinterface` WRITE;
/*!40000 ALTER TABLE `RelNetworkinterface` DISABLE KEYS */;
INSERT INTO `RelNetworkinterface` VALUES (1,1,8),(2,2,18),(3,3,19),(4,4,20),(5,5,6),(6,7,15),(7,9,21),(8,10,22),(9,11,17),(10,12,13),(11,14,16);
/*!40000 ALTER TABLE `RelNetworkinterface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RelNetworkinterfaceVLAN`
--

DROP TABLE IF EXISTS `RelNetworkinterfaceVLAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RelNetworkinterfaceVLAN` (
  `ID_RelNetworkinterface` int(11) NOT NULL,
  `ID_VLAN` int(11) NOT NULL,
  PRIMARY KEY (`ID_RelNetworkinterface`,`ID_VLAN`),
  KEY `ID_VLAN` (`ID_VLAN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RelNetworkinterfaceVLAN`
--

LOCK TABLES `RelNetworkinterfaceVLAN` WRITE;
/*!40000 ALTER TABLE `RelNetworkinterfaceVLAN` DISABLE KEYS */;
INSERT INTO `RelNetworkinterfaceVLAN` VALUES (8,1),(10,1),(11,1);
/*!40000 ALTER TABLE `RelNetworkinterfaceVLAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceType`
--

DROP TABLE IF EXISTS `ServiceType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceType` (
  `ID_ServiceType` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `ValidFrom` date NOT NULL,
  `ValidTo` date DEFAULT NULL,
  PRIMARY KEY (`ID_ServiceType`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceType`
--

LOCK TABLES `ServiceType` WRITE;
/*!40000 ALTER TABLE `ServiceType` DISABLE KEYS */;
INSERT INTO `ServiceType` VALUES (1,'Arbeitszeit','2001-01-20',NULL),(2,'Material','2001-01-20',NULL),(3,'Fahrtweg','2001-01-20',NULL);
/*!40000 ALTER TABLE `ServiceType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Unit`
--

DROP TABLE IF EXISTS `Unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Unit` (
  `ID_Unit` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(100) NOT NULL,
  `Abbreviation` varchar(5) NOT NULL,
  PRIMARY KEY (`ID_Unit`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Unit`
--

LOCK TABLES `Unit` WRITE;
/*!40000 ALTER TABLE `Unit` DISABLE KEYS */;
INSERT INTO `Unit` VALUES (1,'Stunde','h'),(2,'Stück','Stk.'),(3,'Kilometer','km');
/*!40000 ALTER TABLE `Unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VLAN`
--

DROP TABLE IF EXISTS `VLAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VLAN` (
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
-- Dumping data for table `VLAN`
--

LOCK TABLES `VLAN` WRITE;
/*!40000 ALTER TABLE `VLAN` DISABLE KEYS */;
INSERT INTO `VLAN` VALUES (1,1,15,3232235522,4294967040,3232235521,NULL,1024,NULL);
/*!40000 ALTER TABLE `VLAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WLANStandard`
--

DROP TABLE IF EXISTS `WLANStandard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WLANStandard` (
  `ID_WLANStandard` int(11) NOT NULL AUTO_INCREMENT,
  `Designation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_WLANStandard`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WLANStandard`
--

LOCK TABLES `WLANStandard` WRITE;
/*!40000 ALTER TABLE `WLANStandard` DISABLE KEYS */;
INSERT INTO `WLANStandard` VALUES (1,'802.11'),(2,'802.11a'),(3,'802.11a'),(4,'802.11g'),(5,'802.11n'),(6,'802.11ac'),(7,'802.11ad');
/*!40000 ALTER TABLE `WLANStandard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'usr_web98_5'
--
/*!50003 DROP FUNCTION IF EXISTS `BetragRechnungOhneGutschrift_F` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `BetragRechnungOhneGutschrift_F`(ID_Invoice int) RETURNS decimal(10,0)
    READS SQL DATA
begin
declare sum decimal;
 select  ifnull(Sum(ifnull(ip.Price, ifnull(r.Price, 0)) * Amount), 0) into sum
		   from InvoicePosition ip
           
           left join Rate r
             on r.ID_ServiceType = ip.ID_ServiceType
             and ValidFrom <= CURDATE() and ifnull(ValidTo, CURDATE()) <= CURDATE()
             
		   where i.closed = 0 and ip.ID_Invoice = ID_Invoice;
           
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_DeviceAdd`(in ID_Location int, in ID_DeviceType int, in NumDevice int)
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
/*!50003 DROP PROCEDURE IF EXISTS `P_NightlyInvoicing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_NightlyInvoicing`()
begin
SET SQL_SAFE_UPDATES = 0;

  update Invoice i
    set InvoiceDate = CURDATE(),
        Closed = 1
    where ((select 
		     ifnull(Sum(ifnull(ip.Price, ifnull(r.Price, 0)) * Amount), 0)
		   from InvoicePosition ip
           
           left join Rate r
             on r.ID_ServiceType = ip.ID_ServiceType
             and ValidFrom <= CURDATE() and ifnull(ValidTo, CURDATE()) <= CURDATE()
             
		   where i.closed = 0 and ip.ID_Invoice = i.ID_Invoice) > 
             (select ifnull(InvoiceThreshold, 5000) 
             from Customer c where c.ID_Customer = i.ID_Customer))
		OR (
        ((select 
		     ifnull(Sum(ifnull(ip.Price, ifnull(r.Price, 0)) * Amount), 0)
		   from InvoicePosition ip
           
           left join Rate r
             on r.ID_ServiceType = ip.ID_ServiceType
             and ValidFrom <= CURDATE() and ifnull(ValidTo, CURDATE()) <= CURDATE()
           
             where i.closed = 0 and ip.ID_Invoice = i.ID_Invoice) > 1000)
             AND 30 = DAYOFMONTH(CURDATE()));
             
             
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-06 20:12:55
