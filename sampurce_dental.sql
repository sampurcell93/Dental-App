-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 01, 2012 at 06:46 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sampurce_dental`
--

-- --------------------------------------------------------

--
-- Table structure for table `1_3_7`
--

CREATE TABLE IF NOT EXISTS `1_3_7` (
  `header` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `1_3_7`
--

INSERT INTO `1_3_7` (`header`) VALUES
('yo!');

-- --------------------------------------------------------

--
-- Table structure for table `1_3_8`
--

CREATE TABLE IF NOT EXISTS `1_3_8` (
  `General Information` text,
  `Procedures` text NOT NULL,
  `A third header` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `1_3_8`
--

INSERT INTO `1_3_8` (`General Information`, `Procedures`, `A third header`) VALUES
('<h3>Indications/Contraindications</h3>\r\nNothing here yet. \r\n\r\n<h3>Material options and suggested CDT codes</h3>\r\nSingle implant crowns can be abutment- or implant- supported.\r\n\r\n\r\n<h4>i) Abutment Supported</h4>\r\n\r\n<ul>\r\n<li><strong>D6056 prefabricated abutment</strong></li>\r\n<li>mostly for cement-type restorations</li>\r\n<li>mostly titanium, rarely ceramic</li>\r\n<li>all should be ‘engaging’ type</li>\r\n</ul>\r\n(Figure 1 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6057 custom abutment</strong></li>\r\n<li>mostly for cement-type restorations</li>\r\n<li>can be made of cast gold alloy, titanium or zirconium</li>\r\n<li>all should be ‘engaging’ type</li>\r\n</ul>\r\n(Figure 2 will be inserted here)\r\n\r\n\r\n<ul>\r\n<li><strong>D6058 Abutment supported porcelain/ceramic crown</strong></li>\r\n<li>Tip 1: If made on a titanium abutment, recommend a\r\nceramic abutment with a polycrystalline ceramic core\r\n(such as zirconium) for better esthetic outcome.</li>\r\n<li>Tip 2: If made on a ceramic abutment, then more\r\ntranslucent ceramics such as lithium disilicate can be used\r\nwithout a significant risk of the abutment shade showing\r\nthrough</li>\r\n</ul>\r\n(Figure 3 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6059 Abutment supported porcelain fused to metal crown\r\n(high noble metal)</strong></li>\r\n<li>Tip 1: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 4 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6060 Abutment supported porcelain fused to metal crown\r\n(predominantly base metal)</strong></li>\r\n<li>Tip: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 5 will be inserted here)\r\n\r\n\r\n<ul>\r\n<li><strong>D6061 Abutment supported porcelain fused to metal crown\r\n(noble metal)</strong></li>\r\n<li>Tip: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 6 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6062 Abutment supported cast metal crown (high noble\r\nmetal)</strong></li>\r\n<li>Tip: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 7 will be inserted here)\r\n\r\n<ul>\r\n<li><strong>D6064 Abutment supported cast metal crown (noble metal)</strong></li>\r\n<li>Tip: Usually used with a metal abutment (custom or\r\nprefabricated)</li>\r\n</ul>\r\n\r\n(Figure 8 will be inserted here)\r\n\r\n<h4>ii) Implant Supported </h4>\r\n<ul>\r\n<li><strong>D6065 implant supported ceramic crown</strong></li>\r\n<li>Secured directly onto the implant</li>\r\n<li>Screw-retained</li>\r\n<li>Usually a CAD/CAM engaging abutment, Zr or\r\nAlumina, is designed to support veneering porcelain</li>\r\n</ul>\r\n\r\n(Figure 9 will be inserted here)\r\n\r\n\r\n<ul>\r\n<li><strong>D6066 Implant supported porcelain fused to metal crown\r\n(titanium, titanium alloy, high noble metal)</strong></li>\r\n<li>Secured directly onto the implant</li>\r\n<li>Screw-retained</li>\r\n<li>Porcelain veneered on either titanium and titanium\r\nalloy CAD engaging substructures or on gold alloy\r\ncasted to ‘cast-to- burnout abutments with machined\r\nmetal engaging implant interfaces</li>\r\n</ul>\r\n\r\n<ul>\r\n<li><strong>D6067 Implant supported metal crown (titanium, titanium\r\nalloy, high noble alloy)</strong></li>\r\n<li>Secured directly onto the implant</li>\r\n<li>Screw-retained</li>\r\n<li>gold alloy casted to ‘cast-to- burnout abutments with\r\nmachined metal engaging implant interfaces</li>\r\n</ul>\r\n\r\n(Figure 11 will be inserted here)\r\n', '\r\n<h3>Impression</h3>\r\n<ul>\r\n<li>Single implant impressions can be made at the implant or\r\nabutment level. For majority of the cases, an implant-level\r\nimpression is required. This enables the dentist/ technician\r\nto choose the most appropriate abutment. The traditional\r\nimplant impressions are made using machined impression\r\ncopings that are specific for the implant placed and\r\nmedium-, or medium-light body elastomeric impression\r\nmaterials.\r\nOpen-tray technique is also known as the “pick-up\r\ntechnique”. The impression coping is picked up with the\r\nimpression.\r\nClosed-tray technique is known as the “transfer\r\ntechnique”. After removal of the impression tray, the\r\nimpression coping stays on the implant. It is then removed,\r\nand the implant replica is connected and the impression\r\ncoping-implant replica is transferred to the impression.</li>\r\n<li>Digital impressions at the implant level can be made using\r\ncoded abutments or impression posts specific to some\r\nimplant companies (figure Chairside data acquisition is\r\nperformed with a CADCAM system (i.e. Cerec, Lava,\r\nE4D Dentist) that enables the dentist to send the digital\r\nimpression to a production facility for fabrication of a model</li>\r\n<li>Identify the type and platform of the implant to be restored. If\r\nnot sure, contact the surgeon.</li>\r\n<li>The website <a href="www.whatimplantisthat.com" >What implant is that</a> provides valuable information and offers an extensive database of radiographic images and specifications of dental implants.</li>\r\n<li>Advantages/Disadvantages to be added</li>\r\n</ul>\r\n\r\n<h4>Required Materials and Suggested Implant Components</h4>\r\n<ul>\r\n<li>Manual implant screwdriver (short, medium or long depending on the clinical situation)</li>\r\n<li>Impression tray</li>\r\n<li>Impression syringe</li>\r\n<li>Elastomeric impression material and adhesive</li>\r\n<li>Local anesthetic (if needed)</li>\r\n<li>Restorative/prosthodontics instrument cassette</li>\r\n</ul>\r\n\r\n<h4>Clinical Procedure</h4>\r\n<ul>\r\n<li>For most single implant impressions there is no need for local\r\nanesthesia</li>\r\n<li>Using the appropriate screw driver (i.e. Unigrip Screw for\r\nNobelBiocare system) remove the healing abutment</li>\r\n<li>Place the impression coping on the implant, engaging the\r\nantirotational mechanism (i.e. “trilobe” for Nobel Replace\r\nimplants) (fig 14 will be inserted here)</li>\r\n<li>Using the manual screwdriver, hand-tighten the impression\r\ncoping screw. NEVER USE TORQUE WRENCHES for this\r\nprocedure</li>\r\n<li>Confirm seating of the impression coping with a periapical or\r\nbitewing radiograph (fig 16 will be inserted here)</li>\r\n<li>Try the impression tray in. A full-arch tray is indicated for this\r\nprocedure. There should be minimum of 5mm space between\r\nthe borders of the tray and the tissues. Apply the tray adhesive\r\nafter the try-in and tray modification/customization.</li>\r\n</ul>\r\n\r\nThe impression coping screw has to be long enough to\r\nprotrude from the opening created in the tray.\r\n\r\nThis opening can be closed with a piece of boxing wax,\r\nprior to loading of the tray (video 1 will be inserted here)\r\n\r\nIf using the closed-tray technique:\r\n\r\nThere is no need to open a hole on the impression tray\r\n\r\nMake sure that the tray does not contact the coping when\r\nmaking the impression (video 2 will be inserted here)\r\n\r\n<h4>Sample Case Notes</h4>\r\n\r\n“ .. ---Healing abutments removed from ( ) cleaned\r\nultrasonically in ( ) solution\r\n---(Closed / Open) tray technique used\r\n---Impression copings were placed onto the implant and\r\nseating was confirmed radiographically\r\n---(For the open tray technique) A screw access hole was\r\nprepared on the tray\r\n---Impression taken using regular body (polyether /\r\npvs) impression material in a full arch (stock / custom)\r\nimpression tray\r\n---Impression checked for accuracy.\r\n---Impression coping removed & healing abutment placed\r\nand hand-tightened\r\n---POI given.”\r\n\r\n\r\n<h4>Post Operative Instructions</h4>\r\n\r\nTo be added.\r\n\r\n<h3>Try-in</h3>\r\n\r\n<h4>Procedure</h4>\r\nImplant components are machined to fit very tightly. Usually\r\na separate try-in appointment is not required. In situations\r\nwhere esthetics is priority, a single implant crown may need\r\nto be tried-in and sent back to the dental laboratory for\r\nimprovements.\r\n\r\n<h4>Required materials and suggested implant components</h4>\r\n<ul>\r\n<li>Manual implant screwdriver (short, medium or long\r\ndepending on the clinical situation) (figure 15 will be\r\ninserted here)</li>\r\n<li>Articulating paper</li>\r\n<li>Disclosing medium (i.e. fit checker) (figure 16 will\r\nbe inserted here)</li>\r\n<li>Burs, polishing disks (figure 17 will be inserted here)</li>\r\n<li>Slow-, and high-speed handpieces</li>\r\n<li>Restorative/prosthodontics instrument cassette</li>\r\n</ul>\r\n\r\n<h4>Clinical Procedure</h4>\r\nHealing abutment or provisional implant crown is removed.\r\nFor cement-retained restorations, the abutment is placed\r\nonto the implant first, using a try-in screw ((figure 18 will\r\nbe inserted here) is used. It is important to note that try-\r\nin screws are not designed to be torqued. Often the dental\r\nlaboratory is asked to fabricate a positioning jig, to help\r\nfind the correct orientation of the abutment. Seating of the\r\ncustom abutments can cause discomfort to the patient, as\r\nthe emergence profile of the abutment may be significantly\r\nbigger than the healing abutment. In these cases, use of\r\nlocal anesthesia may be indicated. Once the abutment is\r\nseated, a periapical or bitewing radiograph may need to\r\nbe obtained to verify seating (fig 19 will be inserted here).\r\nThe crown is then tried in checking the proximal contacts\r\nfirst. Verification of marginal fit is followed by checking the\r\nocclusal contacts.\r\n\r\nScrew-retained single implant crowns are tried in a similar\r\nway. Since the crown is made directly on the abutment,\r\nit is carried into the mouth, abutment screw is tightened\r\nslowly and proximal contacts are checked first. (fig 20 will be\r\ninserted here) If the clinician believes that proximal contacts\r\nare acceptable, then a periapical or bitewing radiograph is\r\nobtained. Occlusion is checked last.\r\n\r\n(see insertion: next)\r\n\r\n<h3>Insertion</h3>\r\n<h4>Required materials and suggested implant components</h4>\r\n<ul>\r\n<li>Manual implant screwdriver (short, medium or long\r\ndepending on the clinical situation) (figure 15 will be\r\ninserted here)</li>\r\n<li>Manual torque wrench</li>\r\n<li>Machine heads for torque wrench</li>\r\n<li>Articulating paper</li>\r\n<li>Disclosing medium (i.e. fit checker) (figure 16 will\r\nbe inserted here)</li>\r\n<li>Gutta-percha</li>\r\n<li>Composite resin</li>\r\n<li>Cotton-pelets</li>\r\n<li>Burs, polishing disks (figure 17 will be inserted here)</li>\r\n<li>Slow-, and high-speed handpieces</li>\r\n<li>Restorative/prosthodontics instrument cassette</li>\r\n</ul>', '<h3>Try-In</h3>\r\n\r\n<h4>Here it is</h4>\r\n<p>fmwfsfksfn</p>\r\n<h3>Clinical Procedure</h3>\r\n<h3>Impressions</h3>');

-- --------------------------------------------------------

--
-- Table structure for table `1_4`
--

CREATE TABLE IF NOT EXISTS `1_4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `1_4`
--


