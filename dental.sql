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
-- Table structure for table `3_1_8`
--

DROP TABLE IF EXISTS `3_1_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `3_1_8` (
  `General Information` text,
  `Procedures` text NOT NULL,
  `A third header` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `3_1_8`
--

LOCK TABLES `3_1_8` WRITE;
/*!40000 ALTER TABLE `3_1_8` DISABLE KEYS */;
INSERT INTO `3_1_8` VALUES ('<h3>Indications/Contraindications</h3>\r\nNothing here yet. \r\n\r\n<h3>Material options and suggested CDT codes</h3>\r\nSingle implant crowns can be abutment- or implant- supported.\r\n\r\n\r\n<h4>i) Abutment Supported</h4>\r\n\r\n<ul>\r\n<li><strong>D6056 prefabricated abutment</strong></li>\r\n<li>mostly for cement-type restorations</li>\r\n<li>mostly titanium, rarely ceramic</li>\r\n<li>all should be ‘engaging’ type</li>\r\n</ul>\r\n(Figure 1 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6057 custom abutment</strong></li>\r\n<li>mostly for cement-type restorations</li>\r\n<li>can be made of cast gold alloy, titanium or zirconium</li>\r\n<li>all should be ‘engaging’ type</li>\r\n</ul>\r\n(Figure 2 will be inserted here)\r\n\r\n\r\n<ul>\r\n<li><strong>D6058 Abutment supported porcelain/ceramic crown</strong></li>\r\n<li>Tip 1: If made on a titanium abutment, recommend a\r\nceramic abutment with a polycrystalline ceramic core\r\n(such as zirconium) for better esthetic outcome.</li>\r\n<li>Tip 2: If made on a ceramic abutment, then more\r\ntranslucent ceramics such as lithium disilicate can be used\r\nwithout a significant risk of the abutment shade showing\r\nthrough</li>\r\n</ul>\r\n(Figure 3 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6059 Abutment supported porcelain fused to metal crown\r\n(high noble metal)</strong></li>\r\n<li>Tip 1: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 4 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6060 Abutment supported porcelain fused to metal crown\r\n(predominantly base metal)</strong></li>\r\n<li>Tip: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 5 will be inserted here)\r\n\r\n\r\n<ul>\r\n<li><strong>D6061 Abutment supported porcelain fused to metal crown\r\n(noble metal)</strong></li>\r\n<li>Tip: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 6 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6062 Abutment supported cast metal crown (high noble\r\nmetal)</strong></li>\r\n<li>Tip: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 7 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6064 Abutment supported cast metal crown (noble metal)</strong></li>\r\n<li>Tip: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 8 will be inserted here)\r\n\r\n<h4>ii) Implant Supported </h4>\r\n<ul>\r\n<li><strong>D6065 implant supported ceramic crown</strong></li>\r\n<li>Secured directly onto the implant</li>\r\n<li>Screw-retained</li>\r\n<li>Usually a CAD/CAM engaging abutment, Zr or\r\nAlumina, is designed to support veneering porcelain</li>\r\n</ul>\r\n\r\n(Figure 9 will be inserted here)\r\n\r\n\r\n<ul>\r\n<li><strong>D6066 Implant supported porcelain fused to metal crown\r\n(titanium, titanium alloy, high noble metal)</strong></li>\r\n<li>Secured directly onto the implant</li>\r\n<li>Screw-retained</li>\r\n<li>Porcelain veneered on either titanium and titanium\r\nalloy CAD engaging substructures or on gold alloy\r\ncasted to ‘cast-to- burnout abutments with machined\r\nmetal engaging implant interfaces</li>\r\n</ul>\r\n\r\n<ul>\r\n<li><strong>D6067 Implant supported metal crown (titanium, titanium\r\nalloy, high noble alloy)</strong></li>\r\n<li>Secured directly onto the implant</li>\r\n<li>Screw-retained</li>\r\n<li>gold alloy casted to ‘cast-to- burnout abutments with\r\nmachined metal engaging implant interfaces</li>\r\n</ul>\r\n\r\n(Figure 11 will be inserted here)\r\n','\r\n<h3>Impression</h3>\r\n<ul>\r\n<li>Single implant impressions can be made at the implant or\r\nabutment level. For majority of the cases, an implant-level\r\nimpression is required. This enables the dentist/ technician\r\nto choose the most appropriate abutment. The traditional\r\nimplant impressions are made using machined impression\r\ncopings that are specific for the implant placed and\r\nmedium-, or medium-light body elastomeric impression\r\nmaterials.\r\nOpen-tray technique is also known as the “pick-up\r\ntechnique”. The impression coping is picked up with the\r\nimpression.\r\nClosed-tray technique is known as the “transfer\r\ntechnique”. After removal of the impression tray, the\r\nimpression coping stays on the implant. It is then removed,\r\nand the implant replica is connected and the impression\r\ncoping-implant replica is transferred to the impression.</li>\r\n<li>Digital impressions at the implant level can be made using\r\ncoded abutments or impression posts specific to some\r\nimplant companies (figure Chairside data acquisition is\r\nperformed with a CADCAM system (i.e. Cerec, Lava,\r\nE4D Dentist) that enables the dentist to send the digital\r\nimpression to a production facility for fabrication of a model</li>\r\n<li>Identify the type and platform of the implant to be restored. If\r\nnot sure, contact the surgeon.</li>\r\n<li>The website <a href=\"www.whatimplantisthat.com\" >What implant is that</a> provides valuable information and offers an extensive database of radiographic images and specifications of dental implants.</li>\r\n<li>Advantages/Disadvantages to be added</li>\r\n</ul>\r\n\r\n<h4>Required Materials and Suggested Implant Components</h4>\r\n<ul>\r\n<li>Manual implant screwdriver (short, medium or long depending on the clinical situation)</li>\r\n<li>Impression tray</li>\r\n<li>Impression syringe</li>\r\n<li>Elastomeric impression material and adhesive</li>\r\n<li>Local anesthetic (if needed)</li>\r\n<li>Restorative/prosthodontics instrument cassette</li>\r\n</ul>\r\n\r\n<h4>Clinical Procedure</h4>\r\n<ul>\r\n<li>For most single implant impressions there is no need for local\r\nanesthesia</li>\r\n<li>Using the appropriate screw driver (i.e. Unigrip Screw for\r\nNobelBiocare system) remove the healing abutment</li>\r\n<li>Place the impression coping on the implant, engaging the\r\nantirotational mechanism (i.e. “trilobe” for Nobel Replace\r\nimplants) (fig 14 will be inserted here)</li>\r\n<li>Using the manual screwdriver, hand-tighten the impression\r\ncoping screw. NEVER USE TORQUE WRENCHES for this\r\nprocedure</li>\r\n<li>Confirm seating of the impression coping with a periapical or\r\nbitewing radiograph (fig 16 will be inserted here)</li>\r\n<li>Try the impression tray in. A full-arch tray is indicated for this\r\nprocedure. There should be minimum of 5mm space between\r\nthe borders of the tray and the tissues. Apply the tray adhesive\r\nafter the try-in and tray modification/customization.</li>\r\n</ul>\r\n\r\nThe impression coping screw has to be long enough to\r\nprotrude from the opening created in the tray.\r\n\r\nThis opening can be closed with a piece of boxing wax,\r\nprior to loading of the tray (video 1 will be inserted here)\r\n\r\nIf using the closed-tray technique:\r\n\r\nThere is no need to open a hole on the impression tray\r\n\r\nMake sure that the tray does not contact the coping when\r\nmaking the impression (video 2 will be inserted here)\r\n\r\n<h4>Sample Case Notes</h4>\r\n\r\n“ .. ---Healing abutments removed from ( ) cleaned\r\nultrasonically in ( ) solution\r\n---(Closed / Open) tray technique used\r\n---Impression copings were placed onto the implant and\r\nseating was confirmed radiographically\r\n---(For the open tray technique) A screw access hole was\r\nprepared on the tray\r\n---Impression taken using regular body (polyether /\r\npvs) impression material in a full arch (stock / custom)\r\nimpression tray\r\n---Impression checked for accuracy.\r\n---Impression coping removed & healing abutment placed\r\nand hand-tightened\r\n---POI given.”\r\n\r\n\r\n<h4>Post Operative Instructions</h4>\r\n\r\nTo be added.\r\n\r\n<h3>Try-in</h3>\r\n\r\n<h4>Procedure</h4>\r\nImplant components are machined to fit very tightly. Usually\r\na separate try-in appointment is not required. In situations\r\nwhere esthetics is priority, a single implant crown may need\r\nto be tried-in and sent back to the dental laboratory for\r\nimprovements.\r\n\r\n<h4>Required materials and suggested implant components</h4>\r\n<ul>\r\n<li>Manual implant screwdriver (short, medium or long\r\ndepending on the clinical situation) (figure 15 will be\r\ninserted here)</li>\r\n<li>Articulating paper</li>\r\n<li>Disclosing medium (i.e. fit checker) (figure 16 will\r\nbe inserted here)</li>\r\n<li>Burs, polishing disks (figure 17 will be inserted here)</li>\r\n<li>Slow-, and high-speed handpieces</li>\r\n<li>Restorative/prosthodontics instrument cassette</li>\r\n</ul>\r\n\r\n<h4>Clinical Procedure</h4>\r\nHealing abutment or provisional implant crown is removed.\r\nFor cement-retained restorations, the abutment is placed\r\nonto the implant first, using a try-in screw ((figure 18 will\r\nbe inserted here) is used. It is important to note that try-\r\nin screws are not designed to be torqued. Often the dental\r\nlaboratory is asked to fabricate a positioning jig, to help\r\nfind the correct orientation of the abutment. Seating of the\r\ncustom abutments can cause discomfort to the patient, as\r\nthe emergence profile of the abutment may be significantly\r\nbigger than the healing abutment. In these cases, use of\r\nlocal anesthesia may be indicated. Once the abutment is\r\nseated, a periapical or bitewing radiograph may need to\r\nbe obtained to verify seating (fig 19 will be inserted here).\r\nThe crown is then tried in checking the proximal contacts\r\nfirst. Verification of marginal fit is followed by checking the\r\nocclusal contacts.\r\n\r\nScrew-retained single implant crowns are tried in a similar\r\nway. Since the crown is made directly on the abutment,\r\nit is carried into the mouth, abutment screw is tightened\r\nslowly and proximal contacts are checked first. (fig 20 will be\r\ninserted here) If the clinician believes that proximal contacts\r\nare acceptable, then a periapical or bitewing radiograph is\r\nobtained. Occlusion is checked last.\r\n\r\n(see insertion: next)\r\n\r\n<h3>Insertion</h3>\r\n<h4>Required materials and suggested implant components</h4>\r\n<ul>\r\n<li>Manual implant screwdriver (short, medium or long\r\ndepending on the clinical situation) (figure 15 will be\r\ninserted here)</li>\r\n<li>Manual torque wrench</li>\r\n<li>Machine heads for torque wrench</li>\r\n<li>Articulating paper</li>\r\n<li>Disclosing medium (i.e. fit checker) (figure 16 will\r\nbe inserted here)</li>\r\n<li>Gutta-percha</li>\r\n<li>Composite resin</li>\r\n<li>Cotton-pelets</li>\r\n<li>Burs, polishing disks (figure 17 will be inserted here)</li>\r\n<li>Slow-, and high-speed handpieces</li>\r\n<li>Restorative/prosthodontics instrument cassette</li>\r\n</ul>','<h3>Try-In</h3>\r\n\r\n<h4>Here it is</h4>\r\n<p>fmwfsfksfn</p>\r\n<h3>Clinical Procedure</h3>\r\n<h3>Impressions</h3>');
/*!40000 ALTER TABLE `3_1_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `This_is_a_test`
--

