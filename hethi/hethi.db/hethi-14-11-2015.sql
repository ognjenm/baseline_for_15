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
INSERT INTO `ccore_serviceplays` VALUES ('csp100101','ch100101','DaaS.classify','Root','2015-10-15 00:00:00'),('csp100102','ch100101','DaaS.index','Root','2015-10-15 00:00:00'),('csp100103','ch100101','DaaS.split-merge','Root','2015-10-15 00:00:00'),('csp100104','ch100101','DaaS.keywise','Root','2015-10-15 00:00:00'),('csp100105','ch100102','BaaS.workflow','Root','2015-10-15 00:00:00'),('csp100106','ch100102','BaaS.reject','Root','2015-10-15 00:00:00'),('csp100107','ch100103','OaaS.HML','Root','2015-10-15 00:00:00'),('csp100108','ch100103','OaaS.ANSI','Root','2015-10-15 00:00:00'),('csp100109','ch100103','OaaS.EDIFACT','Root','2015-10-15 00:00:00'),('csp100110','ch100103','OaaS.DELIMITED','Root','2015-10-15 11:03:33'),('csp100111','ch100103','OaaS.PROP','Root','2015-10-15 11:03:33'),('csp100112','ch100104','IaaS.SAP','Root','2015-10-15 11:03:33'),('csp100113','ch100104','IaaS.Lawson','Root','2015-10-15 11:03:33'),('csp100114','ch100104','IaaS.OracleFusion','Root','2015-10-15 11:03:33'),('csp100115','ch100104','IaaS.BAAN','Root','2015-10-15 11:03:33'),('csp100116','ch100106','StaaS.MetaData','Root','2015-10-15 11:03:33'),('csp100117','ch100106','StaaS.Image','Root','2015-10-15 00:00:00'),('csp100118','ch100105','AaaS. Summary Report','Root','2015-10-15 00:00:00'),('csp100119','ch100105','AaaS. Reconciliation Report','Root','2015-10-15 00:00:00'),('csp100120','ch100105','AaaS. Shipment Report','Root','2015-10-15 00:00:00'),('csp100121','ch100105','AaaS. Detailed Shipment Report','Root','2015-10-15 00:00:00'),('csp100122','ch100105','AaaS. Email Report','Root','2015-10-15 00:00:00'),('csp100123','ch100105','AaaS. Fax Report','Root','2015-10-15 00:00:00'),('csp100124','ch100105','AaaS. Billing Report','Root','2015-10-15 00:00:00'),('csp100125','ch100105','AaaS. PO Match Rate Report','Root','2015-10-15 00:00:00'),('csp100126','ch100105','AaaS. EDI Report','Root','2015-10-15 00:00:00'),('csp100127','ch100105','AaaS.orkflow Reports','Root','2015-10-15 00:00:00'),('csp100128','ch100105','AaaS. Activity Aging Report','Root','2015-10-15 00:00:00'),('csp100129','ch100105','AaaS. Exception Report','Root','2015-10-15 00:00:00'),('csp100130','ch100105','AaaS. Performance Report','Root','2015-10-15 00:00:00'),('csp100131','ch100105','AaaS. Work Item Detail Report','Root','2015-10-15 00:00:00'),('csp100132','ch100105','AaaS. Workflow Work In Progress (WIP) Report','Root','2015-10-15 00:00:00'),('csp100133','ch100105','AaaS. Audit Trail Report','Root','2015-10-15 00:00:00'),('csp100134','ch100105','AaaS. Productivity Report','Root','2015-10-15 00:00:00'),('csp100135','ch100105','AaaS. Inventory Report','Root','2015-10-15 00:00:00'),('csp100136','ch100105','AaaS. Absentee Delegation Report','Root','2015-10-15 00:00:00'),('csp100137','ch100105','AaaS. Re-Assign Report','Root','2015-10-15 00:00:00'),('csp100138','ch100105','AaaS. Re-Route Report','Root','2015-10-15 00:00:00'),('csp100139','ch100105','AaaS. WorkItem History Report','Root','2015-10-15 00:00:00');
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
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`workset_id`),
  UNIQUE KEY `workset_name_UNIQUE` (`workset_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cruleworkset`
--

LOCK TABLES `cruleworkset` WRITE;
/*!40000 ALTER TABLE `cruleworkset` DISABLE KEYS */;
INSERT INTO `cruleworkset` VALUES ('ws1001','com.hethi.domain.iPost','import ipost description','Root','2015-11-03 12:03:15');
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
INSERT INTO `csconnector` VALUES ('csfs100101','ch100101','csp100101','cs100101','Root','2015-10-15 11:03:33'),('csfs100102','ch100101','csp100102','cs100101','Root','2015-10-15 11:03:33'),('csfs100103','ch100101','csp100103','cs100101','Root','2015-10-15 11:03:33'),('csfs100104','ch100101','csp100104','cs100101','Root','2015-10-15 11:03:33'),('csfs100105','ch100102','csp100105','cs100102','Root','2015-10-15 11:03:33'),('csfs100106','ch100102','csp100106','cs100102','Root','2015-10-15 11:03:33'),('csfs100107','ch100103','csp100107','cs100103','Root','2015-10-15 11:03:33'),('csfs100108','ch100103','csp100108','cs100103','Root','2015-10-15 11:03:33'),('csfs100109','ch100103','csp100109','cs100103','Root','2015-10-15 11:03:33'),('csfs100110','ch100103','csp100110','cs100103','Root','2015-10-15 11:03:33'),('csfs100111','ch100103','csp100111','cs100103','Root','2015-10-15 11:03:33'),('csfs100112','ch100104','csp100112','cs100104','Root','2015-10-15 11:03:33'),('csfs100113','ch100104','csp100113','cs100104','Root','2015-10-15 11:03:33'),('csfs100114','ch100104','csp100114','cs100104','Root','2015-10-15 11:03:33'),('csfs100115','ch100104','csp100115','cs100104','Root','2015-10-15 11:03:33'),('csfs100116','ch100106','csp100116','cs100103','Root','2015-10-15 11:03:33'),('csfs100117','ch100106','csp100117','cs100103','Root','2015-10-15 11:03:33'),('csfs100118','ch100105','csp100118','cs100103','Root','2015-10-15 11:03:33'),('csfs100119','ch100105','csp100119','cs100103','Root','2015-10-15 11:03:33'),('csfs100120','ch100105','csp100120','cs100103','Root','2015-10-15 11:03:33'),('csfs100121','ch100105','csp100121','cs100103','Root','2015-10-15 11:03:33'),('csfs100122','ch100105','csp100122','cs100103','Root','2015-10-15 11:03:33'),('csfs100123','ch100105','csp100123','cs100103','Root','2015-10-15 11:03:33'),('csfs100124','ch100105','csp100124','cs100103','Root','2015-10-15 11:03:33'),('csfs100125','ch100105','csp100125','cs100103','Root','2015-10-15 11:03:33'),('csfs100126','ch100105','csp100126','cs100103','Root','2015-10-15 11:03:33'),('csfs100127','ch100105','csp100127','cs100103','Root','2015-10-15 11:03:33'),('csfs100128','ch100105','csp100128','cs100103','Root','2015-10-15 11:03:33'),('csfs100129','ch100105','csp100129','cs100103','Root','2015-10-15 11:03:33'),('csfs100130','ch100105','csp100130','cs100103','Root','2015-10-15 11:03:33'),('csfs100131','ch100105','csp100131','cs100103','Root','2015-10-15 11:03:33'),('csfs100132','ch100105','csp100132','cs100103','Root','2015-10-15 11:03:33'),('csfs100133','ch100105','csp100133','cs100103','Root','2015-10-15 11:03:33'),('csfs100134','ch100105','csp100134','cs100103','Root','2015-10-15 11:03:33'),('csfs100135','ch100105','csp100135','cs100103','Root','2015-10-15 11:03:33'),('csfs100136','ch100105','csp100136','cs100103','Root','2015-10-15 11:03:33'),('csfs100137','ch100105','csp100137','cs100103','Root','2015-10-15 11:03:33'),('csfs100138','ch100105','csp100138','cs100103','Root','2015-10-15 11:03:33'),('csfs100139','ch100105','csp100139','cs100103','Root','2015-10-15 11:03:33');
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
INSERT INTO `dassign_customer_serviceplay` VALUES (1,'csfs100101','cefs100101','1','2015-11-12 15:46:26'),(1,'csfs100102','null','1','2015-11-12 15:46:26'),(1,'csfs100103','null','1','2015-11-12 15:46:26'),(1,'csfs100104','null','1','2015-11-12 15:46:26'),(1,'csfs100105','null','1','2015-11-12 15:46:26'),(1,'csfs100107','null','1','2015-11-12 15:46:26'),(1,'csfs100108','null','1','2015-11-12 15:46:26'),(1,'csfs100109','null','1','2015-11-12 15:46:26'),(1,'csfs100110','null','1','2015-11-12 15:46:26'),(1,'csfs100114','null','1','2015-11-12 15:46:26');
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
INSERT INTO `dupload_status` VALUES (1,1,3,2,'2015-11-14 16:29:04'),(2,1,1,6,'2015-11-14 15:46:04'),(218,1,0,1,'2015-11-14 15:20:50'),(219,1,0,1,'2015-11-14 15:20:50'),(220,1,0,1,'2015-11-14 15:20:50'),(221,1,0,1,'2015-11-14 15:20:51'),(222,1,0,1,'2015-11-14 15:22:00'),(223,1,0,1,'2015-11-14 15:22:01'),(224,1,0,1,'2015-11-14 15:22:02'),(225,1,0,1,'2015-11-14 15:22:03'),(226,1,0,1,'2015-11-14 16:11:37'),(227,1,0,1,'2015-11-14 16:11:37'),(228,1,0,1,'2015-11-14 16:11:37'),(229,1,0,1,'2015-11-14 16:11:37');
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
INSERT INTO `dupload` VALUES (1,'invoice_21447223193599.jpg','jpg','2015-11-11 11:56:33','2015-11-11 11:56:33','82762',0),(2,'1445678034494_apple_mac1447230323727.jpg','jpg','2015-11-11 13:55:23','2015-11-11 13:55:23','61830',0),(3,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 14:23:03','2015-11-13 14:23:03','1416',0),(4,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 14:23:05','2015-11-13 14:23:05','17611',0),(5,'doc1.png','png','2015-11-13 14:23:06','2015-11-13 14:23:06','15395',0),(6,'error.txt','txt','2015-11-13 14:23:07','2015-11-13 14:23:07','4606',0),(7,'notes.txt','txt','2015-11-13 14:23:08','2015-11-13 14:23:08','935',0),(8,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 14:28:01','2015-11-13 14:28:01','1416',0),(9,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 14:28:01','2015-11-13 14:28:01','17611',0),(10,'doc1.png','png','2015-11-13 14:28:05','2015-11-13 14:28:05','15395',0),(11,'error.txt','txt','2015-11-13 14:28:05','2015-11-13 14:28:05','4606',0),(12,'notes.txt','txt','2015-11-13 14:28:11','2015-11-13 14:28:11','935',0),(13,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 14:34:51','2015-11-13 14:34:51','1416',0),(14,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 14:34:51','2015-11-13 14:34:51','17611',0),(15,'doc1.png','png','2015-11-13 14:34:54','2015-11-13 14:34:54','15395',0),(16,'error.txt','txt','2015-11-13 14:34:54','2015-11-13 14:34:54','4606',0),(17,'notes.txt','txt','2015-11-13 14:35:00','2015-11-13 14:35:00','935',0),(18,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 14:39:56','2015-11-13 14:39:56','1416',0),(19,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 14:40:00','2015-11-13 14:40:00','17611',0),(20,'doc1.png','png','2015-11-13 14:40:03','2015-11-13 14:40:03','15395',0),(21,'error.txt','txt','2015-11-13 14:40:03','2015-11-13 14:40:03','4606',0),(22,'notes.txt','txt','2015-11-13 14:40:06','2015-11-13 14:40:06','935',0),(23,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 14:41:39','2015-11-13 14:41:39','1416',0),(24,'application.properties','properties','2015-11-13 14:41:39','2015-11-13 14:41:39','864',0),(25,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 14:41:42','2015-11-13 14:41:42','17611',0),(26,'doc1.png','png','2015-11-13 14:41:42','2015-11-13 14:41:42','15395',0),(27,'error.txt','txt','2015-11-13 14:41:45','2015-11-13 14:41:45','4606',0),(28,'notes.txt','txt','2015-11-13 14:41:49','2015-11-13 14:41:49','935',0),(29,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 14:44:12','2015-11-13 14:44:12','1416',0),(30,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 14:44:17','2015-11-13 14:44:17','17611',0),(31,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 14:45:43','2015-11-13 14:45:43','1416',0),(32,'application.properties','properties','2015-11-13 14:45:47','2015-11-13 14:45:47','864',0),(33,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 14:45:52','2015-11-13 14:45:52','17611',0),(34,'doc1.png','png','2015-11-13 14:45:57','2015-11-13 14:45:57','15395',0),(35,'error.txt','txt','2015-11-13 14:46:02','2015-11-13 14:46:02','4606',0),(36,'logger_toaster.js','js','2015-11-13 14:46:07','2015-11-13 14:46:07','4374',0),(37,'application.properties','properties','2015-11-13 14:48:25','2015-11-13 14:48:25','0',0),(38,'doc1.png','png','2015-11-13 14:48:28','2015-11-13 14:48:28','0',0),(39,'error.txt','txt','2015-11-13 14:48:29','2015-11-13 14:48:29','0',0),(40,'logger_toaster.js','js','2015-11-13 14:48:30','2015-11-13 14:48:30','0',0),(41,'jersey-multipart-1.5.jar','jar','2015-11-13 14:49:55','2015-11-13 14:49:55','49516',0),(42,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:34:44','2015-11-13 15:34:44','1416',0),(43,'application.properties','properties','2015-11-13 15:34:44','2015-11-13 15:34:44','864',0),(44,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:34:44','2015-11-13 15:34:44','17611',0),(45,'doc1.png','png','2015-11-13 15:34:44','2015-11-13 15:34:44','15395',0),(46,'error.txt','txt','2015-11-13 15:34:44','2015-11-13 15:34:44','4606',0),(47,'jersey-multipart-1.5.jar','jar','2015-11-13 15:34:44','2015-11-13 15:34:44','49516',0),(48,'logger_toaster.js','js','2015-11-13 15:34:44','2015-11-13 15:34:44','4374',0),(49,'invoice_1.jpg','jpg','2015-11-13 15:35:51','2015-11-13 15:35:51','161122',0),(50,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:39:54','2015-11-13 15:39:54','1416',0),(51,'application.properties','properties','2015-11-13 15:39:55','2015-11-13 15:39:55','864',0),(52,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:39:57','2015-11-13 15:39:57','17611',0),(53,'doc1.png','png','2015-11-13 15:39:58','2015-11-13 15:39:58','15395',0),(54,'error.txt','txt','2015-11-13 15:39:59','2015-11-13 15:39:59','4606',0),(55,'invoice_1.jpg','jpg','2015-11-13 15:40:00','2015-11-13 15:40:00','161122',0),(56,'jersey-multipart-1.5.jar','jar','2015-11-13 15:40:01','2015-11-13 15:40:01','49516',0),(57,'logger_toaster.js','js','2015-11-13 15:40:02','2015-11-13 15:40:02','4374',0),(58,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:40:21','2015-11-13 15:40:21','1416',0),(59,'application.properties','properties','2015-11-13 15:40:22','2015-11-13 15:40:22','864',0),(60,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:40:24','2015-11-13 15:40:24','17611',0),(61,'doc1.png','png','2015-11-13 15:40:25','2015-11-13 15:40:25','15395',0),(62,'error.txt','txt','2015-11-13 15:40:26','2015-11-13 15:40:26','4606',0),(63,'invoice_1.jpg','jpg','2015-11-13 15:40:27','2015-11-13 15:40:27','161122',0),(64,'jersey-multipart-1.5.jar','jar','2015-11-13 15:40:28','2015-11-13 15:40:28','49516',0),(65,'logger_toaster.js','js','2015-11-13 15:40:29','2015-11-13 15:40:29','4374',0),(66,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:41:46','2015-11-13 15:41:46','1416',0),(67,'application.properties','properties','2015-11-13 15:41:46','2015-11-13 15:41:46','864',0),(68,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:41:46','2015-11-13 15:41:46','17611',0),(69,'doc1.png','png','2015-11-13 15:41:46','2015-11-13 15:41:46','15395',0),(70,'error.txt','txt','2015-11-13 15:41:46','2015-11-13 15:41:46','4606',0),(71,'invoice_1.jpg','jpg','2015-11-13 15:41:46','2015-11-13 15:41:46','161122',0),(72,'jersey-multipart-1.5.jar','jar','2015-11-13 15:41:46','2015-11-13 15:41:46','49516',0),(73,'logger_toaster.js','js','2015-11-13 15:41:46','2015-11-13 15:41:46','4374',0),(74,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:41:49','2015-11-13 15:41:49','1416',0),(75,'application.properties','properties','2015-11-13 15:41:50','2015-11-13 15:41:50','864',0),(76,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:41:52','2015-11-13 15:41:52','17611',0),(77,'doc1.png','png','2015-11-13 15:41:53','2015-11-13 15:41:53','15395',0),(78,'error.txt','txt','2015-11-13 15:41:54','2015-11-13 15:41:54','4606',0),(79,'invoice_1.jpg','jpg','2015-11-13 15:41:55','2015-11-13 15:41:55','161122',0),(80,'jersey-multipart-1.5.jar','jar','2015-11-13 15:41:56','2015-11-13 15:41:56','49516',0),(81,'logger_toaster.js','js','2015-11-13 15:41:57','2015-11-13 15:41:57','4374',0),(82,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:43:13','2015-11-13 15:43:13','1416',0),(83,'application.properties','properties','2015-11-13 15:43:14','2015-11-13 15:43:14','864',0),(84,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:43:16','2015-11-13 15:43:16','17611',0),(85,'doc1.png','png','2015-11-13 15:43:17','2015-11-13 15:43:17','15395',0),(86,'error.txt','txt','2015-11-13 15:43:18','2015-11-13 15:43:18','4606',0),(87,'invoice_1.jpg','jpg','2015-11-13 15:43:19','2015-11-13 15:43:19','161122',0),(88,'jersey-multipart-1.5.jar','jar','2015-11-13 15:43:20','2015-11-13 15:43:20','49516',0),(89,'logger_toaster.js','js','2015-11-13 15:43:21','2015-11-13 15:43:21','4374',0),(90,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:43:26','2015-11-13 15:43:26','1416',0),(91,'application.properties','properties','2015-11-13 15:43:27','2015-11-13 15:43:27','864',0),(92,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:43:29','2015-11-13 15:43:29','17611',0),(93,'doc1.png','png','2015-11-13 15:43:30','2015-11-13 15:43:30','15395',0),(94,'error.txt','txt','2015-11-13 15:43:31','2015-11-13 15:43:31','4606',0),(95,'invoice_1.jpg','jpg','2015-11-13 15:43:32','2015-11-13 15:43:32','161122',0),(96,'jersey-multipart-1.5.jar','jar','2015-11-13 15:43:33','2015-11-13 15:43:33','49516',0),(97,'logger_toaster.js','js','2015-11-13 15:43:34','2015-11-13 15:43:34','4374',0),(98,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:44:56','2015-11-13 15:44:56','1416',0),(99,'application.properties','properties','2015-11-13 15:44:57','2015-11-13 15:44:57','864',0),(100,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:44:58','2015-11-13 15:44:58','17611',0),(101,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 15:44:58','2015-11-13 15:44:58','1416',0),(102,'application.properties','properties','2015-11-13 15:44:58','2015-11-13 15:44:58','864',0),(103,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 15:44:58','2015-11-13 15:44:58','17611',0),(104,'doc1.png','png','2015-11-13 15:44:58','2015-11-13 15:44:58','15395',0),(105,'error.txt','txt','2015-11-13 15:44:58','2015-11-13 15:44:58','4606',0),(106,'invoice_1.jpg','jpg','2015-11-13 15:44:58','2015-11-13 15:44:58','161122',0),(107,'jersey-multipart-1.5.jar','jar','2015-11-13 15:44:58','2015-11-13 15:44:58','49516',0),(108,'logger_toaster.js','js','2015-11-13 15:44:58','2015-11-13 15:44:58','4374',0),(109,'doc1.png','png','2015-11-13 15:44:59','2015-11-13 15:44:59','15395',0),(110,'error.txt','txt','2015-11-13 15:45:00','2015-11-13 15:45:00','4606',0),(111,'invoice_1.jpg','jpg','2015-11-13 15:45:01','2015-11-13 15:45:01','161122',0),(112,'jersey-multipart-1.5.jar','jar','2015-11-13 15:45:04','2015-11-13 15:45:04','49516',0),(113,'logger_toaster.js','js','2015-11-13 15:45:05','2015-11-13 15:45:05','4374',0),(114,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 16:30:40','2015-11-13 16:30:40','1416',0),(115,'application.properties','properties','2015-11-13 16:30:41','2015-11-13 16:30:41','864',0),(116,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 16:30:42','2015-11-13 16:30:42','17611',0),(117,'doc1.png','png','2015-11-13 16:30:43','2015-11-13 16:30:43','15395',0),(118,'error.txt','txt','2015-11-13 16:30:44','2015-11-13 16:30:44','4606',0),(119,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 16:33:29','2015-11-13 16:33:29','1416',0),(120,'application.properties','properties','2015-11-13 16:33:29','2015-11-13 16:33:29','864',0),(121,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 16:33:29','2015-11-13 16:33:29','17611',0),(122,'doc1.png','png','2015-11-13 16:33:29','2015-11-13 16:33:29','15395',0),(123,'error.txt','txt','2015-11-13 16:33:29','2015-11-13 16:33:29','4606',0),(124,'invoice_1.jpg','jpg','2015-11-13 16:33:29','2015-11-13 16:33:29','161122',0),(125,'jersey-multipart-1.5.jar','jar','2015-11-13 16:33:29','2015-11-13 16:33:29','49516',0),(126,'logger_toaster.js','js','2015-11-13 16:33:29','2015-11-13 16:33:29','4374',0),(127,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 16:48:12','2015-11-13 16:48:12','1416',0),(128,'application.properties','properties','2015-11-13 16:48:13','2015-11-13 16:48:13','864',0),(129,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 16:48:15','2015-11-13 16:48:15','17611',0),(130,'doc1.png','png','2015-11-13 16:48:16','2015-11-13 16:48:16','15395',0),(131,'error.txt','txt','2015-11-13 16:48:17','2015-11-13 16:48:17','4606',0),(132,'invoice_1.jpg','jpg','2015-11-13 16:48:18','2015-11-13 16:48:18','161122',0),(133,'jersey-multipart-1.5.jar','jar','2015-11-13 16:48:19','2015-11-13 16:48:19','49516',0),(134,'logger_toaster.js','js','2015-11-13 16:48:20','2015-11-13 16:48:20','4374',0),(135,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 16:51:04','2015-11-13 16:51:04','1416',0),(136,'application.properties','properties','2015-11-13 16:51:04','2015-11-13 16:51:04','864',0),(137,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 16:51:04','2015-11-13 16:51:04','17611',0),(138,'doc1.png','png','2015-11-13 16:51:04','2015-11-13 16:51:04','15395',0),(139,'error.txt','txt','2015-11-13 16:51:04','2015-11-13 16:51:04','4606',0),(140,'invoice_1.jpg','jpg','2015-11-13 16:51:04','2015-11-13 16:51:04','161122',0),(141,'jersey-multipart-1.5.jar','jar','2015-11-13 16:51:04','2015-11-13 16:51:04','49516',0),(142,'logger_toaster.js','js','2015-11-13 16:51:04','2015-11-13 16:51:04','4374',0),(143,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-13 17:08:23','2015-11-13 17:08:23','1416',0),(144,'application.properties','properties','2015-11-13 17:08:23','2015-11-13 17:08:23','864',0),(145,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-13 17:08:23','2015-11-13 17:08:23','17611',0),(146,'doc1.png','png','2015-11-13 17:08:23','2015-11-13 17:08:23','15395',0),(147,'error.txt','txt','2015-11-13 17:08:23','2015-11-13 17:08:23','4606',0),(148,'invoice_1.jpg','jpg','2015-11-13 17:08:23','2015-11-13 17:08:23','161122',0),(149,'jersey-multipart-1.5.jar','jar','2015-11-13 17:08:23','2015-11-13 17:08:23','49516',0),(150,'logger_toaster.js','js','2015-11-13 17:08:23','2015-11-13 17:08:23','4374',0),(151,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-14 10:50:11','2015-11-14 10:50:11','1416',0),(152,'application.properties','properties','2015-11-14 10:50:12','2015-11-14 10:50:12','864',0),(153,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-14 10:50:14','2015-11-14 10:50:14','17611',0),(154,'doc1.png','png','2015-11-14 10:50:15','2015-11-14 10:50:15','15395',0),(155,'error.txt','txt','2015-11-14 10:50:16','2015-11-14 10:50:16','4606',0),(156,'invoice_1.jpg','jpg','2015-11-14 10:50:17','2015-11-14 10:50:17','161122',0),(157,'jersey-multipart-1.5.jar','jar','2015-11-14 10:50:18','2015-11-14 10:50:18','49516',0),(158,'logger_toaster.js','js','2015-11-14 10:50:19','2015-11-14 10:50:19','4374',0),(159,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-14 11:29:57','2015-11-14 11:29:57','1416',0),(160,'application.properties','properties','2015-11-14 11:29:57','2015-11-14 11:29:57','864',0),(161,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-14 11:29:57','2015-11-14 11:29:57','17611',0),(162,'doc1.png','png','2015-11-14 11:29:57','2015-11-14 11:29:57','15395',0),(163,'error.txt','txt','2015-11-14 11:29:57','2015-11-14 11:29:57','4606',0),(164,'invoice_1.jpg','jpg','2015-11-14 11:29:57','2015-11-14 11:29:57','161122',0),(165,'jersey-multipart-1.5.jar','jar','2015-11-14 11:29:57','2015-11-14 11:29:57','49516',0),(166,'logger_toaster.js','js','2015-11-14 11:29:57','2015-11-14 11:29:57','4374',0),(167,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-14 11:31:22','2015-11-14 11:31:22','1416',0),(168,'application.properties','properties','2015-11-14 11:31:22','2015-11-14 11:31:22','864',0),(169,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-14 11:31:22','2015-11-14 11:31:22','17611',0),(170,'doc1.png','png','2015-11-14 11:31:22','2015-11-14 11:31:22','15395',0),(171,'error.txt','txt','2015-11-14 11:31:22','2015-11-14 11:31:22','4606',0),(172,'invoice_1.jpg','jpg','2015-11-14 11:31:22','2015-11-14 11:31:22','161122',0),(173,'jersey-multipart-1.5.jar','jar','2015-11-14 11:31:22','2015-11-14 11:31:22','49516',0),(174,'logger_toaster.js','js','2015-11-14 11:31:22','2015-11-14 11:31:22','4374',0),(175,'hasseeebb.txt','txt','2015-11-14 11:38:29','2015-11-14 11:38:29','748',0),(176,'GoogleAnalytics-TrackingID.txt','txt','2015-11-14 11:46:59','2015-11-14 11:46:59','1779',0),(177,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-14 12:03:27','2015-11-14 12:03:27','1416',0),(178,'application.properties','properties','2015-11-14 12:03:27','2015-11-14 12:03:27','864',0),(179,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-14 12:03:27','2015-11-14 12:03:27','17611',0),(180,'doc1.png','png','2015-11-14 12:03:27','2015-11-14 12:03:27','15395',0),(181,'error.txt','txt','2015-11-14 12:03:27','2015-11-14 12:03:27','4606',0),(182,'GoogleAnalytics-TrackingID.txt','txt','2015-11-14 12:03:27','2015-11-14 12:03:27','1779',0),(183,'hasseeebb.txt','txt','2015-11-14 12:03:27','2015-11-14 12:03:27','748',0),(184,'invoice_1.jpg','jpg','2015-11-14 12:03:27','2015-11-14 12:03:27','161122',0),(185,'jersey-multipart-1.5.jar','jar','2015-11-14 12:03:27','2015-11-14 12:03:27','49516',0),(186,'logger_toaster.js','js','2015-11-14 12:03:27','2015-11-14 12:03:27','4374',0),(187,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-14 13:06:22','2015-11-14 13:06:22','1416',0),(188,'application.properties','properties','2015-11-14 13:06:22','2015-11-14 13:06:22','864',0),(189,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-14 13:06:22','2015-11-14 13:06:22','17611',0),(190,'doc1.png','png','2015-11-14 13:06:22','2015-11-14 13:06:22','15395',0),(191,'error.txt','txt','2015-11-14 13:06:22','2015-11-14 13:06:22','4606',0),(192,'GoogleAnalytics-TrackingID.txt','txt','2015-11-14 13:06:22','2015-11-14 13:06:22','1779',0),(193,'hasseeebb.txt','txt','2015-11-14 13:06:22','2015-11-14 13:06:22','748',0),(194,'invoice_1.jpg','jpg','2015-11-14 13:06:22','2015-11-14 13:06:22','161122',0),(195,'jersey-multipart-1.5.jar','jar','2015-11-14 13:06:22','2015-11-14 13:06:22','49516',0),(196,'logger_toaster.js','js','2015-11-14 13:06:22','2015-11-14 13:06:22','4374',0),(197,'3d-perspective-carousel-with-css3-transforms.zip','zip','2015-11-14 13:15:29','2015-11-14 13:15:29','1416',0),(198,'application.properties','properties','2015-11-14 13:15:29','2015-11-14 13:15:29','864',0),(199,'create-a-3d-hexagon-grid-layout-with-css3.zip','zip','2015-11-14 13:15:31','2015-11-14 13:15:31','17611',0),(200,'doc1.png','png','2015-11-14 13:15:32','2015-11-14 13:15:32','15395',0),(201,'error.txt','txt','2015-11-14 13:15:33','2015-11-14 13:15:33','4606',0),(202,'application.properties','properties','2015-11-14 13:25:13','2015-11-14 13:25:13','864',0),(203,'error.txt','txt','2015-11-14 13:25:13','2015-11-14 13:25:13','4606',0),(204,'Example_004.jpg','jpg','2015-11-14 13:25:14','2015-11-14 13:25:14','130504',0),(205,'notes.txt','txt','2015-11-14 13:25:14','2015-11-14 13:25:14','935',0),(206,'application.properties','properties','2015-11-14 13:57:51','2015-11-14 13:57:51','864',0),(207,'error.txt','txt','2015-11-14 13:57:51','2015-11-14 13:57:51','4606',0),(208,'Example_004.jpg','jpg','2015-11-14 13:57:51','2015-11-14 13:57:51','130504',0),(209,'notes.txt','txt','2015-11-14 13:57:51','2015-11-14 13:57:51','935',0),(210,'application.properties','properties','2015-11-14 14:49:39','2015-11-14 14:49:39','864',0),(211,'error.txt','txt','2015-11-14 14:49:39','2015-11-14 14:49:39','4606',0),(212,'Example_004.jpg','jpg','2015-11-14 14:49:39','2015-11-14 14:49:39','130504',0),(213,'notes.txt','txt','2015-11-14 14:49:39','2015-11-14 14:49:39','935',0),(214,'application.properties','properties','2015-11-14 14:52:08','2015-11-14 14:52:08','864',0),(215,'error.txt','txt','2015-11-14 14:52:08','2015-11-14 14:52:08','4606',0),(216,'Example_004.jpg','jpg','2015-11-14 14:52:08','2015-11-14 14:52:08','130504',0),(217,'notes.txt','txt','2015-11-14 14:52:08','2015-11-14 14:52:08','935',0),(218,'application.properties','properties','2015-11-14 15:20:50','2015-11-14 15:20:50','864',0),(219,'error.txt','txt','2015-11-14 15:20:50','2015-11-14 15:20:50','4606',0),(220,'Example_004.jpg','jpg','2015-11-14 15:20:50','2015-11-14 15:20:50','130504',0),(221,'notes.txt','txt','2015-11-14 15:20:50','2015-11-14 15:20:50','935',0),(222,'application.properties','properties','2015-11-14 15:22:00','2015-11-14 15:22:00','864',0),(223,'error.txt','txt','2015-11-14 15:22:01','2015-11-14 15:22:01','4606',0),(224,'Example_004.jpg','jpg','2015-11-14 15:22:02','2015-11-14 15:22:02','0',0),(225,'notes.txt','txt','2015-11-14 15:22:03','2015-11-14 15:22:03','0',0),(226,'application.properties','properties','2015-11-14 16:11:37','2015-11-14 16:11:37','864',0),(227,'error.txt','txt','2015-11-14 16:11:37','2015-11-14 16:11:37','4606',0),(228,'Example_004.jpg','jpg','2015-11-14 16:11:37','2015-11-14 16:11:37','130504',0),(229,'notes.txt','txt','2015-11-14 16:11:37','2015-11-14 16:11:37','935',0);
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
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`rule_id`),
  UNIQUE KEY `rule_name_UNIQUE` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crules`
--

LOCK TABLES `crules` WRITE;
/*!40000 ALTER TABLE `crules` DISABLE KEYS */;
INSERT INTO `crules` VALUES ('rl1001','ValidationSuccess','TestRuleFor Demo','SOP','Root','2015-11-03 11:56:31'),('rl1002','ValidationFailiure','TestRuleFor Demo','SOP','Root','2015-11-04 15:04:06');
/*!40000 ALTER TABLE `crules` ENABLE KEYS */;
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
INSERT INTO `crulepackage` VALUES ('pk1001','com.hethi.daas.service','TestPackage Description','Root','2015-11-03 12:01:58');
/*!40000 ALTER TABLE `crulepackage` ENABLE KEYS */;
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
INSERT INTO `dupload_file` VALUES (1,1,'invoice_21447223193599.jpg','jpg','http://localhost:4141/images/uploads/invoice_21447223193599.jpg',82762,0,'cefs100101',3,'2015-11-11 11:56:33',15),(2,1,'1445678034494_apple_mac1447230323727.jpg','jpg','http://localhost:4141/images/uploads/1445678034494_apple_mac1447230323727.jpg',61830,0,'cefs100101',3,'2015-11-11 13:55:23',40),(3,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 14:23:03',0),(4,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 14:23:05',0),(4,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 14:23:05',0),(5,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 14:23:06',0),(6,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 14:23:07',0),(7,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-13 14:23:08',0),(8,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 14:28:01',0),(9,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 14:28:01',0),(9,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 14:28:01',0),(10,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 14:28:05',0),(11,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 14:28:05',0),(12,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-13 14:28:11',0),(13,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 14:34:51',0),(14,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 14:34:51',0),(14,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 14:34:51',0),(15,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 14:34:54',0),(16,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 14:34:54',0),(17,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-13 14:35:00',0),(18,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 14:39:56',0),(19,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 14:40:00',0),(19,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 14:40:00',0),(20,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 14:40:03',0),(21,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 14:40:03',0),(22,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-13 14:40:06',0),(23,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 14:41:39',0),(24,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 14:41:39',0),(25,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 14:41:42',0),(25,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 14:41:42',0),(26,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 14:41:42',0),(27,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 14:41:45',0),(28,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-13 14:41:49',0),(29,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 14:44:12',0),(30,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 14:44:17',0),(30,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 14:44:17',0),(31,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 14:45:43',0),(32,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 14:45:47',0),(33,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 14:45:52',0),(33,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 14:45:52',0),(34,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 14:45:57',0),(35,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 14:46:02',0),(36,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 14:46:07',0),(37,1,'application.properties','properties','D://Workspace/FTP/application.properties',0,0,'efs_uin',1,'2015-11-13 14:48:25',0),(38,1,'doc1.png','png','D://Workspace/FTP/doc1.png',0,0,'efs_uin',1,'2015-11-13 14:48:28',0),(39,1,'error.txt','txt','D://Workspace/FTP/error.txt',0,0,'efs_uin',1,'2015-11-13 14:48:29',0),(40,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',0,0,'efs_uin',1,'2015-11-13 14:48:30',0),(41,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 14:49:55',0),(42,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:34:44',0),(43,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:34:44',0),(44,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:34:44',0),(44,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:34:44',0),(45,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:34:44',0),(46,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:34:44',0),(47,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:34:44',0),(48,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:34:44',0),(49,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:35:51',0),(50,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:39:54',0),(51,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:39:55',0),(52,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:39:57',0),(52,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:39:57',0),(53,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:39:58',0),(54,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:39:59',0),(55,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:40:00',0),(56,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:40:01',0),(57,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:40:02',0),(58,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:40:21',0),(59,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:40:22',0),(60,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:40:24',0),(60,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:40:24',0),(61,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:40:25',0),(62,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:40:26',0),(63,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:40:27',0),(64,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:40:28',0),(65,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:40:29',0),(66,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:41:46',0),(67,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:41:46',0),(68,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:41:46',0),(68,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:41:46',0),(69,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:41:46',0),(70,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:41:46',0),(71,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:41:46',0),(72,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:41:46',0),(73,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:41:46',0),(74,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:41:49',0),(75,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:41:50',0),(76,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:41:52',0),(76,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:41:52',0),(77,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:41:53',0),(78,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:41:54',0),(79,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:41:55',0),(80,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:41:56',0),(81,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:41:57',0),(82,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:43:13',0),(83,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:43:14',0),(84,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:43:16',0),(84,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:43:16',0),(85,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:43:17',0),(86,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:43:18',0),(87,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:43:19',0),(88,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:43:20',0),(89,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:43:21',0),(90,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:43:26',0),(91,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:43:27',0),(92,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:43:29',0),(92,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:43:29',0),(93,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:43:30',0),(94,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:43:31',0),(95,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:43:32',0),(96,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:43:33',0),(97,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:43:34',0),(98,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:44:56',0),(99,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:44:57',0),(100,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:44:58',0),(100,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:44:58',0),(101,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 15:44:58',0),(102,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 15:44:58',0),(103,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 15:44:58',0),(103,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 15:44:58',0),(104,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:44:58',0),(105,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:44:58',0),(106,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:44:58',0),(107,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:44:58',0),(108,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:44:58',0),(109,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 15:44:59',0),(110,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 15:45:00',0),(111,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 15:45:01',0),(112,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 15:45:04',0),(113,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 15:45:05',0),(114,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 16:30:40',0),(115,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 16:30:41',0),(116,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 16:30:42',0),(116,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 16:30:42',0),(117,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 16:30:43',0),(118,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 16:30:44',0),(119,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 16:33:29',0),(120,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 16:33:29',0),(121,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 16:33:29',0),(121,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 16:33:29',0),(122,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 16:33:29',0),(123,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 16:33:29',0),(124,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 16:33:29',0),(125,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 16:33:29',0),(126,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 16:33:29',0),(127,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 16:48:12',0),(128,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 16:48:13',0),(129,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 16:48:15',0),(129,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 16:48:15',0),(130,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 16:48:16',0),(131,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 16:48:17',0),(132,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 16:48:18',0),(133,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 16:48:19',0),(134,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 16:48:20',0),(135,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 16:51:04',0),(136,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 16:51:04',0),(137,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 16:51:04',0),(137,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 16:51:04',0),(138,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 16:51:04',0),(139,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 16:51:04',0),(140,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 16:51:04',0),(141,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 16:51:04',0),(142,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 16:51:04',0),(143,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-13 17:08:23',0),(144,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-13 17:08:23',0),(145,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-13 17:08:23',0),(145,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-13 17:08:23',0),(146,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-13 17:08:23',0),(147,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-13 17:08:23',0),(148,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-13 17:08:23',0),(149,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-13 17:08:23',0),(150,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-13 17:08:23',0),(151,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-14 10:50:11',0),(152,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 10:50:12',0),(153,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-14 10:50:14',0),(153,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-14 10:50:14',0),(154,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-14 10:50:15',0),(155,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 10:50:16',0),(156,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-14 10:50:17',0),(157,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-14 10:50:18',0),(158,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-14 10:50:19',0),(159,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-14 11:29:57',0),(160,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 11:29:57',0),(161,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-14 11:29:57',0),(161,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-14 11:29:57',0),(162,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-14 11:29:57',0),(163,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 11:29:57',0),(164,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-14 11:29:57',0),(165,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-14 11:29:57',0),(166,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-14 11:29:57',0),(167,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-14 11:31:22',0),(168,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 11:31:22',0),(169,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-14 11:31:22',0),(169,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-14 11:31:22',0),(170,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-14 11:31:22',0),(171,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 11:31:22',0),(172,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-14 11:31:22',0),(173,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-14 11:31:22',0),(174,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-14 11:31:22',0),(175,1,'hasseeebb.txt','txt','D://Workspace/FTP/hasseeebb.txt',748,0,'efs_uin',1,'2015-11-14 11:38:29',0),(176,1,'GoogleAnalytics-TrackingID.txt','txt','D://Workspace/FTP/GoogleAnalytics-TrackingID.txt',1779,0,'efs_uin',1,'2015-11-14 11:46:59',0),(177,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-14 12:03:27',0),(178,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 12:03:27',0),(179,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-14 12:03:27',0),(179,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-14 12:03:27',0),(180,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-14 12:03:27',0),(181,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 12:03:27',0),(182,1,'GoogleAnalytics-TrackingID.txt','txt','D://Workspace/FTP/GoogleAnalytics-TrackingID.txt',1779,0,'efs_uin',1,'2015-11-14 12:03:27',0),(183,1,'hasseeebb.txt','txt','D://Workspace/FTP/hasseeebb.txt',748,0,'efs_uin',1,'2015-11-14 12:03:27',0),(184,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-14 12:03:27',0),(185,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-14 12:03:27',0),(186,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-14 12:03:27',0),(187,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-14 13:06:22',0),(188,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 13:06:22',0),(189,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-14 13:06:22',0),(189,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-14 13:06:22',0),(190,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-14 13:06:22',0),(191,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 13:06:22',0),(192,1,'GoogleAnalytics-TrackingID.txt','txt','D://Workspace/FTP/GoogleAnalytics-TrackingID.txt',1779,0,'efs_uin',1,'2015-11-14 13:06:22',0),(193,1,'hasseeebb.txt','txt','D://Workspace/FTP/hasseeebb.txt',748,0,'efs_uin',1,'2015-11-14 13:06:22',0),(194,1,'invoice_1.jpg','jpg','D://Workspace/FTP/invoice_1.jpg',161122,0,'efs_uin',1,'2015-11-14 13:06:22',0),(195,1,'jersey-multipart-1.5.jar','jar','D://Workspace/FTP/jersey-multipart-1.5.jar',49516,0,'efs_uin',1,'2015-11-14 13:06:22',0),(196,1,'logger_toaster.js','js','D://Workspace/FTP/logger_toaster.js',4374,0,'efs_uin',1,'2015-11-14 13:06:22',0),(197,1,'index.html','html','D://Workspace/FTP/3d-perspective-carousel-with-css3-transforms',3387,0,'efs_uin',1,'2015-11-14 13:15:29',0),(198,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 13:15:29',0),(199,1,'doc1.png','png','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',15395,0,'efs_uin',1,'2015-11-14 13:15:31',0),(199,2,'index.html','html','D://Workspace/FTP/create-a-3d-hexagon-grid-layout-with-css3',19853,0,'efs_uin',1,'2015-11-14 13:15:31',0),(200,1,'doc1.png','png','D://Workspace/FTP/doc1.png',15395,0,'efs_uin',1,'2015-11-14 13:15:32',0),(201,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 13:15:33',0),(202,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 13:25:13',0),(203,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 13:25:13',0),(204,1,'Example_004.jpg','jpg','D://Workspace/FTP/Example_004.jpg',130504,0,'efs_uin',1,'2015-11-14 13:25:14',0),(205,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-14 13:25:14',0),(206,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 13:57:51',0),(207,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 13:57:51',0),(208,1,'Example_004.jpg','jpg','D://Workspace/FTP/Example_004.jpg',130504,0,'efs_uin',1,'2015-11-14 13:57:51',0),(209,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-14 13:57:51',0),(210,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 14:49:39',0),(211,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 14:49:39',0),(212,1,'Example_004.jpg','jpg','D://Workspace/FTP/Example_004.jpg',130504,0,'efs_uin',1,'2015-11-14 14:49:39',0),(213,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-14 14:49:39',0),(214,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 14:52:08',0),(215,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 14:52:08',0),(216,1,'Example_004.jpg','jpg','D://Workspace/FTP/Example_004.jpg',130504,0,'efs_uin',1,'2015-11-14 14:52:08',0),(217,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-14 14:52:08',0),(218,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 15:20:50',0),(219,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 15:20:50',0),(220,1,'Example_004.jpg','jpg','D://Workspace/FTP/Example_004.jpg',130504,0,'efs_uin',1,'2015-11-14 15:20:50',0),(221,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-14 15:20:51',0),(222,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 15:22:00',0),(223,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 15:22:01',0),(224,1,'Example_004.jpg','jpg','D://Workspace/FTP/Example_004.jpg',0,0,'efs_uin',1,'2015-11-14 15:22:02',0),(225,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',0,0,'efs_uin',1,'2015-11-14 15:22:03',0),(226,1,'application.properties','properties','D://Workspace/FTP/application.properties',864,0,'efs_uin',1,'2015-11-14 16:11:37',0),(227,1,'error.txt','txt','D://Workspace/FTP/error.txt',4606,0,'efs_uin',1,'2015-11-14 16:11:37',0),(228,1,'Example_004.jpg','jpg','D://Workspace/FTP/Example_004.jpg',130504,0,'efs_uin',1,'2015-11-14 16:11:37',0),(229,1,'notes.txt','txt','D://Workspace/FTP/notes.txt',935,0,'efs_uin',1,'2015-11-14 16:11:37',0);
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
  PRIMARY KEY (`customer_id`,`business_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomer`
--

LOCK TABLES `dcustomer` WRITE;
/*!40000 ALTER TABLE `dcustomer` DISABLE KEYS */;
INSERT INTO `dcustomer` VALUES (1,'Hethi','Hethi',1,'saifudheen@cronyco.in','1234556','Hethi-Contact','+919446383034');
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
INSERT INTO `dcustomer_upload` VALUES (1,1,2,'2015-11-11 14:37:56','1','2015-11-11 11:56:33'),(1,2,2,'2015-11-11 13:55:23','3','2015-11-11 13:55:23'),(1,151,NULL,'2015-11-14 10:50:11','1','2015-11-14 10:50:11'),(1,152,NULL,'2015-11-14 10:50:12','1','2015-11-14 10:50:12'),(1,153,NULL,'2015-11-14 10:50:14','1','2015-11-14 10:50:14'),(1,154,NULL,'2015-11-14 10:50:15','1','2015-11-14 10:50:15'),(1,155,NULL,'2015-11-14 10:50:16','1','2015-11-14 10:50:16'),(1,156,NULL,'2015-11-14 10:50:17','1','2015-11-14 10:50:17'),(1,157,NULL,'2015-11-14 10:50:18','1','2015-11-14 10:50:18'),(1,158,NULL,'2015-11-14 10:50:19','1','2015-11-14 10:50:19'),(1,159,NULL,'2015-11-14 11:29:57','1','2015-11-14 11:29:57'),(1,160,NULL,'2015-11-14 11:29:57','1','2015-11-14 11:29:57'),(1,161,NULL,'2015-11-14 11:29:57','1','2015-11-14 11:29:57'),(1,162,NULL,'2015-11-14 11:29:57','1','2015-11-14 11:29:57'),(1,163,NULL,'2015-11-14 11:29:57','1','2015-11-14 11:29:57'),(1,164,NULL,'2015-11-14 11:29:57','1','2015-11-14 11:29:57'),(1,165,NULL,'2015-11-14 11:29:57','1','2015-11-14 11:29:57'),(1,166,NULL,'2015-11-14 11:29:57','1','2015-11-14 11:29:57'),(1,167,NULL,'2015-11-14 11:31:22','1','2015-11-14 11:31:22'),(1,168,NULL,'2015-11-14 11:31:22','1','2015-11-14 11:31:22'),(1,169,NULL,'2015-11-14 11:31:22','1','2015-11-14 11:31:22'),(1,170,NULL,'2015-11-14 11:31:22','1','2015-11-14 11:31:22'),(1,171,NULL,'2015-11-14 11:31:22','1','2015-11-14 11:31:22'),(1,172,NULL,'2015-11-14 11:31:22','1','2015-11-14 11:31:22'),(1,173,NULL,'2015-11-14 11:31:22','1','2015-11-14 11:31:22'),(1,174,NULL,'2015-11-14 11:31:22','1','2015-11-14 11:31:22'),(1,175,NULL,'2015-11-14 11:38:29','1','2015-11-14 11:38:29'),(1,176,NULL,'2015-11-14 11:46:59','1','2015-11-14 11:46:59'),(1,177,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,178,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,179,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,180,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,181,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,182,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,183,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,184,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,185,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,186,NULL,'2015-11-14 12:03:27','1','2015-11-14 12:03:27'),(1,187,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,188,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,189,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,190,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,191,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,192,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,193,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,194,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,195,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,196,NULL,'2015-11-14 13:06:22','1','2015-11-14 13:06:22'),(1,197,NULL,'2015-11-14 13:15:29','1','2015-11-14 13:15:29'),(1,198,NULL,'2015-11-14 13:15:29','1','2015-11-14 13:15:29'),(1,199,NULL,'2015-11-14 13:15:31','1','2015-11-14 13:15:31'),(1,200,NULL,'2015-11-14 13:15:32','1','2015-11-14 13:15:32'),(1,201,NULL,'2015-11-14 13:15:33','1','2015-11-14 13:15:33'),(1,202,NULL,'2015-11-14 13:25:13','1','2015-11-14 13:25:13'),(1,203,NULL,'2015-11-14 13:25:13','1','2015-11-14 13:25:13'),(1,204,NULL,'2015-11-14 13:25:14','1','2015-11-14 13:25:14'),(1,205,NULL,'2015-11-14 13:25:14','1','2015-11-14 13:25:14'),(1,206,NULL,'2015-11-14 13:57:51','1','2015-11-14 13:57:51'),(1,207,NULL,'2015-11-14 13:57:51','1','2015-11-14 13:57:51'),(1,208,NULL,'2015-11-14 13:57:51','1','2015-11-14 13:57:51'),(1,209,NULL,'2015-11-14 13:57:51','1','2015-11-14 13:57:51'),(1,210,NULL,'2015-11-14 14:49:39','1','2015-11-14 14:49:39'),(1,211,NULL,'2015-11-14 14:49:39','1','2015-11-14 14:49:39'),(1,212,NULL,'2015-11-14 14:49:39','1','2015-11-14 14:49:39'),(1,213,NULL,'2015-11-14 14:49:39','1','2015-11-14 14:49:39'),(1,214,NULL,'2015-11-14 14:52:08','1','2015-11-14 14:52:08'),(1,215,NULL,'2015-11-14 14:52:08','1','2015-11-14 14:52:08'),(1,216,NULL,'2015-11-14 14:52:08','1','2015-11-14 14:52:08'),(1,217,NULL,'2015-11-14 14:52:08','1','2015-11-14 14:52:08'),(1,218,NULL,'2015-11-14 15:20:50','1','2015-11-14 15:20:50'),(1,219,NULL,'2015-11-14 15:20:50','1','2015-11-14 15:20:50'),(1,220,NULL,'2015-11-14 15:20:50','1','2015-11-14 15:20:50'),(1,221,NULL,'2015-11-14 15:20:50','1','2015-11-14 15:20:50'),(1,222,NULL,'2015-11-14 15:22:00','1','2015-11-14 15:22:00'),(1,223,NULL,'2015-11-14 15:22:01','1','2015-11-14 15:22:01'),(1,224,NULL,'2015-11-14 15:22:02','1','2015-11-14 15:22:02'),(1,225,NULL,'2015-11-14 15:22:03','1','2015-11-14 15:22:03'),(1,226,NULL,'2015-11-14 16:11:37','1','2015-11-14 16:11:37'),(1,227,NULL,'2015-11-14 16:11:37','1','2015-11-14 16:11:37'),(1,228,NULL,'2015-11-14 16:11:37','1','2015-11-14 16:11:37'),(1,229,NULL,'2015-11-14 16:11:37','1','2015-11-14 16:11:37');
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
  `addressid` char(6) NOT NULL COMMENT 'auto fill',
  `address_type` varchar(20) NOT NULL COMMENT 'main office/branch',
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) NOT NULL,
  `cust_country` char(3) NOT NULL COMMENT 'connect to country master',
  `cust_loc_zip` varchar(10) NOT NULL COMMENT 'zipcode is must as this helps in geo help ',
  `gps_coordinate` varchar(200) DEFAULT NULL COMMENT 'gmap coordinate to be stored',
  `contact_email` varchar(50) NOT NULL COMMENT 'email,primary contact. email as mode of social login',
  `contact_tel` varchar(30) NOT NULL,
  `contact_fax` varchar(30) NOT NULL,
  `socialtype` varchar(50) NOT NULL COMMENT 'whats app. Ability to register with whatsapp, recv and send info for click to chat',
  `whatsapp` varchar(50) NOT NULL COMMENT 'connect to country master',
  `linkedin` varchar(50) NOT NULL COMMENT 'Zipcode is must as this helps in geo help',
  `lastupuser` int(11) NOT NULL COMMENT 'userid auto trial',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`addressid`,`address_type`,`cust_loc_zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomercommn`
--

LOCK TABLES `dcustomercommn` WRITE;
/*!40000 ALTER TABLE `dcustomercommn` DISABLE KEYS */;
INSERT INTO `dcustomercommn` VALUES ('1','Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','whatsapp','9876544','linkedin',1,'2015-10-16 11:10:10'),('2','','','','','','','demo@hethi.com','','','','','',1,'2015-10-26 11:35:07'),('3','','','','','','','hareesh@hethi.com','','','','','',1,'2015-10-26 11:46:30'),('4','','','','','','','samad123@gmail.com','','','','','',1,'2015-10-26 11:48:43'),('5','','','','','','','as@as.com','','','','','',1,'2015-10-27 09:58:02'),('6','','','','','','','zzz','','','','','',1,'2015-10-27 10:07:18'),('7','','','','','','','hareesh@gmail.com','','','','','',1,'2015-10-28 10:27:14'),('8','','','','','','','hareesh@gmail.com','','','','','',1,'2015-10-28 10:28:34');
/*!40000 ALTER TABLE `dcustomercommn` ENABLE KEYS */;
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
INSERT INTO `ciconnector_rules` VALUES ('rule100101','pk1001','ws1001','rl1001','Root','2015-11-03 12:06:05'),('rule100102','pk1001','ws1001','rl1002','Root','2015-11-04 15:05:14');
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
INSERT INTO `dsoprules` VALUES ('csfs100101','cefs100116','qs1001','rule100101',1,'ip : iPost( clientID.length > 0, cid : clientID)','System.out.println( \"Validating document on daas \"); ','1','ws1001','Root','2015-11-03 14:37:53'),('csfs100101','cefs100116','qs1001','rule100102',1,'ip : iPost( clientID.length ==0 , cid : clientID)','System.out.println( \"Validating document on daas \"); ','1','ws1001','Root','2015-11-03 14:37:53');
/*!40000 ALTER TABLE `dsoprules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duser`
--

DROP TABLE IF EXISTS `duser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duser` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT 'tcustomer:customer_id',
  `user_address` int(11) NOT NULL COMMENT 'address:address_id',
  `role_id` int(11) DEFAULT '1' COMMENT 'drole.role_id',
  `user_login_id` varchar(50) NOT NULL,
  `user_login_password` varchar(50) NOT NULL,
  `lastupdtm` datetime NOT NULL COMMENT 'autofill system generated datetime',
  PRIMARY KEY (`user_id`,`customer_id`,`user_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duser`
--

LOCK TABLES `duser` WRITE;
/*!40000 ALTER TABLE `duser` DISABLE KEYS */;
INSERT INTO `duser` VALUES (1,'Hethi-Admin',1,1,1,'admin@hethi.com','admin','2015-10-16 11:10:10'),(2,'Hethi-Artist',1,1,2,'artist@hethi.com','artist','2015-10-16 11:10:10'),(3,'Hethi-User',1,1,3,'user@hethi.com','user','2015-10-16 11:10:10'),(4,'Hethi-Manager',1,1,4,'manager@hethi.com','manager','2015-10-28 10:27:14'),(5,'Hethi-Supervisor',1,1,5,'supervisor@hethi.com','supervisor','2015-10-28 10:28:34'),(6,'Hethi-Operator',1,1,6,'operator@hethi.com','operator','2015-10-28 10:28:34');
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
INSERT INTO `ui_images` VALUES (1,1,'http://localhost:4141/images/bps/Invoice.jpg','invoice process to pay',1),(2,1,'http://localhost:4141/images/bps/claim.png','claims process to pay',1),(3,1,'http://localhost:4141/images/bps/loan.jpg','loans to classify',1),(4,1,'http://localhost:4141/images/bps/epub.png','books to ePUB',1),(5,1,'http://localhost:4141/images/bps/enrollment.png','enroll, onboard to pay',1),(101,1,'http://localhost:4141/images/industry/retail.jpg','Retail',1),(102,1,'http://localhost:4141/images/industry/healthcare.jpg','Healthcare',1),(103,1,'http://localhost:4141/images/industry/onlineBanking.jpg','Banking',1),(104,1,'http://localhost:4141/images/industry/lifeInsurance.jpg','Insurance',1),(105,1,'http://localhost:4141/images/industry/manufacturing.jpg','Manufacturing',1),(106,1,'http://localhost:4141/images/industry/telecom.jpg','Telecom',1),(201,1,'http://localhost:4141/images/industry/POInventory.jpg','enroll',1),(202,1,'http://localhost:4141/images/industry/poExpense.jpg',' HCFA',1),(203,1,'http://localhost:4141/images/close_up_payment_account_text_cg6p1432796c_th.jpg',' AP-PO',1),(204,1,'http://localhost:4141/images/shutterstock_219004666_1024x768_0.jpg','NONPO',1),(205,1,'http://localhost:4141/images/UB_Logo_mark_Blue2.png','UB',1),(206,1,'http://localhost:4141/images/DentalPatientforms.jpg','DENTAL',1),(207,1,'http://localhost:4141/images/eob.png','EOB',1),(208,1,'http://localhost:4141/images/homeloan_banner.jpg','LOANS-RES',1),(209,1,'http://localhost:4141/images/loans.jpg','LOANS-COM',1);
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
  `tfs_uin` char(7) NOT NULL COMMENT 'cformbundle.tfs_uin',
  `sfs_uin` char(10) NOT NULL COMMENT 'csconnector.sfs_UIN',
  `queue_id` char(6) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `next_queue` char(6) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `exception_queue` char(6) NOT NULL COMMENT 'total 6 characters. Starts with qu, 100101. example : qu100101',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`tfs_uin`,`sfs_uin`,`queue_id`,`next_queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomerserviceplayqueue`
--

LOCK TABLES `dcustomerserviceplayqueue` WRITE;
/*!40000 ALTER TABLE `dcustomerserviceplayqueue` DISABLE KEYS */;
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
  `rule_uin` char(6) NOT NULL COMMENT 'ciconnector_rules.rule_uin',
  `zone_id` int(11) NOT NULL COMMENT 'tZone.zone_id',
  `rule_condition` varchar(255) NOT NULL,
  `rule_action` varchar(255) DEFAULT NULL,
  `rule_exception` char(6) DEFAULT NULL COMMENT 'SOP, CUST etc',
  `rule_workset` char(6) DEFAULT NULL COMMENT 'cRuleWorkset.workset_id',
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  PRIMARY KEY (`customer_id`,`sfs_uin`,`queue_id`,`rule_uin`,`zone_id`,`efs_uin`),
  UNIQUE KEY `rule_condition_UNIQUE` (`rule_condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomrules`
--

LOCK TABLES `dcustomrules` WRITE;
/*!40000 ALTER TABLE `dcustomrules` DISABLE KEYS */;
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
-- Table structure for table `cindexclassifystencil`
--

DROP TABLE IF EXISTS `cindexclassifystencil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cindexclassifystencil` (
  `form_stencid` int(11) NOT NULL,
  `efslobowner_id` char(9) DEFAULT NULL,
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
INSERT INTO `cindexclassifystencil` VALUES (1,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>7</top><left>43</left><width>173</width><height>51</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-11 17:11:41'),(2,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>12</top><left>42</left><width>172</width><height>46</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorStreetAddress</name><form_coords><top>66</top><left>12</left><width>188</width><height>32</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-11 17:33:35'),(3,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>15</top><left>51</left><width>158</width><height>42</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-11 17:36:09'),(4,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>15</top><left>51</left><width>158</width><height>42</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>SupplierCompanyName</name><form_coords><top>17</top><left>45</left><width>162</width><height>42</height></form_coords><field_data>SupplierCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>SupplierEmail </name><form_coords><top>501</top><left>9</left><width>171</width><height>43</height></form_coords><field_data>SupplierEmail _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-11 17:36:34'),(5,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>15</top><left>51</left><width>158</width><height>42</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>SupplierCompanyName</name><form_coords><top>17</top><left>45</left><width>162</width><height>42</height></form_coords><field_data>SupplierCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>SupplierEmail </name><form_coords><top>501</top><left>9</left><width>171</width><height>43</height></form_coords><field_data>SupplierEmail _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-11 17:44:03'),(6,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>14</top><left>45</left><width>160</width><height>48</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-12 09:36:19'),(7,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>14</top><left>45</left><width>160</width><height>48</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-12 09:48:53'),(8,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>14</top><left>50</left><width>161</width><height>47</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceNumber</name><form_coords><top>111</top><left>411</left><width>96</width><height>16</height></form_coords><field_data>InvoiceNumber_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceDate</name><form_coords><top>156</top><left>406</left><width>91</width><height>17</height></form_coords><field_data>InvoiceDate_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>PONumber</name><form_coords><top>295</top><left>129</left><width>57</width><height>13</height></form_coords><field_data>PONumber_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-12 11:40:13'),(9,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>14</top><left>50</left><width>161</width><height>47</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceNumber</name><form_coords><top>111</top><left>411</left><width>96</width><height>16</height></form_coords><field_data>InvoiceNumber_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceDate</name><form_coords><top>156</top><left>406</left><width>91</width><height>17</height></form_coords><field_data>InvoiceDate_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>PONumber</name><form_coords><top>295</top><left>129</left><width>57</width><height>13</height></form_coords><field_data>PONumber_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-12 11:43:53'),(10,'efslob','cefs100105','<fieldset><field><name>VendorCompanyName</name><form_coords><top>35</top><left>122</left><width>285</width><height>41</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorStreetAddress</name><form_coords><top>89</top><left>122</left><width>71</width><height>17</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorCity </name><form_coords><top>91</top><left>220</left><width>80</width><height>18</height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/3_1_2.xml','2','2015-11-12 15:47:31'),(11,'efslob','cefs100105','<fieldset><field><name>VendorCompanyName</name><form_coords><top>35</top><left>122</left><width>285</width><height>41</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorStreetAddress</name><form_coords><top>89</top><left>122</left><width>71</width><height>17</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorCity </name><form_coords><top>91</top><left>220</left><width>80</width><height>18</height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/3_1_2.xml','2','2015-11-12 15:48:09'),(12,'efslob','cefs100105','<fieldset><field><name>VendorCompanyName</name><form_coords><top>35</top><left>119</left><width>290</width><height>42</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorStreetAddress</name><form_coords><top>88</top><left>124</left><width>67</width><height>21</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorCity </name><form_coords><top>93</top><left>219</left><width>90</width><height>16</height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorState </name><form_coords><top>106</top><left>296</left><width>71</width><height>17</height></form_coords><field_data>VendorState _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/3_1_2.xml','2','2015-11-13 11:00:14'),(13,'efslob','cefs100105','<fieldset><field><name>VendorCompanyName</name><form_coords><top>35</top><left>119</left><width>290</width><height>42</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorStreetAddress</name><form_coords><top>88</top><left>124</left><width>67</width><height>21</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorCity </name><form_coords><top>93</top><left>219</left><width>90</width><height>16</height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorState </name><form_coords><top>106</top><left>296</left><width>71</width><height>17</height></form_coords><field_data>VendorState _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/3_1_2.xml','2','2015-11-13 11:02:55'),(14,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>15</top><left>47</left><width>156</width><height>36</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceNumber</name><form_coords><top>110</top><left>407</left><width>99</width><height>19</height></form_coords><field_data>InvoiceNumber_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceDate</name><form_coords><top>153</top><left>408</left><width>83</width><height>25</height></form_coords><field_data>InvoiceDate_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Item</name><form_coords><top>393</top><left>256</left><width>79</width><height>19</height></form_coords><field_data>Item_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Rate</name><form_coords><top>394</top><left>369</left><width>70</width><height>18</height></form_coords><field_data>Rate_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Quantity</name><form_coords><top>393</top><left>456</left><width>17</width><height>15</height></form_coords><field_data>Quantity_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Total</name><form_coords><top>391</top><left>600</left><width>84</width><height>26</height></form_coords><field_data>Total_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-13 11:42:03'),(15,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>15</top><left>47</left><width>156</width><height>36</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceNumber</name><form_coords><top>110</top><left>407</left><width>99</width><height>19</height></form_coords><field_data>InvoiceNumber_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceDate</name><form_coords><top>153</top><left>408</left><width>83</width><height>25</height></form_coords><field_data>InvoiceDate_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Item</name><form_coords><top>393</top><left>256</left><width>79</width><height>19</height></form_coords><field_data>Item_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Rate</name><form_coords><top>394</top><left>369</left><width>70</width><height>18</height></form_coords><field_data>Rate_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Quantity</name><form_coords><top>393</top><left>456</left><width>17</width><height>15</height></form_coords><field_data>Quantity_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Total</name><form_coords><top>391</top><left>600</left><width>84</width><height>26</height></form_coords><field_data>Total_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2015-11-13 11:52:13'),(16,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>25</top><left>53</left><width>203</width><height>21</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorStreetAddress</name><form_coords><top>44</top><left>56</left><width>141</width><height>17</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorCity </name><form_coords><top>57</top><left>57</left><width>66</width><height>16</height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorZip </name><form_coords><top>57</top><left>123</left><width>41</width><height>17</height></form_coords><field_data>VendorZip _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorPhone </name><form_coords><top>73</top><left>79</left><width>59</width><height>15</height></form_coords><field_data>VendorPhone _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorEmail </name><form_coords><top>88</top><left>84</left><width>57</width><height>17</height></form_coords><field_data>VendorEmail _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceNumber</name><form_coords><top>90</top><left>346</left><width>75</width><height>17</height></form_coords><field_data>InvoiceNumber_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>InvoiceDate</name><form_coords><top>90</top><left>436</left><width>89</width><height>13</height></form_coords><field_data>InvoiceDate_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>PONumber</name><form_coords><top>238</top><left>145</left><width>76</width><height>16</height></form_coords><field_data>PONumber_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Item</name><form_coords><top>346</top><left>23</left><width>75</width><height>17</height></form_coords><field_data>Item_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Description</name><form_coords><top>346</top><left>111</left><width>213</width><height>51</height></form_coords><field_data>Description_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Quantity</name><form_coords><top>346</top><left>379</left><width>25</width><height>21</height></form_coords><field_data>Quantity_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Rate</name><form_coords><top>347</top><left>478</left><width>60</width><height>22</height></form_coords><field_data>Rate_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>LineTotal</name><form_coords><top>348</top><left>557</left><width>73</width><height>13</height></form_coords><field_data>LineTotal_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>Total</name><form_coords><top>644</top><left>566</left><width>58</width><height>20</height></form_coords><field_data>Total_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 12:09:30'),(17,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>192</top><left>1</left><width>681</width><height>285</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 15:44:26'),(18,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>192</top><left>1</left><width>681</width><height>285</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorState </name><form_coords><top>11</top><left>0</left><width>263</width><height>99</height></form_coords><field_data>VendorState _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 15:44:56'),(19,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>30</top><left>55</left><width>211</width><height>17</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 15:51:14'),(20,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>25</top><left>56</left><width>210</width><height>22</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 16:29:36'),(21,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>25</top><left>56</left><width>210</width><height>22</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorZip </name><form_coords><top>172</top><left>273</left><width>160</width><height>46</height></form_coords><field_data>VendorZip _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 16:30:57'),(22,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>25</top><left>56</left><width>210</width><height>22</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorZip </name><form_coords><top>172</top><left>273</left><width>160</width><height>46</height></form_coords><field_data>VendorZip _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 16:31:30'),(23,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top>21</top><left>42</left><width>224</width><height>28</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorZip </name><form_coords><top>25</top><left>48</left><width>228</width><height>36</height></form_coords><field_data>VendorZip _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 16:55:12'),(24,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top>21</top><left>42</left><width>224</width><height>28</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorZip </name><form_coords><top>25</top><left>48</left><width>228</width><height>36</height></form_coords><field_data>VendorZip _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 16:55:39'),(25,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top>10</top><left>49</left><width>218</width><height>50</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorState </name><form_coords><top>21</top><left>49</left><width>209</width><height>27</height></form_coords><field_data>VendorState _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 16:56:35'),(26,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top>10</top><left>49</left><width>218</width><height>50</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorState </name><form_coords><top>21</top><left>49</left><width>209</width><height>27</height></form_coords><field_data>VendorState _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 16:56:54'),(27,'efslob','cefs100101','<fieldset><field><name>VendorState </name><form_coords><top>21</top><left>46</left><width>240</width><height>32</height></form_coords><field_data>VendorState _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:05:22'),(28,'efslob','cefs100101','<fieldset><field><name>VendorState </name><form_coords><top>21</top><left>46</left><width>240</width><height>32</height></form_coords><field_data>VendorState _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorZip </name><form_coords><top>67</top><left>43</left><width>124</width><height>38</height></form_coords><field_data>VendorZip _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:05:44'),(29,'efslob','cefs100101','<fieldset><field><name>VendorCity </name><form_coords><top>23</top><left>50</left><width>209</width><height>25</height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:08:14'),(30,'efslob','cefs100101','<fieldset><field><name>VendorCity </name><form_coords><top>23</top><left>50</left><width>209</width><height>25</height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorCity </name><form_coords><top></top><left></left><width></width><height></height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:08:34'),(31,'efslob','cefs100101','<fieldset><field><name>VendorCity </name><form_coords><top>23</top><left>50</left><width>209</width><height>25</height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorCity </name><form_coords><top></top><left></left><width></width><height></height></form_coords><field_data>VendorCity _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>SupplierCompanyName</name><form_coords><top></top><left></left><width></width><height></height></form_coords><field_data>SupplierCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:08:42'),(32,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>16</top><left>10</left><width>258</width><height>66</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorZip </name><form_coords><top>84</top><left>328</left><width>319</width><height>31</height></form_coords><field_data>VendorZip _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:09:21'),(33,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top>13</top><left>43</left><width>246</width><height>38</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:11:01'),(34,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>25</top><left>54</left><width>211</width><height>25</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:13:46'),(35,'efslob','cefs100101','<fieldset><field><name>VendorCompanyName</name><form_coords><top>25</top><left>54</left><width>211</width><height>25</height></form_coords><field_data>VendorCompanyName_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorStreetAddress</name><form_coords><top>279</top><left>16</left><width>81</width><height>15</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:23:16'),(36,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top></top><left></left><width></width><height></height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field><field><name>VendorZip </name><form_coords><top>237</top><left>141</left><width>92</width><height>12</height></form_coords><field_data>VendorZip _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:29:21'),(37,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top>23</top><left>49</left><width>221</width><height>29</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:32:25'),(38,'efslob','cefs100101','<fieldset><field><name>VendorState </name><form_coords><top>24</top><left>52</left><width>211</width><height>25</height></form_coords><field_data>VendorState _DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:33:45'),(39,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top>15</top><left>61</left><width>223</width><height>45</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:35:19'),(40,'efslob','cefs100101','<fieldset><field><name>VendorStreetAddress</name><form_coords><top>15</top><left>61</left><width>223</width><height>45</height></form_coords><field_data>VendorStreetAddress_DATA</field_data><classify>yes</classify><split>no</split><merge>no</merge><reject>yes</reject></field></fieldset>','http://localhost:4141/images/ixsd/2_1_2.xml','2','2015-11-13 17:35:31');
/*!40000 ALTER TABLE `cindexclassifystencil` ENABLE KEYS */;
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
INSERT INTO `dupload_status_history` VALUES (2,1,4,4,'2015-11-14 15:19:07'),(218,1,0,1,'2015-11-14 15:20:50'),(219,1,0,1,'2015-11-14 15:20:50'),(220,1,0,1,'2015-11-14 15:20:50'),(221,1,0,1,'2015-11-14 15:20:51'),(222,1,0,1,'2015-11-14 15:22:00'),(223,1,0,1,'2015-11-14 15:22:01'),(224,1,0,1,'2015-11-14 15:22:02'),(225,1,0,1,'2015-11-14 15:22:03'),(2,1,4,4,'2015-11-14 15:26:40'),(2,1,4,4,'2015-11-14 15:30:39'),(2,1,4,4,'2015-11-14 15:33:49'),(2,1,5,5,'2015-11-14 15:43:33'),(2,1,6,6,'2015-11-14 15:46:04'),(226,1,0,1,'2015-11-14 16:11:37'),(227,1,0,1,'2015-11-14 16:11:37'),(228,1,0,1,'2015-11-14 16:11:37'),(229,1,0,1,'2015-11-14 16:11:37'),(1,1,2,2,'2015-11-14 16:29:04');
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
-- Dumping events for database 'hethi'
--

--
-- Dumping routines for database 'hethi'
--
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `assign_to_artist`(in customer_id int,
in artist_id int,in user_id char(6),in dUpload_id BIGINT)
BEGIN
UPDATE `hethi`.`dcustomer_upload`
SET
`dcustomer_upload`.`assigneddtm` = now(),
`dcustomer_upload`.`business_artist` = artist_id,
`dcustomer_upload`.`lastupuser` = customer_id
WHERE `dcustomer_upload`.`customer_id` = user_id and 
 `dcustomer_upload`.`upload_id`=dUpload_id;
UPDATE `hethi`.`dupload_status` SET `status`='1' WHERE `upload_id`=dUpload_id ;
select artist_id,customer_id;
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

DELETE FROM `hethi`.`cindexclassifystencil`;





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
'efslob',
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
  hethi.duser.*
From
  hethi.duser Inner Join
  hethi.dcustomer On hethi.duser.customer_id = hethi.dcustomer.customer_id
  Inner Join
  hethi.drole On hethi.duser.role_id = hethi.drole.role_id And
    hethi.duser.customer_id = hethi.drole.customer_id Inner Join
  hethi.roles On hethi.drole.role_id = hethi.roles.role_id
Where
  hethi.duser.user_login_id = username And
  hethi.duser.user_login_password = userpassword;
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `hethi_registration`(
in cust_name varchar(50),in cust_contact_name varchar(50),
in cust_business_name varchar(50),in cust_business_email varchar(100),
in cust_contact_number varchar(20),
in cust_login_id varchar(50),in cust_password varchar(50))
BEGIN
declare customer_id bigint(11);
declare user_id bigint(11);
declare addressid bigint(11);
set addressid=(select ifnull((select max(`dcustomercommn`.`addressid`) from `hethi`.`dcustomercommn`),0));
set addressid=addressid+1;
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
'',
'',
'',
addressid,
cust_business_email,
'',
'',
'',
'',
'',
now(),
1,
'',
'',
''
);

set customer_id=(select ifnull((select max(`dcustomer`.`customer_id`) from `hethi`.`dcustomer`),0));
set customer_id=customer_id+1;

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
cust_contact_name,
cust_contact_number,
customer_id,
cust_name
);
set user_id=(select ifnull((select max(`duser`.`user_id`) from `hethi`.`duser`),0));
set user_id=user_id+1;

INSERT INTO `hethi`.`duser`
(`customer_id`,
`lastupdtm`,
`user_address`,
`user_id`,
`user_login_id`,
`user_login_password`,
`user_name`)
VALUES
(
customer_id,
now(),
addressid,
user_id,
cust_login_id,
cust_password,
cust_name
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
(select role_id from roles where role_description='User'),
'Customer'
);
Select
  hethi.dcustomer.*,
  hethi.dcustomercommn.*,
  hethi.drole.role_name,
  hethi.drole.role_id,
  hethi.duser.user_id,
  hethi.roles.role_homepage 
From
  hethi.dcustomer Inner Join
  hethi.drole On hethi.dcustomer.customer_id = hethi.drole.customer_id
  Inner Join
  hethi.dcustomercommn On hethi.dcustomer.business_address =
    hethi.dcustomercommn.addressid Inner Join
  hethi.duser On hethi.dcustomer.customer_id = hethi.duser.customer_id 
inner join hethi.roles on hethi.roles.role_id=hethi.drole.role_id
Where
  hethi.duser.user_login_id = cust_login_id And
  hethi.duser.user_login_password = cust_password;
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
Where dcustomer_upload.business_artist Is Null;
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
hethi.dupload_status.status=1;
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
where `dassign_customer_serviceplay`.`customer_id`=user_id and `dassign_customer_serviceplay`.`sfs_uin`=varsfs_uin);
if(isExists=0)then
INSERT INTO `hethi`.`dassign_customer_serviceplay` 
(`customer_id`, `sfs_uin`, `efs_uin`, `lastupuser`, `lastupdtm`) 
VALUES (user_id, varsfs_uin, varefs_uin, customer_id, now());
else 
update `hethi`.`dassign_customer_serviceplay` set 
`dassign_customer_serviceplay`.`lastupdtm`=now(),
`dassign_customer_serviceplay`.`lastupuser`=customer_id
where `dassign_customer_serviceplay`.`customer_id`=user_id and 
`dassign_customer_serviceplay`.`sfs_uin`=varsfs_uin;
end if;
set i=i+1;
end while;

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
in upload_id bigint,in customer_id bigint,in efs_uin varchar(10),
in user bigint,in file_name varchar(300),in file_type varchar(20),
in file_size bigint,in file_path varchar(500))
BEGIN
declare file_id int(11);
if((SELECT max(`dupload_file`.`file_id`) FROM `hethi`.`dupload_file` WHERE `dupload_file`.`upload_id`=upload_id )!='') then
set file_id=(SELECT max(`dupload_file`.`file_id`) FROM `hethi`.`dupload_file` WHERE `dupload_file`.`upload_id`=upload_id );
set file_id=file_id+1; 
else
set file_id=1;
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
`upload_id`)
VALUES
(
efs_uin,
file_id,
file_path,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-14 17:06:17
