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
  `indications` text,
  `material_numbers` text,
  `tryin` text,
  `insertion` text,
  `media` varchar(500) DEFAULT NULL,
  `maintenance` text,
  `impression` text,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Single Tooth`
--

LOCK TABLES `Single Tooth` WRITE;
/*!40000 ALTER TABLE `Single Tooth` DISABLE KEYS */;
INSERT INTO `Single Tooth` VALUES ('Nothing here yet.','<p>Single implant crowns can be abutment- or implant-\r\nsupported.</p>\r\n\r\ni) abutment- supported:\r\n\r\nD6056 prefabricated abutment\r\n<ul>\r\n<li>mostly for cement-type restorations</li>\r\n<li>mostly titanium, rarely ceramic</li>\r\n<li>all should be ‘engaging’ type;<li>\r\n</ul>\r\n(Figure 1 will be inserted here);\r\n','\r\n<p>Implant components are machined to fit very tightly. Usually\r\na separate try-in appointment is not required. In situations\r\nwhere esthetics is priority, a single implant crown may need\r\nto be tried-in and sent back to the dental laboratory for\r\nimprovements.</p>\r\n\r\n<h3>Required materials and suggested implant components</h3>\r\n\r\n<ul>\r\n<li>Manual implant screwdriver (short, medium or long\r\ndepending on the clinical situation) (figure 15 will be\r\ninserted here)</li>\r\n<li>Articulating paper</li>\r\n<li>Disclosing medium (i.e. fit checker) (figure 16 will\r\nbe inserted here)</li>\r\n<li>Burs, polishing disks (figure 17 will be inserted here)</li>\r\n<li>Slow-, and high-speed handpieces</li>\r\n<li>Restorative/prosthodontics instrument cassette</li>\r\n</ul>\r\n\r\n<h3>Clinical procedure</h3>\r\n\r\n<p>Healing abutment or provisional implant crown is removed.\r\nFor cement-retained restorations, the abutment is placed\r\nonto the implant first, using a try-in screw ((figure 18 will\r\nbe inserted here) is used. It is important to note that try-\r\nin screws are not designed to be torqued. Often the dental\r\nlaboratory is asked to fabricate a positioning jig, to help\r\nfind the correct orientation of the abutment. Seating of the\r\ncustom abutments can cause discomfort to the patient, as\r\nthe emergence profile of the abutment may be significantly\r\nbigger than the healing abutment. In these cases, use of\r\nlocal anesthesia may be indicated. Once the abutment is\r\nseated, a periapical or bitewing radiograph may need to\r\nbe obtained to verify seating (fig 19 will be inserted here).\r\nThe crown is then tried in checking the proximal contacts\r\nfirst. Verification of marginal fit is followed by checking the\r\nocclusal contacts.</p>\r\n','Required materials and suggested implant components\r\n\r\n<ul>\r\n<li>Manual implant screwdriver (short, medium or long\r\ndepending on the clinical situation) (figure 15 will be\r\ninserted here)</li>\r\n<li>Manual torque wrench</li>\r\n<li>Machine heads for torque wrench</li>\r\n<li>Articulating paper</li>\r\n<li>Disclosing medium (i.e. fit checker) (figure 16 will\r\nbe inserted here)</li>\r\n<li>Gutta-percha</li>\r\n<li>Composite resin</li>\r\n<li>Cotton-pelets</li>\r\n<li>Burs, polishing disks (figure 17 will be inserted here)</li>\r\n<li>Slow-, and high-speed handpieces</li>\r\n<li>Restorative/prosthodontics instrument cassette</li>\r\n</ul>\r\n','Nothing here.','Not yet.','<ul>\r\n<li>Single implant impressions can be made at the implant or\r\nabutment level. For majority of the cases, an implant-level\r\nimpression is required. This enables the dentist/ technician\r\nto choose the most appropriate abutment. The traditional\r\nimplant impressions are made using machined impression\r\ncopings that are specific for the implant placed and\r\nmedium-, or medium-light body elastomeric impression\r\nmaterials.\r\nOpen-tray technique is also known as the “pick-up\r\ntechnique”. The impression coping is picked up with the\r\nimpression.\r\nClosed-tray technique is known as the “transfer\r\ntechnique”. After removal of the impression tray, the\r\nimpression coping stays on the implant. It is then removed,\r\nand the implant replica is connected and the impression\r\ncoping-implant replica is transferred to the impression.</li>\r\n<li>Digital impressions at the implant level can be made using\r\ncoded abutments or impression posts specific to some\r\nimplant companies (figure Chairside data acquisition is\r\nperformed with a CADCAM system (i.e. Cerec, Lava,\r\nE4D Dentist) that enables the dentist to send the digital\r\nimpression to a production facility for fabrication of a model.</li>\r\n<li>Identify the type and platform of the implant to be restored. If\r\nnot sure, contact the surgeon.</li>\r\n<li> The website www.whatimplantisthat.com provides valuable\r\ninformation and offers an extensive database of radiographic\r\nimages and specifications of dental implants.</li>\r\n</ul>',1);
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
  `miscellaneous` text,
  `pictures` varchar(2000) DEFAULT NULL,
  `materials` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES ('Single Tooth',7,'General info tsxt here.','Procedures here','maintenance here','sam, tyler, john',NULL,NULL),('Multiple Teeth',8,'General text lipsum','Procedures lipsum','maint lipsum','sam: tyler, john',NULL,NULL),('Fixed Complete',3,'Lipsum fixed complete general','FC Proecdures','FC Maint',NULL,NULL,NULL),('Removable Partial',5,'Lipsum removable partial general','Rp Proecdures','Rp Maint',NULL,NULL,NULL),('Removable Complete',6,'Lipsum removable complete general','RC Proecdures','RC Maint',NULL,NULL,NULL);
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

-- Dump completed on 2012-10-08 19:32:14
