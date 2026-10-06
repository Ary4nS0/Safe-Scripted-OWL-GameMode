-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for mta
CREATE DATABASE IF NOT EXISTS `mta` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `mta`;

-- Dumping structure for table mta.account_details
CREATE TABLE IF NOT EXISTS `account_details` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastlogin` datetime DEFAULT NULL,
  `warn_style` int(1) NOT NULL DEFAULT 1,
  `hiddenadmin` tinyint(3) unsigned DEFAULT 0,
  `adminjail` tinyint(3) unsigned DEFAULT 0,
  `adminjail_time` int(11) DEFAULT NULL,
  `adminjail_by` text DEFAULT NULL,
  `adminjail_reason` text DEFAULT NULL,
  `muted` tinyint(3) unsigned DEFAULT 0,
  `globalooc` tinyint(3) unsigned DEFAULT 1,
  `friendsmessage` varchar(255) NOT NULL DEFAULT 'Hi!',
  `adminjail_permanent` tinyint(3) unsigned DEFAULT 0,
  `adminreports` int(11) DEFAULT 0,
  `warns` tinyint(3) unsigned DEFAULT 0,
  `chatbubbles` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `adminnote` text DEFAULT NULL,
  `appstate` tinyint(1) DEFAULT 0,
  `appdatetime` datetime DEFAULT NULL,
  `appreason` longtext DEFAULT NULL,
  `help` int(1) NOT NULL DEFAULT 1,
  `adblocked` int(1) NOT NULL DEFAULT 0,
  `newsblocked` int(1) DEFAULT 0,
  `mtaserial` text DEFAULT NULL,
  `d_addiction` text DEFAULT NULL,
  `loginhash` varchar(64) DEFAULT NULL,
  `transfers` int(11) DEFAULT 0,
  `monitored` varchar(255) NOT NULL DEFAULT '',
  `autopark` int(1) NOT NULL DEFAULT 1,
  `forceUpdate` smallint(1) NOT NULL DEFAULT 0,
  `anotes` text DEFAULT NULL,
  `oldAdminRank` int(11) DEFAULT 0,
  `suspensionTime` bigint(20) DEFAULT NULL,
  `car_license` int(1) NOT NULL DEFAULT 0,
  `adminreports_saved` int(3) DEFAULT 0,
  `cpa_earned` double DEFAULT 0,
  `electionsvoted` int(11) NOT NULL DEFAULT 0,
  `serial_whitelist_cap` int(2) NOT NULL DEFAULT 2,
  `max_characters` int(10) unsigned NOT NULL DEFAULT 30,
  `remember_token` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.account_details: 3 rows
INSERT IGNORE INTO `account_details` (`account_id`, `lastlogin`, `warn_style`, `hiddenadmin`, `adminjail`, `adminjail_time`, `adminjail_by`, `adminjail_reason`, `muted`, `globalooc`, `friendsmessage`, `adminjail_permanent`, `adminreports`, `warns`, `chatbubbles`, `adminnote`, `appstate`, `appdatetime`, `appreason`, `help`, `adblocked`, `newsblocked`, `mtaserial`, `d_addiction`, `loginhash`, `transfers`, `monitored`, `autopark`, `forceUpdate`, `anotes`, `oldAdminRank`, `suspensionTime`, `car_license`, `adminreports_saved`, `cpa_earned`, `electionsvoted`, `serial_whitelist_cap`, `max_characters`, `remember_token`) VALUES
	(1, '2026-09-19 18:01:28', 1, 0, 0, NULL, NULL, NULL, 0, 1, 'gozoooo', 0, 6, 0, 1, NULL, 3, NULL, NULL, 1, 0, 0, '54EE70D5533DB72874D75A9A0F404FA1', NULL, NULL, 0, '', 1, 0, NULL, 0, NULL, 0, 6, 0, 0, 2, 30, ''),
	(3, '2026-09-17 01:11:43', 1, 0, 0, NULL, NULL, NULL, 0, 1, 'kirm to javad', 0, 0, 0, 1, 'aawda\n', 3, NULL, NULL, 1, 0, 0, 'F471FF10B4EC9B9E17CC3A10A0DC9A02', NULL, NULL, 0, '', 1, 0, NULL, 0, NULL, 0, 0, 0, 0, 2, 30, ''),
	(4, '2026-09-19 15:35:25', 1, 0, 0, NULL, NULL, NULL, 0, 1, 'Hi!', 0, 0, 0, 1, NULL, 3, NULL, NULL, 1, 0, 0, '9E9A8E3EBB8B3E9F6430D51131F4FDB2', NULL, NULL, 0, '', 1, 0, NULL, 0, NULL, 0, 0, 0, 0, 2, 30, '');

-- Dumping structure for table mta.account_settings
CREATE TABLE IF NOT EXISTS `account_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`,`name`),
  KEY `id_idx` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.account_settings: 7 rows
INSERT IGNORE INTO `account_settings` (`id`, `name`, `value`) VALUES
	(1, 'duty_admin', '0'),
	(1, 'duty_supporter', '0'),
	(1, 'report_panel_mod', '2'),
	(3, 'duty_admin', '0'),
	(4, 'duty_admin', '0'),
	(4, 'duty_supporter', '0'),
	(4, 'report_panel_mod', '0');

-- Dumping structure for table mta.admin_teleports
CREATE TABLE IF NOT EXISTS `admin_teleports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_value` text NOT NULL COMMENT '/gotoplace #v',
  `location_description` text DEFAULT NULL,
  `location_creator` int(10) NOT NULL COMMENT 'User ID',
  `posX` float(10,6) NOT NULL DEFAULT 0.000000,
  `posY` float(10,6) NOT NULL DEFAULT 0.000000,
  `posZ` float(10,6) NOT NULL DEFAULT 0.000000,
  `rot` float(10,6) NOT NULL DEFAULT 0.000000 COMMENT 'rotation',
  `int` int(6) NOT NULL DEFAULT 0 COMMENT 'interior',
  `dim` int(6) NOT NULL DEFAULT 0 COMMENT 'dimension',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NAMEUNI` (`location_value`(100))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='/tps manager';

-- Dumping data for table mta.admin_teleports: 0 rows

-- Dumping structure for table mta.adminhistory
CREATE TABLE IF NOT EXISTS `adminhistory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user` int(10) NOT NULL,
  `user_char` int(11) DEFAULT 0,
  `admin` int(10) DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `action` tinyint(3) NOT NULL DEFAULT 6,
  `duration` int(10) NOT NULL DEFAULT 0,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adminhistory_user_ea155d8a_uniq` (`user`),
  KEY `adminhistory_user_char_c1d4310b_uniq` (`user_char`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.adminhistory: 0 rows

-- Dumping structure for table mta.advertisements
CREATE TABLE IF NOT EXISTS `advertisements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `advertisement` varchar(200) NOT NULL,
  `start` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `faction` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.advertisements: 0 rows

-- Dumping structure for table mta.apb
CREATE TABLE IF NOT EXISTS `apb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.apb: 0 rows

-- Dumping structure for table mta.applications
CREATE TABLE IF NOT EXISTS `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant` int(11) NOT NULL DEFAULT 0,
  `dateposted` timestamp NOT NULL DEFAULT current_timestamp(),
  `datereviewed` datetime DEFAULT NULL,
  `reviewer` int(11) NOT NULL DEFAULT 0,
  `note` varchar(500) DEFAULT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `question1` varchar(500) DEFAULT NULL,
  `question2` varchar(500) DEFAULT NULL,
  `question3` varchar(500) DEFAULT NULL,
  `question4` varchar(500) DEFAULT NULL,
  `answer1` varchar(500) DEFAULT NULL,
  `answer2` varchar(500) DEFAULT NULL,
  `answer3` varchar(500) DEFAULT NULL,
  `answer4` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.applications: 3 rows
INSERT IGNORE INTO `applications` (`id`, `applicant`, `dateposted`, `datereviewed`, `reviewer`, `note`, `state`, `question1`, `question2`, `question3`, `question4`, `answer1`, `answer2`, `answer3`, `answer4`) VALUES
	(1, 1, '2026-06-21 15:58:01', '2026-06-22 14:40:45', 1, 'ok\n', 1, 'Are you ready?10', 'Are you ready?7', 'Are you ready?11', 'Are you ready?9', 'yes\n', 'yes\n', 'yes\n', 'yes\n'),
	(2, 3, '2026-09-16 10:42:49', '2026-09-16 14:13:01', 1, 'ghabooli\n', 1, 'Are you ready?10', 'Are you ready?8', 'Are you ready?7', 'Are you ready?11', 'yesy\n', 'yes\n', 'yesy\n', 'res\n'),
	(3, 4, '2026-09-16 19:59:50', '2026-09-16 23:30:36', 1, 'aa\n', 1, 'Are you ready?9', 'Are you ready?7', 'Are you ready?10', 'Are you ready?11', '77777777\n', '7777777777\n', '77777777777777\n', '7777777777\n');

-- Dumping structure for table mta.applications_questions
CREATE TABLE IF NOT EXISTS `applications_questions` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `question` text DEFAULT NULL,
  `answer1` text DEFAULT NULL,
  `answer2` text DEFAULT NULL,
  `answer3` text DEFAULT NULL,
  `key` tinyint(1) NOT NULL DEFAULT 1,
  `createdBy` int(8) NOT NULL DEFAULT 0,
  `updatedBy` int(8) NOT NULL DEFAULT 0,
  `createDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `part` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.applications_questions: 11 rows
INSERT IGNORE INTO `applications_questions` (`id`, `question`, `answer1`, `answer2`, `answer3`, `key`, `createdBy`, `updatedBy`, `createDate`, `updateDate`, `part`) VALUES
	(1, 'Are you ready?1\r\n', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 1),
	(2, 'Are you ready?2', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 1),
	(3, 'Are you ready?3', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 1),
	(4, 'Are you ready?4', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 1),
	(5, 'Are you ready?5', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 1),
	(6, 'Are you ready?6', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 1),
	(7, 'Are you ready?7', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 2),
	(8, 'Are you ready?8', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 2),
	(9, 'Are you ready?9', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 2),
	(10, 'Are you ready?10', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 2),
	(11, 'Are you ready?11', 'yes', 'no', 'be to che', 1, 0, 0, '2026-06-21 15:25:28', '0000-00-00 00:00:00', 2);

-- Dumping structure for table mta.atm_cards
CREATE TABLE IF NOT EXISTS `atm_cards` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_owner` int(11) DEFAULT NULL,
  `card_number` text DEFAULT NULL,
  `card_pin` varchar(4) NOT NULL DEFAULT '0000',
  `card_locked` tinyint(1) NOT NULL DEFAULT 0,
  `card_type` tinyint(1) NOT NULL DEFAULT 1,
  `limit_type` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `card_id_UNIQUE` (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.atm_cards: 0 rows

-- Dumping structure for table mta.atms
CREATE TABLE IF NOT EXISTS `atms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,6) DEFAULT 0.000000,
  `y` decimal(10,6) DEFAULT 0.000000,
  `z` decimal(10,6) DEFAULT 0.000000,
  `rotation` decimal(10,6) DEFAULT 0.000000,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `deposit` tinyint(3) unsigned DEFAULT 0,
  `limit` int(10) unsigned DEFAULT 5000,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.atms: 0 rows

-- Dumping structure for table mta.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `book` text DEFAULT NULL,
  `readOnly` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='This is used for the book system. // Chaos';

-- Dumping data for table mta.books: 0 rows

-- Dumping structure for table mta.character_settings
CREATE TABLE IF NOT EXISTS `character_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.character_settings: 3 rows
INSERT IGNORE INTO `character_settings` (`id`, `name`, `value`) VALUES
	(0, 'head_turning', '0'),
	(1, 'head_turning', '0'),
	(4, 'head_turning', '0');

-- Dumping structure for table mta.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charactername` varchar(255) DEFAULT NULL,
  `account` int(11) DEFAULT 0,
  `x` float DEFAULT 1169.73,
  `y` float DEFAULT -1413.91,
  `z` float DEFAULT 13.48,
  `rotation` float DEFAULT 359.388,
  `interior_id` int(5) DEFAULT 0,
  `dimension_id` int(5) DEFAULT 0,
  `health` float DEFAULT 100,
  `armor` float DEFAULT 0,
  `skin` int(3) DEFAULT 264,
  `money` bigint(20) DEFAULT 500,
  `gender` int(1) DEFAULT 0,
  `cuffed` int(11) DEFAULT 0,
  `duty` int(3) DEFAULT 0,
  `fightstyle` int(2) DEFAULT 4,
  `pdjail` int(1) DEFAULT 0,
  `pdjail_time` int(11) DEFAULT 0,
  `cked` int(1) DEFAULT 0,
  `lastarea` varchar(255) DEFAULT NULL,
  `age` int(3) DEFAULT 18,
  `skincolor` int(1) DEFAULT 0,
  `weight` int(3) DEFAULT 180,
  `height` int(3) DEFAULT 180,
  `description` text DEFAULT NULL,
  `deaths` int(11) DEFAULT 0,
  `faction_leader` int(1) DEFAULT 0,
  `fingerprint` varchar(255) DEFAULT NULL,
  `casualskin` int(3) DEFAULT 0,
  `bankmoney` bigint(20) DEFAULT 1000,
  `car_license` int(1) DEFAULT 0,
  `bike_license` int(1) DEFAULT 0,
  `pilot_license` int(1) DEFAULT 0,
  `fish_license` int(1) DEFAULT 0,
  `boat_license` int(1) DEFAULT 0,
  `gun_license` int(1) DEFAULT 0,
  `gun2_license` int(1) DEFAULT 0,
  `tag` int(3) DEFAULT 1,
  `hoursplayed` int(11) DEFAULT 0,
  `pdjail_station` int(1) DEFAULT 0,
  `timeinserver` int(2) DEFAULT 0,
  `restrainedobj` int(11) DEFAULT 0,
  `restrainedby` int(11) DEFAULT 0,
  `dutyskin` int(3) DEFAULT -1,
  `fish` int(10) unsigned NOT NULL DEFAULT 0,
  `blindfold` tinyint(4) NOT NULL DEFAULT 0,
  `lang1` tinyint(2) DEFAULT 1,
  `lang1skill` tinyint(3) DEFAULT 100,
  `lang2` tinyint(2) DEFAULT 0,
  `lang2skill` tinyint(3) DEFAULT 0,
  `lang3` tinyint(2) DEFAULT 0,
  `lang3skill` tinyint(3) DEFAULT 0,
  `currlang` tinyint(1) DEFAULT 1,
  `lastlogin` datetime DEFAULT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `election_candidate` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `election_canvote` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `election_votedfor` int(10) unsigned NOT NULL DEFAULT 0,
  `marriedto` int(10) unsigned NOT NULL DEFAULT 0,
  `photos` int(10) unsigned NOT NULL DEFAULT 0,
  `maxvehicles` int(4) unsigned NOT NULL DEFAULT 5,
  `ck_info` varchar(500) DEFAULT NULL,
  `alcohollevel` float NOT NULL DEFAULT 0,
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `recovery` int(1) DEFAULT 0,
  `recoverytime` bigint(20) DEFAULT NULL,
  `walkingstyle` int(3) NOT NULL DEFAULT 0,
  `job` int(3) NOT NULL DEFAULT 0,
  `day` tinyint(2) NOT NULL DEFAULT 1,
  `month` tinyint(2) NOT NULL DEFAULT 1,
  `maxinteriors` int(4) NOT NULL DEFAULT 10,
  `clothingid` int(10) unsigned DEFAULT NULL,
  `death_date` datetime DEFAULT NULL,
  `max_clothes` int(10) unsigned NOT NULL DEFAULT 3,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.characters: 4 rows