DROP TABLE IF EXISTS `This_is_a_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `This_is_a_test` (
  `General_Information` text,
  `Procedures` text,
  `This_is_a_test_header` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `This_is_a_test`
--

LOCK TABLES `This_is_a_test` WRITE;
/*!40000 ALTER TABLE `This_is_a_test` DISABLE KEYS */;
INSERT INTO `This_is_a_test` VALUES ('&lt;h3&gt;Indications/Contraindications&lt;/h3&gt;Nothing here yet. &lt;h3&gt;Material options and suggested CDT codes&lt;/h3&gt;Single implant crowns can be abutment- or implant- supported.&lt;h4&gt;i) Abutment Supported&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6056 prefabricated abutment&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;mostly for cement-type restorations&lt;/li&gt;&lt;li&gt;mostly titanium, rarely ceramic&lt;/li&gt;&lt;li&gt;all should be &acirc;€˜engaging&acirc;€™ type&lt;/li&gt;&lt;/ul&gt;(Figure 1 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6057 custom abutment&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;mostly for cement-type restorations&lt;/li&gt;&lt;li&gt;can be made of cast gold alloy, titanium or zirconium&lt;/li&gt;&lt;li&gt;all should be &acirc;€˜engaging&acirc;€™ type&lt;/li&gt;&lt;/ul&gt;(Figure 2 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6058 Abutment supported porcelain/ceramic crown&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip 1: If made on a titanium abutment, recommend aceramic abutment with a polycrystalline ceramic core(such as zirconium) for better esthetic outcome.&lt;/li&gt;&lt;li&gt;Tip 2: If made on a ceramic abutment, then moretranslucent ceramics such as lithium disilicate can be usedwithout a significant risk of the abutment shade showingthrough&lt;/li&gt;&lt;/ul&gt;(Figure 3 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6059 Abutment supported porcelain fused to metal crown(high noble metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip 1: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 4 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6060 Abutment supported porcelain fused to metal crown(predominantly base metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 5 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6061 Abutment supported porcelain fused to metal crown(noble metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 6 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6062 Abutment supported cast metal crown (high noblemetal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 7 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6064 Abutment supported cast metal crown (noble metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 8 will be inserted here)&lt;h4&gt;ii) Implant Supported &lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6065 implant supported ceramic crown&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Secured directly onto the implant&lt;/li&gt;&lt;li&gt;Screw-retained&lt;/li&gt;&lt;li&gt;Usually a CAD/CAM engaging abutment, Zr orAlumina, is designed to support veneering porcelain&lt;/li&gt;&lt;/ul&gt;(Figure 9 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6066 Implant supported porcelain fused to metal crown(titanium, titanium alloy, high noble metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Secured directly onto the implant&lt;/li&gt;&lt;li&gt;Screw-retained&lt;/li&gt;&lt;li&gt;Porcelain veneered on either titanium and titaniumalloy CAD engaging substructures or on gold alloycasted to &acirc;€˜cast-to- burnout abutments with machinedmetal engaging implant interfaces&lt;/li&gt;&lt;/ul&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6067 Implant supported metal crown (titanium, titaniumalloy, high noble alloy)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Secured directly onto the implant&lt;/li&gt;&lt;li&gt;Screw-retained&lt;/li&gt;&lt;li&gt;gold alloy casted to &acirc;€˜cast-to- burnout abutments withmachined metal engaging implant interfaces&lt;/li&gt;(Figure 11 will be inserted here)&lt;/ul&gt;',' &lt;h3&gt;Impression&lt;/h3&gt;&lt;ul&gt;&lt;li&gt;Single implant impressions can be made at the implant orabutment level. For majority of the cases, an implant-levelimpression is required. This enables the dentist/ technpicianto choose the most appropriate abutment. The traditionalimplant impressions are made using machined impressioncopings that are specific for the implant placed andmedium-, or medium-light body elastomeric impressionmaterials.Open-tray technique is also known as the &acirc;€œpick-uptechnique&acirc;€. The impression coping is picked up with theimpression.Closed-tray technique is known as the &acirc;€œtransfertechnique&acirc;€. After removal of the impression tray, theimpression coping stays on the implant. It is then removed,and the implant replica is connected and the impressioncoping-implant replica is transferred to the impression.&lt;/li&gt;&lt;li&gt;Digital impressions at the implant level can be made usingcoded abutments or impression posts specific to someimplant companies (figure Chairside data acquisition isperformed with a CADCAM system (i.e. Cerec, Lava,E4D Dentist) that enables the dentist to send the digitalimpression to a production facility for fabrication of a model&lt;/li&gt;&lt;li&gt;Identify the type and platform of the implant to be restored. Ifnot sure, contact the surgeon.&lt;/li&gt;&lt;li&gt;The website &lt;a href=\\&quot;www.whatimplantisthat.com\\&quot; &gt;What implant is that&lt;/a&gt; provides valuable information and offers an extensive database of radiographic images and specifications of dental implants.&lt;/li&gt;&lt;li&gt;Advantages/Disadvantages to be added&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Required Materials and Suggested Implant Components&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;Manual implant screwdriver (short, medium or long depending on the clinical situation)&lt;/li&gt;&lt;li&gt;Impression tray&lt;/li&gt;&lt;li&gt;Impression syringe&lt;/li&gt;&lt;li&gt;Elastomeric impression material and adhesive&lt;/li&gt;&lt;li&gt;Local anesthetic (if needed)&lt;/li&gt;&lt;li&gt;Restorative/prosthodontics instrument cassette&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Clinical Procedure&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;For most single implant impressions there is no need for localanesthesia&lt;/li&gt;&lt;li&gt;Using the appropriate screw driver (i.e. Unigrip Screw forNobelBiocare system) remove the healing abutment&lt;/li&gt;&lt;li&gt;Place the impression coping on the implant, engaging theantirotational mechanism (i.e. &acirc;€œtrilobe&acirc;€ for Nobel Replaceimplants) (fig 14 will be inserted here)&lt;/li&gt;&lt;li&gt;Using the manual screwdriver, hand-tighten the impressioncoping screw. NEVER USE TORQUE WRENCHES for thisprocedure&lt;/li&gt;&lt;li&gt;Confirm seating of the impression coping with a periapical orbitewing radiograph (fig 16 will be inserted here)&lt;/li&gt;&lt;li&gt;Try the impression tray in. A full-arch tray is indicated for thisprocedure. There should be minimum of 5mm space betweenthe borders of the tray and the tissues. Apply the tray adhesiveafter the try-in and tray modification/customization.&lt;/li&gt;&lt;/ul&gt;The impression coping screw has to be long enough toprotrude from the opening created in the tray.This opening can be closed with a piece of boxing wax,prior to loading of the tray (video 1 will be inserted here)If using the closed-tray technique:There is no need to open a hole on the impression trayMake sure that the tray does not contact the coping whenmaking the impression (video 2 will be inserted here)&lt;h4&gt;Sample Case Notes&lt;/h4&gt;&acirc;€œ .. ---Healing abutments removed from ( ) cleanedultrasonically in ( ) solution---(Closed / Open) tray technique used---Impression copings were placed onto the implant andseating was confirmed radiographically---(For the open tray technique) A screw access hole wasprepared on the tray---Impression taken using regular body (polyether /pvs) impression material in a full arch (stock / custom)impression tray---Impression checked for accuracy.---Impression coping removed &amp; healing abutment placedand hand-tightened---POI given.&acirc;€&lt;h4&gt;Post Operative Instructions&lt;/h4&gt;To be added.&lt;h3&gt;Try-in&lt;/h3&gt;&lt;h4&gt;Procedure&lt;/h4&gt;Implant components are machined to fit very tightly. Usuallya separate try-in appointment is not required. In situationswhere esthetics is priority, a single implant crown may needto be tried-in and sent back to the dental laboratory forimprovements.&lt;h4&gt;Required materials and suggested implant components&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;Manual implant screwdriver (short, medium or longdepending on the clinical situation) (figure 15 will beinserted here)&lt;/li&gt;&lt;li&gt;Articulating paper&lt;/li&gt;&lt;li&gt;Disclosing medium (i.e. fit checker) (figure 16 willbe inserted here)&lt;/li&gt;&lt;li&gt;Burs, polishing disks (figure 17 will be inserted here)&lt;/li&gt;&lt;li&gt;Slow-, and high-speed handpieces&lt;/li&gt;&lt;li&gt;Restorative/prosthodontics instrument cassette&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Clinical Procedure&lt;/h4&gt;Healing abutment or provisional implant crown is removed.For cement-retained restorations, the abutment is placedonto the implant first, using a try-in screw ((figure 18 willbe inserted here) is used. It is important to note that try-in screws are not designed to be torqued. Often the dentallaboratory is asked to fabricate a positioning jig, to helpfind the correct orientation of the abutment. Seating of thecustom abutments can cause discomfort to the patient, asthe emergence profile of the abutment may be significantlybigger than the healing abutment. In these cases, use oflocal anesthesia may be indicated. Once the abutment isseated, a periapical or bitewing radiograph may need tobe obtained to verify seating (fig 19 will be inserted here).The crown is then tried in checking the proximal contactsfirst. Verification of marginal fit is followed by checking theocclusal contacts.Screw-retained single implant crowns are tried in a similarway. Since the crown is made directly on the abutment,it is carried into the mouth, abutment screw is tightenedslowly and proximal contacts are checked first. (fig 20 will beinserted here) If the clinician believes that proximal contactsare acceptable, then a periapical or bitewing radiograph isobtained. Occlusion is checked last.(see insertion: next)&lt;h3&gt;Insertion&lt;/h3&gt;&lt;h4&gt;Required materials and suggested implant components&lt;/h4&gt;<ul>&lt;li&gt;Manual implant screwdriver (short, medium or longdepending on the clinical situation) (figure 15 will beinserted here)&lt;/li&gt;&lt;li&gt;Manual torque wrench&lt;/li&gt;&lt;li&gt;Machine heads for torque wrench&lt;/li&gt;&lt;li&gt;Articulating paper&lt;/li&gt;&lt;li&gt;Disclosing medium (i.e. fit checker) (figure 16 willbe inserted here)&lt;/li&gt;&lt;li&gt;Gutta-percha&lt;/li&gt;&lt;li&gt;Composite resin&lt;/li&gt;&lt;li&gt;Cotton-pelets&lt;/li&gt;&lt;li&gt;Burs, polishing disks (figure 17 will be inserted here)&lt;/li&gt;&lt;li&gt;Slow-, and high-speed handpieces&lt;/li&gt;&lt;li&gt;Restorative/prosthodontics instrument cassette&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Information&lt;/h4&gt;If the implant crown is tried in and found to be acceptable, thenthe abutment is placed using the appropriate final abutmentscrew. These screws are usually coated with dry lubricants and aredesigned to be torqued.&lt;h4&gt;Clinical Procedure&lt;/h4&gt;Implant manufacturers may have different torque requirements forabutment screws. (figure 20 will be inserted here)To avoid stripping of the screw heads, make sure that you have thecorrect screwdriver.(video 3 will be inserted here)&lt;h4&gt;Sample Case Notes (to be added)&lt;/h4&gt;&lt;h4&gt;Postoperative Instructions (to be added)&lt;/h4&gt;&lt;h3&gt;Media&lt;/h3&gt;See video.&lt;h3&gt;Maintenance and Recare&lt;/h3&gt;To be added.','<h3>Why the hell not?</h3> &lt;ul&gt;&lt;li&gt;List item&lt;/li&gt;&lt;li&gt;List item&lt;/li&gt;&lt;li&gt;List item&lt;/li&gt;&lt;/ul&gt;&lt;a href=\\&quot;http://yourlinkhere.com\\&quot; &gt;Name your link&lt;/a&gt;&lt;strong&gt;Bold text here&lt;/strong&gt;&lt;h4&gt;Header&lt;/h4&gt;');
/*!40000 ALTER TABLE `This_is_a_test` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appendix`
--

