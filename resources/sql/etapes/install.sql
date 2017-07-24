mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: lmds
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `lmds_dico_data`
--

DROP TABLE IF EXISTS `lmds_dico_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_dico_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `dico_name` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `short_label` varchar(30) DEFAULT NULL,
  `position` int(5) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `dico_id` varchar(40) DEFAULT NULL,
  `dico_value_id` varchar(40) DEFAULT NULL,
  `archived` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_dico_data`
--

LOCK TABLES `lmds_dico_data` WRITE;
/*!40000 ALTER TABLE `lmds_dico_data` DISABLE KEYS */;
INSERT INTO `lmds_dico_data` VALUES (1,2,'level','1','1',1,'1',NULL,NULL,NULL),(2,2,'level','2','2',2,'2',NULL,NULL,NULL),(3,2,'level','3','3',3,'3',NULL,NULL,NULL),(4,2,'level','4','4',4,'4',NULL,NULL,NULL),(5,2,'level','5','5',5,'5',NULL,NULL,NULL),(6,2,'sub_level','-','-',1,'-1',NULL,NULL,NULL),(7,2,'sub_level','.','.',2,'0',NULL,NULL,NULL),(8,2,'sub_level','+','+',3,'1',NULL,NULL,NULL),(11,2,'movie_type','Standard','std',1,'1',NULL,NULL,NULL),(12,2,'movie_type','Global','global',2,'2',NULL,NULL,NULL),(13,2,'movie_type','Info','info',3,'3',NULL,NULL,NULL),(14,2,'group_detailed_level','1D','1D',100,'1D',NULL,NULL,NULL),(15,2,'group_detailed_level','1-','1-',101,'1-',NULL,NULL,NULL),(16,2,'group_detailed_level','1- / 1','1- / 1',102,'1- / 1',NULL,NULL,NULL),(17,2,'group_detailed_level','1','1',103,'1',NULL,NULL,NULL),(18,2,'group_detailed_level','1 / 1+','1 / 1+',104,'1 / 1+',NULL,NULL,NULL),(19,2,'group_detailed_level','1+','1+',105,'1+',NULL,NULL,NULL),(20,2,'group_detailed_level','1+ / 2-','1+ / 2-',106,'1+ / 2-',NULL,NULL,NULL),(21,2,'group_detailed_level','2- / 2','2- / 2',201,'2- / 2',NULL,NULL,NULL),(22,2,'group_detailed_level','2 / 2+','2 / 2+',203,'2 / 2+',NULL,NULL,NULL),(23,2,'group_detailed_level','2+ / 3-','2+ / 3-',205,'2+ / 3-',NULL,NULL,NULL),(24,2,'group_detailed_level','3- / 3','3- / 3',301,'3- / 3',NULL,NULL,NULL),(25,2,'group_detailed_level','3','3',302,'3',NULL,NULL,NULL),(26,2,'group_detailed_level','3 / 3+','3 / 3+',303,'3 / 3+',NULL,NULL,NULL),(27,2,'group_detailed_level','3+','3+',304,'3+',NULL,NULL,NULL),(28,2,'group_detailed_level','3+ / 4-','3+ / 4-',305,'3+ / 4-',NULL,NULL,NULL),(29,2,'group_detailed_level','4-','4-',400,'4-',NULL,NULL,NULL),(30,2,'group_detailed_level','4- / 4','4- / 4',401,'4- / 4',NULL,NULL,NULL),(31,2,'group_detailed_level','4 / 4+','4 / 4+',403,'4 / 4+',NULL,NULL,NULL),(32,2,'group_detailed_level','4+','4+',404,'4+',NULL,NULL,NULL),(33,2,'group_detailed_level','4+ / 5-','4+ / 5-',405,'4+ / 5-',NULL,NULL,NULL),(34,2,'group_detailed_level','5- / 5','5- / 5',501,'5- / 5',NULL,NULL,NULL),(35,2,'group_detailed_level','5','5',502,'5',NULL,NULL,NULL),(36,2,'group_detailed_level','5 / 5+','5 / 5+',503,'5 / 5+',NULL,NULL,NULL),(37,2,'group_detailed_level','5+','5+',504,'5+',NULL,NULL,NULL),(38,2,'group_detailed_level','2','2',202,'2',NULL,NULL,NULL),(39,2,'group_detailed_level','2+','2+',204,'2+',NULL,NULL,NULL),(40,2,'group_detailed_level','2-','2-',200,'2-',NULL,NULL,NULL),(41,2,'group_detailed_level','3-','3-',300,'3-',NULL,NULL,NULL),(42,2,'group_detailed_level','4','4',402,'4',NULL,NULL,NULL),(43,2,'group_detailed_level','4 / 4+','4 / 4+',403,'4 / 4+',NULL,NULL,NULL),(44,2,'group_detailed_level','5-','5-',500,'5-',NULL,NULL,NULL);
/*!40000 ALTER TABLE `lmds_dico_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_dico_data_group`
--

DROP TABLE IF EXISTS `lmds_dico_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_dico_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_dico_data_group`
--

LOCK TABLES `lmds_dico_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_dico_data_group` DISABLE KEYS */;
INSERT INTO `lmds_dico_data_group` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1);
/*!40000 ALTER TABLE `lmds_dico_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_dico_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_dico_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_dico_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_dico_data_group_mode`
--

LOCK TABLES `lmds_dico_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_dico_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_dico_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_dico_deleted`
--

DROP TABLE IF EXISTS `lmds_dico_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_dico_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `dico_name` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `short_label` varchar(30) DEFAULT NULL,
  `position` int(5) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `dico_id` varchar(40) DEFAULT NULL,
  `dico_value_id` varchar(40) DEFAULT NULL,
  `archived` int(1) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_dico_deleted`
--

LOCK TABLES `lmds_dico_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_dico_deleted` DISABLE KEYS */;
INSERT INTO `lmds_dico_deleted` VALUES (10,2,'sub_level','+','+',5,'+',NULL,NULL,NULL),(9,2,'sub_level','0 / +','0 / +',4,'0 / +',NULL,NULL,NULL);
/*!40000 ALTER TABLE `lmds_dico_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_dicostatus_data`
--

DROP TABLE IF EXISTS `lmds_dicostatus_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_dicostatus_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int(10) unsigned DEFAULT NULL,
  `id_dico` int(10) unsigned DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `effective_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_dicostatus_data`
--

LOCK TABLES `lmds_dicostatus_data` WRITE;
/*!40000 ALTER TABLE `lmds_dicostatus_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_dicostatus_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_dicostatus_data_group`
--

DROP TABLE IF EXISTS `lmds_dicostatus_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_dicostatus_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_dicostatus_data_group`
--

LOCK TABLES `lmds_dicostatus_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_dicostatus_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_dicostatus_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_dicostatus_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_dicostatus_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_dicostatus_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_dicostatus_data_group_mode`
--

LOCK TABLES `lmds_dicostatus_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_dicostatus_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_dicostatus_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_dicostatus_deleted`
--

DROP TABLE IF EXISTS `lmds_dicostatus_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_dicostatus_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int(10) unsigned DEFAULT NULL,
  `id_dico` int(10) unsigned DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `effective_date` datetime DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_dicostatus_deleted`
--

LOCK TABLES `lmds_dicostatus_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_dicostatus_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_dicostatus_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_evtlog_data`
--

DROP TABLE IF EXISTS `lmds_evtlog_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_evtlog_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `evt_datetime` datetime DEFAULT NULL,
  `evt_type` int(11) DEFAULT NULL,
  `evt_name` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_evtlog_data`
--

LOCK TABLES `lmds_evtlog_data` WRITE;
/*!40000 ALTER TABLE `lmds_evtlog_data` DISABLE KEYS */;
INSERT INTO `lmds_evtlog_data` VALUES (1,7,'2017-07-24 21:51:44',19,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(2,NULL,'2017-07-24 22:10:22',16,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData');
/*!40000 ALTER TABLE `lmds_evtlog_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_evtlog_data_group`
--

DROP TABLE IF EXISTS `lmds_evtlog_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_evtlog_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_evtlog_data_group`
--

LOCK TABLES `lmds_evtlog_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_evtlog_data_group` DISABLE KEYS */;
INSERT INTO `lmds_evtlog_data_group` VALUES (1,1,1),(2,1,10),(3,1,11),(4,2,1),(5,2,8),(6,2,9),(7,2,10),(8,2,11),(9,2,17);
/*!40000 ALTER TABLE `lmds_evtlog_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_evtlog_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_evtlog_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_evtlog_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_evtlog_data_group_mode`
--

LOCK TABLES `lmds_evtlog_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_evtlog_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_evtlog_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_evtlog_deleted`
--

DROP TABLE IF EXISTS `lmds_evtlog_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_evtlog_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `evt_datetime` datetime DEFAULT NULL,
  `evt_type` int(11) DEFAULT NULL,
  `evt_name` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_evtlog_deleted`
--

LOCK TABLES `lmds_evtlog_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_evtlog_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_evtlog_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_file_data`
--

DROP TABLE IF EXISTS `lmds_file_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_file_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `original_name` varchar(128) DEFAULT NULL,
  `generated_name` varchar(32) DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `ext` varchar(8) DEFAULT NULL,
  `content_type` varchar(100) DEFAULT NULL,
  `id_storage` int(10) unsigned DEFAULT NULL,
  `path` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_file_data`
--

LOCK TABLES `lmds_file_data` WRITE;
/*!40000 ALTER TABLE `lmds_file_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_file_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_file_data_group`
--

DROP TABLE IF EXISTS `lmds_file_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_file_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_file_data_group`
--

LOCK TABLES `lmds_file_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_file_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_file_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_file_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_file_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_file_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_file_data_group_mode`
--

LOCK TABLES `lmds_file_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_file_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_file_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_file_deleted`
--

DROP TABLE IF EXISTS `lmds_file_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_file_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `original_name` varchar(128) DEFAULT NULL,
  `generated_name` varchar(32) DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `ext` varchar(8) DEFAULT NULL,
  `content_type` varchar(100) DEFAULT NULL,
  `id_storage` int(10) unsigned DEFAULT NULL,
  `path` varchar(6) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_file_deleted`
--

LOCK TABLES `lmds_file_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_file_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_file_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_grp_data`
--

DROP TABLE IF EXISTS `lmds_grp_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_grp_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `teacher` int(10) unsigned DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `sub_level` int(10) unsigned DEFAULT NULL,
  `movies` int(10) unsigned DEFAULT NULL,
  `detailed_level` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_grp_data`
--

LOCK TABLES `lmds_grp_data` WRITE;
/*!40000 ALTER TABLE `lmds_grp_data` DISABLE KEYS */;
INSERT INTO `lmds_grp_data` VALUES (1,2,'Lundi matin',2,14,6,NULL,NULL),(2,2,'Lundi après-midi',2,20,7,NULL,NULL),(3,2,'Mardi matin',3,31,8,NULL,NULL),(4,2,'Mardi après-midi',3,41,8,NULL,NULL),(5,2,'Lundi 18h',8,37,8,NULL,NULL);
/*!40000 ALTER TABLE `lmds_grp_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_grp_data_group`
--

DROP TABLE IF EXISTS `lmds_grp_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_grp_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_grp_data_group`
--

LOCK TABLES `lmds_grp_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_grp_data_group` DISABLE KEYS */;
INSERT INTO `lmds_grp_data_group` VALUES (1,1,1),(2,1,8),(3,2,1),(4,2,9),(5,3,1),(6,3,10),(7,4,1),(8,4,11),(9,5,1),(10,5,17);
/*!40000 ALTER TABLE `lmds_grp_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_grp_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_grp_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_grp_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_grp_data_group_mode`
--

LOCK TABLES `lmds_grp_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_grp_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_grp_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_grp_deleted`
--

DROP TABLE IF EXISTS `lmds_grp_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_grp_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `teacher` int(10) unsigned DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `sub_level` int(10) unsigned DEFAULT NULL,
  `movies` int(10) unsigned DEFAULT NULL,
  `detailed_level` int(10) unsigned DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_grp_deleted`
--

LOCK TABLES `lmds_grp_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_grp_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_grp_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_grp_movie_data`
--

DROP TABLE IF EXISTS `lmds_grp_movie_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_grp_movie_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `id_movie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_grp_movie_data`
--

LOCK TABLES `lmds_grp_movie_data` WRITE;
/*!40000 ALTER TABLE `lmds_grp_movie_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_grp_movie_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_grp_movie_data_group`
--

DROP TABLE IF EXISTS `lmds_grp_movie_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_grp_movie_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_grp_movie_data_group`
--

LOCK TABLES `lmds_grp_movie_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_grp_movie_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_grp_movie_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_grp_movie_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_grp_movie_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_grp_movie_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_grp_movie_data_group_mode`
--

LOCK TABLES `lmds_grp_movie_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_grp_movie_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_grp_movie_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_grp_movie_deleted`
--

DROP TABLE IF EXISTS `lmds_grp_movie_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_grp_movie_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `id_movie` int(11) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_grp_movie_deleted`
--

LOCK TABLES `lmds_grp_movie_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_grp_movie_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_grp_movie_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_movie_data`
--

DROP TABLE IF EXISTS `lmds_movie_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_movie_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `teacher` int(10) unsigned DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `sub_level` int(10) unsigned DEFAULT NULL,
  `movie_type` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_movie_data`
--

LOCK TABLES `lmds_movie_data` WRITE;
/*!40000 ALTER TABLE `lmds_movie_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_movie_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_movie_data_group`
--

DROP TABLE IF EXISTS `lmds_movie_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_movie_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_movie_data_group`
--

LOCK TABLES `lmds_movie_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_movie_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_movie_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_movie_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_movie_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_movie_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_movie_data_group_mode`
--

LOCK TABLES `lmds_movie_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_movie_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_movie_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_movie_deleted`
--

DROP TABLE IF EXISTS `lmds_movie_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_movie_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `teacher` int(10) unsigned DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `sub_level` int(10) unsigned DEFAULT NULL,
  `movie_type` int(10) unsigned DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_movie_deleted`
--

LOCK TABLES `lmds_movie_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_movie_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_movie_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_movie_file_data`
--

DROP TABLE IF EXISTS `lmds_movie_file_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_movie_file_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_movie` int(10) unsigned DEFAULT NULL,
  `id_file` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_movie_file_data`
--

LOCK TABLES `lmds_movie_file_data` WRITE;
/*!40000 ALTER TABLE `lmds_movie_file_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_movie_file_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_movie_file_data_group`
--

DROP TABLE IF EXISTS `lmds_movie_file_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_movie_file_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_movie_file_data_group`
--

LOCK TABLES `lmds_movie_file_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_movie_file_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_movie_file_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_movie_file_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_movie_file_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_movie_file_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_movie_file_data_group_mode`
--

LOCK TABLES `lmds_movie_file_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_movie_file_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_movie_file_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_movie_file_deleted`
--

DROP TABLE IF EXISTS `lmds_movie_file_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_movie_file_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_movie` int(10) unsigned DEFAULT NULL,
  `id_file` int(10) unsigned DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_movie_file_deleted`
--

LOCK TABLES `lmds_movie_file_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_movie_file_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_movie_file_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_axis`
--

DROP TABLE IF EXISTS `lmds_pj_axis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_axis` (
  `id_axis` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_axis`),
  UNIQUE KEY `lmds_pj_axis_name` (`name`),
  UNIQUE KEY `lmds_pj_axis_group` (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_axis`
--

LOCK TABLES `lmds_pj_axis` WRITE;
/*!40000 ALTER TABLE `lmds_pj_axis` DISABLE KEYS */;
INSERT INTO `lmds_pj_axis` VALUES (1,'Main axis',1);
/*!40000 ALTER TABLE `lmds_pj_axis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_group`
--

DROP TABLE IF EXISTS `lmds_pj_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `id_axis` int(10) unsigned DEFAULT NULL,
  `disabled` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`),
  KEY `id_axis` (`id_axis`),
  CONSTRAINT `lmds_pj_group_ibfk_1` FOREIGN KEY (`id_axis`) REFERENCES `lmds_pj_axis` (`id_axis`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_group`
--

LOCK TABLES `lmds_pj_group` WRITE;
/*!40000 ALTER TABLE `lmds_pj_group` DISABLE KEYS */;
INSERT INTO `lmds_pj_group` VALUES (1,'La maison des sons',1,0),(2,'root',NULL,0),(6,'s.strauss',NULL,0),(7,'f.servine',NULL,0),(8,'Lundi matin',1,0),(9,'Lundi après-midi',1,0),(10,'Mardi matin',1,0),(11,'Mardi après-midi',1,0),(12,'s.becquerel@gmail.com',NULL,0),(13,'stephane',NULL,0),(14,'maxime',NULL,0),(15,'nicolas',NULL,0),(16,'louis',NULL,0),(17,'Lundi 18h',1,0),(18,'g.fiton@gmail.com',NULL,0);
/*!40000 ALTER TABLE `lmds_pj_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_group_link`
--

DROP TABLE IF EXISTS `lmds_pj_group_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_group_link` (
  `id_group_link` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `id_group_parent` int(10) unsigned DEFAULT NULL,
  `id_role` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_group_link`),
  UNIQUE KEY `id_group` (`id_group`,`id_group_parent`,`id_role`),
  KEY `id_group_parent` (`id_group_parent`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `lmds_pj_group_link_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `lmds_pj_group` (`id_group`) ON DELETE CASCADE,
  CONSTRAINT `lmds_pj_group_link_ibfk_2` FOREIGN KEY (`id_group_parent`) REFERENCES `lmds_pj_group` (`id_group`) ON DELETE SET NULL,
  CONSTRAINT `lmds_pj_group_link_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `lmds_pj_role` (`id_role`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_group_link`
--

LOCK TABLES `lmds_pj_group_link` WRITE;
/*!40000 ALTER TABLE `lmds_pj_group_link` DISABLE KEYS */;
INSERT INTO `lmds_pj_group_link` VALUES (1,2,1,1),(5,6,1,2),(8,6,8,2),(10,6,9,2),(6,7,1,2),(12,7,10,2),(14,7,11,2),(7,8,1,NULL),(9,9,1,NULL),(11,10,1,NULL),(13,11,1,NULL),(15,12,11,3),(23,12,17,3),(16,13,1,2),(17,14,1,2),(18,15,1,2),(19,16,1,2),(21,16,17,2),(20,17,1,NULL),(22,18,17,3);
/*!40000 ALTER TABLE `lmds_pj_group_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_group_mode`
--

DROP TABLE IF EXISTS `lmds_pj_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_group_mode` (
  `id_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_group_link` int(10) unsigned NOT NULL,
  `id_varset` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_group_mode`),
  KEY `id_group_link` (`id_group_link`),
  KEY `id_varset` (`id_varset`),
  CONSTRAINT `lmds_pj_group_mode_ibfk_1` FOREIGN KEY (`id_group_link`) REFERENCES `lmds_pj_group_link` (`id_group_link`) ON DELETE CASCADE,
  CONSTRAINT `lmds_pj_group_mode_ibfk_2` FOREIGN KEY (`id_varset`) REFERENCES `lmds_pj_varset` (`id_varset`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_group_mode`
--

LOCK TABLES `lmds_pj_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_pj_group_mode` DISABLE KEYS */;
INSERT INTO `lmds_pj_group_mode` VALUES (67,1,1,7),(68,1,2,7),(69,1,3,7),(70,1,4,7),(71,1,5,7),(72,1,6,7),(73,1,7,7),(74,1,8,455),(75,1,9,7),(76,1,10,7),(77,1,11,7),(78,1,12,7),(79,1,13,7),(80,1,14,7),(81,1,15,7),(82,5,1,7),(83,5,2,7),(84,5,3,7),(85,5,4,7),(86,5,5,7),(87,5,6,7),(88,5,7,7),(89,5,8,7),(90,5,9,7),(91,5,10,7),(92,5,11,7),(93,5,12,7),(94,5,13,7),(95,5,14,7),(96,5,15,7),(97,6,1,7),(98,6,2,7),(99,6,3,7),(100,6,4,7),(101,6,5,7),(102,6,6,7),(103,6,7,7),(104,6,8,7),(105,6,9,7),(106,6,10,7),(107,6,11,7),(108,6,12,7),(109,6,13,7),(110,6,14,7),(111,6,15,7),(112,8,1,7),(113,8,2,7),(114,8,3,7),(115,8,4,7),(116,8,5,7),(117,8,6,7),(118,8,7,7),(119,8,8,7),(120,8,9,7),(121,8,10,7),(122,8,11,7),(123,8,12,7),(124,8,13,7),(125,8,14,7),(126,8,15,7),(127,10,1,7),(128,10,2,7),(129,10,3,7),(130,10,4,7),(131,10,5,7),(132,10,6,7),(133,10,7,7),(134,10,8,7),(135,10,9,7),(136,10,10,7),(137,10,11,7),(138,10,12,7),(139,10,13,7),(140,10,14,7),(141,10,15,7),(142,12,1,7),(143,12,2,7),(144,12,3,7),(145,12,4,7),(146,12,5,7),(147,12,6,7),(148,12,7,7),(149,12,8,7),(150,12,9,7),(151,12,10,7),(152,12,11,7),(153,12,12,7),(154,12,13,7),(155,12,14,7),(156,12,15,7),(157,14,1,7),(158,14,2,7),(159,14,3,7),(160,14,4,7),(161,14,5,7),(162,14,6,7),(163,14,7,7),(164,14,8,7),(165,14,9,7),(166,14,10,7),(167,14,11,7),(168,14,12,7),(169,14,13,7),(170,14,14,7),(171,14,15,7),(172,15,4,256),(173,15,9,4),(174,15,10,4),(175,15,11,4),(176,15,12,6),(177,15,13,4),(178,15,14,4),(179,15,15,4),(180,16,1,7),(181,16,2,7),(182,16,3,7),(183,16,4,7),(184,16,5,7),(185,16,6,7),(186,16,7,7),(187,16,8,7),(188,16,9,7),(189,16,10,7),(190,16,11,7),(191,16,12,7),(192,16,13,7),(193,16,14,7),(194,16,15,7),(195,17,1,7),(196,17,2,7),(197,17,3,7),(198,17,4,7),(199,17,5,7),(200,17,6,7),(201,17,7,7),(202,17,8,7),(203,17,9,7),(204,17,10,7),(205,17,11,7),(206,17,12,7),(207,17,13,7),(208,17,14,7),(209,17,15,7),(210,18,1,7),(211,18,2,7),(212,18,3,7),(213,18,4,7),(214,18,5,7),(215,18,6,7),(216,18,7,7),(217,18,8,7),(218,18,9,7),(219,18,10,7),(220,18,11,7),(221,18,12,7),(222,18,13,7),(223,18,14,7),(224,18,15,7),(225,19,1,7),(226,19,2,7),(227,19,3,7),(228,19,4,7),(229,19,5,7),(230,19,6,7),(231,19,7,7),(232,19,8,7),(233,19,9,7),(234,19,10,7),(235,19,11,7),(236,19,12,7),(237,19,13,7),(238,19,14,7),(239,19,15,7),(240,22,4,256),(241,22,9,4),(242,22,10,4),(243,22,11,4),(244,22,12,6),(245,22,13,4),(246,22,14,4),(247,22,15,4),(248,23,4,256),(249,23,9,4),(250,23,10,4),(251,23,11,4),(252,23,12,6),(253,23,13,4),(254,23,14,4),(255,23,15,4);
/*!40000 ALTER TABLE `lmds_pj_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_old_passwords`
--

DROP TABLE IF EXISTS `lmds_pj_old_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_old_passwords` (
  `id_old_password` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_group` int(10) unsigned NOT NULL,
  `date_renew` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` char(81) NOT NULL,
  PRIMARY KEY (`id_old_password`),
  KEY `id_group` (`id_group`),
  CONSTRAINT `lmds_pj_old_passwords_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `lmds_pj_group` (`id_group`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gestion des anciens mdp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_old_passwords`
--

LOCK TABLES `lmds_pj_old_passwords` WRITE;
/*!40000 ALTER TABLE `lmds_pj_old_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_pj_old_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_resource_settings`
--

DROP TABLE IF EXISTS `lmds_pj_resource_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_resource_settings` (
  `id_resource_settings` int(11) NOT NULL AUTO_INCREMENT,
  `id_resource` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_settings` int(11) NOT NULL,
  PRIMARY KEY (`id_resource_settings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_resource_settings`
--

LOCK TABLES `lmds_pj_resource_settings` WRITE;
/*!40000 ALTER TABLE `lmds_pj_resource_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_pj_resource_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_role`
--

DROP TABLE IF EXISTS `lmds_pj_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_role` (
  `id_role` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_role`
--

LOCK TABLES `lmds_pj_role` WRITE;
/*!40000 ALTER TABLE `lmds_pj_role` DISABLE KEYS */;
INSERT INTO `lmds_pj_role` VALUES (1,'admin','Administrator'),(2,'teacher','Teacher'),(3,'student','Student');
/*!40000 ALTER TABLE `lmds_pj_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_token`
--

DROP TABLE IF EXISTS `lmds_pj_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_token` (
  `id_token` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(8) NOT NULL,
  `id_group` int(10) unsigned DEFAULT NULL,
  `acl_resources` varchar(255) DEFAULT NULL,
  `group_mode` text,
  `context` text,
  `expire_date` date DEFAULT NULL,
  `session_id` varchar(32) DEFAULT NULL,
  `classname` varchar(40) DEFAULT NULL,
  `otp` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id_token`),
  KEY `idx_id_group` (`id_group`),
  KEY `token` (`token`),
  KEY `otp` (`otp`),
  CONSTRAINT `lmds_pj_token_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `lmds_pj_group` (`id_group`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_token`
--

LOCK TABLES `lmds_pj_token` WRITE;
/*!40000 ALTER TABLE `lmds_pj_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_pj_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_pj_varset`
--

DROP TABLE IF EXISTS `lmds_pj_varset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_pj_varset` (
  `id_varset` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `label` varchar(200) NOT NULL,
  `varset_table_prefix` varchar(20) DEFAULT NULL,
  `id_resource` int(10) unsigned NOT NULL,
  `type` varchar(4) NOT NULL DEFAULT 'sys',
  PRIMARY KEY (`id_varset`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `varset_table_prefix` (`varset_table_prefix`),
  KEY `id_resource` (`id_resource`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_pj_varset`
--

LOCK TABLES `lmds_pj_varset` WRITE;
/*!40000 ALTER TABLE `lmds_pj_varset` DISABLE KEYS */;
INSERT INTO `lmds_pj_varset` VALUES (1,'resource','Resources','resource',1,'sys'),(2,'evtlog','Event log','evtlog',2,'sys'),(3,'monitoring','Varset Monitor','varsetmonitor',3,'sys'),(4,'dico','Dictionary','dico',5,'sys'),(5,'query','Query','query',6,'sys'),(6,'queryvar','QueryVar','queryvar',7,'sys'),(7,'querycache','Query cache','querycache',8,'sys'),(8,'user','User','user',9,'sys'),(9,'movie','Movie','movie',12,'std'),(10,'group','Group','grp',13,'std'),(11,'group_movie','Group - Movie','grp_movie',14,'std'),(12,'played_movie','Played movie','played_movie',17,'std'),(13,'storage','Storage','storage',18,'sys'),(14,'file','Uploaded files','file',19,'sys'),(15,'movie_file','Movie file','movie_file',20,'join'),(16,'dicostatus','Dictionary status','dicostatus',21,'sys');
/*!40000 ALTER TABLE `lmds_pj_varset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_played_movie_data`
--

DROP TABLE IF EXISTS `lmds_played_movie_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_played_movie_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_movie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_played_movie_data`
--

LOCK TABLES `lmds_played_movie_data` WRITE;
/*!40000 ALTER TABLE `lmds_played_movie_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_played_movie_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_played_movie_data_group`
--

DROP TABLE IF EXISTS `lmds_played_movie_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_played_movie_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_played_movie_data_group`
--

LOCK TABLES `lmds_played_movie_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_played_movie_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_played_movie_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_played_movie_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_played_movie_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_played_movie_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_played_movie_data_group_mode`
--

LOCK TABLES `lmds_played_movie_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_played_movie_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_played_movie_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_played_movie_deleted`
--

DROP TABLE IF EXISTS `lmds_played_movie_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_played_movie_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_movie` int(11) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_played_movie_deleted`
--

LOCK TABLES `lmds_played_movie_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_played_movie_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_played_movie_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_query_data`
--

DROP TABLE IF EXISTS `lmds_query_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_query_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `type_request` int(1) DEFAULT NULL,
  `id_resource` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `request` text,
  `message` varchar(200) DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `runlevel` int(10) unsigned DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `mode_avance` int(10) unsigned DEFAULT NULL,
  `cron_minute` varchar(200) DEFAULT NULL,
  `cron_hour` varchar(200) DEFAULT NULL,
  `cron_day` varchar(200) DEFAULT NULL,
  `cron_month` varchar(200) DEFAULT NULL,
  `cron_by_day` varchar(200) DEFAULT NULL,
  `cron_freq` int(10) unsigned DEFAULT NULL,
  `varset` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_query_data`
--

LOCK TABLES `lmds_query_data` WRITE;
/*!40000 ALTER TABLE `lmds_query_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_query_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_query_data_group`
--

DROP TABLE IF EXISTS `lmds_query_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_query_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_query_data_group`
--

LOCK TABLES `lmds_query_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_query_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_query_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_query_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_query_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_query_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_query_data_group_mode`
--

LOCK TABLES `lmds_query_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_query_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_query_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_query_deleted`
--

DROP TABLE IF EXISTS `lmds_query_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_query_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `type_request` int(1) DEFAULT NULL,
  `id_resource` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `request` text,
  `message` varchar(200) DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `runlevel` int(10) unsigned DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `mode_avance` int(10) unsigned DEFAULT NULL,
  `cron_minute` varchar(200) DEFAULT NULL,
  `cron_hour` varchar(200) DEFAULT NULL,
  `cron_day` varchar(200) DEFAULT NULL,
  `cron_month` varchar(200) DEFAULT NULL,
  `cron_by_day` varchar(200) DEFAULT NULL,
  `cron_freq` int(10) unsigned DEFAULT NULL,
  `varset` varchar(200) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_query_deleted`
--

LOCK TABLES `lmds_query_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_query_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_query_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_query_dico_runlevel_data`
--

DROP TABLE IF EXISTS `lmds_query_dico_runlevel_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_query_dico_runlevel_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_query` int(10) unsigned DEFAULT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_dico` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_query_dico_runlevel_data`
--

LOCK TABLES `lmds_query_dico_runlevel_data` WRITE;
/*!40000 ALTER TABLE `lmds_query_dico_runlevel_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_query_dico_runlevel_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_query_dico_runlevel_deleted`
--

DROP TABLE IF EXISTS `lmds_query_dico_runlevel_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_query_dico_runlevel_deleted` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_query` int(10) unsigned DEFAULT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_dico` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_query_dico_runlevel_deleted`
--

LOCK TABLES `lmds_query_dico_runlevel_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_query_dico_runlevel_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_query_dico_runlevel_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_querycache_data`
--

DROP TABLE IF EXISTS `lmds_querycache_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_querycache_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_record` int(11) DEFAULT NULL,
  `varset_name` varchar(50) DEFAULT NULL,
  `id_query` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_querycache_data`
--

LOCK TABLES `lmds_querycache_data` WRITE;
/*!40000 ALTER TABLE `lmds_querycache_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_querycache_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_querycache_data_group`
--

DROP TABLE IF EXISTS `lmds_querycache_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_querycache_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_querycache_data_group`
--

LOCK TABLES `lmds_querycache_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_querycache_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_querycache_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_querycache_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_querycache_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_querycache_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_querycache_data_group_mode`
--

LOCK TABLES `lmds_querycache_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_querycache_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_querycache_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_querycache_deleted`
--

DROP TABLE IF EXISTS `lmds_querycache_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_querycache_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_record` int(11) DEFAULT NULL,
  `varset_name` varchar(50) DEFAULT NULL,
  `id_query` int(11) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_querycache_deleted`
--

LOCK TABLES `lmds_querycache_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_querycache_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_querycache_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_queryvar_data`
--

DROP TABLE IF EXISTS `lmds_queryvar_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_queryvar_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_query` int(10) unsigned DEFAULT NULL,
  `id_varset` int(6) DEFAULT NULL,
  `id_var` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_queryvar_data`
--

LOCK TABLES `lmds_queryvar_data` WRITE;
/*!40000 ALTER TABLE `lmds_queryvar_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_queryvar_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_queryvar_data_group`
--

DROP TABLE IF EXISTS `lmds_queryvar_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_queryvar_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_queryvar_data_group`
--

LOCK TABLES `lmds_queryvar_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_queryvar_data_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_queryvar_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_queryvar_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_queryvar_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_queryvar_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_queryvar_data_group_mode`
--

LOCK TABLES `lmds_queryvar_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_queryvar_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_queryvar_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_queryvar_deleted`
--

DROP TABLE IF EXISTS `lmds_queryvar_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_queryvar_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_query` int(10) unsigned DEFAULT NULL,
  `id_varset` int(6) DEFAULT NULL,
  `id_var` varchar(50) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_queryvar_deleted`
--

LOCK TABLES `lmds_queryvar_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_queryvar_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_queryvar_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_resource_data`
--

DROP TABLE IF EXISTS `lmds_resource_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_resource_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `content` text,
  `filename` varchar(150) DEFAULT NULL,
  `description` text,
  `resource_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_resource_data`
--

LOCK TABLES `lmds_resource_data` WRITE;
/*!40000 ALTER TABLE `lmds_resource_data` DISABLE KEYS */;
INSERT INTO `lmds_resource_data` VALUES (1,2,'[SYSTEM] Resource',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"resource\" prefix=\"resource\" type=\"sys\" label=\"Resources\">\n	<var uid=\"1\" id=\"name\" type=\"string\" mandatory=\"true\" default_label=\"Resource name\" default_short_label=\"Name\">\n		<string length=\"45\"/>\n	</var>\n	<var uid=\"2\" id=\"type\" type=\"fkey_sysdico\" mandatory=\"true\" default_label=\"Type\" default_short_label=\"Type\">\n		<fkey_sysdico dico_name=\"resource_type\"/>\n	</var>\n	<var uid=\"3\" id=\"content\" type=\"text\" mandatory=\"false\" default_label=\"Content\" default_short_label=\"Content\"/>\n	<var uid=\"4\" id=\"filename\" type=\"string\" mandatory=\"false\" default_label=\"Filename\" default_short_label=\"Filename\">\n		<string length=\"150\"/>\n	</var>\n<var uid=\"5\" id=\"description\" type=\"text\" mandatory=\"false\" default_label=\"Description\"/><var uid=\"6\" id=\"resource_id\" type=\"string\" mandatory=\"false\" default_label=\"Resource ID\">\n		<string length=\"40\"/>\n	</var></varset>\n',NULL,'',''),(2,2,'[SYSTEM] Evtlog',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"evtlog\" prefix=\"evtlog\" type=\"sys\" label=\"Event log\">\n	<var uid=\"1\" id=\"evt_datetime\" type=\"datetime\" default_label=\"Date\" default_short_label=\"Date\"/>\n	<var uid=\"2\" id=\"evt_type\" type=\"integer\" default_label=\"Event type\" default_short_label=\"Type\">\n		<integer min=\"1\"/>\n	</var>\n	<var uid=\"3\" id=\"evt_name\" type=\"string\" default_label=\"Event\" default_short_label=\"Event\">\n		<string length=\"50\"/>\n	</var>\n	<var uid=\"4\" id=\"message\" type=\"string\" default_label=\"Message\" default_short_label=\"Message\">\n		<string length=\"255\"/>\n	</var>\n</varset>\n',NULL,NULL,NULL),(3,2,'[SYSTEM] Monitoring',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"monitoring\" prefix=\"varsetmonitor\" type=\"sys\" label=\"Monitoring\">\n	<var uid=\"1\" id=\"id_evtlog\" type=\"fkey_varset\">\n		<fkey_varset varset_name=\"evtlog\" multiple=\"false\"/>\n	</var>\n	<var uid=\"2\" id=\"id_varset\" type=\"integer\" default_label=\"VarSet ID\" default_short_label=\"VarSet ID\">\n		<integer min=\"1\"/>\n	</var>\n	<var uid=\"3\" id=\"id_data_monitored\" type=\"integer\" default_label=\"Record ID\" default_short_label=\"Record ID\">\n		<integer min=\"1\"/>\n	</var>\n	<var uid=\"4\" id=\"var_name\" type=\"string\" default_label=\"Var name\" default_short_label=\"Variable\">\n		<string length=\"30\"/>\n	</var>\n	<var uid=\"5\" id=\"value\" type=\"string\" default_label=\"Value\" default_short_label=\"Value\">\n		<string length=\"255\"/>\n	</var>\n</varset>\n',NULL,NULL,NULL),(4,2,'[SYSTEM] Project configuration',38,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<project><params><param name=\"id_style_resource\" value=\"16\" comment=\"Style du thème\"/><param name=\"conform_pssi\" value=\"0\" comment=\"Conformité à la PSSI\"/><param name=\"salt_key\" value=\"8f231a802307f7cc43c35a999c4850e8edf2f7e9\" comment=\"Clé de salage pour les mots-de-passe\"/><param name=\"prj_key\" value=\"7efcf602cc070872c95965ef619edba38cd88b41\" comment=\"Clé de cryptage projet\"/><param name=\"password_duration\" value=\"12\" comment=\"Durée de validité d\'un mot-de-passe\"/><param name=\"strong_password\" value=\"0\" comment=\"Utiliser les mots-de-passe forts ?\"/><param name=\"auth_mode\" value=\"1\" comment=\"Mode d\'authentification\"/><param name=\"varset_patient\" value=\"\" comment=\"Dossier patient\"/><param name=\"field_name_patient\" value=\"\" filter=\"0\" print=\"0\" comment=\"Champ nom de la table patient\"/><param name=\"field_firstname_patient\" value=\"\" filter=\"0\" print=\"0\" comment=\"Champ prénom de la table patient\"/><param name=\"field_identifiant_patient\" value=\"\" filter=\"0\" print=\"0\" comment=\"Champ identifiant de la table patient\"/><param name=\"field_ddn_patient\" value=\"\" filter=\"0\" print=\"0\" comment=\"Date de naissance du patient\"/><param name=\"field_sexe_patient\" value=\"\" filter=\"0\" print=\"0\" comment=\"Sexe du patient\"/></params></project>\n',NULL,NULL,NULL),(5,2,'[SYSTEM] Dico',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"dico\" prefix=\"dico\" type=\"sys\" label=\"Dictionary\">\n  <var uid=\"1\" id=\"dico_name\" type=\"string\" mandatory=\"true\" default_label=\"Dictionary\" default_short_label=\"Dictionary\">\n    <string length=\"50\" regexp=\"^[a-zA-Z0-9_]*$\"/>\n  </var>\n  <var uid=\"2\" id=\"label\" type=\"string\" mandatory=\"true\" default_label=\"Label\" default_short_label=\"Label\">\n    <string length=\"255\"/>\n  </var>\n  <var uid=\"3\" id=\"short_label\" type=\"string\" mandatory=\"false\" default_label=\"Short label\" default_short_label=\"Short label\">\n    <string length=\"30\"/>\n  </var>\n  <var uid=\"4\" id=\"position\" type=\"integer\" mandatory=\"false\" default_label=\"Position\" default_short_label=\"Pos.\">\n	  <integer min=\"0\" max=\"99999\"/>\n  </var>\n  <var uid=\"5\" id=\"code\" type=\"string\" mandatory=\"true\" default_label=\"Code\" default_short_label=\"Code\">\n    <string length=\"10\"/>\n  </var>\n<var uid=\"6\" id=\"dico_id\" type=\"string\" mandatory=\"false\" default_label=\"Dico id\" default_short_label=\"Dico id\">\n	<string length=\"40\"/>\n  </var><var uid=\"7\" id=\"dico_value_id\" type=\"string\" mandatory=\"false\" default_label=\"Dico id\" default_short_label=\"Dico id\">\n	<string length=\"40\"/>\n  </var><var uid=\"8\" id=\"archived\" type=\"boolean\" mandatory=\"false\" default_label=\"Is archived\" default_short_label=\"Is archived\"/></varset>\n',NULL,'',NULL),(6,2,'[SYSTEM] Query',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"query\" prefix=\"query\" type=\"sys\" label=\"Query\">\n	<var uid=\"1\" id=\"type_request\" type=\"integer\" default_label=\"Type\" default_short_label=\"Type\">\n		<integer min=\"0\" max=\"99999999999\"/>\n	</var>\n	<var uid=\"2\" id=\"id_resource\" type=\"integer\" default_label=\"ID resource\" default_short_label=\"ID resource\">\n			<integer min=\"0\" max=\"99999999999\"/>\n	</var>\n	<var uid=\"3\" id=\"name\" type=\"string\" default_label=\"Query name\" default_short_label=\"Name\" mandatory=\"true\">\n		<string length=\"100\"/>\n	</var>\n	<var uid=\"4\" id=\"request\" type=\"text\" default_label=\"SQL request\" default_short_label=\"Request\" mandatory=\"true\">\n	</var>\n	<var uid=\"5\" id=\"message\" type=\"string\" default_label=\"Message\" default_short_label=\"Message\">\n		<string length=\"200\"/>\n	</var>\n	<var uid=\"6\" id=\"level\" type=\"fkey_sysdico\" default_label=\"Error type\" default_short_label=\"Error type\">\n		<fkey_sysdico dico_name=\"consistency_test_lvl\"/>\n	</var>\n	<var uid=\"7\" id=\"runlevel\" type=\"fkey_sysdico_ext\" default_label=\"Effective\" default_short_label=\"Effective\">\n		<fkey_sysdico_ext dico_name=\"consistency_test_run\"/>\n	</var>\n<var uid=\"8\" id=\"tags\" type=\"string\" mandatory=\"false\" default_label=\"Tags\" default_short_label=\"Tags\">\n	  	<string length=\"255\"/>\n  	</var><var uid=\"9\" id=\"mode_avance\" type=\"fkey_sysdico\" mandatory=\"false\" default_label=\"Mode avancé\" default_short_label=\"Mode avancé\">\n		<fkey_sysdico dico_name=\"yorn\"/>\n	</var><var uid=\"10\" id=\"cron_minute\" type=\"string\" default_label=\"Minute\" default_short_label=\"Minute\">\n		<string length=\"200\"/>\n	</var><var uid=\"11\" id=\"cron_hour\" type=\"string\" default_label=\"Heure\" default_short_label=\"Heure\">\n		<string length=\"200\"/>\n	</var><var uid=\"12\" id=\"cron_day\" type=\"string\" default_label=\"N° jour\" default_short_label=\"Jour\">\n		<string length=\"200\"/>\n	</var><var uid=\"13\" id=\"cron_month\" type=\"string\" default_label=\"Mois\" default_short_label=\"Mois\">\n		<string length=\"200\"/>\n	</var><var uid=\"14\" id=\"cron_by_day\" type=\"string\" default_label=\"Jour\" default_short_label=\"Jour\">\n		<string length=\"200\"/>\n	</var><var uid=\"15\" id=\"cron_freq\" type=\"fkey_sysdico\" default_label=\"Frequency\" default_short_label=\"Frequency\">\n		<fkey_sysdico dico_name=\"consistency_test_frq\"/>\n	</var><var uid=\"16\" id=\"varset\" type=\"string\" default_label=\"Varset\" default_short_label=\"Varset\">\n		<string length=\"200\"/>\n	</var></varset>\n',NULL,'',''),(7,2,'[SYSTEM] Queryvar',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"queryvar\" prefix=\"queryvar\" type=\"sys\" label=\"Query Var\">\n	<var uid=\"1\" id=\"id_query\" type=\"fkey_varset\" default_label=\"Query ID\" default_short_label=\"Query ID\">\n    	<fkey_varset varset_name=\"query\"/>\n	</var>\n	<var uid=\"2\" id=\"id_varset\" type=\"integer\" default_label=\"Varset ID\" default_short_label=\"Varset ID\">\n    	<integer min=\"1\" max=\"999999\"/>\n	</var>\n	<var uid=\"3\" id=\"id_var\" type=\"string\" default_label=\"Var ID\" default_short_label=\"Var ID\">\n    	<string length=\"50\"/>\n	</var>\n</varset>\n',NULL,NULL,NULL),(8,2,'[SYSTEM] Querycache',40,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<varset name=\"querycache\" prefix=\"querycache\" type=\"sys\" label=\"Query cache\">\n	<var uid=\"1\" id=\"id_record\" type=\"integer\" default_label=\"Main varset record id\" default_short_label=\"Record id\"/>\n	<var uid=\"2\" id=\"varset_name\" type=\"string\" default_label=\"Main varset name\" default_short_label=\"Main varset name\">	\n		<string length=\"50\"/>\n	</var>\n	<var uid=\"3\" id=\"id_query\" type=\"integer\" default_label=\"Query id\" default_short_label=\"Query id\"/>\n</varset>\n',NULL,NULL,NULL),(9,2,'[SYSTEM] User',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"user\" prefix=\"user\" type=\"sys\" label=\"User\">\n	<var uid=\"1\" id=\"id_group\" type=\"integer\" mandatory=\"true\" default_label=\"Linked Group\" default_short_label=\"Linked group\">\n		<integer min=\"0\" max=\"4294967295\"/>\n	</var>\n	<var uid=\"2\" id=\"username\" type=\"string\" mandatory=\"true\" default_label=\"User ID\" default_short_label=\"User ID\">\n		<string length=\"50\"/>\n	</var>\n	<var uid=\"3\" id=\"firstname\" type=\"string\" mandatory=\"false\" default_label=\"Firstname\" default_short_label=\"Firstname\">\n		<string length=\"50\"/>\n	</var>\n	<var uid=\"4\" id=\"lastname\" type=\"string\" mandatory=\"false\" default_label=\"Lastname\" default_short_label=\"Lastname\">\n		<string length=\"50\"/>\n	</var>\n	<var uid=\"5\" id=\"email\" type=\"string\" mandatory=\"false\" default_label=\"Email\" default_short_label=\"Email\">\n		<string length=\"200\" validator=\"email\"/>\n	</var>\n	<var uid=\"6\" id=\"status\" type=\"fkey_sysdico\" mandatory=\"true\" default_label=\"Status\" default_short_label=\"Status\">\n		<fkey_sysdico dico_name=\"user_status\"/>\n	</var>\n	<var uid=\"7\" id=\"creation_date\" type=\"date\" mandatory=\"true\" default_label=\"Creation date\" default_short_label=\"Creation date\" default_value=\"NOW()\">\n		<date min=\"1900-01-01\"/>\n	</var>\n	<var uid=\"8\" id=\"password\" type=\"string\" mandatory=\"false\" default_label=\"Password\" default_short_label=\"Pwd\">\n		<string length=\"81\"/>\n	</var>\n	<var uid=\"9\" id=\"expire_date\" type=\"date\" mandatory=\"false\" default_label=\"Expiration date\" default_short_label=\"Expiration date\">\n		<date min=\"1900-01-01\"/>\n	</var>\n	<var uid=\"10\" id=\"cps_id\" type=\"string\" mandatory=\"false\" default_label=\"CPS ID\" default_short_label=\"CPS ID\">\n		<string length=\"30\"/>\n	</var>\n	<var uid=\"11\" id=\"oauth_provider_id_user\" type=\"integer\" mandatory=\"false\" default_label=\"ID on Provider\" default_short_label=\"ID on provider\">\n		<integer min=\"0\" max=\"4294967295\"/>\n	</var>\n	<var uid=\"12\" id=\"locale\" type=\"fkey_sysdico\" mandatory=\"true\" default_label=\"Language\" default_short_label=\"Language\">\n		<fkey_sysdico dico_name=\"locale\"/>\n	</var>\n	<var uid=\"13\" id=\"rpps\" type=\"string\" mandatory=\"false\" default_label=\"Doctor RPPS\" default_short_label=\"RPPS\">\n		<string length=\"11\"/>\n	</var>\n<var uid=\"14\" id=\"otp_phone_number\" type=\"string\" mandatory=\"false\" default_label=\"Phone number for OTP\">\n		<string length=\"20\"/>\n	</var></varset>\n',NULL,'',NULL),(10,2,'[SYSTEM] ACL',41,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<acl_roles><role id=\"1\"><access><allow name=\"form/frame/get\"/><allow name=\"form/frame/save\"/><allow name=\"form/frame/delete\"/><allow name=\"export/index\"/><allow name=\"upload/upload\"/><allow name=\"project/manager\"/><allow name=\"project/role\"/><allow name=\"project/user/getusers\"/><allow name=\"project/user/createuser\"/><allow name=\"project/user/updateuser\"/><allow name=\"project/user/setstatus\"/><allow name=\"project/user/deleteuser\"/><allow name=\"project/pwd/resetpwd\"/><allow name=\"project/pwd/updatepwd\"/><allow name=\"project/oauth/getconsumers\"/><allow name=\"project/oauth/getuserconsumer\"/><allow name=\"oauth/consumer/provideruserlist\"/></access><varsets><varset name=\"resource\" mode=\"7\"/><varset name=\"evtlog\" mode=\"7\"/><varset name=\"monitoring\" mode=\"7\"/><varset name=\"dico\" mode=\"7\"/><varset name=\"query\" mode=\"7\"/><varset name=\"queryvar\" mode=\"7\"/><varset name=\"querycache\" mode=\"7\"/><varset name=\"user\" mode=\"455\"/><varset name=\"movie\" mode=\"7\"/><varset name=\"group\" mode=\"7\"/><varset name=\"group_movie\" mode=\"7\"/><varset name=\"played_movie\" mode=\"7\"/><varset name=\"storage\" mode=\"7\"/><varset name=\"file\" mode=\"7\"/><varset name=\"movie_file\" mode=\"7\"/></varsets></role><role id=\"2\"><access><allow name=\"form/frame/get\"/><allow name=\"form/frame/save\"/><allow name=\"form/frame/delete\"/><allow name=\"export/index\"/><allow name=\"upload/upload\"/><allow name=\"project/manager\"/><allow name=\"project/role\"/><allow name=\"project/user/getusers\"/><allow name=\"project/user/createuser\"/><allow name=\"project/user/updateuser\"/><allow name=\"project/user/setstatus\"/><allow name=\"project/user/deleteuser\"/><allow name=\"project/pwd/resetpwd\"/><allow name=\"project/pwd/updatepwd\"/><allow name=\"project/oauth/getconsumers\"/><allow name=\"project/oauth/getuserconsumer\"/><allow name=\"oauth/consumer/provideruserlist\"/></access><varsets><varset name=\"resource\" mode=\"7\"/><varset name=\"evtlog\" mode=\"7\"/><varset name=\"monitoring\" mode=\"7\"/><varset name=\"dico\" mode=\"7\"/><varset name=\"query\" mode=\"7\"/><varset name=\"queryvar\" mode=\"7\"/><varset name=\"querycache\" mode=\"7\"/><varset name=\"user\" mode=\"7\"/><varset name=\"movie\" mode=\"7\"/><varset name=\"group\" mode=\"7\"/><varset name=\"group_movie\" mode=\"7\"/><varset name=\"played_movie\" mode=\"7\"/><varset name=\"storage\" mode=\"7\"/><varset name=\"file\" mode=\"7\"/><varset name=\"movie_file\" mode=\"7\"/></varsets></role><role id=\"3\"><access><allow name=\"form/frame/get\"/></access><varsets><varset name=\"dico\" mode=\"256\"/><varset name=\"movie\" mode=\"4\"/><varset name=\"group\" mode=\"4\"/><varset name=\"group_movie\" mode=\"4\"/><varset name=\"played_movie\" mode=\"6\"/><varset name=\"storage\" mode=\"4\"/><varset name=\"file\" mode=\"4\"/><varset name=\"movie_file\" mode=\"4\"/></varsets></role></acl_roles>\n',NULL,'',''),(11,2,'Homepage',63,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<form>\n	<data_structure />\n	<layout>\n		<statictext class=\"h4-like\">Accueil</statictext>\n		<box class=\"list-group col-md-offset-2 col-md-8\">\n			<link href=\"group/list/get\" class=\"list-group-item\">Groups</link>\n			<link href=\"movie/list/get\" class=\"list-group-item\">Movies</link>			\n			<link href=\"selectmovies/teacher-list/get\" class=\"list-group-item\">Group - Movie attachment</link>			\n	  	</box>\n		<form_row>\n			<box class=\"col-xs-12 text-right\">\n				<button id=\"settings-btn\" action=\"exit\" label=\"Settings\" class=\"btn-sm\">\n					<redirection module=\"lmdssettings\" ctrl=\"index\" action=\"get\" />\n				</button>\n				<link href=\"auth/index/disconnect\" method=\"window\" class=\"btn btn-danger btn-sm\">Déconnexion</link>\n			</box>\n		</form_row>\n	</layout>\n</form>',NULL,NULL,NULL),(12,2,'Movie',40,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<varset name=\"movie\" prefix=\"movie\" type=\"std\" label=\"Movie\">\n	<var uid=\"1\" id=\"label\" type=\"string\" mandatory=\"true\" default_label=\"Label\">\n		<string length=\"255\"/>\n	</var>\n	<var uid=\"4\" id=\"teacher\" type=\"fkey_varset\" mandatory=\"true\" default_label=\"Teacher\">\n		<fkey_varset varset_name=\"user\"/>\n	</var>\n	<var uid=\"5\" id=\"level\" type=\"fkey_dico\" mandatory=\"true\" default_label=\"Level\">\n		<fkey_dico dico_name=\"level\"/>\n	</var>\n	<!--var uid=\"6\" id=\"sub_level\" type=\"fkey_dico\" mandatory=\"false\" default_label=\"Sub level\">\n		<fkey_dico dico_name=\"sub_level\"/>\n	</var-->\n	<var uid=\"7\" id=\"movie_type\" type=\"fkey_dico\" mandatory=\"true\" default_label=\"Movie type\">\n		<fkey_dico dico_name=\"movie_type\"/>\n	</var>\n</varset>\n',NULL,NULL,NULL),(13,2,'Group',40,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<varset name=\"group\" prefix=\"grp\" type=\"std\" label=\"Group\">\n	<var uid=\"1\" id=\"label\" type=\"string\" mandatory=\"true\" default_label=\"Label\">\n		<string length=\"255\"/>\n	</var>\n	<var uid=\"2\" id=\"teacher\" type=\"fkey_varset\" mandatory=\"true\" default_label=\"Teacher\">\n		<fkey_varset varset_name=\"user\"/>\n	</var>\n	<var uid=\"3\" id=\"level\" type=\"fkey_dico\" mandatory=\"true\" default_label=\"Level\">\n		<fkey_dico dico_name=\"group_detailed_level\"/>\n	</var>\n	<!--var uid=\"4\" id=\"sub_level\" type=\"fkey_dico\" mandatory=\"true\" default_label=\"Sub Level\">\n		<fkey_dico dico_name=\"sub_level\"/>\n	</var-->\n	<var uid=\"5\" id=\"movies\" type=\"fkey_varset_ext\" mandatory=\"true\" default_label=\"Movies\">\n		<fkey_varset_ext varset_name=\"movie\"/>\n	</var>\n	<!--var uid=\"6\" id=\"detailed_level\" type=\"fkey_dico\" mandatory=\"true\" default_label=\"Detailed Level\">\n		<fkey_dico dico_name=\"group_detailed_level\"/>\n	</var-->\n</varset>\n',NULL,NULL,NULL),(14,2,'Group - Movie',40,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<varset name=\"group_movie\" prefix=\"grp_movie\" type=\"std\" label=\"Group - Movie\">\n	<var uid=\"1\" id=\"id_group\" type=\"integer\"/>\n	<var uid=\"2\" id=\"id_movie\" type=\"integer\"/>\n</varset>\n',NULL,NULL,NULL),(15,2,'Group form',37,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<form>\n	<!-- Définition des sources données -->\n	<data_structure>\n\n		<!-- Dataquery -->\n		<dataquery id=\"group\" table_name=\"{pj}_grp_data\" varset_name=\"group\" table_alias=\"g\">\n			<column_simple field_name=\"id_data\" table_name=\"g\" />\n			<column_simple field_name=\"label\" table_name=\"g\" />\n			<column_simple field_name=\"level\" table_name=\"g\" />\n			<column_simple field_name=\"sub_level\" table_name=\"g\" />\n			<column_simple field_name=\"teacher\" table_name=\"g\" />\n			<!-- Permet l\'ajout et la modification -->\n			<condition sql=\"{id_data}={param_id_data}\">\n				<field field_name=\"id_data\" table_name=\"g\" alias=\"id_data\" />\n				<variable alias=\"param_id_data\" default=\"NULL\">\n					<entry type=\"param\" name=\"id_data\" />\n				</variable>\n			</condition>\n		</dataquery>\n		<dataquery id=\"search\" table_name=\"{pj}_user_data\" varset_name=\"user\" table_alias=\"u\">\n\n            <!-- Section 1: search dataquery required fields -->\n            <!-- Search condition -->\n            <match sql=\"{u.firstname} LIKE \'%{search_string}%\' OR {u.lastname} LIKE \'%{search_string}%\'\" optional=\"true\">\n        	    <field field_name=\"firstname\" table_name=\"u\" alias=\"u.firstname\"/>\n        	    <field field_name=\"lastname\" table_name=\"u\" alias=\"u.lastname\"/>\n        	    <variable alias=\"search_string\" default=\"NULL\" type=\"search\">\n                    <entry type=\"param\" name=\"search_string\"/>\n        	    </variable>\n    		</match>\n\n            <!-- Search result to show -->\n            <column sql=\"concat({u.firstname}, \' \', {u.lastname})\" alias=\"body\" type=\"string\" length=\"150\">\n            	<field table_name=\"u\" field_name=\"firstname\" alias=\"u.firstname\"/>\n            	<field table_name=\"u\" field_name=\"lastname\" alias=\"u.lastname\"/>\n    		</column>\n\n            <!-- Value for search input field (optional) -->\n            <column sql=\"concat({u.firstname}, \' \', {u.lastname})\" alias=\"field_value\" type=\"string\" >\n            	<field table_name=\"u\" field_name=\"firstname\" alias=\"u.firstname\"/>\n            	<field table_name=\"u\" field_name=\"lastname\" alias=\"u.lastname\"/>\n    		</column>\n\n            <!-- Condition used to set search input field after page load -->\n            <!-- Conditions are removed when match is used -->\n            <condition sql=\"{u.id_data}={param_id_data}\">\n            	<field field_name=\"id_data\" table_name=\"u\" alias=\"u.id_data\"/>\n            	<variable alias=\"param_id_data\" default=\"NULL\">\n					<entry type=\"dataset\" name=\"group\" field=\"teacher\" row=\"current\" />\n            	</variable>\n    		</condition>\n\n            <!-- Section 2: value(s) to store in target dataset -->\n            <!-- Used to fill id_module variable in intervention dataquery -->\n            <column sql=\"{u.id_data}\" alias=\"teacher\">\n            	<field table_name=\"u\" field_name=\"id_data\" alias=\"u.id_data\"/>\n    		</column>\n\n    	</dataquery>\n	</data_structure>\n\n	<!-- Mise en page -->\n	<layout title=\"Groupe\" disabled=\"false\">\n		<form_row>\n			<label dataset=\"group\" field=\"label\" />\n		  	<value dataset=\"group\" field=\"label\" mode=\"rw\" />\n	  	</form_row>\n	  	<form_row>\n			<label dataset=\"group\" field=\"teacher\" />\n			<search search_param=\"search_string\" search_dataset=\"search\" target_dataset=\"group\" />\n	  	</form_row>\n	  	<form_row>\n			<label dataset=\"group\" field=\"level\"/>\n			<value dataset=\"group\" field=\"level\" mode=\"rw\" >\n				<option output=\"html\" option_name=\"widget\" value=\"WidgetSelect\"/>\n			</value>\n	 	</form_row>\n	  	<form_row>\n			<label dataset=\"group\" field=\"sub_level\"/>\n			<value dataset=\"group\" field=\"sub_level\" mode=\"rw\" >\n				<option output=\"html\" option_name=\"widget\" value=\"WidgetSelect\"/>			\n			</value>\n	 	</form_row>\n		<form_row>\n			<box class=\"col-xs-6\">\n				<button action=\"exit\" label=\"Exit\"/>\n			</box>\n			<box class=\"col-xs-6 text-right\">\n				<button action=\"save\" label=\"Save\" class=\"btn-primary\"/>\n			</box>\n		</form_row>\n	</layout>\n</form>',NULL,NULL,NULL),(16,2,'Style',39,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<style>\n	<color>\n		<main>#000</main>\n		<black></black>\n		<white></white>\n		<error></error>\n		<warning></warning>\n		<notice></notice>\n		<info></info>\n	</color>\n	<font>\n		<family>Arial,Helvetica,Geneva,Sans-serif</family>\n		<size>14px</size>\n	</font>\n</style>',NULL,NULL,NULL),(17,2,'Played movies',40,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<varset name=\"played_movie\" prefix=\"played_movie\" type=\"std\" label=\"Played movie\">\n	<var uid=\"1\" id=\"id_movie\" type=\"integer\" mandatory=\"true\" default_label=\"Played movie\"/>\n</varset>\n',NULL,NULL,NULL),(18,2,'Storage',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"storage\" prefix=\"storage\" type=\"sys\" label=\"Storage\">\n   <var uid=\"1\" id=\"path\" type=\"string\">\n      <string length=\"255\"/>\n   </var>\n</varset>\n',NULL,NULL,NULL),(19,2,'File',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"file\" prefix=\"file\" type=\"sys\" label=\"Uploaded files\">\n   <var uid=\"1\" id=\"status\" type=\"integer\" default_label=\"Status du fichier\" default_short_label=\"Status\">\n      <integer min=\"0\" max=\"2\"/>\n   </var>\n   <var uid=\"2\" id=\"date_creation\" type=\"datetime\" default_label=\"Date création\" default_short_label=\"Date création\"/>\n   <var uid=\"3\" id=\"original_name\" type=\"string\" default_label=\"Nom du fichier\" default_short_label=\"Nom\">\n      <string length=\"128\"/>\n   </var>\n   <var uid=\"4\" id=\"generated_name\" type=\"string\" default_label=\"Nom généré\" default_short_label=\"Nom généré\">\n      <string length=\"32\"/>\n   </var>\n   <var uid=\"5\" id=\"size\" type=\"integer\" default_label=\"Taille du fichier\" default_short_label=\"Taille\">\n      <integer min=\"1\" max=\"9999999999\"/>\n   </var>\n   <var uid=\"6\" id=\"hash\" type=\"string\" default_label=\"Hash\" default_short_label=\"Hash\">\n      <string length=\"32\"/>\n   </var>\n   <var uid=\"7\" id=\"ext\" type=\"string\" default_label=\"Extension\" default_short_label=\"Ext\">\n      <string length=\"8\"/>\n   </var>\n   <var uid=\"8\" id=\"content_type\" type=\"string\" default_label=\"Content-type\" default_short_label=\"Type\">\n      <string length=\"100\"/>\n   </var>\n   <var uid=\"9\" id=\"id_storage\" type=\"fkey_varset\" default_label=\"Dépôt\" default_short_label=\"Dépôt\">\n      <fkey_varset varset_name=\"storage\"/>\n   </var>\n   <var uid=\"10\" id=\"path\" type=\"string\" default_label=\"Path\" default_short_label=\"Path\">\n      <string length=\"6\"/>\n   </var>\n</varset>\n',NULL,NULL,NULL),(20,2,'Movie - File',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"movie_file\" prefix=\"movie_file\" type=\"join\" label=\"Movie file\">\n    <var uid=\"1\" id=\"id_movie\" type=\"fkey_varset\">\n        <fkey_varset varset_name=\"movie\"/>\n    </var>\n    <var uid=\"2\" id=\"id_file\" type=\"fkey_varset\">\n        <fkey_varset varset_name=\"file\"/>\n    </var>\n</varset>\n',NULL,NULL,NULL),(21,NULL,'varset.dicostatus.xml',40,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"dicostatus\" prefix=\"dicostatus\" type=\"sys\" label=\"Dictionary status\">\n	<var uid=\"1\" id=\"id_dico\" type=\"fkey_varset\" mandatory=\"true\" default_label=\"ID Dico\" default_short_label=\"ID Dico\">\n		<fkey_varset varset_name=\"dico\"/>\n	</var>\n	<var uid=\"2\" id=\"status\" type=\"fkey_sysdico\" mandatory=\"true\" default_label=\"Status\" default_short_label=\"Status\">\n		<fkey_sysdico dico_name=\"dico_value_status\"/>\n	</var>\n	<var uid=\"3\" id=\"effective_date\" type=\"datetime\" mandatory=\"true\" default_label=\"Effective date\" default_short_label=\"Effective date\"/>\n</varset>\n',NULL,'',NULL);
/*!40000 ALTER TABLE `lmds_resource_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_resource_data_group`
--

DROP TABLE IF EXISTS `lmds_resource_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_resource_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_resource_data_group`
--

LOCK TABLES `lmds_resource_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_resource_data_group` DISABLE KEYS */;
INSERT INTO `lmds_resource_data_group` VALUES (1,1,1),(2,2,1),(3,3,1),(18,4,2),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(16,10,2),(11,11,1),(12,12,2),(13,13,2),(14,14,2),(15,15,2),(17,16,2),(19,17,2),(20,18,2),(21,19,2),(22,20,2);
/*!40000 ALTER TABLE `lmds_resource_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_resource_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_resource_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_resource_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_resource_data_group_mode`
--

LOCK TABLES `lmds_resource_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_resource_data_group_mode` DISABLE KEYS */;
INSERT INTO `lmds_resource_data_group_mode` VALUES (1,12,56,NULL),(2,13,56,NULL),(3,14,56,NULL),(4,15,56,NULL),(5,16,56,NULL),(6,17,56,NULL),(7,18,56,NULL),(8,19,56,NULL),(9,20,56,NULL),(10,21,56,NULL),(11,22,56,NULL);
/*!40000 ALTER TABLE `lmds_resource_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_resource_deleted`
--

DROP TABLE IF EXISTS `lmds_resource_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_resource_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` int(10) unsigned DEFAULT NULL,
  `content` text,
  `filename` varchar(150) DEFAULT NULL,
  `description` text,
  `resource_id` varchar(40) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_resource_deleted`
--

LOCK TABLES `lmds_resource_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_resource_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_resource_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_storage_data`
--

DROP TABLE IF EXISTS `lmds_storage_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_storage_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_storage_data`
--

LOCK TABLES `lmds_storage_data` WRITE;
/*!40000 ALTER TABLE `lmds_storage_data` DISABLE KEYS */;
INSERT INTO `lmds_storage_data` VALUES (1,2,'/Library/WebServer/Documents/storage');
/*!40000 ALTER TABLE `lmds_storage_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_storage_data_group`
--

DROP TABLE IF EXISTS `lmds_storage_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_storage_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_storage_data_group`
--

LOCK TABLES `lmds_storage_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_storage_data_group` DISABLE KEYS */;
INSERT INTO `lmds_storage_data_group` VALUES (1,1,2);
/*!40000 ALTER TABLE `lmds_storage_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_storage_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_storage_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_storage_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_storage_data_group_mode`
--

LOCK TABLES `lmds_storage_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_storage_data_group_mode` DISABLE KEYS */;
INSERT INTO `lmds_storage_data_group_mode` VALUES (1,1,56,NULL);
/*!40000 ALTER TABLE `lmds_storage_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_storage_deleted`
--

DROP TABLE IF EXISTS `lmds_storage_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_storage_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_storage_deleted`
--

LOCK TABLES `lmds_storage_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_storage_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_storage_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_user_data`
--

DROP TABLE IF EXISTS `lmds_user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_user_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_group` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `password` varchar(81) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `cps_id` varchar(30) DEFAULT NULL,
  `oauth_provider_id_user` int(10) DEFAULT NULL,
  `locale` int(10) unsigned DEFAULT NULL,
  `rpps` varchar(11) DEFAULT NULL,
  `otp_phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_user_data`
--

LOCK TABLES `lmds_user_data` WRITE;
/*!40000 ALTER TABLE `lmds_user_data` DISABLE KEYS */;
INSERT INTO `lmds_user_data` VALUES (1,2,2,'root','Sébastien','Becquerel',NULL,30,'2015-01-23','63a9f0ea7bb98050796b649e85481845',NULL,NULL,0,36,NULL,NULL),(2,2,6,'s.strauss','Simon','Strauss',NULL,30,'2015-01-24','21c18981ce33bf637a321926a9163d3a',NULL,NULL,NULL,36,NULL,NULL),(3,2,7,'f.servine','Franck','Servine',NULL,30,'2015-01-25','f770a62c4355ca296dfa628527d6cec3d931410b:ff833a36d432aae23b048a97493c8feb9875e8a6',NULL,NULL,NULL,36,NULL,NULL),(4,2,12,'s.becquerel@gmail.com','Sébastien','Becquerel',NULL,30,'2015-01-25','d2e6e969d0c645224fe4a8bdcd6f17f2',NULL,NULL,0,36,NULL,NULL),(5,2,13,'stephane','Stéphane','Rambaud',NULL,30,'2015-02-01','f7885ad36a637f4a1212716eb9cdcff2',NULL,NULL,NULL,36,NULL,NULL),(6,2,14,'maxime','Maxime','Pichon',NULL,30,'2015-02-01','b238c13e822536cad3ac57a2280fbf45',NULL,NULL,NULL,36,NULL,NULL),(7,2,15,'nicolas','Nicolas','Hoch',NULL,30,'2015-02-01','deb97a759ee7b8ba42e02dddf2b412fe',NULL,NULL,NULL,36,NULL,NULL),(8,2,16,'louis','Louis','Marin',NULL,30,'2015-02-01','777cadc280bb23ebea268ded98338c39',NULL,NULL,NULL,36,NULL,NULL),(9,2,18,'g.fiton@gmail.com','Guillaume','Fiton',NULL,30,'2015-02-01','779ad70d6319dc296bf8aa271ba63bad',NULL,NULL,NULL,36,NULL,NULL);
/*!40000 ALTER TABLE `lmds_user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_user_data_group`
--

DROP TABLE IF EXISTS `lmds_user_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_user_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_user_data_group`
--

LOCK TABLES `lmds_user_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_user_data_group` DISABLE KEYS */;
INSERT INTO `lmds_user_data_group` VALUES (1,1,1),(2,2,1),(3,2,6),(4,3,1),(5,3,7),(6,4,1),(7,4,12),(8,5,1),(9,5,13),(10,6,1),(11,6,14),(12,7,1),(13,7,15),(14,8,1),(15,8,16),(16,9,1),(17,9,18);
/*!40000 ALTER TABLE `lmds_user_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_user_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_user_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_user_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_user_data_group_mode`
--

LOCK TABLES `lmds_user_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_user_data_group_mode` DISABLE KEYS */;
INSERT INTO `lmds_user_data_group_mode` VALUES (1,3,438,NULL),(2,5,438,NULL),(3,7,438,NULL),(4,9,438,NULL),(5,11,438,NULL),(6,13,438,NULL),(7,15,438,NULL),(8,17,438,NULL);
/*!40000 ALTER TABLE `lmds_user_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_user_deleted`
--

DROP TABLE IF EXISTS `lmds_user_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_user_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_group` int(10) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status` int(10) unsigned DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `password` varchar(81) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `cps_id` varchar(30) DEFAULT NULL,
  `oauth_provider_id_user` int(10) DEFAULT NULL,
  `locale` int(10) unsigned DEFAULT NULL,
  `rpps` varchar(11) DEFAULT NULL,
  `otp_phone_number` varchar(20) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_user_deleted`
--

LOCK TABLES `lmds_user_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_user_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_user_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_varsetmonitor_data`
--

DROP TABLE IF EXISTS `lmds_varsetmonitor_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_varsetmonitor_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_evtlog` int(10) unsigned DEFAULT NULL,
  `id_varset` int(11) DEFAULT NULL,
  `id_data_monitored` int(11) DEFAULT NULL,
  `var_name` varchar(30) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `id_varset` (`id_varset`,`id_data_monitored`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_varsetmonitor_data`
--

LOCK TABLES `lmds_varsetmonitor_data` WRITE;
/*!40000 ALTER TABLE `lmds_varsetmonitor_data` DISABLE KEYS */;
INSERT INTO `lmds_varsetmonitor_data` VALUES (1,NULL,2,1,21,'content','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<varset name=\"dicostatus\" prefix=\"dicostatus\" type=\"sys\" label=\"Dictionary status\">\n	<var uid=\"1\" id=\"id_dico\" type=\"fkey_varset\" mandatory=\"true\" default_label=\"ID Dico\" default_short_label=\"ID Dico\">\n		<fkey_varset'),(2,NULL,2,1,21,'name','varset.dicostatus.xml'),(3,NULL,2,1,21,'type','40'),(4,NULL,2,1,21,'description','');
/*!40000 ALTER TABLE `lmds_varsetmonitor_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_varsetmonitor_data_group`
--

DROP TABLE IF EXISTS `lmds_varsetmonitor_data_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_varsetmonitor_data_group` (
  `id_data_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data` int(10) unsigned NOT NULL,
  `id_group` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_data_group`),
  UNIQUE KEY `id_data` (`id_data`,`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_varsetmonitor_data_group`
--

LOCK TABLES `lmds_varsetmonitor_data_group` WRITE;
/*!40000 ALTER TABLE `lmds_varsetmonitor_data_group` DISABLE KEYS */;
INSERT INTO `lmds_varsetmonitor_data_group` VALUES (1,1,1),(2,1,8),(3,1,9),(4,1,10),(5,1,11),(6,1,17),(7,2,1),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,17),(13,3,1),(14,3,8),(15,3,9),(16,3,10),(17,3,11),(18,3,17),(19,4,1),(20,4,8),(21,4,9),(22,4,10),(23,4,11),(24,4,17);
/*!40000 ALTER TABLE `lmds_varsetmonitor_data_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_varsetmonitor_data_group_mode`
--

DROP TABLE IF EXISTS `lmds_varsetmonitor_data_group_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_varsetmonitor_data_group_mode` (
  `id_data_group_mode` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_data_group` int(10) unsigned NOT NULL,
  `mode` int(10) unsigned NOT NULL,
  `date_valid` date DEFAULT NULL,
  PRIMARY KEY (`id_data_group_mode`),
  UNIQUE KEY `id_data_group` (`id_data_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_varsetmonitor_data_group_mode`
--

LOCK TABLES `lmds_varsetmonitor_data_group_mode` WRITE;
/*!40000 ALTER TABLE `lmds_varsetmonitor_data_group_mode` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_varsetmonitor_data_group_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lmds_varsetmonitor_deleted`
--

DROP TABLE IF EXISTS `lmds_varsetmonitor_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lmds_varsetmonitor_deleted` (
  `id_data` int(10) unsigned NOT NULL,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `id_evtlog` int(10) unsigned DEFAULT NULL,
  `id_varset` int(11) DEFAULT NULL,
  `id_data_monitored` int(11) DEFAULT NULL,
  `var_name` varchar(30) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lmds_varsetmonitor_deleted`
--

LOCK TABLES `lmds_varsetmonitor_deleted` WRITE;
/*!40000 ALTER TABLE `lmds_varsetmonitor_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `lmds_varsetmonitor_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` char(32) NOT NULL,
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_context`
--

DROP TABLE IF EXISTS `sys_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_context` (
  `id_sys_config` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `section` varchar(80) NOT NULL,
  `name` varchar(80) NOT NULL,
  `value` varchar(80) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id_sys_config`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_context`
--

LOCK TABLES `sys_context` WRITE;
/*!40000 ALTER TABLE `sys_context` DISABLE KEYS */;
INSERT INTO `sys_context` VALUES (1,'system','version','2.24','2017-07-24 22:11:33');
/*!40000 ALTER TABLE `sys_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dico_data`
--

DROP TABLE IF EXISTS `sys_dico_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dico_data` (
  `id_data` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(10) unsigned DEFAULT NULL,
  `dico_name` char(50) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `short_label` varchar(30) NOT NULL,
  `position` int(11) DEFAULT '0',
  `code` char(50) DEFAULT NULL,
  `dico_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `idx_dico_name` (`dico_name`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dico_data`
--

LOCK TABLES `sys_dico_data` WRITE;
/*!40000 ALTER TABLE `sys_dico_data` DISABLE KEYS */;
INSERT INTO `sys_dico_data` VALUES (1,1,'dmcp_modalite','Directly','DMCP_MDIRECT',3,'D',NULL),(2,1,'dmcp_modalite','By phone','DMCP_MTEL',2,'T',NULL),(3,1,'dmcp_modalite','By mail','DMCP_MMAIL',1,'M',NULL),(4,1,'dmcp_demande','History','DMCP_HDEM',3,'H',NULL),(5,1,'dmcp_demande','Modification','DMCP_RDEM',2,'R',NULL),(6,1,'dmcp_demande','Data access','DMCP_ADEM',1,'A',NULL),(7,1,'dmcp_access_mode','Modifications','DMCP_UACCESS',3,'U',NULL),(8,1,'dmcp_access_mode','Insert','DMCP_CACCESS',2,'C',NULL),(9,1,'dmcp_access_mode','Read','DMCP_RACCESS',1,'R',NULL),(10,1,'dmcp','Protected','DMCP_PROTECTED',4,'4',NULL),(11,1,'dmcp','Accessible','DMCP_ACCESS',2,'1',NULL),(12,1,'dmcp','Not subject to','DMCP_NO',1,'0',NULL),(13,1,'dmcp','Nominative','DMCP_NOM',3,'2',NULL),(14,1,'type_evt','Information','INFO',1,'6',NULL),(15,1,'type_evt','Debug','DEBUG',2,'7',NULL),(16,1,'type_evt','Insert','VZN_REC_INSERT',3,'8',NULL),(17,1,'type_evt','Update','VZN_REC_UPDATE',4,'9',NULL),(18,1,'type_evt','Delete','VZN_REC_DELETE',5,'10',NULL),(19,1,'type_evt','Connection','VZN_EVT_CONNEXION',6,'11',NULL),(20,1,'type_evt','Connection CPSx','VZN_EVT_CONNEXIONCPS',7,'12',NULL),(21,1,'type_evt','Connection oAuth','VZN_EVT_CONNEXION_OAUTH',8,'13',NULL),(22,1,'type_evt','Connection Webservices','VZN_EVT_CONNEXION_WS',9,'14',NULL),(23,1,'type_evt','Group merge','VZN_EVT_GRP_MERGE',201,'201',NULL),(24,1,'type_evt','Group rm','VZN_EVT_GRP_RM',202,'202',NULL),(25,1,'type_evt','Group rename','VZN_EVT_GRP_RENAME',203,'203',NULL),(26,1,'type_evt','Group add','VZN_EVT_GRP_ADD',204,'204',NULL),(27,1,'type_evt','Group disable','VZN_EVT_GRP_DISABLE',205,'205',NULL),(28,1,'type_evt','Group enable','VZN_EVT_GRP_ENABLE',206,'206',NULL),(29,1,'type_evt','Group move','VZN_EVT_GRP_MOVE',207,'207',NULL),(30,1,'user_status','Enabled','on',1,'on',NULL),(31,1,'user_status','Disabled','off',2,'off',NULL),(32,1,'user_status','Deleted','del',3,'del',NULL),(33,1,'yorn','Yes','yes',1,'y',NULL),(34,1,'yorn','No','no',2,'n',NULL),(35,1,'locale','English (UK)','UK',1,'en_GB',NULL),(36,1,'locale','Français (FR)','FR',2,'fr_FR',NULL),(37,1,'resource_type','Form','form',1,'frm',NULL),(38,1,'resource_type','Project','project',2,'prj',NULL),(39,1,'resource_type','Style','style',3,'stl',NULL),(40,1,'resource_type','Varset','varset',4,'vst',NULL),(41,1,'resource_type','ACL','acl',5,'acl',NULL),(42,1,'resource_type','XML','xml',6,'xml',NULL),(43,1,'resource_type','DataSet','dataset',7,'dst',NULL),(44,1,'resource_type','Data Structure','data_structure',8,'str',NULL),(45,1,'resource_type','DataQuery','dataquery',9,'dqy',NULL),(46,1,'resource_type','Query','query',10,'qry',NULL),(47,1,'resource_type','Group','group',11,'grp',NULL),(48,1,'resource_type','ACL Roles','acl_roles',12,'arl',NULL),(49,1,'resource_type','ACL Resources','acl_resources',13,'ars',NULL),(50,1,'resource_type','PHP','php',14,'php',NULL),(51,1,'resource_type','SQL','sql',15,'sql',NULL),(52,1,'resource_type','TPL','tpl',16,'tpl',NULL),(53,1,'resource_type','XSD','xsd',17,'xsd',NULL),(54,1,'resource_type','XSL','xsl',18,'xsl',NULL),(55,1,'resource_type','PO','po',19,'po',NULL),(56,1,'resource_type','MO','mo',20,'mo',NULL),(57,1,'resource_type','CSV','csv',21,'csv',NULL),(58,1,'resource_type','Fixed length','fixed len',22,'fln',NULL),(59,1,'resource_type','Standard class','stdclass',23,'scl',NULL),(60,1,'resource_type','ODK','odk',24,'odk',NULL),(61,1,'resource_type','Listing','listing',25,'lst',NULL),(62,1,'resource_type','Filter','filter',26,'flt',NULL),(63,1,'resource_type','Homepage','homepage',27,'hmp',NULL),(64,1,'resource_type','Script','script',28,'scr',NULL),(65,1,'resource_type','R','r',29,'r',NULL),(66,1,'consistency_test_lvl','Warning (non-blocking)','Warning',2,'wrn',NULL),(67,1,'consistency_test_lvl','Error (blocking)','Error',1,'err',NULL),(68,1,'consistency_test_run','When exiting field','Runtime',1,'rtm',NULL),(69,1,'consistency_test_run','Accumulated (batch)','Batch',2,'bch',NULL),(70,1,'provider_type','Webservice Voozanoo4','ws vzn4',1,'ws_vzn4',NULL),(71,1,'provider_type','Webservice','ws',1,'ws',NULL),(72,NULL,'consistency_test_lvl','Alerte','Alerte',NULL,'alt',NULL),(73,NULL,'consistency_test_lvl','Notice','Notice',NULL,'ntc',NULL),(74,NULL,'consistency_test_frq','Every month','Every month',1,'0 0 1 * *',NULL),(75,NULL,'consistency_test_frq','Every week','Every week',2,'0 0 * * 0',NULL),(76,NULL,'consistency_test_frq','Every day at midnight','Every day at midnight',3,'0 0 * * *',NULL),(77,NULL,'consistency_test_frq','Every hour','Every hour',4,'0 * * * *',NULL),(78,NULL,'listing_rows_number','20','20',1,'20',NULL),(79,NULL,'listing_rows_number','50','50',2,'50',NULL),(80,NULL,'listing_rows_number','100','100',3,'100',NULL),(81,NULL,'listing_action','View','View',1,'view',NULL),(82,NULL,'listing_action','Edit','Edit',2,'edit',NULL),(83,NULL,'listing_action','Delete','Delete',3,'delete',NULL),(84,NULL,'filter_action','Value','Value',1,'value',NULL),(85,NULL,'filter_action','Enter during use','Enter during use',2,'dynamic',NULL),(86,NULL,'filter_approximation','Days','Days',1,'days',NULL),(87,NULL,'filter_approximation','Months','Months',2,'months',NULL),(88,NULL,'filter_approximation','Years','Years',3,'years',NULL),(89,NULL,'filter_approximation','Hours','Hours',1,'hours',NULL),(90,NULL,'filter_approximation','Days','Days',2,'days',NULL),(91,NULL,'filter_approximation','Months','Months',3,'months',NULL),(92,NULL,'filter_approximation','Years','Years',4,'years',NULL),(93,NULL,'filter_approximation','%','%',1,'%',NULL),(94,NULL,'filter_approximation','Minutes','Minutes',1,'minutes',NULL),(95,NULL,'filter_approximation','Hours','Hours',2,'hours',NULL),(96,NULL,'filter_approximation','-','-',1,'-',NULL),(97,NULL,'filter_approximation','+','+',2,'+',NULL),(98,NULL,'filter_comparator_di','equal to','equal to',1,'=',NULL),(99,NULL,'filter_comparator_di','different than','different than',2,'!=',NULL),(100,NULL,'filter_comparator_di','empty','empty',3,'empty',NULL),(101,NULL,'filter_comparator_nu','greater than','greater than',1,'>',NULL),(102,NULL,'filter_comparator_nu','greater than or equal to','greater than',2,'>=',NULL),(103,NULL,'filter_comparator_nu','equal to','equal to',3,'=',NULL),(104,NULL,'filter_comparator_nu','different than','different than',4,'!=',NULL),(105,NULL,'filter_comparator_nu','less than','less than',5,'<',NULL),(106,NULL,'filter_comparator_nu','less than or equal to','less than or equal to',6,'<=',NULL),(107,NULL,'filter_comparator_nu','empty','empty',7,'empty',NULL),(108,NULL,'filter_comparator_st','equal to','equal to',1,'=',NULL),(109,NULL,'filter_comparator_st','different than','different than',2,'!=',NULL),(110,NULL,'filter_comparator_st','contains','contains',3,'contain',NULL),(111,NULL,'filter_comparator_st','begins with','begins with',4,'begin',NULL),(112,NULL,'filter_comparator_st','ends with','ends with',5,'end',NULL),(113,NULL,'filter_comparator_st','empty','empty',6,'empty',NULL),(114,NULL,'function_date','NOW()','NOW()',1,'now()',NULL),(115,NULL,'dico_value_status','Created','Created',1,'C',NULL),(116,NULL,'dico_value_status','Archived','Archived',2,'A',NULL),(117,NULL,'dico_value_status','Unarchived','Unarchived',3,'UA',NULL),(118,NULL,'type_evt','Dico delete','VZN_EVT_DICO_DELETE',301,'301',NULL),(119,NULL,'type_evt','Dico value delete','VZN_EVT_DICO_DELETE_VALUE',302,'302',NULL),(120,NULL,'type_evt','User add','VZN_EVT_USER_ADD',401,'401',NULL),(121,NULL,'type_evt','User disable','VZN_EVT_USER_DISABLE',402,'402',NULL),(122,NULL,'type_evt','User enable','VZN_EVT_USER_ENABLE',403,'403',NULL),(123,NULL,'type_evt','User delete','VZN_EVT_USER_DELETE',404,'404',NULL),(124,NULL,'resource_type','Text','text',35,'txt',NULL),(125,NULL,'var_type','String','String',1,'string',NULL),(126,NULL,'var_type','Integer','Integer',2,'integer',NULL),(127,NULL,'var_type','Float','Float',3,'float',NULL),(128,NULL,'var_type','Date','Date',4,'date',NULL),(129,NULL,'var_type','Time','Time',5,'time',NULL),(130,NULL,'var_type','Date-time','Date-time',6,'datetime',NULL),(131,NULL,'var_type','Boolean','Boolean',7,'boolean',NULL),(132,NULL,'var_type','Text multiline','Text multiline',8,'text',NULL),(133,NULL,'var_type','Dictionnary','Dictionnary',9,'fkey_dico',NULL),(134,NULL,'dico_format','Raw','Raw',1,'raw',NULL),(135,NULL,'dico_format','Code','Code',2,'code',NULL),(136,NULL,'dico_format','Short label','Short label',3,'short_label',NULL),(137,NULL,'dico_format','Label','Label',4,'label',NULL),(138,NULL,'epimob_data_storage','Local: data is stored on the mobile device (user can send data to the server at anytime).','local',1,'local',NULL),(139,NULL,'epimob_data_storage','Server: when the user saves the form, data is saved directly on the server.','server',2,'server',NULL),(140,NULL,'epimob_gateway','Default','Default',1,'default',NULL),(141,NULL,'epimob_gateway','Twilio','Twilio',2,'twilio',NULL),(142,NULL,'locale','English (US)','US',3,'en_US',NULL);
/*!40000 ALTER TABLE `sys_dico_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_editor`
--

DROP TABLE IF EXISTS `sys_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_editor` (
  `id_sys_editor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sys_project` int(11) NOT NULL,
  `id_editor` varchar(23) NOT NULL,
  `last_action_id` varchar(23) NOT NULL,
  `last_action_date` datetime NOT NULL,
  PRIMARY KEY (`id_sys_editor`),
  KEY `id_sys_editor` (`id_sys_editor`),
  KEY `id_editor` (`id_editor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_editor`
--

LOCK TABLES `sys_editor` WRITE;
/*!40000 ALTER TABLE `sys_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_editor_publication`
--

DROP TABLE IF EXISTS `sys_editor_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_editor_publication` (
  `id_sys_editor_publication` int(11) NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(23) NOT NULL,
  `environment_id` varchar(23) NOT NULL,
  `last_update_timestamp` int(11) NOT NULL,
  `id_sys_editor` int(11) NOT NULL,
  `action_page_uploaded` int(11) NOT NULL,
  `action_page_total` int(11) NOT NULL,
  `action_applied` int(11) NOT NULL,
  `action_total` int(11) NOT NULL,
  `action_file` varchar(255) NOT NULL,
  `backup_path` varchar(255) NOT NULL,
  `sql_dump_size` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_sys_editor_publication`),
  KEY `publication_id` (`environment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_editor_publication`
--

LOCK TABLES `sys_editor_publication` WRITE;
/*!40000 ALTER TABLE `sys_editor_publication` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_editor_publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_project`
--

DROP TABLE IF EXISTS `sys_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_project` (
  `id_sys_project` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `tables_prefix` varchar(4) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `id_style_resource` int(10) unsigned DEFAULT NULL,
  `id_resource` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_sys_project`),
  UNIQUE KEY `sys_project_tables_prefix` (`tables_prefix`),
  UNIQUE KEY `sys_project_name` (`name`),
  KEY `idx_project_resource` (`id_style_resource`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_project`
--

LOCK TABLES `sys_project` WRITE;
/*!40000 ALTER TABLE `sys_project` DISABLE KEYS */;
INSERT INTO `sys_project` VALUES (1,'La maison des sons','lmds','lmds','en',NULL,4);
/*!40000 ALTER TABLE `sys_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_project_user`
--

DROP TABLE IF EXISTS `sys_project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_project_user` (
  `id_sys_project_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sys_user` int(11) NOT NULL,
  `id_sys_project` int(11) NOT NULL,
  `mode` int(11) NOT NULL,
  PRIMARY KEY (`id_sys_project_user`),
  KEY `id_sys_user_sys_project` (`id_sys_user`,`id_sys_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_project_user`
--

LOCK TABLES `sys_project_user` WRITE;
/*!40000 ALTER TABLE `sys_project_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_script`
--

DROP TABLE IF EXISTS `sys_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_script` (
  `id_script` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `actions_exec_time` mediumtext,
  `consumer_report` mediumtext,
  `id_user` int(11) DEFAULT NULL,
  `id_sys_project` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_script`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_script`
--

LOCK TABLES `sys_script` WRITE;
/*!40000 ALTER TABLE `sys_script` DISABLE KEYS */;
INSERT INTO `sys_script` VALUES (1,'2017-07-24 20:09:34','2017-07-24 20:09:34','{\"migration\\/Penser \\u00e0 ajouter les UID manquant et retirer les attributs \'translate\' des variables\":0,\"migration\\/Ajout de la variable description\":0.03,\"migration\\/Ajout des variables code et dico_id\":0.02,\"migration\\/\":0,\"migration\\/Ajout de la colonne dico_id\":0,\"migration\\/Ajouter les variables syst\\u00e8me `sys_creation_date`, `sys_last_mod_date` et `sys_last_mod_user` dans tous les varsets\":0,\"migration\\/Changement du num\\u00e9ro de version\":0}','{\"migration\\/Penser \\u00e0 ajouter les UID manquant et retirer les attributs \'translate\' des variables\":{\"action\":\"Warning\",\"label\":\"Penser \\u00e0 ajouter les UID manquant et retirer les attributs \'translate\' des variables\",\"type\":\"N\\/A\",\"status\":9,\"args\":[]},\"migration\\/Ajout de la variable description\":{\"action\":\"VarsetUpdateDiff\",\"label\":\"Varset \\\"resource\\\" will be updated for 1 projects (0\\/1 varset already up to date)\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"resource\",\"label\":\"Ajout de la variable description\"}},\"migration\\/Ajout des variables code et dico_id\":{\"action\":\"VarsetUpdateDiff\",\"label\":\"Varset \\\"dico\\\" will be updated for 1 projects (0\\/1 varset already up to date)\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"dico\",\"label\":\"Ajout des variables code et dico_id\"}},\"migration\\/\":{\"action\":\"DicoUpdate\",\"label\":\"Dico \\\"listing_action\\\" values will be added\",\"type\":\"Dico\",\"status\":1,\"args\":{\"label\":\"\"}},\"migration\\/Ajout de la colonne dico_id\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"sys_dico_data\\\" will be updated\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"sys_dico_data\",\"label\":\"Ajout de la colonne dico_id\"}},\"migration\\/Ajouter les variables syst\\u00e8me `sys_creation_date`, `sys_last_mod_date` et `sys_last_mod_user` dans tous les varsets\":{\"action\":\"Warning\",\"label\":\"Ajouter les variables syst\\u00e8me `sys_creation_date`, `sys_last_mod_date` et `sys_last_mod_user` dans tous les varsets\",\"type\":\"N\\/A\",\"status\":9,\"args\":[]},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(2,'2017-07-24 20:09:39','2017-07-24 20:09:44','{\"migration\\/Penser \\u00e0 ajouter les UID manquant et retirer les attributs \'translate\' des variables\":0,\"migration\\/Ajout de la variable description\":1.03,\"migration\\/Ajout des variables code et dico_id\":0.99,\"migration\\/\":0.03,\"migration\\/Ajout de la colonne dico_id\":1.66,\"migration\\/Ajouter les variables syst\\u00e8me `sys_creation_date`, `sys_last_mod_date` et `sys_last_mod_user` dans tous les varsets\":0,\"migration\\/Changement du num\\u00e9ro de version\":0.03}','{\"migration\\/Penser \\u00e0 ajouter les UID manquant et retirer les attributs \'translate\' des variables\":{\"action\":\"Warning\",\"label\":\"Penser \\u00e0 ajouter les UID manquant et retirer les attributs \'translate\' des variables\",\"type\":\"N\\/A\",\"status\":9,\"args\":[]},\"migration\\/Ajout de la variable description\":{\"action\":\"VarsetUpdateDiff\",\"label\":\"Varset \\\"resource\\\" was updated\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"resource\",\"label\":\"Ajout de la variable description\"}},\"migration\\/Ajout des variables code et dico_id\":{\"action\":\"VarsetUpdateDiff\",\"label\":\"Varset \\\"dico\\\" was updated\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"dico\",\"label\":\"Ajout des variables code et dico_id\"}},\"migration\\/\":{\"action\":\"DicoUpdate\",\"label\":\"Dico values has been added for dictionary \\\"listing_action\\\"\",\"type\":\"Dico\",\"status\":1,\"args\":{\"dico_name\":{\"0\":\"listing_action\"},\"label\":\"\"}},\"migration\\/Ajout de la colonne dico_id\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"sys_dico_data\\\" has been updated\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"sys_dico_data\",\"label\":\"Ajout de la colonne dico_id\"}},\"migration\\/Ajouter les variables syst\\u00e8me `sys_creation_date`, `sys_last_mod_date` et `sys_last_mod_user` dans tous les varsets\":{\"action\":\"Warning\",\"label\":\"Ajouter les variables syst\\u00e8me `sys_creation_date`, `sys_last_mod_date` et `sys_last_mod_user` dans tous les varsets\",\"type\":\"N\\/A\",\"status\":9,\"args\":[]},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(3,'2017-07-24 20:09:53','2017-07-24 20:09:53','{\"migration\\/\":0,\"migration\\/Changement du num\\u00e9ro de version\":0}','{\"migration\\/\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"{pj}_pj_token\\\" will be updated for each project\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"{pj}_pj_token\",\"label\":\"\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(4,'2017-07-24 20:10:04','2017-07-24 20:10:07','{\"migration\\/\":0.97,\"migration\\/Changement du num\\u00e9ro de version\":0.03}','{\"migration\\/\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"{pj}_pj_token\\\" has been updated in all projects (1\\/1)\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"{pj}_pj_token\",\"label\":\"\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(5,'2017-07-24 20:10:12','2017-07-24 20:10:12','{\"migration\\/Table updates pour autoriser les id_owner \'null\' (SQL : ALTER TABLE `{pj_table}` CHANGE COLUMN `id_owner` `id_owner` INT(10) UNSIGNED NULL;)\":0,\"migration\\/\":0,\"migration\\/Changement du num\\u00e9ro de version\":0}','{\"migration\\/Table updates pour autoriser les id_owner \'null\' (SQL : ALTER TABLE `{pj_table}` CHANGE COLUMN `id_owner` `id_owner` INT(10) UNSIGNED NULL;)\":{\"action\":\"Comment\",\"label\":\"Table updates pour autoriser les id_owner \'null\' (SQL : ALTER TABLE `{pj_table}` CHANGE COLUMN `id_owner` `id_owner` INT(10) UNSIGNED NULL;)\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/\":{\"action\":\"DicoUpdate\",\"label\":\"Dico \\\"type_evt\\\" values will be added\",\"type\":\"Dico\",\"status\":1,\"args\":{\"label\":\"\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(6,'2017-07-24 20:10:17','2017-07-24 20:10:22','{\"migration\\/Table updates pour autoriser les id_owner \'null\' (SQL : ALTER TABLE `{pj_table}` CHANGE COLUMN `id_owner` `id_owner` INT(10) UNSIGNED NULL;)\":0,\"migration\\/\":0.03,\"migration\\/Changement du num\\u00e9ro de version\":0.03}','{\"migration\\/Table updates pour autoriser les id_owner \'null\' (SQL : ALTER TABLE `{pj_table}` CHANGE COLUMN `id_owner` `id_owner` INT(10) UNSIGNED NULL;)\":{\"action\":\"Comment\",\"label\":\"Table updates pour autoriser les id_owner \'null\' (SQL : ALTER TABLE `{pj_table}` CHANGE COLUMN `id_owner` `id_owner` INT(10) UNSIGNED NULL;)\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/\":{\"action\":\"DicoUpdate\",\"label\":\"Dico values has been added for dictionary \\\"type_evt\\\"\",\"type\":\"Dico\",\"status\":1,\"args\":{\"dico_name\":{\"0\":\"type_evt\"},\"label\":\"\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(7,'2017-07-24 20:10:28','2017-07-24 20:10:28','{\"migration\\/Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.18 \\u00e0 la version 2.19\":0,\"migration\\/Changement du num\\u00e9ro de version\":0.02}','{\"migration\\/Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.18 \\u00e0 la version 2.19\":{\"action\":\"Comment\",\"label\":\"Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.18 \\u00e0 la version 2.19\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(8,'2017-07-24 20:10:31','2017-07-24 20:10:32','{\"migration\\/Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.18 \\u00e0 la version 2.19\":0,\"migration\\/Changement du num\\u00e9ro de version\":0.07}','{\"migration\\/Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.18 \\u00e0 la version 2.19\":{\"action\":\"Comment\",\"label\":\"Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.18 \\u00e0 la version 2.19\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(9,'2017-07-24 20:10:36','2017-07-24 20:10:36','{\"migration\\/\":0,\"migration\\/Changement du num\\u00e9ro de version\":0}','{\"migration\\/\":{\"action\":\"DicoUpdate\",\"label\":\"Dico \\\"resource_type\\\" values will be added\",\"type\":\"Dico\",\"status\":1,\"args\":{\"label\":\"\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(10,'2017-07-24 20:10:39','2017-07-24 20:10:40','{\"migration\\/\":0.03,\"migration\\/Changement du num\\u00e9ro de version\":0.03}','{\"migration\\/\":{\"action\":\"DicoUpdate\",\"label\":\"Dico values has been added for dictionary \\\"resource_type\\\"\",\"type\":\"Dico\",\"status\":1,\"args\":{\"dico_name\":{\"0\":\"resource_type\"},\"label\":\"\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(11,'2017-07-24 20:10:45','2017-07-24 20:10:45','{\"migration\\/Ajout de l\'attribut \'varset\'\":0.04,\"migration\\/Changement du max\":0.03,\"migration\\/Ajout de mandatory true\":0.01,\"migration\\/Ajout du sysdico var_type\":0,\"migration\\/Documentation : https:\\/\\/docs.google.com\\/a\\/epiconcept.fr\\/document\\/d\\/1QRfyPLzUvd5Kr3aeQ8S7A0-6E1Vbq3noJHHsA1LyMCc\\/edit?usp=sharing\":0,\"migration\\/Changement du num\\u00e9ro de version\":0}','{\"migration\\/Ajout de l\'attribut \'varset\'\":{\"action\":\"VarsetUpdateDiff\",\"label\":\"Varset \\\"query\\\" will be updated for 1 projects (0\\/1 varset already up to date)\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"query\",\"label\":\"Ajout de l\'attribut \'varset\'\"}},\"migration\\/Changement du max\":{\"action\":\"VarsetVarUpdate\",\"label\":\"Variable \\\"type_request\\\" of varset \\\"query\\\" will be modified\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"query\",\"label\":\"Changement du max\"}},\"migration\\/Ajout de mandatory true\":{\"action\":\"VarsetVarUpdate\",\"label\":\"Variable \\\"request\\\" of varset \\\"query\\\" will be modified\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"query\",\"label\":\"Ajout de mandatory true\"}},\"migration\\/Ajout du sysdico var_type\":{\"action\":\"DicoUpdate\",\"label\":\"Dico \\\"var_type\\\" values will be added\",\"type\":\"Dico\",\"status\":1,\"args\":{\"label\":\"Ajout du sysdico var_type\"}},\"migration\\/Documentation : https:\\/\\/docs.google.com\\/a\\/epiconcept.fr\\/document\\/d\\/1QRfyPLzUvd5Kr3aeQ8S7A0-6E1Vbq3noJHHsA1LyMCc\\/edit?usp=sharing\":{\"action\":\"Comment\",\"label\":\"Documentation : https:\\/\\/docs.google.com\\/a\\/epiconcept.fr\\/document\\/d\\/1QRfyPLzUvd5Kr3aeQ8S7A0-6E1Vbq3noJHHsA1LyMCc\\/edit?usp=sharing\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(12,'2017-07-24 20:10:48','2017-07-24 20:10:55','{\"migration\\/Ajout de l\'attribut \'varset\'\":6.03,\"migration\\/Changement du max\":0.11,\"migration\\/Ajout de mandatory true\":0.11,\"migration\\/Ajout du sysdico var_type\":0.03,\"migration\\/Documentation : https:\\/\\/docs.google.com\\/a\\/epiconcept.fr\\/document\\/d\\/1QRfyPLzUvd5Kr3aeQ8S7A0-6E1Vbq3noJHHsA1LyMCc\\/edit?usp=sharing\":0,\"migration\\/Changement du num\\u00e9ro de version\":0.03}','{\"migration\\/Ajout de l\'attribut \'varset\'\":{\"action\":\"VarsetUpdateDiff\",\"label\":\"Varset \\\"query\\\" was updated\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"query\",\"label\":\"Ajout de l\'attribut \'varset\'\"}},\"migration\\/Changement du max\":{\"action\":\"VarsetVarUpdate\",\"label\":\"Variable \\\"type_request\\\" of varset \\\"query\\\" was updated\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"query\",\"label\":\"Changement du max\"}},\"migration\\/Ajout de mandatory true\":{\"action\":\"VarsetVarUpdate\",\"label\":\"Variable \\\"request\\\" of varset \\\"query\\\" was updated\",\"type\":\"Varset\",\"status\":1,\"args\":{\"varset_name\":\"query\",\"label\":\"Ajout de mandatory true\"}},\"migration\\/Ajout du sysdico var_type\":{\"action\":\"DicoUpdate\",\"label\":\"Dico values has been added for dictionary \\\"var_type\\\"\",\"type\":\"Dico\",\"status\":1,\"args\":{\"dico_name\":{\"0\":\"var_type\"},\"label\":\"Ajout du sysdico var_type\"}},\"migration\\/Documentation : https:\\/\\/docs.google.com\\/a\\/epiconcept.fr\\/document\\/d\\/1QRfyPLzUvd5Kr3aeQ8S7A0-6E1Vbq3noJHHsA1LyMCc\\/edit?usp=sharing\":{\"action\":\"Comment\",\"label\":\"Documentation : https:\\/\\/docs.google.com\\/a\\/epiconcept.fr\\/document\\/d\\/1QRfyPLzUvd5Kr3aeQ8S7A0-6E1Vbq3noJHHsA1LyMCc\\/edit?usp=sharing\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(13,'2017-07-24 20:11:10','2017-07-24 20:11:11','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":0,\"migration\\/Ajout du dico_format\":0.02,\"migration\\/Changement du num\\u00e9ro de version\":0.01}','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":{\"action\":\"Comment\",\"label\":\"Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Ajout du dico_format\":{\"action\":\"DicoUpdate\",\"label\":\"Dico \\\"dico_format\\\" values will be added\",\"type\":\"Dico\",\"status\":1,\"args\":{\"label\":\"Ajout du dico_format\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(14,'2017-07-24 20:11:14','2017-07-24 20:11:14','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":0,\"migration\\/Ajout du dico_format\":0.05,\"migration\\/Changement du num\\u00e9ro de version\":0.05}','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":{\"action\":\"Comment\",\"label\":\"Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Ajout du dico_format\":{\"action\":\"DicoUpdate\",\"label\":\"Dico values has been added for dictionary \\\"dico_format\\\"\",\"type\":\"Dico\",\"status\":1,\"args\":{\"dico_name\":{\"0\":\"dico_format\"},\"label\":\"Ajout du dico_format\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(15,'2017-07-24 20:11:20','2017-07-24 20:11:20','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":0,\"migration\\/Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.22 \\u00e0 la version 2.23\":0,\"migration\\/Changement du num\\u00e9ro de version\":0.03}','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":{\"action\":\"Comment\",\"label\":\"Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.22 \\u00e0 la version 2.23\":{\"action\":\"Comment\",\"label\":\"Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.22 \\u00e0 la version 2.23\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(16,'2017-07-24 20:11:23','2017-07-24 20:11:24','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":0,\"migration\\/Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.22 \\u00e0 la version 2.23\":0,\"migration\\/Changement du num\\u00e9ro de version\":0.06}','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":{\"action\":\"Comment\",\"label\":\"Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.22 \\u00e0 la version 2.23\":{\"action\":\"Comment\",\"label\":\"Aucune modification de la base n\'est n\\u00e9cessaire pour passer de la version 2.22 \\u00e0 la version 2.23\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(17,'2017-07-24 20:11:28','2017-07-24 20:11:28','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":0,\"migration\\/Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_data_storage\":0.02,\"migration\\/\":0.01,\"migration\\/Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_gateway\":0.02,\"migration\\/Contr\\u00f4ler que le code \'en_US\' du dictionnaire syst\\u00e8me \'locale\' n\'est pas en double apr\\u00e8s l\'ex\\u00e9cution\":0,\"migration\\/Mise \\u00e0 jour du dictionnaire syst\\u00e8me \'locale\'\":0,\"migration\\/Ajout d\'indexs sur le varset varsetmonitor pour am\\u00e9liorer les performances\":0,\"migration\\/Passage de context \\u00e0 la taille TEXT\":0,\"migration\\/Changement du num\\u00e9ro de version\":0}','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":{\"action\":\"Comment\",\"label\":\"Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_data_storage\":{\"action\":\"DicoUpdate\",\"label\":\"Dico \\\"epimob_data_storage\\\" values will be added\",\"type\":\"Dico\",\"status\":1,\"args\":{\"label\":\"Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_data_storage\"}},\"migration\\/\":{\"action\":\"TableCreate\",\"label\":\"Table \\\"session\\\" must be created\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"session\",\"label\":\"\"}},\"migration\\/Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_gateway\":{\"action\":\"DicoUpdate\",\"label\":\"Dico \\\"epimob_gateway\\\" values will be added\",\"type\":\"Dico\",\"status\":1,\"args\":{\"label\":\"Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_gateway\"}},\"migration\\/Contr\\u00f4ler que le code \'en_US\' du dictionnaire syst\\u00e8me \'locale\' n\'est pas en double apr\\u00e8s l\'ex\\u00e9cution\":{\"action\":\"Comment\",\"label\":\"Contr\\u00f4ler que le code \'en_US\' du dictionnaire syst\\u00e8me \'locale\' n\'est pas en double apr\\u00e8s l\'ex\\u00e9cution\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Mise \\u00e0 jour du dictionnaire syst\\u00e8me \'locale\'\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"sys_dico_data\\\" will be updated\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"sys_dico_data\",\"label\":\"Mise \\u00e0 jour du dictionnaire syst\\u00e8me \'locale\'\"}},\"migration\\/Ajout d\'indexs sur le varset varsetmonitor pour am\\u00e9liorer les performances\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"{pj}_varsetmonitor_data\\\" will be updated for each project\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"{pj}_varsetmonitor_data\",\"label\":\"Ajout d\'indexs sur le varset varsetmonitor pour am\\u00e9liorer les performances\"}},\"migration\\/Passage de context \\u00e0 la taille TEXT\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"{pj}_pj_token\\\" will be updated for each project\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"{pj}_pj_token\",\"label\":\"Passage de context \\u00e0 la taille TEXT\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number will be updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL),(18,'2017-07-24 20:11:32','2017-07-24 20:11:34','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":0,\"migration\\/Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_data_storage\":0.05,\"migration\\/\":0.26,\"migration\\/Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_gateway\":0.03,\"migration\\/Contr\\u00f4ler que le code \'en_US\' du dictionnaire syst\\u00e8me \'locale\' n\'est pas en double apr\\u00e8s l\'ex\\u00e9cution\":0,\"migration\\/Mise \\u00e0 jour du dictionnaire syst\\u00e8me \'locale\'\":0.08,\"migration\\/Ajout d\'indexs sur le varset varsetmonitor pour am\\u00e9liorer les performances\":0.21,\"migration\\/Passage de context \\u00e0 la taille TEXT\":0.57,\"migration\\/Changement du num\\u00e9ro de version\":0.03}','{\"migration\\/Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\":{\"action\":\"Comment\",\"label\":\"Documentation : http:\\/\\/doc.charenton.tld\\/infradoc\\/doku.php?id=module_de_migration_voo4\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_data_storage\":{\"action\":\"DicoUpdate\",\"label\":\"Dico values has been added for dictionary \\\"epimob_data_storage\\\"\",\"type\":\"Dico\",\"status\":1,\"args\":{\"dico_name\":{\"0\":\"epimob_data_storage\"},\"label\":\"Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_data_storage\"}},\"migration\\/\":{\"action\":\"TableCreate\",\"label\":\"Table \\\"session\\\" was created\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"session\",\"label\":\"\"}},\"migration\\/Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_gateway\":{\"action\":\"DicoUpdate\",\"label\":\"Dico values has been added for dictionary \\\"epimob_gateway\\\"\",\"type\":\"Dico\",\"status\":1,\"args\":{\"dico_name\":{\"0\":\"epimob_gateway\"},\"label\":\"Cr\\u00e9ation du dictionnaire syst\\u00e8me epimob_gateway\"}},\"migration\\/Contr\\u00f4ler que le code \'en_US\' du dictionnaire syst\\u00e8me \'locale\' n\'est pas en double apr\\u00e8s l\'ex\\u00e9cution\":{\"action\":\"Comment\",\"label\":\"Contr\\u00f4ler que le code \'en_US\' du dictionnaire syst\\u00e8me \'locale\' n\'est pas en double apr\\u00e8s l\'ex\\u00e9cution\",\"type\":\"N\\/A\",\"status\":1,\"args\":[]},\"migration\\/Mise \\u00e0 jour du dictionnaire syst\\u00e8me \'locale\'\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"sys_dico_data\\\" has been updated\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"sys_dico_data\",\"label\":\"Mise \\u00e0 jour du dictionnaire syst\\u00e8me \'locale\'\"}},\"migration\\/Ajout d\'indexs sur le varset varsetmonitor pour am\\u00e9liorer les performances\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"{pj}_varsetmonitor_data\\\" has been updated in all projects (1\\/1)\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"{pj}_varsetmonitor_data\",\"label\":\"Ajout d\'indexs sur le varset varsetmonitor pour am\\u00e9liorer les performances\"}},\"migration\\/Passage de context \\u00e0 la taille TEXT\":{\"action\":\"TableUpdate\",\"label\":\"Table \\\"{pj}_pj_token\\\" has been updated in all projects (1\\/1)\",\"type\":\"Table\",\"status\":1,\"args\":{\"table_name\":\"{pj}_pj_token\",\"label\":\"Passage de context \\u00e0 la taille TEXT\"}},\"migration\\/Changement du num\\u00e9ro de version\":{\"action\":\"VersionUpdate\",\"label\":\"The version number was updated in the sys_context table\",\"type\":\"Auto\",\"status\":1,\"args\":[]}}',NULL,NULL);
/*!40000 ALTER TABLE `sys_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_script_error`
--

DROP TABLE IF EXISTS `sys_script_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_script_error` (
  `id_script_error` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_script` int(10) unsigned NOT NULL,
  `message` mediumtext NOT NULL,
  `trace` longtext,
  PRIMARY KEY (`id_script_error`),
  KEY `id_script` (`id_script`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_script_error`
--

LOCK TABLES `sys_script_error` WRITE;
/*!40000 ALTER TABLE `sys_script_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_script_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id_sys_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `password` varchar(81) NOT NULL,
  `expire_date` date DEFAULT NULL,
  `cps_id` varchar(30) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `project_creator` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id_sys_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-24 20:12:52
