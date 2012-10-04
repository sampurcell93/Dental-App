-- MySQL dump 10.13  Distrib 5.1.44, for apple-darwin8.11.1 (i386)
--
-- Host: localhost    Database: dental_info
-- ------------------------------------------------------
-- Server version	5.1.44

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
-- Table structure for table `Single Tooth`
--

DROP TABLE IF EXISTS `Single Tooth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Single Tooth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Procedures` text,
  `Maintenance` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Single Tooth`
--

LOCK TABLES `Single Tooth` WRITE;
/*!40000 ALTER TABLE `Single Tooth` DISABLE KEYS */;
INSERT INTO `Single Tooth` VALUES (1,'Lipsum','Maint');
/*!40000 ALTER TABLE `Single Tooth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appendix`
--

DROP TABLE IF EXISTS `appendix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appendix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(60) DEFAULT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appendix`
--

LOCK TABLES `appendix` WRITE;
/*!40000 ALTER TABLE `appendix` DISABLE KEYS */;
INSERT INTO `appendix` VALUES (1,'High noble metal alloys','noble metal content of at least 60 wt%, of which at least 40 wt % is gold\n(three subclasses: i) Gold-platinum, ii) Gold-palladium, iii) Gold-copper-silver-palladium'),(2,'Noble metal alloys','at least 25 wt % noble metal (three subclasses: i) Gold-copper-silver-\npalladium, ii) Palladium-copper-gallium, iii) Palladium-silver and Silver-palladium)'),(3,'Base-Metal Alloys','less than 25 wt % noble metal (three subclasses- i) Nickel-chromium-\nberyllium, ii) Nickel-chromium (with higher or lower chromium content), iii) Cobalt-chromium)');
/*!40000 ALTER TABLE `appendix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarchy`
--

DROP TABLE IF EXISTS `hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarchy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(60) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `terminates` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarchy`
--

LOCK TABLES `hierarchy` WRITE;
/*!40000 ALTER TABLE `hierarchy` DISABLE KEYS */;
INSERT INTO `hierarchy` VALUES (1,'fixed',NULL,NULL),(2,'Fixed partial',1,NULL),(3,'Fixed complete',1,1),(4,'removable',NULL,NULL),(5,'Removable partial',4,1),(6,'Removable complete',4,1),(7,'Single Tooth',2,1),(8,'Multiple Teeth',2,1);
/*!40000 ALTER TABLE `hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `name` varchar(100) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `general_info` text,
  `procedures` text,
  `maintenance` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES ('Single Tooth',7,'General info tsxt here.','Procedures here','maintenance here'),('Multiple Teeth',8,'General text lipsum','Procedures lipsum','maint lipsum'),('Fixed Complete',3,'Lipsum fixed complete general','FC Proecdures','FC Maint'),('Removable Partial',5,'Lipsum removable partial general','Rp Proecdures','Rp Maint'),('Removable Complete',6,'Lipsum removable complete general','RC Proecdures','RC Maint');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiple teeth`
--

DROP TABLE IF EXISTS `multiple teeth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multiple teeth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Procedures` text,
  `Maintenance` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiple teeth`
--

LOCK TABLES `multiple teeth` WRITE;
/*!40000 ALTER TABLE `multiple teeth` DISABLE KEYS */;
INSERT INTO `multiple teeth` VALUES (1,'Lipsum','Maint');
/*!40000 ALTER TABLE `multiple teeth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-04 16:19:56