LOCK TABLES `appendix` WRITE;
/*!40000 ALTER TABLE `appendix` DISABLE KEYS */;
INSERT INTO `appendix` VALUES (1,'High noble metal alloys','noble metal content of at least 60 wt%, of which at least 40 wt % is gold\r\n(three subclasses: <ol> <li>Gold-platinum</li><li>Gold-palladium </li> <li>Gold-copper-silver-palladium</li>)</ol>'),(2,'Noble metal alloys','at least 25 wt % noble metal (three subclasses:<ol> <li>Gold-copper-silver-\r\npalladium</li><li>Palladium-copper-gallium</li><li>Palladium-silver and Silver-palladium</li>)</ol>'),(3,'Base-Metal Alloys','less than 25 wt % noble metal (three subclasses: <ol> <li>Nickel-chromium-\r\nberyllium</li><li>Nickel-chromium (with higher or lower chromium content)</li> <li>Cobalt-chromium</li>)</ol>');
/*!40000 ALTER TABLE `appendix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conditions`
--

LOCK TABLES `conditions` WRITE;
/*!40000 ALTER TABLE `conditions` DISABLE KEYS */;
INSERT INTO `conditions` VALUES (1,'Edentulism'),(2,'Abscess');
/*!40000 ALTER TABLE `conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edentulism`
--

DROP TABLE IF EXISTS `edentulism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edentulism` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edentulism`
--

LOCK TABLES `edentulism` WRITE;
/*!40000 ALTER TABLE `edentulism` DISABLE KEYS */;
INSERT INTO `edentulism` VALUES (1,'Partial Edentulism',NULL),(2,'Complete Edentulism',NULL),(3,'Fixed',1),(4,'Removable',1),(5,'Fixed',2),(6,'Removable',2),(7,'Single Tooth Replacement',3),(8,'Multiple Tooth Replacement',3);
/*!40000 ALTER TABLE `edentulism` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-31 11:44:37
