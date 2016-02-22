CREATE DATABASE  IF NOT EXISTS `hethi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hethi`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: hethi
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `uichethiservices`
--

DROP TABLE IF EXISTS `uichethiservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uichethiservices` (
  `hethi_service_id` char(10) NOT NULL COMMENT 'chethi_services.hethi_service_id\\\\n',
  `hethiservices_decription_short` varchar(45) DEFAULT NULL,
  `hethiservices_decription_long` varchar(250) DEFAULT NULL,
  `hethiservices_image_id` varchar(250) DEFAULT NULL COMMENT 'ui_images.image_id\\n',
  `hethiservices_status` char(6) DEFAULT NULL,
  PRIMARY KEY (`hethi_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uichethiservices`
--

LOCK TABLES `uichethiservices` WRITE;
/*!40000 ALTER TABLE `uichethiservices` DISABLE KEYS */;
INSERT INTO `uichethiservices` VALUES ('ch100101','Data as a service','DaaS','1','1'),('ch100102','Business as a service','BaaS','2','1'),('ch100103','output as a service','OaaS','3','1'),('ch100104','integration as a service','IaaS','4','1'),('ch100105','analyse as a service','AaaS','5','1'),('ch100106','storage as a service','StaaS','101','1');
/*!40000 ALTER TABLE `uichethiservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_volumeaspect`
--

DROP TABLE IF EXISTS `dcustomer_volumeaspect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_volumeaspect` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `daily_volume` int(11) NOT NULL,
  `weekly_volume` int(11) NOT NULL,
  `monthly_volume` int(11) NOT NULL,
  `high_volume_day_sunday` int(11) NOT NULL COMMENT 'change structuren based on significance',
  `high_volume_day_monday` int(11) DEFAULT NULL,
  `high_volume_day_tuesday` int(11) DEFAULT NULL,
  `high_volume_day_wednesday` int(11) DEFAULT NULL,
  `high_volume_day_thursday` int(11) DEFAULT NULL,
  `high_volume_day_friday` int(11) DEFAULT NULL,
  `high_volume_day_saturday` int(11) DEFAULT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trial',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time',
  PRIMARY KEY (`customer_id`,`tfs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_volumeaspect`
--

LOCK TABLES `dcustomer_volumeaspect` WRITE;
/*!40000 ALTER TABLE `dcustomer_volumeaspect` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomer_volumeaspect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification`
--

DROP TABLE IF EXISTS `classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification` (
  `Classification_ID` char(18) NOT NULL,
  `Classifcation__Name` char(18) DEFAULT NULL,
  `Classification_Description` char(18) DEFAULT NULL,
  `eFs_Field_Id` char(18) NOT NULL DEFAULT '',
  `eFS_ID` char(18) NOT NULL,
  `Input_Source_Id` char(18) NOT NULL,
  PRIMARY KEY (`Classification_ID`,`eFs_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  UNIQUE KEY `XPKClassify` (`Classification_ID`,`eFs_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  KEY `R_33` (`eFs_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  CONSTRAINT `R_33` FOREIGN KEY (`eFs_Field_Id`, `eFS_ID`, `Input_Source_Id`) REFERENCES `efs_field` (`eFS_Field_Id`, `eFS_ID`, `Input_Source_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification`
--

LOCK TABLES `classification` WRITE;
/*!40000 ALTER TABLE `classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_deliveryaspect`
--

DROP TABLE IF EXISTS `dcustomer_deliveryaspect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_deliveryaspect` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `max_shipment_file_size` int(11) NOT NULL,
  `max_shipment_file_record_nos` int(11) NOT NULL,
  `min_shipment_record_size_nos` int(11) NOT NULL,
  `max_shipment_image_size` int(11) NOT NULL COMMENT 'user ID audit trial',
  `max_shipment_image_record_nos` int(11) NOT NULL COMMENT 'auto fill server date and time zone',
  `customer_shipment_cutoff` int(11) NOT NULL COMMENT 'significance?',
  `shipment_freq` int(11) NOT NULL,
  `shipment_start_time` datetime NOT NULL,
  `shipment_end_time` datetime NOT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'User ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'autofill serverd date and time',
  PRIMARY KEY (`customer_id`,`tfs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_deliveryaspect`
--

LOCK TABLES `dcustomer_deliveryaspect` WRITE;
/*!40000 ALTER TABLE `dcustomer_deliveryaspect` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomer_deliveryaspect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hethi_offers`
--

DROP TABLE IF EXISTS `hethi_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hethi_offers` (
  `offer_id` int(11) NOT NULL,
  `offer_name` varchar(100) DEFAULT NULL,
  `user_id` varchar(100) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hethi_offers`
--

LOCK TABLES `hethi_offers` WRITE;
/*!40000 ALTER TABLE `hethi_offers` DISABLE KEYS */;
INSERT INTO `hethi_offers` VALUES (5,'five five','1','2016-01-25 13:30:02'),(6,'NEW','1','2016-01-25 14:01:16'),(7,'dasds','1','2016-01-25 14:12:20'),(8,'network','1','2016-01-25 15:25:18'),(9,'program','1','2016-01-25 15:28:05'),(10,'qeqeet','1','2016-01-25 15:56:16'),(11,'company offer','1','2016-01-25 17:05:35'),(12,'android','1','2016-01-25 18:00:14'),(13,'new offer','1','2016-01-25 18:15:54'),(14,'special offer','1','2016-01-25 18:19:38');
/*!40000 ALTER TABLE `hethi_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccore_serviceplays`
--

DROP TABLE IF EXISTS `ccore_serviceplays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccore_serviceplays` (
  `serviceplay_id` varchar(10) NOT NULL,
  `hethi_service_id` varchar(8) DEFAULT NULL,
  `hethi_subservicecode` varchar(100) DEFAULT NULL,
  `lastupuser` varchar(25) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`serviceplay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccore_serviceplays`
--

LOCK TABLES `ccore_serviceplays` WRITE;
/*!40000 ALTER TABLE `ccore_serviceplays` DISABLE KEYS */;
INSERT INTO `ccore_serviceplays` VALUES ('csp10000','ch100105','exit_channel','1','2015-10-15 00:00:00'),('csp100101','ch100101','daas.inventory','1','2015-10-15 00:00:00'),('csp100102','ch100101','daas.fullextract','1','2015-10-15 00:00:00'),('csp100103','ch100101','daas.classify','1','2015-10-15 00:00:00'),('csp100104','ch100101','daas.index','1','2015-10-15 00:00:00'),('csp100105','ch100101','daas.split_merge','1','2015-10-16 00:00:00'),('csp100106','ch100101','daas.extract','1','2015-10-17 00:00:00'),('csp100107','ch100101','daas.batch','1','2015-10-18 00:00:00'),('csp100108','ch100101','daas.keywise','1','2015-10-19 00:00:00'),('csp100109','ch100101','daas.baashandoff','1','2015-10-20 00:00:00'),('csp100120','ch100102','baas.workflow','1','2015-10-21 00:00:00'),('csp100121','ch100102','baas.reject','1','2015-10-22 00:00:00'),('csp100140','ch100103','oaas.output','1','2015-10-23 00:00:00'),('csp100141','ch100103','oaas.shipment','1','2015-10-24 00:00:00'),('csp100142','ch100103','oaas.rejects','1','2015-10-25 00:00:00'),('csp100143','ch100103','oaas.hml','1','2015-10-26 00:00:00'),('csp100144','ch100103','oaas.ansi','1','2015-10-27 00:00:00'),('csp100145','ch100103','oaas.edifact','1','2015-10-28 00:00:00'),('csp100146','ch100103','oaas.delimited','1','2015-10-29 00:00:00'),('csp100147','ch100103','oaas.prop','1','2015-10-30 00:00:00'),('csp100160','ch100104','iaas.sap','1','2015-10-31 00:00:00'),('csp100161','ch100104','iaas.lawson','1','2015-11-01 00:00:00'),('csp100162','ch100104','iaas.oracle_fusion','1','2015-11-02 00:00:00'),('csp100163','ch100104','iaas.baan','1','2015-11-03 00:00:00'),('csp100180','ch100106','StaaS.MetaData','1','2015-11-04 00:00:00'),('csp100181','ch100106','StaaS.Image','1','2015-11-05 00:00:00'),('csp100200','ch100105','AaaS. Summary Report','1','2015-11-06 00:00:00'),('csp100201','ch100105','AaaS. Reconciliation Report','1','2015-11-07 00:00:00'),('csp100202','ch100105','AaaS. Shipment Report','1','2015-11-08 00:00:00'),('csp100203','ch100105','AaaS. Detailed Shipment Report','1','2015-11-09 00:00:00'),('csp100204','ch100105','AaaS. Email Report','1','2015-11-10 00:00:00'),('csp100205','ch100105','AaaS. Fax Report','1','2015-11-11 00:00:00'),('csp100206','ch100105','AaaS. Billing Report','1','2015-11-12 00:00:00'),('csp100207','ch100105','AaaS. PO Match Rate Report','1','2015-11-13 00:00:00'),('csp100208','ch100105','AaaS. EDI Report','1','2015-11-14 00:00:00'),('csp100209','ch100105','AaaS.orkflow Reports','1','2015-11-15 00:00:00'),('csp100210','ch100105','AaaS. Activity Aging Report','1','2015-11-16 00:00:00'),('csp100211','ch100105','AaaS. Exception Report','1','2015-11-17 00:00:00'),('csp100212','ch100105','AaaS. Performance Report','1','2015-11-18 00:00:00'),('csp100213','ch100105','AaaS. Work Item Detail Report','1','2015-11-19 00:00:00'),('csp100214','ch100105','AaaS. Workflow Work In Progress (WIP) Report','1','2015-11-20 00:00:00'),('csp100215','ch100105','AaaS. Audit Trail Report','1','2015-11-21 00:00:00'),('csp100216','ch100105','AaaS. Productivity Report','1','2015-11-22 00:00:00'),('csp100217','ch100105','AaaS. Inventory Report','1','2015-11-23 00:00:00'),('csp100218','ch100105','AaaS. Absentee Delegation Report','1','2015-11-24 00:00:00'),('csp100219','ch100105','AaaS. Re-Assign Report','1','2015-11-25 00:00:00'),('csp100220','ch100105','AaaS. Re-Route Report','1','2015-11-26 00:00:00'),('csp100221','ch100105','AaaS.AbsenteeDelegationReport','1','2015-11-27 00:00:00');
/*!40000 ALTER TABLE `ccore_serviceplays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cruleworkset`
--

DROP TABLE IF EXISTS `cruleworkset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cruleworkset` (
  `workset_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with ws, 100101. example : ws100101',
  `workset_name` varchar(255) NOT NULL,
  `workset_desc` varchar(255) DEFAULT NULL,
  `lastupuser` char(20) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `crulespackage_id` char(10) DEFAULT NULL,
  `workset_order` int(11) DEFAULT NULL,
  `effective_startdate` date DEFAULT NULL,
  `effective_enddate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`workset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cruleworkset`
--

LOCK TABLES `cruleworkset` WRITE;
/*!40000 ALTER TABLE `cruleworkset` DISABLE KEYS */;
INSERT INTO `cruleworkset` VALUES ('ws1001','DaaSclassifyValidation','import ipost description','1','2016-01-15 17:21:31','pk1001',1,NULL,NULL),('ws1003','DaaSclassifyValidation1','Custom rule DaaSclassifyValidation1','1','2016-01-15 17:21:31','pk1001',3,NULL,NULL),('ws1004','DAAS','Custom rule ','1','2016-01-16 12:32:06','pk1001',2,'2015-10-10','2016-10-10');
/*!40000 ALTER TABLE `cruleworkset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cform_lob`
--

DROP TABLE IF EXISTS `cform_lob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cform_lob` (
  `efslob_id` varchar(8) NOT NULL,
  `form_bclass` varchar(5) DEFAULT NULL,
  `form_bsource` varchar(5) DEFAULT NULL,
  `form_type` varchar(45) DEFAULT NULL,
  `form_stencid` varchar(255) DEFAULT NULL,
  `form_ownerid` varchar(10) DEFAULT NULL,
  `lastupuser` varchar(25) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`efslob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cform_lob`
--

LOCK TABLES `cform_lob` WRITE;
/*!40000 ALTER TABLE `cform_lob` DISABLE KEYS */;
INSERT INTO `cform_lob` VALUES ('cf100101','PROP','FRM','PO-Inventory','HAA000010','HAA00001','Root','2015-10-15 00:00:00'),('cf100102','PROP','FRM','PO-Expense','HAA000011','HAA00001','Root','2015-10-15 00:00:00'),('cf100103','PROP','FRM','NPO','HAA000012','HAA00001','Root','2015-10-15 00:00:00'),('cf100104','PROP','FRM','NPO-Travel & Expenses','HAA000013','HAA00001','Root','2015-10-15 00:00:00'),('cf100105','PROP','FRM','NPO-Claim & Reimbursements','HAA000014','HAA00001','Root','2015-10-15 00:00:00'),('cf100106','PROP','FRM','NPO-Utility Bills','HAA000015','HAA00001','Root','2015-10-15 00:00:00'),('cf100107','PROP','FRM','NPO-Check Request','HAA000016','HAA00001','Root','2015-10-15 00:00:00'),('cf100108','PROP','FRM','Attachments','HAA000017','HAA00001','Root','2015-10-15 00:00:00'),('cf100109','IND','EDI','ANSI-810','HAA000018','HAA00001','Root','2015-10-15 00:00:00'),('cf100110','IND','FRM','HCFA/HICF-Single','HAA000019','HAA00001','Root','2015-10-15 11:03:33'),('cf100111','IND','FRM','HCFA/HICF-Multi','HAA000020','HAA00001','Root','2015-10-15 11:03:33'),('cf100112','IND','FRM','UB/UB04-Single','HAA000021','HAA00001','Root','2015-10-15 11:03:33'),('cf100113','IND','FRM','UB/UB04-Multi','HAA000022','HAA00001','Root','2015-10-15 11:03:33'),('cf100114','IND','FRM','Superbills-NonStandard Professional Bills','HAA000023','HAA00001','Root','2015-10-15 11:03:33'),('cf100115','IND','FRM','Superbills-NonStandard Facility Bills','HAA000024','HAA00001','Root','2015-10-15 11:03:33'),('cf100116','IND','FRM','DENTAL','HAA000025','HAA00001','Root','2015-10-15 11:03:33'),('cf100117','IND','FRM','VISION','HAA000026','HAA00001','Root','2015-10-15 00:00:00'),('cf100118','IND','FRM','EOMB','HAA000027','HAA00001','Root','2015-10-15 00:00:00'),('cf100119','IND','FRM','EOB','HAA000028','HAA00001','Root','2015-10-15 00:00:00'),('cf100120','IND','FRM','REP','HAA000029','HAA00001','Root','2015-10-15 00:00:00'),('cf100121','IND','FRM','RX','HAA000030','HAA00001','Root','2015-10-15 00:00:00'),('cf100122','IND','FRM','OI','HAA000031','HAA00001','Root','2015-10-15 00:00:00'),('cf100123','IND','FRM','Attachments','HAA000032','HAA00001','Root','2015-10-15 00:00:00'),('cf100124','IND','EDI','ANSI-837','HAA000033','HAA00001','Root','2015-10-15 00:00:00'),('cf100125','IND','EDI','ANSI-835','HAA000034','HAA00001','Root','2015-10-15 00:00:00');
/*!40000 ALTER TABLE `cform_lob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccore_enroll_offering`
--

DROP TABLE IF EXISTS `ccore_enroll_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccore_enroll_offering` (
  `core_id` char(6) NOT NULL,
  `core_service` varchar(20) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`core_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccore_enroll_offering`
--

LOCK TABLES `ccore_enroll_offering` WRITE;
/*!40000 ALTER TABLE `ccore_enroll_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccore_enroll_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `businessrules_exception`
--

DROP TABLE IF EXISTS `businessrules_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businessrules_exception` (
  `exception_code` varchar(20) NOT NULL,
  `efs_uin` varchar(10) NOT NULL,
  `exception_name` varchar(100) DEFAULT NULL,
  `exception_log` varchar(250) DEFAULT NULL,
  `exception_queue` varchar(100) DEFAULT NULL,
  `exception_priority` int(11) DEFAULT NULL,
  `action_by_user` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`exception_code`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businessrules_exception`
--

LOCK TABLES `businessrules_exception` WRITE;
/*!40000 ALTER TABLE `businessrules_exception` DISABLE KEYS */;
INSERT INTO `businessrules_exception` VALUES ('EOOO1','cefs100101','No Exception',' Route to Lawson and Storage Repository','Route to Lawson and Storage Repository',1,'No action is needed.'),('EOOO1','cefs100103','No Exception','Route to WF andStorage Repository','Route to Reviewer Approver',1,' Needs to be coded and approved.'),('EOOO4','cefs100101','INVOICE TOTAL=0','Invoice comes in with $0, do not send to WF.  ','Route to Storage Repository',4,NULL),('EOOO4','cefs100103','INVOICE TOTAL=0','Invoice comes in with $0, do not send to WF.  ','Route to Storage Repository',4,NULL),('EOOO5','cefs100101','MISSING INFORMATION','If  any of the following mandatory fields are missing information from the invoice image:','Route to AP Analyst ',5,'Follow the same logic and routing as \"Image Illegible\"'),('EOOO5','cefs100103','MISSING INFORMATION','If  any of the following mandatory fields are missing information from the invoice image: Account # for Utility, Tax and Telecom Vendors','Route to AP Analyst ',5,'Follow the same logic and routing as \"Image Illegible\"');
/*!40000 ALTER TABLE `businessrules_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cjob`
--

DROP TABLE IF EXISTS `cjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cjob` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(30) NOT NULL COMMENT 'new, unzip, indextoassignartist, indextoformtype\\n',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cjob`
--

LOCK TABLES `cjob` WRITE;
/*!40000 ALTER TABLE `cjob` DISABLE KEYS */;
INSERT INTO `cjob` VALUES (1,'Admin Jobs','1','2015-11-14 12:23:45'),(2,'Artist Jobs','1','2015-11-14 12:23:45'),(3,'Customer Jobs','1','2015-11-14 12:23:45'),(4,'Manager Jobs','1','2015-11-14 12:23:45'),(5,'Supervisor Jobs','1','2015-11-14 12:23:45'),(6,'Operator Jobs','1','2015-11-14 12:23:45');
/*!40000 ALTER TABLE `cjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tefs_input_inventory`
--

DROP TABLE IF EXISTS `tefs_input_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tefs_input_inventory` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer',
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `transport_id` char(6) NOT NULL COMMENT 'cTransport.transport_id',
  `batch_id` varchar(255) NOT NULL COMMENT 'unique batch id for that customer',
  `source_file_path` varchar(255) NOT NULL COMMENT 'physical file location where source file is stored',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `receivedtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `processedtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`transport_id`,`tfs_uin`,`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tefs_input_inventory`
--

LOCK TABLES `tefs_input_inventory` WRITE;
/*!40000 ALTER TABLE `tefs_input_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tefs_input_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomerlookup`
--

DROP TABLE IF EXISTS `dcustomerlookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomerlookup` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer',
  `efslob_id` char(6) NOT NULL COMMENT 'cflob.efslob_id',
  `lookup_id` char(6) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `lookup_xml` text NOT NULL COMMENT 'transport source attributes',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`efslob_id`,`lookup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomerlookup`
--

LOCK TABLES `dcustomerlookup` WRITE;
/*!40000 ALTER TABLE `dcustomerlookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomerlookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_connect`
--

DROP TABLE IF EXISTS `workflow_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_connect` (
  `Workflow_Queue_ID` char(18) NOT NULL,
  `Workflow_Next_Queue` char(18) DEFAULT NULL,
  `Customer_Id` char(18) NOT NULL,
  `Role_ID` char(18) NOT NULL,
  PRIMARY KEY (`Workflow_Queue_ID`,`Customer_Id`,`Role_ID`),
  UNIQUE KEY `XPKWorkflow_detail` (`Workflow_Queue_ID`,`Customer_Id`,`Role_ID`),
  KEY `R_18` (`Customer_Id`),
  KEY `R_25` (`Role_ID`),
  CONSTRAINT `R_15` FOREIGN KEY (`Workflow_Queue_ID`) REFERENCES `worflow` (`Workflow_Queue_ID`),
  CONSTRAINT `R_17` FOREIGN KEY (`Workflow_Queue_ID`) REFERENCES `worflow` (`Workflow_Queue_ID`),
  CONSTRAINT `R_18` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Customer_Id`),
  CONSTRAINT `R_25` FOREIGN KEY (`Role_ID`) REFERENCES `roles` (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_connect`
--

LOCK TABLES `workflow_connect` WRITE;
/*!40000 ALTER TABLE `workflow_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crules`
--

DROP TABLE IF EXISTS `crules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crules` (
  `rule_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with rl, 100101. example : rl100101',
  `rule_name` varchar(255) NOT NULL,
  `rule_desc` varchar(255) DEFAULT NULL,
  `rule_type` char(6) DEFAULT NULL COMMENT 'SOP, CUST etc',
  `lastupuser` char(20) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crules`
--

LOCK TABLES `crules` WRITE;
/*!40000 ALTER TABLE `crules` DISABLE KEYS */;
INSERT INTO `crules` VALUES ('rl1001','ValidationSuccess','TestRuleFor Demo','SOP','Root','2015-11-03 11:56:31'),('rl1002','ValidationFailiure','TestRuleFor Demo','SOP','Root','2015-11-04 15:04:06'),('rl1003','ValidationFailiure1','Custom rule ValidationFailiure1','CUST','1','2015-11-26 15:45:11'),('rl1004','form_validation','form_validation','CUST','1','2015-11-26 15:45:11'),('rl1005','','Custom rule ','CUST','1','2015-12-16 14:18:43'),('rl1006','','Custom rule ','CUST','1','2016-01-10 13:14:20'),('rl1007','','Custom rule ','CUST','1','2016-01-10 13:18:28'),('rl1008','','Custom rule ','CUST','1','2016-01-10 13:23:40'),('rl1009','','Custom rule ','CUST','1','2016-01-10 16:43:55'),('rl1010','','Custom rule ','CUST','1','2016-01-10 16:57:06'),('rl1011','','Custom rule ','CUST','1','2016-01-10 17:16:36'),('rl1012','','Custom rule ','CUST','1','2016-01-12 11:10:18'),('rl1013','','Custom rule ','CUST','1','2016-01-12 11:13:20'),('rl1014','','Custom rule ','CUST','1','2016-01-12 11:31:54'),('rl1015','','Custom rule ','CUST','1','2016-01-12 11:32:33'),('rl1016','','Custom rule ','CUST','1','2016-01-12 11:35:32'),('rl1017','','Custom rule ','CUST','1','2016-01-12 11:42:04'),('rl1018','','Custom rule ','CUST','1','2016-01-12 11:54:32'),('rl1019','','Custom rule ','CUST','1','2016-01-12 13:38:34'),('rl1020','','Custom rule ','CUST','1','2016-01-12 16:18:34'),('rl1021','','Custom rule ','CUST','1','2016-01-18 16:25:21'),('rl1022','','Custom rule ','CUST','1','2016-01-18 16:53:34'),('rl1023','','Custom rule ','CUST','1','2016-01-18 16:57:23'),('rl1024','','Custom rule ','CUST','1','2016-01-18 16:58:39'),('rl1025','','Custom rule ','CUST','1','2016-01-18 16:59:35'),('rl1026','','Custom rule ','CUST','1','2016-01-18 17:02:08'),('rl1027','','Custom rule ','CUST','1','2016-01-22 11:03:23');
/*!40000 ALTER TABLE `crules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_workset`
--

DROP TABLE IF EXISTS `rule_workset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_workset` (
  `Rule_Workset_ID` char(18) NOT NULL,
  `Rule_Workset_name` char(100) DEFAULT NULL,
  `Rule_Workset_desc` char(100) DEFAULT NULL,
  PRIMARY KEY (`Rule_Workset_ID`),
  UNIQUE KEY `XPKWorflow` (`Rule_Workset_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_workset`
--

LOCK TABLES `rule_workset` WRITE;
/*!40000 ALTER TABLE `rule_workset` DISABLE KEYS */;
INSERT INTO `rule_workset` VALUES ('1','import com.hethi.domain.DataProcessor;','DataProcessor');
/*!40000 ALTER TABLE `rule_workset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csconnector`
--

DROP TABLE IF EXISTS `csconnector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csconnector` (
  `sfs_UIN` varchar(10) NOT NULL,
  `hethi_service_id` varchar(8) DEFAULT NULL,
  `subservice_id` varchar(10) DEFAULT NULL,
  `service_id` varchar(8) DEFAULT NULL,
  `lastupuser` varchar(25) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`sfs_UIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csconnector`
--

LOCK TABLES `csconnector` WRITE;
/*!40000 ALTER TABLE `csconnector` DISABLE KEYS */;
INSERT INTO `csconnector` VALUES ('csfs10000','ch100105','csp10000','cs100103','Root','2015-10-15 11:03:33'),('csfs100101','ch100101','csp100101','cs100101','Root','2015-10-15 11:03:33'),('csfs100102','ch100101','csp100102','cs100101','Root','2015-10-15 11:03:33'),('csfs100103','ch100101','csp100103','cs100101','Root','2015-10-15 11:03:33'),('csfs100104','ch100101','csp100104','cs100101','Root','2015-10-15 11:03:33'),('csfs100105','ch100101','csp100105','cs100101','Root','2015-10-15 11:03:33'),('csfs100106','ch100101','csp100106','cs100101','Root','2015-10-15 11:03:33'),('csfs100107','ch100101','csp100107','cs100101','Root','2015-10-15 11:03:33'),('csfs100108','ch100101','csp100108','cs100101','Root','2015-10-15 11:03:33'),('csfs100109','ch100101','csp100109','cs100101','Root','2015-10-15 11:03:33'),('csfs100120','ch100102','csp100120','cs100102','Root','2015-10-15 11:03:33'),('csfs100121','ch100102','csp100121','cs100102','Root','2015-10-15 11:03:33'),('csfs100140','ch100103','csp100140','cs100103','Root','2015-10-15 11:03:33'),('csfs100141','ch100103','csp100141','cs100103','Root','2015-10-15 11:03:33'),('csfs100142','ch100103','csp100142','cs100103','Root','2015-10-15 11:03:33'),('csfs100143','ch100103','csp100143','cs100103','Root','2015-10-15 11:03:33'),('csfs100144','ch100103','csp100144','cs100103','Root','2015-10-15 11:03:33'),('csfs100145','ch100103','csp100145','cs100103','Root','2015-10-15 11:03:33'),('csfs100146','ch100103','csp100146','cs100103','Root','2015-10-15 11:03:33'),('csfs100147','ch100103','csp100147','cs100103','Root','2015-10-15 11:03:33'),('csfs100160','ch100104','csp100160','cs100104','Root','2015-10-15 11:03:33'),('csfs100161','ch100104','csp100161','cs100104','1','2015-10-15 11:03:33'),('csfs100162','ch100104','csp100162','cs100104','1','2015-10-15 11:03:33'),('csfs100163','ch100104','csp100163','cs100104','1','2015-10-15 11:03:33'),('csfs100180','ch100106','csp100180','cs100104','1','2015-10-15 11:03:33'),('csfs100181','ch100106','csp100181','cs100104','1','2015-10-15 11:03:33'),('csfs100200','ch100105','csp100200','cs100104','1','2015-10-15 11:03:33'),('csfs100201','ch100105','csp100201','cs100104','1','2015-10-15 11:03:33'),('csfs100202','ch100105','csp100202','cs100104','1','2015-10-15 11:03:33'),('csfs100203','ch100105','csp100203','cs100104','1','2015-10-15 11:03:33');
/*!40000 ALTER TABLE `csconnector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cform_bundle`
--

DROP TABLE IF EXISTS `cform_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cform_bundle` (
  `formbundle_id` varchar(7) NOT NULL,
  `form_primary` varchar(8) DEFAULT NULL,
  `form_attach1` varchar(8) DEFAULT NULL,
  `form_attach2` varchar(8) DEFAULT NULL,
  `form_attach3` varchar(8) DEFAULT NULL,
  `form_attach4` varchar(8) DEFAULT NULL,
  `lastupuser` varchar(25) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`formbundle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cform_bundle`
--

LOCK TABLES `cform_bundle` WRITE;
/*!40000 ALTER TABLE `cform_bundle` DISABLE KEYS */;
INSERT INTO `cform_bundle` VALUES ('A000001','cf100101','cf100108',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000002','cf100102','cf100108',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000003','cf100103','cf100108',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000004','cf100104','cf100108',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000005','cf100105','cf100108',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000006','cf100106','cf100108',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000007','cf100107','cf100108',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000008','cf100110','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000009','cf100111','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000010','cf100112','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000011','cf100113','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000012','cf100114','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000013','cf100115','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000014','cf100121','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000015','cf100116','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000016','cf100117','cf100123',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000017','cf100110','cf100118',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000018','cf100110','cf100119',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000019','cf100110','cf100122',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000020','cf100110','cf100120',NULL,NULL,NULL,'Root','2015-10-15 11:03:33'),('A000021','cf100110','cf100118','cf100119','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000022','cf100110','cf100118','cf100122','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000023','cf100110','cf100118','cf100120','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000024','cf100110','cf100118','cf100119','cf100120','cf100108','Root','2015-10-15 11:03:33'),('A000025','cf100110','cf100118','cf100122','cf100120','cf100108','Root','2015-10-15 11:03:33'),('A000026','cf100111','cf100118','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000027','cf100111','cf100119','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000028','cf100111','cf100122','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000029','cf100111','cf100120','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000030','cf100111','cf100118','cf100119','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000031','cf100111','cf100118','cf100122','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000032','cf100111','cf100118','cf100120','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000033','cf100111','cf100118','cf100119','cf100120','cf100108','Root','2015-10-15 11:03:33'),('A000034','cf100111','cf100118','cf100122','cf100120','cf100108','Root','2015-10-15 11:03:33'),('A000035','cf100112','cf100118','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000036','cf100112','cf100119','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000037','cf100112','cf100122','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000038','cf100112','cf100120','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000039','cf100112','cf100118','cf100119','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000040','cf100112','cf100118','cf100122','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000041','cf100112','cf100118','cf100120','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000042','cf100112','cf100118','cf100119','cf100120','cf100108','Root','2015-10-15 11:03:33'),('A000043','cf100112','cf100118','cf100122','cf100120','cf100108','Root','2015-10-15 11:03:33'),('A000044','cf100113','cf100118','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000045','cf100113','cf100119','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000046','cf100113','cf100122','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000047','cf100113','cf100120','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000048','cf100113','cf100118','cf100119','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000049','cf100113','cf100118','cf100122','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000050','cf100113','cf100118','cf100120','cf100108',NULL,'Root','2015-10-15 11:03:33'),('A000051','cf100113','cf100118','cf100119','cf100120','cf100108','Root','2015-10-15 11:03:33'),('A000052','cf100113','cf100118','cf100122','cf100120','cf100108','Root','2015-10-15 11:03:33'),('A000053','cf100121','cf100118','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000054','cf100121','cf100119','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33'),('A000055','cf100121','cf100122','cf100108',NULL,NULL,'Root','2015-10-15 11:03:33');
/*!40000 ALTER TABLE `cform_bundle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crulepackage`
--

DROP TABLE IF EXISTS `crulepackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crulepackage` (
  `rule_package_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with pk, 100101. example : pk100101',
  `rule_package_name` varchar(255) NOT NULL,
  `rule_package_desc` varchar(255) DEFAULT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`rule_package_id`),
  UNIQUE KEY `rule_package_name_UNIQUE` (`rule_package_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crulepackage`
--

LOCK TABLES `crulepackage` WRITE;
/*!40000 ALTER TABLE `crulepackage` DISABLE KEYS */;
INSERT INTO `crulepackage` VALUES ('pk1001','com.hethi.daas.service','TestPackage Description','1','2015-11-03 12:01:58'),('pk1002','cvcvc','cvcv','1','2016-01-01 17:28:29');
/*!40000 ALTER TABLE `crulepackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dassign_customer_serviceplay`
--

DROP TABLE IF EXISTS `dassign_customer_serviceplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dassign_customer_serviceplay` (
  `customer_id` int(11) NOT NULL COMMENT 'dCustomer\\n',
  `sfs_uin` char(10) NOT NULL COMMENT 'sfs_uin',
  `efs_uin` char(10) NOT NULL COMMENT 'ciconnector_efs.efs_uin',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  PRIMARY KEY (`customer_id`,`sfs_uin`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dassign_customer_serviceplay`
--

LOCK TABLES `dassign_customer_serviceplay` WRITE;
/*!40000 ALTER TABLE `dassign_customer_serviceplay` DISABLE KEYS */;
INSERT INTO `dassign_customer_serviceplay` VALUES (1,'csfs10000','cefs100101','1','2016-01-23 12:32:10'),(1,'csfs100101','cefs100101','1','2016-01-23 12:32:10'),(1,'csfs100102','cefs100101','1','2016-01-23 12:32:10'),(1,'csfs100103','cefs100101','1','2016-01-23 12:32:10'),(1,'csfs100141','cefs100101','1','2016-01-23 12:32:10'),(1,'csfs100142','cefs100101','1','2016-01-23 12:32:10');
/*!40000 ALTER TABLE `dassign_customer_serviceplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomerbundlecontent`
--

DROP TABLE IF EXISTS `dcustomerbundlecontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomerbundlecontent` (
  `customer_id` int(11) NOT NULL COMMENT 'dCustomer',
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `content_id` char(6) NOT NULL COMMENT 'cContent.content_id',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`tfs_uin`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomerbundlecontent`
--

LOCK TABLES `dcustomerbundlecontent` WRITE;
/*!40000 ALTER TABLE `dcustomerbundlecontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomerbundlecontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccore_capture_offering`
--

DROP TABLE IF EXISTS `ccore_capture_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccore_capture_offering` (
  `capture_id` char(3) NOT NULL,
  `capture_service` varchar(15) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`capture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccore_capture_offering`
--

LOCK TABLES `ccore_capture_offering` WRITE;
/*!40000 ALTER TABLE `ccore_capture_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccore_capture_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_locale`
--

DROP TABLE IF EXISTS `dcustomer_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_locale` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `zone_id` int(11) NOT NULL COMMENT 'auto generated',
  `primary_doc_lang` varchar(6) NOT NULL COMMENT 'clanguage:language_id',
  `expected_doc_lang` varchar(6) NOT NULL COMMENT 'clanguage:language_id',
  `lastupuser` int(11) NOT NULL COMMENT 'user ID audit trial',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_locale`
--

LOCK TABLES `dcustomer_locale` WRITE;
/*!40000 ALTER TABLE `dcustomer_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomer_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomerbundletransport`
--

DROP TABLE IF EXISTS `dcustomerbundletransport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomerbundletransport` (
  `customer_id` int(11) NOT NULL COMMENT 'dCustomer',
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `transport_id` char(6) NOT NULL COMMENT 'cTransport.transport_id',
  `transport_xml` text NOT NULL COMMENT 'transport source attributes',
  `file_location` varchar(255) DEFAULT NULL COMMENT 'path where source file is stored',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`tfs_uin`,`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomerbundletransport`
--

LOCK TABLES `dcustomerbundletransport` WRITE;
/*!40000 ALTER TABLE `dcustomerbundletransport` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomerbundletransport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccore_payment_offering`
--

DROP TABLE IF EXISTS `ccore_payment_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccore_payment_offering` (
  `manage_id` char(6) NOT NULL,
  `manage_service` varchar(20) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`manage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccore_payment_offering`
--

LOCK TABLES `ccore_payment_offering` WRITE;
/*!40000 ALTER TABLE `ccore_payment_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccore_payment_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cstandardrules`
--

DROP TABLE IF EXISTS `cstandardrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cstandardrules` (
  `efs_uin` char(10) NOT NULL,
  `rule_uin` char(10) NOT NULL COMMENT 'ciconnector_rules.rule_uin',
  `ruleset_id` char(6) DEFAULT NULL,
  `rule_name` varchar(45) DEFAULT NULL,
  `rule_condition` varchar(500) NOT NULL,
  `rule_action` varchar(500) DEFAULT NULL,
  `rule_comments` varchar(100) DEFAULT NULL COMMENT 'SOP, CUST etc',
  `rule_status` tinyint(1) DEFAULT '1',
  `rule_order` int(11) DEFAULT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `effective_startdate` date DEFAULT NULL,
  `effective_enddate` date DEFAULT NULL,
  `rule_type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`rule_uin`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cstandardrules`
--

LOCK TABLES `cstandardrules` WRITE;
/*!40000 ALTER TABLE `cstandardrules` DISABLE KEYS */;
INSERT INTO `cstandardrules` VALUES ('cefs100101','rule1001','rs1002','Rule 1','form:ixsd_cefs100101(branch_location.equals(\"Palakkad\")) and ip:iPost()','ip.setQueue(\"baas.reject\");','rule desc',1,1,'1','2016-01-21 15:19:37','2015-10-10','2017-10-10','null');
/*!40000 ALTER TABLE `cstandardrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciconnector_content`
--

DROP TABLE IF EXISTS `ciconnector_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciconnector_content` (
  `content_uin` char(10) NOT NULL COMMENT 'total 10 characters. Starts with cefs, 100101. example :  cefs100101. Unique content UIN to manage this part of sergment in BPaaS studio',
  `efs_uin` char(10) NOT NULL COMMENT 'ciconnector_efs.efs_uin',
  `content_id` char(6) NOT NULL COMMENT 'cContent.content_id',
  `transport_id` char(6) NOT NULL COMMENT 'cTransport.transport_id',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`content_uin`),
  KEY `efs_uin_idx` (`efs_uin`),
  KEY `content_id_idx` (`content_id`),
  KEY `transport_id_idx` (`transport_id`),
  CONSTRAINT `content_id` FOREIGN KEY (`content_id`) REFERENCES `ccontent` (`content_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `efs_uin` FOREIGN KEY (`efs_uin`) REFERENCES `ciconnector_efs` (`efs_uin`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transport_id` FOREIGN KEY (`transport_id`) REFERENCES `ctransport` (`transport_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciconnector_content`
--

LOCK TABLES `ciconnector_content` WRITE;
/*!40000 ALTER TABLE `ciconnector_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciconnector_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_document`
--

DROP TABLE IF EXISTS `dcustomer_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_document` (
  `uin` bigint(20) NOT NULL,
  `din` varchar(10) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `upload_id` bigint(20) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `tfs_uin` varchar(10) DEFAULT NULL,
  `efs_uin` varchar(10) DEFAULT NULL,
  `mxml` text,
  `mxml_location` varchar(100) DEFAULT NULL,
  `lastupuser` varchar(10) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`uin`,`din`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_document`
--

LOCK TABLES `dcustomer_document` WRITE;
/*!40000 ALTER TABLE `dcustomer_document` DISABLE KEYS */;
INSERT INTO `dcustomer_document` VALUES (2,'1',1,10,4,'cefs100101','A000001','<efsuin><header><position><top>437</top><left>519</left><width>109</width><height>40</height></position><field><name></name><ixsdfieldname>invoice_number</ixsdfieldname><value></value><label><content></content><position><top>6</top><left>108</left><width>67</width><height>13</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>201</content><position><top>81</top><left>92</left><width>64</width><height>36</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>false</show></header><footer><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>invoice_amount</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>$7200</content><position><top>569</top><left>516</left><width>59</width><height>40</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-28 15:30:20'),(4,'1',1,10,4,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>invoice_date</ixsdfieldname><value></value><label><content></content><position><top>8</top><left>108</left><width>53</width><height>7</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>March 19,2013</content><position><top>45</top><left>112</left><width>151</width><height>25</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-28 15:38:34'),(6,'1',1,10,4,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>142</top><left>35</left><width>46</width><height>18</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>Grand Rapid , Michigan</content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-28 15:52:03'),(8,'1',1,10,4,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>157</top><left>37</left><width>84</width><height>18</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>Grand Rapid , Michigan</content><position><top>157</top><left>52</left><width>171</width><height>56</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-28 15:55:38'),(10,'1',1,10,4,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>160</top><left>35</left><width>57</width><height>21</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>Grand Rapid , Michigan</content><position><top>160</top><left>55</left><width>149</width><height>40</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>false</show></field><field><name></name><ixsdfieldname>invoice_number</ixsdfieldname><value></value><label><content></content><position><top>6</top><left>101</left><width>74</width><height>30</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content></content><position><top>85</top><left>92</left><width>71</width><height>43</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>false</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-28 16:10:42'),(12,'1',1,10,4,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height><show>false</show></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>160</top><left>37</left><width>31</width><height>22</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>DEZ DIGITAL PRINTING , P.X Box .1213</content><position><top>164</top><left>55</left><width>124</width><height>39</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><field><name></name><ixsdfieldname>invoice_date</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>March 19,2013</content><position><top>49</top><left>120</left><width>77</width><height>23</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><field><name></name><ixsdfieldname>scandate</ixsdfieldname><value></value><label><content></content><position><top>526</top><left>101</left><width>98</width><height>19</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>4/15/2013</content><position><top>567</top><left>120</left><width>55</width><height>20</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><field><name></name><ixsdfieldname>scandate</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></label><data><content>4/15/2013</content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></data></field><field><name></name><ixsdfieldname>invoice_amount</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>$7200</content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>invoice_amount</ixsdfieldname><value></value><label><content></content><position><top>580</top><left>529</left><width>42</width><height>23</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>$7200</content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><field><name></name><ixsdfieldname>invoice_sub_total</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></label><data><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></data><show>true</show></field><show>true</show></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-28 18:43:01'),(14,'1',1,10,4,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>invoice_date</ixsdfieldname><value></value><label><content></content><position><top>14</top><left>125</left><width>30</width><height>12</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>March 19,2013</content><position><top>48</top><left>121</left><width>77</width><height>19</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><field><name></name><ixsdfieldname>invoice_number</ixsdfieldname><value></value><label><content></content><position><top>9</top><left>102</left><width>74</width><height>23</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>#201</content><position><top>84</top><left>101</left><width>45</width><height>24</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>invoice_sub_total</ixsdfieldname><value></value><label><content></content><position><top>445</top><left>467</left><width>57</width><height>18</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>$8000</content><position><top>583</top><left>464</left><width>45</width><height>24</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-28 18:58:20'),(16,'1',1,10,4,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>5</top><left>32</left><width>133</width><height>59</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>DEZ DIGITAL PRINTING , P.X Box .1213</content><position><top>154</top><left>37</left><width>150</width><height>56</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-30 10:29:19'),(18,'1',1,10,1,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>8</top><left>11</left><width>186</width><height>42</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>DEZ DIGITAL PRINTING , P.X Box .1213</content><position><top>364</top><left>188</left><width>168</width><height>71</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-30 13:24:25'),(20,'1',1,10,1,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>8</top><left>17</left><width>190</width><height>47</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>DEZ DIGITAL PRINTING , P.X Box .1213</content><position><top>362</top><left>188</left><width>127</width><height>55</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2015-12-30 13:43:35'),(22,'1',1,2,1,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>9</top><left>68</left><width>130</width><height>147</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>\r\n</content><position><top>144</top><left>93</left><width>194</width><height>147</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/><show>true</show></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2016-01-08 09:53:18'),(24,'1',1,2,1,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></label><data><content>DEZ DIGITAL PRINTING\r\nPD. BOX 1213\r\nGrand Rapids, Michigan\r\n</content><position><top>217</top><left>51</left><width>212</width><height>71</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2016-01-09 12:18:02'),(26,'1',1,12,1,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></label><data><content>, 199 Main Street\r\nox 100, Glohecity Globeland, 1000\r\ne: (91) 9999 9999\r\n</content><position><top>136</top><left>54</left><width>314</width><height>52</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>false</show></data><show>true</show></field><field><name></name><ixsdfieldname>company_code</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></label><data><content>w\r\n127756 98750756 Speed Transpon\r\n0 10 AP‘APT103 Bambna Ehnds\r\n0 50 AP‘ATICSB Writing Seis\r\n0 80 AP‘ATICSS Umbrellas\r\n3 8 AP‘ATICVZ Cane Chair\r\n6 6 AP‘ATICVB Cane Baskets\r\n4 A AP‘APT103 Tea Cnes|s\r\n</content><position><top>43</top><left>237</left><width>271</width><height>141</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/><show>true</show></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2016-01-10 17:20:59'),(28,'1',1,52,1,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></label><data><content>, 199 Main Street\r\nox 100, Glohecity Globeland, 1000\r\nne: (91) 9999 9999\r\n</content><position><top>132</top><left>57</left><width>310</width><height>47</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><field><name></name><ixsdfieldname>claimedby</ixsdfieldname><value></value><label><content></content><position><top></top><left></left><width></width><height></height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify></label><data><content>snwro\r\nMr Christopher\r\n254 East Road\r\nGlabecmy East\r\nGlabeland\r\n</content><position><top>136</top><left>128</left><width>323</width><height>101</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2016-01-14 12:59:24'),(30,'1',1,10,1,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>168</top><left>96</left><width>189</width><height>42</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content>\r\n</content><position><top>552</top><left>143</left><width>265</width><height>44</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2016-01-15 16:19:58'),(32,'1',1,1,1,'cefs100101','A000001','<efsuin><header><position><top></top><left></left><width></width><height></height></position><field><name></name><ixsdfieldname>branch_location</ixsdfieldname><value></value><label><content></content><position><top>65</top><left>25</left><width>314</width><height>86</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></label><data><content/><position><top>393</top><left>13</left><width>433</width><height>64</height></position><classify><toreject></toreject><tosplit></tosplit><tomerge></tomerge><tomXSD></tomXSD></classify><show>true</show></data><show>true</show></field><show>true</show></header><footer><position><top></top><left></left><width></width><height></height></position><field/></footer><body><table><header><field/></header><lineitem><field/></lineitem><footer><field/></footer></table><field/></body></efsuin>','','3','2016-01-15 16:22:15');
/*!40000 ALTER TABLE `dcustomer_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cserviceplayqueue`
--

DROP TABLE IF EXISTS `cserviceplayqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cserviceplayqueue` (
  `sfs_uin` char(10) NOT NULL COMMENT 'csconnector.sfs_UIN',
  `queue_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `next_queue` char(6) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `exception_queue` char(6) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`sfs_uin`,`queue_id`,`next_queue`,`exception_queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cserviceplayqueue`
--

LOCK TABLES `cserviceplayqueue` WRITE;
/*!40000 ALTER TABLE `cserviceplayqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cserviceplayqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomerqueueaccess`
--

DROP TABLE IF EXISTS `dcustomerqueueaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomerqueueaccess` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomerQueue.customer_id',
  `role_id` char(6) NOT NULL COMMENT 'tRole.role_id',
  `queue_id` char(6) NOT NULL COMMENT 'tCustomerQueue.queue_id (queue which role can access)',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`role_id`,`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomerqueueaccess`
--

LOCK TABLES `dcustomerqueueaccess` WRITE;
/*!40000 ALTER TABLE `dcustomerqueueaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomerqueueaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccore_offering`
--

DROP TABLE IF EXISTS `ccore_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccore_offering` (
  `core_id` char(6) NOT NULL,
  `core_service` varchar(20) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`core_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccore_offering`
--

LOCK TABLES `ccore_offering` WRITE;
/*!40000 ALTER TABLE `ccore_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccore_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_operators`
--

DROP TABLE IF EXISTS `rule_operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_operators` (
  `operation_id` int(11) NOT NULL DEFAULT '0',
  `operation_name` varchar(45) DEFAULT NULL,
  `category` varchar(45) NOT NULL DEFAULT '',
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`operation_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_operators`
--

LOCK TABLES `rule_operators` WRITE;
/*!40000 ALTER TABLE `rule_operators` DISABLE KEYS */;
INSERT INTO `rule_operators` VALUES (1,'=','Boolean','0'),(1,'==','Date','0'),(1,'+','Decimal','0'),(1,'in','Integer','1'),(1,'toUpper','String','1'),(2,'<>','Boolean','0'),(2,'<','Date','0'),(2,'-','Decimal','0'),(2,'absVal','Integer','1'),(2,'toLower','String','1'),(3,'and','Boolean','0'),(3,'>','Date','0'),(3,'*','Decimal','0'),(3,'toDecimal','Integer','0'),(3,'contains(paramString','String','2'),(4,'or','Boolean','0'),(4,'<>','Date','0'),(4,'/','Decimal','0'),(4,'toString','Integer','1'),(4,'charsIn(validSet)','String','2'),(5,'~','Boolean','0'),(5,'>=','Date','0'),(5,'=','Decimal','0'),(5,'=','Integer','0'),(5,'equals','String','2'),(6,'<=','Date','0'),(6,'<>','Decimal','0'),(6,'<>','Integer','0'),(6,'=','String','0'),(7,'in','Date','0'),(7,'<','Decimal','0'),(7,'<','Integer','0'),(7,'<>','String','0'),(8,'year','Date','1'),(8,'<=','Decimal','0'),(8,'<=','Integer','0'),(8,'<','String','0'),(9,'month','Date','1'),(9,'>','Decimal','0'),(9,'>','Integer','0'),(9,'<=','String','0'),(10,'day','Date','1'),(10,'>=','Decimal','0'),(10,'>=','Integer','0'),(10,'>','String','0'),(11,'addYears','Date','2'),(11,'**','Decimal','0'),(11,'+','Integer','0'),(11,'>=','String','0'),(12,'addMonths','Date','2'),(12,'+=','Decimal','0'),(12,'-','Integer','0'),(12,'+','String','0'),(13,'addDays','Date','2'),(13,'-=','Decimal','0'),(13,'*','Integer','0'),(13,'in','String','1'),(14,'yearsBetween','Date','2'),(14,'in','Decimal','0'),(14,'/','Integer','0'),(14,'size','String','1'),(15,'monthsBetween','Date','2'),(15,'absVal','Decimal','1'),(15,'+=','Integer','0'),(15,'concat','String','2'),(16,'daysBetween','Date','2'),(16,'round','Decimal','1'),(16,'-=','Integer','0'),(16,'toDecimal','String','1'),(17,'dayOfWeek','Date','1'),(17,'floor','Decimal','1'),(17,'max','Integer','2'),(17,'toDateTime','String','1'),(18,'weekOfYear','Date','1'),(18,'round(parm)','Decimal','2'),(18,'min','Integer','2'),(18,'toInteger','String','1'),(19,'dayOfYear','Date','1'),(19,'toIntger','Decimal','1'),(19,'div','Integer','2'),(19,'substring','String','3'),(20,'weekOfMonth','Date','1'),(20,'toString','Decimal','1'),(20,'mod','Integer','2'),(20,'indexOf','String','2'),(21,'toDateTime','Date','1'),(21,'max','Decimal','2'),(21,'log','Integer','1'),(21,'equalsIgnoreCase','String','2'),(22,'toDateTime','Date','2'),(22,'min','Decimal','2'),(22,'log(logBase)','Integer','2'),(22,'startsWith','String','2'),(23,'toString','Date','2'),(23,'log','Decimal','1'),(23,'In','Integer','1'),(23,'endsWith','String','2'),(24,'nextDay','Date','1'),(24,'log(logBase)','Decimal','2'),(24,'isProbabePrime','Integer','2'),(24,'containsBlanks','String','2'),(25,'getMilliseconds','Date','1'),(25,'In','Decimal','1'),(25,'gcd','Integer','2'),(25,'characterAt','String','2'),(26,'truncate','Decimal','1'),(26,'negate','Integer','1'),(26,'isInteger','String','1'),(27,'fraction','Decimal','1'),(27,'trimSpaces','String','1'),(28,'movePoint','Decimal','2'),(28,'charsIn','String','2');
/*!40000 ALTER TABLE `rule_operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctransport`
--

DROP TABLE IF EXISTS `ctransport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctransport` (
  `transport_id` char(6) NOT NULL,
  `transport_mode` varchar(15) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctransport`
--

LOCK TABLES `ctransport` WRITE;
/*!40000 ALTER TABLE `ctransport` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctransport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_Id` char(18) NOT NULL,
  `Customer_name` char(18) DEFAULT NULL,
  `Customer_Addr1` char(18) DEFAULT NULL,
  `Customer_Addr2` char(18) DEFAULT NULL,
  `Customer_Addr3` char(18) DEFAULT NULL,
  `Customer_City` char(18) DEFAULT NULL,
  `Customer_Country` char(18) DEFAULT NULL,
  `Customer_Zip` char(18) DEFAULT NULL,
  `Customer_Phone1` char(18) DEFAULT NULL,
  `Customer_Phone2` char(18) DEFAULT NULL,
  `Customer_Email` char(100) DEFAULT NULL,
  `Customer_website` char(18) DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`),
  UNIQUE KEY `XPKCustomer` (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','DEMO','CronyCo','Palakkad','Kerla','Palakkad','India','678001','9876543210','7896541230','CronyCo2012@gmail.com','cronyco.in');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tefs_ingestion`
--

DROP TABLE IF EXISTS `tefs_ingestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tefs_ingestion` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer',
  `batch_id` varchar(255) NOT NULL COMMENT 'unique batch id for that customer',
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL COMMENT '.zip, .rar etc',
  `startreaddtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `endreaddtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `file_size` int(11) NOT NULL,
  `file_status` int(11) NOT NULL COMMENT '0-valid, 1-invalid, 2-corrupted',
  PRIMARY KEY (`customer_id`,`batch_id`,`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tefs_ingestion`
--

LOCK TABLES `tefs_ingestion` WRITE;
/*!40000 ALTER TABLE `tefs_ingestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tefs_ingestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dupload_status`
--

DROP TABLE IF EXISTS `dupload_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupload_status` (
  `upload_id` bigint(20) NOT NULL COMMENT 'auto increment\\n',
  `file_id` bigint(20) NOT NULL COMMENT 'file id\\n',
  `status` int(11) DEFAULT NULL,
  `lastupuser` int(11) NOT NULL COMMENT 'user ID audit trail\\\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  PRIMARY KEY (`upload_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload_status`
--

LOCK TABLES `dupload_status` WRITE;
/*!40000 ALTER TABLE `dupload_status` DISABLE KEYS */;
INSERT INTO `dupload_status` VALUES (1,1,0,3,'2016-01-15 16:22:03'),(11,1,0,3,'2016-01-22 17:25:28'),(11,2,0,3,'2016-01-21 12:06:34'),(13,1,0,3,'2016-01-15 17:14:13'),(14,1,3,3,'2016-01-23 11:12:16');
/*!40000 ALTER TABLE `dupload_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cformowner`
--

DROP TABLE IF EXISTS `cformowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cformowner` (
  `efslobowner_id` char(8) NOT NULL,
  `efslobowner_name` varchar(50) DEFAULT NULL,
  `marketplace_ID` char(6) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`efslobowner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cformowner`
--

LOCK TABLES `cformowner` WRITE;
/*!40000 ALTER TABLE `cformowner` DISABLE KEYS */;
INSERT INTO `cformowner` VALUES ('HAA00001','OWNER','cm1001','OWNER','Root','2015-10-30 15:28:00');
/*!40000 ALTER TABLE `cformowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_flow`
--

DROP TABLE IF EXISTS `customer_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_flow` (
  `customer_id` int(11) NOT NULL,
  `efs_uin` char(10) NOT NULL,
  `flow_data` text,
  PRIMARY KEY (`customer_id`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_flow`
--

LOCK TABLES `customer_flow` WRITE;
/*!40000 ALTER TABLE `customer_flow` DISABLE KEYS */;
INSERT INTO `customer_flow` VALUES (1,'cefs100101','{\"class\":\"go.GraphLinksModel\",\"nodeDataArray\":[{\"category\":\"Rectangledaas\",\"text\":\"daas.inventory\",\"key\":\"csfs100101\",\"demokey\":\"csfs100101\",\"loc\":\"-421.9610283430229 -313.5255813953485\"},{\"category\":\"Start\",\"text\":\"Start\",\"key\":\"Start\",\"loc\":\"-558.9610283430229 -343.5255813953488\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.fullextract\",\"key\":\"csfs100102\",\"demokey\":\"csfs100102\",\"loc\":\"-270.96102834302314 -317.52558139534875\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.classify\",\"key\":\"csfs100103\",\"demokey\":\"csfs100103\",\"loc\":\"-150.96102834302275 -395.5255813953487\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.index\",\"key\":\"csfs100104\",\"demokey\":\"csfs100104\",\"loc\":\"-17.96102834302289 -374.525581395349\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.split_merge\",\"key\":\"csfs100105\",\"demokey\":\"csfs100105\",\"loc\":\"148.03897165697708 -422.52558139534864\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.extract\",\"key\":\"csfs100106\",\"demokey\":\"csfs100106\",\"loc\":\"312.03897165697697 -383.52558139534875\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.batch\",\"key\":\"csfs100107\",\"demokey\":\"csfs100107\",\"loc\":\"258.0389716569768 -280.5255813953488\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.keywise\",\"key\":\"csfs100108\",\"demokey\":\"csfs100108\",\"loc\":\"382.71084665697686 -232.7348837209302\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.baashandoff\",\"key\":\"csfs100109\",\"demokey\":\"csfs100109\",\"loc\":\"363.7108466569771 -95.73488372093021\"},{\"category\":\"Rectanglebaas\",\"text\":\"baas.workflow\",\"key\":\"csfs100120\",\"demokey\":\"csfs100120\",\"loc\":\"191.00154433139573 -117.73488372093021\"},{\"category\":\"Rectanglebaas\",\"text\":\"baas.reject\",\"key\":\"csfs100121\",\"demokey\":\"csfs100121\",\"loc\":\"49.001544331395735 -140.7348837209302\"},{\"category\":\"Rectangleoaas\",\"text\":\"oaas.output\",\"key\":\"csfs100140\",\"demokey\":\"csfs100140\",\"loc\":\"-81.99845566860427 -182.7348837209302\"},{\"category\":\"Rectangleoaas\",\"text\":\"oaas.rejects\",\"key\":\"csfs100142\",\"demokey\":\"csfs100142\",\"loc\":\"-210.99845566860427 -203.7348837209302\"},{\"category\":\"Rectangleoaas\",\"text\":\"oaas.hml\",\"key\":\"csfs100143\",\"demokey\":\"csfs100143\",\"loc\":\"-327.99845566860427 -236.7348837209302\"},{\"category\":\"Rectangleoaas\",\"text\":\"oaas.shipment\",\"key\":\"csfs100141\",\"demokey\":\"csfs100141\",\"loc\":\"-457.99845566860404 -232.73488372093004\"},{\"category\":\"End\",\"text\":\"End\",\"key\":\"End\",\"loc\":\"-251.99845566860427 -99.73488372093021\"},{\"category\":\"Rectangleaaas\",\"text\":\"exit_channel\",\"key\":\"csfs10000\",\"demokey\":\"csfs10000\",\"loc\":\"-399.0578670058137 -140.78488372093022\"}],\"linkDataArray\":[{\"from\":\"Start\",\"to\":\"csfs100101\"},{\"from\":\"csfs100102\",\"to\":\"csfs100103\"},{\"from\":\"csfs100103\",\"to\":\"csfs100104\"},{\"from\":\"csfs100104\",\"to\":\"csfs100105\"},{\"from\":\"csfs100105\",\"to\":\"csfs100106\"},{\"from\":\"csfs100106\",\"to\":\"csfs100107\"},{\"from\":\"csfs100107\",\"to\":\"csfs100108\"},{\"from\":\"csfs100108\",\"to\":\"csfs100109\"},{\"from\":\"csfs100109\",\"to\":\"csfs100120\"},{\"from\":\"csfs100120\",\"to\":\"csfs100121\"},{\"from\":\"csfs100121\",\"to\":\"csfs100140\"},{\"from\":\"csfs100140\",\"to\":\"csfs100142\"},{\"from\":\"csfs100142\",\"to\":\"csfs100143\"},{\"from\":\"csfs100143\",\"to\":\"csfs100141\"},{\"from\":\"csfs100141\",\"to\":\"csfs10000\"},{\"from\":\"csfs10000\",\"to\":\"End\"},{\"from\":\"csfs100101\",\"to\":\"csfs100102\"}]}');
/*!40000 ALTER TABLE `customer_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1_employee_lookup`
--

DROP TABLE IF EXISTS `1_employee_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1_employee_lookup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1_employee_lookup`
--

LOCK TABLES `1_employee_lookup` WRITE;
/*!40000 ALTER TABLE `1_employee_lookup` DISABLE KEYS */;
INSERT INTO `1_employee_lookup` VALUES (1,'Hethi-Admin'),(2,'Hethi-Artist');
/*!40000 ALTER TABLE `1_employee_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccontent`
--

DROP TABLE IF EXISTS `ccontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccontent` (
  `content_id` char(6) NOT NULL,
  `content_format` varchar(15) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  `ciconnector_content_content_uin` char(10) NOT NULL,
  PRIMARY KEY (`content_id`),
  KEY `fk_cContent_ciconnector_content1_idx` (`ciconnector_content_content_uin`),
  CONSTRAINT `fk_cContent_ciconnector_content1` FOREIGN KEY (`ciconnector_content_content_uin`) REFERENCES `ciconnector_content` (`content_uin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccontent`
--

LOCK TABLES `ccontent` WRITE;
/*!40000 ALTER TABLE `ccontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ixsd_cefs100103_lineitem`
--

DROP TABLE IF EXISTS `ixsd_cefs100103_lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixsd_cefs100103_lineitem` (
  `uid` varchar(255) NOT NULL,
  `din` varchar(255) NOT NULL,
  `efs_uin` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `lastupdtm` datetime NOT NULL,
  `sequence_no` int(11) NOT NULL,
  `part_description` varchar(255) DEFAULT NULL,
  `po_extended_price` varchar(255) DEFAULT NULL,
  `po_line_items` varchar(255) DEFAULT NULL,
  `po_line_number` varchar(255) DEFAULT NULL,
  `po_ordered_price` varchar(255) DEFAULT NULL,
  `po_ordered_quantity` varchar(255) DEFAULT NULL,
  `po_part_number` varchar(255) DEFAULT NULL,
  `po_pool` varchar(255) DEFAULT NULL,
  `po_uom` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ixsd_cefs100103_lineitem`
--

LOCK TABLES `ixsd_cefs100103_lineitem` WRITE;
/*!40000 ALTER TABLE `ixsd_cefs100103_lineitem` DISABLE KEYS */;
INSERT INTO `ixsd_cefs100103_lineitem` VALUES ('1','1','cefs100103',1,'2015-10-10 10:10:10',1,'part descr','78','hj','77','34','87','87','hj','uh','0'),('1','1','cefs100103',1,'2015-10-10 10:10:10',1,'part descr','78','hj','77','34','87','87','hj','uh','0'),('1','1','cefs100103',1,'2015-10-10 10:10:10',1,'part descr','78','hj','77','34','87','87','hj','uh','0'),('1','1','cefs100103',1,'2015-10-10 10:10:10',1,'part descr','78','hj','77','34','87','87','hj','uh','0'),('1','1','cefs100103',1,'2015-10-10 10:10:10',1,'part descr','78','hj','77','34','87','87','hj','uh','0');
/*!40000 ALTER TABLE `ixsd_cefs100103_lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dupload`
--

DROP TABLE IF EXISTS `dupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupload` (
  `upload_id` bigint(20) NOT NULL COMMENT 'auto increment',
  `upload_name` varchar(255) NOT NULL,
  `upload_type` varchar(255) NOT NULL COMMENT '\\''.zip, .rar etc\\''',
  `startreaddtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `endreaddtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `upload_size` char(11) NOT NULL,
  `upload_status` int(11) NOT NULL COMMENT '0-valid, 1-invalid, 2-corrupted',
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload`
--

LOCK TABLES `dupload` WRITE;
/*!40000 ALTER TABLE `dupload` DISABLE KEYS */;
INSERT INTO `dupload` VALUES (1,'apple_mac1452849724567.pdf','pdf','2016-01-15 12:22:04','2016-01-15 12:22:04','171769',0),(2,'RarFile1447063427630.rar','rar','2016-01-15 15:36:16','2016-01-15 15:36:16','1414602',0),(3,'RarFile1447063427630.rar','rar','2016-01-15 15:44:48','2016-01-15 15:44:48','1414602',0),(4,'RarFile1447063427630.rar','rar','2016-01-15 15:47:35','2016-01-15 15:47:35','1414602',0),(5,'Example_002_A4.jpg','jpg','2016-01-15 15:49:11','2016-01-15 15:49:11','171198',0),(6,'Example_0041452862616900.jpg','jpg','2016-01-15 15:56:56','2016-01-15 15:56:56','130504',0),(7,'invoice_31452862804590.jpg','jpg','2016-01-15 16:00:04','2016-01-15 16:00:04','130504',0),(8,'invoice_31452863392428.jpg','jpg','2016-01-15 16:09:52','2016-01-15 16:09:52','130504',0),(9,'invoice_31452863479881.jpg','jpg','2016-01-15 16:11:19','2016-01-15 16:11:19','130504',0),(10,'invoice_31452863712014.jpg','jpg','2016-01-15 16:15:12','2016-01-15 16:15:12','130504',0),(11,'Example_002_A4.jpg','jpg','2016-01-15 16:25:17','2016-01-15 16:25:17','171198',0),(12,'Example_002_A4.jpg','jpg','2016-01-15 16:31:04','2016-01-15 16:31:04','171198',0),(13,'Example_002_A41452867246874.jpg','jpg','2016-01-15 17:14:06','2016-01-15 17:14:06','125104',0),(14,'Example_0041453536734114.jpg','jpg','2016-01-23 11:12:14','2016-01-23 11:12:14','130504',0);
/*!40000 ALTER TABLE `dupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccore_deliver_offering`
--

DROP TABLE IF EXISTS `ccore_deliver_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccore_deliver_offering` (
  `deliver_id` char(6) NOT NULL,
  `deliver_service` varchar(20) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`deliver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccore_deliver_offering`
--

LOCK TABLES `ccore_deliver_offering` WRITE;
/*!40000 ALTER TABLE `ccore_deliver_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccore_deliver_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uicflob`
--

DROP TABLE IF EXISTS `uicflob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uicflob` (
  `efslob_id` char(8) NOT NULL COMMENT 'cflob.efslob_id',
  `form_type_decription_short` varchar(45) DEFAULT NULL,
  `form_type_decription_long` varchar(250) DEFAULT NULL,
  `form_type_image_id` int(11) DEFAULT NULL COMMENT 'ui_images.image_id',
  `form_type_status` char(6) DEFAULT NULL,
  PRIMARY KEY (`efslob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uicflob`
--

LOCK TABLES `uicflob` WRITE;
/*!40000 ALTER TABLE `uicflob` DISABLE KEYS */;
INSERT INTO `uicflob` VALUES ('cf100101','PO-Inventory','PO-Inventory',201,'1'),('cf100102','PO-Expense','PO-Expense',202,'1'),('cf100103','NPO','NPO',203,'1'),('cf100104','NPO-Travel & Expenses','NPO-Travel & Expenses',204,'1'),('cf100105','NPO-Claim & Reimbursements','NPO-Claim & Reimbursements',205,'1'),('cf100106','NPO-Utility Bills','NPO-Utility Bills',206,'1'),('cf100107','NPO-Check Request','NPO-Check Request',207,'0'),('cf100108','Attachments','Attachments',208,'0'),('cf100109','ANSI-810','ANSI-810',209,'0'),('cf100110','HCFA/HICF-Single','HCFA/HICF-Single',201,'1'),('cf100111','HCFA/HICF-Multi','HCFA/HICF-Multi',202,'1'),('cf100112','UB/UB04-Single','UB/UB04-Single',201,'1'),('cf100113','UB/UB04-Multi','UB/UB04-Multi',202,'1'),('cf100114','Superbills-NonStandard Professional Bills','Superbills-NonStandard Professional Bills',203,'1'),('cf100115','Superbills-NonStandard Facility Bills','Superbills-NonStandard Facility Bills',204,'1'),('cf100116','DENTAL','DENTAL',205,'1'),('cf100117','VISION','VISION',206,'1'),('cf100118','EOMB','EOMB',207,'0'),('cf100119','EOB','EOB',208,'0'),('cf100120','REP','REP',209,'0'),('cf100121','RX','RX',201,'1'),('cf100122','OI','OI',202,'1'),('cf100123','Attachments','Attachments',202,'1'),('cf100124','ANSI-837','ANSI-837',202,'1'),('cf100125','ANSI-835','ANSI-835',202,'1');
/*!40000 ALTER TABLE `uicflob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ixsd_exception`
--

DROP TABLE IF EXISTS `ixsd_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixsd_exception` (
  `uid` varchar(255) DEFAULT '0',
  `din` varchar(255) NOT NULL DEFAULT '0',
  `efs_uin` varchar(255) DEFAULT '0',
  `sfs_uin` varchar(255) DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `lastupdtm` datetime NOT NULL DEFAULT '2016-10-10 00:00:00',
  `exception_datetime` datetime DEFAULT '2016-10-10 00:00:00',
  `excepionreason` varchar(255) DEFAULT NULL,
  `exceptioncategory` varchar(255) DEFAULT NULL,
  `exceptioncode` varchar(255) DEFAULT NULL,
  `exceptionfields` varchar(255) DEFAULT NULL,
  `exceptionreason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ixsd_exception`
--

LOCK TABLES `ixsd_exception` WRITE;
/*!40000 ALTER TABLE `ixsd_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `ixsd_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_bundle`
--

DROP TABLE IF EXISTS `dcustomer_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_bundle` (
  `customer_id` int(11) DEFAULT NULL,
  `tfs_uin` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_bundle`
--

LOCK TABLES `dcustomer_bundle` WRITE;
/*!40000 ALTER TABLE `dcustomer_bundle` DISABLE KEYS */;
INSERT INTO `dcustomer_bundle` VALUES (1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000037'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000013'),(1,'A000001'),(1,'A000001'),(1,'A000026'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000045'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000002'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000002'),(1,'A000001'),(1,'A000002'),(1,'A000002'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000002'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000017'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000037'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000002'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000002'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000035'),(1,'A000027'),(1,'A000026'),(1,'A000038'),(1,'A000026'),(1,'A000038'),(1,'A000035'),(1,'A000044'),(1,'A000035'),(1,'A000036'),(1,'A000029'),(1,'A000044'),(1,'A000029'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000045'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000002'),(1,'A000001'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000001'),(1,'A000003'),(1,'A000045'),(1,'A000036'),(1,'A000044'),(1,'A000036'),(1,'A000035'),(1,'A000044'),(1,'A000026'),(1,'A000001'),(1,'A000002'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000044'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000011'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000044'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000002'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000004'),(1,'A000001'),(1,'A000001'),(1,'A000015'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000007'),(1,'A000012'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001'),(1,'A000001');
/*!40000 ALTER TABLE `dcustomer_bundle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ixsd_cefs100101`
--

DROP TABLE IF EXISTS `ixsd_cefs100101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixsd_cefs100101` (
  `uid` varchar(255) NOT NULL,
  `din` varchar(255) NOT NULL,
  `version` int(11) NOT NULL,
  `efs_uin` varchar(255) NOT NULL,
  `branch_location` varchar(255) DEFAULT NULL,
  `claimedby` varchar(255) DEFAULT NULL,
  `company_code` varchar(255) DEFAULT NULL,
  `credit_category` varchar(255) DEFAULT NULL,
  `credit_original_invoice` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `department_code` varchar(255) DEFAULT NULL,
  `dept_lookup_flag` varchar(255) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `duplicate_flag` varchar(255) DEFAULT NULL,
  `exceptionreason` varchar(255) DEFAULT NULL,
  `frieght_term` varchar(255) DEFAULT NULL,
  `icoming_type` varchar(255) DEFAULT NULL,
  `invoice_amount` varchar(255) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `invoice_sub_total` varchar(255) DEFAULT NULL,
  `last_upade_date` datetime DEFAULT NULL,
  `lastupdtm` datetime NOT NULL,
  `lastupuser` varchar(255) DEFAULT NULL,
  `paymentterms` varchar(255) DEFAULT NULL,
  `po_lookup_flag` varchar(255) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `po_type` varchar(255) DEFAULT NULL,
  `po_vcost` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `queue_id` varchar(255) DEFAULT NULL,
  `returnmailcategory` varchar(255) DEFAULT NULL,
  `scandate` datetime DEFAULT NULL,
  `tax_flag` varchar(255) DEFAULT NULL,
  `vendor_address01` varchar(255) DEFAULT NULL,
  `vendor_address02` varchar(255) DEFAULT NULL,
  `vendor_city` varchar(255) DEFAULT NULL,
  `vendor_class` varchar(255) DEFAULT NULL,
  `vendor_lookup_flag` varchar(255) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `vendor_number` varchar(255) DEFAULT NULL,
  `vendor_state` varchar(255) DEFAULT NULL,
  `vendor_zip_4` varchar(255) DEFAULT NULL,
  `vendor_zip_5` varchar(255) DEFAULT NULL,
  `wfremovedate` datetime DEFAULT NULL,
  `workflowstartdate` datetime NOT NULL,
  `workflowstatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ixsd_cefs100101`
--

LOCK TABLES `ixsd_cefs100101` WRITE;
/*!40000 ALTER TABLE `ixsd_cefs100101` DISABLE KEYS */;
INSERT INTO `ixsd_cefs100101` VALUES ('1','1',1,'cefs100101','Chennai','xyz ltd','HT001','0','1','INR','2016-01-22 11:44:38','SLS','SLS','PO','0','ewewewew','FR','EMAIL','20000','2016-01-22 00:00:00','HT0123','20000','2016-01-22 11:44:38','2016-01-22 11:44:38','1','CASH','PO','PH01323456','CR','20000','1','0','0','0','2016-01-22 00:00:00','TAX','abc ,defg','abc ,defg','palakkad','WHLSLR','WH','VNAME','123456','Kerala','232323','4423232','2016-01-22 11:44:38','2016-01-22 11:44:38','0');
/*!40000 ALTER TABLE `ixsd_cefs100101` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ixsd_cefs100103`
--

DROP TABLE IF EXISTS `ixsd_cefs100103`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixsd_cefs100103` (
  `uid` varchar(255) NOT NULL,
  `din` varchar(255) NOT NULL,
  `efs_uin` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `lastupdtm` datetime NOT NULL,
  `branch_location` varchar(255) DEFAULT NULL,
  `claimedby` varchar(255) DEFAULT NULL,
  `company_code` varchar(255) DEFAULT NULL,
  `credit_category` varchar(255) DEFAULT NULL,
  `credit_original_invoice` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `department_code` varchar(255) DEFAULT NULL,
  `dept_lookup_flag` varchar(255) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `duplicate_flag` varchar(255) DEFAULT NULL,
  `exceptionreason` varchar(255) DEFAULT NULL,
  `frieght_term` varchar(255) DEFAULT NULL,
  `icoming_type` varchar(255) DEFAULT NULL,
  `invoice_amount` varchar(255) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `invoice_sub_total` varchar(255) DEFAULT NULL,
  `last_upade_date` datetime DEFAULT NULL,
  `lastupuser` varchar(255) DEFAULT NULL,
  `paymentterms` varchar(255) DEFAULT NULL,
  `po_lookup_flag` varchar(255) DEFAULT NULL,
  `po_number` varchar(255) DEFAULT NULL,
  `po_type` varchar(255) DEFAULT NULL,
  `po_vcost` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `queue_id` varchar(255) DEFAULT NULL,
  `returnmailcategory` varchar(255) DEFAULT NULL,
  `Scandate` datetime DEFAULT NULL,
  `tax_flag` varchar(255) DEFAULT NULL,
  `vendor_address01` varchar(255) DEFAULT NULL,
  `vendor_address02` varchar(255) DEFAULT NULL,
  `vendor_city` varchar(255) DEFAULT NULL,
  `vendor_class` varchar(255) DEFAULT NULL,
  `vendor_lookup_flag` varchar(255) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `vendor_number` varchar(255) DEFAULT NULL,
  `vendor_state` varchar(255) DEFAULT NULL,
  `vendor_zip_4` varchar(255) DEFAULT NULL,
  `vendor_zip_5` varchar(255) DEFAULT NULL,
  `wfremovedate` datetime DEFAULT NULL,
  `workflowstartdate` datetime DEFAULT NULL,
  `workflowstatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ixsd_cefs100103`
--

LOCK TABLES `ixsd_cefs100103` WRITE;
/*!40000 ALTER TABLE `ixsd_cefs100103` DISABLE KEYS */;
INSERT INTO `ixsd_cefs100103` VALUES ('1','2','cefs100103',1,'2015-10-10 10:10:10','Pattambi','INS','Comp code','credit','original invoice','currency','2015-10-10 10:10:10','dept code','dept lookup flag','NPO','dupli flag','reason','frieght term','incoming type','76','2015-10-10 10:10:10','098','87','2015-10-10 10:10:10','1','payment terms','po lookup flag','99','po','89','high','waiting','0','return','2015-10-10 10:10:10','tax flag','address1','address2','city','class','vendor flag','vendor name','89','state','zip4','zip5','2015-10-10 10:10:10','2015-10-10 10:10:10','0'),('1','2','cefs100103',1,'2015-10-10 10:10:10','Pattambi','INS','Comp code','credit','original invoice','currency','2015-10-10 10:10:10','dept code','dept lookup flag','NPO','dupli flag','reason','frieght term','incoming type','76','2015-10-10 10:10:10','098','87','2015-10-10 10:10:10','1','payment terms','po lookup flag','99','po','89','high','waiting','0','return','2015-10-10 10:10:10','tax flag','address1','address2','city','class','vendor flag','vendor name','89','state','zip4','zip5','2015-10-10 10:10:10','2015-10-10 10:10:10','0'),('1','2','cefs100103',1,'2015-10-10 10:10:10','Pattambi','INS','Comp code','credit','original invoice','currency','2015-10-10 10:10:10','dept code','dept lookup flag','NPO','dupli flag','reason','frieght term','incoming type','76','2015-10-10 10:10:10','098','87','2015-10-10 10:10:10','1','payment terms','po lookup flag','99','po','89','high','waiting','0','return','2015-10-10 10:10:10','tax flag','address1','address2','city','class','vendor flag','vendor name','89','state','zip4','zip5','2015-10-10 10:10:10','2015-10-10 10:10:10','0'),('1','2','cefs100103',1,'2015-10-10 10:10:10','Pattambi','INS','Comp code','credit','original invoice','currency','2015-10-10 10:10:10','dept code','dept lookup flag','NPO','dupli flag','reason','frieght term','incoming type','76','2015-10-10 10:10:10','098','87','2015-10-10 10:10:10','1','payment terms','po lookup flag','99','po','89','high','waiting','0','return','2015-10-10 10:10:10','tax flag','address1','address2','city','class','vendor flag','vendor name','89','state','zip4','zip5','2015-10-10 10:10:10','2015-10-10 10:10:10','0'),('1','2','cefs100103',1,'2015-10-10 10:10:10','Pattambi','INS','Comp code','credit','original invoice','currency','2015-10-10 10:10:10','dept code','dept lookup flag','NPO','dupli flag','reason','frieght term','incoming type','76','2015-10-10 10:10:10','098','87','2015-10-10 10:10:10','1','payment terms','po lookup flag','99','po','89','high','waiting','0','return','2015-10-10 10:10:10','tax flag','address1','address2','city','class','vendor flag','vendor name','89','state','zip4','zip5','2015-10-10 10:10:10','2015-10-10 10:10:10','0');
/*!40000 ALTER TABLE `ixsd_cefs100103` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ixsd_cefs100101_exception`
--

DROP TABLE IF EXISTS `ixsd_cefs100101_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixsd_cefs100101_exception` (
  `uid` varchar(255) DEFAULT '0',
  `din` varchar(255) NOT NULL DEFAULT '0',
  `efs_uin` varchar(255) DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `lastupdtm` datetime NOT NULL DEFAULT '2016-10-10 00:00:00',
  `exception_datetime` datetime DEFAULT '2016-10-10 00:00:00',
  `excepionreason` varchar(255) DEFAULT NULL,
  `exceptioncategory` varchar(255) DEFAULT NULL,
  `line_item_exception_reason` varchar(255) DEFAULT NULL,
  `descrepancy_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ixsd_cefs100101_exception`
--

LOCK TABLES `ixsd_cefs100101_exception` WRITE;
/*!40000 ALTER TABLE `ixsd_cefs100101_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `ixsd_cefs100101_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cflob`
--

DROP TABLE IF EXISTS `cflob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cflob` (
  `efslob_id` char(6) NOT NULL,
  `form_bclass` char(5) DEFAULT NULL,
  `form_bsource` char(3) DEFAULT NULL,
  `form_type` varchar(45) DEFAULT NULL,
  `form_stencid` char(9) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`efslob_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cflob`
--

LOCK TABLES `cflob` WRITE;
/*!40000 ALTER TABLE `cflob` DISABLE KEYS */;
INSERT INTO `cflob` VALUES ('cf1001','INDUS','EDI','enroll','HAA000010','1','2015-10-12 12:19:50'),('cf1002','INDUS','EDI',' HCFA','HAA000011','1','2015-10-12 12:19:50'),('cf1003','INDUS','EDI',' AP-PO','HAA000012','1','2015-10-12 12:19:50'),('cf1004','INDUS','FRM','NONPO','HAA000013','1','2015-10-12 12:19:50'),('cf1005','INDUS','FRM','UB','HAA000014','1','2015-10-12 12:19:50'),('cf1006','INDUS','EDI','DENTAL','HAA000015','1','2015-10-12 12:19:50'),('cf1007','INDUS','EDI','EOB','HAA000016','1','2015-10-12 12:19:50'),('cf1008','INDUS','EDI','LOANS-RES','HAA000017','1','2015-10-12 12:19:50'),('cf1009','INDUS','EDI','LOANS-COM','HAA000018','1','2015-10-12 12:19:50');
/*!40000 ALTER TABLE `cflob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` char(18) NOT NULL,
  `role_description` char(18) DEFAULT NULL,
  `role_homepage` char(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `XPKRoles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('1','Admin','\'pages/hethistudio/admin/admin_home.html\''),('2','Artist','\'pages/hethistudio/artist/artist_home.html\''),('3','User','\'pages/hethi/home_page.html\''),('4','Manager','\'pages/hethi/home_page.html\''),('5','Supervisor','\'pages/hethi/home_page.html\''),('6','Operator','\'pages/hethi/home_page.html\'');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dupload_file`
--

DROP TABLE IF EXISTS `dupload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupload_file` (
  `upload_id` bigint(20) NOT NULL COMMENT 'dUpload_File (split upload data )\\n',
  `file_id` bigint(20) NOT NULL COMMENT 'auto increment\\n',
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(20) NOT NULL COMMENT '.zip, .rar etc\\n',
  `file_location` varchar(255) NOT NULL COMMENT 'physical path\\n',
  `file_size` int(11) NOT NULL,
  `file_status` int(11) NOT NULL COMMENT '0-valid, 1-invalid, 2-corrupted\\n',
  `efs_uin` char(10) DEFAULT NULL COMMENT 'ciconnector_efs .efs_uin\\\\n',
  `lastupuser` int(11) NOT NULL COMMENT 'user ID audit trail\\\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  `stencil_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`upload_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload_file`
--

LOCK TABLES `dupload_file` WRITE;
/*!40000 ALTER TABLE `dupload_file` DISABLE KEYS */;
INSERT INTO `dupload_file` VALUES (1,1,'apple_mac1452849724567.pdf','pdf','http://localhost:2687/images/uploads/apple_mac1452849724567.jpg',171769,0,'cefs100101',3,'2016-01-15 12:22:05',3),(11,1,'Example_002_A4.jpg','jpg','http://localhost:2687/images/email/Example_002_A4.jpg',171198,0,'cefs100101',1,'2016-01-15 16:25:24',7),(11,2,'invoice_31452863712014.jpg','jpg','http://localhost:5050/images/uploads/invoice_31452863712014.jpg',130504,0,'cefs100101',3,'2016-01-15 16:15:15',2),(13,1,'Example_002_A41452867246874.jpg','jpg','http://localhost:2687/images/uploads/Example_002_A41452867246874.jpg',125104,0,'cefs100101',3,'2016-01-15 17:14:13',2),(14,1,'Example_0041453536734114.jpg','jpg','http://localhost:4141/images/uploads/Example_0041453536734114.jpg',130504,3,'cefs100101',3,'2016-01-23 11:12:16',8);
/*!40000 ALTER TABLE `dupload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer`
--

DROP TABLE IF EXISTS `dcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `business_address` int(11) NOT NULL,
  `business_email` varchar(50) DEFAULT NULL,
  `business_fax` varchar(50) DEFAULT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer`
--

LOCK TABLES `dcustomer` WRITE;
/*!40000 ALTER TABLE `dcustomer` DISABLE KEYS */;
INSERT INTO `dcustomer` VALUES (1,'Hethi','Hethi',1,'saifudheen@cronyco.in','1234556','Hethi-Contact','+919446383031');
/*!40000 ALTER TABLE `dcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_complianceaspect`
--

DROP TABLE IF EXISTS `dcustomer_complianceaspect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_complianceaspect` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `industry_compliance` int(11) NOT NULL,
  `information_security` int(11) NOT NULL,
  `data_shipment_file_name` int(11) NOT NULL,
  `customer_din_format` int(11) NOT NULL,
  `hethi_din_format` int(11) NOT NULL,
  `data_archival_period` int(11) NOT NULL COMMENT 'significance?',
  `image_archival_period` int(11) NOT NULL,
  `data_retention_period` datetime NOT NULL,
  `image_retention_period` datetime NOT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'User ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'autofill server date and time zone',
  PRIMARY KEY (`customer_id`,`tfs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_complianceaspect`
--

LOCK TABLES `dcustomer_complianceaspect` WRITE;
/*!40000 ALTER TABLE `dcustomer_complianceaspect` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomer_complianceaspect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_workset_connect`
--

DROP TABLE IF EXISTS `package_workset_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package_workset_connect` (
  `Package_ID` char(18) NOT NULL,
  `Rule_Workset_ID` char(18) NOT NULL,
  PRIMARY KEY (`Package_ID`,`Rule_Workset_ID`),
  UNIQUE KEY `XPKPackage_Workset_Connect` (`Package_ID`,`Rule_Workset_ID`),
  KEY `R_36` (`Rule_Workset_ID`),
  CONSTRAINT `R_35` FOREIGN KEY (`Package_ID`) REFERENCES `package` (`Package_ID`),
  CONSTRAINT `R_36` FOREIGN KEY (`Rule_Workset_ID`) REFERENCES `rule_workset` (`Rule_Workset_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_workset_connect`
--

LOCK TABLES `package_workset_connect` WRITE;
/*!40000 ALTER TABLE `package_workset_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `package_workset_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_imageaspect`
--

DROP TABLE IF EXISTS `dcustomer_imageaspect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_imageaspect` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `layout` int(11) NOT NULL,
  `image_size` int(11) NOT NULL COMMENT 'minimum size in KB',
  `standard_dpi` int(11) NOT NULL,
  `min_acceptable_dpi` int(11) NOT NULL COMMENT 'user ID audit trial',
  `avg_pages_form` int(11) NOT NULL,
  `avg_pageds_form_bundle` int(11) NOT NULL,
  `total_form_fields` int(11) NOT NULL,
  `avg_character_fields` int(11) NOT NULL,
  `avg_character_form` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_imageaspect`
--

LOCK TABLES `dcustomer_imageaspect` WRITE;
/*!40000 ALTER TABLE `dcustomer_imageaspect` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomer_imageaspect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cindustry_offering`
--

DROP TABLE IF EXISTS `cindustry_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cindustry_offering` (
  `indus_id` char(6) NOT NULL,
  `indus_service` varchar(50) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`indus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cindustry_offering`
--

LOCK TABLES `cindustry_offering` WRITE;
/*!40000 ALTER TABLE `cindustry_offering` DISABLE KEYS */;
INSERT INTO `cindustry_offering` VALUES ('ci1001','Retail','1','2015-10-12 12:19:50'),('ci1002','Healthcare','1','2015-10-12 12:19:50'),('ci1003','Banking','1','2015-10-12 12:19:50'),('ci1004','Insurance','1','2015-10-12 12:19:50'),('ci1005','Manufacturing','1','2015-10-12 12:19:50'),('ci1006','Telecom','1','2015-10-12 12:19:50');
/*!40000 ALTER TABLE `cindustry_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drole`
--

DROP TABLE IF EXISTS `drole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drole` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `role_id` int(11) NOT NULL COMMENT 'auto generated',
  `role_name` varchar(50) NOT NULL,
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drole`
--

LOCK TABLES `drole` WRITE;
/*!40000 ALTER TABLE `drole` DISABLE KEYS */;
INSERT INTO `drole` VALUES (1,1,'Business Admin','2015-10-16 11:10:10'),(1,2,'Business Artist','2015-10-16 11:10:10'),(1,3,'Business Customer','2015-10-16 11:10:10'),(1,4,'Manager','2015-10-16 11:10:10'),(1,5,'Supervisor','2015-10-16 11:10:10'),(1,6,'Operator','2015-10-16 11:10:10');
/*!40000 ALTER TABLE `drole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciconnector_efs`
--

DROP TABLE IF EXISTS `ciconnector_efs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciconnector_efs` (
  `efs_uin` char(10) NOT NULL,
  `BpaaS_id` char(10) DEFAULT NULL,
  `indus_id` char(6) DEFAULT NULL,
  `efslob_id` char(8) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciconnector_efs`
--

LOCK TABLES `ciconnector_efs` WRITE;
/*!40000 ALTER TABLE `ciconnector_efs` DISABLE KEYS */;
INSERT INTO `ciconnector_efs` VALUES ('cefs100101','ch100101','ci1001','cf100101','1','2015-10-12 12:19:50'),('cefs100102','ch100101','ci1002','cf100102','1','2015-10-12 12:19:50'),('cefs100103','ch100101','ci1003','cf100103','1','2015-10-12 12:19:50'),('cefs100104','ch100101','ci1004','cf100104','1','2015-10-12 12:19:50'),('cefs100105','ch100102','ci1005','cf100105','1','2015-10-12 12:19:50'),('cefs100106','ch100102','ci1001','cf100106','1','2015-10-12 12:19:50'),('cefs100107','ch100102','ci1003','cf100107','1','2015-10-12 12:19:50'),('cefs100108','ch100102','ch1003','cf100108','1','2015-10-12 12:19:50'),('cefs100109','ch100103','ci1006','cf100109','1','2015-10-12 12:19:50'),('cefs100110','ch100103','ci1005','cf100110','1','2015-10-12 12:19:50'),('cefs100111','ch100103','ci1001','cf100111','1','2015-10-12 12:19:50'),('cefs100112','ch100104','ci1006','cf100112','1','2015-10-12 12:19:50'),('cefs100113','ch100104','ci1003','cf100113','1','2015-10-12 12:19:50'),('cefs100114','ch100105','ci1004','cf100114','1','2015-10-12 12:19:50'),('cefs100115','ch100105','ci1005','cf100115','1','2015-10-12 12:19:50'),('cefs100116','ch100101','ci1001','cf100102','1','2015-10-12 12:19:50');
/*!40000 ALTER TABLE `ciconnector_efs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cownersocial`
--

DROP TABLE IF EXISTS `cownersocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cownersocial` (
  `efslobowner_id` char(8) NOT NULL,
  `efs_addressid` char(6) DEFAULT NULL,
  `socialtype` varchar(50) DEFAULT NULL,
  `socialid` varchar(50) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`efslobowner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cownersocial`
--

LOCK TABLES `cownersocial` WRITE;
/*!40000 ALTER TABLE `cownersocial` DISABLE KEYS */;
INSERT INTO `cownersocial` VALUES ('HAA00001','1','WhatsApp','1234567890','Root','2015-10-30 15:43:00');
/*!40000 ALTER TABLE `cownersocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efs_field`
--

DROP TABLE IF EXISTS `efs_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efs_field` (
  `eFS_Field_Id` char(18) NOT NULL,
  `eFs_Field_Name` char(18) DEFAULT NULL,
  `eFs__Field_Description` char(18) DEFAULT NULL,
  `eFs__Field_Data_Type` char(18) DEFAULT NULL,
  `eFS_ID` char(18) NOT NULL,
  `Input_Source_Id` char(18) NOT NULL,
  PRIMARY KEY (`eFS_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  UNIQUE KEY `XPKeFs_Field` (`eFS_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  KEY `R_1` (`eFS_ID`,`Input_Source_Id`),
  CONSTRAINT `R_1` FOREIGN KEY (`eFS_ID`, `Input_Source_Id`) REFERENCES `efs` (`eFS_ID`, `Input_Source_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efs_field`
--

LOCK TABLES `efs_field` WRITE;
/*!40000 ALTER TABLE `efs_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `efs_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_output`
--

DROP TABLE IF EXISTS `dcustomer_output`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_output` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer',
  `tfs_uin` char(10) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `efs_uin` char(10) NOT NULL COMMENT 'form type',
  `uid` varchar(255) NOT NULL COMMENT 'ixsd_cefs100101 (form table).uid',
  `din` varchar(255) NOT NULL COMMENT 'ixsd_cefs100101 (form table).din',
  `version` varchar(255) NOT NULL COMMENT 'ixsd_cefs100101 (form table).version',
  `type` char(10) NOT NULL COMMENT 'output type',
  `file_location` varchar(200) NOT NULL COMMENT 'http location of output file',
  `file_content` text NOT NULL COMMENT 'contentof output file',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`tfs_uin`,`efs_uin`,`uid`,`din`,`version`,`lastupdtm`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_output`
--

LOCK TABLES `dcustomer_output` WRITE;
/*!40000 ALTER TABLE `dcustomer_output` DISABLE KEYS */;
INSERT INTO `dcustomer_output` VALUES (1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286219436.xml','','RNT01','2016-01-20 16:09:04'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286219436_ixml.xml','','RNT01','2016-01-20 16:09:05'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286225269.xml','','RNT01','2016-01-20 16:09:10'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286225269_ixml.xml','','RNT01','2016-01-20 16:09:10'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286851628.xml','','RNT01','2016-01-20 16:19:37'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286851628_ixml.xml','','RNT01','2016-01-20 16:19:37'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286858608.xml','','RNT01','2016-01-20 16:19:44'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286858608_ixml.xml','','RNT01','2016-01-20 16:19:44'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453349637724.xml','','RNT01','2016-01-21 09:46:06'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453349637724_ixml.xml','','RNT01','2016-01-21 09:46:10'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453349679506.xml','','RNT01','2016-01-21 09:46:47'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453349679506_ixml.xml','','RNT01','2016-01-21 09:46:47'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453351306800.xml','','RNT01','2016-01-21 10:13:55'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453351306800_ixml.xml','','RNT01','2016-01-21 10:13:58'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453351346307.xml','','RNT01','2016-01-21 10:14:33'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453351346307_ixml.xml','','RNT01','2016-01-21 10:14:34'),(1,'','cefs100101','1','1','1','HML','D:/Workspace/source/hareesh/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453372558412.xml','','RNT01','2016-01-21 13:35:58'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453363582046.xml','','RNT01','2016-01-21 13:38:28'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453363582046_ixml.xml','','RNT01','2016-01-21 13:38:29'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453363589247.xml','','RNT01','2016-01-21 13:38:35'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453363589247_ixml.xml','','RNT01','2016-01-21 13:38:35'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453366342341.xml','','RNT01','2016-01-21 14:24:29'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453366342341_ixml.xml','','RNT01','2016-01-21 14:24:29'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453366347899.xml','','RNT01','2016-01-21 14:24:34'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453366347899_ixml.xml','','RNT01','2016-01-21 14:24:34'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367038018.xml','','RNT01','2016-01-21 14:36:04'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367038018_ixml.xml','','RNT01','2016-01-21 14:36:05'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367043775.xml','','RNT01','2016-01-21 14:36:10'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367043775_ixml.xml','','RNT01','2016-01-21 14:36:10'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367596130.xml','','RNT01','2016-01-21 14:45:23'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367596130_ixml.xml','','RNT01','2016-01-21 14:45:23'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367602480.xml','','RNT01','2016-01-21 14:45:29'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367602480_ixml.xml','','RNT01','2016-01-21 14:45:29'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453437868084.xml','','RNT01','2016-01-22 10:16:35'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453437868084_ixml.xml','','RNT01','2016-01-22 10:16:36'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453437877567.xml','','RNT01','2016-01-22 10:16:44'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453437877567_ixml.xml','','RNT01','2016-01-22 10:16:44'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453438156892.xml','','RNT01','2016-01-22 10:21:24'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453438156892_ixml.xml','','RNT01','2016-01-22 10:21:24'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453438164004.xml','','RNT01','2016-01-22 10:21:31'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453438164004_ixml.xml','','RNT01','2016-01-22 10:21:31'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453439671912.xml','','RNT01','2016-01-22 10:46:41'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453439671912_ixml.xml','','RNT01','2016-01-22 10:46:43'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453439706201.xml','','RNT01','2016-01-22 10:47:15'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453439706201_ixml.xml','','RNT01','2016-01-22 10:47:15'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440454637.xml','','RNT01','2016-01-22 10:59:43'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440454637_ixml.xml','','RNT01','2016-01-22 10:59:46'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440482035.xml','','RNT01','2016-01-22 11:00:10'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440482035_ixml.xml','','RNT01','2016-01-22 11:00:10'),(1,'','cefs100101','1','1','1','HML','D:/Workspace/source/saifudheen/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449886474.xml','','RNT01','2016-01-22 11:04:46'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440825819.xml','','RNT01','2016-01-22 11:05:56'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440825819_ixml.xml','','RNT01','2016-01-22 11:06:02'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440910204.xml','','RNT01','2016-01-22 11:07:20'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440910204_ixml.xml','','RNT01','2016-01-22 11:07:21'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453441991890.xml','','RNT01','2016-01-22 11:25:21'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453441991890_ixml.xml','','RNT01','2016-01-22 11:25:24'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453442739226.xml','','RNT01','2016-01-22 11:37:47'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453442739226_ixml.xml','','RNT01','2016-01-22 11:37:47'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453442748791.xml','','RNT01','2016-01-22 11:37:56'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453442748791_ixml.xml','','RNT01','2016-01-22 11:37:56'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453443793192.xml','','RNT01','2016-01-22 11:55:20'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453443793192_ixml.xml','','RNT01','2016-01-22 11:55:21'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453443799479.xml','','RNT01','2016-01-22 11:55:27'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453443799479_ixml.xml','','RNT01','2016-01-22 11:55:27'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444579860.xml','','RNT01','2016-01-22 12:08:27'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444579860_ixml.xml','','RNT01','2016-01-22 12:08:27'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444585819.xml','','RNT01','2016-01-22 12:08:33'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444585819_ixml.xml','','RNT01','2016-01-22 12:08:33'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444858479.xml','','RNT01','2016-01-22 12:13:06'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444858479_ixml.xml','','RNT01','2016-01-22 12:13:06'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444864909.xml','','RNT01','2016-01-22 12:13:12'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444864909_ixml.xml','','RNT01','2016-01-22 12:13:12'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448164497.xml','','RNT01','2016-01-22 13:08:12'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448164497_ixml.xml','','RNT01','2016-01-22 13:08:12'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448170896.xml','','RNT01','2016-01-22 13:08:18'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448170896_ixml.xml','','RNT01','2016-01-22 13:08:18'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448724464.xml','','RNT01','2016-01-22 13:17:32'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448724464_ixml.xml','','RNT01','2016-01-22 13:17:32'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448730325.xml','','RNT01','2016-01-22 13:17:38'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448730325_ixml.xml','','RNT01','2016-01-22 13:17:38'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448781982.xml','','RNT01','2016-01-22 13:18:29'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448781982_ixml.xml','','RNT01','2016-01-22 13:18:29'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448787029.xml','','RNT01','2016-01-22 13:18:34'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448787029_ixml.xml','','RNT01','2016-01-22 13:18:34'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449283625.xml','','RNT01','2016-01-22 13:26:51'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449283625_ixml.xml','','RNT01','2016-01-22 13:26:51'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449289537.xml','','RNT01','2016-01-22 13:26:57'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449289537_ixml.xml','','RNT01','2016-01-22 13:26:57'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450375543.xml','','RNT01','2016-01-22 13:45:03'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450375543_ixml.xml','','RNT01','2016-01-22 13:45:03'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450381630.xml','','RNT01','2016-01-22 13:45:09'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450381630_ixml.xml','','RNT01','2016-01-22 13:45:09'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450866318.xml','','RNT01','2016-01-22 13:53:14'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450866318_ixml.xml','','RNT01','2016-01-22 13:53:14'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450872232.xml','','RNT01','2016-01-22 13:53:20'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450872232_ixml.xml','','RNT01','2016-01-22 13:53:20'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453451110647.xml','','RNT01','2016-01-22 13:57:18'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453451110647_ixml.xml','','RNT01','2016-01-22 13:57:18'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453451116625.xml','','RNT01','2016-01-22 13:57:24'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453451116625_ixml.xml','','RNT01','2016-01-22 13:57:24'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453454694297.xml','','RNT01','2016-01-22 14:57:02'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453454694297_ixml.xml','','RNT01','2016-01-22 14:57:03'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453454700231.xml','','RNT01','2016-01-22 14:57:08'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453454700231_ixml.xml','','RNT01','2016-01-22 14:57:08'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453460345162.xml','','RNT01','2016-01-22 16:31:14'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453460345162_ixml.xml','','RNT01','2016-01-22 16:31:14'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453460351295.xml','','RNT01','2016-01-22 16:31:20'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453460351295_ixml.xml','','RNT01','2016-01-22 16:31:20'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453462866247.xml','','RNT01','2016-01-22 17:13:15'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453462866247_ixml.xml','','RNT01','2016-01-22 17:13:15'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453462872605.xml','','RNT01','2016-01-22 17:13:21'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453462872605_ixml.xml','','RNT01','2016-01-22 17:13:21');
/*!40000 ALTER TABLE `dcustomer_output` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clookup`
--

DROP TABLE IF EXISTS `clookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clookup` (
  `lookup_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with lk, 100101. example : lk100101',
  `lookup_mode` varchar(15) NOT NULL COMMENT 'email/ftps/sftp/webupload/webservice',
  `content_id` char(6) NOT NULL COMMENT 'cContent.content_id (cvs/xlsx/xls/xml/json/sql)',
  `lookup_xsd` text NOT NULL COMMENT 'source details as a schema',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`lookup_id`,`lookup_mode`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clookup`
--

LOCK TABLES `clookup` WRITE;
/*!40000 ALTER TABLE `clookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `clookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_calendar`
--

DROP TABLE IF EXISTS `dcustomer_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_calendar` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `weekday_start` int(11) NOT NULL COMMENT 'auto generated',
  `weekday_end` int(11) NOT NULL COMMENT 'clanguage:language_id',
  `lastupuser` int(11) NOT NULL COMMENT 'user ID audit trial',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`weekday_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_calendar`
--

LOCK TABLES `dcustomer_calendar` WRITE;
/*!40000 ALTER TABLE `dcustomer_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomer_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1_vendormaster_lookup`
--

DROP TABLE IF EXISTS `1_vendormaster_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1_vendormaster_lookup` (
  `id` bigint(20) DEFAULT NULL,
  `name` text,
  `mark` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1_vendormaster_lookup`
--

LOCK TABLES `1_vendormaster_lookup` WRITE;
/*!40000 ALTER TABLE `1_vendormaster_lookup` DISABLE KEYS */;
INSERT INTO `1_vendormaster_lookup` VALUES (1,'Hethi-Admin',100),(2,'Hethi-Artist',100),(3,'Hethi-user',100);
/*!40000 ALTER TABLE `1_vendormaster_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efs_field_property`
--

DROP TABLE IF EXISTS `efs_field_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efs_field_property` (
  `Property_ID` char(18) NOT NULL,
  `Property_Name` char(18) DEFAULT NULL,
  `Property_length` char(18) DEFAULT NULL,
  `Rule_ID` char(18) NOT NULL,
  `Rule_Workset_ID` char(18) NOT NULL,
  PRIMARY KEY (`Property_ID`,`Rule_ID`,`Rule_Workset_ID`),
  UNIQUE KEY `XPKefs_Field_Property` (`Property_ID`,`Rule_ID`,`Rule_Workset_ID`),
  KEY `R_19` (`Rule_ID`,`Rule_Workset_ID`),
  CONSTRAINT `R_19` FOREIGN KEY (`Rule_ID`, `Rule_Workset_ID`) REFERENCES `rule` (`Rule_ID`, `Rule_Workset_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efs_field_property`
--

LOCK TABLES `efs_field_property` WRITE;
/*!40000 ALTER TABLE `efs_field_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `efs_field_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_upload`
--

DROP TABLE IF EXISTS `dcustomer_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_upload` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer\\n',
  `upload_id` bigint(20) NOT NULL COMMENT 'dupload.upload_id',
  `business_artist` bigint(20) DEFAULT NULL COMMENT 'userid of business artist\\\\n',
  `assigneddtm` datetime NOT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  PRIMARY KEY (`customer_id`,`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_upload`
--

LOCK TABLES `dcustomer_upload` WRITE;
/*!40000 ALTER TABLE `dcustomer_upload` DISABLE KEYS */;
INSERT INTO `dcustomer_upload` VALUES (1,1,NULL,'2016-01-15 12:22:50','1','2016-01-15 12:22:04'),(1,2,NULL,'2016-01-15 15:36:16','1','2016-01-15 15:36:16'),(1,3,NULL,'2016-01-15 15:44:48','1','2016-01-15 15:44:48'),(1,4,NULL,'2016-01-15 15:47:35','1','2016-01-15 15:47:35'),(1,5,NULL,'2016-01-15 15:49:11','1','2016-01-15 15:49:11'),(1,6,NULL,'2016-01-15 15:56:56','1','2016-01-15 15:56:56'),(1,7,NULL,'2016-01-15 16:00:04','1','2016-01-15 16:00:04'),(1,8,NULL,'2016-01-15 16:09:52','1','2016-01-15 16:09:52'),(1,9,NULL,'2016-01-15 16:11:19','1','2016-01-15 16:11:19'),(1,10,NULL,'2016-01-15 16:16:32','1','2016-01-15 16:15:12'),(1,11,NULL,'2016-01-15 17:21:12','1','2016-01-15 16:25:17'),(1,12,NULL,'2016-01-15 16:31:04','1','2016-01-15 16:31:04'),(1,13,NULL,'2016-01-15 17:14:06','1','2016-01-15 17:14:06'),(1,14,NULL,'2016-01-23 11:12:14','1','2016-01-23 11:12:14');
/*!40000 ALTER TABLE `dcustomer_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccore_manage_offering`
--

DROP TABLE IF EXISTS `ccore_manage_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccore_manage_offering` (
  `manage_id` char(6) NOT NULL,
  `manage_service` varchar(20) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`manage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccore_manage_offering`
--

LOCK TABLES `ccore_manage_offering` WRITE;
/*!40000 ALTER TABLE `ccore_manage_offering` DISABLE KEYS */;
/*!40000 ALTER TABLE `ccore_manage_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cownercommn`
--

DROP TABLE IF EXISTS `cownercommn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cownercommn` (
  `efslobowner_id` char(8) NOT NULL,
  `efs_addressid` char(6) NOT NULL,
  `Address Type` varchar(20) DEFAULT NULL,
  `address 1` varchar(50) DEFAULT NULL,
  `address 2` varchar(50) DEFAULT NULL,
  `cust_country` char(3) DEFAULT NULL,
  `cust_loc_zip` varchar(10) DEFAULT NULL,
  `GPS_coordinate` varchar(200) DEFAULT NULL,
  `owneremail` varchar(50) DEFAULT NULL,
  `business_Tel` varchar(30) DEFAULT NULL,
  `business Fax` varchar(30) DEFAULT NULL,
  `socialtype` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `linkedin` varchar(50) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`efslobowner_id`,`efs_addressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cownercommn`
--

LOCK TABLES `cownercommn` WRITE;
/*!40000 ALTER TABLE `cownercommn` DISABLE KEYS */;
INSERT INTO `cownercommn` VALUES ('HAA00001','1','Main office ',NULL,NULL,'IND','600028',NULL,'OWNER@EMAIL.COM',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cownercommn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomercommn`
--

DROP TABLE IF EXISTS `dcustomercommn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomercommn` (
  `addressid` bigint(20) NOT NULL COMMENT 'auto fill',
  `address_type` varchar(20) DEFAULT NULL COMMENT 'main office/branch',
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `cust_country` char(10) DEFAULT NULL COMMENT 'connect to country master',
  `cust_loc_zip` varchar(10) DEFAULT NULL COMMENT 'zipcode is must as this helps in geo help ',
  `gps_coordinate` varchar(200) DEFAULT NULL COMMENT 'gmap coordinate to be stored',
  `contact_email` varchar(50) DEFAULT NULL COMMENT 'email,primary contact. email as mode of social login',
  `contact_tel` varchar(30) DEFAULT NULL,
  `contact_fax` varchar(30) DEFAULT NULL,
  `socialtype` varchar(50) DEFAULT NULL COMMENT 'whats app. Ability to register with whatsapp, recv and send info for click to chat',
  `whatsapp` varchar(50) DEFAULT NULL COMMENT 'connect to country master',
  `linkedin` varchar(50) DEFAULT NULL COMMENT 'Zipcode is must as this helps in geo help',
  `lastupuser` int(11) DEFAULT NULL COMMENT 'userid auto trial',
  `lastupdtm` datetime DEFAULT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`addressid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomercommn`
--

LOCK TABLES `dcustomercommn` WRITE;
/*!40000 ALTER TABLE `dcustomercommn` DISABLE KEYS */;
INSERT INTO `dcustomercommn` VALUES (1,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876544','linkedin',1,'2016-01-23 17:35:19'),(3,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:12'),(5,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:12'),(7,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:13'),(9,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:13'),(11,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:14'),(13,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:14'),(15,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:15'),(17,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:15'),(19,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:15'),(21,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:16'),(23,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:16'),(25,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:16'),(26,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:36'),(27,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:36'),(28,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:36'),(29,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:37'),(30,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:37'),(31,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:38'),(32,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:39'),(33,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:39'),(34,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:40'),(35,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:41'),(36,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:44'),(37,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:44'),(38,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:44'),(39,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:44'),(40,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:45'),(41,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:45'),(42,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:45'),(43,'','Cronyco','Cronyco','India','','','saifudheen@cronyco.in','','','','','',1,'2016-01-25 17:44:45');
/*!40000 ALTER TABLE `dcustomercommn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomer_document_history`
--

DROP TABLE IF EXISTS `dcustomer_document_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomer_document_history` (
  `uin` varchar(10) NOT NULL,
  `din` varchar(10) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `upload_id` bigint(20) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `tfs_uin` varchar(10) DEFAULT NULL,
  `efs_uin` varchar(10) DEFAULT NULL,
  `mxml` text,
  `mxml_location` varchar(100) DEFAULT NULL,
  `lastupuser` varchar(10) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`uin`,`din`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer_document_history`
--

LOCK TABLES `dcustomer_document_history` WRITE;
/*!40000 ALTER TABLE `dcustomer_document_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomer_document_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chethi_services`
--

DROP TABLE IF EXISTS `chethi_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chethi_services` (
  `hethi_service_id` char(10) NOT NULL COMMENT 'total 6 characters. Starts with ch, 100101. example : ch100101',
  `service_id` char(10) NOT NULL COMMENT 'FK.  cCore_services.service_id',
  `hethi_servicecode` varchar(10) NOT NULL COMMENT 'DaaS, BaaS, OaaS, IaaS, AaaS,StaaS',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`hethi_service_id`,`service_id`),
  UNIQUE KEY `hethi_servicecode_UNIQUE` (`hethi_servicecode`),
  KEY `service_id_idx` (`service_id`),
  CONSTRAINT `service_id` FOREIGN KEY (`service_id`) REFERENCES `ccore_services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chethi_services`
--

LOCK TABLES `chethi_services` WRITE;
/*!40000 ALTER TABLE `chethi_services` DISABLE KEYS */;
INSERT INTO `chethi_services` VALUES ('ch100101','cs100101','DaaS','Root','2015-10-15 11:03:33'),('ch100102','cs100102','BaaS','Root','2015-10-15 11:03:33'),('ch100103','cs100103','OaaS','Root','2015-10-15 11:03:33'),('ch100104','cs100104','IaaS','Root','2015-10-15 11:03:33'),('ch100105','cs100103','AaaS','Root','2015-10-15 11:03:33'),('ch100106','cs100103','StaaS','Root','2015-10-15 00:00:00');
/*!40000 ALTER TABLE `chethi_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cworkflowqueue`
--

DROP TABLE IF EXISTS `cworkflowqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cworkflowqueue` (
  `queue_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `queue_name` varchar(50) NOT NULL,
  `queue_type` char(3) NOT NULL COMMENT 'MAN-manual, SYS-system, ERR-error',
  `queue_desc` varchar(255) DEFAULT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`queue_id`),
  UNIQUE KEY `queue_name_UNIQUE` (`queue_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cworkflowqueue`
--

LOCK TABLES `cworkflowqueue` WRITE;
/*!40000 ALTER TABLE `cworkflowqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cworkflowqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classifydasswor`
--

DROP TABLE IF EXISTS `classifydasswor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classifydasswor` (
  `classifydasswor_did` char(10) NOT NULL,
  `daaswor_modeid` char(10) DEFAULT NULL,
  `efs_uin` char(10) DEFAULT NULL,
  `daasworqmode_idx` varchar(50) DEFAULT NULL,
  `indexclassifytoextract_val` varchar(200) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`classifydasswor_did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classifydasswor`
--

LOCK TABLES `classifydasswor` WRITE;
/*!40000 ALTER TABLE `classifydasswor` DISABLE KEYS */;
INSERT INTO `classifydasswor` VALUES ('cice100101','cm100101','1','invoiceno','12,200','1','2015-10-19 00:00:00');
/*!40000 ALTER TABLE `classifydasswor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbatchparam`
--

DROP TABLE IF EXISTS `cbatchparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbatchparam` (
  `param_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with rl, 100101. example : rl100101\\n',
  `zone_id` char(6) NOT NULL COMMENT 'cZone.zone_id\\n',
  `param_name` varchar(255) NOT NULL COMMENT 'year, month, day, separator,\\n',
  `param_xsd` text NOT NULL COMMENT 'source of pXSD as a schema\\n',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  PRIMARY KEY (`param_id`,`zone_id`,`param_name`),
  UNIQUE KEY `param_name_UNIQUE` (`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbatchparam`
--

LOCK TABLES `cbatchparam` WRITE;
/*!40000 ALTER TABLE `cbatchparam` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbatchparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uicindustry_offering`
--

DROP TABLE IF EXISTS `uicindustry_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uicindustry_offering` (
  `indus_id` char(6) NOT NULL COMMENT 'cindustry_offering.indus_id\\n',
  `industry_decription_short` char(50) DEFAULT NULL,
  `industry_decription_long` char(250) DEFAULT NULL,
  `industry_image_id` char(250) DEFAULT NULL COMMENT 'ui_images.image_id\\n',
  `industry_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`indus_id`),
  UNIQUE KEY `XPKIndustry` (`indus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uicindustry_offering`
--

LOCK TABLES `uicindustry_offering` WRITE;
/*!40000 ALTER TABLE `uicindustry_offering` DISABLE KEYS */;
INSERT INTO `uicindustry_offering` VALUES ('ci1001','Retail','Retail','101',1),('ci1002','Healthcare','Healthcare','102',1),('ci1003','Banking','Banking','103',1),('ci1004','Insurance','Insurance','104',1),('ci1005','Manufacturing','Manufacturing','105',1),('ci1006','Telecom','Telecom','106',1);
/*!40000 ALTER TABLE `uicindustry_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctransport_ui`
--

DROP TABLE IF EXISTS `ctransport_ui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctransport_ui` (
  `transport_id` char(6) NOT NULL,
  `transport_decription_short` varchar(45) DEFAULT NULL,
  `transport_decription_long` varchar(250) DEFAULT NULL,
  `transport_image_id` varchar(250) DEFAULT NULL,
  `transport_status` char(6) DEFAULT NULL,
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctransport_ui`
--

LOCK TABLES `ctransport_ui` WRITE;
/*!40000 ALTER TABLE `ctransport_ui` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctransport_ui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daaswor_mode`
--

DROP TABLE IF EXISTS `daaswor_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daaswor_mode` (
  `daaswor_modeid` char(8) NOT NULL,
  `efs_uin` char(10) DEFAULT NULL,
  `daaswor_qmode` varchar(50) DEFAULT NULL,
  `DaaSwor_active` char(1) DEFAULT NULL,
  `Daaswor_seq` int(11) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`daaswor_modeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daaswor_mode`
--

LOCK TABLES `daaswor_mode` WRITE;
/*!40000 ALTER TABLE `daaswor_mode` DISABLE KEYS */;
INSERT INTO `daaswor_mode` VALUES ('cm100101','1','indexclassifytoextract','Y',1,'1','2015-10-19 00:00:00'),('cm100102','1','indexclassifysplitmerge','Y',2,'1','2015-10-19 00:00:00'),('cm100103','1','indexclassifyreject','Y',3,'1','2015-10-19 00:00:00'),('cm100104','1','indexclassifykey','Y',4,'1','2015-10-19 00:00:00');
/*!40000 ALTER TABLE `daaswor_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efs`
--

DROP TABLE IF EXISTS `efs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efs` (
  `eFS_ID` char(18) NOT NULL,
  `eFs_name` char(18) DEFAULT NULL,
  `eFs__Desc` char(18) DEFAULT NULL,
  `Input_Source_Id` char(18) NOT NULL,
  PRIMARY KEY (`eFS_ID`,`Input_Source_Id`),
  UNIQUE KEY `XPKeFs` (`eFS_ID`,`Input_Source_Id`),
  KEY `R_24` (`Input_Source_Id`),
  CONSTRAINT `R_24` FOREIGN KEY (`Input_Source_Id`) REFERENCES `inputsource` (`Input_Source_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efs`
--

LOCK TABLES `efs` WRITE;
/*!40000 ALTER TABLE `efs` DISABLE KEYS */;
/*!40000 ALTER TABLE `efs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uicbpaas_service_offering`
--

DROP TABLE IF EXISTS `uicbpaas_service_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uicbpaas_service_offering` (
  `BpaaS_id` char(18) NOT NULL COMMENT 'cBPaaS_service_offering.BpaaS_id\\n',
  `BpaaS_service_image_id` int(11) DEFAULT '1' COMMENT 'ui_images.image_id\\n',
  `BpaaS_service_description_short` char(50) DEFAULT NULL,
  `BpaaS_service_description_long` varchar(250) DEFAULT NULL,
  `BpaaS_service_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`BpaaS_id`),
  UNIQUE KEY `XPKBusiness_Process` (`BpaaS_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uicbpaas_service_offering`
--

LOCK TABLES `uicbpaas_service_offering` WRITE;
/*!40000 ALTER TABLE `uicbpaas_service_offering` DISABLE KEYS */;
INSERT INTO `uicbpaas_service_offering` VALUES ('ch100101',1,'invoice process to pay','invoice process to pay',1),('ch100102',2,'claims process to pay','claims process to pay',1),('ch100103',3,'loans to classify','loans to classify',1),('ch100104',4,'books to ePUB','books to ePUB',1),('ch100105',5,'enroll, onboard to pay','enroll, onboard to pay',1);
/*!40000 ALTER TABLE `uicbpaas_service_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ixsd_cefs100101_lineitem`
--

DROP TABLE IF EXISTS `ixsd_cefs100101_lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixsd_cefs100101_lineitem` (
  `uid` varchar(255) NOT NULL,
  `din` varchar(255) NOT NULL,
  `efs_uin` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `lastupdtm` datetime NOT NULL,
  `sequence_no` int(11) NOT NULL,
  `part_description` varchar(255) DEFAULT NULL,
  `po_extended_price` double DEFAULT NULL,
  `po_line_items` varchar(255) DEFAULT NULL,
  `po_line_number` int(11) DEFAULT NULL,
  `po_ordered_price` double DEFAULT NULL,
  `po_ordered_quantity` int(11) DEFAULT NULL,
  `po_part_number` int(11) DEFAULT NULL,
  `po_pool` varchar(255) DEFAULT NULL,
  `po_uom` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ixsd_cefs100101_lineitem`
--

LOCK TABLES `ixsd_cefs100101_lineitem` WRITE;
/*!40000 ALTER TABLE `ixsd_cefs100101_lineitem` DISABLE KEYS */;
INSERT INTO `ixsd_cefs100101_lineitem` VALUES ('1','1','cefs100101',1,'2016-01-22 11:44:42',1,'part decription line item one ',100,'1',1,100,1,0,'1','1','1'),('1','1','cefs100101',1,'2016-01-22 11:44:42',2,'part decription line item two ',200,'2',2,200,2,0,'2','2','2'),('1','1','cefs100101',1,'2016-01-22 11:44:42',3,'part decription line item three ',300,'3',3,300,3,0,'3','3','3');
/*!40000 ALTER TABLE `ixsd_cefs100101_lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hethi_offers_details`
--

DROP TABLE IF EXISTS `hethi_offers_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hethi_offers_details` (
  `offer_id` int(11) NOT NULL,
  `sfs_uin` varchar(100) NOT NULL,
  PRIMARY KEY (`offer_id`,`sfs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hethi_offers_details`
--

LOCK TABLES `hethi_offers_details` WRITE;
/*!40000 ALTER TABLE `hethi_offers_details` DISABLE KEYS */;
INSERT INTO `hethi_offers_details` VALUES (5,'csfs10000'),(5,'csfs100101'),(5,'csfs100102'),(5,'csfs100120'),(6,'csfs10000'),(6,'csfs100101'),(6,'csfs100102'),(6,'csfs100103'),(7,'csfs10000'),(8,'csfs10000'),(8,'csfs100101'),(8,'csfs100103'),(8,'csfs100105'),(8,'csfs100120'),(8,'csfs100121'),(8,'csfs100141'),(8,'csfs100142'),(8,'csfs100160'),(8,'csfs100162'),(8,'csfs100163'),(9,'csfs10000'),(9,'csfs100101'),(9,'csfs100140'),(9,'csfs100160'),(9,'csfs100161'),(10,'csfs10000'),(10,'csfs100101'),(10,'csfs100102'),(10,'csfs100103'),(10,'csfs100140'),(10,'csfs100141'),(10,'csfs100160'),(10,'csfs100161'),(11,'csfs100102'),(11,'csfs100103'),(11,'csfs100120'),(11,'csfs100121'),(11,'csfs100140'),(11,'csfs100141'),(11,'csfs100142'),(12,'csfs10000'),(12,'csfs100141'),(12,'csfs100142'),(12,'csfs100144'),(12,'csfs100160'),(12,'csfs100161'),(12,'csfs100162'),(13,'csfs10000'),(13,'csfs100120'),(13,'csfs100121'),(13,'csfs100160'),(14,'csfs10000'),(14,'csfs100101'),(14,'csfs100102'),(14,'csfs100160'),(14,'csfs100161');
/*!40000 ALTER TABLE `hethi_offers_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlookupdatamapper`
--

DROP TABLE IF EXISTS `tlookupdatamapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlookupdatamapper` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer',
  `efslob_id` char(6) NOT NULL COMMENT 'cflob.efslob_id',
  `lookup_id` char(6) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `lookup_key` varchar(255) NOT NULL COMMENT 'key to be looked up from reference data',
  `lookup_value_xpath` varchar(255) NOT NULL COMMENT 'xpath to looked up from reference data',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`efslob_id`,`lookup_id`,`lookup_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlookupdatamapper`
--

LOCK TABLES `tlookupdatamapper` WRITE;
/*!40000 ALTER TABLE `tlookupdatamapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlookupdatamapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup`
--

DROP TABLE IF EXISTS `lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup` (
  `Lookup_Id` char(18) NOT NULL,
  `Lookup_name` char(18) DEFAULT NULL,
  `Lookup_Desc` char(18) DEFAULT NULL,
  `Lookup_type` char(18) DEFAULT NULL,
  `Lookup_Ref` char(18) DEFAULT NULL,
  PRIMARY KEY (`Lookup_Id`),
  UNIQUE KEY `XPKLookup` (`Lookup_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup`
--

LOCK TABLES `lookup` WRITE;
/*!40000 ALTER TABLE `lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ixsd_cefs100103_exception`
--

DROP TABLE IF EXISTS `ixsd_cefs100103_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixsd_cefs100103_exception` (
  `uid` varchar(255) NOT NULL,
  `din` varchar(255) NOT NULL,
  `efs_uin` varchar(255) NOT NULL,
  `version` bigint(20) NOT NULL,
  `lastupdtm` datetime NOT NULL,
  `exception_datetime` datetime NOT NULL,
  `excepionreason` varchar(255) DEFAULT NULL,
  `exceptioncategory` varchar(255) DEFAULT NULL,
  `line_item_exception_reason` varchar(255) DEFAULT NULL,
  `descrepancy_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ixsd_cefs100103_exception`
--

LOCK TABLES `ixsd_cefs100103_exception` WRITE;
/*!40000 ALTER TABLE `ixsd_cefs100103_exception` DISABLE KEYS */;
INSERT INTO `ixsd_cefs100103_exception` VALUES ('1','1','cefs100103',1,'2015-10-10 10:10:10','2015-10-10 10:10:10','reason','category','line item ','descrepancy'),('1','1','cefs100103',1,'2015-10-10 10:10:10','2015-10-10 10:10:10','reason','category','line item ','descrepancy'),('1','1','cefs100103',1,'2015-10-10 10:10:10','2015-10-10 10:10:10','reason','category','line item ','descrepancy');
/*!40000 ALTER TABLE `ixsd_cefs100103_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendormaster_lookup`
--

DROP TABLE IF EXISTS `vendormaster_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendormaster_lookup` (
  `name` varchar(255) NOT NULL,
  `id` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  PRIMARY KEY (`name`,`id`,`mark`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendormaster_lookup`
--

LOCK TABLES `vendormaster_lookup` WRITE;
/*!40000 ALTER TABLE `vendormaster_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendormaster_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efs_connect`
--

DROP TABLE IF EXISTS `efs_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efs_connect` (
  `eFS_ID` char(18) NOT NULL,
  `Customer_Id` char(18) NOT NULL,
  `eFs_name` char(18) DEFAULT NULL,
  `eFs__Desc` char(18) DEFAULT NULL,
  `eFs__single_page_type` char(18) DEFAULT NULL,
  `eFs__standard_Non_standard` char(18) DEFAULT NULL,
  `eFs_BarCode` char(18) DEFAULT NULL,
  `eFs_BandW` char(18) DEFAULT NULL,
  `eFs_DPI` char(18) DEFAULT NULL,
  `eFs_Standard_Resuse` char(18) DEFAULT NULL,
  `Input_Source_Id` char(18) NOT NULL,
  PRIMARY KEY (`eFS_ID`,`Customer_Id`,`Input_Source_Id`),
  UNIQUE KEY `XPKeFs_Source_Detail` (`eFS_ID`,`Customer_Id`,`Input_Source_Id`),
  KEY `R_2` (`eFS_ID`,`Input_Source_Id`),
  KEY `R_3` (`Customer_Id`),
  CONSTRAINT `R_2` FOREIGN KEY (`eFS_ID`, `Input_Source_Id`) REFERENCES `efs` (`eFS_ID`, `Input_Source_Id`),
  CONSTRAINT `R_3` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efs_connect`
--

LOCK TABLES `efs_connect` WRITE;
/*!40000 ALTER TABLE `efs_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `efs_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uiccore_serviceplays`
--

DROP TABLE IF EXISTS `uiccore_serviceplays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uiccore_serviceplays` (
  `serviceplay_id` char(10) NOT NULL COMMENT 'cCore_serviceplays.serviceplay_id\\\\n',
  `serviceplay_decription_short` varchar(45) DEFAULT NULL,
  `serviceplay_decription_long` varchar(250) DEFAULT NULL,
  `serviceplay_image_id` varchar(250) DEFAULT NULL COMMENT 'ui_images.image_id\\n',
  `serviceplay_status` char(6) DEFAULT NULL,
  PRIMARY KEY (`serviceplay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uiccore_serviceplays`
--

LOCK TABLES `uiccore_serviceplays` WRITE;
/*!40000 ALTER TABLE `uiccore_serviceplays` DISABLE KEYS */;
INSERT INTO `uiccore_serviceplays` VALUES ('csp100101','Classify media to customer Integration','Classify media to customer','1','1'),('csp100102','Classify index Integration','Classify index','1','1'),('csp100103','Classify split-merge Integration','DaaS.split-merge','1','1'),('csp100104','Classify keywise Integration','Classify keywise','1','1'),('csp100105','Baas Workflow Integration','Baas Workflow','1','1'),('csp100106','Baas Reject Integration','Baas Reject','1','1'),('csp100107','Oaas HML Integration','Oaas HML','1','1'),('csp100108','Oaas ANSI Integration','Oaas ANSI','1','1'),('csp100109','Oaas EDIFACT Integration','Oaas EDIFACT','1','1'),('csp100110','Oaas DELIMITED Integration','Oaas DELIMITED','1','1'),('csp100111','Oaas PROP Integration','Oaas PROP','1','1'),('csp100112','Iaas SAP Integration','Iaas SAP','1','1'),('csp100113','Iaas Lawson Integration','Iaas Lawson','1','1'),('csp100114','Iaas OracleFusion Integration','Iaas OracleFusion','1','1'),('csp100115','Iaas BAAN Integration','Iaas BAAN','1','1'),('csp100116','Staas MetaData Integration','Staas MetaData','1','1'),('csp100117','Staas Image Integration','Staas Image','1','1'),('csp100118','Aaas Summary Report Integration','Aaas  Summary Report','1','1'),('csp100119','Aaas Reconciliation Report Integration','Aaas  Reconciliation Report','1','1'),('csp100120','Aaas  Shipment Report Integration','Aaas  Shipment Report','1','1'),('csp100121','Aaas Detailed Shipment Report Integration','Aaas Detailed Shipment Report','1','1'),('csp100122','Aaas Email Report Integration','Aaas Email Report','1','1'),('csp100123','Aaas Fax Report Integration','Aaas Fax Report','1','1'),('csp100124','Aaas Billing Report Integration','Aaas Billing Report','1','1'),('csp100125','Aaas PO Match Rate Report Integration','Aaas PO Match Rate Report','1','1'),('csp100126','Aaas EDI Report Integration','Aaas EDI Report','1','1'),('csp100127','Aaas workflow Reports Integration','Aaas workflow Reports','1','1'),('csp100128','Aaas Activity Aging Report Integration','Aaas Activity Aging Report','1','1'),('csp100129','Aaas Exception Report Integration','Aaas Exception Report','1','1'),('csp100130','Aaas  Performance Report Integration','Aaas  Performance Report','1','1'),('csp100131','Aaas  Work Item Detail Report Integration','Aaas  Work Item Detail Report','1','1'),('csp100132','Aaas  Workflow Work In Progress (WIP) Report ','Aaas  Workflow Work In Progress (WIP) Report','1','1'),('csp100133','Aaas Audit Trail Report Integration','Aaas Audit Trail Report','1','1'),('csp100134','Aaas Productivity Report Integration','Aaas Productivity Report','1','1'),('csp100135','Aaas. Inventory Report Integration','Aaas. Inventory Report','1','1'),('csp100136','Aaas  Absentee Delegation Report Integration','Aaas  Absentee Delegation Report','1','1'),('csp100137','Aaas  Re-Assign Report Integration','Aaas  Re-Assign Report','1','1'),('csp100138','Aaas  Re-Route Report Integration','Aaas  Re-Route Report','1','1'),('csp100139','Aaas  WorkItem History Report Integration','Aaas  WorkItem History Report','1','1');
/*!40000 ALTER TABLE `uiccore_serviceplays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1_approvalgrid_lookup`
--

DROP TABLE IF EXISTS `1_approvalgrid_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1_approvalgrid_lookup` (
  `cid` int(10) NOT NULL,
  `vendorname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1_approvalgrid_lookup`
--

LOCK TABLES `1_approvalgrid_lookup` WRITE;
/*!40000 ALTER TABLE `1_approvalgrid_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `1_approvalgrid_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clanguage`
--

DROP TABLE IF EXISTS `clanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clanguage` (
  `language_id` char(6) NOT NULL COMMENT 'eg:In10001',
  `language_name` varchar(20) NOT NULL COMMENT 'auto generated',
  `lastupuser` char(6) NOT NULL,
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`language_id`,`language_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clanguage`
--

LOCK TABLES `clanguage` WRITE;
/*!40000 ALTER TABLE `clanguage` DISABLE KEYS */;
INSERT INTO `clanguage` VALUES ('1','Malayalam','1','2015-10-29 10:10:10'),('2','English','1','2015-10-29 10:10:10'),('3','Tamil','1','2015-10-29 10:10:10');
/*!40000 ALTER TABLE `clanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efs_field_stencil`
--

DROP TABLE IF EXISTS `efs_field_stencil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efs_field_stencil` (
  `efs_Field_Id` char(18) NOT NULL DEFAULT '',
  `eFs_Start_Co` char(18) DEFAULT NULL,
  `eFs_End_Co` char(18) DEFAULT NULL,
  `eFS_ID` char(18) NOT NULL,
  `Input_Source_Id` char(18) NOT NULL,
  `eFs_Stencil_Id` char(18) NOT NULL,
  PRIMARY KEY (`efs_Field_Id`,`eFs_Stencil_Id`,`eFS_ID`,`Input_Source_Id`),
  UNIQUE KEY `XPKeFs_Field_Stencil` (`efs_Field_Id`,`eFs_Stencil_Id`,`eFS_ID`,`Input_Source_Id`),
  KEY `R_31` (`efs_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  CONSTRAINT `R_31` FOREIGN KEY (`efs_Field_Id`, `eFS_ID`, `Input_Source_Id`) REFERENCES `efs_field` (`eFS_Field_Id`, `eFS_ID`, `Input_Source_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efs_field_stencil`
--

LOCK TABLES `efs_field_stencil` WRITE;
/*!40000 ALTER TABLE `efs_field_stencil` DISABLE KEYS */;
/*!40000 ALTER TABLE `efs_field_stencil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciconnector_rules`
--

DROP TABLE IF EXISTS `ciconnector_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciconnector_rules` (
  `rule_uin` char(10) NOT NULL COMMENT 'total 10 characters. Starts with cefs, 100101. example :  rule100101. ',
  `rule_package_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with pk, 100101. example : pk100101',
  `workset_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with ws, 100101. example : ws100101',
  `rule_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with rl, 100101. example : rl100101',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`rule_uin`,`rule_package_id`,`workset_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciconnector_rules`
--

LOCK TABLES `ciconnector_rules` WRITE;
/*!40000 ALTER TABLE `ciconnector_rules` DISABLE KEYS */;
INSERT INTO `ciconnector_rules` VALUES ('rule100101','pk1001','ws1001','rl1001','Root','2015-11-03 12:06:05'),('rule100102','pk1001','ws1001','rl1002','Root','2015-11-03 12:06:05'),('rule100103','pk1001','ws1002','rl1001','Root','2015-11-04 15:05:14'),('rule100104','pk1001','ws1002','rl1002','Root','2015-11-04 15:05:14'),('rule100105','pk1001','ws1003','rl1001','1','2015-11-26 15:15:42'),('rule100106','pk1001','ws1003','rl1002','1','2015-11-26 15:44:56'),('rule100107','pk1001','ws1003','rl1003','1','2015-11-26 15:45:11'),('rule100108','pk1001','ws1004','rl1004','1','2015-11-26 15:44:56'),('rule100109','pk1001','ws1004','rl1005','1','2015-12-16 14:18:43'),('rule100110','pk1001','ws1008','rl1006','1','2016-01-06 17:44:35'),('rule100111','pk1001','ws1009','rl1007','1','2016-01-06 17:44:57'),('rule100112','pk1001','ws1010','rl1008','1','2016-01-06 17:45:05'),('rule100113','pk1001','ws1011','rl1009','1','2016-01-06 17:45:41'),('rule100114','pk1001','ws1012','rl1006','1','2016-01-10 13:14:20'),('rule100115','pk1001','ws1013','rl1007','1','2016-01-10 13:18:28'),('rule100116','pk1001','ws1014','rl1008','1','2016-01-10 13:23:40'),('rule100117','pk1001','ws1015','rl1009','1','2016-01-10 16:43:55'),('rule100118','pk1001','ws1016','rl1010','1','2016-01-10 16:57:06'),('rule100119','pk1001','ws1017','rl1011','1','2016-01-10 17:16:36'),('rule100120','pk1001','ws1018','rl1012','1','2016-01-12 11:10:18'),('rule100121','pk1001','ws1019','rl1013','1','2016-01-12 11:13:20'),('rule100122','pk1001','ws1020','rl1014','1','2016-01-12 11:31:54'),('rule100123','pk1001','ws1021','rl1015','1','2016-01-12 11:32:33'),('rule100124','pk1001','ws1022','rl1016','1','2016-01-12 11:35:32'),('rule100125','pk1001','ws1023','rl1017','1','2016-01-12 11:42:04'),('rule100126','pk1001','ws1024','rl1018','1','2016-01-12 11:54:32'),('rule100127','pk1001','ws1025','rl1019','1','2016-01-12 13:38:34'),('rule100128','pk1001','ws1026','rl1020','1','2016-01-12 16:18:34'),('rule100129','pk1001','ws1027','rl1021','1','2016-01-18 16:25:21'),('rule100130','pk1001','ws1028','rl1022','1','2016-01-18 16:53:34'),('rule100131','pk1001','ws1029','rl1023','1','2016-01-18 16:57:23'),('rule100132','pk1001','ws1030','rl1024','1','2016-01-18 16:58:39'),('rule100133','pk1001','ws1031','rl1025','1','2016-01-18 16:59:35'),('rule100134','pk1001','ws1032','rl1026','1','2016-01-18 17:02:08'),('rule100135','pk1001','ws1033','rl1027','1','2016-01-22 11:03:23');
/*!40000 ALTER TABLE `ciconnector_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `efs_field_connect`
--

DROP TABLE IF EXISTS `efs_field_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efs_field_connect` (
  `eFS_Field_Id` char(18) NOT NULL,
  `eFs_Property_ID` char(18) DEFAULT NULL,
  `Property_ID` char(18) NOT NULL,
  `eFS_ID` char(18) NOT NULL,
  `Input_Source_Id` char(18) NOT NULL,
  `eFs_Index` char(18) DEFAULT NULL,
  `eFs_lookup` char(18) DEFAULT NULL,
  `Lookup_Id` char(18) NOT NULL,
  `Rule_Workset_ID` char(18) NOT NULL,
  `eFs_Stencil_Id` char(18) NOT NULL,
  PRIMARY KEY (`eFS_Field_Id`,`Property_ID`,`Lookup_Id`,`Rule_Workset_ID`,`Input_Source_Id`,`eFS_ID`,`eFs_Stencil_Id`),
  UNIQUE KEY `XPKeFs_Field_detail` (`eFS_Field_Id`,`Property_ID`,`Lookup_Id`,`Rule_Workset_ID`,`Input_Source_Id`,`eFS_ID`,`eFs_Stencil_Id`),
  KEY `R_20` (`Property_ID`,`eFs_Stencil_Id`,`Rule_Workset_ID`),
  KEY `R_21` (`eFs_Stencil_Id`,`Rule_Workset_ID`),
  KEY `R_23` (`eFS_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  KEY `R_26` (`Lookup_Id`),
  KEY `R_32` (`eFS_Field_Id`,`eFs_Stencil_Id`,`eFS_ID`,`Input_Source_Id`),
  CONSTRAINT `R_20` FOREIGN KEY (`Property_ID`, `eFs_Stencil_Id`, `Rule_Workset_ID`) REFERENCES `efs_field_property` (`Property_ID`, `Rule_ID`, `Rule_Workset_ID`),
  CONSTRAINT `R_21` FOREIGN KEY (`eFs_Stencil_Id`, `Rule_Workset_ID`) REFERENCES `rule` (`Rule_ID`, `Rule_Workset_ID`),
  CONSTRAINT `R_23` FOREIGN KEY (`eFS_Field_Id`, `eFS_ID`, `Input_Source_Id`) REFERENCES `efs_field` (`eFS_Field_Id`, `eFS_ID`, `Input_Source_Id`),
  CONSTRAINT `R_26` FOREIGN KEY (`Lookup_Id`) REFERENCES `lookup` (`Lookup_Id`),
  CONSTRAINT `R_32` FOREIGN KEY (`eFS_Field_Id`, `eFs_Stencil_Id`, `eFS_ID`, `Input_Source_Id`) REFERENCES `efs_field_stencil` (`efs_Field_Id`, `eFs_Stencil_Id`, `eFS_ID`, `Input_Source_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `efs_field_connect`
--

LOCK TABLES `efs_field_connect` WRITE;
/*!40000 ALTER TABLE `efs_field_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `efs_field_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification_connect`
--

DROP TABLE IF EXISTS `classification_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification_connect` (
  `Classfication_ID` char(18) DEFAULT NULL,
  `WorkSet_ID` char(18) DEFAULT NULL,
  `Classification_ID` char(18) NOT NULL,
  `eFS_Field_Id` char(18) NOT NULL,
  `eFS_ID` char(18) NOT NULL,
  `Input_Source_Id` char(18) NOT NULL,
  PRIMARY KEY (`Classification_ID`,`eFS_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  UNIQUE KEY `XPKClassification_Connect` (`Classification_ID`,`eFS_Field_Id`,`eFS_ID`,`Input_Source_Id`),
  CONSTRAINT `R_34` FOREIGN KEY (`Classification_ID`, `eFS_Field_Id`, `eFS_ID`, `Input_Source_Id`) REFERENCES `classification` (`Classification_ID`, `eFs_Field_Id`, `eFS_ID`, `Input_Source_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification_connect`
--

LOCK TABLES `classification_connect` WRITE;
/*!40000 ALTER TABLE `classification_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `classification_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cjob_flow`
--

DROP TABLE IF EXISTS `cjob_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cjob_flow` (
  `current_job_id` int(11) NOT NULL,
  `next_job_id` int(11) NOT NULL,
  `result` varchar(45) DEFAULT NULL,
  `lastupuser` varchar(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`current_job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cjob_flow`
--

LOCK TABLES `cjob_flow` WRITE;
/*!40000 ALTER TABLE `cjob_flow` DISABLE KEYS */;
INSERT INTO `cjob_flow` VALUES (1,2,'1','1','2015-11-14 12:23:45'),(2,4,'1','1','2015-11-14 12:23:45'),(4,5,'1','1','2015-11-14 12:23:45'),(5,6,'1','1','2015-11-14 12:23:45'),(6,3,'1','1','2015-11-14 12:23:45');
/*!40000 ALTER TABLE `cjob_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ccore_services`
--

DROP TABLE IF EXISTS `ccore_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ccore_services` (
  `service_id` char(10) NOT NULL COMMENT 'total 6 characters. Starts with cs, 100101. example : cs100101',
  `master_service` varchar(50) NOT NULL COMMENT 'capture, manage, deliver, integrate',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `master_service_UNIQUE` (`master_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ccore_services`
--

LOCK TABLES `ccore_services` WRITE;
/*!40000 ALTER TABLE `ccore_services` DISABLE KEYS */;
INSERT INTO `ccore_services` VALUES ('cs100101','capture','Root','2015-10-15 11:03:33'),('cs100102','manage','Root','2015-10-15 11:03:33'),('cs100103','deliver','Root','2015-10-15 11:03:33'),('cs100104','integrate','Root','2015-10-15 11:03:33');
/*!40000 ALTER TABLE `ccore_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coreservices`
--

DROP TABLE IF EXISTS `coreservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coreservices` (
  `Core_ID` char(18) NOT NULL,
  `Core__name` char(18) DEFAULT NULL,
  `Core_Description` char(18) DEFAULT NULL,
  `Core_Active` char(18) DEFAULT NULL,
  `Core_Creation_date` char(18) DEFAULT NULL,
  PRIMARY KEY (`Core_ID`),
  UNIQUE KEY `XPKCoreServices` (`Core_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coreservices`
--

LOCK TABLES `coreservices` WRITE;
/*!40000 ALTER TABLE `coreservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `coreservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsoprules`
--

DROP TABLE IF EXISTS `dsoprules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dsoprules` (
  `sfs_uin` char(10) NOT NULL COMMENT 'csconnector.sfs_UIN',
  `efs_uin` char(10) NOT NULL,
  `queue_id` char(6) NOT NULL COMMENT 'cflobQueue.queue_id',
  `rule_uin` char(10) NOT NULL COMMENT 'ciconnector_rules.rule_uin',
  `zone_id` int(11) NOT NULL COMMENT 'tZone.zone_id',
  `rule_condition` varchar(255) NOT NULL,
  `rule_action` varchar(255) DEFAULT NULL,
  `rule_exception` char(6) DEFAULT NULL COMMENT 'what to do here?',
  `rule_workset` char(6) DEFAULT NULL COMMENT 'cRuleWorkset.workset_id',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`sfs_uin`,`queue_id`,`rule_uin`,`zone_id`,`efs_uin`),
  UNIQUE KEY `rule_condition_UNIQUE` (`rule_condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsoprules`
--

LOCK TABLES `dsoprules` WRITE;
/*!40000 ALTER TABLE `dsoprules` DISABLE KEYS */;
/*!40000 ALTER TABLE `dsoprules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duser`
--

DROP TABLE IF EXISTS `duser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duser` (
  `customer_id` int(11) NOT NULL COMMENT 'tcustomer:customer_id',
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(50) NOT NULL,
  `user_lastname` varchar(50) DEFAULT NULL,
  `user_prefix` varchar(45) DEFAULT NULL,
  `user_address` int(11) DEFAULT NULL COMMENT 'address:address_id',
  `role_id` int(11) DEFAULT '1' COMMENT 'drole.role_id',
  `user_login_id` varchar(50) NOT NULL,
  `user_login_password` varchar(50) NOT NULL,
  `lastupdtm` datetime NOT NULL COMMENT 'autofill system generated datetime',
  PRIMARY KEY (`customer_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duser`
--

LOCK TABLES `duser` WRITE;
/*!40000 ALTER TABLE `duser` DISABLE KEYS */;
INSERT INTO `duser` VALUES (1,1,'Hethi','Admin','Mr',1,1,'admin@hethi.com','password','2016-01-23 17:35:19'),(1,2,'Hethi','Artist','Mr',1,2,'artist@hethi.com','password','2015-10-16 11:10:10'),(1,3,'Hethi','User','Mr',1,3,'user@hethi.com','password','2015-10-16 11:10:10'),(1,4,'Hethi','Manager','Mr',1,4,'manager@hethi.com','password','2015-10-28 10:27:14'),(1,5,'Hethi','Supervisor','Mr',1,5,'supervisor@hethi.com','password','2015-10-28 10:28:34'),(1,6,'Hethi','Operator','Mr',1,6,'operator@hethi.com','password','2015-10-28 10:28:34');
/*!40000 ALTER TABLE `duser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog` (
  `Catlalog_id` char(18) DEFAULT NULL,
  `Catalog__name` char(18) DEFAULT NULL,
  `Catalog_Description` char(18) DEFAULT NULL,
  `BPS_ID` char(18) NOT NULL,
  `Industry_ID` char(18) NOT NULL DEFAULT '',
  `CoreServices_ID` char(18) DEFAULT NULL,
  `Hethi_Services_ID` char(18) DEFAULT NULL,
  `Catalog_Active` char(18) DEFAULT NULL,
  `Catalog_Cost_Range_From` char(18) DEFAULT NULL,
  `Catalog_Cost_Range_To` char(18) DEFAULT NULL,
  `Catalog_Creation_Date` char(18) DEFAULT NULL,
  `Core_ID` char(18) NOT NULL,
  `Hethi_Srv__Id` char(18) NOT NULL,
  PRIMARY KEY (`BPS_ID`,`Core_ID`,`Hethi_Srv__Id`,`Industry_ID`),
  UNIQUE KEY `XPKCatalog` (`BPS_ID`,`Core_ID`,`Hethi_Srv__Id`,`Industry_ID`),
  KEY `R_5` (`Core_ID`),
  KEY `R_6` (`Hethi_Srv__Id`),
  KEY `R_7` (`Industry_ID`),
  CONSTRAINT `R_4` FOREIGN KEY (`BPS_ID`) REFERENCES `business_process` (`BPS_ID`),
  CONSTRAINT `R_5` FOREIGN KEY (`Core_ID`) REFERENCES `coreservices` (`Core_ID`),
  CONSTRAINT `R_6` FOREIGN KEY (`Hethi_Srv__Id`) REFERENCES `hethiservices` (`Hethi_Srv__Id`),
  CONSTRAINT `R_7` FOREIGN KEY (`Industry_ID`) REFERENCES `industry` (`Industry_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worflow`
--

DROP TABLE IF EXISTS `worflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worflow` (
  `Workflow_Queue_ID` char(18) NOT NULL,
  `Working_Queu_name` char(18) DEFAULT NULL,
  `Workflow_Queue_desc` char(18) DEFAULT NULL,
  `Workflow_Queue_exception` char(18) DEFAULT NULL,
  PRIMARY KEY (`Workflow_Queue_ID`),
  UNIQUE KEY `XPKWorflow` (`Workflow_Queue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worflow`
--

LOCK TABLES `worflow` WRITE;
/*!40000 ALTER TABLE `worflow` DISABLE KEYS */;
INSERT INTO `worflow` VALUES ('1','P1','Process1',NULL),('2','P2','Process2',NULL),('3','P3','Process3',NULL),('4','P4','Process4',NULL),('5','P5','Process5',NULL);
/*!40000 ALTER TABLE `worflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_process`
--

DROP TABLE IF EXISTS `business_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_process` (
  `BPS_ID` char(6) NOT NULL,
  `BPS_name` varchar(100) DEFAULT NULL,
  `BPS_description` varchar(250) DEFAULT NULL,
  `BPS_Active` int(11) DEFAULT NULL,
  `BPS_creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`BPS_ID`),
  UNIQUE KEY `XPKBusiness_Process` (`BPS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_process`
--

LOCK TABLES `business_process` WRITE;
/*!40000 ALTER TABLE `business_process` DISABLE KEYS */;
INSERT INTO `business_process` VALUES ('1','invoice process to pay',NULL,1,'2015-10-12 12:19:50'),('2','claims process to pay',NULL,1,'2015-10-12 12:19:50'),('3','loans to classify',NULL,1,'2015-10-12 12:19:50'),('4','books to ePUB',NULL,1,'2015-10-12 12:19:50'),('5','enroll, onboard to pay',NULL,1,'2015-10-12 12:19:50');
/*!40000 ALTER TABLE `business_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ui_images`
--

DROP TABLE IF EXISTS `ui_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ui_images` (
  `image_id` int(11) NOT NULL,
  `image_type_id` int(11) DEFAULT NULL,
  `image_path` varchar(200) DEFAULT NULL,
  `image_alt_text` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ui_images`
--

LOCK TABLES `ui_images` WRITE;
/*!40000 ALTER TABLE `ui_images` DISABLE KEYS */;
INSERT INTO `ui_images` VALUES (1,1,'http://localhost:4141/images/bps/Invoice.jpg','invoice process to pay',1),(2,1,'http://localhost:4141/images/bps/claim.png','claims process to pay',1),(3,1,'http://localhost:4141/images/bps/loan.jpg','loans to classify',1),(4,1,'http://localhost:4141/images/bps/epub.png','books to ePUB',1),(5,1,'http://localhost:4141/images/bps/enrollment.png','enroll, onboard to pay',1),(101,1,'http://localhost:4141/images/industry/retail.jpg','Retail',1),(102,1,'http://localhost:4141/images/industry/healthcare.jpg','Healthcare',1),(103,1,'http://localhost:4141/images/industry/onlineBanking.jpg','Banking',1),(104,1,'http://localhost:4141/images/industry/lifeInsurance.jpg','Insurance',1),(105,1,'http://localhost:4141/images/industry/manufacturing.jpg','Manufacturing',1),(106,1,'http://localhost:4141/images/industry/telecom.jpg','Telecom',1),(201,1,'http://localhost:4141/images/industry/POInventory.jpg','enroll',1),(202,1,'http://localhost:4141/images/industry/poExpense.jpg',' HCFA',1),(203,1,'http://localhost:4141/images/ui/close_up_payment_account_text_cg6p1432796c_th.jpg',' AP-PO',1),(204,1,'http://localhost:4141/images/ui/shutterstock_219004666_1024x768_0.jpg','NONPO',1),(205,1,'http://localhost:4141/images/ui/UB_Logo_mark_Blue2.png','UB',1),(206,1,'http://localhost:4141/images/ui/DentalPatientforms.jpg','DENTAL',1),(207,1,'http://localhost:4141/images/ui/eob.png','EOB',1),(208,1,'http://localhost:4141/images/ui/homeloan_banner.jpg','LOANS-RES',1),(209,1,'http://localhost:4141/images/ui/loans.jpg','LOANS-COM',1);
/*!40000 ALTER TABLE `ui_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomerserviceplayqueue`
--

DROP TABLE IF EXISTS `dcustomerserviceplayqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomerserviceplayqueue` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer',
  `tfs_uin` char(10) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `efs_uin` char(10) NOT NULL,
  `sfs_uin` char(10) NOT NULL COMMENT 'csconnector.sfs_UIN',
  `queue_id` char(10) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `next_queue` char(10) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `exception_queue` char(10) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`tfs_uin`,`sfs_uin`,`queue_id`,`next_queue`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomerserviceplayqueue`
--

LOCK TABLES `dcustomerserviceplayqueue` WRITE;
/*!40000 ALTER TABLE `dcustomerserviceplayqueue` DISABLE KEYS */;
INSERT INTO `dcustomerserviceplayqueue` VALUES (1,'cefs100101','cefs100101','csfs100101','csfs100101','csfs10000','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100102','csfs100102','csfs100103','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100103','csfs100103','csfs100104','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100104','csfs100104','csfs100105','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100105','csfs100105','csfs100106','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100106','csfs100106','csfs100107','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100107','csfs100107','csfs100108','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100108','csfs100108','csfs100109','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100109','csfs100109','csfs100120','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100120','csfs100120','csfs100121','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100121','csfs100121','csfs100140','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100140','csfs100140','csfs100142','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100141','csfs100141','csfs10000','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100142','csfs100142','csfs100143','csfs10000','1','2016-01-22 11:03:23'),(1,'cefs100101','cefs100101','csfs100143','csfs100143','csfs100141','csfs10000','1','2016-01-22 11:03:23');
/*!40000 ALTER TABLE `dcustomerserviceplayqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomersocial`
--

DROP TABLE IF EXISTS `dcustomersocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomersocial` (
  `addressid` char(6) NOT NULL COMMENT 'dcustomercommn:address_id',
  `socialtype` varchar(50) NOT NULL COMMENT 'FB/linked',
  `socialid` varchar(50) NOT NULL COMMENT 'link/user id',
  `lastupuser` int(11) NOT NULL COMMENT 'userID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`addressid`,`socialtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomersocial`
--

LOCK TABLES `dcustomersocial` WRITE;
/*!40000 ALTER TABLE `dcustomersocial` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomersocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbatchparam`
--

DROP TABLE IF EXISTS `dbatchparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbatchparam` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer.customer_id\\n',
  `param_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with rl, 100101. example : rl100101\\n',
  `param_xml` text NOT NULL COMMENT 'xml or rule file which can derive a batch at given point of time. Should include sequencing as well\\n',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  PRIMARY KEY (`customer_id`,`param_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbatchparam`
--

LOCK TABLES `dbatchparam` WRITE;
/*!40000 ALTER TABLE `dbatchparam` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbatchparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dlookupdata`
--

DROP TABLE IF EXISTS `dlookupdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dlookupdata` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer',
  `efslob_id` char(6) NOT NULL COMMENT 'cflob.efslob_id',
  `lookup_id` char(6) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `lookup_data` text NOT NULL COMMENT 'data in json format',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `updateddtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`efslob_id`,`lookup_id`,`updateddtm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dlookupdata`
--

LOCK TABLES `dlookupdata` WRITE;
/*!40000 ALTER TABLE `dlookupdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `dlookupdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmarketplace`
--

DROP TABLE IF EXISTS `cmarketplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmarketplace` (
  `marketplace_ID` char(6) NOT NULL,
  `Makertplace_type` varchar(20) DEFAULT NULL,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` date DEFAULT NULL,
  PRIMARY KEY (`marketplace_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmarketplace`
--

LOCK TABLES `cmarketplace` WRITE;
/*!40000 ALTER TABLE `cmarketplace` DISABLE KEYS */;
INSERT INTO `cmarketplace` VALUES ('cm1001','community','Root','2015-10-30');
/*!40000 ALTER TABLE `cmarketplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_connect`
--

DROP TABLE IF EXISTS `rule_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_connect` (
  `Rule_ID` char(18) NOT NULL,
  `Rule_exception` char(18) DEFAULT NULL,
  `Rule_WF_Queue_Id` char(18) DEFAULT NULL,
  `Rule_Workset_ID` char(18) NOT NULL,
  `Workflow_Queue_ID` char(18) NOT NULL,
  PRIMARY KEY (`Rule_ID`,`Rule_Workset_ID`,`Workflow_Queue_ID`),
  UNIQUE KEY `XPKRule` (`Rule_ID`,`Rule_Workset_ID`,`Workflow_Queue_ID`),
  KEY `R_30` (`Workflow_Queue_ID`),
  CONSTRAINT `R_27` FOREIGN KEY (`Rule_ID`, `Rule_Workset_ID`) REFERENCES `rule` (`Rule_ID`, `Rule_Workset_ID`),
  CONSTRAINT `R_30` FOREIGN KEY (`Workflow_Queue_ID`) REFERENCES `worflow` (`Workflow_Queue_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_connect`
--

LOCK TABLES `rule_connect` WRITE;
/*!40000 ALTER TABLE `rule_connect` DISABLE KEYS */;
INSERT INTO `rule_connect` VALUES ('1','1','1','1','1');
/*!40000 ALTER TABLE `rule_connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `czone`
--

DROP TABLE IF EXISTS `czone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `czone` (
  `zone_id` int(11) NOT NULL COMMENT 'auto generated',
  `zone_name` varchar(50) NOT NULL,
  `zone_currency_type` char(4) DEFAULT NULL COMMENT 'INR',
  `zone_currency_decimal` int(11) DEFAULT NULL,
  `zone_timezone` char(4) DEFAULT NULL COMMENT 'GMT',
  `zone_dateformat` char(10) DEFAULT NULL COMMENT 'DD/MM/YYYY',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `czone`
--

LOCK TABLES `czone` WRITE;
/*!40000 ALTER TABLE `czone` DISABLE KEYS */;
INSERT INTO `czone` VALUES (1,'India','INR',0,'IST','dd/mm/yyyy','0201-10-29 00:00:00');
/*!40000 ALTER TABLE `czone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomrules`
--

DROP TABLE IF EXISTS `dcustomrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomrules` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `sfs_uin` char(10) NOT NULL COMMENT 'csconnector.sfs_UIN',
  `efs_uin` char(10) NOT NULL,
  `queue_id` char(6) NOT NULL COMMENT 'cflobQueue.queue_id',
  `rule_uin` char(10) NOT NULL COMMENT 'ciconnector_rules.rule_uin',
  `zone_id` int(11) NOT NULL COMMENT 'tZone.zone_id',
  `rule_condition` varchar(500) NOT NULL,
  `rule_action` text,
  `rule_exception` varchar(100) DEFAULT NULL COMMENT 'SOP, CUST etc',
  `rule_workset` char(6) DEFAULT NULL COMMENT 'cRuleWorkset.workset_id',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `ruleset_id` char(6) DEFAULT NULL,
  `rule_name` varchar(45) DEFAULT NULL,
  `rule_order` int(11) DEFAULT NULL,
  `rule_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`sfs_uin`,`queue_id`,`rule_uin`,`zone_id`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomrules`
--

LOCK TABLES `dcustomrules` WRITE;
/*!40000 ALTER TABLE `dcustomrules` DISABLE KEYS */;
INSERT INTO `dcustomrules` VALUES (1,'','cefs100101','qs1001','rule100135',1,'','','1','ws1033','1','2016-01-22 11:03:23',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dcustomrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `package` (
  `Package_ID` char(18) NOT NULL,
  `Package_name` char(18) DEFAULT NULL,
  `Package_desc` char(18) DEFAULT NULL,
  PRIMARY KEY (`Package_ID`),
  UNIQUE KEY `XPKWorflow` (`Package_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbpaas_service_offering`
--

DROP TABLE IF EXISTS `cbpaas_service_offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbpaas_service_offering` (
  `BpaaS_id` varchar(12) NOT NULL,
  `BPaaS_service` varchar(45) DEFAULT NULL,
  `lastupuser` varchar(25) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`BpaaS_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbpaas_service_offering`
--

LOCK TABLES `cbpaas_service_offering` WRITE;
/*!40000 ALTER TABLE `cbpaas_service_offering` DISABLE KEYS */;
INSERT INTO `cbpaas_service_offering` VALUES ('ch100101','invoice process to pay','Root','2015-10-15 11:03:33'),('ch100102','Claims process to pay','Root','2015-10-15 11:03:33'),('ch100103','loans to classify','Root','2015-10-15 11:03:33'),('ch100104','content to epub','Root','2015-10-15 11:03:33'),('ch100105','enroll topay','Root','2015-10-15 11:03:33');
/*!40000 ALTER TABLE `cbpaas_service_offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `industry` (
  `Industry_Id` char(6) NOT NULL,
  `Industry_name` char(50) DEFAULT NULL,
  `Industry_description` varchar(100) DEFAULT NULL,
  `Industry_Active` int(11) DEFAULT NULL,
  `Indusry_Creation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`Industry_Id`),
  UNIQUE KEY `XPKIndustry` (`Industry_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry`
--

LOCK TABLES `industry` WRITE;
/*!40000 ALTER TABLE `industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `Rule_ID` char(18) NOT NULL,
  `Rule_name` char(100) DEFAULT NULL,
  `Rule_Description` char(100) DEFAULT NULL,
  `Rule_Condition` char(100) DEFAULT NULL,
  `Rule_Action` char(100) DEFAULT NULL,
  `Rule_exception` char(100) DEFAULT NULL,
  `Rule_Workset_ID` char(18) NOT NULL,
  PRIMARY KEY (`Rule_ID`,`Rule_Workset_ID`),
  UNIQUE KEY `XPKRule` (`Rule_ID`,`Rule_Workset_ID`),
  KEY `R_28` (`Rule_Workset_ID`),
  CONSTRAINT `R_28` FOREIGN KEY (`Rule_Workset_ID`) REFERENCES `rule_workset` (`Rule_Workset_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES ('1','rule \"RuleNextFunctionCheck\"','Check Rule From DB','dp : DataProcessor(nxtf:NextFunction)','System.out.println(\"Database Check\"); \r         dp.setNextFunction(\"DocumentInChannel\");','1','1');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cruleset`
--

DROP TABLE IF EXISTS `cruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cruleset` (
  `cruleset_id` char(10) NOT NULL,
  `crulespackages_id` char(10) NOT NULL,
  `workset_id` char(20) NOT NULL,
  `crulesset_name` varchar(100) DEFAULT NULL,
  `cruleset_desc` varchar(250) DEFAULT NULL,
  `lastupuser` char(11) DEFAULT '0',
  `lasyupdtm` datetime DEFAULT NULL,
  `ruleset_order` int(11) DEFAULT NULL,
  `effective_startdate` date DEFAULT NULL,
  `effective_enddate` date DEFAULT NULL,
  PRIMARY KEY (`cruleset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cruleset`
--

LOCK TABLES `cruleset` WRITE;
/*!40000 ALTER TABLE `cruleset` DISABLE KEYS */;
INSERT INTO `cruleset` VALUES ('rs1002','pk1001','ws1001','Ruleset A','Ruleset desc','1','2016-01-16 12:58:18',1,'2015-10-10','2016-10-10');
/*!40000 ALTER TABLE `cruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inputsource`
--

DROP TABLE IF EXISTS `inputsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inputsource` (
  `Input_Source_Id` char(18) NOT NULL,
  `Input_Source_name` char(18) DEFAULT NULL,
  `Input_Source_desc` char(18) DEFAULT NULL,
  PRIMARY KEY (`Input_Source_Id`),
  UNIQUE KEY `XPKInputSource` (`Input_Source_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inputsource`
--

LOCK TABLES `inputsource` WRITE;
/*!40000 ALTER TABLE `inputsource` DISABLE KEYS */;
/*!40000 ALTER TABLE `inputsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcustomerbundleplay`
--

DROP TABLE IF EXISTS `dcustomerbundleplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcustomerbundleplay` (
  `customer_id` int(11) NOT NULL COMMENT 'auto generated',
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `sfs_uin` char(10) NOT NULL COMMENT 'csconnector.sfs_uin',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`tfs_uin`,`sfs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomerbundleplay`
--

LOCK TABLES `dcustomerbundleplay` WRITE;
/*!40000 ALTER TABLE `dcustomerbundleplay` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcustomerbundleplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dupload_status_history`
--

DROP TABLE IF EXISTS `dupload_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupload_status_history` (
  `upload_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `lastupuser` int(11) NOT NULL COMMENT 'user ID audit trail\\\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload_status_history`
--

LOCK TABLES `dupload_status_history` WRITE;
/*!40000 ALTER TABLE `dupload_status_history` DISABLE KEYS */;
INSERT INTO `dupload_status_history` VALUES (1,1,0,3,'2016-01-15 12:22:05'),(1,1,1,1,'2016-01-15 12:22:50'),(10,1,0,3,'2016-01-15 16:15:15'),(10,1,1,1,'2016-01-15 16:16:32'),(10,1,3,3,'2016-01-15 16:19:33'),(1,1,3,3,'2016-01-15 16:22:03'),(11,1,3,1,'2016-01-15 16:25:24'),(13,1,3,3,'2016-01-15 17:14:13'),(11,1,1,1,'2016-01-15 17:21:12'),(11,1,2,2,'2016-01-21 12:06:32'),(11,2,2,2,'2016-01-21 12:06:34'),(11,1,3,1,'2016-01-22 11:49:46'),(11,1,3,1,'2016-01-22 12:19:53'),(11,1,3,1,'2016-01-22 12:38:17'),(11,1,3,1,'2016-01-22 12:39:30'),(11,1,3,1,'2016-01-22 12:57:39'),(11,1,3,1,'2016-01-22 14:05:35'),(11,1,3,1,'2016-01-22 14:10:07'),(11,1,3,1,'2016-01-22 17:20:59'),(11,1,3,1,'2016-01-22 17:22:38'),(11,1,3,1,'2016-01-22 17:25:28'),(14,1,3,3,'2016-01-23 11:12:16');
/*!40000 ALTER TABLE `dupload_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uiccontent`
--

DROP TABLE IF EXISTS `uiccontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uiccontent` (
  `content_id` char(6) NOT NULL COMMENT '\\''ccontent.content_id\\''',
  `ccontent_decription_short` varchar(45) DEFAULT NULL COMMENT 'text to be displayed in carousel',
  `ccontent_decription_long` varchar(250) DEFAULT NULL COMMENT 'text to be displayed in carousel',
  `ccontent_image_id` varchar(250) DEFAULT NULL COMMENT 'ui_images.image_id\\n',
  `ccontent_status` char(6) DEFAULT NULL COMMENT 'on off ui',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uiccontent`
--

LOCK TABLES `uiccontent` WRITE;
/*!40000 ALTER TABLE `uiccontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `uiccontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tefs_output_inventory`
--

DROP TABLE IF EXISTS `tefs_output_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tefs_output_inventory` (
  `customer_id` int(11) NOT NULL COMMENT 'tCustomer',
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `input_batch_id` varchar(255) NOT NULL COMMENT 'unique batch id for that customer',
  `outut_batch_id` varchar(255) NOT NULL COMMENT 'unique batch id for that customer',
  `processedtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`tfs_uin`,`input_batch_id`,`outut_batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tefs_output_inventory`
--

LOCK TABLES `tefs_output_inventory` WRITE;
/*!40000 ALTER TABLE `tefs_output_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tefs_output_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hethiservices`
--

DROP TABLE IF EXISTS `hethiservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hethiservices` (
  `Hethi_Srv__Id` char(18) NOT NULL,
  `Hethi_Srv_name` char(18) DEFAULT NULL,
  `Hethi_Srv_Creation_date` char(18) DEFAULT NULL,
  `Hethi_Srv_desc` char(18) DEFAULT NULL,
  `Hethi_Srv_Active` char(18) DEFAULT NULL,
  PRIMARY KEY (`Hethi_Srv__Id`),
  UNIQUE KEY `XPKHethiServices` (`Hethi_Srv__Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hethiservices`
--

LOCK TABLES `hethiservices` WRITE;
/*!40000 ALTER TABLE `hethiservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `hethiservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cindexclassifystencil`
--

DROP TABLE IF EXISTS `cindexclassifystencil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cindexclassifystencil` (
  `form_stencid` int(11) NOT NULL,
  `efslobowner_id` varchar(10) DEFAULT NULL,
  `efs_uin` char(10) DEFAULT NULL,
  `eFS_XSD` text,
  `eFS_XSD_location` text,
  `lastupuser` char(6) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`form_stencid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cindexclassifystencil`
--

LOCK TABLES `cindexclassifystencil` WRITE;
/*!40000 ALTER TABLE `cindexclassifystencil` DISABLE KEYS */;
INSERT INTO `cindexclassifystencil` VALUES (1,'1','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\" ><business><industry> </industry><bpaas> </bpaas></business><form><efsuin> </efsuin><header><group name=\"default\"><field><name>Location</name><ixsdfieldname>branch_location</ixsdfieldname><ixsdxpath> </ixsdxpath><type>String</type><label><sequence> </sequence><position><top>168</top><left>96</left><width>189</width><height>42</height></position><content> </content></label><data><sequence> </sequence><position><top>552</top><left>143</left><width>265</width><height>44</height></position><content> </content></data></field></group></header><footer><group  name=\"default\"><field></field></group></footer><body><group  name=\"default\"><field></field><fieldlist><field></field></fieldlist></group></body></form></mxsd>\n','','2','2016-01-15 16:21:04'),(2,'3','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\" ><business><industry> </industry><bpaas> </bpaas></business><form><efsuin> </efsuin><header><group name=\"default\"><field><name>Location</name><ixsdfieldname>branch_location</ixsdfieldname><ixsdxpath> </ixsdxpath><type>String</type><label><sequence> </sequence><position><top>168</top><left>96</left><width>189</width><height>42</height></position><content> </content></label><data><sequence> </sequence><position><top>552</top><left>143</left><width>265</width><height>44</height></position><content> </content></data></field></group></header><footer><group  name=\"default\"><field></field></group></footer><body><group  name=\"default\"><field></field><fieldlist><field></field></fieldlist></group></body></form></mxsd>\n','http://localhost:5050/images/ixsd/10_1_3.xml','3','2016-01-15 16:19:33'),(3,'1','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name></name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><label><sequence></sequence><position><top>11</top><left>138</left><width>237</width><height>32</height></position><content></content></label><data><sequence></sequence><position><top>219</top><left>48</left><width>237</width><height>32</height></position><content></content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:2687/images/ixsd/11_1_1.xml','1','2016-01-22 14:05:35'),(4,'1','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name></name><ixsdfieldname>_deploymentMode</ixsdfieldname><ixsdxpath>po/Request/_deploymentMode</ixsdxpath><type>label field</type><label><sequence></sequence><position><top>221</top><left>52</left><width>205</width><height>28</height></position><content></content></label><data><sequence></sequence><position><top>17</top><left>215</left><width>189</width><height>33</height></position><content></content></data></field><show>true</show></group><show>true</show></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body><show>true</show></form><show>true</show></mxsd>','http://localhost:2687/images/ixsd/11_1_1.xml','1','2016-01-22 14:10:07'),(5,'1','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:2687/images/ixsd/11_1_1.xml','1','2016-01-22 17:20:59'),(6,'1','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name></name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><label><sequence></sequence><position><top></top><left></left><width></width><height></height></position><content></content></label><data><sequence></sequence><position><top>212</top><left>43</left><width>257</width><height>72</height><show>true</show></position><content></content><show>true</show></data><show>true</show></field><show>true</show></group><show>true</show></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body><show>true</show></form><show>true</show></mxsd>','http://localhost:2687/images/ixsd/11_1_1.xml','1','2016-01-22 17:22:37'),(7,'1','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name></name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><label><sequence></sequence><position><top></top><left></left><width></width><height></height></position><content></content></label><data><sequence></sequence><position><top>225</top><left>53</left><width>202</width><height>61</height></position><content></content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:2687/images/ixsd/11_1_1.xml','1','2016-01-22 17:25:28');
/*!40000 ALTER TABLE `cindexclassifystencil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hethi'
--

--
-- Dumping routines for database 'hethi'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_new_rules_for_sfs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_new_rules_for_sfs`(in varcustomer_id int,in varuser_id int,in vartfs_uin char(10),in varefs_uin char(10),in varsfs_uin char(10),in varrule_workset char(20),in varrule_ruleset char(20))
BEGIN

declare current_status bigint default 0;

set current_status= ( select ifnull((select hethi.dcustomrules.customer_id  From  hethi.dcustomrules where  hethi.dcustomrules.customer_id=varcustomer_id and hethi.dcustomrules.efs_uin=varefs_uin and hethi.dcustomrules.sfs_uin=varsfs_uin and  hethi.dcustomrules.rule_workset=varrule_workset and   hethi.dcustomrules.ruleset_id=varruleset_id limit 1),0));

if(current_status =0) then

INSERT INTO `hethi`.`dcustomrules`
(select 
varcustomer_id, 
varsfs_uin,
varefs_uin,
  1,
  hethi.cstandardrules.rule_uin,
  1,
  hethi.cstandardrules.rule_condition,
  hethi.cstandardrules.rule_action,
  1,
  hethi.cruleset.workset_id,
varuser_id,
now(),
  hethi.cstandardrules.ruleset_id,
  hethi.cstandardrules.rule_name,
  hethi.cstandardrules.rule_order,
  hethi.cstandardrules.rule_type
From
  hethi.cruleset Inner Join
  hethi.cstandardrules On hethi.cstandardrules.ruleset_id =
    hethi.cruleset.cruleset_id
Where
  hethi.cruleset.workset_id = varrule_workset And
  hethi.cstandardrules.ruleset_id = varrule_ruleset );

select 'sucs';

else

select 'fail';

delete  from `hethi`.`dcustomrules`
Where
  hethi.dcustomrules.workset_id = varrule_workset And
  hethi.dcustomrules.ruleset_id = varrule_ruleset;

INSERT INTO `hethi`.`dcustomrules`
(select 
varcustomer_id, 
varsfs_uin,
varefs_uin,
  1,
  hethi.cstandardrules.rule_uin,
  1,
  hethi.cstandardrules.rule_condition,
  hethi.cstandardrules.rule_action,
  1,
  hethi.cruleset.workset_id,
varuser_id,
now(),
  hethi.cstandardrules.ruleset_id,
  hethi.cstandardrules.rule_name,
  hethi.cstandardrules.rule_order,
  hethi.cstandardrules.rule_type
From
  hethi.cruleset Inner Join
  hethi.cstandardrules On hethi.cstandardrules.ruleset_id =
    hethi.cruleset.cruleset_id
Where
  hethi.cruleset.workset_id = varrule_workset And
  hethi.cstandardrules.ruleset_id = varrule_ruleset );


end if;


 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_task_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `assign_task_by_user`(in CID bigint,in UserID bigint,in UID bigint,in FID bigint,in JobID bigint,in nextJobID bigint)
BEGIN

UPDATE `hethi`.`dupload_status` SET
 `status`=nextJobID, 
`lastupuser`=UserID, 
`lastupdtm`=now() WHERE 
`upload_id`=UID 
and
`file_id`=FID;

INSERT INTO `hethi`.`dupload_status_history`
(`file_id`,
`lastupdtm`,
`lastupuser`,
`status`,
`upload_id`)
VALUES
(
FID,
now(),
UserID,
JobID,
UID
);


Select
  hethi.dupload_status_history.file_id,
  hethi.dupload_status_history.lastupdtm,
  hethi.dupload_status_history.lastupuser,
  hethi.dupload_status_history.status,
  hethi.dupload_status_history.upload_id,
  hethi.duser.user_name,
  hethi.cjob.job_name
From
  hethi.dupload_status_history Inner Join
  hethi.duser On hethi.dupload_status_history.lastupuser = hethi.duser.user_id
  Inner Join
  hethi.cjob On hethi.dupload_status_history.status = hethi.cjob.job_id
Where
 `dupload_status_history`.`upload_id`=UID
and `dupload_status_history`.`file_id`=FID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_to_artist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `assign_to_artist`(in CID int,
in AID int,in UserID char(6),in UID BIGINT)
BEGIN
declare JobID int default 1;
declare nextJobID int;

UPDATE `hethi`.`dcustomer_upload`
SET
`dcustomer_upload`.`assigneddtm` = now(),
`dcustomer_upload`.`business_artist` = AID,
`dcustomer_upload`.`lastupuser` = UserID
WHERE `dcustomer_upload`.`customer_id` = CID and 
 `dcustomer_upload`.`upload_id`=UID;

set nextJobID=(select ifnull( (SELECT `cjob_flow`.`next_job_id` FROM `hethi`.`cjob_flow` where `cjob_flow`.`current_job_id`=JobID),2));

UPDATE `hethi`.`dupload_status` SET
 `status`=nextJobID, 
`lastupuser`=UserID, 
`lastupdtm`=now() WHERE 
`upload_id`=UID;


INSERT INTO `hethi`.`dupload_status_history`
(
SELECT
UID,
`dupload_file`.`file_id`,
JobID,
UserID,
now()
FROM `hethi`.`dupload_file`
WHERE 
`dupload_file`.`upload_id`= UID
);

Select
  hethi.dupload_status_history.file_id,
  hethi.dupload_status_history.lastupdtm,
  hethi.dupload_status_history.lastupuser,
  hethi.dupload_status_history.status,
  hethi.dupload_status_history.upload_id,
  hethi.duser.user_name,
  hethi.cjob.job_name
From
  hethi.dupload_status_history Inner Join
  hethi.duser On hethi.dupload_status_history.lastupuser = hethi.duser.user_id
  Inner Join
  hethi.cjob On hethi.dupload_status_history.status = hethi.cjob.job_id
Where
 `dupload_status_history`.`upload_id`=UID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bpaas_create_new_lob` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `bpaas_create_new_lob`(in efslob_id char(6),
in form_bclass char(5),in form_bsource char(3),
in form_stencid char(9),in form_type varchar(45),
in form_type_decription_long varchar(250),
in form_type_decription_short varchar(45),
in form_type_image_id int(11),in image_alt_text varchar(100),
in image_path varchar(200),in image_type_id int(11),
in lastupuser char(6))
BEGIN
INSERT INTO `hethi`.`cflob`
(`efslob_id`,
`form_bclass`,
`form_bsource`,
`form_stencid`,
`form_type`,
`lastupdtm`,
`lastupuser`)
VALUES
(
efslob_id,
form_bclass,
form_bsource,
form_stencid,
form_type,
now(),
lastupuser
);
INSERT INTO `hethi`.`cflob_ui`
(`efslob_id`,
`form_type_decription_long`,
`form_type_decription_short`,
`form_type_image_id`,
`form_type_status`)
VALUES
(
efslob_id,
form_type_decription_long,
form_type_decription_short,
form_type_image_id,
1
);
INSERT INTO `hethi`.`images_ui`
(`image_alt_text`,
`image_id`,
`image_path`,
`image_type_id`,
`status`)
VALUES
(
image_alt_text,
image_id,
image_path,
image_type_id,
1
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bpaas_create_owner_form` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `bpaas_create_owner_form`(in efslobowner_id char(8),
efslobowner_name varchar(50),in owner_email varchar(50),
in marketplace_ID char(6),in lastupdate_user char(6),in address1 varchar(50),
in address2 varchar(50),in address_type varchar(20),
in business_fax varchar(30),in business_tel varchar(30),
in cust_country char(3),in cust_loc_zip varchar(10),
in efs_addressid char(6),in GPS_coordinate varchar(200),
in linkedin varchar(50),in socialtype varchar(50),
in whatsapp varchar(50),in socialid varchar(50))
BEGIN

INSERT INTO `hethi`.`cformowner`
(`efslobowner_id`,
`efslobowner_name`,
`lastupdtm`,
`lastupuser`,
`marketplace_ID`,
`owner_email`)
VALUES
(
efslobowner_id,
efslobowner_name,
now(),
lastupdate_user,
marketplace_ID,
owner_email
);
INSERT INTO `hethi`.`cownercommn`
(`address 1`,
`address 2`,
`Address Type`,
`business Fax`,
`business_Tel`,
`cust_country`,
`cust_loc_zip`,
`efs_addressid`,
`efslobowner_id`,
`GPS_coordinate`,
`lastupdtm`,
`lastupuser`,
`linkedin`,
`owneremail`,
`socialtype`,
`whatsapp`)
VALUES
(
address1,
address2,
address_type,
business_fax,
business_tel,
cust_country,
cust_loc_zip,
efs_addressid,
efslobowner_id,
GPS_coordinate,
now(),
lastupdate_user,
linkedin,
owner_email,
socialtype,
whatsapp
);
INSERT INTO `hethi`.`cownersocial`
(`efs_addressid`,
`efslobowner_id`,
`lastupdtm`,
`lastupuser`,
`socialid`,
`socialtype`)
VALUES
(
efs_addressid,
efslobowner_id,
now(),
lastupdate_user,
socialid,
socialtype
);

SELECT
`cformowner`.`efslobowner_id`,
`cformowner`.`efslobowner_name`,
`cformowner`.`lastupdtm`,
`cformowner`.`lastupuser`,
`cformowner`.`marketplace_ID`,
`cformowner`.`owner_email`
FROM `hethi`.`cformowner`
where `cformowner`.`efslobowner_id`=efslobowner_id;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `bpaas_load_home_content` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `bpaas_load_home_content`()
BEGIN


Select
  hethi.ciconnector_efs.*,
  hethi.cbpaas_service_offering.BpaaS_service,
  hethi.uicbpaas_service_offering.BpaaS_service_image_id,
  hethi.uicbpaas_service_offering.BpaaS_service_description_short,
  hethi.uicbpaas_service_offering.BpaaS_service_description_long,
  hethi.uicbpaas_service_offering.BpaaS_service_status,
  hethi.ui_images.image_type_id as BpaaS_service_image_type_id,
  hethi.ui_images.image_path as BpaaS_service_image_path,
  hethi.ui_images.image_alt_text as BpaaS_service_image_alt_text,
  hethi.cindustry_offering.indus_service,
  hethi.uicindustry_offering.industry_decription_short,
  hethi.uicindustry_offering.industry_decription_long,
  hethi.uicindustry_offering.industry_image_id,
  hethi.uicindustry_offering.industry_status,
  images_ui1.image_type_id as industry_image_type_id,
  images_ui1.image_path as industry_image_path,
  images_ui1.image_alt_text as industry_image_alt_text,
  hethi.cform_lob.form_bclass,
  hethi.cform_lob.form_bsource,
  hethi.cform_lob.form_type,
  hethi.cform_lob.form_stencid,
  hethi.uicflob.form_type_decription_short,
  hethi.uicflob.form_type_decription_long,
  hethi.uicflob.form_type_image_id,
  hethi.uicflob.form_type_status,
  images_ui2.image_type_id as form_image_type_id,
  images_ui2.image_path as form_image_path,
  images_ui2.image_alt_text as form_image_alt_text
From
  hethi.ciconnector_efs Inner Join
  hethi.cbpaas_service_offering On hethi.ciconnector_efs.BpaaS_id =
    hethi.cbpaas_service_offering.BpaaS_id Inner Join
  hethi.uicbpaas_service_offering On hethi.cbpaas_service_offering.BpaaS_id =
    hethi.uicbpaas_service_offering.BpaaS_id Inner Join
  hethi.ui_images On hethi.uicbpaas_service_offering.BpaaS_service_image_id =
    hethi.ui_images.image_id Inner Join
  hethi.cindustry_offering On hethi.ciconnector_efs.indus_id =
    hethi.cindustry_offering.indus_id Inner Join
  hethi.uicindustry_offering On hethi.cindustry_offering.indus_id =
    hethi.uicindustry_offering.indus_id Inner Join
  hethi.ui_images images_ui1 On hethi.uicindustry_offering.industry_image_id =
    images_ui1.image_id Inner Join
  hethi.cform_lob On hethi.ciconnector_efs.efslob_id = hethi.cform_lob.efslob_id
  Inner Join
  hethi.uicflob On hethi.cform_lob.efslob_id = hethi.uicflob.efslob_id Inner Join
  hethi.ui_images images_ui2 On hethi.uicflob.form_type_image_id =
    images_ui2.image_id
where
hethi.uicbpaas_service_offering.BpaaS_service_status=1;


-- and uicindustry_offering.industry_status=1
-- and uicflob.form_type_status=1
SELECT
`cform_bundle`.`form_attach1`,
`cform_bundle`.`form_attach2`,
`cform_bundle`.`form_attach3`,
`cform_bundle`.`form_attach4`,
`cform_bundle`.`form_primary`,
`cform_bundle`.`formbundle_id`,
`cform_bundle`.`lastupdtm`,
`cform_bundle`.`lastupuser`
FROM `hethi`.`cform_bundle`;

Select
  `ciconnector_efs`.`efs_uin`,
  `ciconnector_efs`.`BpaaS_id`,
  `ciconnector_efs`.`indus_id`,
  `cform_lob`.*
From
  `cform_lob` Inner Join
  `ciconnector_efs` On `cform_lob`.`efslob_id` = `ciconnector_efs`.`efslob_id`;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `change_mxsd_tree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `change_mxsd_tree`(in efsuin varchar(10),in tfsuin varchar(10))
BEGIN
SELECT
*
FROM `hethi`.`cindexclassifystencil`
where `cindexclassifystencil`.`efs_uin`=efsuin and 
`cindexclassifystencil`.`efslobowner_id`=
(select distinct customer_id from dcustomer_bundle where tfs_uin=tfsuin
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clear_db` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `clear_db`()
BEGIN

DELETE FROM `hethi`.`dassign_customer_serviceplay`;

DELETE FROM `hethi`.`dcustomer_calendar`;

DELETE FROM `hethi`.`dcustomer_complianceaspect`;

DELETE FROM `hethi`.`dcustomer_deliveryaspect`;

DELETE FROM `hethi`.`dcustomer_imageaspect`;

DELETE FROM `hethi`.`dcustomer_locale`;

DELETE FROM `hethi`.`dcustomer_upload`;

DELETE FROM `hethi`.`dcustomer_volumeaspect`;

DELETE FROM `hethi`.`dcustomerbundlecontent`;

DELETE FROM `hethi`.`dcustomerqueueaccess`;

DELETE FROM `hethi`.`dcustomerserviceplayqueue`;

DELETE FROM `hethi`.`dupload`;

DELETE FROM `hethi`.`dupload_file`;

DELETE FROM `hethi`.`dupload_status`;

DELETE FROM `hethi`.`dupload_status_history`;

DELETE FROM `hethi`.`cindexclassifystencil`;





END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `complete_registration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `complete_registration`(in regData text)
BEGIN

declare RowCount int default  ExtractValue(regData,'count(//data)');
declare cid bigint;
declare cust_name varchar(50);

declare uid bigint;

declare u_addressID bigint;

declare u_prfx varchar(50);
declare u_fn varchar(50);
declare u_ln varchar(50);
declare u_login varchar(50);
declare u_password varchar(50);
declare u_contact varchar(50);


declare i int default 1;

while i<=RowCount do
set cust_name= ExtractValue(regData,'/root/data[$i]/customer');
set cid= ExtractValue(regData,'/root/data[$i]/cid');
set uid= ExtractValue(regData,'/root/data[$i]/uid');
set u_prfx= ExtractValue(regData,'/root/data[$i]/prefix');
set u_fn= ExtractValue(regData,'/root/data[$i]/customer_fname');
set u_ln= ExtractValue(regData,'/root/data[$i]/customer_lname');
set u_login= ExtractValue(regData,'/root/data[$i]/email');
set u_password= ExtractValue(regData,'/root/data[$i]/password');
set u_contact= ExtractValue(regData,'/root/data[$i]/contact_number');
set u_addressID= ExtractValue(regData,'/root/data[$i]/AddressID');


UPDATE `hethi`.`duser` SET 
`user_firstname`=u_fn, 
`user_lastname`=u_ln, 
`user_prefix`=u_prfx, 
`user_login_password`=u_password, 
`lastupdtm`=now() 
WHERE 
`customer_id`=cid and
`user_id`=uid and
`user_login_id`= u_login;



UPDATE `hethi`.`dcustomercommn` 
SET  
`contact_tel`=u_contact, 
`lastupdtm`= now() 
WHERE `addressid`=u_addressID;

UPDATE `hethi`.`dcustomer` 
SET 
`customer_name`=cust_name, 
`contact_name`=u_prfx+'.'+u_fn+''+u_ln, 
`contact_number`=u_contact
WHERE `customer_id`=cid;


set i=i+1;
end while;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_ruleSet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `delete_ruleSet`(in packageId char(10),in worksetId char(10),
in rulesetId char(10))
BEGIN
DELETE FROM `hethi`.`cruleset`
WHERE `cruleset`.`crulespackages_id`=packageId and `cruleset`.`workset_id`=worksetId 
and `cruleset`.`cruleset_id`=rulesetId ;
DELETE FROM `hethi`.`crules`
WHERE `crules`.`crulespackage_id`=packageId and `crules`.`cworkset_id`=worksetId and 
`crules`.`crulesset_id`=rulesetId ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_rulesPackage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `delete_rulesPackage`(in packageId char(10))
BEGIN
DELETE FROM `hethi`.`crulepackage`
WHERE `crulepackage`.`rule_package_id`=packageId;
DELETE FROM `hethi`.`cruleworkset`
WHERE `cruleworkset`.`crulespackage_id`=packageId;
DELETE FROM `hethi`.`cruleset`
WHERE `cruleset`.`crulespackages_id`=packageId;
DELETE FROM `hethi`.`crules`
WHERE `crules`.`crulespackage_id`=packageId;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_rules_for_sfs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `delete_rules_for_sfs`(in varcustomer_id int,in varuser_id int,in vartfs_uin char(10),in varefs_uin char(10),in varsfs_uin char(10),in varrule_workset char(20))
BEGIN

delete from  `hethi`.`dcustomrules`
where
 hethi.dcustomrules.customer_id=varcustomer_id and
 hethi.dcustomrules.efs_uin=varefs_uin and 
 hethi.dcustomrules.sfs_uin=varsfs_uin and 
 hethi.dcustomrules.rule_workset=varrule_workset ;




 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_ruleWorkSet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `delete_ruleWorkSet`(in packageId char(10),in worksetId char(10))
BEGIN

DELETE FROM `hethi`.`cruleworkset`
WHERE `cruleworkset`.`crulespackage_id`=packageId and `cruleworkset`.`workset_id`=worksetId;
DELETE FROM `hethi`.`cruleset`
WHERE `cruleset`.`crulespackages_id`=packageId and `cruleset`.`workset_id`=worksetId;
DELETE FROM `hethi`.`crules`
WHERE `crules`.`crulespackage_id`=packageId and `crules`.`cworkset_id`=worksetId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `documentstatusupdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `documentstatusupdate`(in upload_id bigint,
in file_id bigint,in documentstatus int,in user int)
BEGIN

UPDATE `hethi`.`dupload_status`
SET
`status` = documentstatus,
`lastupuser` = user,
`lastupdtm`=now()

WHERE `dupload_status`.`file_id` = file_id and 
`dupload_status`.`upload_id` = upload_id;


INSERT INTO `hethi`.`dupload_status_history`
(`file_id`,
`lastupdtm`,
`lastupuser`,
`status`,
`upload_id`)
VALUES
(
file_id,
now(),
user,
documentstatus,
upload_id
);
SELECT
`dupload_status`.`file_id`,
`dupload_status`.`lastupdtm`,
`dupload_status`.`lastupuser`,
`dupload_status`.`status`,
`dupload_status`.`upload_id`
FROM `hethi`.`dupload_status`
 where `dupload_status`.`file_id`=file_id and 
`dupload_status`.`upload_id`=upload_id and 
`dupload_status`.`lastupuser`=user;
SELECT
`dupload_file`.`file_location`
FROM `hethi`.`dupload_file`
 where `dupload_file`.`file_id`=file_id and 
`dupload_file`.`upload_id`=upload_id and 
`dupload_file`.`lastupuser`=user;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fileuploadedpath` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `fileuploadedpath`(in cust_id int)
BEGIN
Select
  hethi.dupload_file.file_location
From
  hethi.dupload_file Inner Join
  hethi.dcustomer_upload On hethi.dupload_file.upload_id =
    hethi.dcustomer_upload.upload_id     
    where hethi.dcustomer_upload.customer_id = cust_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generatebatchid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `generatebatchid`(in batchno varchar(50),
in buyerid int,in userid int,in filename varchar(100),in filesize varchar(20)
,in industryid int,in inputfileformatid int,in inputsourceid int,
in status int)
BEGIN
declare inputinventorybatchid int;
declare batch_no varchar(20);
set inputinventorybatchid=(select ifnull(max(inputinventorybatch.inputinventorybatchid),0) from inputinventorybatch);
set inputinventorybatchid=inputinventorybatchid+1;
set batch_no=concat(batchno,inputinventorybatchid);
INSERT INTO `oldhethi`.`inputinventorybatch`
(`batchno`,
`buyerid`,
`create_user`,
`created_datetime`,
`filename`,
`filesize`,
`industryid`,
`inputfileformatid`,
`inputinventorybatchid`,
`inputsourceid`,
`status`)
VALUES
(
batch_no,
buyerid,
userid,
now(),
filename,
filesize,
industryid,
inputfileformatid,
inputinventorybatchid,
inputsourceid,
status
);

select batch_no;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generate_form_stencilid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `generate_form_stencilid`(
in uploadid int,in fileid int,in user int,in form_xsd text,
in file_location varchar(200))
BEGIN
declare form_stencid int(11);
set form_stencid=(select ifnull((select max(`cindexclassifystencil`.`form_stencid`) from `hethi`.`cindexclassifystencil`),0));
set form_stencid=form_stencid+1;

INSERT INTO `hethi`.`cindexclassifystencil`
(`efs_uin`,
`eFS_XSD`,
`eFS_XSD_location`,
`efslobowner_id`,
`form_stencid`,
`lastupdtm`,
`lastupuser`)
VALUES
(
(select efs_uin from dupload_file 
where upload_id= uploadid and file_id= fileid),
form_xsd,
file_location,
user,
form_stencid,
now(),
user
);
UPDATE `hethi`.`dupload_file`
SET
`stencil_id` = form_stencid
WHERE `upload_id` = uploadid and `file_id` = fileid;

select form_stencid;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getstencildata_by_stencilid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `getstencildata_by_stencilid`(in stencilid bigint)
BEGIN
Select
  hethi.cindexclassifystencil.eFS_XSD_location,
  hethi.dupload_file.file_location
From
  hethi.cindexclassifystencil Inner Join
  hethi.dupload_file On hethi.cindexclassifystencil.form_stencid =
    hethi.dupload_file.stencil_id
Where
  hethi.cindexclassifystencil.form_stencid = stencilid;

Select
  hethi.dcustomer.business_email,
  hethi.dcustomer.contact_number
From
  hethi.cindexclassifystencil Inner Join
  hethi.dupload_file On hethi.cindexclassifystencil.form_stencid =
    hethi.dupload_file.stencil_id Inner Join
  hethi.dcustomer_upload On hethi.dupload_file.upload_id =
    hethi.dcustomer_upload.upload_id Inner Join
  hethi.dcustomer On hethi.dcustomer.customer_id =
    hethi.dcustomer_upload.customer_id     
    where hethi.cindexclassifystencil.form_stencid=stencilid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hethi_authentication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `hethi_authentication`(in username varchar(50),
in userpassword varchar(50))
BEGIN
Select
  hethi.dcustomer.*,
  hethi.drole.role_name,
  hethi.roles.*,
  hethi.duser.*,
  hethi.dcustomercommn.*  
From
  hethi.duser Inner Join
  hethi.dcustomer On hethi.duser.customer_id = hethi.dcustomer.customer_id
  Inner Join
  hethi.drole On hethi.duser.role_id = hethi.drole.role_id And
    hethi.duser.customer_id = hethi.drole.customer_id Inner Join
  hethi.roles On hethi.drole.role_id = hethi.roles.role_id Inner Join 
  hethi.dcustomercommn on hethi.dcustomercommn.addressid=hethi.dcustomer.business_address
Where
  hethi.duser.user_login_id = username and
  hethi.duser.user_login_password = userpassword;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hethi_profile_updation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `hethi_profile_updation`(
in regData text)
BEGIN
declare RowCount int default  ExtractValue(regData,'count(//data)');
declare roleName,contactName,businessEmail,businessName,businessFax,customerName,userName,cust_locZip,cust_business_name,gpsCoordinate,whatsApp,linkedIn,socialType varchar(100);
declare contactTel,custCountry,cust_business_email,contactEmail,contactFax varchar(100);
declare cust_business_country,addresstype varchar(50);
declare contactNumber,cust_address1,cust_address2,user_loginPassword,user_loginId varchar(500);
declare i int default 1;
declare addressId,businessAddress,userAddress,lastupUser bigint(11);
declare customerId bigint(11);
declare userId,roleId bigint(11);

while i<=RowCount do

set cust_address1= ExtractValue(regData,'/root/data[$i]/address1');
set cust_address2= ExtractValue(regData,'/root/data[$i]/address2');
set addresstype= ExtractValue(regData,'/root/data[$i]/address_type');
set contactEmail= ExtractValue(regData,'/root/data[$i]/contact_email');
set contactFax= ExtractValue(regData,'/root/data[$i]/contact_fax');
set contactTel= ExtractValue(regData,'/root/data[$i]/contact_tel');
set custCountry= ExtractValue(regData,'/root/data[$i]/country');
set cust_locZip= ExtractValue(regData,'/root/data[$i]/location');
set gpsCoordinate= ExtractValue(regData,'/root/data[$i]/gps_coords');

set lastupUser= ExtractValue(regData,'/root/data[$i]/lastupuser');
set linkedIn= ExtractValue(regData,'/root/data[$i]/linkedin');
set socialType= ExtractValue(regData,'/root/data[$i]/social_type');
set whatsApp= ExtractValue(regData,'/root/data[$i]/whatsapp');
set addressId=ExtractValue(regData,'/root/data[$i]/addressid');


UPDATE `hethi`.`dcustomercommn`
SET
`address1` = cust_address1,
`address2` = cust_address2,
`address_type` = addresstype,
`contact_email` = contactEmail,
`contact_fax` = contactFax,
`contact_tel` = contactTel,
`cust_country` = custCountry,
`cust_loc_zip` = cust_locZip,
`gps_coordinate` = gpsCoordinate,
`lastupdtm` = now(),
`lastupuser` = lastupUser,
`linkedin` = linkedIn,
`socialtype` = socialType,
`whatsapp` = whatsApp
WHERE `addressid` = addressId;


set customerName=ExtractValue(regData,'/root/data[$i]/name');
set contactName=ExtractValue(regData,'/root/data[$i]/contact_name');

set contactNumber=ExtractValue(regData,'/root/data[$i]/contact_number');
set businessName=ExtractValue(regData,'/root/data[$i]/business_name');
set businessFax=ExtractValue(regData,'/root/data[$i]/business_fax');
set businessEmail=ExtractValue(regData,'/root/data[$i]/business_email');
set businessAddress=ExtractValue(regData,'/root/data[$i]/business_address');
set customerId=ExtractValue(regData,'/root/data[$i]/customer_id');

UPDATE `hethi`.`dcustomer`
SET
`business_address` = businessAddress,
`business_email` = businessEmail,
`business_fax` = businessFax,
`business_name` = businessName,
`contact_name` = contactName,
`contact_number` = contactNumber,
`customer_name` = customerName
WHERE `customer_id` = customerId;


set userId=ExtractValue(regData,'/root/data[$i]/user_id');
set roleId=ExtractValue(regData,'/root/data[$i]/role_id');
set userAddress=ExtractValue(regData,'/root/data[$i]/user_address');
set user_loginId=ExtractValue(regData,'/root/data[$i]/login_id');
set user_loginPassword=ExtractValue(regData,'/root/data[$i]/user_login_password');
set userName=ExtractValue(regData,'/root/data[$i]/name');

UPDATE `hethi`.`duser`
SET
`customer_id` = customerId,
`lastupdtm` = now(),
`role_id` = roleId,
`user_address` = userAddress,
`user_login_id` = user_loginId,
`user_login_password` = user_loginPassword,
`user_name` = userName
WHERE `user_id` = userId;

set roleName=ExtractValue(regData,'/root/data[$i]/role_name');

UPDATE `hethi`.`drole`
SET
`customer_id` = customerId,
`lastupdtm` = now(),
`role_name` = roleName
WHERE `role_id` = roleId;

set i=i+1;


end while;

Select
  hethi.dcustomer.*,
  hethi.drole.role_name,
  hethi.roles.*,
  hethi.duser.*,
  hethi.dcustomercommn.*  
From
  hethi.duser Inner Join
  hethi.dcustomer On hethi.duser.customer_id = hethi.dcustomer.customer_id
  Inner Join
  hethi.drole On hethi.duser.role_id = hethi.drole.role_id And
    hethi.duser.customer_id = hethi.drole.customer_id Inner Join
  hethi.roles On hethi.drole.role_id = hethi.roles.role_id Inner Join 
  hethi.dcustomercommn on hethi.dcustomercommn.addressid=hethi.dcustomer.business_address
Where
  hethi.duser.user_login_id = user_loginId and
  hethi.duser.user_login_password = user_loginPassword;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hethi_registration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `hethi_registration`(in regData text)
BEGIN

declare RowCount int default  ExtractValue(regData,'count(//data)');
declare cust_business_name varchar(100);
declare cust_business_email varchar(100);
declare cust_business_country varchar(50);


declare i int default 1;
declare addressid bigint(11);
declare customer_id bigint(11);
declare user_id bigint(11);

while i<=RowCount do

set cust_business_email= ExtractValue(regData,'/root/data[$i]/business_email');
set cust_business_name= ExtractValue(regData,'/root/data[$i]/business_name');
set cust_business_country= ExtractValue(regData,'/root/data[$i]/country');


set addressid=(select ifnull((select max(`dcustomercommn`.`addressid`)+1 from `hethi`.`dcustomercommn`),1));


INSERT INTO `hethi`.`dcustomercommn`
(`address1`,
`address2`,
`address_type`,
`addressid`,
`contact_email`,
`contact_fax`,
`contact_tel`,
`cust_country`,
`cust_loc_zip`,
`gps_coordinate`,
`lastupdtm`,
`lastupuser`,
`linkedin`,
`socialtype`,
`whatsapp`)
VALUES
(
cust_business_name,
cust_business_name,
'',
addressid,
cust_business_email,
'',
'',
cust_business_country,
'',
'',
now(),
1,
'',
'',
''
);


set customer_id=(select ifnull((select max(`dcustomer`.`customer_id`)+1 from `hethi`.`dcustomer`),1));

INSERT INTO `hethi`.`dcustomer`
(`business_address`,
`business_email`,
`business_fax`,
`business_name`,
`contact_name`,
`contact_number`,
`customer_id`,
`customer_name`)
VALUES
(
addressid,
cust_business_email,
'',
cust_business_name,
cust_business_name,
customer_id,
customer_id,
cust_business_name
);
set user_id=(select ifnull((select max(`duser`.`user_id`)+1 from `hethi`.`duser`),1));


INSERT INTO `hethi`.`duser`
(`customer_id`,
`lastupdtm`,
`role_id`,
`user_address`,
`user_firstname`,
`user_id`,
`user_lastname`,
`user_login_id`,
`user_login_password`,
`user_prefix`)

VALUES
(
customer_id,
now(),
3,
addressid,
cust_business_email,
user_id,
'',
cust_business_email,
'temporary_password',
'MR'
);


INSERT INTO `hethi`.`drole`
(`customer_id`,
`lastupdtm`,
`role_id`,
`role_name`)
VALUES
(
customer_id,
now(),
3,
'Business Partner'
);

select 'Success' as result,cust_business_name as customer,cust_business_email as email,customer_id as cid,user_id as uid , addressid as AddressID;

set i=i+1;
end while;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_dcustomerbundlecontent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `insert_into_dcustomerbundlecontent`(
in customer_id int,in content_id varchar(10),in tfs_uin varchar(10),
in lastupuser varchar(10))
BEGIN
INSERT INTO `hethi`.`dcustomerbundlecontent`
(`content_id`,
`customer_id`,
`lastupdtm`,
`lastupuser`,
`tfs_uin`)
VALUES
(
content_id,
customer_id,
now(),
lastupuser,
tfs_uin
);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_dcustomer_calendar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `insert_into_dcustomer_calendar`(
in customer_id int,in lastupuser int,in weekday_end int,
in weekday_start int)
BEGIN
INSERT INTO `hethi`.`dcustomer_calendar`
(`customer_id`,
`lastupdtm`,
`lastupuser`,
`weekday_end`,
`weekday_start`)
VALUES
(
customer_id,
now(),
lastupuser,
weekday_end,
weekday_start
);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_dcustomer_complianceaspect` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `insert_into_dcustomer_complianceaspect`(
in din_format int,in customer_id int,in data_archival_period int,
in data_retention_period datetime,in data_shipment_file_name int,
in hethi_din_format int,in archival_period int,in retention_period datetime,
in industry_compliance int,in information_security int,in lastupuser char(10),
in tfs_uin char(10))
BEGIN
INSERT INTO `hethi`.`dcustomer_complianceaspect`
(`customer_din_format`,
`customer_id`,
`data_archival_period`,
`data_retention_period`,
`data_shipment_file_name`,
`hethi_din_format`,
`image_archival_period`,
`image_retention_period`,
`industry_compliance`,
`information_security`,
`lastupdtm`,
`lastupuser`,
`tfs_uin`)
VALUES
(
din_format,
customer_id,
data_archival_period,
data_retention_period,
data_shipment_file_name,
hethi_din_format,
archival_period,
retention_period,
industry_compliance,
information_security,
now(),
lastupuser,
tfs_uin
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_dcustomer_deliveryaspects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `insert_into_dcustomer_deliveryaspects`(
in customer_id int,in shipment_cutoff int,in lastupuser char(10),
in file_record_nos int,in file_size int,in image_record_nos int,
in image_size int,in record_size_nos int,in shipment_end_time datetime,
in shipment_freq int,in shipment_start_time datetime,in tfs_uin char(10) )
BEGIN
INSERT INTO `hethi`.`dcustomer_deliveryaspect`
(`customer_id`,
`customer_shipment_cutoff`,
`lastupdtm`,
`lastupuser`,
`max_shipment_file_record_nos`,
`max_shipment_file_size`,
`max_shipment_image_record_nos`,
`max_shipment_image_size`,
`min_shipment_record_size_nos`,
`shipment_end_time`,
`shipment_freq`,
`shipment_start_time`,
`tfs_uin`)
VALUES
(
customer_id,
shipment_cutoff,
now(),
lastupuser,
file_record_nos,
file_size,
image_record_nos,
image_size,
record_size_nos,
shipment_end_time,
shipment_freq,
shipment_start_time,
tfs_uin
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_dcustomer_imageaspect` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `insert_into_dcustomer_imageaspect`(
in customer_id int,in avg_character_fields int,in avg_character_form int,
in avg_pageds_form_bundle int,in avg_pages_form int,
in image_size int,in layout int,in min_acceptable_dpi int,
in standard_dpi int,in total_form_fields int
)
BEGIN
INSERT INTO `hethi`.`dcustomer_imageaspect`
(`avg_character_fields`,
`avg_character_form`,
`avg_pageds_form_bundle`,
`avg_pages_form`,
`customer_id`,
`image_size`,
`layout`,
`min_acceptable_dpi`,
`standard_dpi`,
`total_form_fields`)
VALUES
(
avg_character_fields,
avg_character_form,
avg_pageds_form_bundle,
avg_pages_form,
customer_id,
image_size,
layout,
min_acceptable_dpi,
standard_dpi,
total_form_fields
);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_dcustomer_locale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `insert_into_dcustomer_locale`(in customer_id int,
in zone_id int,in expected_doc_lang varchar(10),
in primary_doc_lang varchar(10),in lastupuser int(11))
BEGIN
INSERT INTO `hethi`.`dcustomer_locale`
(`customer_id`,
`expected_doc_lang`,
`lastupdtm`,
`lastupuser`,
`primary_doc_lang`,
`zone_id`)
VALUES
(
customer_id,
expected_doc_lang,
now(),
lastupuser,
primary_doc_lang,
zone_id
);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_dcustomer_volumeaspects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `insert_into_dcustomer_volumeaspects`(
in customer_id int(11),in daily_volume int(11),in sunday int(11),in monday int(11),
in tuesday int(11),in wednesday int(11),in thursday int(11),in friday int(11),in saturday int(11),
in lastupuser int(11),in monthly_volume int(11),in weekly_volume int(11),
in tfs_uin char(10))
BEGIN
INSERT INTO `hethi`.`dcustomer_volumeaspect`
(`customer_id`,
`daily_volume`,
`high_volume_day_friday`,
`high_volume_day_monday`,
`high_volume_day_saturday`,
`high_volume_day_sunday`,
`high_volume_day_thursday`,
`high_volume_day_tuesday`,
`high_volume_day_wednesday`,
`lastupdtm`,
`lastupuser`,
`monthly_volume`,
`tfs_uin`,
`weekly_volume`)
VALUES
(
customer_id,
daily_volume,
friday,
monday,
saturday,
sunday,
thursday,
tuesday,
wednesday,
now(),
lastupuser,
monthly_volume,
tfs_uin,
weekly_volume
);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listAllDocuments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `listAllDocuments`(in customer_id bigint)
BEGIN

Select
    hethi.dupload_file.*
From
  hethi.dcustomer_upload Inner Join
  hethi.dupload_file On hethi.dcustomer_upload.upload_id =
    hethi.dupload_file.upload_id
Where
  hethi.dcustomer_upload.customer_id = customer_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listuploadeddocument` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `listuploadeddocument`(
in document_status int,in user int)
BEGIN
 Select
  hethi.dupload_file.*,
  hethi.dupload.*,
  hethi.dupload_status.*
  
From
  hethi.dupload_status Inner Join
  hethi.dupload On hethi.dupload_status.upload_id = hethi.dupload.upload_id
  Inner Join
  hethi.dupload_file On hethi.dupload_status.upload_id =
    hethi.dupload_file.upload_id
Where
  hethi.dupload_status.status = document_status And
  hethi.dupload_file.lastupuser = user;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_all_bps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_all_bps`(in varcustomer_id int)
BEGIN
Select
  cbpaas_service_offering.BpaaS_id,
  cbpaas_service_offering.BPaaS_service
From
  cbpaas_service_offering
Where
  cbpaas_service_offering.BpaaS_id Not In (Select
    ciconnector_efs.BpaaS_id
  From
    ciconnector_efs Inner Join
    dupload_file On dupload_file.efs_uin = ciconnector_efs.efs_uin Inner Join
    dcustomer_upload On dcustomer_upload.upload_id = dupload_file.upload_id
  Where
    dcustomer_upload.customer_id = varcustomer_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_all_forms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_all_forms`(in varcustomer_id int,in varBpaas_id char(8),in varefs_uin char(10))
BEGIN
Select
  cbpaas_service_offering.BpaaS_id,
  cbpaas_service_offering.BPaaS_service,
  cindustry_offering.indus_id,
  cindustry_offering.indus_service,
  uicflob.form_type_decription_short,
  uicflob.form_type_decription_long,
  uicflob.form_type_image_id,
  cform_lob.form_type,
  cform_lob.form_stencid,
  uicflob.efslob_id,
  ui_images.image_type_id,
  ui_images.image_path,
  ui_images.image_alt_text,
 ciconnector_efs.efs_uin
From
  cbpaas_service_offering Inner Join
  ciconnector_efs On ciconnector_efs.BpaaS_id = cbpaas_service_offering.BpaaS_id
  Inner Join
  cindustry_offering On ciconnector_efs.indus_id = cindustry_offering.indus_id
  Inner Join
  cform_lob On ciconnector_efs.efslob_id = cform_lob.efslob_id Inner Join
  uicflob On cform_lob.efslob_id = uicflob.efslob_id Inner Join
  ui_images On uicflob.form_type_image_id = ui_images.image_id
Where
  cbpaas_service_offering.BpaaS_id = varBpaaS_id And
  uicflob.efslob_id not in (Select
  uicflob.efslob_id
From
  cbpaas_service_offering Inner Join
  ciconnector_efs On ciconnector_efs.BpaaS_id = cbpaas_service_offering.BpaaS_id
  Inner Join
  dupload_file On dupload_file.efs_uin = ciconnector_efs.efs_uin Inner Join
  dcustomer_upload On dupload_file.upload_id = dcustomer_upload.upload_id
  Inner Join
  cindustry_offering On ciconnector_efs.indus_id = cindustry_offering.indus_id
  Inner Join
  cform_lob On ciconnector_efs.efslob_id = cform_lob.efslob_id Inner Join
  uicflob On cform_lob.efslob_id = uicflob.efslob_id
Where
  cbpaas_service_offering.BpaaS_id = varBpaaS_id And
  dcustomer_upload.customer_id = varcustomer_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_artistlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `load_artistlist`(
in customer_id int)
BEGIN
  Select
  hethi.roles.*
From
  hethi.roles Inner Join
  hethi.drole On hethi.roles.role_id = hethi.drole.role_id
Where
  hethi.drole.customer_id = customer_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_ccore_serviceplays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `load_ccore_serviceplays`(in varcustomer_id int,in varefs_uin char(10))
BEGIN
Select
  csconnector.sfs_UIN,
  csconnector.hethi_service_id,
  csconnector.subservice_id,
  csconnector.service_id,
  ccore_services.master_service,
  ccore_serviceplays.hethi_subservicecode,
  chethi_services.hethi_servicecode,
  (Select
    IfNull('true', false)
  From
    dassign_customer_serviceplay
  Where
    dassign_customer_serviceplay.sfs_uin =  csconnector.sfs_UIN And
    dassign_customer_serviceplay.efs_uin =  varefs_uin And
    dassign_customer_serviceplay.customer_id = varcustomer_id)as `status`
From
  csconnector Inner Join
  ccore_services On csconnector.service_id = ccore_services.service_id
  Inner Join
  chethi_services On chethi_services.service_id = ccore_services.service_id And
    csconnector.hethi_service_id = chethi_services.hethi_service_id Inner Join
  ccore_serviceplays On ccore_serviceplays.serviceplay_id =
    csconnector.subservice_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_current_forms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_current_forms`(in varcustomer_id int,in varBpaas_id char(8),in varefs_uin char(10))
BEGIN
Select
  cbpaas_service_offering.BpaaS_id,
  cbpaas_service_offering.BPaaS_service,
  cindustry_offering.indus_id,
  cindustry_offering.indus_service,
  ciconnector_efs.efs_uin,
  cform_lob.form_stencid,
  uicflob.efslob_id,
  uicflob.form_type_decription_short,
  uicflob.form_type_decription_long,
  uicflob.form_type_image_id,
  ui_images.image_type_id,
  ui_images.image_path,
  ui_images.image_alt_text
From
  cbpaas_service_offering Inner Join
  ciconnector_efs On ciconnector_efs.BpaaS_id = cbpaas_service_offering.BpaaS_id
  Inner Join
  dupload_file On dupload_file.efs_uin = ciconnector_efs.efs_uin Inner Join
  dcustomer_upload On dupload_file.upload_id = dcustomer_upload.upload_id
  Inner Join
  cindustry_offering On ciconnector_efs.indus_id = cindustry_offering.indus_id
  Inner Join
  cform_lob On ciconnector_efs.efslob_id = cform_lob.efslob_id Inner Join
  uicflob On cform_lob.efslob_id = uicflob.efslob_id Inner Join
  ui_images On uicflob.form_type_image_id = ui_images.image_id
Where
  cbpaas_service_offering.BpaaS_id = varBpaaS_id And
  dcustomer_upload.customer_id = varcustomer_id
group by ciconnector_efs.efs_uin;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_customer_cloud` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_customer_cloud`(in varcustomer_id int)
BEGIN
Select
  chethi_services1.hethi_servicecode,
  dassign_customer_serviceplay1.efs_uin,
   (Select
    ifnull(true,false)
  From
    dassign_customer_serviceplay Inner Join
    csconnector On csconnector.sfs_UIN = dassign_customer_serviceplay.sfs_uin
    Inner Join
    chethi_services On csconnector.hethi_service_id =
      chethi_services.hethi_service_id
  Where
    chethi_services.hethi_service_id = chethi_services1.hethi_service_id and
    dassign_customer_serviceplay.customer_id=dassign_customer_serviceplay1.customer_id
  Group By
    chethi_services.hethi_service_id, dassign_customer_serviceplay.efs_uin
  Order By
    dassign_customer_serviceplay.efs_uin
  Limit 1) As hethi_servicecode
From
  chethi_services chethi_services1,
  dassign_customer_serviceplay dassign_customer_serviceplay1,
  csconnector csconnector1 
  where dassign_customer_serviceplay1.customer_id=varcustomer_id
Group By
  dassign_customer_serviceplay1.efs_uin, chethi_services1.hethi_service_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_customer_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_customer_list`()
BEGIN
Select 
dcustomer.customer_id,dupload_file.*,
cbpaas_service_offering.BPaaS_service,
cindustry_offering.indus_service,
dcustomer.customer_name,
cform_lob.form_type,dupload_file.file_location,
dupload_file.efs_uin, 
dupload_file.file_status,
cbpaas_service_offering.BpaaS_id,
cindustry_offering.indus_id,
cform_lob.form_stencid,cform_lob.efslob_id 
From dupload_file Inner Join ciconnector_efs 
On dupload_file.efs_uin = ciconnector_efs.efs_uin 
Inner Join cbpaas_service_offering On 
ciconnector_efs.BpaaS_id = cbpaas_service_offering.BpaaS_id 
Inner Join cindustry_offering On 
ciconnector_efs.indus_id = cindustry_offering.indus_id 
Inner Join cform_lob On 
ciconnector_efs.efslob_id = cform_lob.efslob_id 
Inner Join dcustomer_upload On 
dupload_file.upload_id = dcustomer_upload.upload_id 
Inner Join dcustomer On 
dcustomer.customer_id = dcustomer_upload.customer_id 
Where dcustomer_upload.business_artist Is Null  group by dupload_file.upload_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_customer_serviceplay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `load_customer_serviceplay`(in customer_id int)
BEGIN
Select
  csconnector.sfs_UIN,
  csconnector.hethi_service_id,
  csconnector.subservice_id,
  csconnector.service_id,
  ccore_services.master_service,
  ccore_serviceplays.hethi_subservicecode,
  chethi_services.hethi_servicecode,
  dassign_customer_serviceplay.customer_id,
  hethi.uiccore_serviceplays.serviceplay_decription_short,
  hethi.uiccore_serviceplays.serviceplay_decription_long,
  hethi.uiccore_serviceplays.serviceplay_image_id,
  hethi.uiccore_serviceplays.serviceplay_status
From
  csconnector Inner Join
  ccore_services On csconnector.service_id = ccore_services.service_id
  Inner Join
  chethi_services On chethi_services.service_id = ccore_services.service_id And
    csconnector.hethi_service_id = chethi_services.hethi_service_id Inner Join
  ccore_serviceplays On ccore_serviceplays.serviceplay_id =
    csconnector.subservice_id Inner Join
  dassign_customer_serviceplay On csconnector.sfs_UIN =
    dassign_customer_serviceplay.sfs_uin Inner Join
  hethi.uiccore_serviceplays On ccore_serviceplays.serviceplay_id =
    hethi.uiccore_serviceplays.serviceplay_id
Where
  dassign_customer_serviceplay.customer_id = customer_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_customer_uploaded_forms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_customer_uploaded_forms`(in varcustomer_id int)
BEGIN
Select
  cbpaas_service_offering.BpaaS_id,
  cbpaas_service_offering.BPaaS_service,
  cindustry_offering.indus_id,
  cindustry_offering.indus_service,
  ciconnector_efs.efs_uin,
  uicflob.efslob_id,
  uicflob.form_type_decription_short,
  uicflob.form_type_decription_long,
  uicflob.form_type_image_id,
  ui_images.image_type_id,
  ui_images.image_path,
  ui_images.image_alt_text
From
  cbpaas_service_offering Inner Join
  ciconnector_efs On ciconnector_efs.BpaaS_id = cbpaas_service_offering.BpaaS_id
  Inner Join
  dupload_file On dupload_file.efs_uin = ciconnector_efs.efs_uin Inner Join
  dcustomer_upload On dupload_file.upload_id = dcustomer_upload.upload_id
  Inner Join
  cindustry_offering On ciconnector_efs.indus_id = cindustry_offering.indus_id
  Inner Join
  cform_lob On ciconnector_efs.efslob_id = cform_lob.efslob_id Inner Join
  uicflob On cform_lob.efslob_id = uicflob.efslob_id Inner Join
  ui_images On uicflob.form_type_image_id = ui_images.image_id
Where
  dcustomer_upload.customer_id = varcustomer_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_existing_bps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_existing_bps`(in varcustomer_id int)
BEGIN
Select
  cbpaas_service_offering.BpaaS_id,
  cbpaas_service_offering.BPaaS_service,
  ciconnector_efs.efs_uin
From
  cbpaas_service_offering Inner Join
  ciconnector_efs On ciconnector_efs.BpaaS_id = cbpaas_service_offering.BpaaS_id
  Inner Join
  dupload_file On dupload_file.efs_uin = ciconnector_efs.efs_uin Inner Join
  dcustomer_upload On dupload_file.upload_id = dcustomer_upload.upload_id
Where
  dcustomer_upload.customer_id = varcustomer_id
Group By
  cbpaas_service_offering.BpaaS_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_form_rule_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_form_rule_process`(in varcustomer_id int,in varefs_uin char(10))
BEGIN
Select
  dassign_customer_serviceplay.efs_uin,
  dassign_customer_serviceplay.sfs_uin,
  ccore_serviceplays.serviceplay_id,
  ccore_serviceplays.hethi_subservicecode,
  chethi_services.hethi_servicecode
From
  dassign_customer_serviceplay Inner Join
  csconnector On dassign_customer_serviceplay.sfs_uin = csconnector.sfs_UIN
  Inner Join
  ccore_serviceplays On csconnector.subservice_id =
    ccore_serviceplays.serviceplay_id Inner Join
  chethi_services On ccore_serviceplays.hethi_service_id =
    chethi_services.hethi_service_id
Where
  dassign_customer_serviceplay.customer_id = varcustomer_id And
  dassign_customer_serviceplay.efs_uin = varefs_uin;
if((Select
  Max(dcustomrules.customer_id)
From
  dcustomrules
Where
  dcustomrules.customer_id = varcustomer_id And
  dcustomrules.efs_uin = varefs_uin)!='')then
Select
  crules.rule_id,
  crules.rule_name,
  cruleworkset.workset_id,
  cruleworkset.workset_name,
  crulepackage.rule_package_id,
  crulepackage.rule_package_name,
  ciconnector_rules.rule_uin,
  dcustomrules.sfs_uin,
  dcustomrules.efs_uin,
  dcustomrules.queue_id,
  dcustomrules.zone_id,
  dcustomrules.rule_condition,
  dcustomrules.rule_action,
  dcustomrules.rule_exception,
  dcustomrules.rule_workset,
  cruleworkset1.workset_name As rule_workset_name,
  ccore_serviceplays.hethi_subservicecode
From
  dcustomrules Inner Join
  dassign_customer_serviceplay On dassign_customer_serviceplay.sfs_uin =
    dcustomrules.sfs_uin And dassign_customer_serviceplay.efs_uin =
    dcustomrules.efs_uin And dassign_customer_serviceplay.customer_id=
    dcustomrules.customer_id Inner Join
  ciconnector_rules On dcustomrules.rule_uin = ciconnector_rules.rule_uin
  Inner Join
  crules On ciconnector_rules.rule_id = crules.rule_id Inner Join
  cruleworkset On ciconnector_rules.workset_id = cruleworkset.workset_id
  Inner Join
  crulepackage On ciconnector_rules.rule_package_id =
    crulepackage.rule_package_id Inner Join
  cruleworkset cruleworkset1 On dcustomrules.rule_workset =
    cruleworkset1.workset_id Inner Join
  csconnector On dassign_customer_serviceplay.sfs_uin = csconnector.sfs_UIN
  Inner Join
  ccore_serviceplays On csconnector.subservice_id =
    ccore_serviceplays.serviceplay_id
Where
  dassign_customer_serviceplay.efs_uin = varefs_uin And
  dassign_customer_serviceplay.customer_id = varcustomer_id;
else 
Select
  crules.rule_id,
  crules.rule_name,
  cruleworkset.workset_id,
  cruleworkset.workset_name,
  crulepackage.rule_package_id,
  crulepackage.rule_package_name,
  ciconnector_rules.rule_uin,
  dsoprules.sfs_uin,
  dsoprules.efs_uin,
  dsoprules.queue_id,
  dsoprules.zone_id,
  dsoprules.rule_condition,
  dsoprules.rule_action,
  dsoprules.rule_exception,
  dsoprules.rule_workset,
  cruleworkset1.workset_name As rule_workset_name,
  ccore_serviceplays.hethi_subservicecode
From
  dsoprules Inner Join
  dassign_customer_serviceplay On dassign_customer_serviceplay.sfs_uin =
    dsoprules.sfs_uin And dassign_customer_serviceplay.efs_uin =
    dsoprules.efs_uin Inner Join
  ciconnector_rules On dsoprules.rule_uin = ciconnector_rules.rule_uin
  Inner Join
  crules On ciconnector_rules.rule_id = crules.rule_id Inner Join
  cruleworkset On ciconnector_rules.workset_id = cruleworkset.workset_id
  Inner Join
  crulepackage On ciconnector_rules.rule_package_id =
    crulepackage.rule_package_id Inner Join
  cruleworkset cruleworkset1 On dsoprules.rule_workset =
    cruleworkset1.workset_id Inner Join
  csconnector On dassign_customer_serviceplay.sfs_uin = csconnector.sfs_UIN
  Inner Join
  ccore_serviceplays On csconnector.subservice_id =
    ccore_serviceplays.serviceplay_id
Where
  dassign_customer_serviceplay.efs_uin = varefs_uin And
  dassign_customer_serviceplay.customer_id = varcustomer_id;
end if;
Select
  customer_flow.flow_data
From
  customer_flow
Where
  customer_flow.efs_uin = varefs_uin And
  customer_flow.customer_id = varcustomer_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_hethi_artist_task_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `load_hethi_artist_task_list`(
in business_artist bigint)
BEGIN
Select
  hethi.ciconnector_efs.*,
  hethi.cbpaas_service_offering.BPaaS_service,
  hethi.uicbpaas_service_offering.BpaaS_service_image_id,
  hethi.uicbpaas_service_offering.BpaaS_service_description_short,
  hethi.uicbpaas_service_offering.BpaaS_service_description_long,
  hethi.uicbpaas_service_offering.BpaaS_service_status,
  hethi.cindustry_offering.indus_service,
  hethi.uicindustry_offering.industry_decription_short,
  hethi.uicindustry_offering.industry_decription_long,
  hethi.uicindustry_offering.industry_image_id,
  hethi.uicindustry_offering.industry_status,
  hethi.cform_lob.form_bclass,
  hethi.cform_lob.form_bsource,
  hethi.cform_lob.form_type,
  hethi.cform_lob.form_stencid,
  hethi.uicflob.form_type_decription_short,
  hethi.uicflob.form_type_decription_long,
  hethi.uicflob.form_type_image_id,
  hethi.uicflob.form_type_status,
  hethi.dcustomer.customer_name,
  hethi.dupload_file.upload_id,
  hethi.dupload_file.file_id,
  hethi.dupload_file.file_location,
  hethi.dcustomer_upload.*
From
   ciconnector_efs Inner Join
  cbpaas_service_offering On ciconnector_efs.BpaaS_id =
    cbpaas_service_offering.BpaaS_id Inner Join
  uicbpaas_service_offering On cbpaas_service_offering.BpaaS_id =
    uicbpaas_service_offering.BpaaS_id Inner Join
  cindustry_offering On ciconnector_efs.indus_id = cindustry_offering.indus_id
  Inner Join
  uicindustry_offering On cindustry_offering.indus_id =
    uicindustry_offering.indus_id Inner Join
  cform_lob On ciconnector_efs.efslob_id = cform_lob.efslob_id Inner Join
  uicflob On cform_lob.efslob_id = uicflob.efslob_id Inner Join
  dupload_file On ciconnector_efs.efs_uin = dupload_file.efs_uin Inner Join
  dcustomer_upload On dupload_file.upload_id = dcustomer_upload.upload_id
  Inner Join
  dcustomer On dcustomer.customer_id = dcustomer_upload.customer_id Inner Join
  dupload_status On dcustomer_upload.upload_id = dupload_status.upload_id
Where
 hethi.uicbpaas_service_offering.BpaaS_service_status = 1
 and hethi.dcustomer_upload.business_artist=business_artist and 
hethi.dupload_status.status=2 group by hethi.dupload_file.upload_id ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_hethi_services` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_hethi_services`(in varcustomer_id int)
BEGIN
Select
  chethi_services.hethi_servicecode,
  uichethiservices.hethi_service_id,
  uichethiservices.hethiservices_decription_short,
  uichethiservices.hethiservices_decription_long,
  uichethiservices.hethiservices_image_id,
  ui_images.image_type_id,
  ui_images.image_path,
  ui_images.image_alt_text,
  (Select
    ifnull(max(1),0)
  From
    dassign_customer_serviceplay Inner Join
    csconnector On dassign_customer_serviceplay.sfs_uin = csconnector.sfs_UIN
  Where
    chethi_services.hethi_service_id = csconnector.hethi_service_id And
    dassign_customer_serviceplay.customer_id = varcustomer_id)as ServiceStatus
From
  chethi_services Inner Join
  uichethiservices On chethi_services.hethi_service_id =
    uichethiservices.hethi_service_id Inner Join
  ui_images On uichethiservices.hethiservices_image_id = ui_images.image_id
Group By
  uichethiservices.hethi_service_id;
Select
  chethi_services1.hethi_servicecode,
  dassign_customer_serviceplay1.efs_uin,
   (Select
    ifnull(true,false)
  From
    dassign_customer_serviceplay Inner Join
    csconnector On csconnector.sfs_UIN = dassign_customer_serviceplay.sfs_uin
    Inner Join
    chethi_services On csconnector.hethi_service_id =
      chethi_services.hethi_service_id
  Where
    chethi_services.hethi_service_id = chethi_services1.hethi_service_id and
    dassign_customer_serviceplay.customer_id=dassign_customer_serviceplay1.customer_id and 
    dassign_customer_serviceplay.efs_uin=dassign_customer_serviceplay1.efs_uin
  Group By
    chethi_services.hethi_service_id, dassign_customer_serviceplay.efs_uin
  Order By
    dassign_customer_serviceplay.efs_uin
  Limit 1) As isAssigned
From
  chethi_services chethi_services1,
  dassign_customer_serviceplay dassign_customer_serviceplay1,
  csconnector csconnector1 
  where dassign_customer_serviceplay1.customer_id=varcustomer_id
Group By
  dassign_customer_serviceplay1.efs_uin, chethi_services1.hethi_service_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_next_serviceplay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_next_serviceplay`(in cid int,in EFS char(10), in SFS char(10))
BEGIN

declare customRuleStatus int default 0;
Select
  hethi.dcustomerserviceplayqueue.customer_id,
  hethi.dcustomerserviceplayqueue.tfs_uin,
  hethi.dcustomerserviceplayqueue.efs_uin,
  hethi.dcustomerserviceplayqueue.sfs_uin,
  hethi.dcustomerserviceplayqueue.queue_id,
  hethi.dcustomerserviceplayqueue.next_queue,
  hethi.dcustomerserviceplayqueue.exception_queue,
  ccore_serviceplays2.hethi_subservicecode As current_channel,
  hethi.ccore_serviceplays.hethi_subservicecode As next_channel,
  ccore_serviceplays1.hethi_subservicecode As exception_channel
From
  hethi.dcustomerserviceplayqueue Inner Join
  hethi.csconnector On hethi.dcustomerserviceplayqueue.next_queue =
    hethi.csconnector.sfs_UIN Inner Join
  hethi.ccore_serviceplays On hethi.csconnector.subservice_id =
    hethi.ccore_serviceplays.serviceplay_id And
    hethi.csconnector.hethi_service_id =
    hethi.ccore_serviceplays.hethi_service_id Inner Join
  hethi.csconnector csconnector1
    On hethi.dcustomerserviceplayqueue.exception_queue = csconnector1.sfs_UIN
  Inner Join
  hethi.ccore_serviceplays ccore_serviceplays1 On csconnector1.subservice_id =
    ccore_serviceplays1.serviceplay_id And ccore_serviceplays1.hethi_service_id
    = csconnector1.hethi_service_id Inner Join
  hethi.csconnector csconnector2 On hethi.dcustomerserviceplayqueue.sfs_uin =
    csconnector2.sfs_UIN Inner Join
  hethi.ccore_serviceplays ccore_serviceplays2 On csconnector2.hethi_service_id
    = ccore_serviceplays2.hethi_service_id And csconnector2.subservice_id =
    ccore_serviceplays2.serviceplay_id
Where
  hethi.dcustomerserviceplayqueue.customer_id = cid And
  hethi.dcustomerserviceplayqueue.efs_uin = EFS And
  hethi.dcustomerserviceplayqueue.sfs_uin = SFS;


set customRuleStatus=(select ifnull((SELECT `dcustomrules`.`customer_id`
						FROM `hethi`.`dcustomrules` 
						where`dcustomrules`.`efs_uin`=EFS
						and `dcustomrules`.`sfs_uin`=SFS
						and `dcustomrules`.`customer_id`= cid limit 1 ),0));

if(customRuleStatus = 0) then

Select
  'SOP_RULES' As rule_source,
  hethi.dsoprules.sfs_uin,
  hethi.dsoprules.efs_uin,
  hethi.dsoprules.queue_id,
  hethi.dsoprules.rule_uin,
  hethi.dsoprules.rule_workset,
  hethi.dsoprules.rule_action,
  hethi.dsoprules.rule_condition,
  hethi.dsoprules.rule_exception,
  hethi.dsoprules.zone_id,
  hethi.crules.rule_name,
  hethi.crules.rule_desc,
  hethi.crules.rule_type,
  hethi.ciconnector_rules.rule_package_id,
  hethi.ciconnector_rules.workset_id
From
  hethi.dsoprules Inner Join
  hethi.ciconnector_rules On hethi.dsoprules.rule_uin =
    hethi.ciconnector_rules.rule_uin Inner Join
  hethi.crules On hethi.ciconnector_rules.rule_id = hethi.crules.rule_id
where dsoprules.efs_uin= EFS
and  dsoprules.sfs_uin= SFS;



else

Select
  'CUSTOM_RULES' As rule_source,
  hethi.dcustomrules.sfs_uin,
  hethi.dcustomrules.efs_uin,
  hethi.dcustomrules.queue_id,
  hethi.dcustomrules.rule_uin,
  hethi.dcustomrules.rule_workset,
  hethi.dcustomrules.rule_action,
  hethi.dcustomrules.rule_condition,
  hethi.dcustomrules.rule_exception,
  hethi.dcustomrules.zone_id,
  hethi.dcustomrules.rule_name,
  hethi.crules.rule_desc,
  hethi.crules.rule_type,
  hethi.ciconnector_rules.rule_package_id,
  hethi.ciconnector_rules.workset_id
From
  hethi.dcustomrules Inner Join
  hethi.ciconnector_rules On hethi.dcustomrules.rule_uin =
    hethi.ciconnector_rules.rule_uin Inner Join
  hethi.crules On hethi.ciconnector_rules.rule_id = hethi.crules.rule_id
Where
 dcustomrules.efs_uin = EFS
and  dcustomrules.sfs_uin = SFS
and  dcustomrules.customer_id = cid ;


end if;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_offer_serviceplay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `load_offer_serviceplay`()
BEGIN

SELECT `hethi_offers`.*
FROM `hethi`.`hethi_offers`;



SELECT `hethi_offers_details`.*
   
FROM `hethi`.`hethi_offers_details`;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_rules_by_sfs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_rules_by_sfs`(in varcustomer_id int,in varuser_id int,in vartfs_uin char(10),in varefs_uin char(10),in varsfs_uin char(10))
BEGIN
Select * from hethi.cruleworkset;
Select * from hethi.cruleset;

Select
  hethi.cstandardrules.*,
  hethi.cruleset.*,
  hethi.cruleworkset.*
From
  hethi.cstandardrules Inner Join
  hethi.cruleset On hethi.cstandardrules.ruleset_id = hethi.cruleset.cruleset_id
  Inner Join
  hethi.cruleworkset On hethi.cruleset.workset_id =
    hethi.cruleworkset.workset_id
Where
  hethi.cstandardrules.rule_status = 1 And
  hethi.cstandardrules.effective_enddate >= curdate();


Select
  hethi.dcustomrules.*,
  hethi.cruleworkset.*
From
  hethi.dcustomrules Inner Join
  hethi.cruleworkset On hethi.dcustomrules.rule_workset =
    hethi.cruleworkset.workset_id
where 
 hethi.dcustomrules.customer_id=varcustomer_id and
 hethi.dcustomrules.efs_uin=varefs_uin and
 hethi.dcustomrules.sfs_uin=varsfs_uin ;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_rules_by_sfs1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_rules_by_sfs1`(in varcustomer_id int,in varuser_id int,in vartfs_uin char(10),in varefs_uin char(10),in varsfs_uin char(10))
BEGIN

SELECT
`cstandardrules`.`effective_enddate`,
`cstandardrules`.`effective_startdate`,
`cstandardrules`.`efs_uin`,
`cstandardrules`.`lastupdtm`,
`cstandardrules`.`lastupuser`,
`cstandardrules`.`rule_action`,
`cstandardrules`.`rule_comments`,
`cstandardrules`.`rule_condition`,
`cstandardrules`.`rule_name`,
`cstandardrules`.`rule_order`,
`cstandardrules`.`rule_status`,
`cstandardrules`.`rule_type`,
`cstandardrules`.`rule_uin`,
`cstandardrules`.`ruleset_id`
FROM `hethi`.`cstandardrules`;


Select
  hethi.dcustomrules.*,
  hethi.cruleworkset.*
From
  hethi.dcustomrules Inner Join
  hethi.cruleworkset On hethi.dcustomrules.rule_workset =
    hethi.cruleworkset.workset_id
where 
 hethi.dcustomrules.customer_id=varcustomer_id and
 hethi.dcustomrules.efs_uin=varefs_uin and
 hethi.dcustomrules.sfs_uin=varsfs_uin ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_rules_packages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_rules_packages`()
BEGIN
SELECT
`crulepackage`.`lastupdtm`,
`crulepackage`.`lastupuser`,
`crulepackage`.`rule_package_desc`,
`crulepackage`.`rule_package_id`,
`crulepackage`.`rule_package_name`
FROM `hethi`.`crulepackage`;
SELECT
`cruleworkset`.`crulespackage_id`,
`cruleworkset`.`effective_enddate`,
`cruleworkset`.`effective_startdate`,
`cruleworkset`.`lastupdtm`,
`cruleworkset`.`lastupuser`,
`cruleworkset`.`workset_desc`,
`cruleworkset`.`workset_id`,
`cruleworkset`.`workset_name`,
`cruleworkset`.`workset_order`
FROM `hethi`.`cruleworkset`;

SELECT
`cruleset`.`cruleset_desc`,
`cruleset`.`cruleset_id`,
`cruleset`.`crulespackages_id`,
`cruleset`.`crulesset_name`,
`cruleset`.`effective_enddate`,
`cruleset`.`effective_startdate`,
`cruleset`.`lastupuser`,
`cruleset`.`lasyupdtm`,
`cruleset`.`ruleset_order`,
`cruleset`.`workset_id`
FROM `hethi`.`cruleset`;

SELECT

`cstandardrules`.`efs_uin`,
`cstandardrules`.`lastupdtm`,
`cstandardrules`.`lastupuser`,
`cstandardrules`.`rule_action`,
`cstandardrules`.`rule_comments`,
`cstandardrules`.`rule_condition`,
`cstandardrules`.`rule_name`,
`cstandardrules`.`rule_order`,
`cstandardrules`.`rule_status`,
`cstandardrules`.`rule_uin`,
`cstandardrules`.`ruleset_id`
FROM `hethi`.`cstandardrules`;

SELECT
`rule_operators`.`category`,
`rule_operators`.`operation_id`,
`rule_operators`.`operation_name`,
`rule_operators`.`type`
FROM `hethi`.`rule_operators`;

Select
  cform_lob.form_type,
  ciconnector_efs.efs_uin,
  ciconnector_efs.efslob_id,
  cform_lob.form_ownerid,
  ciconnector_efs.indus_id,
cindustry_offering.indus_service
From
  cform_lob Inner Join
  ciconnector_efs On cform_lob.efslob_id = ciconnector_efs.efslob_id 
Inner Join cindustry_offering on cindustry_offering.indus_id=ciconnector_efs.indus_id;

SELECT
`chethi_services`.`hethi_service_id`,
`chethi_services`.`hethi_servicecode`,
`chethi_services`.`lastupdtm`,
`chethi_services`.`lastupuser`,
`chethi_services`.`service_id`
FROM `hethi`.`chethi_services`;
SELECT
`ccore_serviceplays`.`hethi_service_id`,
`ccore_serviceplays`.`hethi_subservicecode`,
`ccore_serviceplays`.`lastupdtm`,
`ccore_serviceplays`.`lastupuser`,
`ccore_serviceplays`.`serviceplay_id`
FROM `hethi`.`ccore_serviceplays`;
SELECT
`businessrules_exception`.`action_by_user`,
`businessrules_exception`.`efs_uin`,
`businessrules_exception`.`exception_code`,
`businessrules_exception`.`exception_log`,
`businessrules_exception`.`exception_name`,
`businessrules_exception`.`exception_priority`,
`businessrules_exception`.`exception_queue`
FROM `hethi`.`businessrules_exception`;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_task_list_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `load_task_list_by_user`(in customerID bigint,in roleID bigint)
BEGIN
Select
  dcustomer_upload.customer_id,
  dcustomer.customer_name,
  dupload_status.*,
  ciconnector_efs.*,
  uicindustry_offering.industry_decription_short,
  cbpaas_service_offering.BPaaS_service,
  uicflob.form_type_decription_short,
  cindustry_offering.indus_service,
  cform_lob.form_bsource,
  hethi.cjob.job_name,
  hethi.cjob_flow.next_job_id
From
  ciconnector_efs Inner Join
  cbpaas_service_offering On ciconnector_efs.BpaaS_id =
    cbpaas_service_offering.BpaaS_id Inner Join
  uicbpaas_service_offering On cbpaas_service_offering.BpaaS_id =
    uicbpaas_service_offering.BpaaS_id Inner Join
  cindustry_offering On ciconnector_efs.indus_id = cindustry_offering.indus_id
  Inner Join
  uicindustry_offering On cindustry_offering.indus_id =
    uicindustry_offering.indus_id Inner Join
  cform_lob On ciconnector_efs.efslob_id = cform_lob.efslob_id Inner Join
  uicflob On cform_lob.efslob_id = uicflob.efslob_id Inner Join
  dupload_file On ciconnector_efs.efs_uin = dupload_file.efs_uin Inner Join
  dcustomer_upload On dupload_file.upload_id = dcustomer_upload.upload_id
  Inner Join
  dcustomer On dcustomer.customer_id = dcustomer_upload.customer_id Inner Join
  dupload_status On dcustomer_upload.upload_id = dupload_status.upload_id
  Inner Join
  hethi.cjob_flow On dupload_status.status = hethi.cjob_flow.current_job_id
  Inner Join
  hethi.cjob On hethi.cjob_flow.next_job_id = hethi.cjob.job_id
Where
  dcustomer_upload.customer_id = customerID And
  hethi.dupload_status.status = roleID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_userlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_userlist`()
BEGIN
 SELECT
`dcustomer`.`business_address`,
`dcustomer`.`business_email`,
`dcustomer`.`business_fax`,
`dcustomer`.`business_name`,
`dcustomer`.`contact_name`,
`dcustomer`.`contact_number`,
`dcustomer`.`customer_id`,
`dcustomer`.`customer_name`
FROM `hethi`.`dcustomer`;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `previewEfs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `previewEfs`(in stencilid bigint)
BEGIN
Select
  hethi.cindexclassifystencil.*,
  hethi.dupload_file.file_location
From
  hethi.cindexclassifystencil Inner Join
  hethi.dupload_file On hethi.cindexclassifystencil.form_stencid =
    hethi.dupload_file.stencil_id
Where
  hethi.cindexclassifystencil.form_stencid = stencilid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `previewgenerator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `previewgenerator`(
in uploadid int,in fileid int)
BEGIN
 Select
  hethi.cindexclassifystencil.form_stencid,
  hethi.cindexclassifystencil.eFS_XSD,
  hethi.cindexclassifystencil.eFS_XSD_location as metadata,
  hethi.dupload_file.upload_id,
  hethi.dupload_file.file_id,
  hethi.dupload_file.file_location
From
  hethi.cindexclassifystencil Inner Join
  hethi.dupload_file On hethi.cindexclassifystencil.form_stencid =
    hethi.dupload_file.efs_uin
Where
  hethi.dupload_file.upload_id = uploadid And
  hethi.dupload_file.file_id = fileid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reorderRulesSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `reorderRulesSequence`(in packageId varchar(10),in workSet varchar(10),
in ruleSet varchar(10), in rule_sequence text)
BEGIN
declare RowCount int default  ExtractValue(rule_sequence,'count(//data)');
declare i int default 1;
declare customerId,ruleOrder,zoneId int(11);
declare ruleAction,ruleCondition,ruleException varchar(500);
declare ruleName varchar(100);
declare lastUpUser,ruleWorkset,ruleSetId,sfsUin,efsUin,queuId,ruleIn char(10);
DELETE FROM `hethi`.`dcustomrules`
WHERE `dcustomrules`.`ruleset_id`=ruleSet;


while i<=RowCount do
set customerId=ExtractValue(rule_sequence,'/root/data[$i]/customer_id');
set efsUin=ExtractValue(rule_sequence,'/root/data[$i]/efs_uin');
set lastUpUser=ExtractValue(rule_sequence,'/root/data[$i]/lastupuser');
set queuId=ExtractValue(rule_sequence,'/root/data[$i]/queue_id');
set ruleAction=ExtractValue(rule_sequence,'/root/data[$i]/rule_action');
set ruleCondition=ExtractValue(rule_sequence,'/root/data[$i]/rule_condition');
set ruleException=ExtractValue(rule_sequence,'/root/data[$i]/rule_exception');
set ruleName=ExtractValue(rule_sequence,'/root/data[$i]/rule_name');
set ruleOrder=ExtractValue(rule_sequence,'/root/data[$i]/rule_order');
set ruleIn=ExtractValue(rule_sequence,'/root/data[$i]/rule_uin');
set ruleWorkset=ExtractValue(rule_sequence,'/root/data[$i]/rule_workset');
set ruleSetId=ExtractValue(rule_sequence,'/root/data[$i]/ruleset_id');
set sfsUin=ExtractValue(rule_sequence,'/root/data[$i]/sfs_uin');
set zoneId=ExtractValue(rule_sequence,'/root/data[$i]/zone_id');



INSERT INTO `hethi`.`dcustomrules`
(`customer_id`,
`efs_uin`,
`lastupdtm`,
`lastupuser`,
`queue_id`,
`rule_action`,
`rule_condition`,
`rule_exception`,
`rule_name`,
`rule_order`,
`rule_uin`,
`rule_workset`,
`ruleset_id`,
`sfs_uin`,
`zone_id`)
VALUES
(
customerId,
efsUin,
now(),
lastUpUser,
queuId,
ruleAction,
ruleCondition,
ruleException,
ruleName,
ruleOrder,
ruleIn,
ruleWorkset,
ruleSetId,
sfsUin,
zoneId
);
set i=i+1;

end while;

SELECT
`dcustomrules`.`customer_id`,
`dcustomrules`.`efs_uin`,
`dcustomrules`.`lastupdtm`,
`dcustomrules`.`lastupuser`,
`dcustomrules`.`queue_id`,
`dcustomrules`.`rule_action`,
`dcustomrules`.`rule_condition`,
`dcustomrules`.`rule_exception`,
`dcustomrules`.`rule_name`,
`dcustomrules`.`rule_order`,
`dcustomrules`.`rule_uin`,
`dcustomrules`.`rule_workset`,
`dcustomrules`.`ruleset_id`,
`dcustomrules`.`sfs_uin`,
`dcustomrules`.`zone_id`
FROM `hethi`.`dcustomrules` where 
`dcustomrules`.`ruleset_id`=ruleSetId;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reorderRulesSetSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `reorderRulesSetSequence`(in packageId varchar(10),in workSet varchar(10),
in ruleSet varchar(10), in ruleset_sequence text)
BEGIN
declare RowCount int default  ExtractValue(ruleset_sequence,'count(//data)');
declare i int default 1;
declare cRuleSetOrder int;
declare crulesetDesc varchar(250);
declare cruleSetName varchar(100);
declare cWorkset,cPackage,cRuleSet,lastUpUser varchar(10);
DELETE FROM `hethi`.`cruleset`
WHERE `cruleset`.`workset_id`=workSet;

while i<=RowCount do
set crulesetDesc=ExtractValue(ruleset_sequence,'/root/data[$i]/cruleset_desc');
set cRuleSet=ExtractValue(ruleset_sequence,'/root/data[$i]/cruleset_id');
set cPackage=ExtractValue(ruleset_sequence,'/root/data[$i]/crulespackages_id');
set cruleSetName=ExtractValue(ruleset_sequence,'/root/data[$i]/crulesset_name');
set lastUpUser=ExtractValue(ruleset_sequence,'/root/data[$i]/lastupuser');
set cRuleSetOrder=ExtractValue(ruleset_sequence,'/root/data[$i]/ruleset_order');
set cWorkset=ExtractValue(ruleset_sequence,'/root/data[$i]/workset_id');
INSERT INTO `hethi`.`cruleset`
(`cruleset_desc`,
`cruleset_id`,
`crulespackages_id`,
`crulesset_name`,
`lastupuser`,
`lasyupdtm`,
`ruleset_order`,
`workset_id`)
VALUES
(
crulesetDesc,
cRuleSet,
cPackage,
cruleSetName,
lastUpUser,
now(),
cRuleSetOrder,
cWorkset
);
set i=i+1;
end while;
SELECT
`cruleset`.`cruleset_desc`,
`cruleset`.`cruleset_id`,
`cruleset`.`crulespackages_id`,
`cruleset`.`crulesset_name`,
`cruleset`.`lastupuser`,
`cruleset`.`lasyupdtm`,
`cruleset`.`ruleset_order`,
`cruleset`.`workset_id`
FROM `hethi`.`cruleset` where 
`cruleset`.`workset_id`=workSet;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reorderWorkSetSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `reorderWorkSetSequence`(in packageId varchar(10),in workSet varchar(10),
in ruleSet varchar(10), in workset_sequence text)
BEGIN
declare RowCount int default  ExtractValue(workset_sequence,'count(//data)');
declare i int default 1;
declare cWorkSetOrder int;
declare cworksetDesc varchar(250);
declare cworksetSetName varchar(100);
declare cWorkset,cPackage,lastUpUser varchar(10);
DELETE FROM `hethi`.`cruleworkset`
WHERE `cruleworkset`.`crulespackage_id`=packageId;

while i<=RowCount do
set cPackage=ExtractValue(workset_sequence,'/root/data[$i]/crulespackage_id');
set lastUpUser=ExtractValue(workset_sequence,'/root/data[$i]/lastupuser');
set cworksetDesc=ExtractValue(workset_sequence,'/root/data[$i]/workset_desc');
set cWorkset=ExtractValue(workset_sequence,'/root/data[$i]/workset_id');
set cworksetSetName=ExtractValue(workset_sequence,'/root/data[$i]/workset_name');
set cWorkSetOrder=ExtractValue(workset_sequence,'/root/data[$i]/workset_order');

INSERT INTO `hethi`.`cruleworkset`
(`crulespackage_id`,
`lastupdtm`,
`lastupuser`,
`workset_desc`,
`workset_id`,
`workset_name`,
`workset_order`)
VALUES
(
cPackage,
now(),
lastUpUser,
cworksetDesc,
cWorkset,
cworksetSetName,
cWorkSetOrder
);
set i=i+1;
end while;
SELECT
`cruleworkset`.`crulespackage_id`,
`cruleworkset`.`lastupdtm`,
`cruleworkset`.`lastupuser`,
`cruleworkset`.`workset_desc`,
`cruleworkset`.`workset_id`,
`cruleworkset`.`workset_name`,
`cruleworkset`.`workset_order`
FROM `hethi`.`cruleworkset` where 
`cruleworkset`.`crulespackage_id`=packageId;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveSequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `saveSequence`(in packageId char(10),
in workSet char(10),in ruleset_sequence text,
in workset_sequence text,in ruleSequence text)
BEGIN
declare RowCount1 int default  ExtractValue(ruleset_sequence,'count(//data)');
declare RowCount2 int default  ExtractValue(workset_sequence,'count(//data)');
declare RowCount3 int default  ExtractValue(ruleSequence,'count(//data)');

declare i int default 1;
declare j int default 1;
declare k int default 1;

declare rulesetOrder,cWorkSetOrder int(11);
declare crulesetId,worksetId char(10);
while i<=RowCount1 do
set rulesetOrder=ExtractValue(ruleset_sequence,'/root/data[$i]/ruleset_order');
set crulesetId=ExtractValue(ruleset_sequence,'/root/data[$i]/cruleset_id');
UPDATE `hethi`.`cruleset`
SET
`ruleset_order` = rulesetOrder
WHERE `cruleset_id` = crulesetId;
set i=i+1;
end while;
while j<=RowCount2 do
set worksetId=ExtractValue(workset_sequence,'/root/data[$j]/workset_id');
set cWorkSetOrder=ExtractValue(workset_sequence,'/root/data[$j]/workset_order');
UPDATE `hethi`.`cruleworkset`
SET
`workset_order` = cWorkSetOrder
WHERE `cruleworkset`.`workset_id` = worksetId;

set j=j+1;
end while;

SELECT
`cruleset`.`cruleset_desc`,
`cruleset`.`cruleset_id`,
`cruleset`.`crulespackages_id`,
`cruleset`.`crulesset_name`,
`cruleset`.`effective_enddate`,
`cruleset`.`effective_startdate`,
`cruleset`.`lastupuser`,
`cruleset`.`lasyupdtm`,
`cruleset`.`ruleset_order`,
`cruleset`.`workset_id`
FROM `hethi`.`cruleset` where 
`cruleset`.`workset_id`=workSet;
SELECT
`cruleworkset`.`crulespackage_id`,
`cruleworkset`.`effective_enddate`,
`cruleworkset`.`effective_startdate`,
`cruleworkset`.`lastupdtm`,
`cruleworkset`.`lastupuser`,
`cruleworkset`.`workset_desc`,
`cruleworkset`.`workset_id`,
`cruleworkset`.`workset_name`,
`cruleworkset`.`workset_order`
FROM `hethi`.`cruleworkset` where 
`cruleworkset`.`crulespackage_id`=packageId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_customer_serviceplay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `save_customer_serviceplay`(
in customer_id int,in sfs_data text,in user_id int,in varefs_uin char(10))
BEGIN
declare RowCount int default  ExtractValue(sfs_data,'count(//data)');
declare varsfs_uin char(10);
declare isExists int;
declare i int default 1;

DELETE FROM `hethi`.`dassign_customer_serviceplay` 
WHERE `customer_id`=user_id and`efs_uin`=varefs_uin;

while i<=RowCount do
set varsfs_uin= ExtractValue(sfs_data,'/root/data[$i]/sfs_UIN');
set isExists=(select ifnull(sum(1),0) from `hethi`.`dassign_customer_serviceplay` 
where `dassign_customer_serviceplay`.`customer_id`=user_id and `dassign_customer_serviceplay`.`sfs_uin`=varsfs_uin
and `dassign_customer_serviceplay`.`efs_uin`=varefs_uin);
if(isExists=0)then
INSERT INTO `hethi`.`dassign_customer_serviceplay` 
(`customer_id`, `sfs_uin`, `efs_uin`, `lastupuser`, `lastupdtm`) 
VALUES (user_id, varsfs_uin, varefs_uin, customer_id, now());
else 
update `hethi`.`dassign_customer_serviceplay` set 
`dassign_customer_serviceplay`.`lastupdtm`=now(),
`dassign_customer_serviceplay`.`lastupuser`=customer_id
where `dassign_customer_serviceplay`.`customer_id`=user_id and 
`dassign_customer_serviceplay`.`sfs_uin`=varsfs_uin
and `dassign_customer_serviceplay`.`efs_uin`=varefs_uin;
end if;
set i=i+1;
end while;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_custom_rules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_custom_rules`(in varcustomer_id int,in varuser_id int,in vartfs_uin char(10),in varefs_uin char(10),in rule_data text,in varflow_data text,in process_flow TEXT)
BEGIN

declare ProcessCount int default  ExtractValue(process_flow,'count(//data)');
declare var_current_q,var_next_q,var_exception_q varchar(250);


declare RowCount int default  ExtractValue(rule_data,'count(//data)');
declare varrule_workset,varrule_id char(6);
declare varrule_uin,varsfs_uin char(10);
declare varrule_workset_name,varrule_name varchar(250);
declare varrule_condition,varrule_action varchar(1000);
declare numericvalue bigint;
declare isExists int;
declare i int default 1;
declare p int default 1;

DELETE FROM `hethi`.`dcustomerserviceplayqueue`
WHERE `customer_id`=varcustomer_id 
and`tfs_uin`=vartfs_uin
and`efs_uin`=varefs_uin;



while p<=ProcessCount do


set var_current_q=ExtractValue(process_flow,'/root/data[$p]/current_queue');
set var_next_q=ExtractValue(process_flow,'/root/data[$p]/next_queue');
set var_exception_q=ExtractValue(process_flow,'/root/data[$p]/exception_queue');

INSERT INTO `hethi`.`dcustomerserviceplayqueue` 
(`customer_id`, 
`tfs_uin`,
`efs_uin`,
`sfs_uin`,
`queue_id`,
`next_queue`, 
`exception_queue`, 
`lastupuser`, 
`lastupdtm`)
 VALUES (varcustomer_id, 
vartfs_uin, 
varefs_uin, 
var_current_q,
var_current_q, 
var_next_q, 
var_exception_q,
varuser_id,
now());




set p=p+1;
end while;
DELETE FROM `hethi`.`dcustomrules` 
WHERE `customer_id`=varcustomer_id and`efs_uin`=varefs_uin;

while i<=RowCount do

if((Select crules.rule_id From crules Where crules.rule_id = ExtractValue(rule_data,'/root/data[$i]/rule_id') And crules.rule_name = ExtractValue(rule_data,'/root/data[$i]/rule_name'))!='')then

set varrule_id=ExtractValue(rule_data,'/root/data[$i]/rule_id');
set varrule_name=ExtractValue(rule_data,'/root/data[$i]/rule_name');

 else 

set varrule_id=(Select max(crules.rule_id) From crules);
set numericvalue=substring(varrule_id,3)+1;
set varrule_id=concat('rl',numericvalue);
set varrule_name=ExtractValue(rule_data,'/root/data[$i]/rule_name');
INSERT INTO `hethi`.`crules`
(`lastupdtm`,`lastupuser`,`rule_desc`,`rule_id`,`rule_name`,`rule_type`)
VALUES
(now(),varuser_id,concat('Custom rule ',varrule_name),varrule_id,varrule_name,'CUST');

end if;

if((Select cruleworkset.workset_id From cruleworkset Where cruleworkset.workset_id = ExtractValue(rule_data,'/root/data[$i]/rule_workset') And cruleworkset.workset_name = ExtractValue(rule_data,'/root/data[$i]/rule_workset_name'))!='')then

set varrule_workset=ExtractValue(rule_data,'/root/data[$i]/rule_workset');
set varrule_workset_name=ExtractValue(rule_data,'/root/data[$i]/rule_workset_name');

 else 

set varrule_workset=(Select max(cruleworkset.workset_id) From cruleworkset);
set numericvalue=substring(varrule_workset,3)+1;
set varrule_workset=concat('ws',numericvalue);
set varrule_workset_name=ExtractValue(rule_data,'/root/data[$i]/rule_workset_name');

INSERT INTO `hethi`.`cruleworkset`
(`lastupdtm`,`lastupuser`,`workset_desc`,`workset_id`,`workset_name`)
VALUES
(now(),varuser_id,concat('Custom rule ',varrule_workset_name),varrule_workset,varrule_workset_name);

end if;

if((Select ciconnector_rules.rule_uin From ciconnector_rules Where
  ciconnector_rules.workset_id = varrule_workset And ciconnector_rules.rule_id = varrule_id)!='')then

set varrule_uin=(Select ciconnector_rules.rule_uin From ciconnector_rules Where
  ciconnector_rules.workset_id = varrule_workset And ciconnector_rules.rule_id = varrule_id);

 else 

set varrule_uin=(Select max(ciconnector_rules.rule_uin) From ciconnector_rules);
set numericvalue=substring(varrule_uin,5)+1;

set varrule_uin=concat('rule',numericvalue);

INSERT INTO `hethi`.`ciconnector_rules`
(`lastupdtm`,`lastupuser`,`rule_id`,`rule_package_id`,`rule_uin`,`workset_id`)
VALUES
(now(),varuser_id,varrule_id,'pk1001',varrule_uin,varrule_workset);

end if;
set varrule_condition=ExtractValue(rule_data,'/root/data[$i]/rule_condition');
set varrule_action=ExtractValue(rule_data,'/root/data[$i]/rule_action');
set varsfs_uin=ExtractValue(rule_data,'/root/data[$i]/sfs_uin');

INSERT INTO `hethi`.`dcustomrules`
(`customer_id`,`efs_uin`,`lastupdtm`,`lastupuser`,`queue_id`,
`rule_action`,`rule_condition`,`rule_exception`,`rule_uin`,
`rule_workset`,`sfs_uin`,`zone_id`)
VALUES
(varcustomer_id,varefs_uin,now(),varuser_id,'qs1001',
varrule_action,varrule_condition,1,varrule_uin,
varrule_workset,varsfs_uin,1);

set i=i+1;
end while;
DELETE FROM `hethi`.`customer_flow`
WHERE `customer_id` = varcustomer_id and `efs_uin` = varefs_uin;
INSERT INTO `hethi`.`customer_flow`
(`customer_id`,
`efs_uin`,
`flow_data`)
VALUES
(varcustomer_id,
varefs_uin,
varflow_data);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_mxsd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_mxsd`(in varcustomer_id bigint,in varefs_uin char(10),in varuser_id bigint, in mxsddata text)
BEGIN
declare varform_stencid bigint;
set varform_stencid=(select ifnull(max(`cindexclassifystencil`.`form_stencid`)+1,1)from `cindexclassifystencil` 
where cindexclassifystencil.efslobowner_id=varcustomer_id and cindexclassifystencil.efs_uin=varefs_uin );

if(varform_stencid=1)then
set varform_stencid=(select ifnull(max(`cindexclassifystencil`.`form_stencid`)+1,1)from `cindexclassifystencil`);
INSERT INTO `hethi`.`cindexclassifystencil`
(`efs_uin`,
`eFS_XSD`,
`eFS_XSD_location`,
`efslobowner_id`,
`form_stencid`,
`lastupdtm`,
`lastupuser`)
VALUES
(
varefs_uin,
mxsddata,
'',
varcustomer_id,
varform_stencid,
now(),
varuser_id
);
else
update `hethi`.`cindexclassifystencil` set
`eFS_XSD`=mxsddata,
`eFS_XSD_location`='',
`lastupdtm`=now(),
`lastupuser`=varuser_id where 
`efs_uin`=varefs_uin and `efslobowner_id`=varcustomer_id;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_new_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_new_rule`(
in rule_uin varchar(10),in rulesetId varchar(10),in ruleName varchar(100),
in ruleDesc varchar(500),in ruleEfs varchar(20),in ruleType varchar(10),
in ruleCondition varchar(250),in ruleAction varchar(250),
in startdate date,in enddate date,in ruleStatus int,in lastUpuser char(10))
BEGIN
declare ruleOrder int(11);

set ruleOrder=(select ifnull((select max(`cstandardrules`.`rule_order`) from `hethi`.`cstandardrules`),0));
set ruleOrder=ruleOrder+1;
INSERT INTO `hethi`.`cstandardrules`
(`effective_enddate`,
`effective_startdate`,
`efs_uin`,
`lastupdtm`,
`lastupuser`,
`rule_action`,
`rule_comments`,
`rule_condition`,
`rule_name`,
`rule_order`,
`rule_status`,
`rule_uin`,
`ruleset_id`,
`rule_type`)
VALUES
(
enddate,
startdate,
ruleEfs,
now(),
lastUpuser,
ruleAction,
ruleDesc,
ruleCondition,
ruleName,
ruleOrder,
ruleStatus,
rule_uin,
rulesetId,
ruleType
);


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_offer_serviceplay` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `save_offer_serviceplay`(
in offername varchar(100),in sfs_data text,in user_id int)
BEGIN
declare RowCount int default  ExtractValue(sfs_data,'count(//data)');
declare varsfs_uin char(10);

declare offer_ID int default 1;

declare i int default 1;


set offer_ID= ( select ifnull((SELECT max(`hethi_offers`.`offer_id`)+1 FROM `hethi`.`hethi_offers`),1));

INSERT INTO `hethi`.`hethi_offers`
(`created_date`,
`offer_id`,
`offer_name`,
`user_id`)
VALUES
(
now(),
offer_ID,
offername,
user_id
);

while i<=RowCount do
set varsfs_uin= ExtractValue(sfs_data,'/root/data[$i]/sfs_UIN');
INSERT INTO `hethi`.`hethi_offers_details`
(`offer_id`,
`sfs_uin`)
VALUES
(
offer_ID,
varsfs_uin
);

set i=i+1;
end while;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_ruleSet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_ruleSet`(
in rulesetId char(10),in rulesetName varchar(100),
in rulesetDesc varchar(250),in packageId char(10),in worksetId char(10),in userId bigint)
BEGIN
INSERT INTO `hethi`.`cruleset`
(`cruleset_desc`,
`cruleset_id`,
`crulespackages_id`,
`crulesset_name`,
`lastupuser`,
`lasyupdtm`,
`workset_id`)
VALUES
(
rulesetDesc,
rulesetId,
packageId,
rulesetName,
userId,
now(),
worksetId
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_rules_packages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_rules_packages`(
in packageId char(10),in packageName varchar(100),
in packageDesc varchar(250),in userId bigint,in worksetXML text,in rulesetXML text,
in ruleXML text,in cloningPackage varchar(100),in cloningStatus char(10))
BEGIN
declare RowCount1 int default ExtractValue(worksetXML,'count(//data)');
declare RowCount2 int default ExtractValue(rulesetXML,'count(//data)');
declare RowCount3 int default ExtractValue(ruleXML,'count(//data)');
declare i int default 1;
declare j int default 1;
declare k int default 1;
declare cworksetid,ruleid,crulesetid,crulessetid,worksetid,crulespackageid,crulespackagesid char(10);
declare lastupuser char(25);
declare rulename,ruletype,conditions,statement,crulessetname,worksetname varchar(100);
declare crulesetdesc,worksetdesc,ruledesc varchar(250);
INSERT INTO `hethi`.`crulepackage`
(`lastupdtm`,
`lastupuser`,
`rule_package_desc`,
`rule_package_id`,
`rule_package_name`)
VALUES
(
now(),
userId,
packageDesc,
packageId,
packageName
);
if(cloningStatus='true') then
while i<=RowCount1 do
set crulespackageid = ExtractValue(worksetXML,'/root/data[$i]/crulespackage_id');
set lastupuser=ExtractValue(worksetXML,'/root/data[$i]/lastupuser');
set worksetid=ExtractValue(worksetXML,'/root/data[$i]/workset_id');
set worksetname=ExtractValue(worksetXML,'/root/data[$i]/workset_name');
set worksetdesc=ExtractValue(worksetXML,'/root/data[$i]/workset_desc');
INSERT INTO `hethi`.`cruleworkset`
(`crulespackage_id`,
`lastupdtm`,
`lastupuser`,
`workset_desc`,
`workset_id`,
`workset_name`)
VALUES
(
crulespackageid,
now(),
lastupuser,
worksetdesc,
worksetid,
worksetname
); 

set i=i+1;
end while;
while k<=RowCount3 do
set crulespackageid = ExtractValue(ruleXML,'/root/data[$k]/crulespackage_id');
set lastupuser=ExtractValue(ruleXML,'/root/data[$k]/lastupuser');
set conditions=ExtractValue(ruleXML,'/root/data[$k]/condition');
set crulessetid=ExtractValue(ruleXML,'/root/data[$k]/crulesset_id');
set cworksetid=ExtractValue(ruleXML,'/root/data[$k]/cworkset_id');
set statement = ExtractValue(ruleXML,'/root/data[$k]/statement');
set ruledesc=ExtractValue(ruleXML,'/root/data[$k]/rule_desc');
set ruleid=ExtractValue(ruleXML,'/root/data[$k]/rule_id');
set rulename=ExtractValue(ruleXML,'/root/data[$k]/rule_name');
set ruletype=ExtractValue(ruleXML,'/root/data[$k]/rule_type');
INSERT INTO `hethi`.`crules`
(`condition`,
`crulespackage_id`,
`crulesset_id`,
`cworkset_id`,
`lastupdtm`,
`lastupuser`,
`rule_desc`,
`rule_id`,
`rule_name`,
`rule_type`,
`statement`)
VALUES
(
conditions,
crulespackageid,
crulessetid,
cworksetid,
now(),
lastupuser,
ruledesc,
ruleid,
rulename,
ruletype,
statement
);
set k=k+1;
end while;
while j<=RowCount2 do
set crulesetdesc = ExtractValue(rulesetXML,'/root/data[$j]/cruleset_desc');
set crulesetid=ExtractValue(rulesetXML,'/root/data[$j]/cruleset_id');
set crulespackagesid=ExtractValue(rulesetXML,'/root/data[$j]/crulespackages_id');
set crulessetname=ExtractValue(rulesetXML,'/root/data[$j]/crulesset_name');
set lastupuser=ExtractValue(rulesetXML,'/root/data[$j]/lastupuser');
set worksetid=ExtractValue(rulesetXML,'/root/data[$j]/workset_id');

INSERT INTO `hethi`.`cruleset`
(`cruleset_desc`,
`cruleset_id`,
`crulespackages_id`,
`crulesset_name`,
`lastupuser`,
`lasyupdtm`,
`workset_id`)
VALUES
(
crulesetdesc,
crulesetid,
crulespackagesid,
crulessetname,
lastupuser,
now(),
worksetid
);

set j=j+1;
end while;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_rules_workset` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_rules_workset`(
in worksetId char(10),in worksetName varchar(100),
in worksetDesc varchar(250),in packageId char(10),in userId bigint)
BEGIN
INSERT INTO `hethi`.`cruleworkset`
(`crulespackage_id`,
`lastupdtm`,
`lastupuser`,
`workset_desc`,
`workset_id`,
`workset_name`)
VALUES
(
packageId,
now(),
userID,
worksetDesc,
worksetId,
worksetName
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `save_xml_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_xml_data`(in din varchar(10),
in tfsUin varchar(10),in efsUin varchar(10),in uploadId bigint,
in fileId bigint,in customerId bigint,in mxml text,in mxmlLoc varchar(100),
in lastUpUser bigint)
BEGIN
declare uin bigint;
set uin=(select ifnull(max(`dcustomer_document`.`uin`)+1,1) from `hethi`.`dcustomer_document` );
set uin=uin+1;
INSERT INTO `hethi`.`dcustomer_document`
(`customer_id`,
`din`,
`efs_uin`,
`file_id`,
`lastupdtm`,
`lastupuser`,
`mxml`,
`mxml_location`,
`tfs_uin`,
`uin`,
`upload_id`)
VALUES
(
customerId,
din,
efsUin,
fileId,
now(),
lastUpUser,
mxml,
mxmlLoc,
tfsUin,
uin,
uploadId
);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_customer_services` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `select_customer_services`(in customerid int,in efsuin char(20))
BEGIN
Select
  dassign_customer_serviceplay.customer_id,
  dassign_customer_serviceplay.sfs_uin,
  ccore_serviceplays.hethi_subservicecode
From
  csconnector Inner Join
  dassign_customer_serviceplay On dassign_customer_serviceplay.sfs_uin =
    csconnector.sfs_UIN Inner Join
  chethi_services On csconnector.hethi_service_id =
    chethi_services.hethi_service_id Inner Join
  ccore_services On chethi_services.service_id = ccore_services.service_id
  Inner Join
  ccore_serviceplays On csconnector.subservice_id =
    ccore_serviceplays.serviceplay_id
where dassign_customer_serviceplay.customer_id = customerid and dassign_customer_serviceplay.efs_uin=efsuin;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_efs_template` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `select_efs_template`(
in uploadId bigint,in fileId bigint,in customerId bigint,in varefs_uin varchar(10))
BEGIN
declare varstencil_id varchar(50);
set varstencil_id=(select ifnull(max(stencil_id),0) From hethi.dupload_file where 
upload_id=uploadId 
and file_id=fileId);

set varstencil_id=(select ifnull(max(form_stencid),0) From hethi.cindexclassifystencil where 
cindexclassifystencil.efs_uin=varefs_uin);

if(varstencil_id!=0)then 

SELECT
`cindexclassifystencil`.`eFS_XSD`,
`cindexclassifystencil`.`eFS_XSD_location`
FROM `hethi`.`cindexclassifystencil` 
where `cindexclassifystencil`.`form_stencid`=varstencil_id and 
`cindexclassifystencil`.`efs_uin`=varefs_uin;

else 
SELECT
'stencil id not found' as `eFS_XSD_location`;
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `store_uploaded_document` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `store_uploaded_document`(
in file_name varchar(100),in file_type char(15),
in file_size bigint,in user bigint
)
BEGIN
declare upload_id int(11);
declare file_id int(11);
set upload_id=(select ifnull((select max(`dupload`.`upload_id`) from `hethi`.`dupload`),0));
set upload_id=upload_id+1;


INSERT INTO `hethi`.`dupload`
(`endreaddtm`,
`startreaddtm`,
`upload_id`,
`upload_name`,
`upload_size`,
`upload_status`,
`upload_type`)
VALUES
(
now(),
now(),
upload_id,
file_name,
file_size,
0,
file_type
);
INSERT INTO `hethi`.`dcustomer_upload`
(`assigneddtm`,
`customer_id`,
`lastupdtm`,
`lastupuser`,
`upload_id`)
VALUES
(
now(),
user,
now(),
user,
upload_id
);


select upload_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `store_uploaded_document_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `store_uploaded_document_details`(in filepath varchar(100),
in user int,in file_name varchar(100),in file_size bigint,
in file_type char(4))
BEGIN
declare upload_id int(11);
declare file_id int(11);
set upload_id=(select ifnull((select max(`dupload`.`upload_id`) from `hethi`.`dupload`),0));
set upload_id=upload_id+1;

if((SELECT max(`dupload_file`.`file_id`) FROM `hethi`.`dupload_file` WHERE `dupload_file`.`upload_id`=upload_id )!='') then
set file_id=(SELECT max(`dupload_file`.`file_id`) FROM `hethi`.`dupload_file` WHERE `dupload_file`.`upload_id`=upload_id );
set file_id=file_id+1; 
else
set file_id=1;
end if;
INSERT INTO `hethi`.`dupload`
(`endreaddtm`,
`startreaddtm`,
`upload_id`,
`upload_name`,
`upload_size`,
`upload_status`,
`upload_type`)
VALUES
(
now(),
now(),
upload_id,
file_name,
file_size,
0,
file_type
);
INSERT INTO `hethi`.`dupload_file`
(`efs_uin`,
`file_id`,
`file_location`,
`file_name`,
`file_size`,
`file_status`,
`file_type`,
`lastupdtm`,
`lastupuser`,
`upload_id`)
VALUES
(
'efs_uin',
file_id,
filepath,
file_name,
file_size,
0,
file_type,
now(),
user,
upload_id
);
INSERT INTO `hethi`.`dupload_status`
(`file_id`,
`lastupdtm`,
`lastupuser`,
`status`,
`upload_id`)
VALUES
(
file_id,
now(),
user,
0,
upload_id
);
INSERT INTO `hethi`.`dupload_status_history`
(`file_id`,
`lastupdtm`,
`lastupuser`,
`status`,
`upload_id`)
VALUES
(
file_id,
now(),
user,
0,
upload_id
);
select file_id,upload_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `store_uploaded_document_files` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `store_uploaded_document_files`(
in uploadId bigint,in customerId bigint,in efsUin varchar(10),
in user bigint,in fileName varchar(300),in fileType varchar(20),
in fileSize bigint,in filePath varchar(500))
BEGIN
declare fileId,varstencil_id,default_status int(11);

if((SELECT max(`dupload_file`.`file_id`) FROM `hethi`.`dupload_file` WHERE `dupload_file`.`upload_id`=uploadId )!='') then
set fileId=(SELECT max(`dupload_file`.`file_id`) FROM `hethi`.`dupload_file` WHERE `dupload_file`.`upload_id`=uploadId );
set fileId=fileId+1; 
else
set fileId=1;
end if;
set varstencil_id=(select ifnull(max(`cindexclassifystencil`.`form_stencid`)+1,1)from `cindexclassifystencil` 
where `cindexclassifystencil`.`efslobowner_id`=customerId and `cindexclassifystencil`.`efs_uin`=efsUin );
if(varstencil_id=1)then
set default_status=0;
else 
set default_status=3;
end if;
INSERT INTO `hethi`.`dupload_file`
(`efs_uin`,
`file_id`,
`file_location`,
`file_name`,
`file_size`,
`file_status`,
`file_type`,
`lastupdtm`,
`lastupuser`,
`upload_id`,
`stencil_id`)
VALUES
(
efsUin,
fileId,
filePath,
fileName,
fileSize,
default_status,
fileType,
now(),
user,
uploadId,
varstencil_id
);


INSERT INTO `hethi`.`dupload_status`
(`file_id`,
`lastupdtm`,
`lastupuser`,
`status`,
`upload_id`)
VALUES
(
fileId,
now(),
user,
default_status,
uploadId
);
INSERT INTO `hethi`.`dupload_status_history`
(`file_id`,
`lastupdtm`,
`lastupuser`,
`status`,
`upload_id`)
VALUES
(
fileId,
now(),
user,
default_status,
uploadId
);
select fileId,uploadId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `testing`()
BEGIN
declare d char(10);
declare e bigint;
set d='rule100101';
set e= substring(d,5)+1;
set d=concat('rule',e);
select d;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateRuleset` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `updateRuleset`(in crulesetId char(10),
in crulessetName varchar(100),in crulesetDesc varchar(250),
in effectiveStartdate date,in effectiveEnddate date)
BEGIN
UPDATE `hethi`.`cruleset`
SET
`cruleset_desc` = crulesetDesc,
`crulesset_name` = crulessetName,
`effective_enddate` = effectiveEnddate,
`effective_startdate` = effectiveStartdate,
`lasyupdtm` = now()

WHERE `cruleset_id` = crulesetId;
SELECT
`cruleset`.`cruleset_desc`,
`cruleset`.`cruleset_id`,
`cruleset`.`crulespackages_id`,
`cruleset`.`crulesset_name`,
`cruleset`.`effective_enddate`,
`cruleset`.`effective_startdate`,
`cruleset`.`lastupuser`,
`cruleset`.`lasyupdtm`,
`cruleset`.`ruleset_order`,
`cruleset`.`workset_id`
FROM `hethi`.`cruleset`;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateWorkset` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `updateWorkset`(in worksetId char(10),
worksetName varchar(100),in worksetDesc varchar(250),in effectiveStartDate date,
in effectiveEnddate date)
BEGIN
UPDATE `hethi`.`cruleworkset`
SET
`effective_enddate` = effectiveEnddate,
`effective_startdate` = effectiveStartdate,
`lastupdtm` = now(),
`workset_desc` = worksetDesc,
`workset_name` = worksetName
WHERE `workset_id` = worksetId;
SELECT
`cruleworkset`.`crulespackage_id`,
`cruleworkset`.`effective_enddate`,
`cruleworkset`.`effective_startdate`,
`cruleworkset`.`lastupdtm`,
`cruleworkset`.`lastupuser`,
`cruleworkset`.`workset_desc`,
`cruleworkset`.`workset_id`,
`cruleworkset`.`workset_name`,
`cruleworkset`.`workset_order`
FROM `hethi`.`cruleworkset`;

END */;;
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

-- Dump completed on 2016-01-25 18:25:36