-- --------------------------------------------------------

--
-- Table structure for table `1_8`
--

CREATE TABLE IF NOT EXISTS `1_8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `1_8`
--


-- --------------------------------------------------------

--
-- Table structure for table `appendix`
--

CREATE TABLE IF NOT EXISTS `appendix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term` varchar(60) DEFAULT NULL,
  `definition` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `appendix`
--

INSERT INTO `appendix` (`id`, `term`, `definition`) VALUES
(1, 'High noble metal alloys', 'noble metal content of at least 60 wt%, of which at least 40 wt % is gold\r\n(three subclasses: <ol> <li>Gold-platinum</li><li>Gold-palladium </li> <li>Gold-copper-silver-palladium</li>)</ol>'),
(2, 'Noble metal alloys', 'at least 25 wt % noble metal (three subclasses:<ol> <li>Gold-copper-silver-\r\npalladium</li><li>Palladium-copper-gallium</li><li>Palladium-silver and Silver-palladium</li>)</ol>'),
(3, 'Base-Metal Alloys', 'less than 25 wt % noble metal (three subclasses: <ol> <li>Nickel-chromium-\r\nberyllium</li><li>Nickel-chromium (with higher or lower chromium content)</li> <li>Cobalt-chromium</li>)</ol>');

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE IF NOT EXISTS `conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `conditions`
--

