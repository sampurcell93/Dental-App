-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 17, 2012 at 05:26 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

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
-- Table structure for table `hierarchy`
--

CREATE TABLE IF NOT EXISTS `hierarchy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_name` varchar(60) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `terminates` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `hierarchy`
--

INSERT INTO `hierarchy` (`id`, `spec_name`, `parent_id`, `terminates`) VALUES
(1, 'Fixed', NULL, NULL),
(2, 'Fixed Partial', 1, NULL),
(3, 'Fixed Complete', 1, 1),
(4, 'Removable', NULL, NULL),
(5, 'Removable Partial', 4, 1),
(6, 'Removable Complete', 4, 1),
(7, 'Single Tooth', 2, 1),
(8, 'Multiple Teeth', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hierarchy2`
--

CREATE TABLE IF NOT EXISTS `hierarchy2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `hierarchy2`
--


-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE IF NOT EXISTS `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `info` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `spec`, `info`) VALUES
(28, 'Other test', '<h1>Other test</h1><h2>General</h2><h3>Indications/Contraindications</h3>Nothing here yet. <h3>Material options and suggested CDT codes</h3>Single implant crowns can be abutment- or implant- supported.<h4>i) Abutment Supported</h4><ul><li><strong>D6056 prefabricated abutment</strong></li><li>mostly for cement-type restorations</li><li>mostly titanium, rarely ceramic</li><li>all should be â€˜engagingâ€™ type</li></ul>(Figure 1 will be inserted here)<ul><li><strong>D6057 custom abutment</strong></li><li>mostly for cement-type restorations</li><li>can be made of cast gold alloy, titanium or zirconium</li><li>all should be â€˜engagingâ€™ type</li></ul>(Figure 2 will be inserted here)<ul><li><strong>D6058 Abutment supported porcelain/ceramic crown</strong></li><li>Tip 1: If made on a titanium abutment, recommend aceramic abutment with a polycrystalline ceramic core(such as zirconium) for better esthetic outcome.</li><li>Tip 2: If made on a ceramic abutment, then moretranslucent ceramics such as lithium disilicate can be usedwithout a significant risk of the abutment shade showingthrough</li></ul>(Figure 3 will be inserted here)<ul><li><strong>D6059 Abutment supported porcelain fused to metal crown(high noble metal)</strong></li><li>Tip 1: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 4 will be inserted here)<ul><li><strong>D6060 Abutment supported porcelain fused to metal crown(predominantly base metal)</strong></li><li>Tip: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 5 will be inserted here)<ul><li><strong>D6061 Abutment supported porcelain fused to metal crown(noble metal)</strong></li><li>Tip: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 6 will be inserted here)<ul><li><strong>D6062 Abutment supported cast metal crown (high noblemetal)</strong></li><li>Tip: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 7 will be inserted here)<ul><li><strong>D6064 Abutment supported cast metal crown (noble metal)</strong></li><li>Tip: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 8 will be inserted here)<h4>ii) Implant Supported </h4><ul><li><strong>D6065 implant supported ceramic crown</strong></li><li>Secured directly onto the implant</li><li>Screw-retained</li><li>Usually a CAD/CAM engaging abutment, Zr orAlumina, is designed to support veneering porcelain</li></ul>(Figure 9 will be inserted here)<ul><li><strong>D6066 Implant supported porcelain fused to metal crown(titanium, titanium alloy, high noble metal)</strong></li><li>Secured directly onto the implant</li><li>Screw-retained</li><li>Porcelain veneered on either titanium and titaniumalloy CAD engaging substructures or on gold alloycasted to â€˜cast-to- burnout abutments with machinedmetal engaging implant interfaces</li></ul><ul><li><strong>D6067 Implant supported metal crown (titanium, titaniumalloy, high noble alloy)</strong></li><li>Secured directly onto the implant</li><li>Screw-retained</li><li>gold alloy casted to â€˜cast-to- burnout abutments withmachined metal engaging implant interfaces</li></ul>(Figure 11 will be inserted here)<h2>Procedure</h2><h3>Impression</h3><ul><li>Single implant impressions can be made at the implant orabutment level. For majority of the cases, an implant-levelimpression is required. This enables the dentist/ technicianto choose the most appropriate abutment. The traditionalimplant impressions are made using machined impressioncopings that are specific for the implant placed andmedium-, or medium-light body elastomeric impressionmaterials.Open-tray technique is also known as the â€œpick-uptechniqueâ€. The impression coping is picked up with theimpression.Closed-tray technique is known as the â€œtransfertechniqueâ€. After removal of the impression tray, theimpression coping stays on the implant. It is then removed,and the implant replica is connected and the impressioncoping-implant replica is transferred to the impression.</li><li>Digital impressions at the implant level can be made usingcoded abutments or impression posts specific to someimplant companies (figure Chairside data acquisition isperformed with a CADCAM system (i.e. Cerec, Lava,E4D Dentist) that enables the dentist to send the digitalimpression to a production facility for fabrication of a model</li><li>Identify the type and platform of the implant to be restored. Ifnot sure, contact the surgeon.</li><li>The website <a href="www.whatimplantisthat.com">What implant is that</a> provides valuable information and offers an extensive database of radiographic images and specifications of dental implants.</li><li>Advantages/Disadvantages to be added</li></ul><h4>Required Materials and Suggested Implant Components</h4><ul><li>Manual implant screwdriver (short, medium or long depending on the clinical situation)</li><li>Impression tray</li><li>Impression syringe</li><li>Elastomeric impression material and adhesive</li><li>Local anesthetic (if needed)</li><li>Restorative/prosthodontics instrument cassette</li></ul><h4>Clinical Procedure</h4><ul><li>For most single implant impressions there is no need for localanesthesia</li><li>Using the appropriate screw driver (i.e. Unigrip Screw forNobelBiocare system) remove the healing abutment</li><li>Place the impression coping on the implant, engaging theantirotational mechanism (i.e. â€œtrilobeâ€ for Nobel Replaceimplants) (fig 14 will be inserted here)</li><li>Using the manual screwdriver, hand-tighten the impressioncoping screw. NEVER USE TORQUE WRENCHES for thisprocedure</li><li>Confirm seating of the impression coping with a periapical orbitewing radiograph (fig 16 will be inserted here)</li><li>Try the impression tray in. A full-arch tray is indicated for thisprocedure. There should be minimum of 5mm space betweenthe borders of the tray and the tissues. Apply the tray adhesiveafter the try-in and tray modification/customization.</li></ul>The impression coping screw has to be long enough toprotrude from the opening created in the tray.This opening can be closed with a piece of boxing wax,prior to loading of the tray (video 1 will be inserted here)If using the closed-tray technique:There is no need to open a hole on the impression trayMake sure that the tray does not contact the coping whenmaking the impression (video 2 will be inserted here)<h4>Sample Case Notes</h4>â€œ .. ---Healing abutments removed from ( ) cleanedultrasonically in ( ) solution---(Closed / Open) tray technique used---Impression copings were placed onto the implant andseating was confirmed radiographically---(For the open tray technique) A screw access hole wasprepared on the tray---Impression taken using regular body (polyether /pvs) impression material in a full arch (stock / custom)impression tray---Impression checked for accuracy.---Impression coping removed &amp; healing abutment placedand hand-tightened---POI given.â€<h4>Post Operative Instructions</h4>To be added.<h3>Try-in</h3><h4>Procedure</h4>Implant components are machined to fit very tightly. Usuallya separate try-in appointment is not required. In situationswhere esthetics is priority, a single implant crown may needto be tried-in and sent back to the dental laboratory forimprovements.<h4>Required materials and suggested implant components</h4><ul><li>Manual implant screwdriver (short, medium or longdepending on the clinical situation) (figure 15 will beinserted here)</li><li>Articulating paper</li><li>Disclosing medium (i.e. fit checker) (figure 16 willbe inserted here)</li><li>Burs, polishing disks (figure 17 will be inserted here)</li><li>Slow-, and high-speed handpieces</li><li>Restorative/prosthodontics instrument cassette</li></ul><h4>Clinical Procedure</h4>Healing abutment or provisional implant crown is removed.For cement-retained restorations, the abutment is placedonto the implant first, using a try-in screw ((figure 18 willbe inserted here) is used. It is important to note that try-in screws are not designed to be torqued. Often the dentallaboratory is asked to fabricate a positioning jig, to helpfind the correct orientation of the abutment. Seating of thecustom abutments can cause discomfort to the patient, asthe emergence profile of the abutment may be significantlybigger than the healing abutment. In these cases, use oflocal anesthesia may be indicated. Once the abutment isseated, a periapical or bitewing radiograph may need tobe obtained to verify seating (fig 19 will be inserted here).The crown is then tried in checking the proximal contactsfirst. Verification of marginal fit is followed by checking theocclusal contacts.Screw-retained single implant crowns are tried in a similarway. Since the crown is made directly on the abutment,it is carried into the mouth, abutment screw is tightenedslowly and proximal contacts are checked first. (fig 20 will beinserted here) If the clinician believes that proximal contactsare acceptable, then a periapical or bitewing radiograph isobtained. Occlusion is checked last.(see insertion: next)<h3>Insertion</h3><h4>Required materials and suggested implant components</h4><li>Manual implant screwdriver (short, medium or longdepending on the clinical situation) (figure 15 will beinserted here)</li><li>Manual torque wrench</li><li>Machine heads for torque wrench</li><li>Articulating paper</li><li>Disclosing medium (i.e. fit checker) (figure 16 willbe inserted here)</li><li>Gutta-percha</li><li>Composite resin</li><li>Cotton-pelets</li><li>Burs, polishing disks (figure 17 will be inserted here)</li><li>Slow-, and high-speed handpieces</li><li>Restorative/prosthodontics instrument cassette</li><h4>Information</h4>If the implant crown is tried in and found to be acceptable, thenthe abutment is placed using the appropriate final abutmentscrew. These screws are usually coated with dry lubricants and aredesigned to be torqued.<h4>Clinical Procedure</h4>Implant manufacturers may have different torque requirements forabutment screws. (figure 20 will be inserted here)To avoid stripping of the screw heads, make sure that you have thecorrect screwdriver.(video 3 will be inserted here)<h4>Sample Case Notes (to be added)</h4><h4>Postoperative Instructions (to be added)</h4><h3>Media</h3>See video.<h3>Maintenance and Recare</h3>To be added.'),
(27, 'Single Tooth', '<h1>Single Tooth</h1><h2>General Info</h2><h3>Indications/Contraindications</h3>Nothing here yet. <h3>Material options and suggested CDT codes</h3>Single implant crowns can be abutment- or implant- supported.<h4>i) Abutment Supported</h4><ul><li><strong>D6056 prefabricated abutment</strong></li><li>mostly for cement-type restorations</li><li>mostly titanium, rarely ceramic</li><li>all should be â€˜engagingâ€™ type</li></ul>(Figure 1 will be inserted here)<ul><li><strong>D6057 custom abutment</strong></li><li>mostly for cement-type restorations</li><li>can be made of cast gold alloy, titanium or zirconium</li><li>all should be â€˜engagingâ€™ type</li></ul>(Figure 2 will be inserted here)<ul><li><strong>D6058 Abutment supported porcelain/ceramic crown</strong></li><li>Tip 1: If made on a titanium abutment, recommend aceramic abutment with a polycrystalline ceramic core(such as zirconium) for better esthetic outcome.</li><li>Tip 2: If made on a ceramic abutment, then moretranslucent ceramics such as lithium disilicate can be usedwithout a significant risk of the abutment shade showingthrough</li></ul>(Figure 3 will be inserted here)<ul><li><strong>D6059 Abutment supported porcelain fused to metal crown(high noble metal)</strong></li><li>Tip 1: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 4 will be inserted here)<ul><li><strong>D6060 Abutment supported porcelain fused to metal crown(predominantly base metal)</strong></li><li>Tip: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 5 will be inserted here)<ul><li><strong>D6061 Abutment supported porcelain fused to metal crown(noble metal)</strong></li><li>Tip: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 6 will be inserted here)<ul><li><strong>D6062 Abutment supported cast metal crown (high noblemetal)</strong></li><li>Tip: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 7 will be inserted here)<ul><li><strong>D6064 Abutment supported cast metal crown (noble metal)</strong></li><li>Tip: Usually used with a metal abutment (custom orprefabricated)</li></ul>(Figure 8 will be inserted here)<h4>ii) Implant Supported </h4><ul><li><strong>D6065 implant supported ceramic crown</strong></li><li>Secured directly onto the implant</li><li>Screw-retained</li><li>Usually a CAD/CAM engaging abutment, Zr orAlumina, is designed to support veneering porcelain</li></ul>(Figure 9 will be inserted here)<ul><li><strong>D6066 Implant supported porcelain fused to metal crown(titanium, titanium alloy, high noble metal)</strong></li><li>Secured directly onto the implant</li><li>Screw-retained</li><li>Porcelain veneered on either titanium and titaniumalloy CAD engaging substructures or on gold alloycasted to â€˜cast-to- burnout abutments with machinedmetal engaging implant interfaces</li></ul><ul><li><strong>D6067 Implant supported metal crown (titanium, titaniumalloy, high noble alloy)</strong></li><li>Secured directly onto the implant</li><li>Screw-retained</li><li>gold alloy casted to â€˜cast-to- burnout abutments withmachined metal engaging implant interfaces</li></ul>(Figure 11 will be inserted here)<h2>Procedure</h2><h3>Impression</h3><ul><li>Single implant impressions can be made at the implant orabutment level. For majority of the cases, an implant-levelimpression is required. This enables the dentist/ technicianto choose the most appropriate abutment. The traditionalimplant impressions are made using machined impressioncopings that are specific for the implant placed andmedium-, or medium-light body elastomeric impressionmaterials.Open-tray technique is also known as the â€œpick-uptechniqueâ€. The impression coping is picked up with theimpression.Closed-tray technique is known as the â€œtransfertechniqueâ€. After removal of the impression tray, theimpression coping stays on the implant. It is then removed,and the implant replica is connected and the impressioncoping-implant replica is transferred to the impression.</li><li>Digital impressions at the implant level can be made usingcoded abutments or impression posts specific to someimplant companies (figure Chairside data acquisition isperformed with a CADCAM system (i.e. Cerec, Lava,E4D Dentist) that enables the dentist to send the digitalimpression to a production facility for fabrication of a model</li><li>Identify the type and platform of the implant to be restored. Ifnot sure, contact the surgeon.</li><li>The website <a href="www.whatimplantisthat.com">What implant is that</a> provides valuable information and offers an extensive database of radiographic images and specifications of dental implants.</li><li>Advantages/Disadvantages to be added</li></ul><h4>Required Materials and Suggested Implant Components</h4><ul><li>Manual implant screwdriver (short, medium or long depending on the clinical situation)</li><li>Impression tray</li><li>Impression syringe</li><li>Elastomeric impression material and adhesive</li><li>Local anesthetic (if needed)</li><li>Restorative/prosthodontics instrument cassette</li></ul><h4>Clinical Procedure</h4><ul><li>For most single implant impressions there is no need for localanesthesia</li><li>Using the appropriate screw driver (i.e. Unigrip Screw forNobelBiocare system) remove the healing abutment</li><li>Place the impression coping on the implant, engaging theantirotational mechanism (i.e. â€œtrilobeâ€ for Nobel Replaceimplants) (fig 14 will be inserted here)</li><li>Using the manual screwdriver, hand-tighten the impressioncoping screw. NEVER USE TORQUE WRENCHES for thisprocedure</li><li>Confirm seating of the impression coping with a periapical orbitewing radiograph (fig 16 will be inserted here)</li><li>Try the impression tray in. A full-arch tray is indicated for thisprocedure. There should be minimum of 5mm space betweenthe borders of the tray and the tissues. Apply the tray adhesiveafter the try-in and tray modification/customization.</li></ul>The impression coping screw has to be long enough toprotrude from the opening created in the tray.This opening can be closed with a piece of boxing wax,prior to loading of the tray (video 1 will be inserted here)If using the closed-tray technique:There is no need to open a hole on the impression trayMake sure that the tray does not contact the coping whenmaking the impression (video 2 will be inserted here)<h4>Sample Case Notes</h4>â€œ .. ---Healing abutments removed from ( ) cleanedultrasonically in ( ) solution---(Closed / Open) tray technique used---Impression copings were placed onto the implant andseating was confirmed radiographically---(For the open tray technique) A screw access hole wasprepared on the tray---Impression taken using regular body (polyether /pvs) impression material in a full arch (stock / custom)impression tray---Impression checked for accuracy.---Impression coping removed &amp; healing abutment placedand hand-tightened---POI given.â€<h4>Post Operative Instructions</h4>To be added.<h3>Try-in</h3><h4>Procedure</h4>Implant components are machined to fit very tightly. Usuallya separate try-in appointment is not required. In situationswhere esthetics is priority, a single implant crown may needto be tried-in and sent back to the dental laboratory forimprovements.<h4>Required materials and suggested implant components</h4><ul><li>Manual implant screwdriver (short, medium or longdepending on the clinical situation) (figure 15 will beinserted here)</li><li>Articulating paper</li><li>Disclosing medium (i.e. fit checker) (figure 16 willbe inserted here)</li><li>Burs, polishing disks (figure 17 will be inserted here)</li><li>Slow-, and high-speed handpieces</li><li>Restorative/prosthodontics instrument cassette</li></ul><h4>Clinical Procedure</h4>Healing abutment or provisional implant crown is removed.For cement-retained restorations, the abutment is placedonto the implant first, using a try-in screw ((figure 18 willbe inserted here) is used. It is important to note that try-in screws are not designed to be torqued. Often the dentallaboratory is asked to fabricate a positioning jig, to helpfind the correct orientation of the abutment. Seating of thecustom abutments can cause discomfort to the patient, asthe emergence profile of the abutment may be significantlybigger than the healing abutment. In these cases, use oflocal anesthesia may be indicated. Once the abutment isseated, a periapical or bitewing radiograph may need tobe obtained to verify seating (fig 19 will be inserted here).The crown is then tried in checking the proximal contactsfirst. Verification of marginal fit is followed by checking theocclusal contacts.Screw-retained single implant crowns are tried in a similarway. Since the crown is made directly on the abutment,it is carried into the mouth, abutment screw is tightenedslowly and proximal contacts are checked first. (fig 20 will beinserted here) If the clinician believes that proximal contactsare acceptable, then a periapical or bitewing radiograph isobtained. Occlusion is checked last.(see insertion: next)<h3>Insertion</h3><h4>Required materials and suggested implant components</h4><li>Manual implant screwdriver (short, medium or longdepending on the clinical situation) (figure 15 will beinserted here)</li><li>Manual torque wrench</li><li>Machine heads for torque wrench</li><li>Articulating paper</li><li>Disclosing medium (i.e. fit checker) (figure 16 willbe inserted here)</li><li>Gutta-percha</li><li>Composite resin</li><li>Cotton-pelets</li><li>Burs, polishing disks (figure 17 will be inserted here)</li><li>Slow-, and high-speed handpieces</li><li>Restorative/prosthodontics instrument cassette</li><h4>Information</h4>If the implant crown is tried in and found to be acceptable, thenthe abutment is placed using the appropriate final abutmentscrew. These screws are usually coated with dry lubricants and aredesigned to be torqued.<h4>Clinical Procedure</h4>Implant manufacturers may have different torque requirements forabutment screws. (figure 20 will be inserted here)To avoid stripping of the screw heads, make sure that you have thecorrect screwdriver.(video 3 will be inserted here)<h4>Sample Case Notes (to be added)</h4><h4>Postoperative Instructions (to be added)</h4><h3>Media</h3>See video.<h3>Maintenance and Recare</h3>To be added.');

-- --------------------------------------------------------

--
-- Table structure for table `Title`
--

CREATE TABLE IF NOT EXISTS `Title` (
  `head1` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Title`
--

INSERT INTO `Title` (`head1`) VALUES
('dqlkdmakd');
