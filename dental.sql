-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 28, 2012 at 06:34 PM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dental_info`
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
(1, 'High noble metal alloys', 'noble metal content of at least 60 wt%, of which at least 40 wt % is gold\r\n(three subclasses: <ul> <li>1) Gold-platinum</li><li>2) Gold-palladium </li> <li>3) Gold-copper-silver-palladium</li>)</ul>'),
(2, 'Noble metal alloys', 'at least 25 wt % noble metal (three subclasses:<ul> <li>1) Gold-copper-silver-\r\npalladium</li><li>2) Palladium-copper-gallium</li><li>3) Palladium-silver and Silver-palladium</li>)</ul>'),
(3, 'Base-Metal Alloys', 'less than 25 wt % noble metal (three subclasses: <ul> <li>1) Nickel-chromium-\r\nberyllium</li><l>2) Nickel-chromium (with higher or lower chromium content)</li> <li>3) Cobalt-chromium</li>)</ul>');

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE IF NOT EXISTS `conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

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
(8, 'Multiple Tooth Replacement', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Fixed_Partial_Edentulism_Multiple_Tooth_Replacement`
--

CREATE TABLE IF NOT EXISTS `Fixed_Partial_Edentulism_Multiple_Tooth_Replacement` (
  `This_is_a_test_header` text CHARACTER SET latin1,
  `Header2` text NOT NULL,
  `This is the worst` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Fixed_Partial_Edentulism_Multiple_Tooth_Replacement`
--

INSERT INTO `Fixed_Partial_Edentulism_Multiple_Tooth_Replacement` (`This_is_a_test_header`, `Header2`, `This is the worst`) VALUES
('&lt;h3&gt;Header1&lt;/h3&gt;Gimme some of dat&lt;h3&gt;Header2&lt;/h3&gt;I want some mo\\''&lt;h3&gt;Header3&lt;/h3&gt;But really&lt;h3&gt;Header4&lt;/h3&gt;Mo\\''', '<h3>uaininai anndnaa aaa</h3>\r\n<h3>uaininai anndnaa aaa2</h3>\r\n<h3>uaininai anndnaa aaa3</h3>', '<h3>Try-In</h3>\r\n\r\n<h4>Here it is</h4>\r\n<p>fmwfsfksfn</p>\r\n<h3>Clinical Procedure</h3>\r\n<h3>Impressions</h3>');

-- --------------------------------------------------------

--
-- Table structure for table `This_is_a_test`
--

CREATE TABLE IF NOT EXISTS `This_is_a_test` (
  `General_Information` text,
  `Procedures` text,
  `This_is_a_test_header` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `This_is_a_test`
--

INSERT INTO `This_is_a_test` (`General_Information`, `Procedures`, `This_is_a_test_header`) VALUES
('&lt;h3&gt;Indications/Contraindications&lt;/h3&gt;Nothing here yet. &lt;h3&gt;Material options and suggested CDT codes&lt;/h3&gt;Single implant crowns can be abutment- or implant- supported.&lt;h4&gt;i) Abutment Supported&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6056 prefabricated abutment&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;mostly for cement-type restorations&lt;/li&gt;&lt;li&gt;mostly titanium, rarely ceramic&lt;/li&gt;&lt;li&gt;all should be &acirc;€˜engaging&acirc;€™ type&lt;/li&gt;&lt;/ul&gt;(Figure 1 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6057 custom abutment&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;mostly for cement-type restorations&lt;/li&gt;&lt;li&gt;can be made of cast gold alloy, titanium or zirconium&lt;/li&gt;&lt;li&gt;all should be &acirc;€˜engaging&acirc;€™ type&lt;/li&gt;&lt;/ul&gt;(Figure 2 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6058 Abutment supported porcelain/ceramic crown&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip 1: If made on a titanium abutment, recommend aceramic abutment with a polycrystalline ceramic core(such as zirconium) for better esthetic outcome.&lt;/li&gt;&lt;li&gt;Tip 2: If made on a ceramic abutment, then moretranslucent ceramics such as lithium disilicate can be usedwithout a significant risk of the abutment shade showingthrough&lt;/li&gt;&lt;/ul&gt;(Figure 3 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6059 Abutment supported porcelain fused to metal crown(high noble metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip 1: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 4 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6060 Abutment supported porcelain fused to metal crown(predominantly base metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 5 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6061 Abutment supported porcelain fused to metal crown(noble metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 6 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6062 Abutment supported cast metal crown (high noblemetal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 7 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6064 Abutment supported cast metal crown (noble metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Tip: Usually used with a metal abutment (custom orprefabricated)&lt;/li&gt;&lt;/ul&gt;(Figure 8 will be inserted here)&lt;h4&gt;ii) Implant Supported &lt;/h4&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6065 implant supported ceramic crown&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Secured directly onto the implant&lt;/li&gt;&lt;li&gt;Screw-retained&lt;/li&gt;&lt;li&gt;Usually a CAD/CAM engaging abutment, Zr orAlumina, is designed to support veneering porcelain&lt;/li&gt;&lt;/ul&gt;(Figure 9 will be inserted here)&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6066 Implant supported porcelain fused to metal crown(titanium, titanium alloy, high noble metal)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Secured directly onto the implant&lt;/li&gt;&lt;li&gt;Screw-retained&lt;/li&gt;&lt;li&gt;Porcelain veneered on either titanium and titaniumalloy CAD engaging substructures or on gold alloycasted to &acirc;€˜cast-to- burnout abutments with machinedmetal engaging implant interfaces&lt;/li&gt;&lt;/ul&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;D6067 Implant supported metal crown (titanium, titaniumalloy, high noble alloy)&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Secured directly onto the implant&lt;/li&gt;&lt;li&gt;Screw-retained&lt;/li&gt;&lt;li&gt;gold alloy casted to &acirc;€˜cast-to- burnout abutments withmachined metal engaging implant interfaces&lt;/li&gt;(Figure 11 will be inserted here)&lt;/ul&gt;', ' &lt;h3&gt;Impression&lt;/h3&gt;&lt;ul&gt;&lt;li&gt;Single implant impressions can be made at the implant orabutment level. For majority of the cases, an implant-levelimpression is required. This enables the dentist/ technpicianto choose the most appropriate abutment. The traditionalimplant impressions are made using machined impressioncopings that are specific for the implant placed andmedium-, or medium-light body elastomeric impressionmaterials.Open-tray technique is also known as the &acirc;€œpick-uptechnique&acirc;€. The impression coping is picked up with theimpression.Closed-tray technique is known as the &acirc;€œtransfertechnique&acirc;€. After removal of the impression tray, theimpression coping stays on the implant. It is then removed,and the implant replica is connected and the impressioncoping-implant replica is transferred to the impression.&lt;/li&gt;&lt;li&gt;Digital impressions at the implant level can be made usingcoded abutments or impression posts specific to someimplant companies (figure Chairside data acquisition isperformed with a CADCAM system (i.e. Cerec, Lava,E4D Dentist) that enables the dentist to send the digitalimpression to a production facility for fabrication of a model&lt;/li&gt;&lt;li&gt;Identify the type and platform of the implant to be restored. Ifnot sure, contact the surgeon.&lt;/li&gt;&lt;li&gt;The website &lt;a href=\\&quot;www.whatimplantisthat.com\\&quot; &gt;What implant is that&lt;/a&gt; provides valuable information and offers an extensive database of radiographic images and specifications of dental implants.&lt;/li&gt;&lt;li&gt;Advantages/Disadvantages to be added&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Required Materials and Suggested Implant Components&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;Manual implant screwdriver (short, medium or long depending on the clinical situation)&lt;/li&gt;&lt;li&gt;Impression tray&lt;/li&gt;&lt;li&gt;Impression syringe&lt;/li&gt;&lt;li&gt;Elastomeric impression material and adhesive&lt;/li&gt;&lt;li&gt;Local anesthetic (if needed)&lt;/li&gt;&lt;li&gt;Restorative/prosthodontics instrument cassette&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Clinical Procedure&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;For most single implant impressions there is no need for localanesthesia&lt;/li&gt;&lt;li&gt;Using the appropriate screw driver (i.e. Unigrip Screw forNobelBiocare system) remove the healing abutment&lt;/li&gt;&lt;li&gt;Place the impression coping on the implant, engaging theantirotational mechanism (i.e. &acirc;€œtrilobe&acirc;€ for Nobel Replaceimplants) (fig 14 will be inserted here)&lt;/li&gt;&lt;li&gt;Using the manual screwdriver, hand-tighten the impressioncoping screw. NEVER USE TORQUE WRENCHES for thisprocedure&lt;/li&gt;&lt;li&gt;Confirm seating of the impression coping with a periapical orbitewing radiograph (fig 16 will be inserted here)&lt;/li&gt;&lt;li&gt;Try the impression tray in. A full-arch tray is indicated for thisprocedure. There should be minimum of 5mm space betweenthe borders of the tray and the tissues. Apply the tray adhesiveafter the try-in and tray modification/customization.&lt;/li&gt;&lt;/ul&gt;The impression coping screw has to be long enough toprotrude from the opening created in the tray.This opening can be closed with a piece of boxing wax,prior to loading of the tray (video 1 will be inserted here)If using the closed-tray technique:There is no need to open a hole on the impression trayMake sure that the tray does not contact the coping whenmaking the impression (video 2 will be inserted here)&lt;h4&gt;Sample Case Notes&lt;/h4&gt;&acirc;€œ .. ---Healing abutments removed from ( ) cleanedultrasonically in ( ) solution---(Closed / Open) tray technique used---Impression copings were placed onto the implant andseating was confirmed radiographically---(For the open tray technique) A screw access hole wasprepared on the tray---Impression taken using regular body (polyether /pvs) impression material in a full arch (stock / custom)impression tray---Impression checked for accuracy.---Impression coping removed &amp; healing abutment placedand hand-tightened---POI given.&acirc;€&lt;h4&gt;Post Operative Instructions&lt;/h4&gt;To be added.&lt;h3&gt;Try-in&lt;/h3&gt;&lt;h4&gt;Procedure&lt;/h4&gt;Implant components are machined to fit very tightly. Usuallya separate try-in appointment is not required. In situationswhere esthetics is priority, a single implant crown may needto be tried-in and sent back to the dental laboratory forimprovements.&lt;h4&gt;Required materials and suggested implant components&lt;/h4&gt;&lt;ul&gt;&lt;li&gt;Manual implant screwdriver (short, medium or longdepending on the clinical situation) (figure 15 will beinserted here)&lt;/li&gt;&lt;li&gt;Articulating paper&lt;/li&gt;&lt;li&gt;Disclosing medium (i.e. fit checker) (figure 16 willbe inserted here)&lt;/li&gt;&lt;li&gt;Burs, polishing disks (figure 17 will be inserted here)&lt;/li&gt;&lt;li&gt;Slow-, and high-speed handpieces&lt;/li&gt;&lt;li&gt;Restorative/prosthodontics instrument cassette&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Clinical Procedure&lt;/h4&gt;Healing abutment or provisional implant crown is removed.For cement-retained restorations, the abutment is placedonto the implant first, using a try-in screw ((figure 18 willbe inserted here) is used. It is important to note that try-in screws are not designed to be torqued. Often the dentallaboratory is asked to fabricate a positioning jig, to helpfind the correct orientation of the abutment. Seating of thecustom abutments can cause discomfort to the patient, asthe emergence profile of the abutment may be significantlybigger than the healing abutment. In these cases, use oflocal anesthesia may be indicated. Once the abutment isseated, a periapical or bitewing radiograph may need tobe obtained to verify seating (fig 19 will be inserted here).The crown is then tried in checking the proximal contactsfirst. Verification of marginal fit is followed by checking theocclusal contacts.Screw-retained single implant crowns are tried in a similarway. Since the crown is made directly on the abutment,it is carried into the mouth, abutment screw is tightenedslowly and proximal contacts are checked first. (fig 20 will beinserted here) If the clinician believes that proximal contactsare acceptable, then a periapical or bitewing radiograph isobtained. Occlusion is checked last.(see insertion: next)&lt;h3&gt;Insertion&lt;/h3&gt;&lt;h4&gt;Required materials and suggested implant components&lt;/h4&gt;<ul>&lt;li&gt;Manual implant screwdriver (short, medium or longdepending on the clinical situation) (figure 15 will beinserted here)&lt;/li&gt;&lt;li&gt;Manual torque wrench&lt;/li&gt;&lt;li&gt;Machine heads for torque wrench&lt;/li&gt;&lt;li&gt;Articulating paper&lt;/li&gt;&lt;li&gt;Disclosing medium (i.e. fit checker) (figure 16 willbe inserted here)&lt;/li&gt;&lt;li&gt;Gutta-percha&lt;/li&gt;&lt;li&gt;Composite resin&lt;/li&gt;&lt;li&gt;Cotton-pelets&lt;/li&gt;&lt;li&gt;Burs, polishing disks (figure 17 will be inserted here)&lt;/li&gt;&lt;li&gt;Slow-, and high-speed handpieces&lt;/li&gt;&lt;li&gt;Restorative/prosthodontics instrument cassette&lt;/li&gt;&lt;/ul&gt;&lt;h4&gt;Information&lt;/h4&gt;If the implant crown is tried in and found to be acceptable, thenthe abutment is placed using the appropriate final abutmentscrew. These screws are usually coated with dry lubricants and aredesigned to be torqued.&lt;h4&gt;Clinical Procedure&lt;/h4&gt;Implant manufacturers may have different torque requirements forabutment screws. (figure 20 will be inserted here)To avoid stripping of the screw heads, make sure that you have thecorrect screwdriver.(video 3 will be inserted here)&lt;h4&gt;Sample Case Notes (to be added)&lt;/h4&gt;&lt;h4&gt;Postoperative Instructions (to be added)&lt;/h4&gt;&lt;h3&gt;Media&lt;/h3&gt;See video.&lt;h3&gt;Maintenance and Recare&lt;/h3&gt;To be added.', '<h3>Why the hell not?</h3> &lt;ul&gt;&lt;li&gt;List item&lt;/li&gt;&lt;li&gt;List item&lt;/li&gt;&lt;li&gt;List item&lt;/li&gt;&lt;/ul&gt;&lt;a href=\\&quot;http://yourlinkhere.com\\&quot; &gt;Name your link&lt;/a&gt;&lt;strong&gt;Bold text here&lt;/strong&gt;&lt;h4&gt;Header&lt;/h4&gt;');