INSERT INTO `conditions` (`id`, `name`) VALUES
(1, 'Edentulism'),
(2, 'Abscess');

-- --------------------------------------------------------

--
-- Table structure for table `edentulism`
--

CREATE TABLE IF NOT EXISTS `edentulism` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `edentulism`
--

INSERT INTO `edentulism` (`id`, `name`, `parent_id`) VALUES
(1, 'Partial Edentulism', NULL),
(2, 'Complete Edentulism', NULL),
(3, 'Fixed', 1),
(4, 'Removable', 1),
(5, 'Fixed', 2),
(6, 'Removable', 2),
(7, 'Single Tooth Replacement', 3),
(8, 'Multiple Teeth Replacement', 3);

-- --------------------------------------------------------

--
-- Table structure for table `edentulism_content`
--

CREATE TABLE IF NOT EXISTS `edentulism_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(20) CHARACTER SET utf8 NOT NULL,
  `barebones` longtext CHARACTER SET utf8 NOT NULL,
  `formatted` longtext CHARACTER SET utf8,
  `table_text` varchar(255) CHARACTER SET utf8 NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `edentulism_content`
--

INSERT INTO `edentulism_content` (`id`, `tablename`, `barebones`, `formatted`, `table_text`) VALUES
(10, '2_6', '<h2>General Information</h2> \r\n <h3 class=''hasNoChildren''>Indications/Contraindications</h3><span class=''hidden noChildren''></span> \r\n <div class=''relative descriptor''><p>There are no indications or contraindications as of yet.</p></div> \r\n <h3 class=''hasNoChildren''>Suggested Materials and CDT Codes</h3><span class=''hidden noChildren''></span> \r\n <div class=''relative descriptor''><p>Abutment supported:<br><ul><li>D67801Supported</li><li>Mostly for cement type restorations</li><li>Use metal crowns</li></ul></p></div> \r\n <h2>Procedures</h2> \r\n <h3 class=''hasChildren''>Impression</h3><span class=''hidden children''></span> \r\n <h4>Clinical Procedure</h4> \r\n <div class=''relative descriptor''><p><ol><li>List 1</li><li>List 2</li><li>List 3</li><li>Another step</li><li>Another</li><li>Done!</li></ol></p></div> \r\n <h4>Required Components</h4> \r\n <div class=''relative descriptor''><p><ol><li>List 1</li><li>List 2</li><li>List 3</li></ol></p></div> \r\n <h4>Sample Case Notes</h4> \r\n <div class=''relative descriptor''><p>"Let''s see how the app responds to a quoted string"</p></div> \r\n <h3 class=''hasChildren''>Try-In</h3><span class=''hidden children''></span> \r\n <h4>More</h4> \r\n <div class=''relative descriptor''><p>More</p></div> \r\n <h4>Stuff</h4> \r\n <div class=''relative descriptor''><p>Stuff</p></div> \r\n <h4>Will</h4> \r\n <div class=''relative descriptor''><p><ol><li>List 1</li><li>List 2</li><li>List 3</li></ol></p></div> \r\n <h4>Go</h4> \r\n <div class=''relative descriptor''><p>Go</p></div> \r\n <h4>Here</h4> \r\n <div class=''relative descriptor''><p>Here</p></div> \r\n <h3 class=''hasNoChildren''>Mix children with no children.</h3><span class=''hidden noChildren''></span> \r\n <div class=''relative descriptor''><p><ol><li>List 1</li><li>List 2</li><li>List 3</li></ol></p></div></ul></div></div>', '</div><div data-role="collapsible" class="section" data-collapsed="false" data-theme="a" data-content-theme="d"><h2>General Information</h2> \r\n <h3 class="sibling listitem"><a class="goToPage">Indications/Contraindications</a></h3> \r\n <div class=''relative descriptor hidden'' data-page=''page2''><p>There are no indications or contraindications as of yet.</p></div>\r\n \r\n <h3 class="sibling listitem"><a class="goToPage">Suggested Materials and CDT Codes</a></h3> \r\n <div class=''relative descriptor hidden'' data-page=''page4''><p>Abutment supported:<br><ul><li>D67801Supported</li><li>Mostly for cement type restorations</li><li>Use metal crowns</li></ul></p></div>\r\n \r\n </div><div data-role="collapsible" class="section" data-collapsed="false" data-theme="a" data-content-theme="d"><h2>Procedures</h2> \r\n <div data-role="collapsible" data-collapsed="true"><h3>Impression</h3><ul data-role="listview" data-inset="true" data-theme="d"> \r\n <li><a class=''goToPage''>Clinical Procedure</a></li> \r\n <div class=''relative descriptor hidden'' data-page=''page8''><p><ol><li>List 1</li><li>List 2</li><li>List 3</li><li>Another step</li><li>Another</li><li>Done!</li></ol></p></div>\r\n \r\n <li><a class=''goToPage''>Required Components</a></li> \r\n <div class=''relative descriptor hidden'' data-page=''page10''><p><ol><li>List 1</li><li>List 2</li><li>List 3</li></ol></p></div>\r\n \r\n <li class=''last-li''><a class=''goToPage''>Sample Case Notes</a></li></ul></div> \r\n <div class=''relative descriptor hidden'' data-page=''page12''><p>"Let''s see how the app responds to a quoted string"</p></div>\r\n \r\n <div data-role="collapsible" data-collapsed="true"><h3>Try-In</h3><ul data-role="listview" data-inset="true" data-theme="d"> \r\n <li><a class=''goToPage''>More</a></li> \r\n <div class=''relative descriptor hidden'' data-page=''page15''><p>More</p></div>\r\n \r\n <li><a class=''goToPage''>Stuff</a></li> \r\n <div class=''relative descriptor hidden'' data-page=''page17''><p>Stuff</p></div>\r\n \r\n <li><a class=''goToPage''>Will</a></li> \r\n <div class=''relative descriptor hidden'' data-page=''page19''><p><ol><li>List 1</li><li>List 2</li><li>List 3</li></ol></p></div>\r\n \r\n <li><a class=''goToPage''>Go</a></li> \r\n <div class=''relative descriptor hidden'' data-page=''page21''><p>Go</p></div>\r\n \r\n <li class=''last-li''><a class=''goToPage''>Here</a></li></ul></div> \r\n <div class=''relative descriptor hidden'' data-page=''page23''><p>Here</p></div>\r\n \r\n <h3 class="sibling listitem"><a class="goToPage">Mix children with no children.</a></h3> \r\n <div class=''relative descriptor hidden'' data-page=''page25''><p><ol><li>List 1</li><li>List 2</li><li>List 3</li></ol></p></div>\r\n', 'Edentulism: Complete Edentulism, Removable');