INSERT IGNORE INTO `characters` (`id`, `charactername`, `account`, `x`, `y`, `z`, `rotation`, `interior_id`, `dimension_id`, `health`, `armor`, `skin`, `money`, `gender`, `cuffed`, `duty`, `fightstyle`, `pdjail`, `pdjail_time`, `cked`, `lastarea`, `age`, `skincolor`, `weight`, `height`, `description`, `deaths`, `faction_leader`, `fingerprint`, `casualskin`, `bankmoney`, `car_license`, `bike_license`, `pilot_license`, `fish_license`, `boat_license`, `gun_license`, `gun2_license`, `tag`, `hoursplayed`, `pdjail_station`, `timeinserver`, `restrainedobj`, `restrainedby`, `dutyskin`, `fish`, `blindfold`, `lang1`, `lang1skill`, `lang2`, `lang2skill`, `lang3`, `lang3skill`, `currlang`, `lastlogin`, `creationdate`, `election_candidate`, `election_canvote`, `election_votedfor`, `marriedto`, `photos`, `maxvehicles`, `ck_info`, `alcohollevel`, `active`, `recovery`, `recoverytime`, `walkingstyle`, `job`, `day`, `month`, `maxinteriors`, `clothingid`, `death_date`, `max_clothes`, `date_of_birth`) VALUES
	(1, 'Aryan_Soleymani', 1, 1712.87, -743.545, 51.1699, 183.956, 0, 0, 100, 0, 23, 500, 0, 0, 0, 4, 0, 0, 0, 'Red County, Red County', 38, 1, 112, 173, '[ [ "pink", "", "", "", "", "", "" ] ]', 1, 0, 'CD735DAFF9AE9220D49C3A97F4D303E9', 0, 6528, 0, 0, 0, 0, 0, 0, 0, 1, 18, 0, 56, 0, 0, -1, 0, 0, 1, 100, 0, 0, 0, 0, 1, '2026-09-19 18:01:28', '2026-06-21 16:07:20', 0, 0, 0, 0, 0, 5, NULL, 0, 1, 0, NULL, 54, 0, 8, 3, 10, NULL, NULL, 3, '1988-03-08'),
	(2, 'Abolfazl_Shahi', 3, 1188.74, -1359.18, 13.5602, 214.943, 0, 0, 100, 0, 252, 500, 0, 0, 0, 4, 0, 0, 0, 'Market, Los Santos', 19, 1, 58, 164, '', 0, 0, '53048500C5DA1AD48D57F456A53F20FC', 0, 1000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 71, 0, 0, -1, 0, 0, 1, 100, 0, 0, 0, 0, 1, '2026-09-16 15:24:38', '2026-09-16 10:43:45', 0, 0, 0, 0, 0, 5, NULL, 0, 1, 0, NULL, 128, 0, 14, 7, 10, NULL, NULL, 3, '2007-07-14'),
	(3, 'Soghra_Khanoom', 3, 1229.2, -1406.67, 13.0863, 43.6411, 0, 0, 21, 0, 138, 500, 1, 0, 0, 4, 0, 0, 0, 'Market, Los Santos', 27, 1, 65, 157, '', 0, 0, 'BC6A21F0D98F1E01557D2BFA511D9C10', 0, 5236, 0, 0, 0, 0, 0, 0, 0, 1, 14, 0, 55, 0, 0, -1, 0, 0, 1, 100, 0, 0, 0, 0, 1, '2026-09-17 01:11:43', '2026-09-16 11:55:10', 0, 0, 0, 0, 0, 5, NULL, 0, 1, 0, NULL, 121, 0, 16, 7, 10, NULL, NULL, 3, '1999-07-16'),
	(4, 'Javad_Salarie', 4, 1456.53, -1674.52, 14.0531, 20.6079, 0, 0, 29, 0, 7, 500, 0, 0, 0, 4, 0, 0, 0, 'Pershing Square, Los Santos', 16, 0, 50, 150, '', 0, 0, '477DA9F2A2717C9DCDABADBE85CCFF0B', 0, 1000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 67, 0, 0, -1, 0, 0, 1, 100, 0, 0, 0, 0, 1, '2026-09-19 15:35:25', '2026-09-16 20:01:22', 0, 0, 0, 0, 0, 5, NULL, 0, 1, 0, NULL, 130, 0, 1, 1, 10, NULL, NULL, 3, '2010-01-01');

-- Dumping structure for table mta.characters_faction
CREATE TABLE IF NOT EXISTS `characters_faction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `faction_id` int(11) NOT NULL,
  `faction_rank` int(11) NOT NULL,
  `faction_leader` int(11) NOT NULL,
  `faction_phone` int(11) DEFAULT NULL,
  `faction_perks` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.characters_faction: 5 rows
INSERT IGNORE INTO `characters_faction` (`id`, `character_id`, `faction_id`, `faction_rank`, `faction_leader`, `faction_phone`, `faction_perks`) VALUES
	(1, 2, 1, 1, 1, NULL, NULL),
	(6, 1, 2, 6, 1, NULL, NULL),
	(7, 3, 1, 1, 1, NULL, NULL),
	(8, 4, 1, 1, 1, NULL, NULL),
	(9, 4, 2, 6, 1, NULL, NULL);

-- Dumping structure for table mta.clothing
CREATE TABLE IF NOT EXISTS `clothing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `skin` int(11) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT 'A set of clean clothes.',
  `price` int(11) unsigned NOT NULL DEFAULT 50,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `creator_char` int(10) NOT NULL DEFAULT 0,
  `for_sale_until` datetime DEFAULT NULL,
  `distribution` int(1) unsigned NOT NULL DEFAULT 0,
  `manufactured_date` datetime DEFAULT NULL,
  `sold` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.clothing: 0 rows

-- Dumping structure for table mta.commands
CREATE TABLE IF NOT EXISTS `commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` text DEFAULT NULL,
  `hotkey` text DEFAULT NULL,
  `explanation` text DEFAULT NULL,
  `permission` int(3) NOT NULL DEFAULT 0,
  `category` int(2) NOT NULL DEFAULT 1,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Saves all info about all kinds of supported commands and con';

-- Dumping data for table mta.commands: 0 rows

-- Dumping structure for table mta.dancers
CREATE TABLE IF NOT EXISTS `dancers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rotation` float NOT NULL,
  `skin` smallint(5) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `interior` int(10) unsigned NOT NULL,
  `dimension` int(10) unsigned NOT NULL,
  `offset` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.dancers: 0 rows

-- Dumping structure for table mta.dog_users
CREATE TABLE IF NOT EXISTS `dog_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charactername` varchar(45) NOT NULL,
  `attack` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.dog_users: 0 rows

-- Dumping structure for table mta.don_purchases
CREATE TABLE IF NOT EXISTS `don_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `cost` int(11) DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `account` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.don_purchases: 0 rows

-- Dumping structure for table mta.donators
CREATE TABLE IF NOT EXISTS `donators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountID` int(11) NOT NULL,
  `charID` int(11) NOT NULL DEFAULT -1,
  `perkID` int(4) NOT NULL,
  `perkValue` varchar(10) NOT NULL DEFAULT '1',
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.donators: 0 rows

-- Dumping structure for table mta.duty_allowed
CREATE TABLE IF NOT EXISTS `duty_allowed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faction` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `itemValue` varchar(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Used for an admin allow list.';

-- Dumping data for table mta.duty_allowed: 2 rows
INSERT IGNORE INTO `duty_allowed` (`id`, `faction`, `itemID`, `itemValue`) VALUES
	(1, 1, -22, '500'),
	(2, 1, 46, '1');

-- Dumping structure for table mta.duty_custom
CREATE TABLE IF NOT EXISTS `duty_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factionid` int(11) NOT NULL,
  `name` text NOT NULL,
  `skins` text NOT NULL,
  `locations` text NOT NULL,
  `items` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Used for custom duties.';

-- Dumping data for table mta.duty_custom: 1 rows
INSERT IGNORE INTO `duty_custom` (`id`, `factionid`, `name`, `skins`, `locations`, `items`) VALUES
	(1, 1, 'Leader', '[ [ [ 312, "N\\/A" ] ] ]', '[ { "1": "duty" } ]', '[ { "1": [ 1, -22, 25, "500" ], "2": [ 2, 46, "1" ] } ]');

-- Dumping structure for table mta.duty_locations
CREATE TABLE IF NOT EXISTS `duty_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factionid` int(11) NOT NULL,
  `name` text NOT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `dimension` int(11) DEFAULT 0,
  `interior` int(11) DEFAULT 0,
  `vehicleid` int(11) DEFAULT NULL,
  `model` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Used for custom duty locations.';

-- Dumping data for table mta.duty_locations: 1 rows
INSERT IGNORE INTO `duty_locations` (`id`, `factionid`, `name`, `x`, `y`, `z`, `radius`, `dimension`, `interior`, `vehicleid`, `model`) VALUES
	(1, 1, 'duty', 1187, -1252, 17, 5, 0, 0, NULL, NULL);

-- Dumping structure for table mta.elections
CREATE TABLE IF NOT EXISTS `elections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `electionsname` varchar(45) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `elections_UNIQUE` (`electionsname`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.elections: 0 rows

-- Dumping structure for table mta.elevators
CREATE TABLE IF NOT EXISTS `elevators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,6) DEFAULT 0.000000,
  `y` decimal(10,6) DEFAULT 0.000000,
  `z` decimal(10,6) DEFAULT 0.000000,
  `tpx` decimal(10,6) DEFAULT 0.000000,
  `tpy` decimal(10,6) DEFAULT 0.000000,
  `tpz` decimal(10,6) DEFAULT 0.000000,
  `dimensionwithin` int(5) DEFAULT 0,
  `interiorwithin` int(5) DEFAULT 0,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `car` tinyint(3) unsigned DEFAULT 0,
  `disabled` tinyint(3) unsigned DEFAULT 0,
  `rot` decimal(10,6) DEFAULT 0.000000,
  `tprot` decimal(10,6) DEFAULT 0.000000,
  `oneway` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.elevators: 0 rows

-- Dumping structure for table mta.emailaccounts
CREATE TABLE IF NOT EXISTS `emailaccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.emailaccounts: 0 rows

-- Dumping structure for table mta.emails
CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `sender` text DEFAULT NULL,
  `receiver` text DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `inbox` int(1) NOT NULL DEFAULT 0,
  `outbox` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.emails: 0 rows

-- Dumping structure for table mta.faa_registry
CREATE TABLE IF NOT EXISTS `faa_registry` (
  `codeid` int(11) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `condition` varchar(45) DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  PRIMARY KEY (`codeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.faa_registry: 0 rows

-- Dumping structure for table mta.faction_ranks
CREATE TABLE IF NOT EXISTS `faction_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faction_id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `isDefault` int(11) NOT NULL DEFAULT 0,
  `isLeader` int(11) NOT NULL DEFAULT 0,
  `wage` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.faction_ranks: ~4 rows (approximately)
INSERT IGNORE INTO `faction_ranks` (`id`, `faction_id`, `name`, `permissions`, `isDefault`, `isLeader`, `wage`) VALUES
	(1, 1, 'Leader Rank', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17', 0, 1, 2500),
	(2, 1, 'Member', '', 1, 0, 5),
	(5, 1, 'aa', '4', 0, 0, 0),
	(6, 2, 'Leader Rank', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18', 0, 1, 0),
	(7, 2, 'Default Rank', '', 1, 0, 0);

-- Dumping structure for table mta.factions
CREATE TABLE IF NOT EXISTS `factions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `bankbalance` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `rank_order` text DEFAULT NULL,
  `motd` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fnote` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `max_interiors` int(11) unsigned NOT NULL DEFAULT 20,
  `max_vehicles` int(11) unsigned NOT NULL DEFAULT 40,
  `free_custom_ints` tinyint(1) unsigned DEFAULT 0,
  `free_custom_skins` tinyint(1) unsigned DEFAULT 0,
  `before_tax_value` int(6) NOT NULL DEFAULT 0,
  `before_wage_charge` int(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.factions: 2 rows
INSERT IGNORE INTO `factions` (`id`, `name`, `bankbalance`, `type`, `rank_order`, `motd`, `note`, `fnote`, `phone`, `max_interiors`, `max_vehicles`, `free_custom_ints`, `free_custom_skins`, `before_tax_value`, `before_wage_charge`) VALUES
	(1, 'police department', 0, 2, '1,2,,5', 'Welcome to the faction.', '', NULL, NULL, 2, 2, 0, 0, 10, 1000000),
	(2, 'teste', 0, 2, '6,7,', 'Welcome to the faction.', '', NULL, NULL, 20, 40, 0, 0, 0, 0);

-- Dumping structure for table mta.files
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uploaded_by` int(11) DEFAULT NULL,
  `file` mediumblob NOT NULL,
  `file_type` varchar(64) NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `dateline` datetime NOT NULL DEFAULT current_timestamp(),
  `connected_interior` int(11) DEFAULT NULL COMMENT 'The purpose of this field is to auto delete file record on interior delete.',
  `avatar_for_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `connected_interior_UNIQUE` (`connected_interior`),
  UNIQUE KEY `avatar_for_account_UNIQUE` (`avatar_for_account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Store file up to 21MB per record / By Maxime / Consult with him if you''re unsure of something.';

-- Dumping data for table mta.files: 0 rows

-- Dumping structure for table mta.force_apps
CREATE TABLE IF NOT EXISTS `force_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) DEFAULT NULL,
  `forceapp_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC COMMENT='Save forceapped players information to keep them from resubm';

-- Dumping data for table mta.force_apps: 0 rows

-- Dumping structure for table mta.friends
CREATE TABLE IF NOT EXISTS `friends` (
  `account_id` int(10) unsigned NOT NULL,
  `friend_account_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`account_id`,`friend_account_id`),
  UNIQUE KEY `friends_account_id_friend_account_id_unique` (`account_id`,`friend_account_id`),
  KEY `friends_friend_account_id_accounts_foreign` (`friend_account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.friends: 4 rows
INSERT IGNORE INTO `friends` (`account_id`, `friend_account_id`) VALUES
	(1, 3),
	(3, 1),
	(3, 4),
	(4, 3);

-- Dumping structure for table mta.fuelpeds
CREATE TABLE IF NOT EXISTS `fuelpeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotZ` float NOT NULL,
  `interior` int(11) NOT NULL DEFAULT 0,
  `dimension` int(11) NOT NULL DEFAULT 0,
  `skin` int(3) DEFAULT 50,
  `name` varchar(50) NOT NULL,
  `deletedBy` int(11) DEFAULT 0,
  `shop_link` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.fuelpeds: 0 rows

-- Dumping structure for table mta.gates
CREATE TABLE IF NOT EXISTS `gates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectID` int(11) NOT NULL,
  `startX` float NOT NULL,
  `startY` float NOT NULL,
  `startZ` float NOT NULL,
  `startRX` float NOT NULL,
  `startRY` float NOT NULL,
  `startRZ` float NOT NULL,
  `endX` float NOT NULL,
  `endY` float NOT NULL,
  `endZ` float NOT NULL,
  `endRX` float NOT NULL,
  `endRY` float NOT NULL,
  `endRZ` float NOT NULL,
  `gateType` tinyint(3) unsigned NOT NULL,
  `autocloseTime` int(4) NOT NULL,
  `movementTime` int(4) NOT NULL,
  `objectDimension` int(11) NOT NULL,
  `objectInterior` int(11) NOT NULL,
  `gateSecurityParameters` text DEFAULT NULL,
  `creator` varchar(50) NOT NULL DEFAULT '',
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `adminNote` varchar(300) NOT NULL DEFAULT '',
  `triggerDistance` float DEFAULT NULL,
  `triggerDistanceVehicle` float DEFAULT NULL,
  `sound` varchar(50) DEFAULT 'metalgate',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.gates: 0 rows

-- Dumping structure for table mta.health_diagnose
CREATE TABLE IF NOT EXISTS `health_diagnose` (
  `uniqueID` int(11) DEFAULT NULL,
  `int_diagnose` varchar(255) DEFAULT NULL,
  `ext_diagnose` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.health_diagnose: 0 rows

-- Dumping structure for table mta.insurance_data
CREATE TABLE IF NOT EXISTS `insurance_data` (
  `policyid` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(45) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `protection` varchar(45) NOT NULL,
  `deductible` int(11) NOT NULL,
  `date` date NOT NULL,
  `claims` float NOT NULL,
  `cashout` float NOT NULL,
  `premium` int(11) NOT NULL,
  `insurancefaction` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`policyid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.insurance_data: 0 rows

-- Dumping structure for table mta.insurance_factions
CREATE TABLE IF NOT EXISTS `insurance_factions` (
  `factionID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gen_maxi` float NOT NULL DEFAULT 0.005,
  `news` text DEFAULT NULL,
  `subscription` text DEFAULT NULL,
  PRIMARY KEY (`factionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.insurance_factions: 0 rows

-- Dumping structure for table mta.interior_business
CREATE TABLE IF NOT EXISTS `interior_business` (
  `intID` int(11) NOT NULL,
  `businessNote` varchar(101) NOT NULL DEFAULT 'Welcome to our business!',
  PRIMARY KEY (`intID`),
  UNIQUE KEY `intID_UNIQUE` (`intID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Saves info about businesses - Maxime';

-- Dumping data for table mta.interior_business: 0 rows

-- Dumping structure for table mta.interior_logs
CREATE TABLE IF NOT EXISTS `interior_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `intID` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_interior` (`intID`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores all admin actions on interiors - Monitored by Interio';

-- Dumping data for table mta.interior_logs: 51 rows
INSERT IGNORE INTO `interior_logs` (`log_id`, `date`, `intID`, `action`, `actor`) VALUES
	(1, '2026-09-16 10:59:36', 1, 'addint - id 1 - price $0 - name test test', 1),
	(2, '2026-09-16 10:59:39', 1, 'Entered', 1),
	(3, '2026-09-16 10:59:44', 1, 'Entered', 3),
	(4, '2026-09-16 10:59:54', 1, 'setintid 2', 1),
	(5, '2026-09-16 10:59:57', 1, 'setintid 3', 1),
	(6, '2026-09-16 11:00:01', 1, 'setintid 170', 1),
	(7, '2026-09-16 11:00:05', 1, 'setintid 171', 1),
	(8, '2026-09-16 11:00:07', 1, 'setintid 172', 1),
	(9, '2026-09-16 11:00:09', 1, 'setintid 173', 1),
	(10, '2026-09-16 11:00:42', 1, 'setintid 174', 1),
	(11, '2026-09-16 11:01:02', 1, 'Exited', 1),
	(12, '2026-09-16 11:01:04', 1, 'Exited', 3),
	(13, '2026-09-19 11:43:45', 1, 'Entered', 4),
	(14, '2026-09-19 11:43:45', 1, 'gotohouse', 4),
	(15, '2026-09-19 11:43:46', 1, 'Entered', 4),
	(16, '2026-09-19 11:43:46', 1, 'gotohouse', 4),
	(17, '2026-09-19 11:43:47', 1, 'Entered', 4),
	(18, '2026-09-19 11:43:47', 1, 'gotohouse', 4),
	(19, '2026-09-19 11:43:52', 1, 'delint', 4),
	(20, '2026-09-19 11:44:54', 2, 'addint - id 1 - price $33 - name dddd', 4),
	(21, '2026-09-19 11:44:56', 3, 'addint - id 1 - price $33 - name dddd', 4),
	(22, '2026-09-19 11:44:57', 4, 'addint - id 1 - price $33 - name dddd', 4),
	(23, '2026-09-19 11:44:57', 5, 'addint - id 1 - price $33 - name dddd', 4),
	(24, '2026-09-19 11:44:58', 6, 'addint - id 1 - price $33 - name dddd', 4),
	(25, '2026-09-19 11:45:07', 6, 'Entered', 4),
	(26, '2026-09-19 11:45:07', 6, 'gotohouse', 4),
	(27, '2026-09-19 11:45:08', 2, 'Entered', 4),
	(28, '2026-09-19 11:45:08', 2, 'gotohouse', 4),
	(29, '2026-09-19 11:45:09', 4, 'Entered', 4),
	(30, '2026-09-19 11:45:09', 4, 'gotohouse', 4),
	(31, '2026-09-19 11:45:27', 6, 'delint', 4),
	(32, '2026-09-19 11:45:47', 3, 'delint', 4),
	(33, '2026-09-19 11:45:49', 4, 'delint', 4),
	(34, '2026-09-19 11:45:52', 5, 'delint', 4),
	(35, '2026-09-19 11:45:55', 2, 'delint', 4),
	(36, '2026-09-19 11:46:06', 7, 'addint - id 1 - price $33 - name dddd', 4),
	(37, '2026-09-19 11:46:07', 8, 'addint - id 1 - price $33 - name dddd', 4),
	(38, '2026-09-19 11:46:08', 9, 'addint - id 1 - price $33 - name dddd', 4),
	(39, '2026-09-19 11:46:08', 10, 'addint - id 1 - price $33 - name dddd', 4),
	(40, '2026-09-19 11:46:29', 10, 'delint', 4),
	(41, '2026-09-19 11:46:31', 9, 'delint', 4),
	(42, '2026-09-19 11:46:34', 7, 'delint', 4),
	(43, '2026-09-19 11:46:36', 8, 'delint', 4),
	(44, '2026-09-19 11:48:29', 11, 'addint - id 1 - price $33 - name dddd', 4),
	(45, '2026-09-19 11:48:29', 12, 'addint - id 1 - price $33 - name dddd', 4),
	(46, '2026-09-19 11:48:29', 13, 'addint - id 1 - price $33 - name dddd', 4),
	(47, '2026-09-19 11:48:30', 14, 'addint - id 1 - price $33 - name dddd', 4),
	(48, '2026-09-19 11:48:37', 12, 'delint', 4),
	(49, '2026-09-19 11:48:38', 14, 'delint', 4),
	(50, '2026-09-19 11:48:40', 11, 'delint', 4),
	(51, '2026-09-19 11:49:49', 13, 'delint', 4);

-- Dumping structure for table mta.interior_notes
CREATE TABLE IF NOT EXISTS `interior_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intid` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT 0,
  `note` varchar(500) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.interior_notes: 0 rows

-- Dumping structure for table mta.interior_textures
CREATE TABLE IF NOT EXISTS `interior_textures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interior` int(11) NOT NULL,
  `texture` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `rotation` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.interior_textures: 0 rows

-- Dumping structure for table mta.interiors
CREATE TABLE IF NOT EXISTS `interiors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  `type` int(1) DEFAULT 0,
  `owner` int(11) DEFAULT -1,
  `locked` int(1) DEFAULT 0,
  `cost` int(11) DEFAULT 0,
  `name` text DEFAULT NULL,
  `interior` int(5) DEFAULT 0,
  `interiorx` float DEFAULT 0,
  `interiory` float DEFAULT 0,
  `interiorz` float DEFAULT 0,
  `dimensionwithin` int(5) DEFAULT 0,
  `interiorwithin` int(5) DEFAULT 0,
  `angle` float DEFAULT 0,
  `angleexit` float DEFAULT 0,
  `supplies` text DEFAULT NULL,
  `safepositionX` float DEFAULT NULL,
  `safepositionY` float DEFAULT NULL,
  `safepositionZ` float DEFAULT NULL,
  `safepositionRZ` float DEFAULT NULL,
  `disabled` tinyint(3) unsigned DEFAULT 0,
  `lastused` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` varchar(45) NOT NULL DEFAULT '0',
  `deletedDate` datetime DEFAULT NULL,
  `createdDate` datetime NOT NULL DEFAULT current_timestamp(),
  `creator` varchar(45) DEFAULT NULL,
  `isLightOn` tinyint(4) NOT NULL DEFAULT 0,
  `keypad_lock` int(11) DEFAULT NULL,
  `keypad_lock_pw` varchar(32) DEFAULT NULL,
  `keypad_lock_auto` tinyint(1) DEFAULT NULL,
  `faction` int(11) DEFAULT 0,
  `protected_until` datetime DEFAULT NULL,
  `furniture` int(1) NOT NULL DEFAULT 1,
  `interior_id` int(11) DEFAULT NULL,
  `tokenUsed` int(1) NOT NULL DEFAULT 0,
  `settings` text DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.interiors: 14 rows
INSERT IGNORE INTO `interiors` (`id`, `x`, `y`, `z`, `type`, `owner`, `locked`, `cost`, `name`, `interior`, `interiorx`, `interiory`, `interiorz`, `dimensionwithin`, `interiorwithin`, `angle`, `angleexit`, `supplies`, `safepositionX`, `safepositionY`, `safepositionZ`, `safepositionRZ`, `disabled`, `lastused`, `deleted`, `deletedDate`, `createdDate`, `creator`, `isLightOn`, `keypad_lock`, `keypad_lock_pw`, `keypad_lock_auto`, `faction`, `protected_until`, `furniture`, `interior_id`, `tokenUsed`, `settings`, `address`) VALUES
	(1, 1549.88, -1624.31, 13.3828, 2, 0, 0, 0, 'test test', 4, 1345.76, 1485.46, 19.312, 0, 0, 0, 121.217, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:13:47', 'somka', '2026-09-19 15:13:52', '2026-09-16 14:29:36', 'aryan00', 0, NULL, NULL, NULL, 0, NULL, 1, 174, 0, NULL, NULL),
	(2, 1548.65, -1626.9, 13.3828, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 115.63, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:15:08', 'somka', '2026-09-19 15:15:55', '2026-09-19 15:14:54', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(3, 1546.09, -1628.12, 13.3828, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 115.63, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:14:56', 'somka', '2026-09-19 15:15:47', '2026-09-19 15:14:56', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(4, 1542.09, -1630.04, 13.3828, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 115.63, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:15:09', 'somka', '2026-09-19 15:15:49', '2026-09-19 15:14:57', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(5, 1540.48, -1630.82, 13.3828, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 115.63, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:14:57', 'somka', '2026-09-19 15:15:52', '2026-09-19 15:14:57', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(6, 1539.35, -1631.36, 13.3828, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 115.63, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:15:07', 'somka', '2026-09-19 15:15:27', '2026-09-19 15:14:58', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(7, 1544.34, -1634.7, 13.554, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 217.799, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:16:06', 'somka', '2026-09-19 15:16:34', '2026-09-19 15:16:06', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(8, 1547.68, -1635.35, 13.5549, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 307.8, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:16:07', 'somka', '2026-09-19 15:16:36', '2026-09-19 15:16:07', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(9, 1549.07, -1634.27, 13.5552, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 307.8, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:16:08', 'somka', '2026-09-19 15:16:31', '2026-09-19 15:16:08', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(10, 1550.54, -1633.13, 13.5587, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 307.8, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:16:08', 'somka', '2026-09-19 15:16:29', '2026-09-19 15:16:08', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(11, 1525.2, -1612.73, 13.3828, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 24.1785, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:18:29', 'somka', '2026-09-19 15:18:40', '2026-09-19 15:18:29', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(12, 1524.91, -1611.36, 13.3828, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 24.1785, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:18:29', 'somka', '2026-09-19 15:18:37', '2026-09-19 15:18:29', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(13, 1524.2, -1609.64, 13.5469, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 24.1785, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:18:29', 'somka', '2026-09-19 15:19:49', '2026-09-19 15:18:29', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL),
	(14, 1523.7, -1608.52, 13.5469, 2, 0, 0, 33, 'dddd', 3, 975.26, -8.64, 1001.14, 0, 0, 90, 24.1785, '[ [ ] ]', NULL, NULL, NULL, NULL, 0, '2026-09-19 15:18:30', 'somka', '2026-09-19 15:18:38', '2026-09-19 15:18:30', 'somka', 0, NULL, NULL, NULL, 0, NULL, 1, 1, 0, NULL, NULL);

-- Dumping structure for table mta.ippc_airline_pilots
CREATE TABLE IF NOT EXISTS `ippc_airline_pilots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airline` int(11) NOT NULL,
  `character` int(11) NOT NULL,
  `leader` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.ippc_airline_pilots: 0 rows

-- Dumping structure for table mta.ippc_airlines
CREATE TABLE IF NOT EXISTS `ippc_airlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.ippc_airlines: 0 rows

-- Dumping structure for table mta.ippc_flights
CREATE TABLE IF NOT EXISTS `ippc_flights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `callsign` varchar(50) NOT NULL,
  `adep` varchar(50) NOT NULL,
  `ades` varchar(50) NOT NULL,
  `etd` datetime NOT NULL,
  `eta` datetime DEFAULT NULL,
  `vin` int(11) NOT NULL,
  `pilot1` int(11) DEFAULT NULL,
  `pilot2` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `airline` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `tickets` tinyint(1) NOT NULL,
  `seats1` int(3) DEFAULT NULL,
  `seats2` int(3) DEFAULT NULL,
  `seats3` int(3) DEFAULT NULL,
  `price1` int(3) DEFAULT NULL,
  `price2` int(3) DEFAULT NULL,
  `price3` int(3) DEFAULT NULL,
  `submitter` int(11) NOT NULL,
  `submitted` datetime NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.ippc_flights: 0 rows

-- Dumping structure for table mta.items
CREATE TABLE IF NOT EXISTS `items` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `itemID` int(10) NOT NULL,
  `itemValue` varchar(255) NOT NULL,
  `protected` int(100) NOT NULL DEFAULT 0,
  `metadata` text DEFAULT NULL COMMENT 'additional data for the item that can be edited per individual item, JSON',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.items: 27 rows
INSERT IGNORE INTO `items` (`index`, `type`, `owner`, `itemID`, `itemValue`, `protected`, `metadata`) VALUES
	(1, 1, 1, 16, '23', 0, '[ [ ] ]'),
	(2, 1, 1, 17, '1', 0, '[ [ ] ]'),
	(3, 1, 1, 262, '1', 0, '[ [ ] ]'),
	(4, 1, 1, 263, '1', 0, '[ [ ] ]'),
	(5, 1, 1, 152, 'Aryan_Soleymani;Male;March 8th, 1988;CD735DAFF9AE9220D49C3A97F4D303E9', 0, '[ [ ] ]'),
	(6, 1, 1, 160, '1', 0, '[ [ ] ]'),
	(7, 1, 1, 2, '411089', 0, '[ [ ] ]'),
	(38, 1, 1, 262, '1', 0, '[ [ ] ]'),
	(45, 1, 1, 46, '1', 0, '[ [ ] ]'),
	(46, 1, 1, 66, '1', 0, '[ [ ] ]'),
	(50, 1, 3, 17, '1', 0, '[ [ ] ]'),
	(51, 1, 3, 262, '1', 0, '[ [ ] ]'),
	(52, 1, 3, 263, '1', 0, '[ [ ] ]'),
	(53, 1, 3, 152, 'Soghra_Khanoom;Female;July 16th, 1999;BC6A21F0D98F1E01557D2BFA511D9C10', 0, '[ [ ] ]'),
	(54, 1, 3, 160, '1', 0, '[ [ ] ]'),
	(55, 1, 3, 2, '577060', 0, '[ [ ] ]'),
	(74, 1, 3, 3, '3', 0, '[ [ ] ]'),
	(77, 1, 4, 16, '7', 0, '[ [ ] ]'),
	(78, 1, 4, 17, '1', 0, '[ [ ] ]'),
	(79, 1, 4, 262, '1', 0, '[ [ ] ]'),
	(80, 1, 4, 263, '1', 0, '[ [ ] ]'),
	(82, 1, 4, 160, '1', 0, '[ [ ] ]'),
	(83, 1, 4, 2, '545286', 0, '[ [ ] ]'),
	(88, 1, 3, 134, '500', 0, '[ [ ] ]'),
	(90, 1, 1, 134, '500', 0, '[ [ ] ]'),
	(95, 1, 4, 134, '500', 0, '[ [ ] ]'),
	(97, 1, 4, 152, 'Javad_Salarie;Male;January 1st, 2010;477DA9F2A2717C9DCDABADBE85CCFF0B', 0, '[ [ ] ]');

-- Dumping structure for table mta.jailed
CREATE TABLE IF NOT EXISTS `jailed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charid` int(11) NOT NULL,
  `charactername` text NOT NULL,
  `jail_time` bigint(12) NOT NULL,
  `jail_time_online` int(10) NOT NULL DEFAULT 0,
  `convictionDate` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedBy` text NOT NULL,
  `charges` text NOT NULL,
  `cell` text NOT NULL,
  `fine` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.jailed: 0 rows

-- Dumping structure for table mta.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `jobID` int(11) NOT NULL DEFAULT 0,
  `jobCharID` int(11) NOT NULL DEFAULT -1,
  `jobLevel` int(11) NOT NULL DEFAULT 1,
  `jobProgress` int(11) NOT NULL DEFAULT 0,
  `jobTruckingRuns` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC COMMENT='Saves job info, skill level and progress - Maxime';

-- Dumping data for table mta.jobs: 0 rows

-- Dumping structure for table mta.jobs_trucker_orders
CREATE TABLE IF NOT EXISTS `jobs_trucker_orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `orderX` float NOT NULL DEFAULT 0,
  `orderY` float NOT NULL DEFAULT 0,
  `orderZ` float NOT NULL DEFAULT 0,
  `orderName` text NOT NULL,
  `orderInterior` int(11) NOT NULL DEFAULT 0,
  `orderSupplies` text DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Saves info about customer orders to create markers for truck';

-- Dumping data for table mta.jobs_trucker_orders: 0 rows

-- Dumping structure for table mta.leo_impound_lot
CREATE TABLE IF NOT EXISTS `leo_impound_lot` (
  `lane` int(11) NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `int` float NOT NULL,
  `dim` float NOT NULL,
  `faction` int(11) NOT NULL,
  `veh` int(11) NOT NULL DEFAULT 0,
  `fine` int(11) NOT NULL DEFAULT 0,
  `release_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`lane`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.leo_impound_lot: 0 rows

-- Dumping structure for table mta.lift_floors
CREATE TABLE IF NOT EXISTS `lift_floors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lift` int(11) NOT NULL,
  `x` float(10,6) DEFAULT 0.000000,
  `y` float(10,6) DEFAULT 0.000000,
  `z` float(10,6) DEFAULT 0.000000,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `floor` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.lift_floors: 0 rows

-- Dumping structure for table mta.lifts
CREATE TABLE IF NOT EXISTS `lifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.lifts: 0 rows

-- Dumping structure for table mta.lottery
CREATE TABLE IF NOT EXISTS `lottery` (
  `characterid` int(255) NOT NULL,
  `ticketnumber` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.lottery: 0 rows

-- Dumping structure for table mta.maps
CREATE TABLE IF NOT EXISTS `maps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `preview` text NOT NULL,
  `purposes` text NOT NULL,
  `used_by` text NOT NULL,
  `reasons` text NOT NULL,
  `approved` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `uploader` int(10) unsigned NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'exterior',
  `upload_date` datetime NOT NULL DEFAULT current_timestamp(),
  `reviewer` int(10) unsigned DEFAULT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.maps: 0 rows

-- Dumping structure for table mta.maps_objects
CREATE TABLE IF NOT EXISTS `maps_objects` (
  `index` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `map_id` int(10) unsigned NOT NULL,
  `id` text DEFAULT NULL,
  `interior` int(11) NOT NULL,
  `dimension` int(11) DEFAULT NULL,
  `collisions` tinyint(1) DEFAULT NULL,
  `breakable` tinyint(1) DEFAULT NULL,
  `radius` double unsigned DEFAULT NULL,
  `model` int(10) unsigned NOT NULL,
  `lodModel` int(10) unsigned DEFAULT NULL,
  `posX` double NOT NULL,
  `posY` double NOT NULL,
  `posZ` double NOT NULL,
  `rotX` double NOT NULL,
  `rotY` double NOT NULL,
  `rotZ` double NOT NULL,
  `doublesided` tinyint(1) unsigned DEFAULT NULL,
  `scale` double unsigned DEFAULT NULL,
  `alpha` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`index`),
  UNIQUE KEY `index_UNIQUE` (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.maps_objects: 0 rows

-- Dumping structure for table mta.mdc_apb
CREATE TABLE IF NOT EXISTS `mdc_apb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_involved` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `doneby` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `organization` varchar(10) NOT NULL DEFAULT 'LSPD',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_apb: 0 rows

-- Dumping structure for table mta.mdc_calls
CREATE TABLE IF NOT EXISTS `mdc_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caller` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_calls: 0 rows

-- Dumping structure for table mta.mdc_crimes
CREATE TABLE IF NOT EXISTS `mdc_crimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crime` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `character` int(11) NOT NULL,
  `officer` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_crimes: 0 rows

-- Dumping structure for table mta.mdc_criminals
CREATE TABLE IF NOT EXISTS `mdc_criminals` (
  `character` int(11) NOT NULL,
  `dob` varchar(10) NOT NULL DEFAULT 'mm/dd/yyyy',
  `ethnicity` varchar(50) NOT NULL DEFAULT 'Unknown',
  `phone` varchar(10) NOT NULL DEFAULT 'Unknown',
  `occupation` varchar(50) NOT NULL DEFAULT 'Unknown',
  `address` varchar(50) NOT NULL DEFAULT 'Unknown',
  `photo` int(11) NOT NULL DEFAULT -1,
  `details` text DEFAULT 'None.',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `wanted` int(11) NOT NULL DEFAULT 0,
  `wanted_by` int(11) NOT NULL DEFAULT 0,
  `wanted_details` varchar(255) DEFAULT NULL,
  `pilot_details` varchar(255) DEFAULT NULL,
  UNIQUE KEY `name` (`character`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_criminals: 0 rows

-- Dumping structure for table mta.mdc_dmv
CREATE TABLE IF NOT EXISTS `mdc_dmv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vehicle` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  UNIQUE KEY `entryid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_dmv: ~0 rows (approximately)

-- Dumping structure for table mta.mdc_faa_events
CREATE TABLE IF NOT EXISTS `mdc_faa_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crime` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `character` int(11) NOT NULL,
  `officer` varchar(100) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_faa_events: 0 rows

-- Dumping structure for table mta.mdc_faa_licenses
CREATE TABLE IF NOT EXISTS `mdc_faa_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `license` int(2) NOT NULL,
  `value` int(4) DEFAULT NULL,
  `officer` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_faa_licenses: 0 rows

-- Dumping structure for table mta.mdc_groups
CREATE TABLE IF NOT EXISTS `mdc_groups` (
  `faction_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `haveMdcInAllVehicles` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `canSeeWarrants` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `canSeeCalls` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `canAddAPB` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `canSeeVehicles` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `canSeeProperties` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `canSeeLicenses` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `canSeePilotStuff` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `impound_can_see` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `settingUsernameFormat` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`faction_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `faction_id_UNIQUE` (`faction_id`),
  KEY `idx_idx` (`faction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='User group''s permissions based on factions.';

-- Dumping data for table mta.mdc_groups: ~0 rows (approximately)

-- Dumping structure for table mta.mdc_impounds
CREATE TABLE IF NOT EXISTS `mdc_impounds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `veh` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `reporter` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_impounds: 0 rows

-- Dumping structure for table mta.mdc_users
CREATE TABLE IF NOT EXISTS `mdc_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `charid` int(11) unsigned NOT NULL,
  `level` int(11) unsigned NOT NULL,
  `organization` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_users: 0 rows

-- Dumping structure for table mta.mdc_users_old
CREATE TABLE IF NOT EXISTS `mdc_users_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) NOT NULL,
  `pass` varchar(60) NOT NULL,
  `level` int(11) NOT NULL,
  `organization` varchar(30) NOT NULL DEFAULT 'LSPD',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.mdc_users_old: 0 rows

-- Dumping structure for table mta.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(45) DEFAULT NULL,
  `migration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`resource`,`migration`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.migrations: ~6 rows (approximately)
INSERT IGNORE INTO `migrations` (`id`, `resource`, `migration`) VALUES
	(1, 'interior_system', 1),
	(2, 'interior_system', 2),
	(3, 'interior_system', 3),
	(4, 'mdc', 1),
	(5, 'npc', 1),
	(6, 'vehicle_manager', 1);

-- Dumping structure for table mta.mobile_payments
CREATE TABLE IF NOT EXISTS `mobile_payments` (
  `payment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender_phone` varchar(45) NOT NULL,
  `operator` varchar(45) DEFAULT 'N/A',
  `country` varchar(45) DEFAULT 'N/A',
  `game_coin` int(11) unsigned NOT NULL DEFAULT 0,
  `account` int(11) unsigned NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `cost` double NOT NULL DEFAULT 0,
  `revenue` double NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `transaction_id` varchar(45) NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_id_UNIQUE` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.mobile_payments: ~0 rows (approximately)

-- Dumping structure for table mta.motd_read
CREATE TABLE IF NOT EXISTS `motd_read` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motdid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Note down everyone that read and dismissed the motd.';

-- Dumping data for table mta.motd_read: 0 rows

-- Dumping structure for table mta.motds
CREATE TABLE IF NOT EXISTS `motds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `content` text NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `expiration_date` datetime DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `dismissable` tinyint(1) NOT NULL DEFAULT 1,
  `audiences` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.motds: 0 rows

-- Dumping structure for table mta.notifications
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'other',
  PRIMARY KEY (`id`),
  KEY `notification_user` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.notifications: 31 rows
INSERT IGNORE INTO `notifications` (`id`, `userid`, `title`, `details`, `date`, `read`, `type`) VALUES
	(1, 1, 'Vehicle ID #1 (Landstalker) was taken away from Aryan Soleymani\'s possession by the vehicle inactivity scanner.', 'Reason: Inactive Vehicle | Owner is inactive (77 days ago). Your vehicle was marked as inactive because your character hasn\'t been logged in game for longer than 30 days or no body has ever started its engine for longer than 14 days while parking outdoor. \n\nAn inactive vehicle is a waste of resources and thus far the vehicle\'s ownership was removed or stripped from your possession to give other players opportunities to buy and use it more efficiently.\n\nThis vehicle wasn\'t unprotected. To prevent this to happen again to other vehicles of yours, you may want to spend your GC(s) to protect it from the inactive vehicle scanner on UCP.', '2026-09-07 20:00:43', 0, 'vehicle_inactivity_scanner'),
	(2, 1, 'Staff Rank Updated', 'aryan00 has promoted you from Player to Supporter Manager. \nCongratulations!', '2026-09-15 13:38:46', 0, 'other'),
	(3, 1, 'Staff Rank Updated', 'aryan00 has demoted you from Player to Head Administrator. \nSorry!', '2026-09-15 13:45:42', 0, 'other'),
	(4, 1, 'Staff Rank Updated', 'Head Admin aryan00 has demoted you from Head Administrator to Senior Administrator. \nSorry!', '2026-09-15 13:46:53', 0, 'other'),
	(5, 1, 'Staff Rank Updated', 'aryan00 has demoted you from Player to Head Administrator. \nSorry!', '2026-09-16 15:01:50', 0, 'other'),
	(6, 3, 'Abolfazl Shahi is now a leader of your faction \'police department\'', 'Set by (1) Head Admin aryan00', '2026-09-16 15:09:24', 0, 'noti_faction_updates'),
	(7, 1, 'Aryan Soleymani is now a leader of your faction \'police department\'', 'Set by (1) Head Admin aryan00', '2026-09-16 15:09:27', 0, 'noti_faction_updates'),
	(8, 3, 'Aryan Soleymani is now a leader of your faction \'police department\'', 'Set by (1) Head Admin aryan00', '2026-09-16 15:09:27', 0, 'noti_faction_updates'),
	(9, 1, 'Soghra Khanoom is now a leader of your faction \'police department\'', 'Set by (1) Head Admin aryan00', '2026-09-16 15:31:26', 0, 'noti_faction_updates'),
	(10, 3, 'Soghra Khanoom is now a leader of your faction \'police department\'', 'Set by (1) Head Admin aryan00', '2026-09-16 15:31:26', 0, 'noti_faction_updates'),
	(11, 3, 'Aryan Soleymani was removed from faction \'police department\'.', 'Removed by Soghra Khanoom.', '2026-09-16 16:13:52', 0, 'noti_faction_updates'),
	(12, 3, 'Soghra Khanoom left your faction \'police department\'.', NULL, '2026-09-16 16:21:17', 0, 'noti_faction_updates'),
	(13, 1, 'Aryan Soleymani is now a leader of your faction \'teste\'', 'Set by (1) Head Admin aryan00', '2026-09-16 16:21:21', 0, 'noti_faction_updates'),
	(14, 1, 'Aryan Soleymani is now a leader of your faction \'teste\'', 'Set by (1) Head Admin aryan00', '2026-09-16 16:21:33', 0, 'noti_faction_updates'),
	(15, 3, 'Soghra Khanoom is now a leader of your faction \'police department\'', 'Set by (1) Head Admin aryan00', '2026-09-16 16:24:58', 0, 'noti_faction_updates'),
	(16, 3, 'Staff Rank Updated', 'Head Admin aryan00 has promoted you from Player to Head Administrator. \nCongratulations!', '2026-09-16 16:26:41', 0, 'other'),
	(17, 3, 'Staff Rank Updated', 'Head Admin aryan00 has promoted you from Player to Supporter Manager. \nCongratulations!', '2026-09-16 16:26:41', 0, 'other'),
	(18, 3, 'Staff Rank Updated', 'Head Admin aryan00 has promoted you from Player to VT Leader. \nCongratulations!', '2026-09-16 16:26:41', 0, 'other'),
	(19, 3, 'Head Admin aryan00 has promoted you from Player to FT Leader.', 'Congratulations!', '2026-09-16 16:26:41', 0, 'other'),
	(20, 3, 'Staff Rank Updated', 'Head Admin aryan00 has demoted you from Head Administrator to Player. \nSorry!', '2026-09-16 16:52:57', 0, 'other'),
	(21, 3, 'Staff Rank Updated', 'Head Admin aryan00 has demoted you from Supporter Manager to Player. \nSorry!', '2026-09-16 16:52:57', 0, 'other'),
	(22, 3, 'Staff Rank Updated', 'Head Admin aryan00 has demoted you from VT Leader to Player. \nSorry!', '2026-09-16 16:52:57', 0, 'other'),
	(23, 3, 'Head Admin aryan00 has demoted you from FT Leader to Player.', 'Sorry!', '2026-09-16 16:52:57', 0, 'other'),
	(24, 4, 'Staff Rank Updated', 'Head Admin aryan00 has promoted you from Player to Head Administrator. \nCongratulations!', '2026-09-19 15:05:57', 0, 'other'),
	(25, 4, 'Staff Rank Updated', 'Head Admin aryan00 has promoted you from Player to Supporter Manager. \nCongratulations!', '2026-09-19 15:05:57', 0, 'other'),
	(26, 4, 'Staff Rank Updated', 'Head Admin aryan00 has promoted you from Player to VT Leader. \nCongratulations!', '2026-09-19 15:05:57', 0, 'other'),
	(27, 4, 'Head Admin aryan00 has promoted you from Player to FT Leader.', 'Congratulations!', '2026-09-19 15:05:57', 0, 'other'),
	(28, 3, 'Javad Salarie is now a leader of your faction \'police department\'', 'Set by (1) Head Admin somka', '2026-09-19 15:09:46', 0, 'noti_faction_updates'),
	(29, 4, 'Javad Salarie is now a leader of your faction \'police department\'', 'Set by (1) Head Admin somka', '2026-09-19 15:09:46', 0, 'noti_faction_updates'),
	(30, 1, 'Javad Salarie is now a leader of your faction \'teste\'', 'Set by (1) Head Admin somka', '2026-09-19 15:10:05', 0, 'noti_faction_updates'),
	(31, 4, 'Javad Salarie is now a leader of your faction \'teste\'', 'Set by (1) Head Admin somka', '2026-09-19 15:10:05', 0, 'noti_faction_updates');

-- Dumping structure for table mta.objects
CREATE TABLE IF NOT EXISTS `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(6) NOT NULL DEFAULT 0,
  `posX` float(12,7) NOT NULL DEFAULT 0.0000000,
  `posY` float(12,7) NOT NULL DEFAULT 0.0000000,
  `posZ` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotX` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotY` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotZ` float(12,7) NOT NULL DEFAULT 0.0000000,
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `comment` varchar(50) DEFAULT NULL,
  `solid` int(1) NOT NULL DEFAULT 1,
  `doublesided` int(1) NOT NULL DEFAULT 0,
  `scale` float(12,7) DEFAULT NULL,
  `breakable` int(1) NOT NULL DEFAULT 0,
  `alpha` int(11) NOT NULL DEFAULT 255,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.objects: 0 rows

-- Dumping structure for table mta.online_sessions
CREATE TABLE IF NOT EXISTS `online_sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff` int(10) unsigned NOT NULL,
  `minutes_online` int(10) unsigned NOT NULL DEFAULT 0,
  `minutes_duty` int(10) unsigned NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.online_sessions: ~206 rows (approximately)
INSERT IGNORE INTO `online_sessions` (`id`, `staff`, `minutes_online`, `minutes_duty`, `date`) VALUES
	(1, 1, 5, 4, '2026-06-22 14:25:59'),
	(2, 1, 5, 5, '2026-06-22 14:30:59'),
	(3, 1, 5, 5, '2026-06-22 14:35:59'),
	(4, 1, 5, 5, '2026-06-22 14:40:59'),
	(5, 1, 5, 4, '2026-06-22 14:46:26'),
	(6, 1, 5, 5, '2026-06-22 14:51:26'),
	(7, 1, 5, 5, '2026-06-22 14:56:26'),
	(8, 1, 5, 5, '2026-06-22 15:01:26'),
	(9, 1, 5, 1, '2026-06-22 15:06:26'),
	(10, 1, 5, 0, '2026-06-22 15:11:26'),
	(11, 1, 5, 0, '2026-06-22 15:16:26'),
	(12, 1, 5, 0, '2026-06-22 15:21:26'),
	(13, 1, 5, 0, '2026-06-22 15:26:26'),
	(14, 1, 5, 0, '2026-06-22 15:31:26'),
	(15, 1, 5, 0, '2026-06-22 15:36:26'),
	(16, 1, 5, 0, '2026-06-22 15:41:26'),
	(17, 1, 5, 0, '2026-06-22 15:46:26'),
	(18, 1, 5, 0, '2026-06-22 15:51:26'),
	(19, 1, 5, 0, '2026-06-22 15:56:26'),
	(20, 1, 5, 0, '2026-06-22 16:01:26'),
	(21, 1, 5, 0, '2026-06-22 16:06:26'),
	(22, 1, 5, 0, '2026-06-22 16:11:26'),
	(23, 1, 5, 5, '2026-09-07 23:39:13'),
	(24, 1, 5, 5, '2026-09-07 23:44:13'),
	(25, 1, 5, 5, '2026-09-07 23:49:14'),
	(26, 1, 5, 5, '2026-09-07 23:54:14'),
	(27, 1, 5, 5, '2026-09-07 23:59:14'),
	(28, 1, 5, 0, '2026-09-08 00:18:36'),
	(29, 1, 5, 0, '2026-09-08 00:23:36'),
	(30, 1, 5, 0, '2026-09-08 00:28:37'),
	(31, 1, 5, 0, '2026-09-08 00:33:37'),
	(32, 1, 5, 0, '2026-09-08 00:38:37'),
	(33, 1, 5, 0, '2026-09-08 00:43:37'),
	(34, 1, 5, 0, '2026-09-08 00:48:37'),
	(35, 1, 5, 0, '2026-09-08 00:53:37'),
	(36, 1, 5, 0, '2026-09-08 00:58:37'),
	(37, 1, 5, 0, '2026-09-08 01:03:37'),
	(38, 1, 5, 0, '2026-09-08 01:08:37'),
	(39, 1, 5, 0, '2026-09-08 01:13:37'),
	(40, 1, 5, 0, '2026-09-08 01:18:38'),
	(41, 1, 5, 0, '2026-09-08 01:23:38'),
	(42, 1, 5, 0, '2026-09-08 01:28:38'),
	(43, 1, 5, 0, '2026-09-08 01:33:38'),
	(44, 1, 5, 5, '2026-09-08 01:38:38'),
	(45, 1, 5, 5, '2026-09-08 01:43:38'),
	(46, 1, 5, 5, '2026-09-08 01:48:38'),
	(47, 1, 5, 5, '2026-09-08 01:53:38'),
	(48, 1, 5, 0, '2026-09-15 13:16:58'),
	(49, 1, 5, 0, '2026-09-15 13:21:58'),
	(50, 1, 5, 0, '2026-09-15 13:26:59'),
	(51, 1, 5, 4, '2026-09-15 13:32:59'),
	(52, 1, 5, 5, '2026-09-15 13:37:59'),
	(53, 1, 5, 5, '2026-09-15 13:42:59'),
	(54, 1, 5, 5, '2026-09-15 13:47:59'),
	(55, 1, 5, 5, '2026-09-15 13:52:59'),
	(56, 1, 5, 5, '2026-09-15 13:57:59'),
	(57, 1, 5, 5, '2026-09-15 14:03:59'),
	(58, 1, 5, 5, '2026-09-15 14:08:59'),
	(59, 1, 5, 5, '2026-09-15 14:13:59'),
	(60, 1, 5, 5, '2026-09-15 14:18:59'),
	(61, 1, 5, 5, '2026-09-15 14:23:59'),
	(62, 1, 5, 5, '2026-09-15 14:28:59'),
	(63, 1, 5, 5, '2026-09-15 14:33:59'),
	(64, 1, 5, 5, '2026-09-15 14:38:59'),
	(65, 1, 5, 5, '2026-09-15 14:43:59'),
	(66, 1, 5, 5, '2026-09-15 14:48:59'),
	(67, 1, 5, 5, '2026-09-15 14:53:59'),
	(68, 1, 5, 5, '2026-09-15 14:58:59'),
	(69, 1, 5, 5, '2026-09-15 15:03:59'),
	(70, 1, 5, 5, '2026-09-15 15:08:59'),
	(71, 1, 5, 5, '2026-09-15 15:13:59'),
	(72, 1, 5, 5, '2026-09-15 15:18:59'),
	(73, 1, 5, 5, '2026-09-15 15:23:59'),
	(74, 1, 5, 5, '2026-09-15 15:28:59'),
	(75, 1, 5, 5, '2026-09-15 15:33:59'),
	(76, 1, 5, 5, '2026-09-15 15:38:59'),
	(77, 1, 5, 5, '2026-09-15 15:43:59'),
	(78, 1, 5, 5, '2026-09-15 15:48:59'),
	(79, 1, 5, 5, '2026-09-15 15:53:59'),
	(80, 1, 5, 5, '2026-09-15 15:58:59'),
	(81, 1, 5, 5, '2026-09-15 16:04:00'),
	(82, 1, 5, 5, '2026-09-15 16:09:00'),
	(83, 1, 5, 5, '2026-09-15 16:14:00'),
	(84, 1, 5, 5, '2026-09-15 16:19:00'),
	(85, 1, 5, 5, '2026-09-15 16:24:00'),
	(86, 1, 5, 5, '2026-09-15 16:29:00'),
	(87, 1, 5, 5, '2026-09-15 16:34:00'),
	(88, 1, 5, 5, '2026-09-15 16:39:00'),
	(89, 1, 5, 5, '2026-09-15 16:44:00'),
	(90, 1, 5, 5, '2026-09-15 16:49:00'),
	(91, 1, 5, 5, '2026-09-15 16:54:00'),
	(92, 1, 5, 5, '2026-09-15 16:59:00'),
	(93, 1, 5, 5, '2026-09-16 13:53:01'),
	(94, 1, 5, 5, '2026-09-16 13:58:01'),
	(95, 1, 5, 5, '2026-09-16 14:03:02'),
	(96, 1, 5, 5, '2026-09-16 14:08:02'),
	(97, 1, 5, 5, '2026-09-16 14:13:02'),
	(98, 1, 5, 5, '2026-09-16 14:18:02'),
	(99, 1, 5, 5, '2026-09-16 14:23:02'),
	(100, 1, 5, 5, '2026-09-16 14:28:02'),
	(101, 1, 5, 5, '2026-09-16 14:33:02'),
	(102, 1, 5, 5, '2026-09-16 14:38:02'),
	(103, 1, 5, 5, '2026-09-16 14:43:02'),
	(104, 1, 5, 5, '2026-09-16 14:48:02'),
	(105, 1, 5, 5, '2026-09-16 14:53:02'),
	(106, 1, 5, 5, '2026-09-16 15:05:57'),
	(107, 1, 5, 5, '2026-09-16 15:10:57'),
	(108, 1, 5, 5, '2026-09-16 15:15:57'),
	(109, 1, 5, 5, '2026-09-16 15:20:57'),
	(110, 1, 5, 5, '2026-09-16 15:25:57'),
	(111, 1, 5, 5, '2026-09-16 15:30:57'),
	(112, 1, 5, 5, '2026-09-16 15:35:57'),
	(113, 1, 5, 5, '2026-09-16 15:40:57'),
	(114, 1, 5, 5, '2026-09-16 15:45:57'),
	(115, 1, 5, 5, '2026-09-16 15:50:57'),
	(116, 1, 5, 5, '2026-09-16 15:55:57'),
	(117, 1, 5, 5, '2026-09-16 16:00:57'),
	(118, 1, 5, 5, '2026-09-16 16:05:58'),
	(119, 1, 5, 5, '2026-09-16 16:10:58'),
	(120, 1, 5, 5, '2026-09-16 16:15:58'),
	(121, 1, 5, 5, '2026-09-16 16:20:58'),
	(122, 1, 5, 5, '2026-09-16 16:25:58'),
	(123, 1, 5, 5, '2026-09-16 16:30:58'),
	(124, 3, 5, 5, '2026-09-16 16:31:11'),
	(125, 1, 5, 5, '2026-09-16 16:35:58'),
	(126, 3, 5, 5, '2026-09-16 16:37:51'),
	(127, 1, 5, 5, '2026-09-16 16:40:58'),
	(128, 3, 5, 5, '2026-09-16 16:42:51'),
	(129, 1, 5, 5, '2026-09-16 16:46:00'),
	(130, 3, 5, 5, '2026-09-16 16:47:51'),
	(131, 1, 5, 5, '2026-09-16 16:50:58'),
	(132, 3, 5, 5, '2026-09-16 16:52:51'),
	(133, 1, 5, 5, '2026-09-16 16:55:58'),
	(134, 1, 5, 5, '2026-09-16 17:00:58'),
	(135, 1, 5, 5, '2026-09-16 17:05:58'),
	(136, 1, 5, 5, '2026-09-16 17:10:58'),
	(137, 1, 5, 5, '2026-09-16 17:15:58'),
	(138, 1, 5, 5, '2026-09-16 17:20:58'),
	(139, 1, 5, 5, '2026-09-16 17:25:58'),
	(140, 1, 5, 5, '2026-09-16 17:30:58'),
	(141, 1, 5, 5, '2026-09-16 17:35:58'),
	(142, 1, 5, 5, '2026-09-16 17:40:58'),
	(143, 1, 5, 5, '2026-09-16 17:45:58'),
	(144, 1, 5, 5, '2026-09-16 17:50:58'),
	(145, 1, 5, 5, '2026-09-16 17:55:58'),
	(146, 1, 5, 5, '2026-09-16 18:00:58'),
	(147, 1, 5, 5, '2026-09-16 18:05:58'),
	(148, 1, 5, 5, '2026-09-16 18:10:58'),
	(149, 1, 5, 5, '2026-09-16 18:15:59'),
	(150, 1, 5, 5, '2026-09-16 18:20:59'),
	(151, 1, 5, 5, '2026-09-16 18:25:59'),
	(152, 1, 5, 5, '2026-09-16 18:30:59'),
	(153, 1, 5, 5, '2026-09-16 18:35:59'),
	(154, 1, 5, 5, '2026-09-16 18:40:59'),
	(155, 1, 5, 5, '2026-09-16 18:45:59'),
	(156, 1, 5, 5, '2026-09-16 18:50:59'),
	(157, 1, 5, 5, '2026-09-16 18:55:59'),
	(158, 1, 5, 5, '2026-09-16 19:00:59'),
	(159, 1, 5, 5, '2026-09-16 19:05:59'),
	(160, 1, 5, 5, '2026-09-16 19:10:59'),
	(161, 1, 5, 5, '2026-09-16 19:15:59'),
	(162, 1, 5, 5, '2026-09-16 19:20:59'),
	(163, 1, 5, 5, '2026-09-16 19:25:59'),
	(164, 1, 5, 5, '2026-09-16 23:30:07'),
	(165, 1, 5, 5, '2026-09-16 23:35:07'),
	(166, 1, 5, 5, '2026-09-16 23:40:07'),
	(167, 1, 5, 5, '2026-09-16 23:45:07'),
	(168, 1, 5, 5, '2026-09-16 23:50:07'),
	(169, 1, 5, 5, '2026-09-16 23:55:07'),
	(170, 1, 5, 5, '2026-09-17 00:00:07'),
	(171, 1, 5, 5, '2026-09-17 00:05:07'),
	(172, 1, 5, 5, '2026-09-17 00:10:07'),
	(173, 1, 5, 5, '2026-09-17 00:15:07'),
	(174, 1, 5, 5, '2026-09-17 00:20:07'),
	(175, 1, 5, 5, '2026-09-17 00:25:07'),
	(176, 1, 5, 5, '2026-09-17 00:30:07'),
	(177, 1, 5, 5, '2026-09-17 00:35:07'),
	(178, 1, 5, 5, '2026-09-17 00:40:07'),
	(179, 1, 5, 5, '2026-09-17 00:45:07'),
	(180, 1, 5, 5, '2026-09-17 00:50:07'),
	(181, 1, 5, 5, '2026-09-17 00:55:07'),
	(182, 1, 5, 5, '2026-09-17 01:00:07'),
	(183, 1, 5, 5, '2026-09-17 01:05:08'),
	(184, 1, 5, 5, '2026-09-17 01:10:08'),
	(185, 1, 5, 5, '2026-09-19 15:07:05'),
	(186, 1, 5, 5, '2026-09-19 15:12:05'),
	(187, 1, 5, 5, '2026-09-19 15:17:05'),
	(188, 4, 5, 5, '2026-09-19 15:18:14'),
	(189, 1, 5, 5, '2026-09-19 15:22:05'),
	(190, 4, 5, 5, '2026-09-19 15:23:14'),
	(191, 1, 5, 5, '2026-09-19 15:27:05'),
	(192, 4, 5, 5, '2026-09-19 15:28:14'),
	(193, 1, 5, 5, '2026-09-19 15:32:05'),
	(194, 4, 5, 5, '2026-09-19 15:33:14'),
	(195, 1, 5, 5, '2026-09-19 15:37:05'),
	(196, 1, 5, 5, '2026-09-19 15:42:05'),
	(197, 1, 5, 5, '2026-09-19 15:47:05'),
	(198, 1, 5, 5, '2026-09-19 15:52:05'),
	(199, 1, 5, 5, '2026-09-19 15:57:06'),
	(200, 1, 5, 5, '2026-09-19 16:02:06'),
	(201, 1, 5, 5, '2026-09-19 16:07:06'),
	(202, 1, 5, 5, '2026-09-19 16:12:06'),
	(203, 1, 5, 5, '2026-09-19 16:17:06'),
	(204, 1, 5, 5, '2026-09-19 16:22:06'),
	(205, 1, 5, 5, '2026-09-19 16:27:06'),
	(206, 1, 5, 5, '2026-09-19 16:32:06'),
	(207, 1, 5, 5, '2026-09-19 16:37:06'),
	(208, 1, 5, 5, '2026-09-19 16:42:06'),
	(209, 1, 5, 5, '2026-09-19 16:47:06'),
	(210, 1, 5, 5, '2026-09-19 16:52:06'),
	(211, 1, 5, 5, '2026-09-19 16:57:06'),
	(212, 1, 5, 5, '2026-09-19 17:02:06'),
	(213, 1, 5, 5, '2026-09-19 17:07:06'),
	(214, 1, 5, 5, '2026-09-19 17:12:06'),
	(215, 1, 5, 5, '2026-09-19 17:17:06'),
	(216, 1, 5, 5, '2026-09-19 17:22:06'),
	(217, 1, 5, 5, '2026-09-19 17:27:06'),
	(218, 1, 5, 5, '2026-09-19 17:32:06'),
	(219, 1, 5, 5, '2026-09-19 17:37:06'),
	(220, 1, 5, 5, '2026-09-19 17:42:06'),
	(221, 1, 5, 5, '2026-09-19 17:47:06'),
	(222, 1, 5, 5, '2026-09-19 17:52:06'),
	(223, 1, 5, 5, '2026-09-19 17:57:06'),
	(224, 1, 5, 5, '2026-09-19 18:02:07'),
	(225, 1, 5, 5, '2026-09-19 18:07:07'),
	(226, 1, 5, 5, '2026-09-19 18:12:07'),
	(227, 1, 5, 5, '2026-09-19 18:17:07'),
	(228, 1, 5, 5, '2026-09-19 18:22:07');

-- Dumping structure for table mta.paynspray
CREATE TABLE IF NOT EXISTS `paynspray` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,6) DEFAULT 0.000000,
  `y` decimal(10,6) DEFAULT 0.000000,
  `z` decimal(10,6) DEFAULT 0.000000,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.paynspray: 0 rows

-- Dumping structure for table mta.pd_tickets
CREATE TABLE IF NOT EXISTS `pd_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehid` int(11) NOT NULL,
  `reason` text NOT NULL,
  `amount` int(11) NOT NULL,
  `issuer` int(11) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`,`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.pd_tickets: 0 rows

-- Dumping structure for table mta.peds
CREATE TABLE IF NOT EXISTS `peds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `behaviour` int(3) DEFAULT 1,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rotation` float NOT NULL,
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `skin` int(1) DEFAULT NULL,
  `money` bigint(20) NOT NULL DEFAULT 0,
  `gender` int(1) DEFAULT NULL,
  `stats` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `owner_type` int(1) NOT NULL DEFAULT 0,
  `owner` int(11) DEFAULT NULL,
  `animation` varchar(255) DEFAULT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT 0,
  `nametag` tinyint(1) NOT NULL DEFAULT 1,
  `frozen` tinyint(1) NOT NULL DEFAULT 0,
  `comment` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.peds: 0 rows

-- Dumping structure for table mta.phone_contacts
CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` bigint(50) NOT NULL,
  `entryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryNumber` varchar(50) NOT NULL,
  `entryEmail` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `entryFavorited` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.phone_contacts: 0 rows

-- Dumping structure for table mta.phone_history
CREATE TABLE IF NOT EXISTS `phone_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `private` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mta.phone_history: 0 rows

-- Dumping structure for table mta.phone_sms
CREATE TABLE IF NOT EXISTS `phone_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `viewed` tinyint(1) NOT NULL DEFAULT 0,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ID_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table mta.phone_sms: 0 rows

-- Dumping structure for table mta.phones
CREATE TABLE IF NOT EXISTS `phones` (
  `phonenumber` int(9) NOT NULL,
  `turnedon` smallint(1) NOT NULL DEFAULT 1,
  `secretnumber` smallint(1) NOT NULL DEFAULT 0,
  `phonebook` varchar(40) NOT NULL DEFAULT '0',
  `ringtone` smallint(1) NOT NULL DEFAULT 3,
  `contact_limit` int(5) NOT NULL DEFAULT 50,
  `boughtby` int(11) NOT NULL DEFAULT -1,
  `bought_date` datetime NOT NULL DEFAULT current_timestamp(),
  `sms_tone` smallint(1) NOT NULL DEFAULT 7,
  `keypress_tone` smallint(1) NOT NULL DEFAULT 1,
  `tone_volume` smallint(2) NOT NULL DEFAULT 10,
  PRIMARY KEY (`phonenumber`),
  UNIQUE KEY `phonenumber_UNIQUE` (`phonenumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.phones: 2 rows
INSERT IGNORE INTO `phones` (`phonenumber`, `turnedon`, `secretnumber`, `phonebook`, `ringtone`, `contact_limit`, `boughtby`, `bought_date`, `sms_tone`, `keypress_tone`, `tone_volume`) VALUES
	(411089, 1, 0, '0', 3, 50, -1, '2026-06-22 14:43:46', 7, 1, 10),
	(813213, 1, 0, '0', 3, 50, -1, '2026-09-16 14:22:09', 7, 1, 10);

-- Dumping structure for table mta.pilot_notams
CREATE TABLE IF NOT EXISTS `pilot_notams` (
  `id` int(11) NOT NULL,
  `information` longtext DEFAULT NULL,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.pilot_notams: 0 rows

-- Dumping structure for table mta.publicphones
CREATE TABLE IF NOT EXISTS `publicphones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `dimension` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.publicphones: 0 rows

-- Dumping structure for table mta.radio_stations
CREATE TABLE IF NOT EXISTS `radio_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` text DEFAULT NULL,
  `source` text DEFAULT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `register_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `order` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Dynamic radio stations.';

-- Dumping data for table mta.radio_stations: 0 rows

-- Dumping structure for table mta.ramps
CREATE TABLE IF NOT EXISTS `ramps` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `position` text DEFAULT NULL,
  `interior` int(2) DEFAULT NULL,
  `dimension` int(2) DEFAULT NULL,
  `rotation` int(5) DEFAULT NULL,
  `creator` text DEFAULT NULL,
  `liftposition` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.ramps: 0 rows

-- Dumping structure for table mta.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 1,
  `handler` int(11) NOT NULL,
  `reporter` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table mta.reports: ~2 rows (approximately)
INSERT IGNORE INTO `reports` (`id`, `type`, `handler`, `reporter`, `date`, `details`) VALUES
	(1, 2, 1, 3, '2026-09-16 14:15:00', 'kos mikham\n'),
	(2, 4, 1, 3, '2026-09-16 14:18:14', 'kos mikham\n'),
	(3, 4, 1, 3, '2026-09-16 14:21:53', 'adadad\n');

-- Dumping structure for table mta.restricted_freqs
CREATE TABLE IF NOT EXISTS `restricted_freqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `frequency` text DEFAULT NULL,
  `limitedto` int(5) DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.restricted_freqs: 0 rows

-- Dumping structure for table mta.sapt_destinations
CREATE TABLE IF NOT EXISTS `sapt_destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `destinationID` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.sapt_destinations: 0 rows

-- Dumping structure for table mta.sapt_locations
CREATE TABLE IF NOT EXISTS `sapt_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` int(11) NOT NULL,
  `stopID` int(11) NOT NULL,
  `name` text NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.sapt_locations: 0 rows

-- Dumping structure for table mta.sapt_routes
CREATE TABLE IF NOT EXISTS `sapt_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line` int(11) NOT NULL,
  `route` int(11) NOT NULL,
  `destination` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.sapt_routes: 0 rows

-- Dumping structure for table mta.serial_whitelist
CREATE TABLE IF NOT EXISTS `serial_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `serial` varchar(32) NOT NULL,
  `creation_date` datetime DEFAULT current_timestamp(),
  `last_login_ip` varchar(15) DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `serial_whitelist_userid_4b8e2882_uniq` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.serial_whitelist: 0 rows

-- Dumping structure for table mta.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.settings: 7 rows
INSERT IGNORE INTO `settings` (`id`, `name`, `value`) VALUES
	(1, 'tax', '5'),
	(2, 'incometax', '10'),
	(5, 'pdcodes', 'Radio Codes:\r\n10-1: Roll Call, all units respond to said location.\r\n10-2: Arrived on scene.\r\n10-3: Negative / No\r\n10-4: Acknowledgement / Affirmative / Yes\r\n10-5: Repeat last transmission\r\n10-6: Stand-by\r\n10-7: Unavailable for calls\r\n10-8: Available for calls\r\n10-9: Suspect Lost (Usually followed by a 10-17)\r\n10-10: Activity update along with giving your current position\r\n10-12: Backup Required (Specify situation and location)\r\n10-13: Requesting Speciality unit(specify: To SAM, EDWARD, HENRY, TOM, X-RAY, Towtruck, DFT) \r\n10-14: Requesting Medical Unit\r\n10-17: Requesting description on the suspect\r\n10-18: Requesting MDC check (on First-name Last-name)\r\n10-19: Response to MDC (On a 10-18)\r\n10-20: Requesting Location\r\n10-22: Disregard last transmission\r\n10-30: Starting Patrol/Resuming patrol after Code 7\r\n10-31: Returning to Station\r\n10-33: Officer in distress (Use when not able to use backup COMMS i.e; "Lincoln 1 to COMMS, Going 10-33 for a meal break.")\r\n10-50: Car accident\r\n10-55: Traffic Stop\r\n10-56: Speed Trap\n10-57 Victor: Vehicle pursuit.\r\n10-57 Foxtrot: Foot pursuit.\r\n10-66: Felony Stop\r\n10-88 Suspicious Person(s)\r\n10-99: Assignment complete (State condition and at what call)\r\n\r\n11-98: Emergency at Office\r\n11-99: Officer Down\n\r\n\r\nStatus-codes:\r\nStatus 1: Starting tour of Duty.\r\nStatus 2: Ending tour of Duty.\r\n\r\nIdentity Codes:\r\nIC-1: White\r\nIC-2: Black\r\nIC-3: Latino or Mexican\r\nIC-4: Middle-Eastern\r\nIC-5: Asian\r\nIC-6: Unknown ethnicity.\r\n\r\n\r\nSituation codes:\r\nCode 0: Absolute emergency. Drop everything you have and respond.\nCode 1: Non-emergency. If you\'re doing something, deal with it first. Respond without lights or sirens.\r\nCode 2: Non-emergency. If you\'re doing something, drop it and respond. Respond with lights only.\r\nCode 3: There is an emergency. Respond with lights and sirens.\r\nCode 4: No assistance required, situation under control.\r\nCode 5: All units stay out of <location>.\r\nCode 6: Out of car at <location>.\r\nCode 7: Break, specify if available for calls or not.\r\n\r\n\r\nCriminal Codes:\r\n148: Resisting Arrest \r\n187: Homicide\r\n192: Manslaughter\r\n207: Kidnapping\r\n211: Robbery\r\n240: Assault\r\n242: Battery\r\n245: Assault W/Deadly Weapon\r\n417: Brandishing a weapon\r\n459: Burglary\r\n487: Grand Theft (Exceeding $400)\r\n487: Petty Theft\r\n602: Trespass/Fraud\n\n\nSECTOR ASSIGNMENTS\r\n01 - CENTRAL BUREAU;\r\n02 - NORTH-WEST BUREAU;\r\n03 - DETECTIVE BUREAU;\r\n04 - SPECIAL OPERATIONS DIVISION;\r\n05 - SUPERVISOR - SUPERVISORY STAFF;\r\n06 - SUPERVISOR - COMMAND STAFF;\r\n07- SUPERVISOR - EXECUTIVE STAFF;\n\n\nUNIT TYPES\r\nADAM (A): Partnered patrol unit;\r\nAIR: Helicopter unit;\r\nBOY (B): Bicycle patrol unit;\r\nCHARLIE (C): Crime Suppression Unit;\nDAVID (D): Special Weapons and Tactics;\r\nFRANK (F): Footbeat patrol unit;\r\nGEORGE (G): Partnered detective unit.\r\nHENRY (H): Single detective unit;\r\nLINCOLN (L): Single deputy patrol unit;\r\nMARINE: Boat patrol unit;\r\nMARY (M): Motorcycle patrol unit;\r\nPETER (P): Partnered "LINCOLN" units;\r\nTOM (T): Marked Traffic Unit;\r\nUNION (U): Unmarked Traffic Unit;\r\nWILLIAM (W): High-Speed Interception Unit;\n\n\nPhonetics:\r\nA: Adam\r\nB: Boy\r\nC: Charlie\r\nD: David\r\nE: Edward\r\nF: Frank\r\nG: George\r\nH: Henry\r\nI: Ida\r\nJ: John\r\nK: King\r\nL: Lincoln\r\nM: Mary\r\nN: Nora\r\nO: Ocean\r\nP: Paul\r\nQ: Queen\r\nR: Robert\r\nS: Sam\r\nT: Tom\r\nU: Union\r\nV: Victor\r\nW: William\r\nX: X-Ray\r\nY: Young\r\nZ: Zebra\r\n\r\nSlang:\r\nAPB: All points bulletin\r\nBOLO: Be on look out\r\nCOMMS: Communications\r\nDOA: Dead on arrival \r\nDOB: Date of birth\r\nDWI: Driving while intoxicated \r\nETA: Estimative Time of Arrival\r\nGOV: Government of Los Santos\r\nGSW: Gun shot wound\r\nHQ: Headquarters \r\nHzM: HazMat\r\nKIA: Killed in Action\r\nLSFD: Los Santos Fire Department\r\nLSIA: Los Santos International Airport\r\nLSPD: Los Santos Police Department\r\nMHD: Mental Health Division\r\nMVA: Motor-Vehicle Accident \r\nNiner: 9-1-1 call\r\nOCI: Office of Criminal Intelligence\r\nRO: registered owner\r\nSAR: Search and Rescue\r\nTC: Traffic Collision\r\n5150: Possible mental case (IE: a troll, a person refusing to RP, a noob.)\n'),
	(6, 'pdprocedures', 'It`s lonely here or content is out of date. \n\nPlease refresh..\n'),
	(7, 'welfare', '200'),
	(8, 'lottery', '0'),
	(9, 'lotteryNumber', '13');

-- Dumping structure for table mta.sfia_pilots
CREATE TABLE IF NOT EXISTS `sfia_pilots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charactername` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.sfia_pilots: 0 rows

-- Dumping structure for table mta.shop_contacts_info
CREATE TABLE IF NOT EXISTS `shop_contacts_info` (
  `npcID` int(11) NOT NULL,
  `sOwner` varchar(255) DEFAULT NULL,
  `sPhone` varchar(255) DEFAULT NULL,
  `sEmail` varchar(255) DEFAULT NULL,
  `sForum` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`npcID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Saves data about business''s owners in shop system - MAXIME';

-- Dumping data for table mta.shop_contacts_info: 0 rows

-- Dumping structure for table mta.shop_products
CREATE TABLE IF NOT EXISTS `shop_products` (
  `npcID` int(11) DEFAULT NULL,
  `pItemID` int(11) DEFAULT NULL,
  `pItemValue` varchar(500) DEFAULT NULL,
  `pMetadata` text DEFAULT NULL,
  `pDesc` varchar(500) DEFAULT NULL,
  `pPrice` int(11) DEFAULT NULL,
  `pDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `pID` int(11) NOT NULL AUTO_INCREMENT,
  `pQuantity` int(11) NOT NULL DEFAULT 1,
  `pSetQuantity` int(11) NOT NULL DEFAULT 1,
  `pRestockInterval` int(11) DEFAULT 0,
  `pRestockedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`pID`),
  UNIQUE KEY `pID_UNIQUE` (`pID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Saves on-sale products from players, business system by Maxi';

-- Dumping data for table mta.shop_products: 0 rows

-- Dumping structure for table mta.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `shoptype` tinyint(4) DEFAULT 0,
  `rotationz` float NOT NULL DEFAULT 0,
  `skin` varchar(50) DEFAULT NULL,
  `sPendingWage` int(11) NOT NULL DEFAULT 0,
  `sIncome` bigint(20) NOT NULL DEFAULT 0,
  `sCapacity` int(11) NOT NULL DEFAULT 10,
  `sSales` varchar(5000) NOT NULL DEFAULT '',
  `pedName` varchar(255) DEFAULT NULL,
  `faction_belong` int(11) NOT NULL DEFAULT 0,
  `faction_access` tinyint(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.shops: 0 rows

-- Dumping structure for table mta.speedcams
CREATE TABLE IF NOT EXISTS `speedcams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(11,7) NOT NULL DEFAULT 0.0000000,
  `y` float(11,7) NOT NULL DEFAULT 0.0000000,
  `z` float(11,7) NOT NULL DEFAULT 0.0000000,
  `interior` int(3) NOT NULL DEFAULT 0 COMMENT 'Stores the location of the pernament speedcams',
  `dimension` int(5) NOT NULL DEFAULT 0,
  `maxspeed` int(4) NOT NULL DEFAULT 120,
  `radius` int(4) NOT NULL DEFAULT 2,
  `enabled` smallint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.speedcams: 0 rows

-- Dumping structure for table mta.speedingviolations
CREATE TABLE IF NOT EXISTS `speedingviolations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carID` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `speed` int(5) NOT NULL,
  `area` varchar(50) NOT NULL,
  `personVisible` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.speedingviolations: 0 rows

-- Dumping structure for table mta.staff_changelogs
CREATE TABLE IF NOT EXISTS `staff_changelogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `from_rank` int(11) NOT NULL,
  `to_rank` int(11) DEFAULT NULL,
  `by` int(11) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Maxime 2015.01.08';

-- Dumping data for table mta.staff_changelogs: 23 rows
INSERT IGNORE INTO `staff_changelogs` (`id`, `userid`, `team`, `from_rank`, `to_rank`, `by`, `details`, `date`) VALUES
	(1, 1, 1, 9, 5, 1, 'a', '2026-09-15 13:30:16'),
	(2, 1, 1, 9, 5, 1, 'salam', '2026-09-15 13:37:38'),
	(3, 1, 2, 0, 2, 1, NULL, '2026-09-15 13:38:46'),
	(4, 1, 1, 9, 5, 1, NULL, '2026-09-15 13:38:59'),
	(5, 1, 1, 9, 5, 1, NULL, '2026-09-15 13:41:50'),
	(6, 1, 1, 9, 5, 1, NULL, '2026-09-15 13:42:19'),
	(7, 1, 1, 9, 5, 1, NULL, '2026-09-15 13:44:09'),
	(8, 1, 1, 9, 5, 1, NULL, '2026-09-15 13:44:52'),
	(9, 1, 1, 9, 5, 1, 'a', '2026-09-15 13:45:42'),
	(10, 1, 1, 5, 3, 1, NULL, '2026-09-15 13:46:53'),
	(11, 1, 1, 6, 5, 1, 'aa', '2026-09-16 15:01:50'),
	(12, 3, 1, 0, 5, 1, 'aa', '2026-09-16 16:26:41'),
	(13, 3, 2, 0, 2, 1, 'aa', '2026-09-16 16:26:41'),
	(14, 3, 3, 0, 2, 1, 'aa', '2026-09-16 16:26:41'),
	(15, 3, 6, 0, 2, 1, 'aa', '2026-09-16 16:26:41'),
	(16, 3, 1, 5, 0, 1, NULL, '2026-09-16 16:52:57'),
	(17, 3, 2, 2, 0, 1, NULL, '2026-09-16 16:52:57'),
	(18, 3, 3, 2, 0, 1, NULL, '2026-09-16 16:52:57'),
	(19, 3, 6, 2, 0, 1, NULL, '2026-09-16 16:52:57'),
	(20, 4, 1, 0, 5, 1, NULL, '2026-09-19 15:05:57'),
	(21, 4, 2, 0, 2, 1, NULL, '2026-09-19 15:05:57'),
	(22, 4, 3, 0, 2, 1, NULL, '2026-09-19 15:05:57'),
	(23, 4, 6, 0, 2, 1, NULL, '2026-09-19 15:05:57');

-- Dumping structure for table mta.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(10,6) DEFAULT NULL,
  `y` decimal(10,6) DEFAULT NULL,
  `z` decimal(10,6) DEFAULT NULL,
  `interior` int(5) DEFAULT NULL,
  `dimension` int(5) DEFAULT NULL,
  `rx` decimal(10,6) DEFAULT NULL,
  `ry` decimal(10,6) DEFAULT NULL,
  `rz` decimal(10,6) DEFAULT NULL,
  `modelid` int(5) DEFAULT NULL,
  `creationdate` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.tags: 0 rows

-- Dumping structure for table mta.tempinteriors
CREATE TABLE IF NOT EXISTS `tempinteriors` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `interior` int(5) NOT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `uploaded_at` datetime NOT NULL,
  `amount_paid` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table mta.tempinteriors: 0 rows

-- Dumping structure for table mta.tempobjects
CREATE TABLE IF NOT EXISTS `tempobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(6) NOT NULL DEFAULT 0,
  `posX` float(12,7) NOT NULL DEFAULT 0.0000000,
  `posY` float(12,7) NOT NULL DEFAULT 0.0000000,
  `posZ` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotX` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotY` float(12,7) NOT NULL DEFAULT 0.0000000,
  `rotZ` float(12,7) NOT NULL DEFAULT 0.0000000,
  `interior` int(5) NOT NULL,
  `dimension` int(5) NOT NULL,
  `solid` int(1) NOT NULL DEFAULT 1,
  `doublesided` int(1) NOT NULL DEFAULT 0,
  `scale` float(12,7) NOT NULL DEFAULT 1.0000000,
  `breakable` int(1) NOT NULL DEFAULT 0,
  `alpha` tinyint(3) unsigned NOT NULL DEFAULT 255,
  PRIMARY KEY (`id`),
  KEY `dimension` (`dimension`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.tempobjects: 0 rows

-- Dumping structure for table mta.textures_animated
CREATE TABLE IF NOT EXISTS `textures_animated` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `frames` text NOT NULL,
  `speed` int(4) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.textures_animated: 0 rows

-- Dumping structure for table mta.towstats
CREATE TABLE IF NOT EXISTS `towstats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `character` int(11) NOT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `vehicle_plate` varchar(8) DEFAULT NULL COMMENT 'vehicle plate at the time of towing, if any',
  `date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'date of towing',
  PRIMARY KEY (`id`),
  KEY `character_idx` (`character`),
  KEY `vehicle_idx` (`vehicle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Detailed information for TTR leaders who towed what and when';

-- Dumping data for table mta.towstats: 0 rows

-- Dumping structure for table mta.vehicle_auctions
CREATE TABLE IF NOT EXISTS `vehicle_auctions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `starting_bid` int(11) NOT NULL,
  `minimum_increase` int(11) NOT NULL,
  `current_bid` int(11) DEFAULT NULL,
  `current_bidder_id` int(11) DEFAULT NULL COMMENT 'Character ID of current bidder.',
  `buyout` int(11) NOT NULL,
  `expiry` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_faction` int(11) DEFAULT NULL COMMENT 'Filled in when the vehicle belongs to a faction.',
  `awaiting_key_pickup` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'When the auction is completed, but the buyer has not picked up the car yet',
  PRIMARY KEY (`id`),
  KEY `vehicle_auctions_advertisement_id_index` (`advertisement_id`),
  KEY `vehicle_auctions_expiry_awaiting_key_pickup_index` (`expiry`,`awaiting_key_pickup`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.vehicle_auctions: 0 rows

-- Dumping structure for table mta.vehicle_logs
CREATE TABLE IF NOT EXISTS `vehicle_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `vehID` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_vehicle` (`vehID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stores all admin actions on vehicles - Monitored by Vehicle ';

-- Dumping data for table mta.vehicle_logs: 30 rows
INSERT IGNORE INTO `vehicle_logs` (`log_id`, `date`, `vehID`, `action`, `actor`) VALUES
	(1, '2026-06-22 10:54:09', 1, 'makeveh Landstalker ($0 - to Aryan_Soleymani)', 1),
	(2, '2026-06-22 10:54:36', 1, 'Started engine', 1),
	(3, '2026-06-22 10:54:47', 1, 'Started engine', 1),
	(4, '2026-06-22 10:54:53', 1, 'Started engine', 1),
	(5, '2026-06-22 10:54:59', 1, 'Started engine', 1),
	(6, '2026-06-22 10:55:07', 1, 'Started engine', 1),
	(7, '2026-06-22 10:55:13', 1, 'Started engine', 1),
	(8, '2026-06-22 10:55:27', 1, 'Started engine', 1),
	(9, '2026-06-22 10:55:56', 1, 'Started engine', 1),
	(10, '2026-09-07 16:30:43', 1, 'Deleted by Inactivity Scanner. Reason: Inactive Vehicle | Owner is inactive (77 days ago)', NULL),
	(11, '2026-09-16 11:04:39', -1, 'Started engine', 1),
	(12, '2026-09-16 12:58:06', 2, 'makeveh Landstalker ($0 - to Faction #2)', 3),
	(13, '2026-09-16 12:58:16', 2, 'Started engine', 3),
	(14, '2026-09-16 12:58:48', 2, 'setvehiclefaction 1', 3),
	(15, '2026-09-16 13:11:43', 3, 'makeveh Enforcer ($0 - to Soghra_Khanoom)', 3),
	(16, '2026-09-16 13:12:59', 3, 'Started engine', 3),
	(17, '2026-09-16 13:13:05', 3, 'Started engine', 3),
	(18, '2026-09-16 13:13:17', 3, 'Started engine', 3),
	(19, '2026-09-16 13:16:44', 3, 'Started engine', 3),
	(20, '2026-09-16 13:20:44', 3, 'Started engine', 3),
	(21, '2026-09-16 13:21:59', 3, 'Started engine', 3),
	(22, '2026-09-16 13:22:07', 3, 'Started engine', 3),
	(23, '2026-09-16 13:22:29', 3, 'Started engine', 3),
	(24, '2026-09-16 13:22:34', 3, 'Started engine', 3),
	(25, '2026-09-16 13:22:39', 3, 'Started engine', 3),
	(26, '2026-09-16 13:22:44', 3, 'Started engine', 3),
	(27, '2026-09-16 13:25:18', 3, 'Started engine', 3),
	(28, '2026-09-19 14:30:15', 2, 'unflip', 1),
	(29, '2026-09-19 14:30:18', 2, 'fixveh', 1),
	(30, '2026-09-19 14:32:17', 2, 'fixveh', 1);

-- Dumping structure for table mta.vehicle_notes
CREATE TABLE IF NOT EXISTS `vehicle_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehid` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT 0,
  `note` varchar(500) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.vehicle_notes: 0 rows

-- Dumping structure for table mta.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(3) DEFAULT 0,
  `x` decimal(10,6) DEFAULT 0.000000,
  `y` decimal(10,6) DEFAULT 0.000000,
  `z` decimal(10,6) DEFAULT 0.000000,
  `rotx` decimal(10,6) DEFAULT 0.000000,
  `roty` decimal(10,6) DEFAULT 0.000000,
  `rotz` decimal(10,6) DEFAULT 0.000000,
  `currx` decimal(10,6) DEFAULT 0.000000,
  `curry` decimal(10,6) DEFAULT 0.000000,
  `currz` decimal(10,6) DEFAULT 0.000000,
  `currrx` decimal(10,6) DEFAULT 0.000000,
  `currry` decimal(10,6) DEFAULT 0.000000,
  `currrz` decimal(10,6) NOT NULL DEFAULT 0.000000,
  `fuel` int(3) DEFAULT 100,
  `engine` int(1) DEFAULT 0,
  `locked` int(1) DEFAULT 0,
  `lights` int(1) DEFAULT 0,
  `sirens` int(1) DEFAULT 0,
  `paintjob` int(11) DEFAULT 0,
  `hp` float DEFAULT 1000,
  `color1` varchar(50) DEFAULT '0',
  `color2` varchar(50) DEFAULT '0',
  `color3` varchar(50) DEFAULT NULL,
  `color4` varchar(50) DEFAULT NULL,
  `plate` text DEFAULT NULL,
  `faction` int(11) DEFAULT -1,
  `owner` int(11) DEFAULT -1,
  `job` int(11) DEFAULT -1,
  `tintedwindows` int(1) DEFAULT 0,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `currdimension` int(5) DEFAULT 0,
  `currinterior` int(5) DEFAULT 0,
  `enginebroke` int(1) DEFAULT 0,
  `items` text DEFAULT NULL,
  `itemvalues` text DEFAULT NULL,
  `Impounded` int(3) DEFAULT 0,
  `handbrake` int(1) DEFAULT 0,
  `safepositionX` float DEFAULT NULL,
  `safepositionY` float DEFAULT NULL,
  `safepositionZ` float DEFAULT NULL,
  `safepositionRZ` float DEFAULT NULL,
  `upgrades` varchar(150) DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]',
  `wheelStates` varchar(30) DEFAULT '[ [ 0, 0, 0, 0 ] ]',
  `panelStates` varchar(40) DEFAULT '[ [ 0, 0, 0, 0, 0, 0, 0 ] ]',
  `doorStates` varchar(30) DEFAULT '[ [ 0, 0, 0, 0, 0, 0 ] ]',
  `odometer` int(15) DEFAULT 0,
  `headlights` varchar(30) DEFAULT '[ [ 255, 255, 255 ] ]',
  `variant1` int(3) DEFAULT NULL,
  `variant2` int(3) DEFAULT NULL,
  `descriptionadmin` varchar(300) DEFAULT NULL,
  `description1` varchar(300) NOT NULL DEFAULT '',
  `description2` varchar(300) NOT NULL DEFAULT '',
  `description3` varchar(300) NOT NULL DEFAULT '',
  `description4` varchar(300) NOT NULL DEFAULT '',
  `description5` varchar(300) NOT NULL DEFAULT '',
  `suspensionLowerLimit` float DEFAULT NULL,
  `driveType` char(5) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `deletedDate` datetime DEFAULT NULL,
  `chopped` tinyint(4) NOT NULL DEFAULT 0,
  `stolen` tinyint(4) NOT NULL DEFAULT 0,
  `lastUsed` datetime NOT NULL DEFAULT current_timestamp(),
  `creationDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `trackingdevice` varchar(255) DEFAULT NULL,
  `registered` int(2) NOT NULL DEFAULT 1,
  `show_plate` int(2) NOT NULL DEFAULT 1,
  `show_vin` int(2) NOT NULL DEFAULT 1,
  `paintjob_url` varchar(255) DEFAULT NULL,
  `vehicle_shop_id` int(11) DEFAULT NULL,
  `bulletproof` tinyint(4) NOT NULL DEFAULT 0,
  `textures` varchar(300) NOT NULL DEFAULT '[ [ ] ]',
  `business` int(11) NOT NULL DEFAULT -1,
  `protected_until` datetime DEFAULT NULL,
  `tokenUsed` int(1) NOT NULL DEFAULT 0,
  `settings` varchar(500) DEFAULT NULL,
  `hotwired` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.vehicles: 3 rows
INSERT IGNORE INTO `vehicles` (`id`, `model`, `x`, `y`, `z`, `rotx`, `roty`, `rotz`, `currx`, `curry`, `currz`, `currrx`, `currry`, `currrz`, `fuel`, `engine`, `locked`, `lights`, `sirens`, `paintjob`, `hp`, `color1`, `color2`, `color3`, `color4`, `plate`, `faction`, `owner`, `job`, `tintedwindows`, `dimension`, `interior`, `currdimension`, `currinterior`, `enginebroke`, `items`, `itemvalues`, `Impounded`, `handbrake`, `safepositionX`, `safepositionY`, `safepositionZ`, `safepositionRZ`, `upgrades`, `wheelStates`, `panelStates`, `doorStates`, `odometer`, `headlights`, `variant1`, `variant2`, `descriptionadmin`, `description1`, `description2`, `description3`, `description4`, `description5`, `suspensionLowerLimit`, `driveType`, `deleted`, `deletedDate`, `chopped`, `stolen`, `lastUsed`, `creationDate`, `createdBy`, `trackingdevice`, `registered`, `show_plate`, `show_vin`, `paintjob_url`, `vehicle_shop_id`, `bulletproof`, `textures`, `business`, `protected_until`, `tokenUsed`, `settings`, `hotwired`) VALUES
	(1, 400, 963.890315, -1334.154010, 13.361114, 0.000000, 0.000000, 259.223633, 2927.110352, -1344.482422, 11.013769, 359.967041, 1.076660, 7.701416, 80, 1, 0, 1, 0, 0, 770, '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', 'DJ8 1315', -1, 1, -1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]', '[ [ 0, 0, 0, 0 ] ]', '[ [ 2, 1, 0, 0, 1, 2, 0 ] ]', '[ [ 0, 0, 0, 0, 4, 3 ] ]', 6658, '[ [ 255, 255, 255 ] ]', 255, 255, NULL, '', '', '', '', '', NULL, NULL, -1, '2026-09-07 20:00:43', 0, 0, '2026-06-22 14:25:56', '2026-06-22 14:24:09', 1, NULL, 1, 1, 1, NULL, 1, 0, '[ [ ] ]', -1, NULL, 0, NULL, 0),
	(2, 400, 1217.813477, -1246.825975, 15.268532, 0.000000, 0.000000, 182.774094, 1712.871094, -743.544922, 51.169937, 5.262451, 358.879395, 184.372559, 76, 1, 0, 1, 0, 0, 1000, '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', 'SO3 2658', 1, -1, -1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]', '[ [ 0, 0, 0, 0 ] ]', '[ [ 0, 0, 0, 0, 0, 0, 0 ] ]', '[ [ 0, 0, 0, 0, 0, 0 ] ]', 9460, '[ [ 255, 255, 255 ] ]', 255, 255, NULL, '', '', '', '', '', NULL, NULL, 0, NULL, 0, 0, '2026-09-16 16:28:16', '2026-09-16 16:28:06', 3, NULL, 1, 1, 1, NULL, 1, 0, '[ [ ] ]', -1, NULL, 0, NULL, 0),
	(3, 427, 1232.203656, -1303.780719, 13.441106, 0.000000, 0.000000, 294.836365, 1222.327148, -1320.593750, 13.587469, 0.093384, 0.313110, 306.699829, 11, 1, 0, 1, 1, 0, 1000, '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', '[ [ 0, 0, 0 ] ]', 'SP3 5450', -1, 3, -1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '[ [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ] ]', '[ [ 0, 0, 0, 0 ] ]', '[ [ 0, 0, 0, 0, 0, 0, 0 ] ]', '[ [ 0, 0, 0, 1, 0, 0 ] ]', 5599, '[ [ 255, 255, 255 ] ]', 255, 255, NULL, '', '', '', '', '', NULL, NULL, 0, NULL, 0, 0, '2026-09-16 16:55:18', '2026-09-16 16:41:43', 3, NULL, 1, 1, 1, NULL, 3, 0, '[ [ ] ]', -1, NULL, 0, NULL, 0);

-- Dumping structure for table mta.vehicles_custom
CREATE TABLE IF NOT EXISTS `vehicles_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `handling` varchar(1000) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdby` int(11) NOT NULL DEFAULT 0,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `doortype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.vehicles_custom: 0 rows

-- Dumping structure for table mta.vehicles_shop
CREATE TABLE IF NOT EXISTS `vehicles_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehmtamodel` int(11) DEFAULT 0,
  `vehbrand` varchar(255) DEFAULT NULL,
  `vehmodel` varchar(500) DEFAULT NULL,
  `vehyear` int(11) DEFAULT 2014,
  `vehprice` int(11) DEFAULT 0,
  `vehtax` int(11) DEFAULT 0,
  `createdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdby` int(11) NOT NULL DEFAULT 0,
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedby` int(11) NOT NULL DEFAULT 0,
  `notes` varchar(500) DEFAULT NULL,
  `handling` varchar(1000) DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 1000,
  `enabled` int(1) NOT NULL DEFAULT 0,
  `spawnto` tinyint(2) NOT NULL DEFAULT 0,
  `doortype` tinyint(4) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `spawn_rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.vehicles_shop: 2 rows
INSERT IGNORE INTO `vehicles_shop` (`id`, `vehmtamodel`, `vehbrand`, `vehmodel`, `vehyear`, `vehprice`, `vehtax`, `createdate`, `createdby`, `updatedate`, `updatedby`, `notes`, `handling`, `duration`, `enabled`, `spawnto`, `doortype`, `stock`, `spawn_rate`) VALUES
	(2, 400, 'vehicle', 'veh', 1098, 1, 1, '2026-09-16 12:59:43', 3, '2026-09-16 12:59:43', 0, '\n', NULL, 1000, 0, 0, 1, NULL, NULL),
	(3, 427, 'pd_van', 'veh', 1054, 1, 1, '2026-09-16 13:11:30', 3, '2026-09-16 13:11:30', 0, '\n', NULL, 1000, 0, 0, NULL, NULL, NULL);

-- Dumping structure for table mta.wiretransfers
CREATE TABLE IF NOT EXISTS `wiretransfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(11) DEFAULT 0,
  `to` int(11) DEFAULT 0,
  `amount` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` int(11) NOT NULL,
  `from_card` varchar(45) DEFAULT NULL,
  `to_card` varchar(45) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.wiretransfers: 66 rows
INSERT IGNORE INTO `wiretransfers` (`id`, `from`, `to`, `amount`, `reason`, `time`, `type`, `from_card`, `to_card`, `details`) VALUES
	(1, 1, -20, 100, 'Advertisement Income', '2026-09-15 10:02:02', 2, NULL, NULL, NULL),
	(2, -17, 1, 60, 'BANKINTEREST', '2026-09-15 10:30:20', 12, NULL, NULL, NULL),
	(3, -3, 1, 200, 'STATEBENEFITS', '2026-09-15 10:30:20', 6, NULL, NULL, NULL),
	(4, -17, 1, 68, 'BANKINTEREST', '2026-09-16 10:30:57', 12, NULL, NULL, NULL),
	(5, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 10:30:57', 6, NULL, NULL, NULL),
	(6, -17, 1, 75, 'BANKINTEREST', '2026-09-16 12:30:57', 12, NULL, NULL, NULL),
	(7, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 12:30:57', 6, NULL, NULL, NULL),
	(8, -17, 3, 63, 'BANKINTEREST', '2026-09-16 13:20:29', 12, NULL, NULL, NULL),
	(9, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:29', 6, NULL, NULL, NULL),
	(10, -17, 3, 71, 'BANKINTEREST', '2026-09-16 13:20:30', 12, NULL, NULL, NULL),
	(11, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:30', 6, NULL, NULL, NULL),
	(12, -17, 3, 78, 'BANKINTEREST', '2026-09-16 13:20:31', 12, NULL, NULL, NULL),
	(13, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:31', 6, NULL, NULL, NULL),
	(14, -17, 3, 85, 'BANKINTEREST', '2026-09-16 13:20:31', 12, NULL, NULL, NULL),
	(15, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:31', 6, NULL, NULL, NULL),
	(16, -17, 3, 91, 'BANKINTEREST', '2026-09-16 13:20:31', 12, NULL, NULL, NULL),
	(17, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:31', 6, NULL, NULL, NULL),
	(18, -17, 3, 97, 'BANKINTEREST', '2026-09-16 13:20:32', 12, NULL, NULL, NULL),
	(19, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:32', 6, NULL, NULL, NULL),
	(20, -17, 3, 103, 'BANKINTEREST', '2026-09-16 13:20:32', 12, NULL, NULL, NULL),
	(21, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:32', 6, NULL, NULL, NULL),
	(22, -17, 3, 109, 'BANKINTEREST', '2026-09-16 13:20:33', 12, NULL, NULL, NULL),
	(23, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:33', 6, NULL, NULL, NULL),
	(24, -17, 3, 114, 'BANKINTEREST', '2026-09-16 13:20:33', 12, NULL, NULL, NULL),
	(25, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:33', 6, NULL, NULL, NULL),
	(26, -17, 3, 120, 'BANKINTEREST', '2026-09-16 13:20:34', 12, NULL, NULL, NULL),
	(27, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:34', 6, NULL, NULL, NULL),
	(28, -17, 3, 125, 'BANKINTEREST', '2026-09-16 13:20:34', 12, NULL, NULL, NULL),
	(29, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:34', 6, NULL, NULL, NULL),
	(30, -17, 3, 130, 'BANKINTEREST', '2026-09-16 13:20:34', 12, NULL, NULL, NULL),
	(31, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:34', 6, NULL, NULL, NULL),
	(32, -17, 3, 135, 'BANKINTEREST', '2026-09-16 13:20:35', 12, NULL, NULL, NULL),
	(33, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 13:20:35', 6, NULL, NULL, NULL),
	(34, -17, 1, 82, 'BANKINTEREST', '2026-09-16 13:21:17', 12, NULL, NULL, NULL),
	(35, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:17', 6, NULL, NULL, NULL),
	(36, -17, 1, 89, 'BANKINTEREST', '2026-09-16 13:21:18', 12, NULL, NULL, NULL),
	(37, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:18', 6, NULL, NULL, NULL),
	(38, -17, 1, 95, 'BANKINTEREST', '2026-09-16 13:21:18', 12, NULL, NULL, NULL),
	(39, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:18', 6, NULL, NULL, NULL),
	(40, -17, 1, 101, 'BANKINTEREST', '2026-09-16 13:21:19', 12, NULL, NULL, NULL),
	(41, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:19', 6, NULL, NULL, NULL),
	(42, -17, 1, 107, 'BANKINTEREST', '2026-09-16 13:21:19', 12, NULL, NULL, NULL),
	(43, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:19', 6, NULL, NULL, NULL),
	(44, -17, 1, 112, 'BANKINTEREST', '2026-09-16 13:21:20', 12, NULL, NULL, NULL),
	(45, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:20', 6, NULL, NULL, NULL),
	(46, -17, 1, 118, 'BANKINTEREST', '2026-09-16 13:21:20', 12, NULL, NULL, NULL),
	(47, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:20', 6, NULL, NULL, NULL),
	(48, -17, 1, 123, 'BANKINTEREST', '2026-09-16 13:21:21', 12, NULL, NULL, NULL),
	(49, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:21', 6, NULL, NULL, NULL),
	(50, -17, 1, 128, 'BANKINTEREST', '2026-09-16 13:21:21', 12, NULL, NULL, NULL),
	(51, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:21', 6, NULL, NULL, NULL),
	(52, -17, 1, 133, 'BANKINTEREST', '2026-09-16 13:21:21', 12, NULL, NULL, NULL),
	(53, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:21', 6, NULL, NULL, NULL),
	(54, -17, 1, 138, 'BANKINTEREST', '2026-09-16 13:21:22', 12, NULL, NULL, NULL),
	(55, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:22', 6, NULL, NULL, NULL),
	(56, -17, 1, 143, 'BANKINTEREST', '2026-09-16 13:21:22', 12, NULL, NULL, NULL),
	(57, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:22', 6, NULL, NULL, NULL),
	(58, -17, 1, 147, 'BANKINTEREST', '2026-09-16 13:21:23', 12, NULL, NULL, NULL),
	(59, -3, 1, 200, 'STATEBENEFITS', '2026-09-16 13:21:23', 6, NULL, NULL, NULL),
	(60, -17, 3, 140, 'BANKINTEREST', '2026-09-16 21:30:04', 12, NULL, NULL, NULL),
	(61, -3, 3, 200, 'STATEBENEFITS', '2026-09-16 21:30:04', 6, NULL, NULL, NULL),
	(62, 3, -3, 25, 'VEHICLETAX', '2026-09-16 21:30:04', 11, NULL, NULL, NULL),
	(63, -17, 1, 152, 'BANKINTEREST', '2026-09-19 12:30:26', 12, NULL, NULL, NULL),
	(64, -3, 1, 200, 'STATEBENEFITS', '2026-09-19 12:30:26', 6, NULL, NULL, NULL),
	(65, -17, 1, 157, 'BANKINTEREST', '2026-09-19 14:30:26', 12, NULL, NULL, NULL),
	(66, -3, 1, 200, 'STATEBENEFITS', '2026-09-19 14:30:26', 6, NULL, NULL, NULL);

-- Dumping structure for table mta.worlditems
CREATE TABLE IF NOT EXISTS `worlditems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT 0,
  `itemvalue` text DEFAULT NULL,
  `x` float DEFAULT 0,
  `y` float DEFAULT 0,
  `z` float DEFAULT 0,
  `dimension` int(5) DEFAULT 0,
  `interior` int(5) DEFAULT 0,
  `creationdate` datetime DEFAULT NULL,
  `rx` float DEFAULT 0,
  `ry` float DEFAULT 0,
  `rz` float DEFAULT 0,
  `creator` int(10) unsigned DEFAULT 0,
  `protected` int(100) NOT NULL DEFAULT 0,
  `perm_use` int(2) NOT NULL DEFAULT 1,
  `perm_move` int(2) NOT NULL DEFAULT 1,
  `perm_pickup` int(2) NOT NULL DEFAULT 1,
  `perm_use_data` text DEFAULT NULL,
  `perm_move_data` text DEFAULT NULL,
  `perm_pickup_data` text DEFAULT NULL,
  `useExactValues` int(1) NOT NULL DEFAULT 0,
  `metadata` text DEFAULT NULL COMMENT 'additional data for the item that can be edited per individual item, JSON',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.worlditems: 0 rows

-- Dumping structure for table mta.worlditems_data
CREATE TABLE IF NOT EXISTS `worlditems_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `key` varchar(100) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xitem_idx` (`item`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table mta.worlditems_data: 0 rows

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
