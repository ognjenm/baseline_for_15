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
INSERT INTO `hethi_offers` VALUES (5,'five five','1','2016-01-25 13:30:02'),(6,'NEW','1','2016-01-25 14:01:16'),(7,'dasds','1','2016-01-25 14:12:20'),(8,'network','1','2016-01-25 15:25:18'),(9,'program','1','2016-01-25 15:28:05'),(10,'qeqeet','1','2016-01-25 15:56:16'),(11,'company offer','1','2016-01-25 17:05:35'),(12,'android','1','2016-01-25 18:00:14'),(13,'new offer','1','2016-01-25 18:15:54'),(14,'special offer','1','2016-01-25 18:19:38'),(15,'hethi service','1','2016-01-25 18:26:09'),(16,'sagdyhtafsdh','1','2016-01-25 18:59:18'),(17,'ldfdslsdf','1','2016-01-27 09:59:07'),(18,'ehbejwhvje','1','2016-01-27 10:13:34'),(19,'offername','1','2016-01-27 10:15:04'),(20,'ne offer','1','2016-01-27 12:52:44'),(21,'bbbbbbbbb','1','2016-01-27 16:48:12'),(22,'sssssss','1','2016-01-27 16:51:04'),(23,'asasas','1','2016-01-27 16:52:46'),(24,'cxcxcc','1','2016-01-27 16:53:29'),(25,'ggggg','1','2016-01-27 17:03:18'),(26,'hhghgh','1','2016-01-27 17:06:59'),(27,'harish','1','2016-01-27 17:32:47'),(28,'null','1','2016-01-28 16:53:19'),(29,'null','1','2016-01-28 17:06:28'),(30,'null','1','2016-01-28 19:48:36'),(31,'null','1','2016-01-30 13:20:34'),(32,'null','1','2016-01-30 13:23:28'),(33,'null','1','2016-01-30 13:25:21'),(34,'null','1','2016-01-30 13:28:30'),(35,'null','1','2016-01-30 13:38:04'),(36,'null','1','2016-01-30 13:47:48'),(37,'new name','1','2016-01-30 13:51:46'),(38,'new name','1','2016-01-30 13:56:05'),(39,'new offer name','1','2016-01-30 13:58:35'),(40,'rtrt','1','2016-01-30 14:13:13'),(41,'xcxc','1','2016-01-30 16:33:06'),(42,'newoff','1','2016-02-01 12:56:48'),(43,'xc','1','2016-02-01 13:19:19'),(44,'six six','1','2016-02-01 14:12:25'),(45,'seven','1','2016-02-01 14:13:56'),(46,'seven','1','2016-02-01 14:13:57'),(47,'mnb','1','2016-02-01 14:14:45'),(48,'lk','1','2016-02-01 14:16:12'),(49,'dsd','1','2016-02-01 15:15:22'),(50,'xcvxcv','1','2016-02-01 17:00:01'),(51,'demo offer demo','1','2016-02-01 17:15:46'),(52,'on_board_package','1','2016-02-25 20:37:50');
/*!40000 ALTER TABLE `hethi_offers` ENABLE KEYS */;
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
  `form_stencid` char(10) DEFAULT NULL,
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
INSERT INTO `cform_lob` VALUES ('cf100101','PROP','FRM','PO-Inventory','HAA100010','HAA00001','Root','2015-10-15 00:00:00'),('cf100102','PROP','FRM','PO-Expense','HAA100011','HAA00001','Root','2015-10-15 00:00:00'),('cf100103','PROP','FRM','NPO','HAA100012','HAA00001','Root','2015-10-15 00:00:00'),('cf100104','PROP','FRM','NPO-Travel & Expenses','HAA000013','HAA00001','Root','2015-10-15 00:00:00'),('cf100105','PROP','FRM','NPO-Claim & Reimbursements','HAA000014','HAA00001','Root','2015-10-15 00:00:00'),('cf100106','PROP','FRM','NPO-Utility Bills','HAA000015','HAA00001','Root','2015-10-15 00:00:00'),('cf100107','PROP','FRM','NPO-Check Request','HAA000016','HAA00001','Root','2015-10-15 00:00:00'),('cf100108','PROP','FRM','Attachments','HAA000017','HAA00001','Root','2015-10-15 00:00:00'),('cf100109','IND','EDI','ANSI-810','HAA000018','HAA00001','Root','2015-10-15 00:00:00'),('cf100110','IND','FRM','HCFA/HICF-Single','HAA000019','HAA00001','Root','2015-10-15 11:03:33'),('cf100111','IND','FRM','HCFA/HICF-Multi','HAA000020','HAA00001','Root','2015-10-15 11:03:33'),('cf100112','IND','FRM','UB/UB04-Single','HAA000021','HAA00001','Root','2015-10-15 11:03:33'),('cf100113','IND','FRM','UB/UB04-Multi','HAA000022','HAA00001','Root','2015-10-15 11:03:33'),('cf100114','IND','FRM','Superbills-NonStandard Professional Bills','HAA000023','HAA00001','Root','2015-10-15 11:03:33'),('cf100115','IND','FRM','Superbills-NonStandard Facility Bills','HAA000024','HAA00001','Root','2015-10-15 11:03:33'),('cf100116','IND','FRM','DENTAL','HAA000025','HAA00001','Root','2015-10-15 11:03:33'),('cf100117','IND','FRM','VISION','HAA000026','HAA00001','Root','2015-10-15 00:00:00'),('cf100118','IND','FRM','EOMB','HAA000027','HAA00001','Root','2015-10-15 00:00:00'),('cf100119','IND','FRM','EOB','HAA000028','HAA00001','Root','2015-10-15 00:00:00'),('cf100120','IND','FRM','REP','HAA000029','HAA00001','Root','2015-10-15 00:00:00'),('cf100121','IND','FRM','RX','HAA000030','HAA00001','Root','2015-10-15 00:00:00'),('cf100122','IND','FRM','OI','HAA000031','HAA00001','Root','2015-10-15 00:00:00'),('cf100123','IND','FRM','Attachments','HAA000032','HAA00001','Root','2015-10-15 00:00:00'),('cf100124','IND','EDI','ANSI-837','HAA000033','HAA00001','Root','2015-10-15 00:00:00'),('cf100125','IND','EDI','ANSI-835','HAA000034','HAA00001','Root','2015-10-15 00:00:00');
/*!40000 ALTER TABLE `cform_lob` ENABLE KEYS */;
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
  `action_by_user` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`exception_code`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businessrules_exception`
--

LOCK TABLES `businessrules_exception` WRITE;
/*!40000 ALTER TABLE `businessrules_exception` DISABLE KEYS */;
INSERT INTO `businessrules_exception` VALUES ('EOO10','cefs100101','Vendor not match PO','We find a PO on image, find the PO on the PO database, obtain the vendor number from the PO, PO vendor number is ','oute to Buyer for Lawson PO',10,'1. Buyer should update the vendor information in Lawson.2.Validate.    3.  Route the invoice to the AP Analyst if necessary.                                                                    EP 1.  AP Analyst to research for correct vendor.     EP 2.  No vendor found, then forward for vendor setup.'),('EOO11','cefs100101','VENDOR ADDRESS MISMATCH ','We are able to find the vendor by name or vendor address, but the remit to address doesn\'t match. (We will get the vendor ID from the PO, but there could be a situation where the vendor ID is not active)','Route to AP Analyst ',11,'The AP Analyst will:1. Validate if the address needs to be changed.2. Adjust the remit to address accordingly in Lawson.3. Validate.EP 1.  AP Analyst will forward vendor address update for correction.     EP 2.  Validate once address correction is complete.'),('EOO11','cefs100103','VENDOR ADDRESS MISMATCH ','We are able to find the vendor by name or vendor address, but the remit to address doesn\'t match. (We will get the vendor ID from the PO, but there could be a situation where the vendor ID is not active)','Route to AP Analyst ',11,'The AP Analyst will:1. Validate if the address needs to be changed.2. Adjust the remit to address accordingly in Lawson.3. Validate.EP 1.  AP Analyst will forward vendor address update for correction.     EP 2.  Validate once address correction is complete.'),('EOO12','cefs100101','FUTURE INVOICE DATE','If an invoice has a future date of more than 90 days','Route to AP Analyst ',12,'1. AP Analyst goes back to the vendor for a correct invoice date  and removes from workflow.'),('EOO12','cefs100103','FUTURE INVOICE DATE','If an invoice has a future date of more than 90 days','Route to AP Analyst ',12,'1. AP Analyst goes back to the vendor for a correct invoice date  and removes from workflow.'),('EOO13','cefs100101','INVOICE DATE INVALID','If an invoice has an invalid date format such as 13/31/13','Route to AP Analyst ',13,'1. AP Analyst should be able to correct the date.2. AP Analyst goes back to the vendor for a correct invoice date  and removes from workflow.      '),('EOO13','cefs100103','INVOICE DATE INVALID','If an invoice has an invalid date format such as 13/31/13','Route to AP Analyst ',13,'1. AP Analyst should be able to correct the date.2. AP Analyst goes back to the vendor for a correct invoice date  and removes from workflow.      '),('EOO14','cefs100101','DUPLICATE INVOICE','If the following fields match the Invoice History file, flag as a DUPLICATE INVOICE and send to documentDNA:','Route to Storage Repository',14,''),('EOO14','cefs100103','DUPLICATE INVOICE','If the following fields match the Invoice History file, flag as a DUPLICATE INVOICE and send to documentDNA:','Route to Storage Repository',14,''),('EOO15','cefs100101','SUSPECT DUPLICATE','If a document matches a previous DUID based on all 4 fields; Vendor # + Invoice # + Invoice Date + Invoice Amount, then this DUID will be flagged with the exception of ','Route to AP Analyst ',15,NULL),('EOO15','cefs100103','SUSPECT DUPLICATE','If a document matches a previous DUID based on all 4 fields; Vendor # + Invoice # + Invoice Date + Invoice Amount, then this DUID will be flagged with the exception of ','Route to AP Analyst ',15,NULL),('EOO16','cefs100101','PO LINE MISMATCH','PO on the invoice was found in the PO file, but there are items on the invoice that don\'t exist in the PO. This is a line item level exception.','Route to Buyer for ERP PO',16,NULL),('EOO17','cefs100101','ITEM NUM MISMATCH','If any Item number on PO does not match item numbers on invoices','Route to Buyer for ERP PO',17,NULL),('EOO18','cefs100101','ITEM NOT RECEIVED','If the order is not received.  (Utilize the PO File to determine)  ','Route to Buyer for ERP PO',18,NULL),('EOO19','cefs100101','PRICE DISCREPANCY/  TOLERANCE','If Pricing is +/- the 5% variance or +/- $10.00','Route to Buyer for ERP PO',19,NULL),('EOO20','cefs100101','QTY DISCREPANCY/  TOLERANCE','Raise this exception if  the Qty is greater than the quantity on the PO line. *Only for Received QTY*','Route to Buyer for ERP PO',20,NULL),('EOO21','cefs100101','CANCELED LINES ON PO','Line was captured off of the invoice image that matches a record from the PO master that as a status = C. (Canceled PO Line)','Route to Buyer for ERP PO',21,NULL),('EOO22','cefs100101','FREIGHT, SURCHARGE TAX ILLEGIBLE','If Freight, Surcharge or Tax is Illegible','Route to AP Analyst',22,'1. AP Analyst workes with vendor to send a new invoice and  removes original from workflow. or 2. AP Analyst can override the freight and approve.  '),('EOO22','cefs100103','FREIGHT, SURCHARGE TAX ILLEGIBLE','If Freight, Surcharge or Tax is Illegible','Route to AP Analyst',22,'1. AP Analyst workes with vendor to send a new invoice and  removes original from workflow. or 2. AP Analyst can override the freight and approve.  '),('EOO23','cefs100101','TERMS CANNOT BE DETERMINED/ TERMS MISMATCH','If Terms cannot be determined, default to 30 days from Invoice Date. ','Route to AP Analyst',23,NULL),('EOO23','cefs100103','TERMS CANNOT BE DETERMINED/ TERMS MISMATCH','If Terms cannot be determined, default to 30 days from Invoice Date. ','Route to AP Analyst',NULL,NULL),('EOO24','cefs100101','INV CURR NOT MATCH PO CURR','ONLY invoices with currency other than USD  need to be assigned to this exception.','Route to AP Analyst ',24,NULL),('EOOO1','cefs100101','No Exception',' Route to Lawson and Storage Repository','Route to Lawson and Storage Repository',1,'No action is needed.'),('EOOO1','cefs100103','No Exception','Route to WF andStorage Repository','Route to Reviewer Approver',1,' Needs to be coded and approved.'),('EOOO3','cefs100101','IMAGE ILLEGABLE','\"If  any of the following mandatory fields are not readable from the invoice image:\nFREIGHT/TAX/SURCHG ILLEGIBLE\nInv Number\nPO Number\nInv Amount\nInv Date\"','Route to AP Analyst ',3,NULL),('EOOO3','cefs100103','IMAGE ILLEGABLE','\"If  any of the following mandatory fields are not readable from the invoice image:\nFREIGHT/TAX/SURCHG ILLEGIBLE\nInv Number\nPO Number\nInv Amount\nInv Date\"','Route to AP Analyst ',3,NULL),('EOOO4','cefs100101','INVOICE TOTAL=0','Invoice comes in with $0, do not send to WF.  ','Route to Storage Repository',4,NULL),('EOOO4','cefs100103','INVOICE TOTAL=0','Invoice comes in with $0, do not send to WF.  ','Route to Storage Repository',4,NULL),('EOOO5','cefs100101','MISSING INFORMATION','If  any of the following mandatory fields are missing information from the invoice image:','Route to AP Analyst ',5,'Follow the same logic and routing as \"Image Illegible\"'),('EOOO5','cefs100103','MISSING INFORMATION','If  any of the following mandatory fields are missing information from the invoice image: Account # for Utility, Tax and Telecom Vendors','Route to AP Analyst ',5,'Follow the same logic and routing as \"Image Illegible\"'),('EOOO6','cefs100103','NO COST CENTER','The vendor is responsible to put the cost center on their invoices.  This exception reason applies for NPO invoices with no cost center.Also, if the Cost Center is keyed, and it is invalid, also use this Exception Reason.','Route to AP Analyst',6,'AP Analyst will identify the cost center, GL Code and route accordingly. The next phase will be data capture would reject the invoice reject it back to the vendor or use the vendor portal dispute management functionality if the vendor is enrolled in the Vendor Portal.'),('EOOO7','cefs100101','PO INVALID','Cases for assigning this exception: 1. PO # available on the image of the invoice but does match the Customer Format.2. PO number available on the image of the invoice but not does match the PO master file.','Route to AP Analyst',7,'1. Find the correct PO via the PO lookup in WF.2. If correct PO cannot be found in the lookup tables, they need to find the correct the PO in Lawson or work with the vendor to determine who placed the order.  Then route the invoice to that buyer.3. Validate. EP 1.  AP Analyst will work with vendor to determine correct PO.'),('EOOO8','cefs100101','MULTIPLE PO\'s INVOICE','If you get a PO Match on any of the PO\'s, do not raise the exception.  Proceed with the matching process.Key one PO# (handwritten then printed then stamped priority) and raise the exception.  ','Route to AP Analyst',8,'1. Try to match either PO.2.  If no match, then determine which PO is correct and then route to buyer.   '),('EOOO9','cefs100103','VENDOR NOT FOUND','(Only expected for Non-PO) Vendor cannot be found in vendor master file based on the vendor lookup logic.','Route to AP Analyst',9,'1.  AP analyst to research for correct vendor.   2.  No vendor found, then forward for vendor setup.  ');
/*!40000 ALTER TABLE `businessrules_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1_invoicehistory_lookup`
--

DROP TABLE IF EXISTS `1_invoicehistory_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1_invoicehistory_lookup` (
  `vendor_id` varchar(15) NOT NULL,
  `vendor_name` varchar(30) NOT NULL,
  `invoice_number` varchar(30) NOT NULL,
  `invoice_date` varchar(20) NOT NULL,
  `invoice_amount` decimal(10,0) NOT NULL,
  PRIMARY KEY (`vendor_id`,`vendor_name`,`invoice_number`,`invoice_date`,`invoice_amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1_invoicehistory_lookup`
--

LOCK TABLES `1_invoicehistory_lookup` WRITE;
/*!40000 ALTER TABLE `1_invoicehistory_lookup` DISABLE KEYS */;
INSERT INTO `1_invoicehistory_lookup` VALUES ('29','ABBOTT LABORATORIES','118039913','23-SEP-13',1850),('29','ABBOTT LABORATORIES','118079283','30-SEP-13',300),('29','ABBOTT LABORATORIES','118080239','30-SEP-13',1700),('29','ABBOTT LABORATORIES','118088725','01-OCT-13',1000),('29','ABBOTT LABORATORIES','118093497','02-OCT-13',1000),('29','ABBOTT LABORATORIES','118095046','02-OCT-13',245),('29','ABBOTT LABORATORIES','118096353','02-OCT-13',2300),('29','ABBOTT LABORATORIES','118107913','04-OCT-13',240);
/*!40000 ALTER TABLE `1_invoicehistory_lookup` ENABLE KEYS */;
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
  KEY `R_18` (`Customer_Id`)
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
INSERT INTO `dassign_customer_serviceplay` VALUES (1,'csfs10000','cefs100101','1','2016-03-03 17:59:21'),(1,'csfs100101','cefs100101','1','2016-03-03 17:59:21'),(1,'csfs100102','cefs100101','1','2016-03-03 17:59:21'),(1,'csfs100120','cefs100101','1','2016-03-03 17:59:21');
/*!40000 ALTER TABLE `dassign_customer_serviceplay` ENABLE KEYS */;
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
INSERT INTO `rule_operators` VALUES (1,'=','Boolean','0'),(1,'==','Date','0'),(1,'+','Decimal','0'),(1,'in','Integer','1'),(1,'VendorMaster','Look Up','5'),(1,'toUpper','String','1'),(2,'<>','Boolean','0'),(2,'<','Date','0'),(2,'-','Decimal','0'),(2,'absVal','Integer','1'),(2,'LawsonPO','Look Up','5'),(2,'toLower','String','1'),(3,'&&','Boolean','0'),(3,'>','Date','0'),(3,'*','Decimal','0'),(3,'toDecimal','Integer','0'),(3,'GL','Look Up','5'),(3,'contains(paramString','String','2'),(4,'||','Boolean','0'),(4,'<>','Date','0'),(4,'/','Decimal','0'),(4,'toString','Integer','1'),(4,'Employee','Look Up','5'),(4,'charsIn(validSet)','String','2'),(5,'~','Boolean','0'),(5,'>=','Date','0'),(5,'=','Decimal','0'),(5,'=','Integer','0'),(5,'ApprovalGrid','Look Up','5'),(5,'equals','String','2'),(6,'<=','Date','0'),(6,'<>','Decimal','0'),(6,'<>','Integer','0'),(6,'InvoiceHistory','Look Up','5'),(6,'=','String','0'),(7,'in','Date','0'),(7,'<','Decimal','0'),(7,'<','Integer','0'),(7,'<>','String','0'),(8,'getYear','Date','1'),(8,'<=','Decimal','0'),(8,'<=','Integer','0'),(8,'<','String','0'),(9,'getMonth','Date','1'),(9,'>','Decimal','0'),(9,'>','Integer','0'),(9,'<=','String','0'),(10,'getDate','Date','1'),(10,'>=','Decimal','0'),(10,'>=','Integer','0'),(10,'>','String','0'),(11,'addYears','Date','2'),(11,'**','Decimal','0'),(11,'+','Integer','0'),(11,'>=','String','0'),(12,'addMonths','Date','2'),(12,'+=','Decimal','0'),(12,'-','Integer','0'),(12,'+','String','0'),(13,'addDays','Date','2'),(13,'-=','Decimal','0'),(13,'*','Integer','0'),(13,'in','String','1'),(14,'yearsBetween','Date','2'),(14,'in','Decimal','0'),(14,'/','Integer','0'),(14,'size','String','1'),(15,'monthsBetween','Date','2'),(15,'absVal','Decimal','1'),(15,'+=','Integer','0'),(15,'concat','String','2'),(16,'daysBetween','Date','2'),(16,'round','Decimal','1'),(16,'-=','Integer','0'),(16,'toDecimal','String','1'),(17,'dayOfWeek','Date','1'),(17,'floor','Decimal','1'),(17,'max','Integer','2'),(17,'toDateTime','String','1'),(18,'weekOfYear','Date','1'),(18,'round(parm)','Decimal','2'),(18,'min','Integer','2'),(18,'toInteger','String','1'),(19,'dayOfYear','Date','1'),(19,'toIntger','Decimal','1'),(19,'div','Integer','2'),(19,'substring','String','3'),(20,'weekOfMonth','Date','1'),(20,'toString','Decimal','1'),(20,'mod','Integer','2'),(20,'indexOf','String','2'),(21,'toDateTime','Date','1'),(21,'max','Decimal','2'),(21,'log','Integer','1'),(21,'equalsIgnoreCase','String','2'),(22,'toDateTime','Date','2'),(22,'min','Decimal','2'),(22,'log(logBase)','Integer','2'),(22,'startsWith','String','2'),(23,'toString','Date','2'),(23,'log','Decimal','1'),(23,'In','Integer','1'),(23,'endsWith','String','2'),(24,'nextDay','Date','1'),(24,'log(logBase)','Decimal','2'),(24,'isProbabePrime','Integer','2'),(24,'containsBlanks','String','2'),(25,'getMilliseconds','Date','1'),(25,'In','Decimal','1'),(25,'gcd','Integer','2'),(25,'characterAt','String','2'),(26,'truncate','Decimal','1'),(26,'negate','Integer','1'),(26,'isInteger','String','1'),(27,'fraction','Decimal','1'),(27,'trimSpaces','String','1'),(28,'movePoint','Decimal','2'),(28,'charsIn','String','2');
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
INSERT INTO `dupload_status` VALUES (1,1,2,1,'2016-03-03 17:59:21'),(2,1,2,1,'2016-03-03 17:59:21'),(4,1,2,1,'2016-03-03 17:59:21'),(5,1,2,1,'2016-03-03 17:59:21'),(6,1,2,1,'2016-03-03 17:59:21'),(7,1,2,1,'2016-03-03 17:59:21'),(8,1,2,1,'2016-03-03 17:59:21'),(9,1,2,1,'2016-03-03 17:59:21'),(10,1,2,1,'2016-03-03 17:59:21');
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
INSERT INTO `cformowner` VALUES ('HAA00001','HETHI','cm1001','info@heth.com','Root','2015-10-30 15:28:00'),('HAA10002','Pearson','cm1002','info@pearson.com','7','2016-03-04 15:57:23');
/*!40000 ALTER TABLE `cformowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1_employee_lookup`
--

DROP TABLE IF EXISTS `1_employee_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1_employee_lookup` (
  `User_Name` varchar(30) DEFAULT NULL,
  `Employee_ID` int(10) DEFAULT NULL,
  `Cost_center` varchar(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `First_name` varchar(30) DEFAULT NULL,
  `Last_name` varchar(30) DEFAULT NULL,
  `Job_Title` varchar(30) DEFAULT NULL,
  `Contact_Phone` varchar(15) DEFAULT NULL,
  `Manager_First` varchar(30) DEFAULT NULL,
  `Manager_Last` varchar(30) DEFAULT NULL,
  `Mgr_user_ID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1_employee_lookup`
--

LOCK TABLES `1_employee_lookup` WRITE;
/*!40000 ALTER TABLE `1_employee_lookup` DISABLE KEYS */;
INSERT INTO `1_employee_lookup` VALUES ('BurkeMa',9,'100106','Maureen.Burke@Customer.org','MAUREEN','BURKE','DIR RISK MGMT','703-645-2799','JOHN','GAUL','GaulJo'),('MerriKa',28,'100378','Kathy.Merrill@Customer.org','KATHLEEN','MERRILL','SECURITY ANALYST LEAD','(000) 000-0000','JAMES','WHITE','WhiteJam'),('HoffpGl',30,'100909','Gigi.Hoffpauir@Customer.org','GLORIA','HOFFPAUIR','SYS ANALYST LD EPIC CERT','(000) 000-0000','BARBARA','STRUPEK','StrupBa'),('TrieuKi',31,'100286','Kim.Trieu@Customer.org','KIM','TRIEU','PAYROLL REPRESENTATIVE II','(703) 208-5922','MAUREEN','NUGENT','NugenMa'),('TroelDe',36,'100194','Debra.Troell@Customer.org','DEBRA','TROELL','MULTIMEDIA SPECIALIST','703-289-8726','ELIZABETH','VISIOLI','VisioEl'),('HarveMi',37,'540442','Michelle.Harvey@Customer.org','MICHELLE','HARVEY','SCHED REG REP 1','7038451500','CAROL','JONES','JONECA'),('HammeJo',40,'110689','John.Hammer@Customer.org','JOHN','HAMMER','REGISTERED NURSE 3','703 776-7380','SHARRI','ROBINSON','RobinSha'),('SanchMi',41,'130524','Miguel.Sanchez@Customer.org','MIGUEL','SANCHEZ','RESOURCE COORDINATOR','703-391-3093','WILLIAM','KEY','KeyWi'),('KerbyJu',48,'100106','Judy.Kerby@Customer.org','JUDITH','KERBY','RISK MANAGER','(703) 645-2889','MAUREEN','BURKE','BurkeMa');
/*!40000 ALTER TABLE `1_employee_lookup` ENABLE KEYS */;
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
  `upload_source` varchar(45) DEFAULT 'WEB',
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload`
--

LOCK TABLES `dupload` WRITE;
/*!40000 ALTER TABLE `dupload` DISABLE KEYS */;
INSERT INTO `dupload` VALUES (1,'new1456911157653.jpg','jpg','2016-03-02 12:32:37','2016-03-02 12:32:37','296463',0,'WEB'),(2,'new1456913956706.jpg','jpg','2016-03-02 13:19:16','2016-03-02 13:19:16','296463',0,'WEB'),(3,'CAF1457007370475.pdf','pdf','2016-03-03 15:16:10','2016-03-03 15:16:10','937641',0,'WEB'),(4,'CAF1457007513462.pdf','pdf','2016-03-03 15:18:33','2016-03-03 15:18:33','937641',0,'WEB'),(5,'saif_qrcode1457008882157.png','png','2016-03-03 15:41:22','2016-03-03 15:41:22','7178',0,'WEB'),(6,'saif_qrcode1457009353490.pdf','pdf','2016-03-03 15:49:13','2016-03-03 15:49:13','7340',0,'WEB'),(7,'TortoiseSVN-1.9.3.27038-x64-svn-1.9.31457009473546.msi','msi','2016-03-03 15:51:13','2016-03-03 15:51:13','18800640',0,'WEB'),(8,'EDI1457009504558.jar','jar','2016-03-03 15:51:44','2016-03-03 15:51:44','14452399',0,'WEB'),(9,'ipmsg1457011622037.exe','exe','2016-03-03 16:27:02','2016-03-03 16:27:02','159744',0,'WEB'),(10,'new1457017117918.jpg','jpg','2016-03-03 17:58:37','2016-03-03 17:58:37','296463',0,'WEB');
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
-- Table structure for table `rules_repository`
--

DROP TABLE IF EXISTS `rules_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_repository` (
  `repository_no` int(11) NOT NULL,
  `efs_uin` char(10) NOT NULL,
  `rule_uin` char(10) NOT NULL COMMENT 'ciconnector_rules.rule_uin',
  `rule_name` varchar(45) DEFAULT NULL,
  `rule_condition` longtext NOT NULL,
  `rule_action` varchar(500) DEFAULT NULL,
  `rule_failure` varchar(500) DEFAULT NULL,
  `rule_comments` varchar(100) DEFAULT NULL COMMENT 'SOP, CUST etc',
  `rule_status` tinyint(1) DEFAULT NULL,
  `rule_order` int(11) DEFAULT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `effective_startdate` date DEFAULT NULL,
  `effective_enddate` date DEFAULT NULL,
  `rule_type` varchar(15) DEFAULT NULL,
  `rule_category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`repository_no`,`rule_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules_repository`
--

LOCK TABLES `rules_repository` WRITE;
/*!40000 ALTER TABLE `rules_repository` DISABLE KEYS */;
INSERT INTO `rules_repository` VALUES (1,'cefs100101','rule1013','zero invoice amount rule','ip:iPost() and form:ixsd_cefs100101(invoice_amount.equals(100))','form.setQueue(\"Route to Storage Repository\");','form.setQueue(\"Route to Storage Repository\");','check invoice amount to zero',1,13,'1','2016-03-04 17:10:26','2018-01-28','2024-09-04','header',NULL),(2,'cefs100101','rule1018','Field Missing Rule','ip:iPost() and form:ixsd_cefs100101(invoice_amount.equals(\"null\") , invoice_date .equals(\"null\") , invoice_number.equals(\"null\") , po_number.equals(\"null\"))','ip.setNext_channel(\"exit_channel\");','ip.setNext_channel(\"exit_channel\");','If any of the following rule is missing , this rue will fire',1,15,'1','2016-03-04 17:19:57','2015-11-30','2017-02-22','header',NULL),(3,'cefs100101','rule1019','Image illegible','ip:iPost() and form:ixsd_cefs100101(frieght_term.equals(\"#\") , invoice_amount.equals(\"#\") , invoice_date.equals(\"#\") , invoice_number.equals(\"#\") , po_number.equals(\"#\"))','ip.setNext_channel(\"exit_channel\");','ip.setNext_channel(\"exit_channel\");','following fields could not read from po image',1,16,'1','2016-03-04 17:20:03','2015-12-08','2016-07-23','header',NULL),(4,'cefs100101','rule1020','Invalid invoice date','ip:iPost() and form:ixsd_cefs100101(invoice_date.getMonth() >12)','ip.setNext_channel(\"exit_channel\");','ip.setNext_channel(\"exit_channel\");','invoice date is invalid',1,17,'1','2016-03-04 17:20:11','2015-12-15','2016-07-27','header',NULL),(5,'cefs100101','rule1021','FREIGHT, SURCHARGE TAX ILLEGIBLE','ip:iPost() and form:ixsd_cefs100101(frieght_term.equals(\"#\"))','ip.setNext_channel(\"exit_channel\");','ip.setNext_channel(\"exit_channel\");','FREIGHT, SURCHARGE TAX ILLEGIBLE',1,18,'1','2016-03-04 17:20:17','2015-12-07','2016-05-14','header',NULL);
/*!40000 ALTER TABLE `rules_repository` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `cflob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cmicro_process`
--

DROP TABLE IF EXISTS `cmicro_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmicro_process` (
  `micro_process_id` int(8) NOT NULL DEFAULT '0',
  `sfs_UIN` varchar(10) NOT NULL,
  `sub_index` varchar(10) NOT NULL,
  `micro_process_name` varchar(50) DEFAULT NULL,
  `lastupuser` varchar(25) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`sfs_UIN`,`micro_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmicro_process`
--

LOCK TABLES `cmicro_process` WRITE;
/*!40000 ALTER TABLE `cmicro_process` DISABLE KEYS */;
INSERT INTO `cmicro_process` VALUES (100,'csfs100101','1','Incoming channel','1','2016-02-18 17:05:50'),(101,'csfs100101','2','File Extraction','1','2016-02-18 17:05:50'),(102,'csfs100101','3','Inventory Creation ','1','2016-02-18 17:05:50'),(103,'csfs100101','4','Prebatch creation','1','2016-02-18 17:05:50'),(104,'csfs100101','5','Acknowledgement','1','2016-02-18 17:05:50'),(200,'csfs100102','1','Check Daas Eligibility','1','2016-02-18 17:05:50'),(201,'csfs100102','2','Execute_Full_OCR','1','2016-02-18 17:05:50'),(300,'csfs100103','1','extract to classify','1','2016-02-18 17:05:50'),(301,'csfs100103','2','Apply_Classification_Logic','1','2016-02-18 17:05:50'),(400,'csfs100104','1','define to splitclassify Index ','1','2016-02-18 17:05:50'),(401,'csfs100104','2','define classify Index to merge','1','2016-02-18 17:05:50'),(402,'csfs100104','3','define classify Index to reject','1','2016-02-18 17:05:50'),(403,'csfs100104','4','Pull Index Field List based on Classification ','1','2016-02-18 17:05:50'),(404,'csfs100104','5','extract  Index Data','1','2016-02-18 17:05:50'),(500,'csfs100105','1','Apply_Split_Merge','1','2016-02-18 17:05:50'),(501,'csfs100105','2','Identify formtype bundle','1','2016-02-18 17:05:50'),(502,'csfs100105','3','Generate_DIN','1','2016-02-18 17:05:50'),(503,'csfs100105','4','Annotate image with DIN','1','2016-02-18 17:05:50'),(600,'csfs100106','1','Identify Stencil','1','2016-02-18 17:05:50'),(601,'csfs100106','2','Apply Stencil','1','2016-02-18 17:05:50'),(602,'csfs100106','3','Generate MXML','1','2016-02-18 17:05:50'),(603,'csfs100106','4','Store MXML','1','2016-02-18 17:05:50'),(700,'csfs100107','1','segregate rejects','1','2016-02-18 17:05:50'),(701,'csfs100107','2','Duplicate check','1','2016-02-18 17:05:50'),(702,'csfs100107','3','Generate Batch','1','2016-02-18 17:05:50'),(800,'csfs100108','1','Data Entry','1','2016-02-18 17:05:50'),(801,'csfs100108','2','Validate','1','2016-02-18 17:05:50'),(802,'csfs100108','3','Generate MXML','1','2016-02-18 17:05:50'),(803,'csfs100108','4','Store MXML','1','2016-02-18 17:05:50'),(900,'csfs100109','1','Store_IXSD','1','2016-02-18 17:05:50'),(901,'csfs100109','2','Validate_IXSD','1','2016-02-18 17:05:50'),(902,'csfs100109','3','Route_BaaS','1','2016-02-18 17:05:50');
/*!40000 ALTER TABLE `cmicro_process` ENABLE KEYS */;
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
  `stencil_id` char(10) DEFAULT '0',
  PRIMARY KEY (`upload_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload_file`
--

LOCK TABLES `dupload_file` WRITE;
/*!40000 ALTER TABLE `dupload_file` DISABLE KEYS */;
INSERT INTO `dupload_file` VALUES (1,1,'new1456911157653.jpg','jpg','http://localhost:2687/images/uploads/new1456911157653.jpg',296463,3,'cefs100101',3,'2016-03-02 12:32:42','HAA100100'),(2,1,'new1456913956706.jpg','jpg','http://localhost:2687/images/uploads/new1456913956706.jpg',296463,3,'cefs100101',3,'2016-03-02 13:19:34','HAA100099'),(4,1,'CAF1457007513462.pdf','pdf','http://localhost:4141/images/uploads/CAF1457007513462.jpg',937641,3,'cefs100101',3,'2016-03-03 15:18:35','HAA100099'),(5,1,'saif_qrcode1457008882157.png','png','http://localhost:4141/images/uploads/saif_qrcode1457008882157.png',7178,3,'cefs100101',3,'2016-03-03 15:41:23','HAA100099'),(6,1,'saif_qrcode1457009353490.pdf','pdf','http://localhost:4141/images/uploads/saif_qrcode1457009353490.jpg',7340,3,'cefs100101',3,'2016-03-03 15:49:13','HAA100099'),(7,1,'TortoiseSVN-1.9.3.27038-x64-svn-1.9.31457009473546.msi','msi','http://localhost:4141/images/uploads/TortoiseSVN-1.9.3.27038-x64-svn-1.9.31457009473546.msi',18800640,3,'cefs100101',3,'2016-03-03 15:51:13','HAA100099'),(8,1,'EDI1457009504558.jar','jar','http://localhost:4141/images/uploads/EDI1457009504558.jar',14452399,3,'cefs100101',3,'2016-03-03 15:51:44','HAA100099'),(9,1,'ipmsg1457011622037.exe','exe','http://localhost:4141/images/uploads/ipmsg1457011622037.exe',159744,3,'cefs100101',3,'2016-03-03 16:27:02','HAA100099'),(10,1,'new1457017117918.jpg','jpg','http://localhost:2687/images/uploads/new1457017117918.jpg',296463,3,'cefs100101',3,'2016-03-03 17:58:42','HAA100101');
/*!40000 ALTER TABLE `dupload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dmenu_role_connect`
--

DROP TABLE IF EXISTS `dmenu_role_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dmenu_role_connect` (
  `customer_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmenu_role_connect`
--

LOCK TABLES `dmenu_role_connect` WRITE;
/*!40000 ALTER TABLE `dmenu_role_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `dmenu_role_connect` ENABLE KEYS */;
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
  `role_homepage` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drole`
--

LOCK TABLES `drole` WRITE;
/*!40000 ALTER TABLE `drole` DISABLE KEYS */;
INSERT INTO `drole` VALUES (1,1,'Business Admin','2016-01-29 10:06:08','pages/hethi/home_page.html'),(1,2,'Business Artist','2015-10-16 11:10:10','pages/hethi/home_page.html'),(1,3,'Business Customer','2015-10-16 11:10:10','pages/hethi/home_page.html'),(1,4,'Manager','2015-10-16 11:10:10','pages/hethi/home_page.html'),(1,5,'Supervisor','2015-10-16 11:10:10','pages/hethi/home_page.html'),(1,6,'Operator','2015-10-16 11:10:10','pages/hethi/home_page.html'),(1,9,'Operations Partner','2015-10-16 11:10:10','pages/hethi/home_page.html'),(1,10,'Platform Partner','2015-10-16 11:10:10','pages/hethi/home_page.html'),(2,3,'Business Partner','2016-02-01 09:25:16','pages/hethi/home_page.html');
/*!40000 ALTER TABLE `drole` ENABLE KEYS */;
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
-- Table structure for table `dupload_log`
--

DROP TABLE IF EXISTS `dupload_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupload_log` (
  `customer_id` bigint(20) NOT NULL,
  `upload_id` bigint(20) NOT NULL COMMENT 'auto increment\\n',
  `file_id` bigint(20) NOT NULL COMMENT 'file id\\n',
  `micro_process_id` bigint(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `lastupuser` int(11) NOT NULL COMMENT 'user ID audit trail\\\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  PRIMARY KEY (`upload_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload_log`
--

LOCK TABLES `dupload_log` WRITE;
/*!40000 ALTER TABLE `dupload_log` DISABLE KEYS */;
INSERT INTO `dupload_log` VALUES (1,0,0,104,1,1,'2016-02-27 11:17:28'),(1,1,0,103,3,1,'2016-03-02 12:32:42'),(1,1,1,103,3,1,'2016-03-02 12:32:42'),(1,2,1,103,3,1,'2016-03-02 13:19:34'),(1,4,1,103,3,1,'2016-03-03 15:18:35'),(1,5,1,103,3,1,'2016-03-03 15:41:23'),(1,6,1,103,3,1,'2016-03-03 15:49:13'),(1,7,1,103,3,1,'2016-03-03 15:51:13'),(1,8,1,103,3,1,'2016-03-03 15:51:44'),(1,9,1,103,3,1,'2016-03-03 16:27:02'),(1,10,1,103,3,1,'2016-03-03 17:58:42'),(1,58,0,200,2,1,'2016-02-20 10:58:40'),(1,58,1,200,2,1,'2016-02-20 10:58:40'),(1,58,2,200,2,1,'2016-02-20 10:58:40'),(1,58,3,200,2,1,'2016-02-20 10:58:40'),(1,58,4,200,2,1,'2016-02-20 10:58:40'),(1,58,5,200,2,1,'2016-02-20 10:58:40'),(1,58,6,200,2,1,'2016-02-20 10:58:40'),(1,58,7,200,2,1,'2016-02-20 10:58:40'),(1,58,8,200,2,1,'2016-02-20 10:58:40'),(1,58,9,200,2,1,'2016-02-20 10:58:40'),(1,58,10,200,2,1,'2016-02-20 10:58:40'),(1,58,11,200,2,1,'2016-02-20 10:58:40'),(1,58,12,200,2,1,'2016-02-20 10:58:40'),(1,58,13,200,2,1,'2016-02-20 10:58:40'),(1,58,14,200,2,1,'2016-02-20 10:58:40'),(1,58,15,200,2,1,'2016-02-20 10:58:40'),(1,58,16,200,2,1,'2016-02-20 10:58:40'),(1,58,17,200,2,1,'2016-02-20 10:58:40'),(1,58,18,200,2,1,'2016-02-20 10:58:40'),(1,58,19,200,2,1,'2016-02-20 10:58:40'),(1,58,20,200,2,1,'2016-02-20 10:58:40'),(1,58,21,200,2,1,'2016-02-20 10:58:40'),(1,58,22,200,2,1,'2016-02-20 10:58:40'),(1,58,23,200,2,1,'2016-02-20 10:58:40'),(1,58,24,200,2,1,'2016-02-20 10:58:40'),(1,58,25,200,2,1,'2016-02-20 10:58:40'),(1,58,26,200,2,1,'2016-02-20 10:58:40'),(1,58,27,200,2,1,'2016-02-20 10:58:40'),(1,58,28,200,2,1,'2016-02-20 10:58:40'),(1,58,29,200,2,1,'2016-02-20 10:58:40'),(1,58,30,200,2,1,'2016-02-20 10:58:40'),(1,58,31,200,2,1,'2016-02-20 10:58:40'),(1,58,32,200,2,1,'2016-02-20 10:58:40'),(1,58,33,200,2,1,'2016-02-20 10:58:40'),(1,58,34,200,2,1,'2016-02-20 10:58:40'),(1,58,35,200,2,1,'2016-02-20 10:58:40'),(1,58,36,200,2,1,'2016-02-20 10:58:40'),(1,58,37,200,2,1,'2016-02-20 10:58:40'),(1,58,38,200,2,1,'2016-02-20 10:58:40'),(1,58,39,200,2,1,'2016-02-20 10:58:40'),(1,58,40,200,2,1,'2016-02-20 10:58:40'),(1,58,41,200,2,1,'2016-02-20 10:58:40'),(1,58,42,200,2,1,'2016-02-20 10:58:40'),(1,58,43,200,2,1,'2016-02-20 10:58:40'),(1,58,44,200,2,1,'2016-02-20 10:58:40'),(1,58,45,200,2,1,'2016-02-20 10:58:40'),(1,58,46,200,2,1,'2016-02-20 10:58:40'),(1,58,47,200,2,1,'2016-02-20 10:58:40'),(1,58,48,200,2,1,'2016-02-20 10:58:40'),(1,59,0,200,2,1,'2016-02-20 12:41:26'),(1,59,1,200,2,1,'2016-02-20 12:41:26'),(1,60,0,200,2,1,'2016-02-20 13:17:06'),(1,60,1,200,2,1,'2016-02-20 13:17:06'),(1,60,2,200,2,1,'2016-02-20 13:17:06'),(1,60,3,200,2,1,'2016-02-20 13:17:06'),(1,60,4,200,2,1,'2016-02-20 13:17:06'),(1,60,5,200,2,1,'2016-02-20 13:17:06'),(1,60,6,200,2,1,'2016-02-20 13:17:06'),(1,60,7,200,2,1,'2016-02-20 13:17:06'),(1,60,8,200,2,1,'2016-02-20 13:17:06'),(1,60,9,200,2,1,'2016-02-20 13:17:06'),(1,60,10,200,2,1,'2016-02-20 13:17:06'),(1,60,11,200,2,1,'2016-02-20 13:17:06'),(1,60,12,200,2,1,'2016-02-20 13:17:06'),(1,60,13,200,2,1,'2016-02-20 13:17:06'),(1,60,14,200,2,1,'2016-02-20 13:17:06'),(1,60,15,200,2,1,'2016-02-20 13:17:06'),(1,60,16,200,2,1,'2016-02-20 13:17:06'),(1,60,17,200,2,1,'2016-02-20 13:17:06'),(1,60,18,200,2,1,'2016-02-20 13:17:06'),(1,60,19,200,2,1,'2016-02-20 13:17:06'),(1,60,20,200,2,1,'2016-02-20 13:17:06'),(1,60,21,200,2,1,'2016-02-20 13:17:06'),(1,60,22,200,2,1,'2016-02-20 13:17:06'),(1,60,23,200,2,1,'2016-02-20 13:17:06'),(1,60,24,200,2,1,'2016-02-20 13:17:06'),(1,60,25,200,2,1,'2016-02-20 13:17:06'),(1,60,26,200,2,1,'2016-02-20 13:17:06'),(1,60,27,200,2,1,'2016-02-20 13:17:06'),(1,60,28,200,2,1,'2016-02-20 13:17:06'),(1,60,29,200,2,1,'2016-02-20 13:17:06'),(1,60,30,200,2,1,'2016-02-20 13:17:06'),(1,60,31,200,2,1,'2016-02-20 13:17:06'),(1,60,32,200,2,1,'2016-02-20 13:17:06'),(1,60,33,200,2,1,'2016-02-20 13:17:06'),(1,60,34,200,2,1,'2016-02-20 13:17:06'),(1,60,35,200,2,1,'2016-02-20 13:17:06'),(1,60,36,200,2,1,'2016-02-20 13:17:06'),(1,60,37,200,2,1,'2016-02-20 13:17:06'),(1,60,38,200,2,1,'2016-02-20 13:17:06'),(1,60,39,200,2,1,'2016-02-20 13:17:06'),(1,60,40,200,2,1,'2016-02-20 13:17:06'),(1,60,41,200,2,1,'2016-02-20 13:17:06'),(1,60,42,200,2,1,'2016-02-20 13:17:06'),(1,60,43,200,2,1,'2016-02-20 13:17:06'),(1,60,44,200,2,1,'2016-02-20 13:17:06'),(1,60,45,200,2,1,'2016-02-20 13:17:06'),(1,60,46,200,2,1,'2016-02-20 13:17:06'),(1,60,47,200,2,1,'2016-02-20 13:17:06'),(1,60,48,200,2,1,'2016-02-20 13:17:06'),(1,61,0,200,2,1,'2016-02-20 15:37:42'),(1,61,1,200,2,1,'2016-02-20 15:37:42'),(1,62,1,103,3,1,'2016-02-22 10:54:18'),(1,63,1,103,3,1,'2016-02-23 16:08:56'),(1,64,1,103,3,1,'2016-02-23 16:33:58'),(1,65,1,103,3,1,'2016-02-24 16:57:57'),(1,66,1,103,3,1,'2016-02-24 21:15:58'),(1,67,1,103,3,1,'2016-02-25 12:01:42'),(1,68,1,103,3,1,'2016-02-25 12:21:36'),(1,69,1,103,3,1,'2016-02-25 12:23:12'),(1,70,1,103,3,1,'2016-02-25 13:24:17'),(1,71,1,103,3,1,'2016-02-25 15:00:42'),(1,72,1,103,3,1,'2016-02-25 15:00:42'),(1,73,1,103,3,1,'2016-02-25 15:04:53'),(1,74,1,103,3,1,'2016-02-25 15:44:19'),(1,75,1,103,3,1,'2016-02-25 15:46:22'),(1,76,1,103,3,1,'2016-02-25 15:48:16'),(1,77,1,103,3,1,'2016-02-25 15:51:36'),(1,78,1,103,3,1,'2016-02-25 15:52:39'),(1,79,1,103,3,1,'2016-02-25 15:53:43'),(1,80,1,103,3,1,'2016-02-25 15:59:13'),(1,81,1,103,3,1,'2016-02-25 16:00:49'),(1,82,1,103,3,1,'2016-02-25 16:10:58'),(1,83,1,103,3,1,'2016-02-25 16:13:19'),(1,84,1,103,3,1,'2016-02-25 16:15:19'),(1,85,1,104,3,1,'2016-02-25 16:47:06'),(1,86,1,104,2,1,'2016-02-25 17:30:04'),(1,87,1,104,2,1,'2016-02-25 17:33:08'),(1,88,1,104,2,1,'2016-02-25 17:34:40'),(1,89,1,104,2,1,'2016-02-25 17:37:10'),(1,90,1,104,3,1,'2016-02-25 17:44:13'),(1,91,1,104,3,1,'2016-02-25 18:46:19'),(1,92,1,104,3,1,'2016-02-25 18:51:31'),(1,93,1,104,3,1,'2016-02-25 18:54:14'),(1,94,1,104,3,1,'2016-02-25 20:13:48'),(1,95,1,104,3,1,'2016-02-25 20:16:50'),(1,96,1,104,3,1,'2016-02-25 20:44:39'),(1,97,1,104,3,1,'2016-02-26 12:36:19'),(1,98,1,104,3,1,'2016-02-26 12:46:50'),(1,99,1,104,3,1,'2016-02-26 13:08:01'),(1,100,1,104,3,1,'2016-02-26 13:35:25'),(1,101,1,104,3,1,'2016-02-26 13:41:19'),(1,102,1,104,3,1,'2016-02-26 16:10:00'),(1,103,1,104,3,1,'2016-02-26 16:13:13'),(1,104,1,104,2,1,'2016-02-26 16:24:39'),(1,105,1,104,3,1,'2016-02-26 16:25:27'),(1,106,1,104,3,1,'2016-02-26 16:56:43'),(1,111,1,104,3,1,'2016-02-27 11:59:33'),(1,112,1,104,3,1,'2016-02-27 12:36:27'),(1,113,1,104,3,1,'2016-02-27 12:38:58'),(1,114,1,104,3,1,'2016-02-27 12:50:56'),(1,116,1,104,3,1,'2016-02-27 15:11:41'),(1,117,1,104,3,1,'2016-02-27 15:14:26'),(1,118,1,104,3,1,'2016-02-27 15:20:48'),(1,119,1,104,3,1,'2016-02-27 15:41:52');
/*!40000 ALTER TABLE `dupload_log` ENABLE KEYS */;
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
-- Table structure for table `cclassify_status`
--

DROP TABLE IF EXISTS `cclassify_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cclassify_status` (
  `cclassify_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(45) DEFAULT NULL,
  `file_id` varchar(45) DEFAULT NULL,
  `efs_uin` varchar(45) DEFAULT NULL,
  `pageno` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `cust_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cclassify_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cclassify_status`
--

LOCK TABLES `cclassify_status` WRITE;
/*!40000 ALTER TABLE `cclassify_status` DISABLE KEYS */;
INSERT INTO `cclassify_status` VALUES (1,NULL,NULL,'102',1,NULL,NULL),(2,NULL,NULL,'efs_104',11,NULL,NULL),(3,NULL,NULL,'',0,NULL,NULL),(4,NULL,NULL,'efs_102',0,NULL,NULL),(5,NULL,NULL,'efs_102',1,NULL,NULL),(6,NULL,NULL,'efs_102',2,NULL,NULL),(7,NULL,NULL,'efs_102',3,NULL,NULL),(8,NULL,NULL,'efs_102',4,NULL,NULL),(9,NULL,NULL,'efs_102',5,NULL,NULL),(10,NULL,NULL,'efs_102',6,NULL,NULL),(11,NULL,NULL,'efs_102',7,NULL,NULL),(12,NULL,NULL,'efs_102',8,NULL,NULL),(13,NULL,NULL,'efs_102',9,NULL,NULL),(14,NULL,NULL,'efs_102',10,NULL,NULL),(15,NULL,NULL,'efs_102',11,NULL,NULL),(16,NULL,NULL,'efs_103',0,NULL,NULL),(17,NULL,NULL,'efs_103',1,NULL,NULL),(18,NULL,NULL,'efs_103',2,NULL,NULL),(19,NULL,NULL,'efs_103',3,NULL,NULL),(20,NULL,NULL,'efs_103',4,NULL,NULL),(21,NULL,NULL,'efs_103',5,NULL,NULL),(22,NULL,NULL,'efs_103',6,NULL,NULL),(23,NULL,NULL,'efs_103',7,NULL,NULL),(24,NULL,NULL,'efs_103',8,NULL,NULL),(25,NULL,NULL,'efs_103',9,NULL,NULL),(26,NULL,NULL,'efs_103',10,NULL,NULL),(27,NULL,NULL,'efs_103',11,NULL,NULL),(28,NULL,NULL,'efs_104',0,NULL,NULL),(29,NULL,NULL,'efs_104',1,NULL,NULL),(30,NULL,NULL,'efs_104',2,NULL,NULL),(31,NULL,NULL,'efs_104',3,NULL,NULL),(32,NULL,NULL,'efs_104',4,NULL,NULL),(33,NULL,NULL,'efs_104',5,NULL,NULL),(34,NULL,NULL,'efs_104',6,NULL,NULL),(35,NULL,NULL,'efs_104',7,NULL,NULL),(36,NULL,NULL,'efs_104',8,NULL,NULL),(37,NULL,NULL,'efs_104',9,NULL,NULL),(38,NULL,NULL,'efs_104',10,NULL,NULL),(39,NULL,NULL,'efs_104',11,NULL,NULL),(40,NULL,NULL,'efs_102',0,NULL,NULL),(41,NULL,NULL,'efs_102',1,NULL,NULL),(42,NULL,NULL,'efs_102',2,NULL,NULL),(43,NULL,NULL,'efs_102',3,NULL,NULL),(44,NULL,NULL,'efs_102',4,NULL,NULL),(45,NULL,NULL,'efs_102',5,NULL,NULL),(46,NULL,NULL,'efs_103',0,NULL,NULL),(47,NULL,NULL,'efs_103',1,NULL,NULL),(48,NULL,NULL,'efs_103',2,NULL,NULL),(49,NULL,NULL,'efs_103',3,NULL,NULL),(50,NULL,NULL,'efs_103',4,NULL,NULL),(51,NULL,NULL,'efs_103',5,NULL,NULL),(52,NULL,NULL,'efs_104',0,NULL,NULL),(53,NULL,NULL,'efs_104',1,NULL,NULL),(54,NULL,NULL,'efs_104',2,NULL,NULL),(55,NULL,NULL,'efs_104',3,NULL,NULL),(56,NULL,NULL,'efs_104',4,NULL,NULL),(57,NULL,NULL,'efs_104',5,NULL,NULL),(58,NULL,NULL,'102',1,NULL,NULL),(59,NULL,NULL,'102',1,'2016-02-20 19:17:47',NULL);
/*!40000 ALTER TABLE `cclassify_status` ENABLE KEYS */;
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
INSERT INTO `uicbpaas_service_offering` VALUES ('ch100101',1,'Short Description invoice process to pay','invoice process to pay',1),('ch100102',2,'Short Description claims process to pay','claims process to pay',1),('ch100103',3,'Short Description loans to classify','loans to classify',1),('ch100104',4,'Short Description books to ePUB','books to ePUB',1),('ch100105',5,'Short Description enroll, onboard to pay','enroll, onboard to pay',1);
/*!40000 ALTER TABLE `uicbpaas_service_offering` ENABLE KEYS */;
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
INSERT INTO `hethi_offers_details` VALUES (5,'csfs10000'),(5,'csfs100101'),(5,'csfs100102'),(5,'csfs100120'),(6,'csfs10000'),(6,'csfs100101'),(6,'csfs100102'),(6,'csfs100103'),(7,'csfs10000'),(8,'csfs10000'),(8,'csfs100101'),(8,'csfs100103'),(8,'csfs100105'),(8,'csfs100120'),(8,'csfs100121'),(8,'csfs100141'),(8,'csfs100142'),(8,'csfs100160'),(8,'csfs100162'),(8,'csfs100163'),(9,'csfs10000'),(9,'csfs100101'),(9,'csfs100140'),(9,'csfs100160'),(9,'csfs100161'),(10,'csfs10000'),(10,'csfs100101'),(10,'csfs100102'),(10,'csfs100103'),(10,'csfs100140'),(10,'csfs100141'),(10,'csfs100160'),(10,'csfs100161'),(11,'csfs100102'),(11,'csfs100103'),(11,'csfs100120'),(11,'csfs100121'),(11,'csfs100140'),(11,'csfs100141'),(11,'csfs100142'),(12,'csfs10000'),(12,'csfs100141'),(12,'csfs100142'),(12,'csfs100144'),(12,'csfs100160'),(12,'csfs100161'),(12,'csfs100162'),(13,'csfs10000'),(13,'csfs100120'),(13,'csfs100121'),(13,'csfs100160'),(14,'csfs10000'),(14,'csfs100101'),(14,'csfs100102'),(14,'csfs100160'),(14,'csfs100161'),(15,'csfs10000'),(15,'csfs100101'),(15,'csfs100102'),(15,'csfs100141'),(15,'csfs100160'),(15,'csfs100161'),(16,'csfs10000'),(16,'csfs100160'),(17,'csfs10000'),(17,'csfs100101'),(17,'csfs100102'),(17,'csfs100103'),(17,'csfs100120'),(17,'csfs100121'),(17,'csfs100140'),(17,'csfs100160'),(18,''),(19,'csfs10000'),(19,'csfs100120'),(19,'csfs100121'),(19,'csfs100160'),(19,'csfs100161'),(20,'csfs10000'),(20,'csfs100102'),(20,'csfs100103'),(20,'csfs100120'),(20,'csfs100121'),(20,'csfs100142'),(20,'csfs100143'),(20,'csfs100161'),(20,'csfs100162'),(21,'csfs10000'),(21,'csfs100101'),(21,'csfs100102'),(22,'csfs10000'),(22,'csfs100160'),(22,'csfs100161'),(23,'csfs10000'),(23,'csfs100140'),(24,'csfs10000'),(24,'csfs100101'),(24,'csfs100102'),(24,'csfs100120'),(24,'csfs100121'),(24,'csfs100140'),(24,'csfs100160'),(25,'csfs100120'),(25,'csfs100121'),(26,'csfs100101'),(26,'csfs100102'),(26,'csfs100160'),(26,'csfs100161'),(26,'csfs100162'),(26,'csfs100163'),(27,'csfs10000'),(27,'csfs100101'),(27,'csfs100102'),(27,'csfs100103'),(27,'csfs100104'),(27,'csfs100120'),(27,'csfs100121'),(27,'csfs100141'),(27,'csfs100160'),(27,'csfs100161'),(27,'csfs100162'),(28,'csfs10000'),(28,'csfs100160'),(29,'csfs10000'),(29,'csfs100101'),(30,'csfs10000'),(30,'csfs100160'),(30,'csfs100161'),(31,'csfs100120'),(31,'csfs100121'),(32,'csfs10000'),(33,'csfs10000'),(34,'csfs10000'),(35,'csfs10000'),(36,'csfs10000'),(37,'csfs10000'),(38,'csfs10000'),(39,'csfs10000'),(40,'csfs10000'),(40,'csfs100160'),(41,'csfs10000'),(41,'csfs100140'),(42,'csfs10000'),(42,'csfs100101'),(42,'csfs100120'),(42,'csfs100140'),(42,'csfs100160'),(43,'csfs100160'),(43,'csfs100161'),(44,'csfs10000'),(44,'csfs100101'),(44,'csfs100102'),(44,'csfs100120'),(45,'csfs10000'),(45,'csfs100101'),(45,'csfs100102'),(45,'csfs100120'),(46,''),(47,'csfs100140'),(48,'csfs100140'),(49,'csfs10000'),(49,'csfs100101'),(49,'csfs100120'),(49,'csfs100161'),(50,'csfs10000'),(50,'csfs100101'),(50,'csfs100102'),(50,'csfs100103'),(50,'csfs100104'),(50,'csfs100105'),(50,'csfs100106'),(50,'csfs100107'),(50,'csfs100108'),(50,'csfs100109'),(50,'csfs100120'),(50,'csfs100121'),(50,'csfs100140'),(50,'csfs100141'),(50,'csfs100142'),(50,'csfs100143'),(50,'csfs100144'),(50,'csfs100145'),(50,'csfs100146'),(50,'csfs100147'),(50,'csfs100160'),(50,'csfs100161'),(50,'csfs100162'),(50,'csfs100163'),(51,'csfs10000'),(51,'csfs100101'),(51,'csfs100102'),(51,'csfs100103'),(51,'csfs100120'),(51,'csfs100121'),(51,'csfs100140'),(51,'csfs100141'),(51,'csfs100142'),(51,'csfs100143'),(51,'csfs100144'),(51,'csfs100145'),(51,'csfs100160'),(51,'csfs100161'),(51,'csfs100162'),(51,'csfs100163'),(52,'');
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
  UNIQUE KEY `XPKeFs_Source_Detail` (`eFS_ID`,`Customer_Id`,`Input_Source_Id`)
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
  UNIQUE KEY `XPKeFs_Field_Stencil` (`efs_Field_Id`,`eFs_Stencil_Id`,`eFS_ID`,`Input_Source_Id`)
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
  UNIQUE KEY `XPKeFs_Field_detail` (`eFS_Field_Id`,`Property_ID`,`Lookup_Id`,`Rule_Workset_ID`,`Input_Source_Id`,`eFS_ID`,`eFs_Stencil_Id`)
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
  UNIQUE KEY `XPKClassification_Connect` (`Classification_ID`,`eFS_Field_Id`,`eFS_ID`,`Input_Source_Id`)
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
  `user_name` varchar(100) DEFAULT NULL,
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
INSERT INTO `duser` VALUES (1,1,'Hethi','Admin','HethiAdmin','Mr',1,1,'admin@hethi.com','password','2016-02-08 12:21:57'),(1,2,'Hethi','Artist','HethiArtist','Mr',1,2,'artist@hethi.com','password','2016-02-20 21:39:33'),(1,3,'Hethi','User','HethiUser','Mr',1,3,'user@hethi.com','password','2016-01-29 16:12:38'),(1,4,'Hethi','Manager','HethiManager','Mr',1,3,'manager@hethi.com','password','2016-01-29 16:12:47'),(1,5,'Hethi','Supervisor','HethiSupervisor','Mr',1,5,'supervisor@hethi.com','password','2016-01-29 15:54:32'),(1,6,'Hethi','Operator','HethiOperator','Mr',1,6,'operator@hethi.com','password','2015-10-28 10:28:34'),(1,7,'Operations ','Partner','Operations Partner','Mr',1,9,'operations@hethi.com','password','2015-10-28 10:28:34'),(1,8,'Platform','Partner','Platform Partner','Mr',1,10,'platform@hethi.com','password','2015-10-28 10:28:34'),(1,12,'','',NULL,'',55,4,'ddfgfdg@ddfg.ftfg','','2016-02-20 21:38:48'),(2,11,'prabhakaran','prabhakaran',NULL,'Mr',54,3,'rprabhakaran@hethi.com','56987','2016-02-01 09:27:42');
/*!40000 ALTER TABLE `duser` ENABLE KEYS */;
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
INSERT INTO `dcustomerserviceplayqueue` VALUES (1,'cefs100101','cefs100101','csfs100101','csfs100101','csfs100102','csfs10000','1','2016-02-25 20:32:49'),(1,'cefs100101','cefs100101','csfs100102','csfs100102','csfs100103','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100103','csfs100103','csfs100104','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100104','csfs100104','csfs100105','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100105','csfs100105','csfs100106','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100106','csfs100106','csfs100107','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100107','csfs100107','csfs100108','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100108','csfs100108','csfs100109','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100109','csfs100109','csfs100120','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100120','csfs100120','csfs100121','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100121','csfs100121','csfs100140','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100140','csfs100140','csfs100142','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100142','csfs100142','csfs100143','csfs10000','1','2016-02-25 20:32:48'),(1,'cefs100101','cefs100101','csfs100143','csfs100143','csfs100141','csfs10000','1','2016-02-25 20:32:49');
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
-- Table structure for table `menu_role_connect`
--

DROP TABLE IF EXISTS `menu_role_connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_role_connect` (
  `role_id` bigint(20) NOT NULL,
  `menu_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_role_connect`
--

LOCK TABLES `menu_role_connect` WRITE;
/*!40000 ALTER TABLE `menu_role_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_role_connect` ENABLE KEYS */;
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
INSERT INTO `cruleset` VALUES ('rs1002','pk1001','ws1001','Ruleset A','Ruleset desc','1','2016-02-06 14:57:54',1,'2015-10-22','2016-09-30');
/*!40000 ALTER TABLE `cruleset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` bigint(20) NOT NULL,
  `menu_heading` varchar(250) DEFAULT NULL,
  `menu_parent_id` bigint(20) DEFAULT NULL COMMENT '___________________________________________________******************* 0- hiddenMenu ****************** **if menu_id and menu_parent_id are same that is MainMenu** **************other menus are child Menu************** __________________________________________________',
  `menu_type` tinyint(4) DEFAULT NULL COMMENT '0-routedmenu, 1-expandedmenu',
  `menu_route` varchar(250) DEFAULT NULL,
  `menu_template_url` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Home',0,1,'/','pages/hethi/home_page.html');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
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
-- Table structure for table `1_lawsonpo_lookup`
--

DROP TABLE IF EXISTS `1_lawsonpo_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1_lawsonpo_lookup` (
  `Company` int(11) DEFAULT NULL,
  `PO_Nbr` int(11) DEFAULT NULL,
  `cost_center` varchar(45) DEFAULT NULL,
  `PO_Code` varchar(10) DEFAULT NULL,
  `PO_Release` int(10) DEFAULT NULL,
  `Vendor_Num` int(10) DEFAULT NULL,
  `Purch_Fr_Loc` varchar(30) DEFAULT NULL,
  `PO_Date` varchar(10) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `Dropship_Fl` varchar(5) DEFAULT NULL,
  `Line_Nbr` int(10) DEFAULT NULL,
  `Service_Code` varchar(5) DEFAULT NULL,
  `Item` varchar(50) DEFAULT NULL,
  `Item_Type` varchar(50) DEFAULT NULL,
  `Description` varchar(75) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `Unit_Cost` decimal(10,0) DEFAULT NULL,
  `Ven_Item` varchar(30) DEFAULT NULL,
  `Extend_Amt` decimal(10,0) DEFAULT NULL,
  `unit_of_measure` varchar(5) DEFAULT NULL,
  `Closed_Fl` varchar(5) DEFAULT NULL,
  `Received_Qty` decimal(10,0) DEFAULT NULL,
  `Matched_Qty` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1_lawsonpo_lookup`
--

LOCK TABLES `1_lawsonpo_lookup` WRITE;
/*!40000 ALTER TABLE `1_lawsonpo_lookup` DISABLE KEYS */;
INSERT INTO `1_lawsonpo_lookup` VALUES (1,3305513,'110532','SERV',0,9866,'GHXF','20110103','FHNS','N',18,'Q','9-1286DR','S','RENTAL SYSTEM MONITOR',30,65,'9-1286DR',1950,'EA','N',0,13),(1,3305633,'120523','',0,3967,'P3','20110103','MVHOR','N',1,'','4003175002','X','sterrad paper',4,26,'4003175002',104,'EA','N',0,0),(1,3305932,'160825','',0,3591,'GHX1','20110103','IHPLX','N',23,'','1462','N','KIT CULTURE BLOOD CHLORAPREP',3,13,'4335260299',38,'CT','N',0,0),(1,3306109,'110532','',0,3591,'GHX1','20110103','FHNS','N',44,'','13924','N','PROBE TEMP MYOCARDIAL 8MM PED',2,196,'41305030300',393,'CA','N',0,0),(1,3306246,'130530','DROP',0,3798,'GHXF','20110103','FOHOR','Y',1,'','HH0710','X','BIO-A TISSUE REINFORCEMENT',1,495,'HH0710',495,'EA','N',0,0),(1,3306707,'130501','',0,9139,'GHXF','20110103','FOHNS','N',1,'','2017006-001','X','Care Multi-Link 12-ld ecg cabl',4,232,'2017006-001',929,'EA','N',0,0),(1,3306707,'130501','',0,9139,'GHXF','20110103','FOHNS','N',2,'','416467-003','X','Multi-link ecg ldwr set',4,65,'416467-003',261,'EA','N',0,0),(1,3307605,'160561','',0,1181,'GHXF','20110103','AHNS','N',1,'','PBL-LA','X','PUSH BUTTON LOCK',1,60,'PBL-LA',60,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',1,'Q','CLAMP-003','S','Tamper resistant clamp',1000,1,'CLAMP-003',800,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',3,'Q','AA-0017','S','Matching Numbered chart label',1000,0,'AA-0017',300,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',4,'Q','STERILIZATION','S','Sterilization of clamp',1000,2,'STERILIZATION',1850,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',5,'Q','PACKAGING','S','Packaging if complete kits',1000,2,'PACKAGING',1900,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',6,'Q','CLEANING','S','cleaning testing sterilization',1000,2,'CLEANING',2080,'EA','N',0,0),(1,3308464,'130711','SERV',0,27463,'P1','20110104','FOHNS','N',1,'Q','ACESS CONTROL SYSTEM','S','loading dock door acess contro',1,4001,'ACCESS CONTROL SYSTEM ON DOOR',4001,'EA','N',0,0),(1,3309088,'unknown','',0,3591,'GHX1','20110104','FH','N',7,'','63104','I','SYRINGE 1ML INSULIN W/LUERLOK',6,29,'0723309629',172,'BX','N',6,0),(1,3305513,'110532','SERV',0,9866,'GHXF','20110103','FHNS','N',18,'Q','9-1286DR','S','RENTAL SYSTEM MONITOR',30,65,'9-1286DR',1950,'EA','N',0,13),(1,3305633,'120523','',0,3967,'P3','20110103','MVHOR','N',1,'','4003175002','X','sterrad paper',4,26,'4003175002',104,'EA','N',0,0),(1,3305932,'160825','',0,3591,'GHX1','20110103','IHPLX','N',23,'','1462','N','KIT CULTURE BLOOD CHLORAPREP',3,13,'4335260299',38,'CT','N',0,0),(1,3306109,'110532','',0,3591,'GHX1','20110103','FHNS','N',44,'','13924','N','PROBE TEMP MYOCARDIAL 8MM PED',2,196,'41305030300',393,'CA','N',0,0),(1,3306246,'130530','DROP',0,3798,'GHXF','20110103','FOHOR','Y',1,'','HH0710','X','BIO-A TISSUE REINFORCEMENT',1,495,'HH0710',495,'EA','N',0,0),(1,3306707,'130501','',0,9139,'GHXF','20110103','FOHNS','N',1,'','2017006-001','X','Care Multi-Link 12-ld ecg cabl',4,232,'2017006-001',929,'EA','N',0,0),(1,3306707,'130501','',0,9139,'GHXF','20110103','FOHNS','N',2,'','416467-003','X','Multi-link ecg ldwr set',4,65,'416467-003',261,'EA','N',0,0),(1,3307605,'160561','',0,1181,'GHXF','20110103','AHNS','N',1,'','PBL-LA','X','PUSH BUTTON LOCK',1,60,'PBL-LA',60,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',1,'Q','CLAMP-003','S','Tamper resistant clamp',1000,1,'CLAMP-003',800,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',3,'Q','AA-0017','S','Matching Numbered chart label',1000,0,'AA-0017',300,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',4,'Q','STERILIZATION','S','Sterilization of clamp',1000,2,'STERILIZATION',1850,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',5,'Q','PACKAGING','S','Packaging if complete kits',1000,2,'PACKAGING',1900,'EA','N',0,0),(1,3308170,'110621','SERV',0,23317,'GHXF','20110104','FHNS','N',6,'Q','CLEANING','S','cleaning testing sterilization',1000,2,'CLEANING',2080,'EA','N',0,0),(1,3308464,'130711','SERV',0,27463,'P1','20110104','FOHNS','N',1,'Q','ACESS CONTROL SYSTEM','S','loading dock door acess contro',1,4001,'ACCESS CONTROL SYSTEM ON DOOR',4001,'EA','N',0,0),(1,3309088,'unknown','',0,3591,'GHX1','20110104','FH','N',7,'','63104','I','SYRINGE 1ML INSULIN W/LUERLOK',6,29,'0723309629',172,'BX','N',6,0);
/*!40000 ALTER TABLE `1_lawsonpo_lookup` ENABLE KEYS */;
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
  UNIQUE KEY `XPKClassify` (`Classification_ID`,`eFs_Field_Id`,`eFS_ID`,`Input_Source_Id`)
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
-- Table structure for table `rule_operations`
--

DROP TABLE IF EXISTS `rule_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_operations` (
  `operation_id` int(11) NOT NULL,
  `operation_name` varchar(45) DEFAULT NULL,
  `operation_expression` varchar(500) DEFAULT NULL,
  `rule_type` varchar(10) DEFAULT NULL,
  `custom_value` int(11) DEFAULT NULL,
  `custom_type` varchar(45) DEFAULT NULL,
  `custom_type_options` varchar(45) DEFAULT NULL,
  `custom_message` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `expression_input` varchar(250) DEFAULT NULL,
  `operation_type` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_operations`
--

LOCK TABLES `rule_operations` WRITE;
/*!40000 ALTER TABLE `rule_operations` DISABLE KEYS */;
INSERT INTO `rule_operations` VALUES (1,'check price discrepancy','\r {\"second\":\"((po_ordered_price > 88+custom_input) || (po_ordered_price < 88 -custom_input ))\",\"first\":\"(po_ordered_price> (88 +  88*custom_input/100 )) || (po_ordered_price< (88 - 88*custom_input/100))\"}','header',1,'custom','in percentage,in amount','price variation','check invoice amount is 5 % / $10 (+ or -) variance or not','price,custom_input,lookup','computation',0),(2,'check date expiration','\r {\"first\":\"(System.currentTimeMillis()-new Date(invoice_date).getTime())/(1000*60*60*24) > custom_input\"}','header',1,'custom',NULL,'validity period (in days)','check  invoice has a future date of more than 90 days','date,custom_input','computation',0),(3,'currency validation','{\"first\":\"!currency.startsWith(custom_input)\"}','header',1,'custom',NULL,'currency','currency should be in USD or $','currency,custom_input','computation',0),(4,'check image is illegible','{\"first\":\"frieght_term.equals(\"#\")  ||  invoice_amount.equals(\"#\") || invoice_date.equals(\"#\") || invoice_number.equals(\"#\") ||  po_number.equals(\"#\")\"}','header',0,NULL,NULL,NULL,'check image is clear or not','frieght_term,invoice_number,invoice_amount,po_number,invoice_date','computation',0),(5,'invoice  amount to zero','{\"first\":\"invoice_amount.equals(\\\"0\\\")\"}','header',0,'',NULL,NULL,'check invoice amount to zero','amount','computation',0),(6,'check  information is available','{\"first\":\"invoice_amount.equals(\"null\")  &&  invoice_date.equals(\"null\")  &&  invoice_number.equals(\"null\")  &&  po_number.equals(\"null\")\"}','header',0,NULL,NULL,NULL,'invoice number,invoice amount,invoice date,po number is mandatory','invoice_number,invoice_amount,invoice_date,po_number','computation',0),(7,'check quantity discrepancy','{\"first\":\"po_ordered_quantity > 10\"}','table',0,NULL,NULL,NULL,'check the Qty is greater than the quantity on the PO line','quantity','computation',0),(8,'check date format','{\"first\":\"new Date(invoice_date).getMonth()  > 12\"}','header',0,NULL,NULL,NULL,'check invoice date format is correct or not','invoice_date','computation',0),(9,'freight, surcharge tax illegible','frieght_term.equals(\"#\")','header',0,NULL,NULL,NULL,'freight, surcharge tax illegible','frieght_term','computation',0),(10,'calculate item sub total','{\"first\":\"po_ordered_quantity*po_ordered_price ==  po_extended_price\"}','table',1,'field',NULL,'output field as','compute rate * qty = sub total','po_extended_price,po_ordered_price,po_ordered_quantity,lookup','computation',0),(11,'validate vendor address',NULL,'header',0,NULL,NULL,NULL,'validate vendor address','address01,address02','look up',0),(12,'check invoice duplication',NULL,'header',0,NULL,NULL,NULL,'check invoice duplication','invoice_amount,invoice_number,invoice_date,vendor_number','look up',0),(13,'validate vendor',NULL,'header',0,NULL,NULL,NULL,'check vendor id','vendor_number,vendor_name','lookup',0),(14,'check po is valid','{\"first\":\"po_number.equals(1234)\"}','header',0,NULL,NULL,NULL,'check po is valid or invalid','po_number','computation',0),(15,'check vendor is exists',NULL,'header',0,NULL,NULL,NULL,'check vendor is exists in master file','vendor_number','lookup',0),(16,'check invoice suspect duplicate',NULL,'header',0,NULL,NULL,NULL,'If a document matches a previous DUID based on all 4 fields; Vendor # + Invoice # + Invoice Date + Invoice Amount','invoice_amount,invoice_number,invoice_date','lookup',0),(17,'check item number mismatch',NULL,'table',0,NULL,NULL,NULL,'If any Item number on PO does not match item numbers on invoices','line_number','lookup',0),(18,'check item is received or not',NULL,'header',0,NULL,NULL,NULL,'If the order is not received','po_number','lookup',0),(19,'check po line is available in master',NULL,'lineitem',0,NULL,NULL,NULL,'PO on the invoice was found in the PO file, but there are items on the invoice that don\'t exist in the PO. This is a line item level exception.','line_items,description','lookup',0);
/*!40000 ALTER TABLE `rule_operations` ENABLE KEYS */;
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
INSERT INTO `cruleworkset` VALUES ('ws1001','DaaSclassifyValidation','import ipost description','1','2016-01-15 17:21:31','pk1001',1,NULL,NULL),('ws1003','DaaSclassifyValidation1','Custom rule DaaSclassifyValidation1','1','2016-01-15 17:21:31','pk1001',3,NULL,NULL),('ws1004','DAAS','Custom rule ','1','2016-02-06 14:39:19','pk1001',2,'2015-10-10','2015-10-10'),('ws1005','','Custom rule ','1','2016-02-12 17:10:02',NULL,NULL,NULL,NULL),('ws1006','','Custom rule ','1','2016-02-22 16:17:49',NULL,NULL,NULL,NULL),('ws1007','','Custom rule ','1','2016-02-22 16:19:39',NULL,NULL,NULL,NULL),('ws1008','','Custom rule ','1','2016-02-22 16:20:51',NULL,NULL,NULL,NULL),('ws1009','','Custom rule ','1','2016-02-22 16:21:15',NULL,NULL,NULL,NULL),('ws1010','','Custom rule ','1','2016-02-22 16:21:43',NULL,NULL,NULL,NULL),('ws1011','','Custom rule ','1','2016-02-22 16:21:44',NULL,NULL,NULL,NULL),('ws1012','','Custom rule ','1','2016-02-25 20:32:49',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cruleworkset` ENABLE KEYS */;
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
INSERT INTO `dcustomercommn` VALUES (1,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(3,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(5,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(7,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(9,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(11,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(13,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(15,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(17,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(19,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(21,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(23,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(25,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(26,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(27,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(28,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(29,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(30,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(31,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(32,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(33,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(34,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(35,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(36,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(37,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(38,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(39,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(40,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(41,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(42,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(43,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(44,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(45,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(46,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(47,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(48,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(49,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(50,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(51,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(52,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(53,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(54,'Branch office','Olavacode','Palakkad','ind','123','123456','hethi@gmail.com','0987654','132245','hethi@gmail.com','9876548','linkedin',1,'2016-02-08 12:21:57'),(55,'','','','','','','','','','','','',1,'2016-02-20 21:38:48');
/*!40000 ALTER TABLE `dcustomercommn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dupload_log_history`
--

DROP TABLE IF EXISTS `dupload_log_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupload_log_history` (
  `customer_id` bigint(20) NOT NULL,
  `upload_id` bigint(20) NOT NULL COMMENT 'auto increment\\n',
  `file_id` bigint(20) NOT NULL COMMENT 'file id\\n',
  `micro_process_id` bigint(20) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `lastupuser` int(11) NOT NULL COMMENT 'user ID audit trail\\\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload_log_history`
--

LOCK TABLES `dupload_log_history` WRITE;
/*!40000 ALTER TABLE `dupload_log_history` DISABLE KEYS */;
INSERT INTO `dupload_log_history` VALUES (1,58,1,100,1,1,'2016-02-20 10:57:58'),(1,58,1,100,2,1,'2016-02-20 10:57:58'),(1,58,1,100,3,1,'2016-02-20 10:57:58'),(1,58,1,101,1,1,'2016-02-20 10:57:59'),(1,58,1,101,2,1,'2016-02-20 10:57:59'),(1,58,1,101,3,1,'2016-02-20 10:57:59'),(1,58,1,102,1,1,'2016-02-20 10:57:59'),(1,58,1,102,2,1,'2016-02-20 10:57:59'),(1,58,1,102,3,1,'2016-02-20 10:57:59'),(1,58,1,103,1,1,'2016-02-20 10:57:59'),(1,58,1,103,2,1,'2016-02-20 10:57:59'),(1,58,1,103,3,1,'2016-02-20 10:57:59'),(1,58,2,100,1,1,'2016-02-20 10:57:59'),(1,58,2,100,2,1,'2016-02-20 10:57:59'),(1,58,2,100,3,1,'2016-02-20 10:57:59'),(1,58,2,101,1,1,'2016-02-20 10:57:59'),(1,58,2,101,2,1,'2016-02-20 10:57:59'),(1,58,2,101,3,1,'2016-02-20 10:57:59'),(1,58,2,102,1,1,'2016-02-20 10:58:00'),(1,58,2,102,2,1,'2016-02-20 10:58:00'),(1,58,2,102,3,1,'2016-02-20 10:58:00'),(1,58,2,103,1,1,'2016-02-20 10:58:00'),(1,58,2,103,2,1,'2016-02-20 10:58:00'),(1,58,2,103,3,1,'2016-02-20 10:58:00'),(1,58,3,100,1,1,'2016-02-20 10:58:00'),(1,58,3,100,2,1,'2016-02-20 10:58:00'),(1,58,3,100,3,1,'2016-02-20 10:58:00'),(1,58,3,101,1,1,'2016-02-20 10:58:00'),(1,58,3,101,2,1,'2016-02-20 10:58:00'),(1,58,3,101,3,1,'2016-02-20 10:58:00'),(1,58,3,102,1,1,'2016-02-20 10:58:00'),(1,58,3,102,2,1,'2016-02-20 10:58:00'),(1,58,3,102,3,1,'2016-02-20 10:58:00'),(1,58,3,103,1,1,'2016-02-20 10:58:01'),(1,58,3,103,2,1,'2016-02-20 10:58:01'),(1,58,3,103,3,1,'2016-02-20 10:58:01'),(1,58,4,100,1,1,'2016-02-20 10:58:01'),(1,58,4,100,2,1,'2016-02-20 10:58:01'),(1,58,4,100,3,1,'2016-02-20 10:58:01'),(1,58,4,101,1,1,'2016-02-20 10:58:01'),(1,58,4,101,2,1,'2016-02-20 10:58:01'),(1,58,4,101,3,1,'2016-02-20 10:58:01'),(1,58,4,102,1,1,'2016-02-20 10:58:01'),(1,58,4,102,2,1,'2016-02-20 10:58:01'),(1,58,4,102,3,1,'2016-02-20 10:58:01'),(1,58,4,103,1,1,'2016-02-20 10:58:01'),(1,58,4,103,2,1,'2016-02-20 10:58:01'),(1,58,4,103,3,1,'2016-02-20 10:58:01'),(1,58,5,100,1,1,'2016-02-20 10:58:02'),(1,58,5,100,2,1,'2016-02-20 10:58:02'),(1,58,5,100,3,1,'2016-02-20 10:58:02'),(1,58,5,101,1,1,'2016-02-20 10:58:02'),(1,58,5,101,2,1,'2016-02-20 10:58:02'),(1,58,5,101,3,1,'2016-02-20 10:58:02'),(1,58,5,102,1,1,'2016-02-20 10:58:02'),(1,58,5,102,2,1,'2016-02-20 10:58:02'),(1,58,5,102,3,1,'2016-02-20 10:58:02'),(1,58,5,103,1,1,'2016-02-20 10:58:02'),(1,58,5,103,2,1,'2016-02-20 10:58:02'),(1,58,5,103,3,1,'2016-02-20 10:58:02'),(1,58,6,100,1,1,'2016-02-20 10:58:02'),(1,58,6,100,2,1,'2016-02-20 10:58:03'),(1,58,6,100,3,1,'2016-02-20 10:58:03'),(1,58,6,101,1,1,'2016-02-20 10:58:03'),(1,58,6,101,2,1,'2016-02-20 10:58:03'),(1,58,6,101,3,1,'2016-02-20 10:58:03'),(1,58,6,102,1,1,'2016-02-20 10:58:03'),(1,58,6,102,2,1,'2016-02-20 10:58:03'),(1,58,6,102,3,1,'2016-02-20 10:58:03'),(1,58,6,103,1,1,'2016-02-20 10:58:03'),(1,58,6,103,2,1,'2016-02-20 10:58:03'),(1,58,6,103,3,1,'2016-02-20 10:58:03'),(1,58,7,100,1,1,'2016-02-20 10:58:03'),(1,58,7,100,2,1,'2016-02-20 10:58:03'),(1,58,7,100,3,1,'2016-02-20 10:58:03'),(1,58,7,101,1,1,'2016-02-20 10:58:04'),(1,58,7,101,2,1,'2016-02-20 10:58:04'),(1,58,7,101,3,1,'2016-02-20 10:58:04'),(1,58,7,102,1,1,'2016-02-20 10:58:04'),(1,58,7,102,2,1,'2016-02-20 10:58:04'),(1,58,7,102,3,1,'2016-02-20 10:58:04'),(1,58,7,103,1,1,'2016-02-20 10:58:04'),(1,58,7,103,2,1,'2016-02-20 10:58:04'),(1,58,7,103,3,1,'2016-02-20 10:58:04'),(1,58,8,100,1,1,'2016-02-20 10:58:04'),(1,58,8,100,2,1,'2016-02-20 10:58:04'),(1,58,8,100,3,1,'2016-02-20 10:58:04'),(1,58,8,101,1,1,'2016-02-20 10:58:04'),(1,58,8,101,2,1,'2016-02-20 10:58:04'),(1,58,8,101,3,1,'2016-02-20 10:58:04'),(1,58,8,102,1,1,'2016-02-20 10:58:04'),(1,58,8,102,2,1,'2016-02-20 10:58:04'),(1,58,8,102,3,1,'2016-02-20 10:58:04'),(1,58,8,103,1,1,'2016-02-20 10:58:05'),(1,58,8,103,2,1,'2016-02-20 10:58:05'),(1,58,8,103,3,1,'2016-02-20 10:58:05'),(1,58,9,100,1,1,'2016-02-20 10:58:05'),(1,58,9,100,2,1,'2016-02-20 10:58:05'),(1,58,9,100,3,1,'2016-02-20 10:58:05'),(1,58,9,101,1,1,'2016-02-20 10:58:05'),(1,58,9,101,2,1,'2016-02-20 10:58:05'),(1,58,9,101,3,1,'2016-02-20 10:58:05'),(1,58,9,102,1,1,'2016-02-20 10:58:05'),(1,58,9,102,2,1,'2016-02-20 10:58:05'),(1,58,9,102,3,1,'2016-02-20 10:58:05'),(1,58,9,103,1,1,'2016-02-20 10:58:05'),(1,58,9,103,2,1,'2016-02-20 10:58:05'),(1,58,9,103,3,1,'2016-02-20 10:58:05'),(1,58,10,100,1,1,'2016-02-20 10:58:06'),(1,58,10,100,2,1,'2016-02-20 10:58:06'),(1,58,10,100,3,1,'2016-02-20 10:58:06'),(1,58,10,101,1,1,'2016-02-20 10:58:06'),(1,58,10,101,2,1,'2016-02-20 10:58:06'),(1,58,10,101,3,1,'2016-02-20 10:58:06'),(1,58,10,102,1,1,'2016-02-20 10:58:06'),(1,58,10,102,2,1,'2016-02-20 10:58:06'),(1,58,10,102,3,1,'2016-02-20 10:58:06'),(1,58,10,103,1,1,'2016-02-20 10:58:06'),(1,58,10,103,2,1,'2016-02-20 10:58:06'),(1,58,10,103,3,1,'2016-02-20 10:58:06'),(1,58,11,100,1,1,'2016-02-20 10:58:06'),(1,58,11,100,2,1,'2016-02-20 10:58:06'),(1,58,11,100,3,1,'2016-02-20 10:58:06'),(1,58,11,101,1,1,'2016-02-20 10:58:06'),(1,58,11,101,2,1,'2016-02-20 10:58:07'),(1,58,11,101,3,1,'2016-02-20 10:58:07'),(1,58,11,102,1,1,'2016-02-20 10:58:07'),(1,58,11,102,2,1,'2016-02-20 10:58:07'),(1,58,11,102,3,1,'2016-02-20 10:58:07'),(1,58,11,103,1,1,'2016-02-20 10:58:07'),(1,58,11,103,2,1,'2016-02-20 10:58:07'),(1,58,11,103,3,1,'2016-02-20 10:58:07'),(1,58,12,100,1,1,'2016-02-20 10:58:07'),(1,58,12,100,2,1,'2016-02-20 10:58:07'),(1,58,12,100,3,1,'2016-02-20 10:58:07'),(1,58,12,101,1,1,'2016-02-20 10:58:07'),(1,58,12,101,2,1,'2016-02-20 10:58:07'),(1,58,12,101,3,1,'2016-02-20 10:58:07'),(1,58,12,102,1,1,'2016-02-20 10:58:07'),(1,58,12,102,2,1,'2016-02-20 10:58:08'),(1,58,12,102,3,1,'2016-02-20 10:58:08'),(1,58,12,103,1,1,'2016-02-20 10:58:08'),(1,58,12,103,2,1,'2016-02-20 10:58:08'),(1,58,12,103,3,1,'2016-02-20 10:58:08'),(1,58,13,100,1,1,'2016-02-20 10:58:08'),(1,58,13,100,2,1,'2016-02-20 10:58:08'),(1,58,13,100,3,1,'2016-02-20 10:58:08'),(1,58,13,101,1,1,'2016-02-20 10:58:08'),(1,58,13,101,2,1,'2016-02-20 10:58:08'),(1,58,13,101,3,1,'2016-02-20 10:58:08'),(1,58,13,102,1,1,'2016-02-20 10:58:08'),(1,58,13,102,2,1,'2016-02-20 10:58:08'),(1,58,13,102,3,1,'2016-02-20 10:58:08'),(1,58,13,103,1,1,'2016-02-20 10:58:08'),(1,58,13,103,2,1,'2016-02-20 10:58:08'),(1,58,13,103,3,1,'2016-02-20 10:58:09'),(1,58,14,100,1,1,'2016-02-20 10:58:09'),(1,58,14,100,2,1,'2016-02-20 10:58:09'),(1,58,14,100,3,1,'2016-02-20 10:58:09'),(1,58,14,101,1,1,'2016-02-20 10:58:09'),(1,58,14,101,2,1,'2016-02-20 10:58:09'),(1,58,14,101,3,1,'2016-02-20 10:58:09'),(1,58,14,102,1,1,'2016-02-20 10:58:09'),(1,58,14,102,2,1,'2016-02-20 10:58:09'),(1,58,14,102,3,1,'2016-02-20 10:58:09'),(1,58,14,103,1,1,'2016-02-20 10:58:09'),(1,58,14,103,2,1,'2016-02-20 10:58:09'),(1,58,14,103,3,1,'2016-02-20 10:58:09'),(1,58,15,100,1,1,'2016-02-20 10:58:10'),(1,58,15,100,2,1,'2016-02-20 10:58:10'),(1,58,15,100,3,1,'2016-02-20 10:58:10'),(1,58,15,101,1,1,'2016-02-20 10:58:10'),(1,58,15,101,2,1,'2016-02-20 10:58:10'),(1,58,15,101,3,1,'2016-02-20 10:58:10'),(1,58,15,102,1,1,'2016-02-20 10:58:10'),(1,58,15,102,2,1,'2016-02-20 10:58:10'),(1,58,15,102,3,1,'2016-02-20 10:58:10'),(1,58,15,103,1,1,'2016-02-20 10:58:10'),(1,58,15,103,2,1,'2016-02-20 10:58:10'),(1,58,15,103,3,1,'2016-02-20 10:58:10'),(1,58,16,100,1,1,'2016-02-20 10:58:10'),(1,58,16,100,2,1,'2016-02-20 10:58:10'),(1,58,16,100,3,1,'2016-02-20 10:58:10'),(1,58,16,101,1,1,'2016-02-20 10:58:10'),(1,58,16,101,2,1,'2016-02-20 10:58:10'),(1,58,16,101,3,1,'2016-02-20 10:58:11'),(1,58,16,102,1,1,'2016-02-20 10:58:11'),(1,58,16,102,2,1,'2016-02-20 10:58:11'),(1,58,16,102,3,1,'2016-02-20 10:58:11'),(1,58,16,103,1,1,'2016-02-20 10:58:11'),(1,58,16,103,2,1,'2016-02-20 10:58:11'),(1,58,16,103,3,1,'2016-02-20 10:58:11'),(1,58,17,100,1,1,'2016-02-20 10:58:11'),(1,58,17,100,2,1,'2016-02-20 10:58:11'),(1,58,17,100,3,1,'2016-02-20 10:58:11'),(1,58,17,101,1,1,'2016-02-20 10:58:11'),(1,58,17,101,2,1,'2016-02-20 10:58:11'),(1,58,17,101,3,1,'2016-02-20 10:58:11'),(1,58,17,102,1,1,'2016-02-20 10:58:11'),(1,58,17,102,2,1,'2016-02-20 10:58:11'),(1,58,17,102,3,1,'2016-02-20 10:58:12'),(1,58,17,103,1,1,'2016-02-20 10:58:12'),(1,58,17,103,2,1,'2016-02-20 10:58:12'),(1,58,17,103,3,1,'2016-02-20 10:58:12'),(1,58,18,100,1,1,'2016-02-20 10:58:12'),(1,58,18,100,2,1,'2016-02-20 10:58:12'),(1,58,18,100,3,1,'2016-02-20 10:58:12'),(1,58,18,101,1,1,'2016-02-20 10:58:12'),(1,58,18,101,2,1,'2016-02-20 10:58:12'),(1,58,18,101,3,1,'2016-02-20 10:58:12'),(1,58,18,102,1,1,'2016-02-20 10:58:12'),(1,58,18,102,2,1,'2016-02-20 10:58:12'),(1,58,18,102,3,1,'2016-02-20 10:58:12'),(1,58,18,103,1,1,'2016-02-20 10:58:12'),(1,58,18,103,2,1,'2016-02-20 10:58:12'),(1,58,18,103,3,1,'2016-02-20 10:58:12'),(1,58,19,100,1,1,'2016-02-20 10:58:13'),(1,58,19,100,2,1,'2016-02-20 10:58:13'),(1,58,19,100,3,1,'2016-02-20 10:58:13'),(1,58,19,101,1,1,'2016-02-20 10:58:13'),(1,58,19,101,2,1,'2016-02-20 10:58:13'),(1,58,19,101,3,1,'2016-02-20 10:58:13'),(1,58,19,102,1,1,'2016-02-20 10:58:13'),(1,58,19,102,2,1,'2016-02-20 10:58:13'),(1,58,19,102,3,1,'2016-02-20 10:58:13'),(1,58,19,103,1,1,'2016-02-20 10:58:13'),(1,58,19,103,2,1,'2016-02-20 10:58:13'),(1,58,19,103,3,1,'2016-02-20 10:58:13'),(1,58,20,100,1,1,'2016-02-20 10:58:13'),(1,58,20,100,2,1,'2016-02-20 10:58:13'),(1,58,20,100,3,1,'2016-02-20 10:58:13'),(1,58,20,101,1,1,'2016-02-20 10:58:14'),(1,58,20,101,2,1,'2016-02-20 10:58:14'),(1,58,20,101,3,1,'2016-02-20 10:58:14'),(1,58,20,102,1,1,'2016-02-20 10:58:14'),(1,58,20,102,2,1,'2016-02-20 10:58:14'),(1,58,20,102,3,1,'2016-02-20 10:58:14'),(1,58,20,103,1,1,'2016-02-20 10:58:14'),(1,58,20,103,2,1,'2016-02-20 10:58:14'),(1,58,20,103,3,1,'2016-02-20 10:58:14'),(1,58,21,100,1,1,'2016-02-20 10:58:14'),(1,58,21,100,2,1,'2016-02-20 10:58:14'),(1,58,21,100,3,1,'2016-02-20 10:58:14'),(1,58,21,101,1,1,'2016-02-20 10:58:14'),(1,58,21,101,2,1,'2016-02-20 10:58:14'),(1,58,21,101,3,1,'2016-02-20 10:58:14'),(1,58,21,102,1,1,'2016-02-20 10:58:14'),(1,58,21,102,2,1,'2016-02-20 10:58:15'),(1,58,21,102,3,1,'2016-02-20 10:58:15'),(1,58,21,103,1,1,'2016-02-20 10:58:15'),(1,58,21,103,2,1,'2016-02-20 10:58:15'),(1,58,21,103,3,1,'2016-02-20 10:58:15'),(1,58,22,100,1,1,'2016-02-20 10:58:15'),(1,58,22,100,2,1,'2016-02-20 10:58:15'),(1,58,22,100,3,1,'2016-02-20 10:58:15'),(1,58,22,101,1,1,'2016-02-20 10:58:15'),(1,58,22,101,2,1,'2016-02-20 10:58:15'),(1,58,22,101,3,1,'2016-02-20 10:58:15'),(1,58,22,102,1,1,'2016-02-20 10:58:15'),(1,58,22,102,2,1,'2016-02-20 10:58:15'),(1,58,22,102,3,1,'2016-02-20 10:58:15'),(1,58,22,103,1,1,'2016-02-20 10:58:15'),(1,58,22,103,2,1,'2016-02-20 10:58:15'),(1,58,22,103,3,1,'2016-02-20 10:58:15'),(1,58,23,100,1,1,'2016-02-20 10:58:16'),(1,58,23,100,2,1,'2016-02-20 10:58:16'),(1,58,23,100,3,1,'2016-02-20 10:58:16'),(1,58,23,101,1,1,'2016-02-20 10:58:16'),(1,58,23,101,2,1,'2016-02-20 10:58:16'),(1,58,23,101,3,1,'2016-02-20 10:58:16'),(1,58,23,102,1,1,'2016-02-20 10:58:16'),(1,58,23,102,2,1,'2016-02-20 10:58:16'),(1,58,23,102,3,1,'2016-02-20 10:58:16'),(1,58,23,103,1,1,'2016-02-20 10:58:16'),(1,58,23,103,2,1,'2016-02-20 10:58:16'),(1,58,23,103,3,1,'2016-02-20 10:58:16'),(1,58,24,100,1,1,'2016-02-20 10:58:16'),(1,58,24,100,2,1,'2016-02-20 10:58:17'),(1,58,24,100,3,1,'2016-02-20 10:58:17'),(1,58,24,101,1,1,'2016-02-20 10:58:17'),(1,58,24,101,2,1,'2016-02-20 10:58:17'),(1,58,24,101,3,1,'2016-02-20 10:58:17'),(1,58,24,102,1,1,'2016-02-20 10:58:17'),(1,58,24,102,2,1,'2016-02-20 10:58:17'),(1,58,24,102,3,1,'2016-02-20 10:58:17'),(1,58,24,103,1,1,'2016-02-20 10:58:17'),(1,58,24,103,2,1,'2016-02-20 10:58:17'),(1,58,24,103,3,1,'2016-02-20 10:58:17'),(1,58,25,100,1,1,'2016-02-20 10:58:17'),(1,58,25,100,2,1,'2016-02-20 10:58:17'),(1,58,25,100,3,1,'2016-02-20 10:58:17'),(1,58,25,101,1,1,'2016-02-20 10:58:17'),(1,58,25,101,2,1,'2016-02-20 10:58:17'),(1,58,25,101,3,1,'2016-02-20 10:58:17'),(1,58,25,102,1,1,'2016-02-20 10:58:18'),(1,58,25,102,2,1,'2016-02-20 10:58:18'),(1,58,25,102,3,1,'2016-02-20 10:58:18'),(1,58,25,103,1,1,'2016-02-20 10:58:18'),(1,58,25,103,2,1,'2016-02-20 10:58:18'),(1,58,25,103,3,1,'2016-02-20 10:58:18'),(1,58,26,100,1,1,'2016-02-20 10:58:18'),(1,58,26,100,2,1,'2016-02-20 10:58:18'),(1,58,26,100,3,1,'2016-02-20 10:58:18'),(1,58,26,101,1,1,'2016-02-20 10:58:18'),(1,58,26,101,2,1,'2016-02-20 10:58:18'),(1,58,26,101,3,1,'2016-02-20 10:58:18'),(1,58,26,102,1,1,'2016-02-20 10:58:18'),(1,58,26,102,2,1,'2016-02-20 10:58:18'),(1,58,26,102,3,1,'2016-02-20 10:58:18'),(1,58,26,103,1,1,'2016-02-20 10:58:18'),(1,58,26,103,2,1,'2016-02-20 10:58:19'),(1,58,26,103,3,1,'2016-02-20 10:58:19'),(1,58,27,100,1,1,'2016-02-20 10:58:19'),(1,58,27,100,2,1,'2016-02-20 10:58:19'),(1,58,27,100,3,1,'2016-02-20 10:58:19'),(1,58,27,101,1,1,'2016-02-20 10:58:19'),(1,58,27,101,2,1,'2016-02-20 10:58:19'),(1,58,27,101,3,1,'2016-02-20 10:58:19'),(1,58,27,102,1,1,'2016-02-20 10:58:19'),(1,58,27,102,2,1,'2016-02-20 10:58:19'),(1,58,27,102,3,1,'2016-02-20 10:58:19'),(1,58,27,103,1,1,'2016-02-20 10:58:19'),(1,58,27,103,2,1,'2016-02-20 10:58:19'),(1,58,27,103,3,1,'2016-02-20 10:58:19'),(1,58,28,100,1,1,'2016-02-20 10:58:19'),(1,58,28,100,2,1,'2016-02-20 10:58:20'),(1,58,28,100,3,1,'2016-02-20 10:58:20'),(1,58,28,101,1,1,'2016-02-20 10:58:20'),(1,58,28,101,2,1,'2016-02-20 10:58:20'),(1,58,28,101,3,1,'2016-02-20 10:58:20'),(1,58,28,102,1,1,'2016-02-20 10:58:20'),(1,58,28,102,2,1,'2016-02-20 10:58:20'),(1,58,28,102,3,1,'2016-02-20 10:58:20'),(1,58,28,103,1,1,'2016-02-20 10:58:20'),(1,58,28,103,2,1,'2016-02-20 10:58:20'),(1,58,28,103,3,1,'2016-02-20 10:58:20'),(1,58,29,100,1,1,'2016-02-20 10:58:20'),(1,58,29,100,2,1,'2016-02-20 10:58:20'),(1,58,29,100,3,1,'2016-02-20 10:58:20'),(1,58,29,101,1,1,'2016-02-20 10:58:20'),(1,58,29,101,2,1,'2016-02-20 10:58:20'),(1,58,29,101,3,1,'2016-02-20 10:58:21'),(1,58,29,102,1,1,'2016-02-20 10:58:21'),(1,58,29,102,2,1,'2016-02-20 10:58:21'),(1,58,29,102,3,1,'2016-02-20 10:58:21'),(1,58,29,103,1,1,'2016-02-20 10:58:21'),(1,58,29,103,2,1,'2016-02-20 10:58:21'),(1,58,29,103,3,1,'2016-02-20 10:58:21'),(1,58,30,100,1,1,'2016-02-20 10:58:21'),(1,58,30,100,2,1,'2016-02-20 10:58:21'),(1,58,30,100,3,1,'2016-02-20 10:58:21'),(1,58,30,101,1,1,'2016-02-20 10:58:21'),(1,58,30,101,2,1,'2016-02-20 10:58:21'),(1,58,30,101,3,1,'2016-02-20 10:58:21'),(1,58,30,102,1,1,'2016-02-20 10:58:21'),(1,58,30,102,2,1,'2016-02-20 10:58:22'),(1,58,30,102,3,1,'2016-02-20 10:58:22'),(1,58,30,103,1,1,'2016-02-20 10:58:22'),(1,58,30,103,2,1,'2016-02-20 10:58:22'),(1,58,30,103,3,1,'2016-02-20 10:58:22'),(1,58,31,100,1,1,'2016-02-20 10:58:22'),(1,58,31,100,2,1,'2016-02-20 10:58:22'),(1,58,31,100,3,1,'2016-02-20 10:58:22'),(1,58,31,101,1,1,'2016-02-20 10:58:22'),(1,58,31,101,2,1,'2016-02-20 10:58:22'),(1,58,31,101,3,1,'2016-02-20 10:58:22'),(1,58,31,102,1,1,'2016-02-20 10:58:22'),(1,58,31,102,2,1,'2016-02-20 10:58:22'),(1,58,31,102,3,1,'2016-02-20 10:58:22'),(1,58,31,103,1,1,'2016-02-20 10:58:22'),(1,58,31,103,2,1,'2016-02-20 10:58:23'),(1,58,31,103,3,1,'2016-02-20 10:58:23'),(1,58,32,100,1,1,'2016-02-20 10:58:23'),(1,58,32,100,2,1,'2016-02-20 10:58:23'),(1,58,32,100,3,1,'2016-02-20 10:58:23'),(1,58,32,101,1,1,'2016-02-20 10:58:23'),(1,58,32,101,2,1,'2016-02-20 10:58:23'),(1,58,32,101,3,1,'2016-02-20 10:58:23'),(1,58,32,102,1,1,'2016-02-20 10:58:23'),(1,58,32,102,2,1,'2016-02-20 10:58:23'),(1,58,32,102,3,1,'2016-02-20 10:58:23'),(1,58,32,103,1,1,'2016-02-20 10:58:23'),(1,58,32,103,2,1,'2016-02-20 10:58:23'),(1,58,32,103,3,1,'2016-02-20 10:58:23'),(1,58,33,100,1,1,'2016-02-20 10:58:24'),(1,58,33,100,2,1,'2016-02-20 10:58:24'),(1,58,33,100,3,1,'2016-02-20 10:58:24'),(1,58,33,101,1,1,'2016-02-20 10:58:24'),(1,58,33,101,2,1,'2016-02-20 10:58:24'),(1,58,33,101,3,1,'2016-02-20 10:58:24'),(1,58,33,102,1,1,'2016-02-20 10:58:24'),(1,58,33,102,2,1,'2016-02-20 10:58:24'),(1,58,33,102,3,1,'2016-02-20 10:58:24'),(1,58,33,103,1,1,'2016-02-20 10:58:24'),(1,58,33,103,2,1,'2016-02-20 10:58:24'),(1,58,33,103,3,1,'2016-02-20 10:58:24'),(1,58,34,100,1,1,'2016-02-20 10:58:25'),(1,58,34,100,2,1,'2016-02-20 10:58:25'),(1,58,34,100,3,1,'2016-02-20 10:58:25'),(1,58,34,101,1,1,'2016-02-20 10:58:25'),(1,58,34,101,2,1,'2016-02-20 10:58:25'),(1,58,34,101,3,1,'2016-02-20 10:58:25'),(1,58,34,102,1,1,'2016-02-20 10:58:25'),(1,58,34,102,2,1,'2016-02-20 10:58:25'),(1,58,34,102,3,1,'2016-02-20 10:58:25'),(1,58,34,103,1,1,'2016-02-20 10:58:25'),(1,58,34,103,2,1,'2016-02-20 10:58:25'),(1,58,34,103,3,1,'2016-02-20 10:58:25'),(1,58,35,100,1,1,'2016-02-20 10:58:25'),(1,58,35,100,2,1,'2016-02-20 10:58:25'),(1,58,35,100,3,1,'2016-02-20 10:58:25'),(1,58,35,101,1,1,'2016-02-20 10:58:26'),(1,58,35,101,2,1,'2016-02-20 10:58:26'),(1,58,35,101,3,1,'2016-02-20 10:58:26'),(1,58,35,102,1,1,'2016-02-20 10:58:26'),(1,58,35,102,2,1,'2016-02-20 10:58:26'),(1,58,35,102,3,1,'2016-02-20 10:58:26'),(1,58,35,103,1,1,'2016-02-20 10:58:26'),(1,58,35,103,2,1,'2016-02-20 10:58:26'),(1,58,35,103,3,1,'2016-02-20 10:58:26'),(1,58,36,100,1,1,'2016-02-20 10:58:26'),(1,58,36,100,2,1,'2016-02-20 10:58:26'),(1,58,36,100,3,1,'2016-02-20 10:58:27'),(1,58,36,101,1,1,'2016-02-20 10:58:27'),(1,58,36,101,2,1,'2016-02-20 10:58:27'),(1,58,36,101,3,1,'2016-02-20 10:58:27'),(1,58,36,102,1,1,'2016-02-20 10:58:27'),(1,58,36,102,2,1,'2016-02-20 10:58:27'),(1,58,36,102,3,1,'2016-02-20 10:58:27'),(1,58,36,103,1,1,'2016-02-20 10:58:27'),(1,58,36,103,2,1,'2016-02-20 10:58:27'),(1,58,36,103,3,1,'2016-02-20 10:58:27'),(1,58,37,100,1,1,'2016-02-20 10:58:27'),(1,58,37,100,2,1,'2016-02-20 10:58:27'),(1,58,37,100,3,1,'2016-02-20 10:58:27'),(1,58,37,101,1,1,'2016-02-20 10:58:27'),(1,58,37,101,2,1,'2016-02-20 10:58:28'),(1,58,37,101,3,1,'2016-02-20 10:58:28'),(1,58,37,102,1,1,'2016-02-20 10:58:28'),(1,58,37,102,2,1,'2016-02-20 10:58:28'),(1,58,37,102,3,1,'2016-02-20 10:58:28'),(1,58,37,103,1,1,'2016-02-20 10:58:28'),(1,58,37,103,2,1,'2016-02-20 10:58:28'),(1,58,37,103,3,1,'2016-02-20 10:58:28'),(1,58,38,100,1,1,'2016-02-20 10:58:28'),(1,58,38,100,2,1,'2016-02-20 10:58:28'),(1,58,38,100,3,1,'2016-02-20 10:58:28'),(1,58,38,101,1,1,'2016-02-20 10:58:28'),(1,58,38,101,2,1,'2016-02-20 10:58:28'),(1,58,38,101,3,1,'2016-02-20 10:58:29'),(1,58,38,102,1,1,'2016-02-20 10:58:29'),(1,58,38,102,2,1,'2016-02-20 10:58:29'),(1,58,38,102,3,1,'2016-02-20 10:58:29'),(1,58,38,103,1,1,'2016-02-20 10:58:29'),(1,58,38,103,2,1,'2016-02-20 10:58:29'),(1,58,38,103,3,1,'2016-02-20 10:58:29'),(1,58,39,100,1,1,'2016-02-20 10:58:29'),(1,58,39,100,2,1,'2016-02-20 10:58:29'),(1,58,39,100,3,1,'2016-02-20 10:58:29'),(1,58,39,101,1,1,'2016-02-20 10:58:29'),(1,58,39,101,2,1,'2016-02-20 10:58:29'),(1,58,39,101,3,1,'2016-02-20 10:58:29'),(1,58,39,102,1,1,'2016-02-20 10:58:29'),(1,58,39,102,2,1,'2016-02-20 10:58:30'),(1,58,39,102,3,1,'2016-02-20 10:58:30'),(1,58,39,103,1,1,'2016-02-20 10:58:30'),(1,58,39,103,2,1,'2016-02-20 10:58:30'),(1,58,39,103,3,1,'2016-02-20 10:58:30'),(1,58,40,100,1,1,'2016-02-20 10:58:30'),(1,58,40,100,2,1,'2016-02-20 10:58:30'),(1,58,40,100,3,1,'2016-02-20 10:58:30'),(1,58,40,101,1,1,'2016-02-20 10:58:30'),(1,58,40,101,2,1,'2016-02-20 10:58:30'),(1,58,40,101,3,1,'2016-02-20 10:58:30'),(1,58,40,102,1,1,'2016-02-20 10:58:30'),(1,58,40,102,2,1,'2016-02-20 10:58:30'),(1,58,40,102,3,1,'2016-02-20 10:58:30'),(1,58,40,103,1,1,'2016-02-20 10:58:31'),(1,58,40,103,2,1,'2016-02-20 10:58:31'),(1,58,40,103,3,1,'2016-02-20 10:58:31'),(1,58,41,100,1,1,'2016-02-20 10:58:31'),(1,58,41,100,2,1,'2016-02-20 10:58:31'),(1,58,41,100,3,1,'2016-02-20 10:58:31'),(1,58,41,101,1,1,'2016-02-20 10:58:31'),(1,58,41,101,2,1,'2016-02-20 10:58:31'),(1,58,41,101,3,1,'2016-02-20 10:58:31'),(1,58,41,102,1,1,'2016-02-20 10:58:31'),(1,58,41,102,2,1,'2016-02-20 10:58:31'),(1,58,41,102,3,1,'2016-02-20 10:58:31'),(1,58,41,103,1,1,'2016-02-20 10:58:31'),(1,58,41,103,2,1,'2016-02-20 10:58:32'),(1,58,41,103,3,1,'2016-02-20 10:58:32'),(1,58,42,100,1,1,'2016-02-20 10:58:32'),(1,58,42,100,2,1,'2016-02-20 10:58:32'),(1,58,42,100,3,1,'2016-02-20 10:58:32'),(1,58,42,101,1,1,'2016-02-20 10:58:32'),(1,58,42,101,2,1,'2016-02-20 10:58:32'),(1,58,42,101,3,1,'2016-02-20 10:58:32'),(1,58,42,102,1,1,'2016-02-20 10:58:32'),(1,58,42,102,2,1,'2016-02-20 10:58:32'),(1,58,42,102,3,1,'2016-02-20 10:58:32'),(1,58,42,103,1,1,'2016-02-20 10:58:32'),(1,58,42,103,2,1,'2016-02-20 10:58:32'),(1,58,42,103,3,1,'2016-02-20 10:58:32'),(1,58,43,100,1,1,'2016-02-20 10:58:33'),(1,58,43,100,2,1,'2016-02-20 10:58:33'),(1,58,43,100,3,1,'2016-02-20 10:58:33'),(1,58,43,101,1,1,'2016-02-20 10:58:33'),(1,58,43,101,2,1,'2016-02-20 10:58:33'),(1,58,43,101,3,1,'2016-02-20 10:58:33'),(1,58,43,102,1,1,'2016-02-20 10:58:33'),(1,58,43,102,2,1,'2016-02-20 10:58:33'),(1,58,43,102,3,1,'2016-02-20 10:58:33'),(1,58,43,103,1,1,'2016-02-20 10:58:33'),(1,58,43,103,2,1,'2016-02-20 10:58:33'),(1,58,43,103,3,1,'2016-02-20 10:58:34'),(1,58,44,100,1,1,'2016-02-20 10:58:34'),(1,58,44,100,2,1,'2016-02-20 10:58:34'),(1,58,44,100,3,1,'2016-02-20 10:58:34'),(1,58,44,101,1,1,'2016-02-20 10:58:34'),(1,58,44,101,2,1,'2016-02-20 10:58:34'),(1,58,44,101,3,1,'2016-02-20 10:58:34'),(1,58,44,102,1,1,'2016-02-20 10:58:34'),(1,58,44,102,2,1,'2016-02-20 10:58:34'),(1,58,44,102,3,1,'2016-02-20 10:58:34'),(1,58,44,103,1,1,'2016-02-20 10:58:34'),(1,58,44,103,2,1,'2016-02-20 10:58:34'),(1,58,44,103,3,1,'2016-02-20 10:58:35'),(1,58,45,100,1,1,'2016-02-20 10:58:35'),(1,58,45,100,2,1,'2016-02-20 10:58:35'),(1,58,45,100,3,1,'2016-02-20 10:58:35'),(1,58,45,101,1,1,'2016-02-20 10:58:35'),(1,58,45,101,2,1,'2016-02-20 10:58:35'),(1,58,45,101,3,1,'2016-02-20 10:58:35'),(1,58,45,102,1,1,'2016-02-20 10:58:35'),(1,58,45,102,2,1,'2016-02-20 10:58:35'),(1,58,45,102,3,1,'2016-02-20 10:58:35'),(1,58,45,103,1,1,'2016-02-20 10:58:35'),(1,58,45,103,2,1,'2016-02-20 10:58:35'),(1,58,45,103,3,1,'2016-02-20 10:58:36'),(1,58,46,100,1,1,'2016-02-20 10:58:36'),(1,58,46,100,2,1,'2016-02-20 10:58:36'),(1,58,46,100,3,1,'2016-02-20 10:58:36'),(1,58,46,101,1,1,'2016-02-20 10:58:36'),(1,58,46,101,2,1,'2016-02-20 10:58:36'),(1,58,46,101,3,1,'2016-02-20 10:58:36'),(1,58,46,102,1,1,'2016-02-20 10:58:36'),(1,58,46,102,2,1,'2016-02-20 10:58:36'),(1,58,46,102,3,1,'2016-02-20 10:58:36'),(1,58,46,103,1,1,'2016-02-20 10:58:36'),(1,58,46,103,2,1,'2016-02-20 10:58:36'),(1,58,46,103,3,1,'2016-02-20 10:58:37'),(1,58,47,100,1,1,'2016-02-20 10:58:37'),(1,58,47,100,2,1,'2016-02-20 10:58:37'),(1,58,47,100,3,1,'2016-02-20 10:58:37'),(1,58,47,101,1,1,'2016-02-20 10:58:37'),(1,58,47,101,2,1,'2016-02-20 10:58:37'),(1,58,47,101,3,1,'2016-02-20 10:58:37'),(1,58,47,102,1,1,'2016-02-20 10:58:37'),(1,58,47,102,2,1,'2016-02-20 10:58:37'),(1,58,47,102,3,1,'2016-02-20 10:58:37'),(1,58,47,103,1,1,'2016-02-20 10:58:37'),(1,58,47,103,2,1,'2016-02-20 10:58:37'),(1,58,47,103,3,1,'2016-02-20 10:58:37'),(1,58,48,100,1,1,'2016-02-20 10:58:38'),(1,58,48,100,2,1,'2016-02-20 10:58:38'),(1,58,48,100,3,1,'2016-02-20 10:58:38'),(1,58,48,101,1,1,'2016-02-20 10:58:38'),(1,58,48,101,2,1,'2016-02-20 10:58:38'),(1,58,48,101,3,1,'2016-02-20 10:58:38'),(1,58,48,102,1,1,'2016-02-20 10:58:38'),(1,58,48,102,2,1,'2016-02-20 10:58:38'),(1,58,48,102,3,1,'2016-02-20 10:58:38'),(1,58,48,103,1,1,'2016-02-20 10:58:38'),(1,58,48,103,2,1,'2016-02-20 10:58:38'),(1,58,48,103,3,1,'2016-02-20 10:58:38'),(1,58,0,200,1,1,'2016-02-20 10:58:40'),(1,58,1,200,1,1,'2016-02-20 10:58:40'),(1,58,1,200,2,1,'2016-02-20 10:58:40'),(1,59,1,100,1,1,'2016-02-20 12:41:22'),(1,59,1,100,2,1,'2016-02-20 12:41:22'),(1,59,1,100,3,1,'2016-02-20 12:41:22'),(1,59,1,101,1,1,'2016-02-20 12:41:22'),(1,59,1,101,2,1,'2016-02-20 12:41:22'),(1,59,1,101,3,1,'2016-02-20 12:41:22'),(1,59,1,102,1,1,'2016-02-20 12:41:22'),(1,59,1,102,2,1,'2016-02-20 12:41:22'),(1,59,1,102,3,1,'2016-02-20 12:41:22'),(1,59,1,103,1,1,'2016-02-20 12:41:22'),(1,59,1,103,2,1,'2016-02-20 12:41:22'),(1,59,1,103,3,1,'2016-02-20 12:41:22'),(1,59,0,200,1,1,'2016-02-20 12:41:25'),(1,59,1,200,1,1,'2016-02-20 12:41:26'),(1,59,1,200,2,1,'2016-02-20 12:41:26'),(1,60,1,100,1,1,'2016-02-20 13:16:16'),(1,60,1,100,2,1,'2016-02-20 13:16:16'),(1,60,1,100,3,1,'2016-02-20 13:16:16'),(1,60,1,101,1,1,'2016-02-20 13:16:16'),(1,60,1,101,2,1,'2016-02-20 13:16:16'),(1,60,1,101,3,1,'2016-02-20 13:16:16'),(1,60,1,102,1,1,'2016-02-20 13:16:16'),(1,60,1,102,2,1,'2016-02-20 13:16:16'),(1,60,1,102,3,1,'2016-02-20 13:16:16'),(1,60,1,103,1,1,'2016-02-20 13:16:17'),(1,60,1,103,2,1,'2016-02-20 13:16:17'),(1,60,1,103,3,1,'2016-02-20 13:16:17'),(1,60,2,100,1,1,'2016-02-20 13:16:17'),(1,60,2,100,2,1,'2016-02-20 13:16:17'),(1,60,2,100,3,1,'2016-02-20 13:16:17'),(1,60,2,101,1,1,'2016-02-20 13:16:17'),(1,60,2,101,2,1,'2016-02-20 13:16:18'),(1,60,2,101,3,1,'2016-02-20 13:16:18'),(1,60,2,102,1,1,'2016-02-20 13:16:18'),(1,60,2,102,2,1,'2016-02-20 13:16:18'),(1,60,2,102,3,1,'2016-02-20 13:16:18'),(1,60,2,103,1,1,'2016-02-20 13:16:18'),(1,60,2,103,2,1,'2016-02-20 13:16:18'),(1,60,2,103,3,1,'2016-02-20 13:16:18'),(1,60,3,100,1,1,'2016-02-20 13:16:18'),(1,60,3,100,2,1,'2016-02-20 13:16:18'),(1,60,3,100,3,1,'2016-02-20 13:16:18'),(1,60,3,101,1,1,'2016-02-20 13:16:18'),(1,60,3,101,2,1,'2016-02-20 13:16:18'),(1,60,3,101,3,1,'2016-02-20 13:16:18'),(1,60,3,102,1,1,'2016-02-20 13:16:18'),(1,60,3,102,2,1,'2016-02-20 13:16:18'),(1,60,3,102,3,1,'2016-02-20 13:16:18'),(1,60,3,103,1,1,'2016-02-20 13:16:19'),(1,60,3,103,2,1,'2016-02-20 13:16:19'),(1,60,3,103,3,1,'2016-02-20 13:16:19'),(1,60,4,100,1,1,'2016-02-20 13:16:19'),(1,60,4,100,2,1,'2016-02-20 13:16:19'),(1,60,4,100,3,1,'2016-02-20 13:16:19'),(1,60,4,101,1,1,'2016-02-20 13:16:19'),(1,60,4,101,2,1,'2016-02-20 13:16:19'),(1,60,4,101,3,1,'2016-02-20 13:16:19'),(1,60,4,102,1,1,'2016-02-20 13:16:19'),(1,60,4,102,2,1,'2016-02-20 13:16:19'),(1,60,4,102,3,1,'2016-02-20 13:16:19'),(1,60,4,103,1,1,'2016-02-20 13:16:19'),(1,60,4,103,2,1,'2016-02-20 13:16:19'),(1,60,4,103,3,1,'2016-02-20 13:16:19'),(1,60,5,100,1,1,'2016-02-20 13:16:20'),(1,60,5,100,2,1,'2016-02-20 13:16:20'),(1,60,5,100,3,1,'2016-02-20 13:16:20'),(1,60,5,101,1,1,'2016-02-20 13:16:20'),(1,60,5,101,2,1,'2016-02-20 13:16:20'),(1,60,5,101,3,1,'2016-02-20 13:16:20'),(1,60,5,102,1,1,'2016-02-20 13:16:20'),(1,60,5,102,2,1,'2016-02-20 13:16:20'),(1,60,5,102,3,1,'2016-02-20 13:16:20'),(1,60,5,103,1,1,'2016-02-20 13:16:20'),(1,60,5,103,2,1,'2016-02-20 13:16:20'),(1,60,5,103,3,1,'2016-02-20 13:16:20'),(1,60,6,100,1,1,'2016-02-20 13:16:21'),(1,60,6,100,2,1,'2016-02-20 13:16:21'),(1,60,6,100,3,1,'2016-02-20 13:16:21'),(1,60,6,101,1,1,'2016-02-20 13:16:21'),(1,60,6,101,2,1,'2016-02-20 13:16:21'),(1,60,6,101,3,1,'2016-02-20 13:16:21'),(1,60,6,102,1,1,'2016-02-20 13:16:21'),(1,60,6,102,2,1,'2016-02-20 13:16:21'),(1,60,6,102,3,1,'2016-02-20 13:16:21'),(1,60,6,103,1,1,'2016-02-20 13:16:21'),(1,60,6,103,2,1,'2016-02-20 13:16:21'),(1,60,6,103,3,1,'2016-02-20 13:16:21'),(1,60,7,100,1,1,'2016-02-20 13:16:21'),(1,60,7,100,2,1,'2016-02-20 13:16:22'),(1,60,7,100,3,1,'2016-02-20 13:16:22'),(1,60,7,101,1,1,'2016-02-20 13:16:22'),(1,60,7,101,2,1,'2016-02-20 13:16:22'),(1,60,7,101,3,1,'2016-02-20 13:16:22'),(1,60,7,102,1,1,'2016-02-20 13:16:22'),(1,60,7,102,2,1,'2016-02-20 13:16:22'),(1,60,7,102,3,1,'2016-02-20 13:16:22'),(1,60,7,103,1,1,'2016-02-20 13:16:22'),(1,60,7,103,2,1,'2016-02-20 13:16:22'),(1,60,7,103,3,1,'2016-02-20 13:16:22'),(1,60,8,100,1,1,'2016-02-20 13:16:22'),(1,60,8,100,2,1,'2016-02-20 13:16:22'),(1,60,8,100,3,1,'2016-02-20 13:16:23'),(1,60,8,101,1,1,'2016-02-20 13:16:23'),(1,60,8,101,2,1,'2016-02-20 13:16:23'),(1,60,8,101,3,1,'2016-02-20 13:16:23'),(1,60,8,102,1,1,'2016-02-20 13:16:23'),(1,60,8,102,2,1,'2016-02-20 13:16:23'),(1,60,8,102,3,1,'2016-02-20 13:16:23'),(1,60,8,103,1,1,'2016-02-20 13:16:23'),(1,60,8,103,2,1,'2016-02-20 13:16:23'),(1,60,8,103,3,1,'2016-02-20 13:16:23'),(1,60,9,100,1,1,'2016-02-20 13:16:23'),(1,60,9,100,2,1,'2016-02-20 13:16:23'),(1,60,9,100,3,1,'2016-02-20 13:16:23'),(1,60,9,101,1,1,'2016-02-20 13:16:24'),(1,60,9,101,2,1,'2016-02-20 13:16:24'),(1,60,9,101,3,1,'2016-02-20 13:16:24'),(1,60,9,102,1,1,'2016-02-20 13:16:24'),(1,60,9,102,2,1,'2016-02-20 13:16:24'),(1,60,9,102,3,1,'2016-02-20 13:16:24'),(1,60,9,103,1,1,'2016-02-20 13:16:24'),(1,60,9,103,2,1,'2016-02-20 13:16:24'),(1,60,9,103,3,1,'2016-02-20 13:16:24'),(1,60,10,100,1,1,'2016-02-20 13:16:24'),(1,60,10,100,2,1,'2016-02-20 13:16:24'),(1,60,10,100,3,1,'2016-02-20 13:16:24'),(1,60,10,101,1,1,'2016-02-20 13:16:24'),(1,60,10,101,2,1,'2016-02-20 13:16:24'),(1,60,10,101,3,1,'2016-02-20 13:16:24'),(1,60,10,102,1,1,'2016-02-20 13:16:25'),(1,60,10,102,2,1,'2016-02-20 13:16:25'),(1,60,10,102,3,1,'2016-02-20 13:16:25'),(1,60,10,103,1,1,'2016-02-20 13:16:25'),(1,60,10,103,2,1,'2016-02-20 13:16:25'),(1,60,10,103,3,1,'2016-02-20 13:16:25'),(1,60,11,100,1,1,'2016-02-20 13:16:25'),(1,60,11,100,2,1,'2016-02-20 13:16:25'),(1,60,11,100,3,1,'2016-02-20 13:16:25'),(1,60,11,101,1,1,'2016-02-20 13:16:25'),(1,60,11,101,2,1,'2016-02-20 13:16:25'),(1,60,11,101,3,1,'2016-02-20 13:16:25'),(1,60,11,102,1,1,'2016-02-20 13:16:25'),(1,60,11,102,2,1,'2016-02-20 13:16:25'),(1,60,11,102,3,1,'2016-02-20 13:16:25'),(1,60,11,103,1,1,'2016-02-20 13:16:25'),(1,60,11,103,2,1,'2016-02-20 13:16:26'),(1,60,11,103,3,1,'2016-02-20 13:16:26'),(1,60,12,100,1,1,'2016-02-20 13:16:26'),(1,60,12,100,2,1,'2016-02-20 13:16:26'),(1,60,12,100,3,1,'2016-02-20 13:16:26'),(1,60,12,101,1,1,'2016-02-20 13:16:26'),(1,60,12,101,2,1,'2016-02-20 13:16:26'),(1,60,12,101,3,1,'2016-02-20 13:16:26'),(1,60,12,102,1,1,'2016-02-20 13:16:26'),(1,60,12,102,2,1,'2016-02-20 13:16:26'),(1,60,12,102,3,1,'2016-02-20 13:16:26'),(1,60,12,103,1,1,'2016-02-20 13:16:26'),(1,60,12,103,2,1,'2016-02-20 13:16:27'),(1,60,12,103,3,1,'2016-02-20 13:16:27'),(1,60,13,100,1,1,'2016-02-20 13:16:27'),(1,60,13,100,2,1,'2016-02-20 13:16:27'),(1,60,13,100,3,1,'2016-02-20 13:16:27'),(1,60,13,101,1,1,'2016-02-20 13:16:27'),(1,60,13,101,2,1,'2016-02-20 13:16:27'),(1,60,13,101,3,1,'2016-02-20 13:16:27'),(1,60,13,102,1,1,'2016-02-20 13:16:27'),(1,60,13,102,2,1,'2016-02-20 13:16:27'),(1,60,13,102,3,1,'2016-02-20 13:16:27'),(1,60,13,103,1,1,'2016-02-20 13:16:28'),(1,60,13,103,2,1,'2016-02-20 13:16:28'),(1,60,13,103,3,1,'2016-02-20 13:16:28'),(1,60,14,100,1,1,'2016-02-20 13:16:28'),(1,60,14,100,2,1,'2016-02-20 13:16:28'),(1,60,14,100,3,1,'2016-02-20 13:16:28'),(1,60,14,101,1,1,'2016-02-20 13:16:28'),(1,60,14,101,2,1,'2016-02-20 13:16:28'),(1,60,14,101,3,1,'2016-02-20 13:16:28'),(1,60,14,102,1,1,'2016-02-20 13:16:28'),(1,60,14,102,2,1,'2016-02-20 13:16:28'),(1,60,14,102,3,1,'2016-02-20 13:16:28'),(1,60,14,103,1,1,'2016-02-20 13:16:28'),(1,60,14,103,2,1,'2016-02-20 13:16:28'),(1,60,14,103,3,1,'2016-02-20 13:16:28'),(1,60,15,100,1,1,'2016-02-20 13:16:29'),(1,60,15,100,2,1,'2016-02-20 13:16:29'),(1,60,15,100,3,1,'2016-02-20 13:16:29'),(1,60,15,101,1,1,'2016-02-20 13:16:29'),(1,60,15,101,2,1,'2016-02-20 13:16:29'),(1,60,15,101,3,1,'2016-02-20 13:16:29'),(1,60,15,102,1,1,'2016-02-20 13:16:29'),(1,60,15,102,2,1,'2016-02-20 13:16:29'),(1,60,15,102,3,1,'2016-02-20 13:16:29'),(1,60,15,103,1,1,'2016-02-20 13:16:29'),(1,60,15,103,2,1,'2016-02-20 13:16:29'),(1,60,15,103,3,1,'2016-02-20 13:16:29'),(1,60,16,100,1,1,'2016-02-20 13:16:30'),(1,60,16,100,2,1,'2016-02-20 13:16:30'),(1,60,16,100,3,1,'2016-02-20 13:16:30'),(1,60,16,101,1,1,'2016-02-20 13:16:30'),(1,60,16,101,2,1,'2016-02-20 13:16:30'),(1,60,16,101,3,1,'2016-02-20 13:16:30'),(1,60,16,102,1,1,'2016-02-20 13:16:30'),(1,60,16,102,2,1,'2016-02-20 13:16:30'),(1,60,16,102,3,1,'2016-02-20 13:16:30'),(1,60,16,103,1,1,'2016-02-20 13:16:30'),(1,60,16,103,2,1,'2016-02-20 13:16:30'),(1,60,16,103,3,1,'2016-02-20 13:16:30'),(1,60,17,100,1,1,'2016-02-20 13:16:30'),(1,60,17,100,2,1,'2016-02-20 13:16:31'),(1,60,17,100,3,1,'2016-02-20 13:16:31'),(1,60,17,101,1,1,'2016-02-20 13:16:31'),(1,60,17,101,2,1,'2016-02-20 13:16:31'),(1,60,17,101,3,1,'2016-02-20 13:16:31'),(1,60,17,102,1,1,'2016-02-20 13:16:31'),(1,60,17,102,2,1,'2016-02-20 13:16:31'),(1,60,17,102,3,1,'2016-02-20 13:16:31'),(1,60,17,103,1,1,'2016-02-20 13:16:31'),(1,60,17,103,2,1,'2016-02-20 13:16:31'),(1,60,17,103,3,1,'2016-02-20 13:16:31'),(1,60,18,100,1,1,'2016-02-20 13:16:31'),(1,60,18,100,2,1,'2016-02-20 13:16:31'),(1,60,18,100,3,1,'2016-02-20 13:16:32'),(1,60,18,101,1,1,'2016-02-20 13:16:32'),(1,60,18,101,2,1,'2016-02-20 13:16:32'),(1,60,18,101,3,1,'2016-02-20 13:16:32'),(1,60,18,102,1,1,'2016-02-20 13:16:32'),(1,60,18,102,2,1,'2016-02-20 13:16:32'),(1,60,18,102,3,1,'2016-02-20 13:16:32'),(1,60,18,103,1,1,'2016-02-20 13:16:32'),(1,60,18,103,2,1,'2016-02-20 13:16:32'),(1,60,18,103,3,1,'2016-02-20 13:16:32'),(1,60,19,100,1,1,'2016-02-20 13:16:32'),(1,60,19,100,2,1,'2016-02-20 13:16:33'),(1,60,19,100,3,1,'2016-02-20 13:16:33'),(1,60,19,101,1,1,'2016-02-20 13:16:33'),(1,60,19,101,2,1,'2016-02-20 13:16:33'),(1,60,19,101,3,1,'2016-02-20 13:16:33'),(1,60,19,102,1,1,'2016-02-20 13:16:33'),(1,60,19,102,2,1,'2016-02-20 13:16:33'),(1,60,19,102,3,1,'2016-02-20 13:16:33'),(1,60,19,103,1,1,'2016-02-20 13:16:33'),(1,60,19,103,2,1,'2016-02-20 13:16:33'),(1,60,19,103,3,1,'2016-02-20 13:16:33'),(1,60,20,100,1,1,'2016-02-20 13:16:33'),(1,60,20,100,2,1,'2016-02-20 13:16:34'),(1,60,20,100,3,1,'2016-02-20 13:16:34'),(1,60,20,101,1,1,'2016-02-20 13:16:34'),(1,60,20,101,2,1,'2016-02-20 13:16:34'),(1,60,20,101,3,1,'2016-02-20 13:16:34'),(1,60,20,102,1,1,'2016-02-20 13:16:34'),(1,60,20,102,2,1,'2016-02-20 13:16:34'),(1,60,20,102,3,1,'2016-02-20 13:16:34'),(1,60,20,103,1,1,'2016-02-20 13:16:34'),(1,60,20,103,2,1,'2016-02-20 13:16:34'),(1,60,20,103,3,1,'2016-02-20 13:16:34'),(1,60,21,100,1,1,'2016-02-20 13:16:35'),(1,60,21,100,2,1,'2016-02-20 13:16:35'),(1,60,21,100,3,1,'2016-02-20 13:16:35'),(1,60,21,101,1,1,'2016-02-20 13:16:35'),(1,60,21,101,2,1,'2016-02-20 13:16:35'),(1,60,21,101,3,1,'2016-02-20 13:16:35'),(1,60,21,102,1,1,'2016-02-20 13:16:35'),(1,60,21,102,2,1,'2016-02-20 13:16:35'),(1,60,21,102,3,1,'2016-02-20 13:16:35'),(1,60,21,103,1,1,'2016-02-20 13:16:35'),(1,60,21,103,2,1,'2016-02-20 13:16:35'),(1,60,21,103,3,1,'2016-02-20 13:16:35'),(1,60,22,100,1,1,'2016-02-20 13:16:36'),(1,60,22,100,2,1,'2016-02-20 13:16:36'),(1,60,22,100,3,1,'2016-02-20 13:16:36'),(1,60,22,101,1,1,'2016-02-20 13:16:36'),(1,60,22,101,2,1,'2016-02-20 13:16:36'),(1,60,22,101,3,1,'2016-02-20 13:16:36'),(1,60,22,102,1,1,'2016-02-20 13:16:36'),(1,60,22,102,2,1,'2016-02-20 13:16:36'),(1,60,22,102,3,1,'2016-02-20 13:16:37'),(1,60,22,103,1,1,'2016-02-20 13:16:37'),(1,60,22,103,2,1,'2016-02-20 13:16:37'),(1,60,22,103,3,1,'2016-02-20 13:16:37'),(1,60,23,100,1,1,'2016-02-20 13:16:37'),(1,60,23,100,2,1,'2016-02-20 13:16:37'),(1,60,23,100,3,1,'2016-02-20 13:16:37'),(1,60,23,101,1,1,'2016-02-20 13:16:37'),(1,60,23,101,2,1,'2016-02-20 13:16:37'),(1,60,23,101,3,1,'2016-02-20 13:16:37'),(1,60,23,102,1,1,'2016-02-20 13:16:37'),(1,60,23,102,2,1,'2016-02-20 13:16:37'),(1,60,23,102,3,1,'2016-02-20 13:16:37'),(1,60,23,103,1,1,'2016-02-20 13:16:38'),(1,60,23,103,2,1,'2016-02-20 13:16:38'),(1,60,23,103,3,1,'2016-02-20 13:16:38'),(1,60,24,100,1,1,'2016-02-20 13:16:38'),(1,60,24,100,2,1,'2016-02-20 13:16:38'),(1,60,24,100,3,1,'2016-02-20 13:16:38'),(1,60,24,101,1,1,'2016-02-20 13:16:38'),(1,60,24,101,2,1,'2016-02-20 13:16:38'),(1,60,24,101,3,1,'2016-02-20 13:16:38'),(1,60,24,102,1,1,'2016-02-20 13:16:38'),(1,60,24,102,2,1,'2016-02-20 13:16:38'),(1,60,24,102,3,1,'2016-02-20 13:16:38'),(1,60,24,103,1,1,'2016-02-20 13:16:38'),(1,60,24,103,2,1,'2016-02-20 13:16:38'),(1,60,24,103,3,1,'2016-02-20 13:16:39'),(1,60,25,100,1,1,'2016-02-20 13:16:39'),(1,60,25,100,2,1,'2016-02-20 13:16:39'),(1,60,25,100,3,1,'2016-02-20 13:16:39'),(1,60,25,101,1,1,'2016-02-20 13:16:39'),(1,60,25,101,2,1,'2016-02-20 13:16:39'),(1,60,25,101,3,1,'2016-02-20 13:16:39'),(1,60,25,102,1,1,'2016-02-20 13:16:39'),(1,60,25,102,2,1,'2016-02-20 13:16:39'),(1,60,25,102,3,1,'2016-02-20 13:16:39'),(1,60,25,103,1,1,'2016-02-20 13:16:39'),(1,60,25,103,2,1,'2016-02-20 13:16:40'),(1,60,25,103,3,1,'2016-02-20 13:16:40'),(1,60,26,100,1,1,'2016-02-20 13:16:40'),(1,60,26,100,2,1,'2016-02-20 13:16:40'),(1,60,26,100,3,1,'2016-02-20 13:16:40'),(1,60,26,101,1,1,'2016-02-20 13:16:40'),(1,60,26,101,2,1,'2016-02-20 13:16:40'),(1,60,26,101,3,1,'2016-02-20 13:16:40'),(1,60,26,102,1,1,'2016-02-20 13:16:40'),(1,60,26,102,2,1,'2016-02-20 13:16:41'),(1,60,26,102,3,1,'2016-02-20 13:16:41'),(1,60,26,103,1,1,'2016-02-20 13:16:41'),(1,60,26,103,2,1,'2016-02-20 13:16:41'),(1,60,26,103,3,1,'2016-02-20 13:16:41'),(1,60,27,100,1,1,'2016-02-20 13:16:42'),(1,60,27,100,2,1,'2016-02-20 13:16:42'),(1,60,27,100,3,1,'2016-02-20 13:16:42'),(1,60,27,101,1,1,'2016-02-20 13:16:42'),(1,60,27,101,2,1,'2016-02-20 13:16:42'),(1,60,27,101,3,1,'2016-02-20 13:16:42'),(1,60,27,102,1,1,'2016-02-20 13:16:42'),(1,60,27,102,2,1,'2016-02-20 13:16:42'),(1,60,27,102,3,1,'2016-02-20 13:16:42'),(1,60,27,103,1,1,'2016-02-20 13:16:42'),(1,60,27,103,2,1,'2016-02-20 13:16:42'),(1,60,27,103,3,1,'2016-02-20 13:16:42'),(1,60,28,100,1,1,'2016-02-20 13:16:43'),(1,60,28,100,2,1,'2016-02-20 13:16:43'),(1,60,28,100,3,1,'2016-02-20 13:16:43'),(1,60,28,101,1,1,'2016-02-20 13:16:43'),(1,60,28,101,2,1,'2016-02-20 13:16:43'),(1,60,28,101,3,1,'2016-02-20 13:16:43'),(1,60,28,102,1,1,'2016-02-20 13:16:43'),(1,60,28,102,2,1,'2016-02-20 13:16:43'),(1,60,28,102,3,1,'2016-02-20 13:16:43'),(1,60,28,103,1,1,'2016-02-20 13:16:43'),(1,60,28,103,2,1,'2016-02-20 13:16:43'),(1,60,28,103,3,1,'2016-02-20 13:16:43'),(1,60,29,100,1,1,'2016-02-20 13:16:44'),(1,60,29,100,2,1,'2016-02-20 13:16:44'),(1,60,29,100,3,1,'2016-02-20 13:16:44'),(1,60,29,101,1,1,'2016-02-20 13:16:44'),(1,60,29,101,2,1,'2016-02-20 13:16:44'),(1,60,29,101,3,1,'2016-02-20 13:16:44'),(1,60,29,102,1,1,'2016-02-20 13:16:44'),(1,60,29,102,2,1,'2016-02-20 13:16:44'),(1,60,29,102,3,1,'2016-02-20 13:16:44'),(1,60,29,103,1,1,'2016-02-20 13:16:44'),(1,60,29,103,2,1,'2016-02-20 13:16:44'),(1,60,29,103,3,1,'2016-02-20 13:16:44'),(1,60,30,100,1,1,'2016-02-20 13:16:45'),(1,60,30,100,2,1,'2016-02-20 13:16:45'),(1,60,30,100,3,1,'2016-02-20 13:16:45'),(1,60,30,101,1,1,'2016-02-20 13:16:45'),(1,60,30,101,2,1,'2016-02-20 13:16:45'),(1,60,30,101,3,1,'2016-02-20 13:16:45'),(1,60,30,102,1,1,'2016-02-20 13:16:45'),(1,60,30,102,2,1,'2016-02-20 13:16:45'),(1,60,30,102,3,1,'2016-02-20 13:16:45'),(1,60,30,103,1,1,'2016-02-20 13:16:45'),(1,60,30,103,2,1,'2016-02-20 13:16:45'),(1,60,30,103,3,1,'2016-02-20 13:16:45'),(1,60,31,100,1,1,'2016-02-20 13:16:45'),(1,60,31,100,2,1,'2016-02-20 13:16:45'),(1,60,31,100,3,1,'2016-02-20 13:16:45'),(1,60,31,101,1,1,'2016-02-20 13:16:45'),(1,60,31,101,2,1,'2016-02-20 13:16:46'),(1,60,31,101,3,1,'2016-02-20 13:16:46'),(1,60,31,102,1,1,'2016-02-20 13:16:46'),(1,60,31,102,2,1,'2016-02-20 13:16:46'),(1,60,31,102,3,1,'2016-02-20 13:16:46'),(1,60,31,103,1,1,'2016-02-20 13:16:46'),(1,60,31,103,2,1,'2016-02-20 13:16:46'),(1,60,31,103,3,1,'2016-02-20 13:16:46'),(1,60,32,100,1,1,'2016-02-20 13:16:46'),(1,60,32,100,2,1,'2016-02-20 13:16:46'),(1,60,32,100,3,1,'2016-02-20 13:16:46'),(1,60,32,101,1,1,'2016-02-20 13:16:46'),(1,60,32,101,2,1,'2016-02-20 13:16:46'),(1,60,32,101,3,1,'2016-02-20 13:16:46'),(1,60,32,102,1,1,'2016-02-20 13:16:46'),(1,60,32,102,2,1,'2016-02-20 13:16:47'),(1,60,32,102,3,1,'2016-02-20 13:16:47'),(1,60,32,103,1,1,'2016-02-20 13:16:47'),(1,60,32,103,2,1,'2016-02-20 13:16:47'),(1,60,32,103,3,1,'2016-02-20 13:16:47'),(1,60,33,100,1,1,'2016-02-20 13:16:47'),(1,60,33,100,2,1,'2016-02-20 13:16:47'),(1,60,33,100,3,1,'2016-02-20 13:16:47'),(1,60,33,101,1,1,'2016-02-20 13:16:47'),(1,60,33,101,2,1,'2016-02-20 13:16:47'),(1,60,33,101,3,1,'2016-02-20 13:16:47'),(1,60,33,102,1,1,'2016-02-20 13:16:47'),(1,60,33,102,2,1,'2016-02-20 13:16:47'),(1,60,33,102,3,1,'2016-02-20 13:16:48'),(1,60,33,103,1,1,'2016-02-20 13:16:48'),(1,60,33,103,2,1,'2016-02-20 13:16:48'),(1,60,33,103,3,1,'2016-02-20 13:16:48'),(1,60,34,100,1,1,'2016-02-20 13:16:48'),(1,60,34,100,2,1,'2016-02-20 13:16:48'),(1,60,34,100,3,1,'2016-02-20 13:16:48'),(1,60,34,101,1,1,'2016-02-20 13:16:48'),(1,60,34,101,2,1,'2016-02-20 13:16:48'),(1,60,34,101,3,1,'2016-02-20 13:16:48'),(1,60,34,102,1,1,'2016-02-20 13:16:48'),(1,60,34,102,2,1,'2016-02-20 13:16:48'),(1,60,34,102,3,1,'2016-02-20 13:16:49'),(1,60,34,103,1,1,'2016-02-20 13:16:49'),(1,60,34,103,2,1,'2016-02-20 13:16:49'),(1,60,34,103,3,1,'2016-02-20 13:16:49'),(1,60,35,100,1,1,'2016-02-20 13:16:49'),(1,60,35,100,2,1,'2016-02-20 13:16:49'),(1,60,35,100,3,1,'2016-02-20 13:16:49'),(1,60,35,101,1,1,'2016-02-20 13:16:49'),(1,60,35,101,2,1,'2016-02-20 13:16:49'),(1,60,35,101,3,1,'2016-02-20 13:16:49'),(1,60,35,102,1,1,'2016-02-20 13:16:49'),(1,60,35,102,2,1,'2016-02-20 13:16:50'),(1,60,35,102,3,1,'2016-02-20 13:16:50'),(1,60,35,103,1,1,'2016-02-20 13:16:50'),(1,60,35,103,2,1,'2016-02-20 13:16:50'),(1,60,35,103,3,1,'2016-02-20 13:16:50'),(1,60,36,100,1,1,'2016-02-20 13:16:50'),(1,60,36,100,2,1,'2016-02-20 13:16:50'),(1,60,36,100,3,1,'2016-02-20 13:16:50'),(1,60,36,101,1,1,'2016-02-20 13:16:50'),(1,60,36,101,2,1,'2016-02-20 13:16:50'),(1,60,36,101,3,1,'2016-02-20 13:16:50'),(1,60,36,102,1,1,'2016-02-20 13:16:50'),(1,60,36,102,2,1,'2016-02-20 13:16:50'),(1,60,36,102,3,1,'2016-02-20 13:16:50'),(1,60,36,103,1,1,'2016-02-20 13:16:50'),(1,60,36,103,2,1,'2016-02-20 13:16:50'),(1,60,36,103,3,1,'2016-02-20 13:16:51'),(1,60,37,100,1,1,'2016-02-20 13:16:51'),(1,60,37,100,2,1,'2016-02-20 13:16:51'),(1,60,37,100,3,1,'2016-02-20 13:16:51'),(1,60,37,101,1,1,'2016-02-20 13:16:51'),(1,60,37,101,2,1,'2016-02-20 13:16:51'),(1,60,37,101,3,1,'2016-02-20 13:16:51'),(1,60,37,102,1,1,'2016-02-20 13:16:51'),(1,60,37,102,2,1,'2016-02-20 13:16:51'),(1,60,37,102,3,1,'2016-02-20 13:16:51'),(1,60,37,103,1,1,'2016-02-20 13:16:51'),(1,60,37,103,2,1,'2016-02-20 13:16:51'),(1,60,37,103,3,1,'2016-02-20 13:16:51'),(1,60,38,100,1,1,'2016-02-20 13:16:52'),(1,60,38,100,2,1,'2016-02-20 13:16:52'),(1,60,38,100,3,1,'2016-02-20 13:16:52'),(1,60,38,101,1,1,'2016-02-20 13:16:52'),(1,60,38,101,2,1,'2016-02-20 13:16:52'),(1,60,38,101,3,1,'2016-02-20 13:16:52'),(1,60,38,102,1,1,'2016-02-20 13:16:52'),(1,60,38,102,2,1,'2016-02-20 13:16:52'),(1,60,38,102,3,1,'2016-02-20 13:16:52'),(1,60,38,103,1,1,'2016-02-20 13:16:52'),(1,60,38,103,2,1,'2016-02-20 13:16:52'),(1,60,38,103,3,1,'2016-02-20 13:16:52'),(1,60,39,100,1,1,'2016-02-20 13:16:52'),(1,60,39,100,2,1,'2016-02-20 13:16:52'),(1,60,39,100,3,1,'2016-02-20 13:16:53'),(1,60,39,101,1,1,'2016-02-20 13:16:53'),(1,60,39,101,2,1,'2016-02-20 13:16:53'),(1,60,39,101,3,1,'2016-02-20 13:16:53'),(1,60,39,102,1,1,'2016-02-20 13:16:53'),(1,60,39,102,2,1,'2016-02-20 13:16:53'),(1,60,39,102,3,1,'2016-02-20 13:16:53'),(1,60,39,103,1,1,'2016-02-20 13:16:53'),(1,60,39,103,2,1,'2016-02-20 13:16:53'),(1,60,39,103,3,1,'2016-02-20 13:16:53'),(1,60,40,100,1,1,'2016-02-20 13:16:53'),(1,60,40,100,2,1,'2016-02-20 13:16:53'),(1,60,40,100,3,1,'2016-02-20 13:16:53'),(1,60,40,101,1,1,'2016-02-20 13:16:54'),(1,60,40,101,2,1,'2016-02-20 13:16:54'),(1,60,40,101,3,1,'2016-02-20 13:16:54'),(1,60,40,102,1,1,'2016-02-20 13:16:54'),(1,60,40,102,2,1,'2016-02-20 13:16:54'),(1,60,40,102,3,1,'2016-02-20 13:16:54'),(1,60,40,103,1,1,'2016-02-20 13:16:54'),(1,60,40,103,2,1,'2016-02-20 13:16:54'),(1,60,40,103,3,1,'2016-02-20 13:16:54'),(1,60,41,100,1,1,'2016-02-20 13:16:54'),(1,60,41,100,2,1,'2016-02-20 13:16:54'),(1,60,41,100,3,1,'2016-02-20 13:16:55'),(1,60,41,101,1,1,'2016-02-20 13:16:55'),(1,60,41,101,2,1,'2016-02-20 13:16:55'),(1,60,41,101,3,1,'2016-02-20 13:16:55'),(1,60,41,102,1,1,'2016-02-20 13:16:55'),(1,60,41,102,2,1,'2016-02-20 13:16:55'),(1,60,41,102,3,1,'2016-02-20 13:16:55'),(1,60,41,103,1,1,'2016-02-20 13:16:55'),(1,60,41,103,2,1,'2016-02-20 13:16:55'),(1,60,41,103,3,1,'2016-02-20 13:16:55'),(1,60,42,100,1,1,'2016-02-20 13:16:55'),(1,60,42,100,2,1,'2016-02-20 13:16:55'),(1,60,42,100,3,1,'2016-02-20 13:16:56'),(1,60,42,101,1,1,'2016-02-20 13:16:56'),(1,60,42,101,2,1,'2016-02-20 13:16:56'),(1,60,42,101,3,1,'2016-02-20 13:16:56'),(1,60,42,102,1,1,'2016-02-20 13:16:56'),(1,60,42,102,2,1,'2016-02-20 13:16:56'),(1,60,42,102,3,1,'2016-02-20 13:16:56'),(1,60,42,103,1,1,'2016-02-20 13:16:56'),(1,60,42,103,2,1,'2016-02-20 13:16:56'),(1,60,42,103,3,1,'2016-02-20 13:16:56'),(1,60,43,100,1,1,'2016-02-20 13:16:57'),(1,60,43,100,2,1,'2016-02-20 13:16:57'),(1,60,43,100,3,1,'2016-02-20 13:16:57'),(1,60,43,101,1,1,'2016-02-20 13:16:57'),(1,60,43,101,2,1,'2016-02-20 13:16:57'),(1,60,43,101,3,1,'2016-02-20 13:16:57'),(1,60,43,102,1,1,'2016-02-20 13:16:57'),(1,60,43,102,2,1,'2016-02-20 13:16:57'),(1,60,43,102,3,1,'2016-02-20 13:16:57'),(1,60,43,103,1,1,'2016-02-20 13:16:57'),(1,60,43,103,2,1,'2016-02-20 13:16:57'),(1,60,43,103,3,1,'2016-02-20 13:16:57'),(1,60,44,100,1,1,'2016-02-20 13:16:58'),(1,60,44,100,2,1,'2016-02-20 13:16:58'),(1,60,44,100,3,1,'2016-02-20 13:16:58'),(1,60,44,101,1,1,'2016-02-20 13:16:58'),(1,60,44,101,2,1,'2016-02-20 13:16:58'),(1,60,44,101,3,1,'2016-02-20 13:16:58'),(1,60,44,102,1,1,'2016-02-20 13:16:58'),(1,60,44,102,2,1,'2016-02-20 13:16:58'),(1,60,44,102,3,1,'2016-02-20 13:16:58'),(1,60,44,103,1,1,'2016-02-20 13:16:58'),(1,60,44,103,2,1,'2016-02-20 13:16:59'),(1,60,44,103,3,1,'2016-02-20 13:16:59'),(1,60,45,100,1,1,'2016-02-20 13:16:59'),(1,60,45,100,2,1,'2016-02-20 13:16:59'),(1,60,45,100,3,1,'2016-02-20 13:16:59'),(1,60,45,101,1,1,'2016-02-20 13:16:59'),(1,60,45,101,2,1,'2016-02-20 13:16:59'),(1,60,45,101,3,1,'2016-02-20 13:16:59'),(1,60,45,102,1,1,'2016-02-20 13:16:59'),(1,60,45,102,2,1,'2016-02-20 13:16:59'),(1,60,45,102,3,1,'2016-02-20 13:16:59'),(1,60,45,103,1,1,'2016-02-20 13:17:00'),(1,60,45,103,2,1,'2016-02-20 13:17:00'),(1,60,45,103,3,1,'2016-02-20 13:17:00'),(1,60,46,100,1,1,'2016-02-20 13:17:00'),(1,60,46,100,2,1,'2016-02-20 13:17:00'),(1,60,46,100,3,1,'2016-02-20 13:17:00'),(1,60,46,101,1,1,'2016-02-20 13:17:00'),(1,60,46,101,2,1,'2016-02-20 13:17:00'),(1,60,46,101,3,1,'2016-02-20 13:17:00'),(1,60,46,102,1,1,'2016-02-20 13:17:01'),(1,60,46,102,2,1,'2016-02-20 13:17:01'),(1,60,46,102,3,1,'2016-02-20 13:17:01'),(1,60,46,103,1,1,'2016-02-20 13:17:01'),(1,60,46,103,2,1,'2016-02-20 13:17:01'),(1,60,46,103,3,1,'2016-02-20 13:17:01'),(1,60,47,100,1,1,'2016-02-20 13:17:01'),(1,60,47,100,2,1,'2016-02-20 13:17:01'),(1,60,47,100,3,1,'2016-02-20 13:17:01'),(1,60,47,101,1,1,'2016-02-20 13:17:01'),(1,60,47,101,2,1,'2016-02-20 13:17:01'),(1,60,47,101,3,1,'2016-02-20 13:17:02'),(1,60,47,102,1,1,'2016-02-20 13:17:02'),(1,60,47,102,2,1,'2016-02-20 13:17:02'),(1,60,47,102,3,1,'2016-02-20 13:17:02'),(1,60,47,103,1,1,'2016-02-20 13:17:02'),(1,60,47,103,2,1,'2016-02-20 13:17:02'),(1,60,47,103,3,1,'2016-02-20 13:17:02'),(1,60,48,100,1,1,'2016-02-20 13:17:02'),(1,60,48,100,2,1,'2016-02-20 13:17:02'),(1,60,48,100,3,1,'2016-02-20 13:17:02'),(1,60,48,101,1,1,'2016-02-20 13:17:03'),(1,60,48,101,2,1,'2016-02-20 13:17:03'),(1,60,48,101,3,1,'2016-02-20 13:17:03'),(1,60,48,102,1,1,'2016-02-20 13:17:03'),(1,60,48,102,2,1,'2016-02-20 13:17:03'),(1,60,48,102,3,1,'2016-02-20 13:17:03'),(1,60,48,103,1,1,'2016-02-20 13:17:03'),(1,60,48,103,2,1,'2016-02-20 13:17:03'),(1,60,48,103,3,1,'2016-02-20 13:17:03'),(1,60,0,200,1,1,'2016-02-20 13:17:06'),(1,60,1,200,1,1,'2016-02-20 13:17:06'),(1,60,1,200,2,1,'2016-02-20 13:17:06'),(1,61,1,100,1,1,'2016-02-20 15:37:38'),(1,61,1,100,2,1,'2016-02-20 15:37:39'),(1,61,1,100,3,1,'2016-02-20 15:37:39'),(1,61,1,101,1,1,'2016-02-20 15:37:39'),(1,61,1,101,2,1,'2016-02-20 15:37:39'),(1,61,1,101,3,1,'2016-02-20 15:37:39'),(1,61,1,102,1,1,'2016-02-20 15:37:39'),(1,61,1,102,2,1,'2016-02-20 15:37:39'),(1,61,1,102,3,1,'2016-02-20 15:37:39'),(1,61,1,103,1,1,'2016-02-20 15:37:39'),(1,61,1,103,2,1,'2016-02-20 15:37:39'),(1,61,1,103,3,1,'2016-02-20 15:37:39'),(1,61,0,200,1,1,'2016-02-20 15:37:41'),(1,61,1,200,1,1,'2016-02-20 15:37:42'),(1,61,1,200,2,1,'2016-02-20 15:37:42'),(1,62,1,100,1,1,'2016-02-22 10:54:18'),(1,62,1,100,2,1,'2016-02-22 10:54:18'),(1,62,1,100,3,1,'2016-02-22 10:54:18'),(1,62,1,101,1,1,'2016-02-22 10:54:18'),(1,62,1,101,2,1,'2016-02-22 10:54:18'),(1,62,1,101,3,1,'2016-02-22 10:54:18'),(1,62,1,102,1,1,'2016-02-22 10:54:18'),(1,62,1,102,2,1,'2016-02-22 10:54:18'),(1,62,1,102,3,1,'2016-02-22 10:54:18'),(1,62,1,103,1,1,'2016-02-22 10:54:18'),(1,62,1,103,2,1,'2016-02-22 10:54:18'),(1,62,1,103,3,1,'2016-02-22 10:54:18'),(1,63,1,100,1,1,'2016-02-23 16:08:54'),(1,63,1,100,2,1,'2016-02-23 16:08:54'),(1,63,1,100,3,1,'2016-02-23 16:08:55'),(1,63,1,101,1,1,'2016-02-23 16:08:55'),(1,63,1,101,2,1,'2016-02-23 16:08:55'),(1,63,1,101,3,1,'2016-02-23 16:08:55'),(1,63,1,102,1,1,'2016-02-23 16:08:55'),(1,63,1,102,2,1,'2016-02-23 16:08:55'),(1,63,1,102,3,1,'2016-02-23 16:08:55'),(1,63,1,103,1,1,'2016-02-23 16:08:56'),(1,63,1,103,2,1,'2016-02-23 16:08:56'),(1,63,1,103,3,1,'2016-02-23 16:08:56'),(1,64,1,100,1,1,'2016-02-23 16:33:57'),(1,64,1,100,2,1,'2016-02-23 16:33:57'),(1,64,1,100,3,1,'2016-02-23 16:33:57'),(1,64,1,101,1,1,'2016-02-23 16:33:57'),(1,64,1,101,2,1,'2016-02-23 16:33:57'),(1,64,1,101,3,1,'2016-02-23 16:33:57'),(1,64,1,102,1,1,'2016-02-23 16:33:58'),(1,64,1,102,2,1,'2016-02-23 16:33:58'),(1,64,1,102,3,1,'2016-02-23 16:33:58'),(1,64,1,103,1,1,'2016-02-23 16:33:58'),(1,64,1,103,2,1,'2016-02-23 16:33:58'),(1,64,1,103,3,1,'2016-02-23 16:33:58'),(1,65,1,100,1,1,'2016-02-24 16:57:56'),(1,65,1,100,2,1,'2016-02-24 16:57:56'),(1,65,1,100,3,1,'2016-02-24 16:57:56'),(1,65,1,101,1,1,'2016-02-24 16:57:56'),(1,65,1,101,2,1,'2016-02-24 16:57:56'),(1,65,1,101,3,1,'2016-02-24 16:57:57'),(1,65,1,102,1,1,'2016-02-24 16:57:57'),(1,65,1,102,2,1,'2016-02-24 16:57:57'),(1,65,1,102,3,1,'2016-02-24 16:57:57'),(1,65,1,103,1,1,'2016-02-24 16:57:57'),(1,65,1,103,2,1,'2016-02-24 16:57:57'),(1,65,1,103,3,1,'2016-02-24 16:57:57'),(1,66,1,100,1,1,'2016-02-24 21:15:56'),(1,66,1,100,2,1,'2016-02-24 21:15:56'),(1,66,1,100,3,1,'2016-02-24 21:15:56'),(1,66,1,101,1,1,'2016-02-24 21:15:57'),(1,66,1,101,2,1,'2016-02-24 21:15:57'),(1,66,1,101,3,1,'2016-02-24 21:15:57'),(1,66,1,102,1,1,'2016-02-24 21:15:57'),(1,66,1,102,2,1,'2016-02-24 21:15:57'),(1,66,1,102,3,1,'2016-02-24 21:15:58'),(1,66,1,103,1,1,'2016-02-24 21:15:58'),(1,66,1,103,2,1,'2016-02-24 21:15:58'),(1,66,1,103,3,1,'2016-02-24 21:15:58'),(1,67,1,100,1,1,'2016-02-25 12:01:42'),(1,67,1,100,2,1,'2016-02-25 12:01:42'),(1,67,1,100,3,1,'2016-02-25 12:01:42'),(1,67,1,101,1,1,'2016-02-25 12:01:42'),(1,67,1,101,2,1,'2016-02-25 12:01:42'),(1,67,1,101,3,1,'2016-02-25 12:01:42'),(1,67,1,102,1,1,'2016-02-25 12:01:42'),(1,67,1,102,2,1,'2016-02-25 12:01:42'),(1,67,1,102,3,1,'2016-02-25 12:01:42'),(1,67,1,103,1,1,'2016-02-25 12:01:42'),(1,67,1,103,2,1,'2016-02-25 12:01:42'),(1,67,1,103,3,1,'2016-02-25 12:01:42'),(1,68,1,100,1,1,'2016-02-25 12:21:36'),(1,68,1,100,2,1,'2016-02-25 12:21:36'),(1,68,1,100,3,1,'2016-02-25 12:21:36'),(1,68,1,101,1,1,'2016-02-25 12:21:36'),(1,68,1,101,2,1,'2016-02-25 12:21:36'),(1,68,1,101,3,1,'2016-02-25 12:21:36'),(1,68,1,102,1,1,'2016-02-25 12:21:36'),(1,68,1,102,2,1,'2016-02-25 12:21:36'),(1,68,1,102,3,1,'2016-02-25 12:21:36'),(1,68,1,103,1,1,'2016-02-25 12:21:36'),(1,68,1,103,2,1,'2016-02-25 12:21:36'),(1,68,1,103,3,1,'2016-02-25 12:21:36'),(1,69,1,100,1,1,'2016-02-25 12:23:11'),(1,69,1,100,2,1,'2016-02-25 12:23:11'),(1,69,1,100,3,1,'2016-02-25 12:23:11'),(1,69,1,101,1,1,'2016-02-25 12:23:11'),(1,69,1,101,2,1,'2016-02-25 12:23:11'),(1,69,1,101,3,1,'2016-02-25 12:23:11'),(1,69,1,102,1,1,'2016-02-25 12:23:11'),(1,69,1,102,2,1,'2016-02-25 12:23:11'),(1,69,1,102,3,1,'2016-02-25 12:23:11'),(1,69,1,103,1,1,'2016-02-25 12:23:12'),(1,69,1,103,2,1,'2016-02-25 12:23:12'),(1,69,1,103,3,1,'2016-02-25 12:23:12'),(1,70,1,100,1,1,'2016-02-25 13:24:17'),(1,70,1,100,2,1,'2016-02-25 13:24:17'),(1,70,1,100,3,1,'2016-02-25 13:24:17'),(1,70,1,101,1,1,'2016-02-25 13:24:17'),(1,70,1,101,2,1,'2016-02-25 13:24:17'),(1,70,1,101,3,1,'2016-02-25 13:24:17'),(1,70,1,102,1,1,'2016-02-25 13:24:17'),(1,70,1,102,2,1,'2016-02-25 13:24:17'),(1,70,1,102,3,1,'2016-02-25 13:24:17'),(1,70,1,103,1,1,'2016-02-25 13:24:17'),(1,70,1,103,2,1,'2016-02-25 13:24:17'),(1,70,1,103,3,1,'2016-02-25 13:24:17'),(1,71,1,100,1,1,'2016-02-25 15:00:40'),(1,71,1,100,2,1,'2016-02-25 15:00:40'),(1,71,1,100,3,1,'2016-02-25 15:00:40'),(1,71,1,101,1,1,'2016-02-25 15:00:40'),(1,71,1,101,2,1,'2016-02-25 15:00:41'),(1,71,1,101,3,1,'2016-02-25 15:00:41'),(1,71,1,102,1,1,'2016-02-25 15:00:41'),(1,72,1,100,1,1,'2016-02-25 15:00:41'),(1,72,1,100,2,1,'2016-02-25 15:00:41'),(1,71,1,102,2,1,'2016-02-25 15:00:41'),(1,72,1,100,3,1,'2016-02-25 15:00:41'),(1,71,1,102,3,1,'2016-02-25 15:00:41'),(1,72,1,101,1,1,'2016-02-25 15:00:41'),(1,71,1,103,1,1,'2016-02-25 15:00:41'),(1,72,1,101,2,1,'2016-02-25 15:00:41'),(1,71,1,103,2,1,'2016-02-25 15:00:41'),(1,71,1,103,3,1,'2016-02-25 15:00:42'),(1,72,1,101,3,1,'2016-02-25 15:00:42'),(1,72,1,102,1,1,'2016-02-25 15:00:42'),(1,72,1,102,2,1,'2016-02-25 15:00:42'),(1,72,1,102,3,1,'2016-02-25 15:00:42'),(1,72,1,103,1,1,'2016-02-25 15:00:42'),(1,72,1,103,2,1,'2016-02-25 15:00:42'),(1,72,1,103,3,1,'2016-02-25 15:00:42'),(1,73,1,100,1,1,'2016-02-25 15:04:52'),(1,73,1,100,2,1,'2016-02-25 15:04:52'),(1,73,1,100,3,1,'2016-02-25 15:04:52'),(1,73,1,101,1,1,'2016-02-25 15:04:52'),(1,73,1,101,2,1,'2016-02-25 15:04:52'),(1,73,1,101,3,1,'2016-02-25 15:04:52'),(1,73,1,102,1,1,'2016-02-25 15:04:52'),(1,73,1,102,2,1,'2016-02-25 15:04:52'),(1,73,1,102,3,1,'2016-02-25 15:04:52'),(1,73,1,103,1,1,'2016-02-25 15:04:53'),(1,73,1,103,2,1,'2016-02-25 15:04:53'),(1,73,1,103,3,1,'2016-02-25 15:04:53'),(1,74,1,100,1,1,'2016-02-25 15:44:18'),(1,74,1,100,2,1,'2016-02-25 15:44:18'),(1,74,1,100,3,1,'2016-02-25 15:44:18'),(1,74,1,101,1,1,'2016-02-25 15:44:18'),(1,74,1,101,2,1,'2016-02-25 15:44:18'),(1,74,1,101,3,1,'2016-02-25 15:44:18'),(1,74,1,102,1,1,'2016-02-25 15:44:18'),(1,74,1,102,2,1,'2016-02-25 15:44:19'),(1,74,1,102,3,1,'2016-02-25 15:44:19'),(1,74,1,103,1,1,'2016-02-25 15:44:19'),(1,74,1,103,2,1,'2016-02-25 15:44:19'),(1,74,1,103,3,1,'2016-02-25 15:44:19'),(1,75,1,100,1,1,'2016-02-25 15:46:21'),(1,75,1,100,2,1,'2016-02-25 15:46:22'),(1,75,1,100,3,1,'2016-02-25 15:46:22'),(1,75,1,101,1,1,'2016-02-25 15:46:22'),(1,75,1,101,2,1,'2016-02-25 15:46:22'),(1,75,1,101,3,1,'2016-02-25 15:46:22'),(1,75,1,102,1,1,'2016-02-25 15:46:22'),(1,75,1,102,2,1,'2016-02-25 15:46:22'),(1,75,1,102,3,1,'2016-02-25 15:46:22'),(1,75,1,103,1,1,'2016-02-25 15:46:22'),(1,75,1,103,2,1,'2016-02-25 15:46:22'),(1,75,1,103,3,1,'2016-02-25 15:46:22'),(1,76,1,100,1,1,'2016-02-25 15:48:16'),(1,76,1,100,2,1,'2016-02-25 15:48:16'),(1,76,1,100,3,1,'2016-02-25 15:48:16'),(1,76,1,101,1,1,'2016-02-25 15:48:16'),(1,76,1,101,2,1,'2016-02-25 15:48:16'),(1,76,1,101,3,1,'2016-02-25 15:48:16'),(1,76,1,102,1,1,'2016-02-25 15:48:16'),(1,76,1,102,2,1,'2016-02-25 15:48:16'),(1,76,1,102,3,1,'2016-02-25 15:48:16'),(1,76,1,103,1,1,'2016-02-25 15:48:16'),(1,76,1,103,2,1,'2016-02-25 15:48:16'),(1,76,1,103,3,1,'2016-02-25 15:48:16'),(1,77,1,100,1,1,'2016-02-25 15:51:36'),(1,77,1,100,2,1,'2016-02-25 15:51:36'),(1,77,1,100,3,1,'2016-02-25 15:51:36'),(1,77,1,101,1,1,'2016-02-25 15:51:36'),(1,77,1,101,2,1,'2016-02-25 15:51:36'),(1,77,1,101,3,1,'2016-02-25 15:51:36'),(1,77,1,102,1,1,'2016-02-25 15:51:36'),(1,77,1,102,2,1,'2016-02-25 15:51:36'),(1,77,1,102,3,1,'2016-02-25 15:51:36'),(1,77,1,103,1,1,'2016-02-25 15:51:36'),(1,77,1,103,2,1,'2016-02-25 15:51:36'),(1,77,1,103,3,1,'2016-02-25 15:51:36'),(1,78,1,100,1,1,'2016-02-25 15:52:38'),(1,78,1,100,2,1,'2016-02-25 15:52:39'),(1,78,1,100,3,1,'2016-02-25 15:52:39'),(1,78,1,101,1,1,'2016-02-25 15:52:39'),(1,78,1,101,2,1,'2016-02-25 15:52:39'),(1,78,1,101,3,1,'2016-02-25 15:52:39'),(1,78,1,102,1,1,'2016-02-25 15:52:39'),(1,78,1,102,2,1,'2016-02-25 15:52:39'),(1,78,1,102,3,1,'2016-02-25 15:52:39'),(1,78,1,103,1,1,'2016-02-25 15:52:39'),(1,78,1,103,2,1,'2016-02-25 15:52:39'),(1,78,1,103,3,1,'2016-02-25 15:52:39'),(1,79,1,100,1,1,'2016-02-25 15:53:43'),(1,79,1,100,2,1,'2016-02-25 15:53:43'),(1,79,1,100,3,1,'2016-02-25 15:53:43'),(1,79,1,101,1,1,'2016-02-25 15:53:43'),(1,79,1,101,2,1,'2016-02-25 15:53:43'),(1,79,1,101,3,1,'2016-02-25 15:53:43'),(1,79,1,102,1,1,'2016-02-25 15:53:43'),(1,79,1,102,2,1,'2016-02-25 15:53:43'),(1,79,1,102,3,1,'2016-02-25 15:53:43'),(1,79,1,103,1,1,'2016-02-25 15:53:43'),(1,79,1,103,2,1,'2016-02-25 15:53:43'),(1,79,1,103,3,1,'2016-02-25 15:53:43'),(1,80,1,100,1,1,'2016-02-25 15:59:12'),(1,80,1,100,2,1,'2016-02-25 15:59:12'),(1,80,1,100,3,1,'2016-02-25 15:59:12'),(1,80,1,101,1,1,'2016-02-25 15:59:12'),(1,80,1,101,2,1,'2016-02-25 15:59:12'),(1,80,1,101,3,1,'2016-02-25 15:59:12'),(1,80,1,102,1,1,'2016-02-25 15:59:12'),(1,80,1,102,2,1,'2016-02-25 15:59:12'),(1,80,1,102,3,1,'2016-02-25 15:59:12'),(1,80,1,103,1,1,'2016-02-25 15:59:13'),(1,80,1,103,2,1,'2016-02-25 15:59:13'),(1,80,1,103,3,1,'2016-02-25 15:59:13'),(1,81,1,100,1,1,'2016-02-25 16:00:48'),(1,81,1,100,2,1,'2016-02-25 16:00:48'),(1,81,1,100,3,1,'2016-02-25 16:00:48'),(1,81,1,101,1,1,'2016-02-25 16:00:49'),(1,81,1,101,2,1,'2016-02-25 16:00:49'),(1,81,1,101,3,1,'2016-02-25 16:00:49'),(1,81,1,102,1,1,'2016-02-25 16:00:49'),(1,81,1,102,2,1,'2016-02-25 16:00:49'),(1,81,1,102,3,1,'2016-02-25 16:00:49'),(1,81,1,103,1,1,'2016-02-25 16:00:49'),(1,81,1,103,2,1,'2016-02-25 16:00:49'),(1,81,1,103,3,1,'2016-02-25 16:00:49'),(1,82,1,100,1,1,'2016-02-25 16:10:57'),(1,82,1,100,2,1,'2016-02-25 16:10:57'),(1,82,1,100,3,1,'2016-02-25 16:10:57'),(1,82,1,101,1,1,'2016-02-25 16:10:57'),(1,82,1,101,2,1,'2016-02-25 16:10:57'),(1,82,1,101,3,1,'2016-02-25 16:10:57'),(1,82,1,102,1,1,'2016-02-25 16:10:58'),(1,82,1,102,2,1,'2016-02-25 16:10:58'),(1,82,1,102,3,1,'2016-02-25 16:10:58'),(1,82,1,103,1,1,'2016-02-25 16:10:58'),(1,82,1,103,2,1,'2016-02-25 16:10:58'),(1,82,1,103,3,1,'2016-02-25 16:10:58'),(1,83,1,100,1,1,'2016-02-25 16:13:18'),(1,83,1,100,2,1,'2016-02-25 16:13:18'),(1,83,1,100,3,1,'2016-02-25 16:13:18'),(1,83,1,101,1,1,'2016-02-25 16:13:18'),(1,83,1,101,2,1,'2016-02-25 16:13:18'),(1,83,1,101,3,1,'2016-02-25 16:13:18'),(1,83,1,102,1,1,'2016-02-25 16:13:18'),(1,83,1,102,2,1,'2016-02-25 16:13:18'),(1,83,1,102,3,1,'2016-02-25 16:13:18'),(1,83,1,103,1,1,'2016-02-25 16:13:19'),(1,83,1,103,2,1,'2016-02-25 16:13:19'),(1,83,1,103,3,1,'2016-02-25 16:13:19'),(1,84,1,100,1,1,'2016-02-25 16:15:19'),(1,84,1,100,2,1,'2016-02-25 16:15:19'),(1,84,1,100,3,1,'2016-02-25 16:15:19'),(1,84,1,101,1,1,'2016-02-25 16:15:19'),(1,84,1,101,2,1,'2016-02-25 16:15:19'),(1,84,1,101,3,1,'2016-02-25 16:15:19'),(1,84,1,102,1,1,'2016-02-25 16:15:19'),(1,84,1,102,2,1,'2016-02-25 16:15:19'),(1,84,1,102,3,1,'2016-02-25 16:15:19'),(1,84,1,103,1,1,'2016-02-25 16:15:19'),(1,84,1,103,2,1,'2016-02-25 16:15:19'),(1,84,1,103,3,1,'2016-02-25 16:15:19'),(1,85,1,100,1,1,'2016-02-25 16:47:05'),(1,85,1,100,2,1,'2016-02-25 16:47:05'),(1,85,1,100,3,1,'2016-02-25 16:47:05'),(1,85,1,101,1,1,'2016-02-25 16:47:05'),(1,85,1,101,2,1,'2016-02-25 16:47:05'),(1,85,1,101,3,1,'2016-02-25 16:47:06'),(1,85,1,102,1,1,'2016-02-25 16:47:06'),(1,85,1,102,2,1,'2016-02-25 16:47:06'),(1,85,1,102,3,1,'2016-02-25 16:47:06'),(1,85,1,103,1,1,'2016-02-25 16:47:06'),(1,85,1,103,2,1,'2016-02-25 16:47:06'),(1,85,1,103,3,1,'2016-02-25 16:47:06'),(1,85,1,104,1,1,'2016-02-25 16:47:06'),(1,85,1,104,2,1,'2016-02-25 16:47:06'),(1,85,1,104,3,1,'2016-02-25 16:47:06'),(1,86,1,100,1,1,'2016-02-25 17:30:03'),(1,86,1,100,2,1,'2016-02-25 17:30:03'),(1,86,1,100,3,1,'2016-02-25 17:30:03'),(1,86,1,101,1,1,'2016-02-25 17:30:03'),(1,86,1,101,2,1,'2016-02-25 17:30:04'),(1,86,1,101,3,1,'2016-02-25 17:30:04'),(1,86,1,102,1,1,'2016-02-25 17:30:04'),(1,86,1,102,2,1,'2016-02-25 17:30:04'),(1,86,1,102,3,1,'2016-02-25 17:30:04'),(1,86,1,103,1,1,'2016-02-25 17:30:04'),(1,86,1,103,2,1,'2016-02-25 17:30:04'),(1,86,1,103,3,1,'2016-02-25 17:30:04'),(1,86,1,104,1,1,'2016-02-25 17:30:04'),(1,86,1,104,2,1,'2016-02-25 17:30:04'),(1,87,1,100,1,1,'2016-02-25 17:33:07'),(1,87,1,100,2,1,'2016-02-25 17:33:07'),(1,87,1,100,3,1,'2016-02-25 17:33:07'),(1,87,1,101,1,1,'2016-02-25 17:33:07'),(1,87,1,101,2,1,'2016-02-25 17:33:07'),(1,87,1,101,3,1,'2016-02-25 17:33:07'),(1,87,1,102,1,1,'2016-02-25 17:33:07'),(1,87,1,102,2,1,'2016-02-25 17:33:07'),(1,87,1,102,3,1,'2016-02-25 17:33:07'),(1,87,1,103,1,1,'2016-02-25 17:33:08'),(1,87,1,103,2,1,'2016-02-25 17:33:08'),(1,87,1,103,3,1,'2016-02-25 17:33:08'),(1,87,1,104,1,1,'2016-02-25 17:33:08'),(1,87,1,104,2,1,'2016-02-25 17:33:08'),(1,88,1,100,1,1,'2016-02-25 17:34:39'),(1,88,1,100,2,1,'2016-02-25 17:34:39'),(1,88,1,100,3,1,'2016-02-25 17:34:40'),(1,88,1,101,1,1,'2016-02-25 17:34:40'),(1,88,1,101,2,1,'2016-02-25 17:34:40'),(1,88,1,101,3,1,'2016-02-25 17:34:40'),(1,88,1,102,1,1,'2016-02-25 17:34:40'),(1,88,1,102,2,1,'2016-02-25 17:34:40'),(1,88,1,102,3,1,'2016-02-25 17:34:40'),(1,88,1,103,1,1,'2016-02-25 17:34:40'),(1,88,1,103,2,1,'2016-02-25 17:34:40'),(1,88,1,103,3,1,'2016-02-25 17:34:40'),(1,88,1,104,1,1,'2016-02-25 17:34:40'),(1,88,1,104,2,1,'2016-02-25 17:34:40'),(1,89,1,100,1,1,'2016-02-25 17:37:09'),(1,89,1,100,2,1,'2016-02-25 17:37:09'),(1,89,1,100,3,1,'2016-02-25 17:37:09'),(1,89,1,101,1,1,'2016-02-25 17:37:09'),(1,89,1,101,2,1,'2016-02-25 17:37:09'),(1,89,1,101,3,1,'2016-02-25 17:37:09'),(1,89,1,102,1,1,'2016-02-25 17:37:09'),(1,89,1,102,2,1,'2016-02-25 17:37:09'),(1,89,1,102,3,1,'2016-02-25 17:37:09'),(1,89,1,103,1,1,'2016-02-25 17:37:09'),(1,89,1,103,2,1,'2016-02-25 17:37:09'),(1,89,1,103,3,1,'2016-02-25 17:37:09'),(1,89,1,104,1,1,'2016-02-25 17:37:10'),(1,89,1,104,2,1,'2016-02-25 17:37:10'),(1,90,1,100,1,1,'2016-02-25 17:44:06'),(1,90,1,100,2,1,'2016-02-25 17:44:06'),(1,90,1,100,3,1,'2016-02-25 17:44:06'),(1,90,1,101,1,1,'2016-02-25 17:44:06'),(1,90,1,101,2,1,'2016-02-25 17:44:06'),(1,90,1,101,3,1,'2016-02-25 17:44:06'),(1,90,1,102,1,1,'2016-02-25 17:44:06'),(1,90,1,102,2,1,'2016-02-25 17:44:06'),(1,90,1,102,3,1,'2016-02-25 17:44:06'),(1,90,1,103,1,1,'2016-02-25 17:44:06'),(1,90,1,103,2,1,'2016-02-25 17:44:06'),(1,90,1,103,3,1,'2016-02-25 17:44:06'),(1,90,1,104,1,1,'2016-02-25 17:44:07'),(1,90,1,104,2,1,'2016-02-25 17:44:07'),(1,90,1,104,3,1,'2016-02-25 17:44:13'),(1,91,1,100,1,1,'2016-02-25 18:46:13'),(1,91,1,100,2,1,'2016-02-25 18:46:13'),(1,91,1,100,3,1,'2016-02-25 18:46:13'),(1,91,1,101,1,1,'2016-02-25 18:46:13'),(1,91,1,101,2,1,'2016-02-25 18:46:13'),(1,91,1,101,3,1,'2016-02-25 18:46:13'),(1,91,1,102,1,1,'2016-02-25 18:46:13'),(1,91,1,102,2,1,'2016-02-25 18:46:13'),(1,91,1,102,3,1,'2016-02-25 18:46:13'),(1,91,1,103,1,1,'2016-02-25 18:46:13'),(1,91,1,103,2,1,'2016-02-25 18:46:13'),(1,91,1,103,3,1,'2016-02-25 18:46:13'),(1,91,1,104,1,1,'2016-02-25 18:46:13'),(1,91,1,104,2,1,'2016-02-25 18:46:13'),(1,91,1,104,3,1,'2016-02-25 18:46:19'),(1,92,1,100,1,1,'2016-02-25 18:51:24'),(1,92,1,100,2,1,'2016-02-25 18:51:24'),(1,92,1,100,3,1,'2016-02-25 18:51:24'),(1,92,1,101,1,1,'2016-02-25 18:51:24'),(1,92,1,101,2,1,'2016-02-25 18:51:24'),(1,92,1,101,3,1,'2016-02-25 18:51:24'),(1,92,1,102,1,1,'2016-02-25 18:51:25'),(1,92,1,102,2,1,'2016-02-25 18:51:25'),(1,92,1,102,3,1,'2016-02-25 18:51:25'),(1,92,1,103,1,1,'2016-02-25 18:51:25'),(1,92,1,103,2,1,'2016-02-25 18:51:25'),(1,92,1,103,3,1,'2016-02-25 18:51:25'),(2,92,1,104,1,1,'2016-02-25 18:51:25'),(2,92,1,104,2,1,'2016-02-25 18:51:25'),(2,92,1,104,3,1,'2016-02-25 18:51:31'),(1,93,1,100,1,1,'2016-02-25 18:54:08'),(1,93,1,100,2,1,'2016-02-25 18:54:08'),(1,93,1,100,3,1,'2016-02-25 18:54:08'),(1,93,1,101,1,1,'2016-02-25 18:54:08'),(1,93,1,101,2,1,'2016-02-25 18:54:08'),(1,93,1,101,3,1,'2016-02-25 18:54:09'),(1,93,1,102,1,1,'2016-02-25 18:54:09'),(1,93,1,102,2,1,'2016-02-25 18:54:09'),(1,93,1,102,3,1,'2016-02-25 18:54:09'),(1,93,1,103,1,1,'2016-02-25 18:54:09'),(1,93,1,103,2,1,'2016-02-25 18:54:09'),(1,93,1,103,3,1,'2016-02-25 18:54:09'),(2,93,1,104,1,1,'2016-02-25 18:54:09'),(2,93,1,104,2,1,'2016-02-25 18:54:09'),(2,93,1,104,3,1,'2016-02-25 18:54:14'),(1,1,0,200,1,1,'2016-02-25 20:02:41'),(1,1,1,200,1,1,'2016-02-25 20:02:41'),(1,1,1,200,2,1,'2016-02-25 20:02:41'),(1,1,0,200,1,1,'2016-02-25 20:11:36'),(1,1,1,200,1,1,'2016-02-25 20:11:37'),(1,1,1,200,2,1,'2016-02-25 20:11:37'),(1,94,1,100,1,1,'2016-02-25 20:13:40'),(1,94,1,100,2,1,'2016-02-25 20:13:40'),(1,94,1,100,3,1,'2016-02-25 20:13:41'),(1,94,1,101,1,1,'2016-02-25 20:13:41'),(1,94,1,101,2,1,'2016-02-25 20:13:41'),(1,94,1,101,3,1,'2016-02-25 20:13:41'),(1,94,1,102,1,1,'2016-02-25 20:13:41'),(1,94,1,102,2,1,'2016-02-25 20:13:41'),(1,94,1,102,3,1,'2016-02-25 20:13:41'),(1,94,1,103,1,1,'2016-02-25 20:13:41'),(1,94,1,103,2,1,'2016-02-25 20:13:41'),(1,94,1,103,3,1,'2016-02-25 20:13:41'),(1,94,1,104,1,1,'2016-02-25 20:13:41'),(1,94,1,104,2,1,'2016-02-25 20:13:41'),(1,94,1,104,3,1,'2016-02-25 20:13:48'),(1,1,0,200,1,1,'2016-02-25 20:14:11'),(1,1,1,200,1,1,'2016-02-25 20:14:11'),(1,1,1,200,2,1,'2016-02-25 20:14:11'),(1,95,1,100,1,1,'2016-02-25 20:16:47'),(1,95,1,100,2,1,'2016-02-25 20:16:47'),(1,95,1,100,3,1,'2016-02-25 20:16:47'),(1,95,1,101,1,1,'2016-02-25 20:16:47'),(1,95,1,101,2,1,'2016-02-25 20:16:47'),(1,95,1,101,3,1,'2016-02-25 20:16:47'),(1,95,1,102,1,1,'2016-02-25 20:16:47'),(1,95,1,102,2,1,'2016-02-25 20:16:47'),(1,95,1,102,3,1,'2016-02-25 20:16:47'),(1,95,1,103,1,1,'2016-02-25 20:16:47'),(1,95,1,103,2,1,'2016-02-25 20:16:48'),(1,95,1,103,3,1,'2016-02-25 20:16:48'),(1,95,1,104,1,1,'2016-02-25 20:16:48'),(1,95,1,104,2,1,'2016-02-25 20:16:48'),(1,95,1,104,3,1,'2016-02-25 20:16:50'),(1,1,0,200,1,1,'2016-02-25 20:23:06'),(1,1,1,200,1,1,'2016-02-25 20:23:06'),(1,1,1,200,2,1,'2016-02-25 20:23:06'),(1,96,1,100,1,1,'2016-02-25 20:44:29'),(1,96,1,100,2,1,'2016-02-25 20:44:29'),(1,96,1,100,3,1,'2016-02-25 20:44:30'),(1,96,1,101,1,1,'2016-02-25 20:44:30'),(1,96,1,101,2,1,'2016-02-25 20:44:30'),(1,96,1,101,3,1,'2016-02-25 20:44:30'),(1,96,1,102,1,1,'2016-02-25 20:44:30'),(1,96,1,102,2,1,'2016-02-25 20:44:30'),(1,96,1,102,3,1,'2016-02-25 20:44:30'),(1,96,1,103,1,1,'2016-02-25 20:44:30'),(1,96,1,103,2,1,'2016-02-25 20:44:30'),(1,96,1,103,3,1,'2016-02-25 20:44:30'),(1,96,1,104,1,1,'2016-02-25 20:44:30'),(1,96,1,104,2,1,'2016-02-25 20:44:30'),(1,96,1,104,3,1,'2016-02-25 20:44:39'),(1,97,1,100,1,1,'2016-02-26 12:36:08'),(1,97,1,100,2,1,'2016-02-26 12:36:08'),(1,97,1,100,3,1,'2016-02-26 12:36:08'),(1,97,1,101,1,1,'2016-02-26 12:36:08'),(1,97,1,101,2,1,'2016-02-26 12:36:08'),(1,97,1,101,3,1,'2016-02-26 12:36:08'),(1,97,1,102,1,1,'2016-02-26 12:36:08'),(1,97,1,102,2,1,'2016-02-26 12:36:08'),(1,97,1,102,3,1,'2016-02-26 12:36:08'),(1,97,1,103,1,1,'2016-02-26 12:36:08'),(1,97,1,103,2,1,'2016-02-26 12:36:08'),(1,97,1,103,3,1,'2016-02-26 12:36:08'),(1,97,1,104,1,1,'2016-02-26 12:36:08'),(1,97,1,104,2,1,'2016-02-26 12:36:09'),(1,97,1,104,3,1,'2016-02-26 12:36:19'),(1,98,1,100,1,1,'2016-02-26 12:46:41'),(1,98,1,100,2,1,'2016-02-26 12:46:41'),(1,98,1,100,3,1,'2016-02-26 12:46:41'),(1,98,1,101,1,1,'2016-02-26 12:46:42'),(1,98,1,101,2,1,'2016-02-26 12:46:42'),(1,98,1,101,3,1,'2016-02-26 12:46:42'),(1,98,1,102,1,1,'2016-02-26 12:46:42'),(1,98,1,102,2,1,'2016-02-26 12:46:42'),(1,98,1,102,3,1,'2016-02-26 12:46:42'),(1,98,1,103,1,1,'2016-02-26 12:46:42'),(1,98,1,103,2,1,'2016-02-26 12:46:42'),(1,98,1,103,3,1,'2016-02-26 12:46:42'),(1,98,1,104,1,1,'2016-02-26 12:46:42'),(1,98,1,104,2,1,'2016-02-26 12:46:42'),(1,98,1,104,3,1,'2016-02-26 12:46:50'),(1,99,1,100,1,1,'2016-02-26 13:07:52'),(1,99,1,100,2,1,'2016-02-26 13:07:52'),(1,99,1,100,3,1,'2016-02-26 13:07:53'),(1,99,1,101,1,1,'2016-02-26 13:07:53'),(1,99,1,101,2,1,'2016-02-26 13:07:53'),(1,99,1,101,3,1,'2016-02-26 13:07:53'),(1,99,1,102,1,1,'2016-02-26 13:07:53'),(1,99,1,102,2,1,'2016-02-26 13:07:53'),(1,99,1,102,3,1,'2016-02-26 13:07:53'),(1,99,1,103,1,1,'2016-02-26 13:07:53'),(1,99,1,103,2,1,'2016-02-26 13:07:53'),(1,99,1,103,3,1,'2016-02-26 13:07:53'),(1,99,1,104,1,1,'2016-02-26 13:07:53'),(1,99,1,104,2,1,'2016-02-26 13:07:53'),(1,99,1,104,3,1,'2016-02-26 13:08:02'),(1,100,1,100,1,1,'2016-02-26 13:35:15'),(1,100,1,100,2,1,'2016-02-26 13:35:16'),(1,100,1,100,3,1,'2016-02-26 13:35:16'),(1,100,1,101,1,1,'2016-02-26 13:35:16'),(1,100,1,101,2,1,'2016-02-26 13:35:16'),(1,100,1,101,3,1,'2016-02-26 13:35:16'),(1,100,1,102,1,1,'2016-02-26 13:35:16'),(1,100,1,102,2,1,'2016-02-26 13:35:16'),(1,100,1,102,3,1,'2016-02-26 13:35:16'),(1,100,1,103,1,1,'2016-02-26 13:35:16'),(1,100,1,103,2,1,'2016-02-26 13:35:16'),(1,100,1,103,3,1,'2016-02-26 13:35:16'),(1,100,1,104,1,1,'2016-02-26 13:35:16'),(1,100,1,104,2,1,'2016-02-26 13:35:16'),(1,100,1,104,3,1,'2016-02-26 13:35:25'),(1,101,1,100,1,1,'2016-02-26 13:41:11'),(1,101,1,100,2,1,'2016-02-26 13:41:11'),(1,101,1,100,3,1,'2016-02-26 13:41:11'),(1,101,1,101,1,1,'2016-02-26 13:41:11'),(1,101,1,101,2,1,'2016-02-26 13:41:11'),(1,101,1,101,3,1,'2016-02-26 13:41:11'),(1,101,1,102,1,1,'2016-02-26 13:41:11'),(1,101,1,102,2,1,'2016-02-26 13:41:11'),(1,101,1,102,3,1,'2016-02-26 13:41:11'),(1,101,1,103,1,1,'2016-02-26 13:41:11'),(1,101,1,103,2,1,'2016-02-26 13:41:11'),(1,101,1,103,3,1,'2016-02-26 13:41:11'),(1,101,1,104,1,1,'2016-02-26 13:41:11'),(1,101,1,104,2,1,'2016-02-26 13:41:11'),(1,101,1,104,3,1,'2016-02-26 13:41:19'),(1,102,1,100,1,1,'2016-02-26 16:09:50'),(1,102,1,100,2,1,'2016-02-26 16:09:50'),(1,102,1,100,3,1,'2016-02-26 16:09:50'),(1,102,1,101,1,1,'2016-02-26 16:09:50'),(1,102,1,101,2,1,'2016-02-26 16:09:50'),(1,102,1,101,3,1,'2016-02-26 16:09:51'),(1,102,1,102,1,1,'2016-02-26 16:09:51'),(1,102,1,102,2,1,'2016-02-26 16:09:51'),(1,102,1,102,3,1,'2016-02-26 16:09:51'),(1,102,1,103,1,1,'2016-02-26 16:09:51'),(1,102,1,103,2,1,'2016-02-26 16:09:51'),(1,102,1,103,3,1,'2016-02-26 16:09:51'),(1,102,1,104,1,1,'2016-02-26 16:09:51'),(1,102,1,104,2,1,'2016-02-26 16:09:51'),(1,102,1,104,3,1,'2016-02-26 16:10:00'),(1,103,1,100,1,1,'2016-02-26 16:12:59'),(1,103,1,100,2,1,'2016-02-26 16:12:59'),(1,103,1,100,3,1,'2016-02-26 16:13:00'),(1,103,1,101,1,1,'2016-02-26 16:13:00'),(1,103,1,101,2,1,'2016-02-26 16:13:00'),(1,103,1,101,3,1,'2016-02-26 16:13:00'),(1,103,1,102,1,1,'2016-02-26 16:13:00'),(1,103,1,102,2,1,'2016-02-26 16:13:00'),(1,103,1,102,3,1,'2016-02-26 16:13:00'),(1,103,1,103,1,1,'2016-02-26 16:13:00'),(1,103,1,103,2,1,'2016-02-26 16:13:00'),(1,103,1,103,3,1,'2016-02-26 16:13:00'),(1,103,1,104,1,1,'2016-02-26 16:13:00'),(1,103,1,104,2,1,'2016-02-26 16:13:00'),(1,103,1,104,3,1,'2016-02-26 16:13:13'),(1,104,1,100,1,1,'2016-02-26 16:24:38'),(1,104,1,100,2,1,'2016-02-26 16:24:38'),(1,104,1,100,3,1,'2016-02-26 16:24:38'),(1,104,1,101,1,1,'2016-02-26 16:24:38'),(1,104,1,101,2,1,'2016-02-26 16:24:38'),(1,104,1,101,3,1,'2016-02-26 16:24:38'),(1,104,1,102,1,1,'2016-02-26 16:24:38'),(1,104,1,102,2,1,'2016-02-26 16:24:38'),(1,104,1,102,3,1,'2016-02-26 16:24:38'),(1,104,1,103,1,1,'2016-02-26 16:24:38'),(1,104,1,103,2,1,'2016-02-26 16:24:38'),(1,104,1,103,3,1,'2016-02-26 16:24:38'),(1,104,1,104,1,1,'2016-02-26 16:24:38'),(1,104,1,104,2,1,'2016-02-26 16:24:39'),(1,105,1,100,1,1,'2016-02-26 16:25:19'),(1,105,1,100,2,1,'2016-02-26 16:25:19'),(1,105,1,100,3,1,'2016-02-26 16:25:19'),(1,105,1,101,1,1,'2016-02-26 16:25:20'),(1,105,1,101,2,1,'2016-02-26 16:25:20'),(1,105,1,101,3,1,'2016-02-26 16:25:20'),(1,105,1,102,1,1,'2016-02-26 16:25:20'),(1,105,1,102,2,1,'2016-02-26 16:25:20'),(1,105,1,102,3,1,'2016-02-26 16:25:20'),(1,105,1,103,1,1,'2016-02-26 16:25:20'),(1,105,1,103,2,1,'2016-02-26 16:25:20'),(1,105,1,103,3,1,'2016-02-26 16:25:20'),(1,105,1,104,1,1,'2016-02-26 16:25:20'),(1,105,1,104,2,1,'2016-02-26 16:25:20'),(1,105,1,104,3,1,'2016-02-26 16:25:27'),(1,106,1,100,1,1,'2016-02-26 16:56:33'),(1,106,1,100,2,1,'2016-02-26 16:56:33'),(1,106,1,100,3,1,'2016-02-26 16:56:33'),(1,106,1,101,1,1,'2016-02-26 16:56:33'),(1,106,1,101,2,1,'2016-02-26 16:56:33'),(1,106,1,101,3,1,'2016-02-26 16:56:33'),(1,106,1,102,1,1,'2016-02-26 16:56:33'),(1,106,1,102,2,1,'2016-02-26 16:56:33'),(1,106,1,102,3,1,'2016-02-26 16:56:33'),(1,106,1,103,1,1,'2016-02-26 16:56:33'),(1,106,1,103,2,1,'2016-02-26 16:56:34'),(1,106,1,103,3,1,'2016-02-26 16:56:34'),(1,106,1,104,1,1,'2016-02-26 16:56:34'),(1,106,1,104,2,1,'2016-02-26 16:56:34'),(1,106,1,104,3,1,'2016-02-26 16:56:43'),(1,0,0,104,1,1,'2016-02-27 11:17:29'),(1,111,1,100,1,1,'2016-02-27 11:59:25'),(1,111,1,100,2,1,'2016-02-27 11:59:25'),(1,111,1,100,3,1,'2016-02-27 11:59:25'),(1,111,1,101,1,1,'2016-02-27 11:59:26'),(1,111,1,101,2,1,'2016-02-27 11:59:26'),(1,111,1,101,3,1,'2016-02-27 11:59:26'),(1,111,1,102,1,1,'2016-02-27 11:59:26'),(1,111,1,102,2,1,'2016-02-27 11:59:26'),(1,111,1,102,3,1,'2016-02-27 11:59:26'),(1,111,1,103,1,1,'2016-02-27 11:59:26'),(1,111,1,103,2,1,'2016-02-27 11:59:26'),(1,111,1,103,3,1,'2016-02-27 11:59:26'),(1,111,1,104,2,1,'2016-02-27 11:59:26'),(1,111,1,104,3,1,'2016-02-27 11:59:33'),(1,112,1,100,1,1,'2016-02-27 12:36:21'),(1,112,1,100,2,1,'2016-02-27 12:36:21'),(1,112,1,100,3,1,'2016-02-27 12:36:21'),(1,112,1,101,1,1,'2016-02-27 12:36:21'),(1,112,1,101,2,1,'2016-02-27 12:36:21'),(1,112,1,101,3,1,'2016-02-27 12:36:21'),(1,112,1,102,1,1,'2016-02-27 12:36:21'),(1,112,1,102,2,1,'2016-02-27 12:36:21'),(1,112,1,102,3,1,'2016-02-27 12:36:21'),(1,112,1,103,1,1,'2016-02-27 12:36:21'),(1,112,1,103,2,1,'2016-02-27 12:36:21'),(1,112,1,103,3,1,'2016-02-27 12:36:21'),(1,112,1,104,1,1,'2016-02-27 12:36:22'),(1,112,1,104,2,1,'2016-02-27 12:36:22'),(1,112,1,104,3,1,'2016-02-27 12:36:27'),(1,113,1,100,1,1,'2016-02-27 12:38:52'),(1,113,1,100,2,1,'2016-02-27 12:38:52'),(1,113,1,100,3,1,'2016-02-27 12:38:52'),(1,113,1,101,1,1,'2016-02-27 12:38:52'),(1,113,1,101,2,1,'2016-02-27 12:38:52'),(1,113,1,101,3,1,'2016-02-27 12:38:52'),(1,113,1,102,1,1,'2016-02-27 12:38:52'),(1,113,1,102,2,1,'2016-02-27 12:38:53'),(1,113,1,102,3,1,'2016-02-27 12:38:53'),(1,113,1,103,1,1,'2016-02-27 12:38:53'),(1,113,1,103,2,1,'2016-02-27 12:38:53'),(1,113,1,103,3,1,'2016-02-27 12:38:53'),(1,113,1,104,1,1,'2016-02-27 12:38:53'),(1,113,1,104,2,1,'2016-02-27 12:38:53'),(1,113,1,104,3,1,'2016-02-27 12:38:58'),(1,114,1,100,1,1,'2016-02-27 12:50:50'),(1,114,1,100,2,1,'2016-02-27 12:50:50'),(1,114,1,100,3,1,'2016-02-27 12:50:50'),(1,114,1,101,1,1,'2016-02-27 12:50:50'),(1,114,1,101,2,1,'2016-02-27 12:50:50'),(1,114,1,101,3,1,'2016-02-27 12:50:50'),(1,114,1,102,1,1,'2016-02-27 12:50:51'),(1,114,1,102,2,1,'2016-02-27 12:50:51'),(1,114,1,102,3,1,'2016-02-27 12:50:51'),(1,114,1,103,1,1,'2016-02-27 12:50:51'),(1,114,1,103,2,1,'2016-02-27 12:50:51'),(1,114,1,103,3,1,'2016-02-27 12:50:51'),(1,114,1,104,1,1,'2016-02-27 12:50:51'),(1,114,1,104,2,1,'2016-02-27 12:50:51'),(1,114,1,104,3,1,'2016-02-27 12:50:56'),(1,116,1,100,1,1,'2016-02-27 15:11:34'),(1,116,1,100,2,1,'2016-02-27 15:11:34'),(1,116,1,100,3,1,'2016-02-27 15:11:34'),(1,116,1,101,1,1,'2016-02-27 15:11:34'),(1,116,1,101,2,1,'2016-02-27 15:11:34'),(1,116,1,101,3,1,'2016-02-27 15:11:34'),(1,116,1,102,1,1,'2016-02-27 15:11:34'),(1,116,1,102,2,1,'2016-02-27 15:11:34'),(1,116,1,102,3,1,'2016-02-27 15:11:34'),(1,116,1,103,1,1,'2016-02-27 15:11:35'),(1,116,1,103,2,1,'2016-02-27 15:11:35'),(1,116,1,103,3,1,'2016-02-27 15:11:35'),(1,116,1,104,1,1,'2016-02-27 15:11:35'),(1,116,1,104,2,1,'2016-02-27 15:11:35'),(1,116,1,104,3,1,'2016-02-27 15:11:41'),(1,117,1,100,1,1,'2016-02-27 15:14:18'),(1,117,1,100,2,1,'2016-02-27 15:14:18'),(1,117,1,100,3,1,'2016-02-27 15:14:19'),(1,117,1,101,1,1,'2016-02-27 15:14:19'),(1,117,1,101,2,1,'2016-02-27 15:14:19'),(1,117,1,101,3,1,'2016-02-27 15:14:19'),(1,117,1,102,1,1,'2016-02-27 15:14:19'),(1,117,1,102,2,1,'2016-02-27 15:14:19'),(1,117,1,102,3,1,'2016-02-27 15:14:19'),(1,117,1,103,1,1,'2016-02-27 15:14:19'),(1,117,1,103,2,1,'2016-02-27 15:14:19'),(1,117,1,103,3,1,'2016-02-27 15:14:19'),(1,117,1,104,1,1,'2016-02-27 15:14:19'),(1,117,1,104,2,1,'2016-02-27 15:14:19'),(1,117,1,104,3,1,'2016-02-27 15:14:26'),(1,118,1,100,1,1,'2016-02-27 15:20:42'),(1,118,1,100,2,1,'2016-02-27 15:20:43'),(1,118,1,100,3,1,'2016-02-27 15:20:43'),(1,118,1,101,1,1,'2016-02-27 15:20:43'),(1,118,1,101,2,1,'2016-02-27 15:20:43'),(1,118,1,101,3,1,'2016-02-27 15:20:43'),(1,118,1,102,1,1,'2016-02-27 15:20:43'),(1,118,1,102,2,1,'2016-02-27 15:20:43'),(1,118,1,102,3,1,'2016-02-27 15:20:43'),(1,118,1,103,1,1,'2016-02-27 15:20:43'),(1,118,1,103,2,1,'2016-02-27 15:20:43'),(1,118,1,103,3,1,'2016-02-27 15:20:43'),(1,118,1,104,1,1,'2016-02-27 15:20:44'),(1,118,1,104,2,1,'2016-02-27 15:20:44'),(1,118,1,104,3,1,'2016-02-27 15:20:48'),(1,119,1,100,1,1,'2016-02-27 15:41:47'),(1,119,1,100,2,1,'2016-02-27 15:41:47'),(1,119,1,100,3,1,'2016-02-27 15:41:47'),(1,119,1,101,1,1,'2016-02-27 15:41:47'),(1,119,1,101,2,1,'2016-02-27 15:41:47'),(1,119,1,101,3,1,'2016-02-27 15:41:47'),(1,119,1,102,1,1,'2016-02-27 15:41:47'),(1,119,1,102,2,1,'2016-02-27 15:41:47'),(1,119,1,102,3,1,'2016-02-27 15:41:47'),(1,119,1,103,1,1,'2016-02-27 15:41:47'),(1,119,1,103,2,1,'2016-02-27 15:41:47'),(1,119,1,103,3,1,'2016-02-27 15:41:47'),(1,119,1,104,1,1,'2016-02-27 15:41:47'),(1,119,1,104,2,1,'2016-02-27 15:41:48'),(1,119,1,104,3,1,'2016-02-27 15:41:52'),(1,1,1,100,1,1,'2016-03-02 12:32:42'),(1,1,1,100,2,1,'2016-03-02 12:32:42'),(1,1,1,100,3,1,'2016-03-02 12:32:42'),(1,1,1,101,1,1,'2016-03-02 12:32:42'),(1,1,1,101,2,1,'2016-03-02 12:32:42'),(1,1,1,101,3,1,'2016-03-02 12:32:42'),(1,1,1,102,1,1,'2016-03-02 12:32:42'),(1,1,1,102,2,1,'2016-03-02 12:32:42'),(1,1,1,102,3,1,'2016-03-02 12:32:42'),(1,1,1,103,1,1,'2016-03-02 12:32:42'),(1,1,1,103,2,1,'2016-03-02 12:32:42'),(1,1,1,103,3,1,'2016-03-02 12:32:42'),(1,2,1,100,1,1,'2016-03-02 13:19:34'),(1,2,1,100,2,1,'2016-03-02 13:19:34'),(1,2,1,100,3,1,'2016-03-02 13:19:34'),(1,2,1,101,1,1,'2016-03-02 13:19:34'),(1,2,1,101,2,1,'2016-03-02 13:19:34'),(1,2,1,101,3,1,'2016-03-02 13:19:34'),(1,2,1,102,1,1,'2016-03-02 13:19:34'),(1,2,1,102,2,1,'2016-03-02 13:19:34'),(1,2,1,102,3,1,'2016-03-02 13:19:34'),(1,2,1,103,1,1,'2016-03-02 13:19:34'),(1,2,1,103,2,1,'2016-03-02 13:19:34'),(1,2,1,103,3,1,'2016-03-02 13:19:34'),(1,4,1,100,1,1,'2016-03-03 15:18:35'),(1,4,1,100,2,1,'2016-03-03 15:18:35'),(1,4,1,100,3,1,'2016-03-03 15:18:35'),(1,4,1,101,1,1,'2016-03-03 15:18:35'),(1,4,1,101,2,1,'2016-03-03 15:18:35'),(1,4,1,101,3,1,'2016-03-03 15:18:35'),(1,4,1,102,1,1,'2016-03-03 15:18:35'),(1,4,1,102,2,1,'2016-03-03 15:18:35'),(1,4,1,102,3,1,'2016-03-03 15:18:35'),(1,4,1,103,1,1,'2016-03-03 15:18:35'),(1,4,1,103,2,1,'2016-03-03 15:18:35'),(1,4,1,103,3,1,'2016-03-03 15:18:35'),(1,5,1,100,1,1,'2016-03-03 15:41:23'),(1,5,1,100,2,1,'2016-03-03 15:41:23'),(1,5,1,100,3,1,'2016-03-03 15:41:23'),(1,5,1,101,1,1,'2016-03-03 15:41:23'),(1,5,1,101,2,1,'2016-03-03 15:41:23'),(1,5,1,101,3,1,'2016-03-03 15:41:23'),(1,5,1,102,1,1,'2016-03-03 15:41:23'),(1,5,1,102,2,1,'2016-03-03 15:41:23'),(1,5,1,102,3,1,'2016-03-03 15:41:23'),(1,5,1,103,1,1,'2016-03-03 15:41:23'),(1,5,1,103,2,1,'2016-03-03 15:41:23'),(1,5,1,103,3,1,'2016-03-03 15:41:23'),(1,6,1,100,1,1,'2016-03-03 15:49:13'),(1,6,1,100,2,1,'2016-03-03 15:49:13'),(1,6,1,100,3,1,'2016-03-03 15:49:13'),(1,6,1,101,1,1,'2016-03-03 15:49:13'),(1,6,1,101,2,1,'2016-03-03 15:49:13'),(1,6,1,101,3,1,'2016-03-03 15:49:13'),(1,6,1,102,1,1,'2016-03-03 15:49:13'),(1,6,1,102,2,1,'2016-03-03 15:49:13'),(1,6,1,102,3,1,'2016-03-03 15:49:13'),(1,6,1,103,1,1,'2016-03-03 15:49:13'),(1,6,1,103,2,1,'2016-03-03 15:49:13'),(1,6,1,103,3,1,'2016-03-03 15:49:13'),(1,7,1,100,1,1,'2016-03-03 15:51:13'),(1,7,1,100,2,1,'2016-03-03 15:51:13'),(1,7,1,100,3,1,'2016-03-03 15:51:13'),(1,7,1,101,1,1,'2016-03-03 15:51:13'),(1,7,1,101,2,1,'2016-03-03 15:51:13'),(1,7,1,101,3,1,'2016-03-03 15:51:13'),(1,7,1,102,1,1,'2016-03-03 15:51:13'),(1,7,1,102,2,1,'2016-03-03 15:51:13'),(1,7,1,102,3,1,'2016-03-03 15:51:13'),(1,7,1,103,1,1,'2016-03-03 15:51:13'),(1,7,1,103,2,1,'2016-03-03 15:51:13'),(1,7,1,103,3,1,'2016-03-03 15:51:13'),(1,8,1,100,1,1,'2016-03-03 15:51:44'),(1,8,1,100,2,1,'2016-03-03 15:51:44'),(1,8,1,100,3,1,'2016-03-03 15:51:44'),(1,8,1,101,1,1,'2016-03-03 15:51:44'),(1,8,1,101,2,1,'2016-03-03 15:51:44'),(1,8,1,101,3,1,'2016-03-03 15:51:44'),(1,8,1,102,1,1,'2016-03-03 15:51:44'),(1,8,1,102,2,1,'2016-03-03 15:51:44'),(1,8,1,102,3,1,'2016-03-03 15:51:44'),(1,8,1,103,1,1,'2016-03-03 15:51:44'),(1,8,1,103,2,1,'2016-03-03 15:51:44'),(1,8,1,103,3,1,'2016-03-03 15:51:44'),(1,9,1,100,1,1,'2016-03-03 16:27:02'),(1,9,1,100,2,1,'2016-03-03 16:27:02'),(1,9,1,100,3,1,'2016-03-03 16:27:02'),(1,9,1,101,1,1,'2016-03-03 16:27:02'),(1,9,1,101,2,1,'2016-03-03 16:27:02'),(1,9,1,101,3,1,'2016-03-03 16:27:02'),(1,9,1,102,1,1,'2016-03-03 16:27:02'),(1,9,1,102,2,1,'2016-03-03 16:27:02'),(1,9,1,102,3,1,'2016-03-03 16:27:02'),(1,9,1,103,1,1,'2016-03-03 16:27:02'),(1,9,1,103,2,1,'2016-03-03 16:27:02'),(1,9,1,103,3,1,'2016-03-03 16:27:02'),(1,10,1,100,1,1,'2016-03-03 17:58:42'),(1,10,1,100,2,1,'2016-03-03 17:58:42'),(1,10,1,100,3,1,'2016-03-03 17:58:42'),(1,10,1,101,1,1,'2016-03-03 17:58:42'),(1,10,1,101,2,1,'2016-03-03 17:58:42'),(1,10,1,101,3,1,'2016-03-03 17:58:42'),(1,10,1,102,1,1,'2016-03-03 17:58:42'),(1,10,1,102,2,1,'2016-03-03 17:58:42'),(1,10,1,102,3,1,'2016-03-03 17:58:42'),(1,10,1,103,1,1,'2016-03-03 17:58:42'),(1,10,1,103,2,1,'2016-03-03 17:58:42'),(1,10,1,103,3,1,'2016-03-03 17:58:42');
/*!40000 ALTER TABLE `dupload_log_history` ENABLE KEYS */;
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
  `rule_condition` longtext NOT NULL,
  `rule_action` varchar(500) DEFAULT NULL,
  `rule_failure` varchar(500) DEFAULT NULL,
  `rule_comments` varchar(100) DEFAULT NULL COMMENT 'SOP, CUST etc',
  `rule_status` tinyint(1) DEFAULT NULL,
  `rule_order` int(11) DEFAULT NULL,
  `lastupuser` char(6) NOT NULL COMMENT 'user ID audit trail',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone',
  `effective_startdate` date DEFAULT NULL,
  `effective_enddate` date DEFAULT NULL,
  `rule_type` varchar(15) DEFAULT NULL,
  `rule_category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`efs_uin`,`rule_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cstandardrules`
--

LOCK TABLES `cstandardrules` WRITE;
/*!40000 ALTER TABLE `cstandardrules` DISABLE KEYS */;
INSERT INTO `cstandardrules` VALUES ('cefs100101','rule1013','rs1002','zero invoice amount rule','ip:iPost() and form:ixsd_cefs100101(invoice_amount.equals(100))','form.setQueue(\"Route to Storage Repository\");','form.setQueue(\"Route to Storage Repository\");','check invoice amount to zero',1,13,'1','2016-03-04 17:10:26','2018-01-28','2024-09-04','header','daas'),('cefs100101','rule1018','rs1002','Field Missing Rule','ip:iPost() and form:ixsd_cefs100101(invoice_amount.equals(\"null\") , invoice_date .equals(\"null\") , invoice_number.equals(\"null\") , po_number.equals(\"null\"))','ip.setNext_channel(\"exit_channel\");','ip.setNext_channel(\"exit_channel\");','If any of the following rule is missing , this rue will fire',1,15,'1','2016-03-04 17:19:57','2015-11-30','2017-02-22','header','daas'),('cefs100101','rule1019','rs1002','Image illegible','ip:iPost() and form:ixsd_cefs100101(frieght_term.equals(\"#\") , invoice_amount.equals(\"#\") , invoice_date.equals(\"#\") , invoice_number.equals(\"#\") , po_number.equals(\"#\"))','ip.setNext_channel(\"exit_channel\");','ip.setNext_channel(\"exit_channel\");','following fields could not read from po image',1,16,'1','2016-03-04 17:20:03','2015-12-08','2016-07-23','header','daas'),('cefs100101','rule1020','rs1002','Invalid invoice date','ip:iPost() and form:ixsd_cefs100101(invoice_date.getMonth() >12)','ip.setNext_channel(\"exit_channel\");','ip.setNext_channel(\"exit_channel\");','invoice date is invalid',1,17,'1','2016-03-04 17:20:11','2015-12-15','2016-07-27','header','daas'),('cefs100101','rule1021','rs1002','FREIGHT, SURCHARGE TAX ILLEGIBLE','ip:iPost() and form:ixsd_cefs100101(frieght_term.equals(\"#\"))','ip.setNext_channel(\"exit_channel\");','ip.setNext_channel(\"exit_channel\");','FREIGHT, SURCHARGE TAX ILLEGIBLE',1,18,'1','2016-03-04 17:20:17','2015-12-07','2016-05-14','header','daas');
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
  PRIMARY KEY (`content_uin`)
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
INSERT INTO `customer_flow` VALUES (1,'cefs100101','{\"class\":\"go.GraphLinksModel\",\"nodeDataArray\":[{\"category\":\"Rectangledaas\",\"text\":\"daas.inventory\",\"key\":\"csfs100101\",\"demokey\":\"csfs100101\",\"loc\":\"-398.961028343023 -343.5255813953483\"},{\"category\":\"Start\",\"text\":\"Start\",\"key\":\"Start\",\"loc\":\"-558.9610283430229 -343.5255813953488\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.fullextract\",\"key\":\"csfs100102\",\"demokey\":\"csfs100102\",\"loc\":\"-248.96102834302343 -343.5255813953487\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.classify\",\"key\":\"csfs100103\",\"demokey\":\"csfs100103\",\"loc\":\"-150.96102834302275 -395.5255813953487\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.index\",\"key\":\"csfs100104\",\"demokey\":\"csfs100104\",\"loc\":\"-17.96102834302289 -374.525581395349\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.split_merge\",\"key\":\"csfs100105\",\"demokey\":\"csfs100105\",\"loc\":\"148.03897165697708 -422.52558139534864\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.extract\",\"key\":\"csfs100106\",\"demokey\":\"csfs100106\",\"loc\":\"312.03897165697697 -383.52558139534875\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.batch\",\"key\":\"csfs100107\",\"demokey\":\"csfs100107\",\"loc\":\"258.0389716569768 -280.5255813953488\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.keywise\",\"key\":\"csfs100108\",\"demokey\":\"csfs100108\",\"loc\":\"382.71084665697686 -232.7348837209302\"},{\"category\":\"Rectangledaas\",\"text\":\"daas.baashandoff\",\"key\":\"csfs100109\",\"demokey\":\"csfs100109\",\"loc\":\"363.7108466569771 -95.73488372093021\"},{\"category\":\"Rectanglebaas\",\"text\":\"baas.workflow\",\"key\":\"csfs100120\",\"demokey\":\"csfs100120\",\"loc\":\"191.00154433139573 -117.73488372093021\"},{\"category\":\"Rectanglebaas\",\"text\":\"baas.reject\",\"key\":\"csfs100121\",\"demokey\":\"csfs100121\",\"loc\":\"49.001544331395735 -140.7348837209302\"},{\"category\":\"Rectangleoaas\",\"text\":\"oaas.output\",\"key\":\"csfs100140\",\"demokey\":\"csfs100140\",\"loc\":\"-81.99845566860427 -182.7348837209302\"},{\"category\":\"Rectangleoaas\",\"text\":\"oaas.rejects\",\"key\":\"csfs100142\",\"demokey\":\"csfs100142\",\"loc\":\"-210.99845566860427 -203.7348837209302\"},{\"category\":\"Rectangleoaas\",\"text\":\"oaas.hml\",\"key\":\"csfs100143\",\"demokey\":\"csfs100143\",\"loc\":\"-327.99845566860427 -236.7348837209302\"},{\"category\":\"Rectangleoaas\",\"text\":\"oaas.shipment\",\"key\":\"csfs100141\",\"demokey\":\"csfs100141\",\"loc\":\"-457.99845566860404 -232.73488372093004\"},{\"category\":\"End\",\"text\":\"End\",\"key\":\"End\",\"loc\":\"-468.99845566860415 -110.73488372093026\"}],\"linkDataArray\":[{\"from\":\"Start\",\"to\":\"csfs100101\"},{\"from\":\"csfs100102\",\"to\":\"csfs100103\"},{\"from\":\"csfs100103\",\"to\":\"csfs100104\"},{\"from\":\"csfs100104\",\"to\":\"csfs100105\"},{\"from\":\"csfs100105\",\"to\":\"csfs100106\"},{\"from\":\"csfs100106\",\"to\":\"csfs100107\"},{\"from\":\"csfs100107\",\"to\":\"csfs100108\"},{\"from\":\"csfs100108\",\"to\":\"csfs100109\"},{\"from\":\"csfs100109\",\"to\":\"csfs100120\"},{\"from\":\"csfs100120\",\"to\":\"csfs100121\"},{\"from\":\"csfs100121\",\"to\":\"csfs100140\"},{\"from\":\"csfs100140\",\"to\":\"csfs100142\"},{\"from\":\"csfs100142\",\"to\":\"csfs100143\"},{\"from\":\"csfs100143\",\"to\":\"csfs100141\"},{\"from\":\"csfs100101\",\"to\":\"csfs100102\"},{\"from\":\"csfs100141\",\"to\":\"End\"}]}');
/*!40000 ALTER TABLE `customer_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbaas_workflow`
--

DROP TABLE IF EXISTS `cbaas_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbaas_workflow` (
  `baas_id` char(7) NOT NULL,
  `BPaaS_id` varchar(12) NOT NULL,
  `efs_uin` varchar(12) NOT NULL,
  `cruleset_id` char(10) DEFAULT NULL,
  `decision` varchar(100) DEFAULT NULL,
  `lastupuser` varchar(10) DEFAULT NULL,
  `lastupdtm` datetime DEFAULT NULL,
  PRIMARY KEY (`baas_id`,`BPaaS_id`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbaas_workflow`
--

LOCK TABLES `cbaas_workflow` WRITE;
/*!40000 ALTER TABLE `cbaas_workflow` DISABLE KEYS */;
INSERT INTO `cbaas_workflow` VALUES ('b0001','ch100101','cefs100101','rs1002','exception','1','2016-02-03 17:01:44');
/*!40000 ALTER TABLE `cbaas_workflow` ENABLE KEYS */;
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
INSERT INTO `crules` VALUES ('rl1001','ValidationSuccess','TestRuleFor Demo','SOP','Root','2015-11-03 11:56:31'),('rl1002','ValidationFailiure','TestRuleFor Demo','SOP','Root','2015-11-04 15:04:06'),('rl1003','ValidationFailiure1','Custom rule ValidationFailiure1','CUST','1','2015-11-26 15:45:11'),('rl1004','form_validation','form_validation','CUST','1','2015-11-26 15:45:11'),('rl1005','','Custom rule ','CUST','1','2015-12-16 14:18:43'),('rl1006','','Custom rule ','CUST','1','2016-01-10 13:14:20'),('rl1007','','Custom rule ','CUST','1','2016-01-10 13:18:28'),('rl1008','','Custom rule ','CUST','1','2016-01-10 13:23:40'),('rl1009','','Custom rule ','CUST','1','2016-01-10 16:43:55'),('rl1010','','Custom rule ','CUST','1','2016-01-10 16:57:06'),('rl1011','','Custom rule ','CUST','1','2016-01-10 17:16:36'),('rl1012','','Custom rule ','CUST','1','2016-01-12 11:10:18'),('rl1013','','Custom rule ','CUST','1','2016-01-12 11:13:20'),('rl1014','','Custom rule ','CUST','1','2016-01-12 11:31:54'),('rl1015','','Custom rule ','CUST','1','2016-01-12 11:32:33'),('rl1016','','Custom rule ','CUST','1','2016-01-12 11:35:32'),('rl1017','','Custom rule ','CUST','1','2016-01-12 11:42:04'),('rl1018','','Custom rule ','CUST','1','2016-01-12 11:54:32'),('rl1019','','Custom rule ','CUST','1','2016-01-12 13:38:34'),('rl1020','','Custom rule ','CUST','1','2016-01-12 16:18:34'),('rl1021','','Custom rule ','CUST','1','2016-01-18 16:25:21'),('rl1022','','Custom rule ','CUST','1','2016-01-18 16:53:34'),('rl1023','','Custom rule ','CUST','1','2016-01-18 16:57:23'),('rl1024','','Custom rule ','CUST','1','2016-01-18 16:58:39'),('rl1025','','Custom rule ','CUST','1','2016-01-18 16:59:35'),('rl1026','','Custom rule ','CUST','1','2016-01-18 17:02:08'),('rl1027','','Custom rule ','CUST','1','2016-01-22 11:03:23'),('rl1028','','Custom rule ','CUST','1','2016-02-12 17:10:02'),('rl1029','','Custom rule ','CUST','1','2016-02-22 16:17:49'),('rl1030','','Custom rule ','CUST','1','2016-02-22 16:19:39'),('rl1031','','Custom rule ','CUST','1','2016-02-22 16:20:51'),('rl1032','','Custom rule ','CUST','1','2016-02-22 16:21:15'),('rl1033','','Custom rule ','CUST','1','2016-02-22 16:21:43'),('rl1034','','Custom rule ','CUST','1','2016-02-22 16:21:44'),('rl1035','','Custom rule ','CUST','1','2016-02-25 20:32:49');
/*!40000 ALTER TABLE `crules` ENABLE KEYS */;
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
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_description` varchar(100) DEFAULT NULL,
  `role_homepage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','pages/hethistudio/admin/admin_home.html'),(2,'Artist','pages/hethistudio/artist/artist_home.html'),(3,'User','pages/hethi/home_page.html'),(4,'Manager','pages/hethi/home_page.html'),(5,'Supervisor','pages/hethi/home_page.html'),(6,'Operator','pages/hethi/home_page.html'),(7,'System Administrator','pages/hethi/home_page.html'),(8,'Administrator','pages/hethi/home_page.html'),(9,'Operations Partner','\'pages/roles/operations_partner/homepage.html'),(10,'Platform Partner','\'pages/roles/operations_partner/homepage.html'),(11,'Business Artist','pages/hethi/home_page.html'),(12,'Sales Partner','pages/hethi/home_page.html'),(13,'Business Finance','pages/hethi/home_page.html'),(14,'Quality Partner','pages/hethi/home_page.html'),(15,'Platform PMO','pages/hethi/home_page.html');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
  UNIQUE KEY `XPKPackage_Workset_Connect` (`Package_ID`,`Rule_Workset_ID`)
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
-- Table structure for table `dupload_log_status`
--

DROP TABLE IF EXISTS `dupload_log_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dupload_log_status` (
  `status_id` bigint(20) NOT NULL,
  `status_text` varchar(50) DEFAULT NULL,
  `lastupuser` char(11) NOT NULL COMMENT 'user ID audit trail\\\\n',
  `lastupdtm` datetime NOT NULL COMMENT 'auto fill server date and time zone\\n',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dupload_log_status`
--

LOCK TABLES `dupload_log_status` WRITE;
/*!40000 ALTER TABLE `dupload_log_status` DISABLE KEYS */;
INSERT INTO `dupload_log_status` VALUES (1,'Start','1','2016-02-16 15:28:31'),(2,'Progress','1','2016-02-16 15:28:31'),(3,'Complete','1','2016-02-16 15:28:31'),(4,'Hold','1','2016-02-16 15:28:31'),(5,'Exception','1','2016-02-16 15:28:31'),(6,'Error','1','2016-02-16 15:28:31');
/*!40000 ALTER TABLE `dupload_log_status` ENABLE KEYS */;
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
  UNIQUE KEY `XPKeFs_Field` (`eFS_Field_Id`,`eFS_ID`,`Input_Source_Id`)
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
INSERT INTO `dcustomer_output` VALUES (1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286219436.xml','','RNT01','2016-01-20 16:09:04'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286219436_ixml.xml','','RNT01','2016-01-20 16:09:05'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286225269.xml','','RNT01','2016-01-20 16:09:10'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286225269_ixml.xml','','RNT01','2016-01-20 16:09:10'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286851628.xml','','RNT01','2016-01-20 16:19:37'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286851628_ixml.xml','','RNT01','2016-01-20 16:19:37'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286858608.xml','','RNT01','2016-01-20 16:19:44'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453286858608_ixml.xml','','RNT01','2016-01-20 16:19:44'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453349637724.xml','','RNT01','2016-01-21 09:46:06'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453349637724_ixml.xml','','RNT01','2016-01-21 09:46:10'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453349679506.xml','','RNT01','2016-01-21 09:46:47'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453349679506_ixml.xml','','RNT01','2016-01-21 09:46:47'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453351306800.xml','','RNT01','2016-01-21 10:13:55'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453351306800_ixml.xml','','RNT01','2016-01-21 10:13:58'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453351346307.xml','','RNT01','2016-01-21 10:14:33'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453351346307_ixml.xml','','RNT01','2016-01-21 10:14:34'),(1,'','cefs100101','1','1','1','HML','D:/Workspace/source/hareesh/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453372558412.xml','','RNT01','2016-01-21 13:35:58'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453363582046.xml','','RNT01','2016-01-21 13:38:28'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453363582046_ixml.xml','','RNT01','2016-01-21 13:38:29'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453363589247.xml','','RNT01','2016-01-21 13:38:35'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453363589247_ixml.xml','','RNT01','2016-01-21 13:38:35'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453366342341.xml','','RNT01','2016-01-21 14:24:29'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453366342341_ixml.xml','','RNT01','2016-01-21 14:24:29'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453366347899.xml','','RNT01','2016-01-21 14:24:34'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453366347899_ixml.xml','','RNT01','2016-01-21 14:24:34'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367038018.xml','','RNT01','2016-01-21 14:36:04'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367038018_ixml.xml','','RNT01','2016-01-21 14:36:05'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367043775.xml','','RNT01','2016-01-21 14:36:10'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367043775_ixml.xml','','RNT01','2016-01-21 14:36:10'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367596130.xml','','RNT01','2016-01-21 14:45:23'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367596130_ixml.xml','','RNT01','2016-01-21 14:45:23'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367602480.xml','','RNT01','2016-01-21 14:45:29'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453367602480_ixml.xml','','RNT01','2016-01-21 14:45:29'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453437868084.xml','','RNT01','2016-01-22 10:16:35'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453437868084_ixml.xml','','RNT01','2016-01-22 10:16:36'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453437877567.xml','','RNT01','2016-01-22 10:16:44'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453437877567_ixml.xml','','RNT01','2016-01-22 10:16:44'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453438156892.xml','','RNT01','2016-01-22 10:21:24'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453438156892_ixml.xml','','RNT01','2016-01-22 10:21:24'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453438164004.xml','','RNT01','2016-01-22 10:21:31'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453438164004_ixml.xml','','RNT01','2016-01-22 10:21:31'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453439671912.xml','','RNT01','2016-01-22 10:46:41'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453439671912_ixml.xml','','RNT01','2016-01-22 10:46:43'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453439706201.xml','','RNT01','2016-01-22 10:47:15'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453439706201_ixml.xml','','RNT01','2016-01-22 10:47:15'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440454637.xml','','RNT01','2016-01-22 10:59:43'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440454637_ixml.xml','','RNT01','2016-01-22 10:59:46'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440482035.xml','','RNT01','2016-01-22 11:00:10'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440482035_ixml.xml','','RNT01','2016-01-22 11:00:10'),(1,'','cefs100101','1','1','1','HML','D:/Workspace/source/saifudheen/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449886474.xml','','RNT01','2016-01-22 11:04:46'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440825819.xml','','RNT01','2016-01-22 11:05:56'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440825819_ixml.xml','','RNT01','2016-01-22 11:06:02'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440910204.xml','','RNT01','2016-01-22 11:07:20'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453440910204_ixml.xml','','RNT01','2016-01-22 11:07:21'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453441991890.xml','','RNT01','2016-01-22 11:25:21'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453441991890_ixml.xml','','RNT01','2016-01-22 11:25:24'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453442739226.xml','','RNT01','2016-01-22 11:37:47'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453442739226_ixml.xml','','RNT01','2016-01-22 11:37:47'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453442748791.xml','','RNT01','2016-01-22 11:37:56'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453442748791_ixml.xml','','RNT01','2016-01-22 11:37:56'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453443793192.xml','','RNT01','2016-01-22 11:55:20'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453443793192_ixml.xml','','RNT01','2016-01-22 11:55:21'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453443799479.xml','','RNT01','2016-01-22 11:55:27'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453443799479_ixml.xml','','RNT01','2016-01-22 11:55:27'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444579860.xml','','RNT01','2016-01-22 12:08:27'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444579860_ixml.xml','','RNT01','2016-01-22 12:08:27'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444585819.xml','','RNT01','2016-01-22 12:08:33'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444585819_ixml.xml','','RNT01','2016-01-22 12:08:33'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444858479.xml','','RNT01','2016-01-22 12:13:06'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444858479_ixml.xml','','RNT01','2016-01-22 12:13:06'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444864909.xml','','RNT01','2016-01-22 12:13:12'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453444864909_ixml.xml','','RNT01','2016-01-22 12:13:12'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448164497.xml','','RNT01','2016-01-22 13:08:12'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448164497_ixml.xml','','RNT01','2016-01-22 13:08:12'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448170896.xml','','RNT01','2016-01-22 13:08:18'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448170896_ixml.xml','','RNT01','2016-01-22 13:08:18'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448724464.xml','','RNT01','2016-01-22 13:17:32'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448724464_ixml.xml','','RNT01','2016-01-22 13:17:32'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448730325.xml','','RNT01','2016-01-22 13:17:38'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448730325_ixml.xml','','RNT01','2016-01-22 13:17:38'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448781982.xml','','RNT01','2016-01-22 13:18:29'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448781982_ixml.xml','','RNT01','2016-01-22 13:18:29'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448787029.xml','','RNT01','2016-01-22 13:18:34'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453448787029_ixml.xml','','RNT01','2016-01-22 13:18:34'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449283625.xml','','RNT01','2016-01-22 13:26:51'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449283625_ixml.xml','','RNT01','2016-01-22 13:26:51'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449289537.xml','','RNT01','2016-01-22 13:26:57'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453449289537_ixml.xml','','RNT01','2016-01-22 13:26:57'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450375543.xml','','RNT01','2016-01-22 13:45:03'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450375543_ixml.xml','','RNT01','2016-01-22 13:45:03'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450381630.xml','','RNT01','2016-01-22 13:45:09'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450381630_ixml.xml','','RNT01','2016-01-22 13:45:09'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450866318.xml','','RNT01','2016-01-22 13:53:14'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450866318_ixml.xml','','RNT01','2016-01-22 13:53:14'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450872232.xml','','RNT01','2016-01-22 13:53:20'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453450872232_ixml.xml','','RNT01','2016-01-22 13:53:20'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453451110647.xml','','RNT01','2016-01-22 13:57:18'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453451110647_ixml.xml','','RNT01','2016-01-22 13:57:18'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453451116625.xml','','RNT01','2016-01-22 13:57:24'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453451116625_ixml.xml','','RNT01','2016-01-22 13:57:24'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453454694297.xml','','RNT01','2016-01-22 14:57:02'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453454694297_ixml.xml','','RNT01','2016-01-22 14:57:03'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453454700231.xml','','RNT01','2016-01-22 14:57:08'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453454700231_ixml.xml','','RNT01','2016-01-22 14:57:08'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453460345162.xml','','RNT01','2016-01-22 16:31:14'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453460345162_ixml.xml','','RNT01','2016-01-22 16:31:14'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453460351295.xml','','RNT01','2016-01-22 16:31:20'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453460351295_ixml.xml','','RNT01','2016-01-22 16:31:20'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453462866247.xml','','RNT01','2016-01-22 17:13:15'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453462866247_ixml.xml','','RNT01','2016-01-22 17:13:15'),(1,'','cefs100101','1','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453462872605.xml','','RNT01','2016-01-22 17:13:21'),(1,'','cefs100101','1','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1453462872605_ixml.xml','','RNT01','2016-01-22 17:13:21'),(1,'','cefs100101','1','1','1','HML','E:/Workspace/saif/hethi.services/src/main/resources/hml/hml_cefs100101_1_1456411620102.xml','','RNT01','2016-02-25 20:17:07'),(1,'','cefs100101','1','1','1','IXML','E:/Workspace/saif/hethi.services/src/main/resources/hml/hml_cefs100101_1_1456411620102_ixml.xml','','RNT01','2016-02-25 20:17:07'),(1,'','cefs100101','1','1','1','HML','E:/Workspace/saif/hethi.services/src/main/resources/hml/hml_cefs100101_1_1456412157668.xml','','RNT01','2016-02-25 20:26:04'),(1,'','cefs100101','1','1','1','IXML','E:/Workspace/saif/hethi.services/src/main/resources/hml/hml_cefs100101_1_1456412157668_ixml.xml','','RNT01','2016-02-25 20:26:04'),(1,'','cefs100101','159','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1455348615023.xml','','RNT01','2016-02-13 13:02:53'),(1,'','cefs100101','159','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1455348615023_ixml.xml','','RNT01','2016-02-13 13:02:54'),(1,'','cefs100101','160','1','1','HML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1455350320348.xml','','RNT01','2016-02-13 13:31:18'),(1,'','cefs100101','160','1','1','IXML','D:/hethi/hethi.services/src/main/resources/hml/hml_cefs100101_1_1455350320348_ixml.xml','','RNT01','2016-02-13 13:31:18');
/*!40000 ALTER TABLE `dcustomer_output` ENABLE KEYS */;
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
  PRIMARY KEY (`content_id`)
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
-- Table structure for table `1_vendormaster_lookup`
--

DROP TABLE IF EXISTS `1_vendormaster_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1_vendormaster_lookup` (
  `vendorID` varchar(30) NOT NULL,
  `ven_acct_num` varchar(50) DEFAULT NULL,
  `vendor_vname` varchar(50) DEFAULT NULL,
  `vendor_contact` varchar(100) DEFAULT NULL,
  `vendor_phone` varchar(20) DEFAULT NULL,
  `vendor_fax` varchar(50) DEFAULT NULL,
  `vendor_email` varchar(100) DEFAULT NULL,
  `addr1` varchar(100) DEFAULT NULL,
  `addr2` varchar(100) DEFAULT NULL,
  `addr3` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `remit_to` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `payment_term` varchar(50) DEFAULT NULL,
  `tax_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1_vendormaster_lookup`
--

LOCK TABLES `1_vendormaster_lookup` WRITE;
/*!40000 ALTER TABLE `1_vendormaster_lookup` DISABLE KEYS */;
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
  UNIQUE KEY `XPKefs_Field_Property` (`Property_ID`,`Rule_ID`,`Rule_Workset_ID`)
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
INSERT INTO `dcustomer_upload` VALUES (1,1,2,'2016-03-02 12:33:15','1','2016-03-02 12:32:37'),(1,2,2,'2016-03-02 13:20:07','1','2016-03-02 13:19:16'),(1,3,NULL,'2016-03-03 15:16:10','1','2016-03-03 15:16:10'),(1,4,2,'2016-03-03 17:59:21','1','2016-03-03 15:18:33'),(1,5,2,'2016-03-03 17:59:19','1','2016-03-03 15:41:22'),(1,6,2,'2016-03-03 17:59:19','1','2016-03-03 15:49:13'),(1,7,2,'2016-03-03 17:59:19','1','2016-03-03 15:51:13'),(1,8,2,'2016-03-03 17:59:19','1','2016-03-03 15:51:44'),(1,9,2,'2016-03-03 17:59:13','1','2016-03-03 16:27:02'),(1,10,2,'2016-03-03 17:59:08','1','2016-03-03 17:58:37');
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
  UNIQUE KEY `hethi_servicecode_UNIQUE` (`hethi_servicecode`)
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
-- Table structure for table `cclassification_policy`
--

DROP TABLE IF EXISTS `cclassification_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cclassification_policy` (
  `customer_id` int(11) NOT NULL,
  `efs_uin` char(10) NOT NULL,
  `policyname` varchar(45) NOT NULL,
  `policytype` varchar(45) DEFAULT NULL,
  `policydescription` varchar(100) DEFAULT NULL,
  `policycreated_date` datetime NOT NULL,
  `policyexpirydate` datetime DEFAULT NULL,
  `data_sequence` varchar(100) DEFAULT NULL,
  `data_content` char(250) DEFAULT NULL,
  `data_position_top` char(10) DEFAULT NULL,
  `data_position_left` char(10) DEFAULT NULL,
  `data_position_width` char(10) DEFAULT NULL,
  `data_position_height` char(10) DEFAULT NULL,
  `data_expected_content` char(250) DEFAULT NULL,
  `indexname` varchar(45) DEFAULT NULL,
  `lastuptm` varchar(45) DEFAULT NULL,
  `lastupduser` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`efs_uin`,`policyname`,`policycreated_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cclassification_policy`
--

LOCK TABLES `cclassification_policy` WRITE;
/*!40000 ALTER TABLE `cclassification_policy` DISABLE KEYS */;
INSERT INTO `cclassification_policy` VALUES (3,'cefs100101','Indexing','text','','2016-03-03 17:41:23','2016-03-03 17:41:23','1','DEZ DIGITAL PRINTING\r\n','57','222','206','23','DEZ DIGITAL PRINTING\r\n','','2016-03-03 17:41:23','2'),(101,'efs_101','simple policy','text',NULL,'2016-02-16 16:21:14',NULL,'efs_101_1',NULL,'60','265','331','74','DIGITAL',NULL,NULL,NULL),(101,'efs_101','strong policy','text',NULL,'2016-02-16 16:21:14',NULL,'efs_101_1',NULL,'60','228','259','73','DEZ',NULL,NULL,NULL),(102,'efs_102','form Identification','text',NULL,'2016-02-16 16:21:14',NULL,'efs_102_1',NULL,'130','85','472','167','SIERRA PACIFIC',NULL,NULL,NULL),(102,'efs_103','form Identification','text',NULL,'2016-02-16 16:21:14',NULL,'efs_103_1',NULL,'277','207','675','243','HAGEMEYER',NULL,NULL,NULL),(102,'efs_104','form Identification','text',NULL,'2016-02-16 16:21:14',NULL,'efs_104_1',NULL,'80','909','1242','116','Mercedesâ€”Benz',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cclassification_policy` ENABLE KEYS */;
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
INSERT INTO `ciconnector_rules` VALUES ('rule100101','pk1001','ws1001','rl1001','Root','2015-11-03 12:06:05'),('rule100102','pk1001','ws1001','rl1002','Root','2015-11-03 12:06:05'),('rule100103','pk1001','ws1002','rl1001','Root','2015-11-04 15:05:14'),('rule100104','pk1001','ws1002','rl1002','Root','2015-11-04 15:05:14'),('rule100105','pk1001','ws1003','rl1001','1','2015-11-26 15:15:42'),('rule100106','pk1001','ws1003','rl1002','1','2015-11-26 15:44:56'),('rule100107','pk1001','ws1003','rl1003','1','2015-11-26 15:45:11'),('rule100108','pk1001','ws1004','rl1004','1','2015-11-26 15:44:56'),('rule100109','pk1001','ws1004','rl1005','1','2015-12-16 14:18:43'),('rule100110','pk1001','ws1008','rl1006','1','2016-01-06 17:44:35'),('rule100111','pk1001','ws1009','rl1007','1','2016-01-06 17:44:57'),('rule100112','pk1001','ws1010','rl1008','1','2016-01-06 17:45:05'),('rule100113','pk1001','ws1011','rl1009','1','2016-01-06 17:45:41'),('rule100114','pk1001','ws1012','rl1006','1','2016-01-10 13:14:20'),('rule100115','pk1001','ws1013','rl1007','1','2016-01-10 13:18:28'),('rule100116','pk1001','ws1014','rl1008','1','2016-01-10 13:23:40'),('rule100117','pk1001','ws1015','rl1009','1','2016-01-10 16:43:55'),('rule100118','pk1001','ws1016','rl1010','1','2016-01-10 16:57:06'),('rule100119','pk1001','ws1017','rl1011','1','2016-01-10 17:16:36'),('rule100120','pk1001','ws1018','rl1012','1','2016-01-12 11:10:18'),('rule100121','pk1001','ws1019','rl1013','1','2016-01-12 11:13:20'),('rule100122','pk1001','ws1020','rl1014','1','2016-01-12 11:31:54'),('rule100123','pk1001','ws1021','rl1015','1','2016-01-12 11:32:33'),('rule100124','pk1001','ws1022','rl1016','1','2016-01-12 11:35:32'),('rule100125','pk1001','ws1023','rl1017','1','2016-01-12 11:42:04'),('rule100126','pk1001','ws1024','rl1018','1','2016-01-12 11:54:32'),('rule100127','pk1001','ws1025','rl1019','1','2016-01-12 13:38:34'),('rule100128','pk1001','ws1026','rl1020','1','2016-01-12 16:18:34'),('rule100129','pk1001','ws1027','rl1021','1','2016-01-18 16:25:21'),('rule100130','pk1001','ws1028','rl1022','1','2016-01-18 16:53:34'),('rule100131','pk1001','ws1029','rl1023','1','2016-01-18 16:57:23'),('rule100132','pk1001','ws1030','rl1024','1','2016-01-18 16:58:39'),('rule100133','pk1001','ws1031','rl1025','1','2016-01-18 16:59:35'),('rule100134','pk1001','ws1032','rl1026','1','2016-01-18 17:02:08'),('rule100135','pk1001','ws1033','rl1027','1','2016-01-22 11:03:23'),('rule100136','pk1001','ws1005','rl1028','1','2016-02-12 17:10:02'),('rule100137','pk1001','ws1006','rl1029','1','2016-02-22 16:17:50'),('rule100138','pk1001','ws1007','rl1030','1','2016-02-22 16:19:39'),('rule100139','pk1001','ws1008','rl1031','1','2016-02-22 16:20:51'),('rule100140','pk1001','ws1009','rl1032','1','2016-02-22 16:21:15'),('rule100141','pk1001','ws1010','rl1033','1','2016-02-22 16:21:43'),('rule100142','pk1001','ws1011','rl1034','1','2016-02-22 16:21:44'),('rule100143','pk1001','ws1012','rl1035','1','2016-02-25 20:32:49');
/*!40000 ALTER TABLE `ciconnector_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cindexclassifystencil`
--

DROP TABLE IF EXISTS `cindexclassifystencil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cindexclassifystencil` (
  `form_stencid` char(10) NOT NULL,
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
INSERT INTO `cindexclassifystencil` VALUES ('HAA100010','HAA00001','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\">\r <business>\r   <industry /> \r   <bpaas /> \r   </business>\r  <form>\r   <efsuin /> \r <header>\r <group name=\"header\">\r <field>\r   <name /> \r   <ixsdfieldname>_payloadID</ixsdfieldname> \r   <ixsdxpath>po/_payloadID</ixsdxpath> \r   <type>label field</type> \r <label>\r   <sequence /> \r <position>\r   <top>145</top> \r   <left>16</left> \r   <width>157</width> \r   <height>26</height> \r   </position>\r   <content /> \r   </label>\r <data>\r   <sequence /> \r <position>\r   <top>145</top> \r   <left>113</left> \r   <width>157</width> \r   <height>171</height> \r   </position>\r   <content /> \r   </data>\r   </field>\r <field>\r   <name /> \r   <ixsdfieldname>_timestamp</ixsdfieldname> \r   <ixsdxpath>po/_timestamp</ixsdxpath> \r   <type>data field</type> \r  <label>\r   <sequence /> \r  <position>\r   <top /> \r   <left /> \r   <width /> \r   <height /> \r   </position>\r   <content /> \r   </label>\r  <data>\r   <sequence /> \r  <position>\r   <top>56</top> \r   <left>625</left> \r   <width>873</width> \r   <height>113</height> \r   </position>\r   <content /> \r   </data>\r   </field>\r  <field>\r   <name /> \r   <ixsdfieldname>_deploymentMode</ixsdfieldname> \r   <ixsdxpath>po/Request/_deploymentMode</ixsdxpath> \r   <type>data field</type> \r  <label>\r   <sequence /> \r  <position>\r   <top /> \r   <left /> \r   <width /> \r   <height /> \r   </position>\r   <content /> \r   </label>\r  <data>\r   <sequence /> \r  <position>\r   <top>60</top> \r   <left>228</left> \r   <width>419</width> \r   <height>113</height> \r   </position>\r   <content /> \r   </data>\r   </field>\r  <field>\r   <name /> \r   <ixsdfieldname>InvoiceDetailHeaderIndicator</ixsdfieldname> \r   <ixsdxpath>po/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/InvoiceDetailHeaderIndicator</ixsdxpath> \r   <type>data field</type> \r  <label>\r   <sequence /> \r  <position>\r   <top>146</top> \r   <left>730</left> \r   <width>868</width> \r   <height>168</height> \r   </position>\r   <content /> \r   </label>\r  <data>\r   <sequence /> \r  <position>\r   <top>168</top> \r   <left>780</left> \r   <width>865</width> \r   <height>187</height> \r   </position>\r   <content /> \r   </data>\r   </field>\r  <field>\r   <name /> \r   <ixsdfieldname>_invoiceDate</ixsdfieldname> \r   <ixsdxpath>po/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/_invoiceDate</ixsdxpath> \r   <type>label field</type> \r  <label>\r   <sequence /> \r  <position>\r   <top>725</top> \r   <left>141</left> \r   <width>152</width> \r   <height>26</height> \r   </position>\r   <content /> \r   </label>\r  <data>\r   <sequence /> \r  <position>\r   <top>773</top> \r   <left>167</left> \r   <width>104</width> \r   <height>21</height> \r   </position>\r   <content /> \r   </data>\r   </field>\r   <show>true</show> \r   </group>\r   <show>true</show> \r   </header>\r  <footer>\r  <group name=\"summary\">\r  <field>\r   <name /> \r   <ixsdfieldname>Money</ixsdfieldname> \r   <ixsdxpath>po/Request/InvoiceDetailRequest/InvoiceDetailSummary/SubtotalAmount/Money</ixsdxpath> \r   <type>data field</type> \r  <label>\r   <sequence /> \r  <position>\r   <top /> \r   <left /> \r   <width /> \r   <height /> \r   </position>\r   <content /> \r   </label>\r  <data>\r   <sequence /> \r  <position>\r   <top>606</top> \r   <left>646</left> \r   <width>876</width> \r   <height>774</height> \r   </position>\r   <content /> \r   </data>\r   </field>\r   </group>\r   </footer>\r  <body>\r  <group name=\"lineitem\">\r   <field /> \r  <fieldlist>\r   <field /> \r   </fieldlist>\r   </group>\r   </body>\r   <show>true</show> \r   </form>\r   <show>true</show> \r   </mxsd>','http://localhost:4141/images/ixsd/mxml_002.xml','3','2016-02-08 18:43:31'),('HAA100011','HAA00001','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas><show>false</show></business><form><efsuin></efsuin><header><group name=\"header\"><field><name></name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><label><sequence></sequence><position><top></top><left></left><width></width><height></height></position><content></content></label><data><sequence></sequence><position><top>15</top><left>646</left><width>103</width><height>98</height></position><content></content><show>true</show></data><show>true</show></field><field><name></name><ixsdfieldname>Identity</ixsdfieldname><ixsdxpath>po/Header/From/Credential/Identity</ixsdxpath><type>label field</type><label><sequence></sequence><position><top>103</top><left>222</left><width>65</width><height>26</height></position><content></content></label><data><sequence></sequence><position><top>225</top><left>52</left><width>227</width><height>66</height></position><content></content></data><show>false</show></field><show>true</show></group><show>true</show></header><footer><group name=\"summary\"><field><name></name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>2DQRcode field</type><label><sequence></sequence><position><top></top><left></left><width></width><height></height></position><content></content></label><data><sequence></sequence><position><top>12</top><left>644</left><width>109</width><height>105</height></position><content></content></data></field><field><name></name><ixsdfieldname>Identity</ixsdfieldname><ixsdxpath>po/Header/To/Credential/Identity</ixsdxpath><type>1Dbarcode field</type><label><sequence></sequence><position><top></top><left></left><width></width><height></height></position><content></content></label><data><sequence></sequence><position><top>17</top><left>647</left><width>101</width><height>93</height></position><content></content></data></field></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body><show>false</show></form><show>true</show></mxsd>','http://localhost:4141/images/ixsd/mxml_003.xml','3','2016-02-08 18:45:44'),('HAA100012','HAA00001','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name></name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>data field</type><label><sequence></sequence><position><top>599</top><left>641</left><width>278</width><height>129</height></position><content></content></label><data><sequence></sequence><position><top>228</top><left>51</left><width>212</width><height>28</height></position><content></content></data></field><field><name></name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><label><sequence></sequence><position><top>665</top><left>140</left><width>212</width><height>28</height></position><content></content></label><data><sequence></sequence><position><top>2</top><left>142</left><width>212</width><height>28</height></position><content></content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/4_1_3.xml','3','2016-02-09 11:21:09'),('HAA100013','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>888</top><left>742</left><width>373</width><height>27</height></position><content> </content></label><data><sequence> </sequence><position><top>328</top><left>62</left><width>288</width><height>17</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>data field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>786</top><left>891</left><width>303</width><height>16</height></position><content> </content></label><data><sequence> </sequence><position><top>184</top><left>699</left><width>303</width><height>16</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 13:47:10'),('HAA100014','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>888</top><left>742</left><width>373</width><height>27</height></position><content> </content></label><data><sequence> </sequence><position><top>328</top><left>62</left><width>288</width><height>17</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>data field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>786</top><left>891</left><width>303</width><height>16</height></position><content> </content></label><data><sequence> </sequence><position><top>184</top><left>699</left><width>303</width><height>16</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 13:47:13'),('HAA100015','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>322</top><left>61</left><width>295</width><height>20</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 13:48:28'),('HAA100016','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>328</top><left>62</left><width>288</width><height>16</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 13:53:41'),('HAA100017','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>226</top><left>59</left><width>197</width><height>16</height></position><content> </content></label><data><sequence> </sequence><position><top>15</top><left>172</left><width>156</width><height>14</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 14:11:11'),('HAA100018','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>225</top><left>58</left><width>195</width><height>17</height></position><content> </content></label><data><sequence> </sequence><position><top>14</top><left>171</left><width>155</width><height>16</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 14:15:00'),('HAA100019','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>225</top><left>55</left><width>195</width><height>21</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 15:36:47'),('HAA100020','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>152</top><left>52</left><width>135</width><height>19</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 16:12:10'),('HAA100021','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>225</top><left>57</left><width>195</width><height>16</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 19:40:44'),('HAA100022','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></label><data><sequence> </sequence><position><top>227</top><left>58</left><width>34</width><height>16</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 20:07:02'),('HAA100023','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>219</top><left>53</left><width>44</width><height>26</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-23 20:19:22'),('HAA100024','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>data field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>224</top><left>55</left><width>37</width><height>19</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 16:45:49'),('HAA100025','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>54</left><width>44</width><height>25</height></position><content> </content></label><data><sequence> </sequence><position><top>13</top><left>143</left><width>164</width><height>28</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 16:47:40'),('HAA100026','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>225</top><left>56</left><width>198</width><height>20</height></position><content> </content></label><data><sequence> </sequence><position><top>16</top><left>169</left><width>198</width><height>20</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>613</top><left>729</left><width>255</width><height>33</height></position><content> </content></label><data><sequence> </sequence><position><top>519</top><left>594</left><width>27</width><height>23</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_deploymentMode</ixsdfieldname><ixsdxpath>po/Request/_deploymentMode</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>17</top><left>739</left><width>94</width><height>29</height></position><content> </content></label><data><sequence> </sequence><position><top>726</top><left>144</left><width>134</width><height>22</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 16:49:50'),('HAA100027','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>721</top><left>140</left><width>146</width><height>28</height></position><content> </content></label><data><sequence> </sequence><position><top>10</top><left>168</left><width>166</width><height>28</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 16:53:40'),('HAA100028','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>57</left><width>200</width><height>18</height></position><content> </content></label><data><sequence> </sequence><position><top>726</top><left>144</left><width>149</width><height>23</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>681</top><left>94</left><width>179</width><height>23</height></position><content> </content></label><data><sequence> </sequence><position><top>12</top><left>169</left><width>168</width><height>23</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/65_1_2.xml','2','2016-02-24 17:01:59'),('HAA100029','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>607</top><left>726</left><width>255</width><height>40</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>15</top><left>168</left><width>159</width><height>21</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 18:32:24'),('HAA100030','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 18:51:35'),('HAA100031','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>225</top><left>57</left><width>195</width><height>19</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 18:53:18'),('HAA100032','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>728</left><width>249</width><height>36</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 18:57:25'),('HAA100033','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>728</left><width>250</width><height>37</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 18:59:02'),('HAA100034','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>729</left><width>247</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:00:39'),('HAA100035','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>728</left><width>250</width><height>36</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:13:53'),('HAA100036','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>729</left><width>248</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:15:16'),('HAA100037','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>729</left><width>248</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:17:11'),('HAA100038','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>729</left><width>248</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:19:24'),('HAA100039','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>729</left><width>249</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:23:37'),('HAA100040','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>729</left><width>249</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:25:32'),('HAA100041','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>729</left><width>249</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:26:55'),('HAA100042','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>729</left><width>249</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:28:13'),('HAA100043','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>730</left><width>249</width><height>32</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:35:12'),('HAA100044','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>726</left><width>251</width><height>40</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:36:34'),('HAA100045','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>610</top><left>728</left><width>251</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top>521</top><left>593</left><width>25</width><height>24</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>728</top><left>145</left><width>136</width><height>22</height></position><content> </content></label><data><sequence> </sequence><position><top>17</top><left>169</left><width>154</width><height>20</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:42:33'),('HAA100046','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>729</left><width>249</width><height>34</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:43:29'),('HAA100047','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>728</left><width>247</width><height>34</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:44:30'),('HAA100048','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>728</left><width>247</width><height>34</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:44:32'),('HAA100049','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>16</top><left>170</left><width>156</width><height>20</height></position><content> </content></label><data><sequence> </sequence><position><top>726</top><left>147</left><width>137</width><height>19</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>610</top><left>731</left><width>250</width><height>32</height></position><content> </content></label><data><sequence> </sequence><position><top>522</top><left>592</left><width>21</width><height>25</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 19:45:54'),('HAA100050','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>610</top><left>728</left><width>250</width><height>37</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 20:04:00'),('HAA100051','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>728</left><width>247</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 20:05:34'),('HAA100052','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>612</top><left>730</left><width>247</width><height>33</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 20:16:33'),('HAA100053','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>665</top><left>357</left><width>40</width><height>26</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 20:37:12'),('HAA100054','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>578</top><left>661</left><width>258</width><height>110</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-24 20:40:40'),('HAA100055','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>728</left><width>248</width><height>36</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/65_1_2.xml','2','2016-02-24 21:01:27'),('HAA100056','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>728</left><width>248</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/65_1_2.xml','2','2016-02-24 21:03:41'),('HAA100057','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>727</left><width>250</width><height>34</height></position><content> </content></label><data><sequence> </sequence><position><top>519</top><left>403</left><width>33</width><height>26</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>729</top><left>145</left><width>128</width><height>21</height></position><content> </content></label><data><sequence> </sequence><position><top>17</top><left>169</left><width>164</width><height>21</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 21:18:40'),('HAA100058','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>611</top><left>727</left><width>248</width><height>37</height></position><content> </content></label><data><sequence> </sequence><position><top>517</top><left>546</left><width>28</width><height>24</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>689</top><left>91</left><width>166</width><height>25</height></position><content> </content></label><data><sequence> </sequence><position><top>16</top><left>169</left><width>160</width><height>27</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 21:20:49'),('HAA100059','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>630</top><left>748</left><width>254</width><height>37</height></position><content> </content></label><data><sequence> </sequence><position><top>534</top><left>317</left><width>24</width><height>28</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 21:54:16'),('HAA100060','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>629</top><left>747</left><width>256</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top>0</top><left>609</left><width>881</width><height>28</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 21:56:58'),('HAA100061','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>627</top><left>748</left><width>150</width><height>35</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 22:00:25'),('HAA100062','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>627</top><left>747</left><width>131</width><height>37</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 22:04:31'),('HAA100063','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_invoiceID</ixsdfieldname><ixsdxpath>po/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/_invoiceID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>15</top><left>148</left><width>104</width><height>25</height></position><content> </content></label><data><sequence> </sequence><position><top>118</top><left>150</left><width>63</width><height>25</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_invoiceDate</ixsdfieldname><ixsdxpath>po/Request/InvoiceDetailRequest/InvoiceDetailRequestHeader/_invoiceDate</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>751</top><left>151</left><width>132</width><height>18</height></position><content> </content></label><data><sequence> </sequence><position><top>798</top><left>170</left><width>86</width><height>17</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>Money</ixsdfieldname><ixsdxpath>po/Request/InvoiceDetailRequest/InvoiceDetailSummary/GrossAmount/Money</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>629</top><left>749</left><width>142</width><height>33</height></position><content> </content></label><data><sequence> </sequence><position><top>816</top><left>749</left><width>68</width><height>33</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 22:11:46'),('HAA100064','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>15</top><left>144</left><width>108</width><height>29</height></position><content> </content></label><data><sequence> </sequence><position><top>119</top><left>146</left><width>63</width><height>27</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>data field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></label><data><sequence> </sequence><position><top>223</top><left>50</left><width>230</width><height>81</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 22:14:08'),('HAA100065','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>231</top><left>57</left><width>204</width><height>22</height></position><content> </content></label><data><sequence> </sequence><position><top>629</top><left>747</left><width>194</width><height>35</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>617</top><left>41</left><width>250</width><height>95</height></position><content> </content></label><data><sequence> </sequence><position><top>15</top><left>170</left><width>168</width><height>31</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-24 22:17:46'),('HAA100066','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>53</left><width>205</width><height>22</height></position><content> </content></label><data><sequence> </sequence><position><top>608</top><left>726</left><width>256</width><height>38</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-25 11:32:02'),('HAA100067','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>219</top><left>54</left><width>205</width><height>23</height></position><content> </content></label><data><sequence> </sequence><position><top>612</top><left>730</left><width>247</width><height>31</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 11:33:31'),('HAA100068','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>602</top><left>644</left><width>262</width><height>82</height></position><content> </content></label><data><sequence> </sequence><position><top>602</top><left>722</left><width>271</width><height>47</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 11:34:10'),('HAA100069','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>602</top><left>646</left><width>265</width><height>120</height></position><content> </content></label><data><sequence> </sequence><position><top>503</top><left>254</left><width>68</width><height>364</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>0</top><left>798</left><width>876</width><height>103</height></position><content> </content></label><data><sequence> </sequence><position><top>0</top><left>0</left><width>876</width><height>206</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-25 11:36:19'),('HAA100070','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>54</left><width>205</width><height>23</height></position><content> </content></label><data><sequence> </sequence><position><top>608</top><left>727</left><width>256</width><height>39</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-25 11:38:11'),('HAA100071','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>57</left><width>206</width><height>22</height></position><content> </content></label><data><sequence> </sequence><position><top>611</top><left>727</left><width>250</width><height>38</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 11:39:26'),('HAA100072','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>56</left><width>205</width><height>25</height></position><content> </content></label><data><sequence> </sequence><position><top>608</top><left>727</left><width>256</width><height>39</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>504</top><left>447</left><width>55</width><height>31</height></position><content> </content></label><data><sequence> </sequence><position><top>605</top><left>646</left><width>263</width><height>28</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 11:44:02'),('HAA100073','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>224</top><left>57</left><width>203</width><height>21</height></position><content> </content></label><data><sequence> </sequence><position><top>612</top><left>727</left><width>250</width><height>41</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 11:48:27'),('HAA100074','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>224</top><left>57</left><width>203</width><height>21</height></position><content> </content></label><data><sequence> </sequence><position><top>611</top><left>727</left><width>250</width><height>33</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-25 11:50:37'),('HAA100075','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>224</top><left>54</left><width>208</width><height>25</height></position><content> </content></label><data><sequence> </sequence><position><top>611</top><left>728</left><width>253</width><height>36</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 11:52:26'),('HAA100076','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>53</left><width>209</width><height>26</height></position><content> </content></label><data><sequence> </sequence><position><top>611</top><left>729</left><width>250</width><height>33</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/66_1_2.xml','2','2016-02-25 11:53:58'),('HAA100077','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>222</top><left>53</left><width>202</width><height>26</height></position><content> </content></label><data><sequence> </sequence><position><top>611</top><left>730</left><width>249</width><height>33</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/67_1_2.xml','2','2016-02-25 12:03:03'),('HAA100078','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>222</top><left>56</left><width>205</width><height>22</height></position><content> </content></label><data><sequence> </sequence><position><top>612</top><left>729</left><width>250</width><height>35</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/67_1_2.xml','2','2016-02-25 12:04:41'),('HAA100079','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>222</top><left>57</left><width>205</width><height>23</height></position><content> </content></label><data><sequence> </sequence><position><top>611</top><left>729</left><width>249</width><height>33</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 12:05:44'),('HAA100080','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>53</left><width>218</width><height>66</height></position><content> </content></label><data><sequence> </sequence><position><top>605</top><left>643</left><width>265</width><height>83</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>5</top><left>137</left><width>190</width><height>58</height></position><content> </content></label><data><sequence> </sequence><position><top>611</top><left>725</left><width>255</width><height>47</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/67_1_2.xml','2','2016-02-25 12:09:16'),('HAA100081','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>0</top><left>0</left><width>876</width><height>203</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>3DQRcode field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>0</top><left>774</left><width>876</width><height>126</height></position><content> </content></label><data><sequence> </sequence><position><top>5</top><left>634</left><width>122</width><height>140</height></position><content> </content></data></field></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 12:15:11'),('HAA100082','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>215</top><left>51</left><width>221</width><height>72</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/67_1_2.xml','2','2016-02-25 12:18:06'),('HAA100083','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/67_1_2.xml','2','2016-02-25 12:22:10'),('HAA100084','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/68_1_2.xml','2','2016-02-25 12:23:58'),('HAA100085','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/69_1_2.xml','2','2016-02-25 12:24:14'),('HAA100086','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>222</top><left>57</left><width>44</width><height>22</height></position><content> </content></label><data><sequence> </sequence><position><top>14</top><left>144</left><width>103</width><height>27</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 12:50:06'),('HAA100087','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>222</top><left>58</left><width>44</width><height>20</height></position><content> </content></label><data><sequence> </sequence><position><top>15</top><left>143</left><width>103</width><height>27</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 12:51:17'),('HAA100088','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>224</top><left>59</left><width>40</width><height>17</height></position><content> </content></label><data><sequence> </sequence><position><top>14</top><left>143</left><width>103</width><height>26</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/1_1_2.xml','2','2016-02-25 12:52:06'),('HAA100089','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>3</top><left>0</left><width>874</width><height>314</height></position><content> </content></label><data><sequence> </sequence><position><top>447</top><left>632</left><width>358</width><height>136</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>71</top><left>360</left><width>806</width><height>81</height></position><content> </content></label><data><sequence> </sequence><position><top>3</top><left>787</left><width>874</width><height>114</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/70_1_2.xml','2','2016-02-25 13:29:59'),('HAA100090','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/73_1_2.xml','2','2016-02-25 15:07:08'),('HAA100091','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/73_1_2.xml','2','2016-02-25 15:07:53'),('HAA100092','2','cefs100101','<mxsd owner=\"Hethi\" author=\"\" version=\"1.0\" created_date=\"25/11/2015\" ixsdlocation=\"http://www.hethi.com/schema/meta/meta1.xsd\" ixsdversion=\"1.0\"><business><industry></industry><bpaas></bpaas></business><form><efsuin></efsuin><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></form></mxsd>','http://localhost:4141/images/ixsd/73_1_2.xml','2','2016-02-25 15:18:55'),('HAA100093','2','cefs100101','<mxsd><efsuin_demography><type></type><efsuin></efsuin><industry></industry><bpaas></bpaas><formtype></formtype><totalpages></totalpages><formowner></formowner><version></version><createddatatime></createddatatime><author></author><ixsdlocation></ixsdlocation><ixsdversion></ixsdversion></efsuin_demography><efsuin_snippet><segment><name></name><position><top></top><left></left><width></width><height></height></position></segment></efsuin_snippet><efsuin_form><page pageno=\"1\"><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>221</top><left>56</left><width>211</width><height>24</height></position><content> </content></label><data><sequence> </sequence><position><top>12</top><left>141</left><width>109</width><height>32</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>22</top><left>490</left><width>168</width><height>44</height></position><content> </content></label><data><sequence> </sequence><position><top>609</top><left>729</left><width>252</width><height>36</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"2\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"3\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page></efsuin_form><efsuin_classify></efsuin_classify></mxsd>','http://localhost:2687/images/ixsd/1_1_2.xml','2','2016-03-02 12:45:38'),('HAA100094','2','cefs100101','<mxsd><efsuin_demography><type></type><efsuin></efsuin><industry></industry><bpaas></bpaas><formtype></formtype><totalpages></totalpages><formowner></formowner><version></version><createddatatime></createddatatime><author></author><ixsdlocation></ixsdlocation><ixsdversion></ixsdversion></efsuin_demography><efsuin_snippet><segment><name></name><position><top></top><left></left><width></width><height></height></position></segment></efsuin_snippet><efsuin_form><page pageno=\"1\"><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>214</top><left>53</left><width>217</width><height>26</height></position><content> </content></label><data><sequence> </sequence><position><top>6</top><left>136</left><width>176</width><height>36</height></position><content> </content></data></field><field><name> </name><ixsdfieldname>_timestamp</ixsdfieldname><ixsdxpath>po/_timestamp</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>25</top><left>492</left><width>157</width><height>40</height></position><content> </content></label><data><sequence> </sequence><position><top>612</top><left>727</left><width>255</width><height>39</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"2\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"3\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page></efsuin_form><efsuin_classify></efsuin_classify></mxsd>','http://localhost:2687/images/ixsd/1_1_2.xml','2','2016-03-02 12:52:36'),('HAA100095','2','cefs100101','<mxsd><efsuin_demography><type></type><efsuin></efsuin><industry></industry><bpaas></bpaas><formtype></formtype><totalpages></totalpages><formowner></formowner><version></version><createddatatime></createddatatime><author></author><ixsdlocation></ixsdlocation><ixsdversion></ixsdversion></efsuin_demography><efsuin_snippet><segment><name></name><position><top></top><left></left><width></width><height></height></position></segment></efsuin_snippet><efsuin_form><page pageno=\"1\"><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>199</top><left>53</left><width>241</width><height>27</height></position><content> </content></label><data><sequence> </sequence><position><top>8</top><left>141</left><width>192</width><height>29</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"2\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"3\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page></efsuin_form><efsuin_classify></efsuin_classify></mxsd>','http://localhost:2687/images/ixsd/1_1_2.xml','2','2016-03-02 12:55:24'),('HAA100096','2','cefs100101','<mxsd><efsuin_demography><type></type><efsuin></efsuin><industry></industry><bpaas></bpaas><formtype></formtype><totalpages></totalpages><formowner></formowner><version></version><createddatatime></createddatatime><author></author><ixsdlocation></ixsdlocation><ixsdversion></ixsdversion></efsuin_demography><efsuin_snippet><segment><name></name><position><top></top><left></left><width></width><height></height></position></segment></efsuin_snippet><efsuin_form><page pageno=\"1\"><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>224</top><left>52</left><width>201</width><height>25</height></position><content> </content></label><data><sequence> </sequence><position><top>5</top><left>139</left><width>177</width><height>35</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"2\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"3\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page></efsuin_form><efsuin_classify></efsuin_classify></mxsd>','http://localhost:2687/images/ixsd/1_1_2.xml','2','2016-03-02 12:57:47'),('HAA100097','2','cefs100101','<mxsd><efsuin_demography><type></type><efsuin></efsuin><industry></industry><bpaas></bpaas><formtype></formtype><totalpages></totalpages><formowner></formowner><version></version><createddatatime></createddatatime><author></author><ixsdlocation></ixsdlocation><ixsdversion></ixsdversion></efsuin_demography><efsuin_snippet><segment><name></name><position><top></top><left></left><width></width><height></height></position></segment></efsuin_snippet><efsuin_form><page pageno=\"1\"><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>218</top><left>57</left><width>214</width><height>24</height></position><content> </content></label><data><sequence> </sequence><position><top>11</top><left>141</left><width>180</width><height>29</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"2\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"3\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page></efsuin_form><efsuin_classify></efsuin_classify></mxsd>','http://localhost:2687/images/ixsd/1_1_2.xml','2','2016-03-02 12:59:06'),('HAA100098','2','cefs100101','<mxsd><efsuin_demography><type></type><efsuin></efsuin><industry></industry><bpaas></bpaas><formtype></formtype><totalpages></totalpages><formowner></formowner><version></version><createddatatime></createddatatime><author></author><ixsdlocation></ixsdlocation><ixsdversion></ixsdversion></efsuin_demography><efsuin_snippet><segment><name></name><position><top></top><left></left><width></width><height></height></position></segment></efsuin_snippet><efsuin_form><page pageno=\"1\"><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>label field</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>219</top><left>57</left><width>206</width><height>23</height></position><content> </content></label><data><sequence> </sequence><position><top>11</top><left>144</left><width>168</width><height>27</height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"2\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"3\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page></efsuin_form><efsuin_classify></efsuin_classify></mxsd>','http://localhost:2687/images/ixsd/1_1_2.xml','2','2016-03-02 13:00:36'),('HAA100099','2','cefs100101','<mxsd><efsuin_demography><type></type><efsuin>cefs100101</efsuin><industry>Retail</industry><bpaas>invoice process to pay</bpaas><formtype>PO-Inventory</formtype><totalpages>3</totalpages><formowner>HAA00001</formowner><version>1</version><createddatatime>2015-10-30 15:28:00</createddatatime><author>Hethi-Artist</author><ixsdlocation>http://localhost:2687/images/ixsd/po.xml</ixsdlocation><ixsdversion>1.0</ixsdversion></efsuin_demography><efsuin_snippet><segment><name>default</name><positions><position><top>0</top><left>0</left><width>876</width><height>900</height></position></positions></segment></efsuin_snippet><efsuin_form><page pageno=\"1\"><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>text</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>222</top><left>57</left><width>206</width><height>23</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"2\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"3\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page></efsuin_form><efsuin_classify><policy>Indexing</policy><type>text</type><data>DEZ DIGITAL PRINTING\r\n</data><position><top>57</top><left>222</left><width>206</width><height>23</height></position><show>true</show></efsuin_classify></mxsd>','http://localhost:2687/images/ixsd/1_1_2.xml','2','2016-03-03 17:39:08'),('HAA100100','2','cefs100101','<mxsd><efsuin_demography><type></type><efsuin>cefs100101</efsuin><industry>Retail</industry><bpaas>invoice process to pay</bpaas><formtype>PO-Inventory</formtype><totalpages>3</totalpages><formowner>HAA00001</formowner><version>1</version><createddatatime>2015-10-30 15:28:00</createddatatime><author>Hethi-Artist</author><ixsdlocation>http://localhost:2687/images/ixsd/po.xml</ixsdlocation><ixsdversion>1.0</ixsdversion></efsuin_demography><efsuin_snippet><segment><name>default</name><positions><position><top>0</top><left>0</left><width>876</width><height>900</height></position></positions></segment></efsuin_snippet><efsuin_form><page pageno=\"1\"><header><group name=\"header\"><field><name> </name><ixsdfieldname>_payloadID</ixsdfieldname><ixsdxpath>po/_payloadID</ixsdxpath><type>text</type><Indexing><Classify>No</Classify><Reject>No</Reject><SplitMerge>No</SplitMerge><Identification>No</Identification><Relationship>No</Relationship><SequenceNo>No</SequenceNo></Indexing><label><sequence> </sequence><position><top>222</top><left>57</left><width>206</width><height>23</height></position><content> </content></label><data><sequence> </sequence><position><top> </top><left> </left><width> </width><height> </height></position><content> </content></data></field></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"2\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page><page pageno=\"3\"><header><group name=\"header\"><field/></group></header><footer><group name=\"summary\"><field/></group></footer><body><group name=\"lineitem\"><field/><fieldlist><field/></fieldlist></group></body></page></efsuin_form><efsuin_classify><policy>Indexing</policy><type>text</type><data>DEZ DIGITAL PRINTING\r\n</data><position><top>57</top><left>222</left><width>206</width><height>23</height></position><show>true</show></efsuin_classify></mxsd>','http://localhost:2687/images/ixsd/1_1_2.xml','2','2016-03-03 17:41:23');
/*!40000 ALTER TABLE `cindexclassifystencil` ENABLE KEYS */;
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
  UNIQUE KEY `XPKeFs` (`eFS_ID`,`Input_Source_Id`)
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
-- Table structure for table `ixsd_cefs100101_lineitem`
--

DROP TABLE IF EXISTS `ixsd_cefs100101_lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ixsd_cefs100101_lineitem` (
  `uid` varchar(255) DEFAULT NULL,
  `din` varchar(255) DEFAULT NULL,
  `efs_uin` varchar(255) DEFAULT NULL,
  `version` bigint(20) DEFAULT NULL,
  `lastupdtm` datetime NOT NULL,
  `sequence_no` int(11) DEFAULT NULL,
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
INSERT INTO `ixsd_cefs100101_lineitem` VALUES ('1','1','cefs100101',1,'2016-01-22 11:44:42',1,'part decription line item one ',100,'1',1,100,1,0,'1','1','1'),('1','1','cefs100101',1,'2016-02-24 16:04:33',2,'part decription line item one ',100,'1',1,100,1,0,'1','1','1'),('1','1','cefs100101',1,'2016-02-24 16:04:49',3,'part decription line item one ',100,'1',1,100,1,0,'1','1','1');
/*!40000 ALTER TABLE `ixsd_cefs100101_lineitem` ENABLE KEYS */;
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
  `department` varchar(50) DEFAULT NULL,
  `approval` bigint(11) DEFAULT NULL,
  `hierarchy` varchar(30) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1_approvalgrid_lookup`
--

LOCK TABLES `1_approvalgrid_lookup` WRITE;
/*!40000 ALTER TABLE `1_approvalgrid_lookup` DISABLE KEYS */;
INSERT INTO `1_approvalgrid_lookup` VALUES ('100000',5000000,'System COO','staudma'),('100000',500000,'Facility CFO','nugenma'),('100000',9999999999,'System CEO','singlkn'),('100007',1000000,'SVP','runyoma'),('100007',250000,'Facility CFO','nugenma'),('100007',5000000,'System CFO','magenri'),('100007',5000000,'System COO','staudma'),('100007',9999999999,'System CEO','singlkn');
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
INSERT INTO `dcustomer` VALUES (1,'Hethi','Hethi Inc',1,'ssatheesh@hethi.com','1234556','ssatheesh@hethi.com','+918056611236'),(2,'Demo','Demo Customer',54,'rprabhakaran@hethi.com','','ssatheesh@hethi.com','2');
/*!40000 ALTER TABLE `dcustomer` ENABLE KEYS */;
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
-- Table structure for table `cmxsd_efs_storage`
--

DROP TABLE IF EXISTS `cmxsd_efs_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmxsd_efs_storage` (
  `customer_id` int(11) NOT NULL,
  `efs_uin` char(10) NOT NULL,
  `owner` char(10) NOT NULL,
  `version` varchar(45) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `ixsdlocation` varchar(250) NOT NULL,
  `ixsdversion` varchar(45) DEFAULT NULL,
  `field_location` varchar(45) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `field_type` varchar(100) NOT NULL,
  `ixsdfieldname` varchar(100) NOT NULL,
  `customfieldname` varchar(100) NOT NULL,
  `ixsdxpath` varchar(250) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `label_sequence` varchar(100) DEFAULT NULL,
  `label_content` varchar(250) DEFAULT NULL,
  `label_position_top` char(10) DEFAULT NULL,
  `label_position_left` char(10) DEFAULT NULL,
  `label_position_width` char(10) DEFAULT NULL,
  `label_position_height` char(10) DEFAULT NULL,
  `data_sequence` varchar(100) DEFAULT NULL,
  `data_content` varchar(100) DEFAULT NULL,
  `data_position_top` char(10) DEFAULT NULL,
  `data_position_left` char(10) DEFAULT NULL,
  `data_position_width` char(10) DEFAULT NULL,
  `data_position_height` char(10) DEFAULT NULL,
  `index_to_classify` char(5) DEFAULT NULL,
  `index_to_reject` char(5) DEFAULT NULL,
  `index_to_split_merge` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmxsd_efs_storage`
--

LOCK TABLES `cmxsd_efs_storage` WRITE;
/*!40000 ALTER TABLE `cmxsd_efs_storage` DISABLE KEYS */;
INSERT INTO `cmxsd_efs_storage` VALUES (1,'','','','','2016-02-20 21:19:46','','','header','','','_payloadID',' ','po/_payloadID','label field',' ',' ','218','52','206','75',' ',' ','','','','','','',''),(1,'','','','',NULL,'','','header','','','','','','','','','','','','','','','','','','','','',''),(1,'','','','',NULL,'','','header','','','','','','','','','','','','','','','','','','','','',''),(3,'cefs100101','HAA00001','1','Hethi-Artist','2016-03-03 17:41:23','http://localhost:2687/images/ixsd/po.xml','1.0','header','','','_payloadID',' ','po/_payloadID','text',' ',' ','222','57','206','23',' ',' ','','','','','','',''),(3,'cefs100101','HAA00001','1','Hethi-Artist',NULL,'http://localhost:2687/images/ixsd/po.xml','1.0','header','','','','','','','','','','','','','','','','','','','','',''),(3,'cefs100101','HAA00001','1','Hethi-Artist',NULL,'http://localhost:2687/images/ixsd/po.xml','1.0','header','','','','','','','','','','','','','','','','','','','','',''),(3,'cefs100101','HAA00001','1','Hethi-Artist',NULL,'http://localhost:2687/images/ixsd/po.xml','1.0','header','','','','','','','','','','','','','','','','','','','','',''),(3,'cefs100101','HAA00001','1','Hethi-Artist',NULL,'http://localhost:2687/images/ixsd/po.xml','1.0','header','','','','','','','','','','','','','','','','','','','','',''),(3,'cefs100101','HAA00001','1','Hethi-Artist',NULL,'http://localhost:2687/images/ixsd/po.xml','1.0','header','','','','','','','','','','','','','','','','','','','','',''),(3,'cefs100101','HAA00001','1','Hethi-Artist',NULL,'http://localhost:2687/images/ixsd/po.xml','1.0','header','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `cmxsd_efs_storage` ENABLE KEYS */;
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
  UNIQUE KEY `XPKCatalog` (`BPS_ID`,`Core_ID`,`Hethi_Srv__Id`,`Industry_ID`)
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
INSERT INTO `cmarketplace` VALUES ('cm1001','Concern','Root','2016-02-10'),('cm1002','Community','Root','2016-02-10'),('cm1003','Freelancer','Root','2016-02-10'),('cm1004','Religious','Root','2016-02-10');
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
  UNIQUE KEY `XPKRule` (`Rule_ID`,`Rule_Workset_ID`,`Workflow_Queue_ID`)
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
  `rule_type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`sfs_uin`,`queue_id`,`rule_uin`,`zone_id`,`efs_uin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcustomrules`
--

LOCK TABLES `dcustomrules` WRITE;
/*!40000 ALTER TABLE `dcustomrules` DISABLE KEYS */;
INSERT INTO `dcustomrules` VALUES (1,'','cefs100101','qs1001','rule100143',1,'','','1','ws1012','1','2016-02-25 20:32:49',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dcustomrules` ENABLE KEYS */;
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
  UNIQUE KEY `XPKRule` (`Rule_ID`,`Rule_Workset_ID`)
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
INSERT INTO `dupload_status_history` VALUES (1,1,3,3,'2016-03-02 12:32:42'),(1,1,1,1,'2016-03-02 12:33:15'),(1,1,3,3,'2016-03-02 13:00:40'),(2,1,3,3,'2016-03-02 13:19:34'),(2,1,1,1,'2016-03-02 13:20:07'),(4,1,3,3,'2016-03-03 15:18:35'),(5,1,3,3,'2016-03-03 15:41:23'),(6,1,3,3,'2016-03-03 15:49:13'),(7,1,3,3,'2016-03-03 15:51:13'),(8,1,3,3,'2016-03-03 15:51:44'),(9,1,3,3,'2016-03-03 16:27:02'),(1,1,3,3,'2016-03-03 17:41:26'),(10,1,3,3,'2016-03-03 17:58:42'),(10,1,1,1,'2016-03-03 17:59:08'),(9,1,1,1,'2016-03-03 17:59:13'),(5,1,1,1,'2016-03-03 17:59:19'),(6,1,1,1,'2016-03-03 17:59:19'),(7,1,1,1,'2016-03-03 17:59:19'),(8,1,1,1,'2016-03-03 17:59:19'),(4,1,1,1,'2016-03-03 17:59:21');
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
/*!50003 DROP PROCEDURE IF EXISTS `addPlatformUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `addPlatformUser`(
in customerId int,in userName varchar(100),in roleId int)
BEGIN
declare addressId,userId int(11);
set addressId=(select ifnull((select max(`dcustomercommn`.`addressid`) from `hethi`.`dcustomercommn`),0));
set addressId=addressId+1;
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
addressId,
'',
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
set userId=(select ifnull((select max(`duser`.`user_id`) from `hethi`.`duser`),0));
set userId=userId+1;
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
customerId,
now(),
roleId,
addressId,
'',
userId,
'',
userName,
'',
''
);
Select
  dcustomer.business_name,
  drole.role_name,
  addressId,userName,userId 
From
  dcustomer Inner Join
  drole On dcustomer.customer_id = drole.customer_id
Where
  drole.role_id = roleId;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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

set current_status= ( select ifnull((select hethi.dcustomrules.customer_id  From  hethi.dcustomrules where  hethi.dcustomrules.customer_id=varcustomer_id and hethi.dcustomrules.efs_uin=varefs_uin and hethi.dcustomrules.sfs_uin=varsfs_uin and  hethi.dcustomrules.rule_workset=varrule_workset and   hethi.dcustomrules.ruleset_id=varrule_ruleset limit 1),0));

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
  hethi.cstandardrules.ruleset_id = varrule_ruleset and
   hethi.cstandardrules.rule_status = 1);

select 'first entry';

else



delete  from `hethi`.`dcustomrules`
Where
  hethi.dcustomrules.rule_workset = varrule_workset And
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
  hethi.cstandardrules.ruleset_id = varrule_ruleset and
  hethi.cstandardrules.rule_status = 1 );

select 'duplicate  entry';

end if;


 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `assign_form_to_file` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `assign_form_to_file`(in var_efs varchar(10),in var_uid bigint,in var_fid bigint)
BEGIN


UPDATE `hethi`.`dupload_file` SET `efs_uin`= var_efs WHERE `upload_id`= var_uid  and`file_id`= var_fid;
select * from `dupload_file`  WHERE `upload_id`= var_uid  and`file_id`= var_fid and  `efs_uin`= var_efs;

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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `assign_task_by_user`(in CID bigint,in UserID bigint,in UID bigint,in FID bigint,in JobID bigint,in nextJobID bigint)
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `assign_to_artist`(in CID int,
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `bpaas_create_new_lob`(in efslob_id char(6),
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `bpaas_create_owner_form`(in efslobowner_id char(8),
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `bpaas_load_home_content`()
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

-- DELETE FROM `hethi`.`dassign_customer_serviceplay`;

-- DELETE FROM `hethi`.`dcustomer_calendar`;
-- 
-- DELETE FROM `hethi`.`dcustomer_complianceaspect`;
-- 
-- DELETE FROM `hethi`.`dcustomer_deliveryaspect`;
-- 
-- DELETE FROM `hethi`.`dcustomer_imageaspect`;
-- 
-- DELETE FROM `hethi`.`dcustomer_locale`;
-- 
  DELETE FROM `hethi`.`dcustomer_upload`;
-- 
-- DELETE FROM `hethi`.`dcustomer_volumeaspect`;
-- 
-- DELETE FROM `hethi`.`dcustomerbundlecontent`;
-- 
-- DELETE FROM `hethi`.`dcustomerqueueaccess`;
-- 
-- DELETE FROM `hethi`.`dcustomerserviceplayqueue`;

DELETE FROM `hethi`.`dupload`;

DELETE FROM `hethi`.`dupload_file`;

DELETE FROM `hethi`.`dupload_status`;

DELETE FROM `hethi`.`dupload_status_history`;

-- DELETE FROM `hethi`.`cindexclassifystencil`;





END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cmxsd_efs_storage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `cmxsd_efs_storage`(in customerId bigint,
in mxsd text,in varuser_id bigint)
BEGIN
declare RowCount1,RowCount2,RowCount3,RowCount4,RowCount5 int ;
declare i,j,k,l,m int default 1;
declare efsUin,ownerId char(10);
declare dataTop,dataLeft,dataWidth,dataHeight char(20);
declare labelTop,labelLeft,labelWidth,labelHeight char(20);
declare customName,ixsdFieldName,fieldType,versionNo,ixsdVersion,groupName varchar(45);
declare createdDate datetime;
declare classify,reject,Auther,splitMerge,fieldLocation varchar(100);
declare dataContent,labelContent,ixsdLocation,ixsdXPath,dataSequence,labelSequence varchar(250);
set efsUin=ExtractValue(mxsd,'/mxsd/efsuin_demography/efsuin');
set ownerId=ExtractValue(mxsd,'/mxsd/efsuin_demography/formowner');
set Auther=ExtractValue(mxsd,'/mxsd/efsuin_demography/author');
set versionNo=ExtractValue(mxsd,'/mxsd/efsuin_demography/version');
set ixsdLocation=ExtractValue(mxsd,'/mxsd/efsuin_demography/ixsdlocation');
set ixsdVersion=ExtractValue(mxsd,'/mxsd/efsuin_demography/ixsdversion');

delete from hethi.cmxsd_efs_storage where cmxsd_efs_storage.efs_uin=efsUin and cmxsd_efs_storage.customer_id=customerId;
delete from hethi.cclassification_policy where cclassification_policy.efs_uin=efsUin and cclassification_policy.customer_id=customerId;
   set RowCount4 = ExtractValue(mxsd,'count(//mxsd/efsuin_form/page)');
if RowCount4 > 0 then
while l<=RowCount4 do
   set fieldLocation='header';
   set RowCount1 = ExtractValue(mxsd,'count(//mxsd/efsuin_form/page[$l]/header/group)');
   if RowCount1 > 0 then
   while i<=RowCount1 do
    set groupName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group/_name');
    set RowCount2=ExtractValue(mxsd,'count(//mxsd/efsuin_form/page[$l]/header/group[$i]/field)');
    if RowCount2 > 0 then
       while j<=RowCount2 do

          set ixsdFieldName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/ixsdfieldname');

              set customName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/name');
              set fieldType=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/type');
              set ixsdXPath=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/ixsdxpath');
                   set labelSequence=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/label/sequence');
                   set labelContent=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/label/content');
                       set labelTop=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/label/position/top');
                       set labelLeft=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/label/position/left');
                       set labelWidth=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/label/position/width');
                       set labelHeight=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/label/position/height'); 
                   set dataSequence=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/data/sequence');
                   set dataContent=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/data/content');

                       set dataTop=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/data/position/top');
                       set dataLeft=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/data/position/left');
                       set dataWidth=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/data/position/width');
                       set dataHeight=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/data/position/height'); 
                   set classify=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/indexing/Classify');
                   set reject=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/indexing/Reject');
                   set splitMerge=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/header/group[$i]/field[$j]/indexing/SplitMerge');

 
 INSERT INTO `hethi`.`cmxsd_efs_storage`
(`author`,`created_date`,`customer_id`,`customfieldname`,`data_content`,
`data_position_height`,`data_position_left`,`data_position_top`,`data_position_width`,
`data_sequence`,`efs_uin`,`field_location`,`field_type`,`group_name`,`index_to_classify`,
`index_to_reject`,`index_to_split_merge`,`ixsdfieldname`,`ixsdlocation`,`ixsdversion`,
`ixsdxpath`,`label_content`,`label_position_height`,`label_position_left`,`label_position_top`,
`label_position_width`,`label_sequence`,`owner`,`type`,`version`)
VALUES
(Auther,now(),customerId,customName,dataContent,dataHeight,dataLeft,
dataTop,dataWidth,dataSequence,efsUin,fieldLocation,'',
groupName,classify,reject,splitMerge,ixsdFieldName,ixsdLocation,
ixsdVersion,ixsdXPath,labelContent,labelHeight,labelLeft,labelTop,
labelWidth,labelSequence,ownerId,fieldType,versionNo);
       set j=j+1; 
       end while;
    end if;
    set i=i+1; 
 end while;
end if; 
set i=1,j=1;
set fieldLocation='header';
set RowCount1 = ExtractValue(mxsd,'count(//mxsd/efsuin_form/page[$l]/footer/group)');
   if RowCount1 > 0 then
   while i<=RowCount1 do
    
    set groupName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group/_name');
    set RowCount2=ExtractValue(mxsd,'count(//mxsd/efsuin_form/page[$l]/footer/group[$i]/field)');
    if RowCount2 > 0 then
       while j<=RowCount1 do

          set ixsdFieldName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/ixsdfieldname');
              set customName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/name');
              set fieldType=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/type');
              set ixsdXPath=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/ixsdxpath');
                   set labelSequence=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/label/sequence');
                   set labelContent=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/label/content');
                       set labelTop=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/label/position/top');
                       set labelLeft=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/label/position/left');
                       set labelWidth=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/label/position/width');
                       set labelHeight=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/label/position/height'); 
                   set dataSequence=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/data/sequence');
                   set dataContent=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/data/content');
                       set dataTop=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/data/position/top');
                       set dataLeft=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/data/position/left');
                       set dataWidth=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/data/position/width');
                       set dataHeight=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/data/position/height'); 
                   set classify=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/indexing/Classify');
                   set reject=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/indexing/Reject');
                   set splitMerge=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/indexing/SplitMerge');
                   
              INSERT INTO `hethi`.`cmxsd_efs_storage`
(`author`,
`created_date`,
`customer_id`,
`customfieldname`,
`data_content`,
`data_position_height`,
`data_position_left`,
`data_position_top`,
`data_position_width`,
`data_sequence`,
`efs_uin`,
`field_location`,
`field_type`,
`group_name`,
`index_to_classify`,
`index_to_reject`,
`index_to_split_merge`,
`ixsdfieldname`,
`ixsdlocation`,
`ixsdversion`,
`ixsdxpath`,
`label_content`,
`label_position_height`,
`label_position_left`,
`label_position_top`,
`label_position_width`,
`label_sequence`,
`owner`,
`type`,
`version`)
VALUES
(
Auther,
createdDate,
customerId,
customName,
dataContent,
dataHeight,
dataLeft,
dataTop,
dataWidth,
dataSequence,
efsUin,
fieldLocation,
'',
groupName,
classify,
reject,
splitMerge,
ixsdFieldName,
ixsdLocation,
ixsdVersion,
ixsdXPath,
labelContent,
labelHeight,
labelLeft,
labelTop,
labelWidth,
labelSequence,
ownerId,
fieldType,
versionNo
);
       set j=j+1; 
       end while;
    end if;
    set i=i+1; 
 end while;
end if; 
set i=1,j=1;
set fieldLocation='header';
set RowCount1 = ExtractValue(mxsd,'count(//mxsd/efsuin_form/page[$l]/body/group)');
   if RowCount1 > 0 then
   while i<=RowCount1 do
    
    set groupName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group/_name');
    set RowCount2=ExtractValue(mxsd,'count(//mxsd/efsuin_form/page[$l]/body/group[$i]/field)');
    if RowCount2 > 0 then
       while j<=RowCount2 do
          set ixsdFieldName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/ixsdfieldname');
              set customName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/field[$j]/name');
              set fieldType=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/type');
              set ixsdXPath=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/ixsdxpath');
                   set labelSequence=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/label/sequence');
                   set labelContent=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/label/content');
                       set labelTop=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/label/position/top');
                       set labelLeft=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/label/position/left');
                       set labelWidth=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/label/position/width');
                       set labelHeight=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/label/position/height'); 
                   set dataSequence=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/data/sequence');
                   set dataContent=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/data/content');
                       set dataTop=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/data/position/top');
                       set dataLeft=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/data/position/left');
                       set dataWidth=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/data/position/width');
                       set dataHeight=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/data/position/height'); 
                   set classify=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/indexing/Classify');
                   set reject=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/indexing/Reject');
                   set splitMerge=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/field[$j]/indexing/SplitMerge');
                   
INSERT INTO `hethi`.`cmxsd_efs_storage`
(`author`,
`created_date`,
`customer_id`,
`customfieldname`,
`data_content`,
`data_position_height`,
`data_position_left`,
`data_position_top`,
`data_position_width`,
`data_sequence`,
`efs_uin`,
`field_location`,
`field_type`,
`group_name`,
`index_to_classify`,
`index_to_reject`,
`index_to_split_merge`,
`ixsdfieldname`,
`ixsdlocation`,
`ixsdversion`,
`ixsdxpath`,
`label_content`,
`label_position_height`,
`label_position_left`,
`label_position_top`,
`label_position_width`,
`label_sequence`,
`owner`,
`type`,
`version`)
VALUES
(
Auther,
createdDate,
customerId,
customName,
dataContent,
dataHeight,
dataLeft,
dataTop,
dataWidth,
dataSequence,
efsUin,
fieldLocation,
'',
groupName,
classify,
reject,
splitMerge,
ixsdFieldName,
ixsdLocation,
ixsdVersion,
ixsdXPath,
labelContent,
labelHeight,
labelLeft,
labelTop,
labelWidth,
labelSequence,
ownerId,
fieldType,
versionNo
);


       set j=j+1; 
       end while;
    end if;
    set RowCount3=ExtractValue(mxsd,'count(//mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field)');
   set j=1,k=1;
    if RowCount3 > 0 then
      while k <=RowCount3 do
  
          set ixsdFieldName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/ixsdfieldname');
              set customName=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/footer/group[$i]/fieldist/field[$k]/name');
              set fieldType=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/type');
              set ixsdXPath=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/ixsdxpath');
                   set labelSequence=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/label/sequence');
                   set labelContent=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/label/content');
                       set labelTop=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/label/position/top');
                       set labelLeft=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/label/position/left');
                       set labelWidth=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/label/position/width');
                       set labelHeight=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/label/position/height'); 
                   set dataSequence=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/data/sequence');
                   set dataContent=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/data/content');
                       set dataTop=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/data/position/top');
                       set dataLeft=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/data/position/left');
                       set dataWidth=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/data/position/width');
                       set dataHeight=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/data/position/height'); 
                   set classify=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/indexing/Classify');
                   set reject=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/indexing/Reject');
                   set splitMerge=ExtractValue(mxsd,'/mxsd/efsuin_form/page[$l]/body/group[$i]/fieldist/field[$k]/indexing/SplitMerge');
                   
INSERT INTO `hethi`.`cmxsd_efs_storage`
(`author`,
`created_date`,
`customer_id`,
`customfieldname`,
`data_content`,
`data_position_height`,
`data_position_left`,
`data_position_top`,
`data_position_width`,
`data_sequence`,
`efs_uin`,
`field_location`,
`field_type`,
`group_name`,
`index_to_classify`,
`index_to_reject`,
`index_to_split_merge`,
`ixsdfieldname`,
`ixsdlocation`,
`ixsdversion`,
`ixsdxpath`,
`label_content`,
`label_position_height`,
`label_position_left`,
`label_position_top`,
`label_position_width`,
`label_sequence`,
`owner`,
`type`,
`version`)
VALUES
(
Auther,
createdDate,
customerId,
customName,
dataContent,
dataHeight,
dataLeft,
dataTop,
dataWidth,
dataSequence,
efsUin,
fieldLocation,
'',
groupName,
classify,
reject,
splitMerge,
ixsdFieldName,
ixsdLocation,
ixsdVersion,
ixsdXPath,
labelContent,
labelHeight,
labelLeft,
labelTop,
labelWidth,
labelSequence,
ownerId,
fieldType,
versionNo
);    
       set k=k+1;
      end while;
    end if; 
    set i=i+1; 
 end while;
end if; 

set l=l+1; 
 end while;
end if; 
set RowCount5 = ExtractValue(mxsd,'count(//mxsd/efsuin_classify)');
if RowCount5 > 0 then
while m<=RowCount5 do

INSERT INTO `hethi`.`cclassification_policy`
(`customer_id`,`efs_uin`,`policyname`,`policytype`,`policydescription`,
`policycreated_date`,`policyexpirydate`,`data_sequence`,`data_content`,
`data_position_top`,`data_position_left`,`data_position_width`,`data_position_height`,
`data_expected_content`,`indexname`,`lastuptm`,`lastupduser`)
VALUES
(customerId,efsUin,
ExtractValue(mxsd,'/mxsd/efsuin_classify/policy'),
ExtractValue(mxsd,'/mxsd/efsuin_classify/type'),
'',now(),now(),m,
ExtractValue(mxsd,'/mxsd/efsuin_classify/data'),
ExtractValue(mxsd,'/mxsd/efsuin_classify/position/top'),
ExtractValue(mxsd,'/mxsd/efsuin_classify/position/left'),
ExtractValue(mxsd,'/mxsd/efsuin_classify/position/width'),
ExtractValue(mxsd,'/mxsd/efsuin_classify/position/height'),
ExtractValue(mxsd,'/mxsd/efsuin_classify/data'),
'',now(),varuser_id);

set m=m+1; 
 end while;
end if; 
-- select efsUin,ixsdfieldname,data_content from cmxsd_efs_storage where efs_uin=efsUin;

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
/*!50003 DROP PROCEDURE IF EXISTS `complete_user_registration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `complete_user_registration`(in userData text)
BEGIN
declare i int default 1;
declare userName,userId,lastName,firstName,custPassword,namePrefix varchar(100);
declare RowCount int default  ExtractValue(userData,'count(//data)');
while i<=RowCount do
set lastName=ExtractValue(userData,'/root/data[$i]/customer_lname');
set firstName=ExtractValue(userData,'/root/data[$i]/customer_fname');
set custPassword=ExtractValue(userData,'/root/data[$i]/password');
set namePrefix=ExtractValue(userData,'/root/data[$i]/name_prefix');
set userId=ExtractValue(userData,'/root/data[$i]/userId');
set userName=ExtractValue(userData,'/root/data[$i]/user_name');

UPDATE `hethi`.`duser`
SET
`user_name`=userName,
`lastupdtm` = now(),
`user_firstname` = firstName,
`user_lastname` = lastName,
`user_login_password` = custPassword,
`user_prefix` = namePrefix
WHERE `user_id` = userId;
set i=i+1;
end while;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_cformowner` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `create_new_cformowner`(in xml_data text,in userID varchar(10))
BEGIN

declare RowCount int default  ExtractValue(xml_data,'count(//data)');
declare i int default 1;

declare efslobowner_var varchar(15);
declare marketplace_ID_var varchar(15);
declare efslobowner_name_var varchar(60);
declare efslobowner_email_var varchar(50);
declare numericvalue bigint;



while i<=RowCount do


set efslobowner_var=(SELECT max(`cformowner`.`efslobowner_id`)FROM `hethi`.`cformowner`);
set numericvalue=substring(efslobowner_var,4)+1;
set efslobowner_var=concat('HAA',numericvalue);

select  numericvalue,efslobowner_var;


set marketplace_ID_var= ExtractValue(xml_data,'/root/data[$i]/marketplace_ID');
set efslobowner_name_var= ExtractValue(xml_data,'/root/data[$i]/owner_name');
set efslobowner_email_var= ExtractValue(xml_data,'/root/data[$i]/owner_email');

INSERT INTO `hethi`.`cformowner`
(`efslobowner_id`,
`efslobowner_name`,
`lastupdtm`,
`lastupuser`,
`marketplace_ID`,
`owner_email`)
VALUES
(
efslobowner_var,
efslobowner_name_var,
now(),
userID,
marketplace_ID_var,
efslobowner_email_var
);


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
/*!50003 DROP PROCEDURE IF EXISTS `disableRule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `disableRule`(in efsUin varchar(10),
in ruleUin varchar(10),in rulesetId varchar(10))
BEGIN
UPDATE `hethi`.`cstandardrules`
SET
`rule_status` = 0
WHERE `efs_uin` = efsUin and `rule_uin` = ruleUin and 
`ruleset_id` = rulesetId;

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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `documentstatusupdate`(in upload_id bigint,
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `fileuploadedpath`(in cust_id int)
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `generatebatchid`(in batchno varchar(50),
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `generate_form_stencilid`(
in uploadid int,in fileid int,in user bigint,in form_xsd text,
in file_location varchar(200),in varcustomer_id bigint)
BEGIN

declare form_stencid char(10);
declare numericvalue bigint;


set form_stencid=(select ifnull(max(`cindexclassifystencil`.`form_stencid`),'HAA000000') from `cindexclassifystencil`);
set numericvalue=substring(form_stencid,4)+1;

set form_stencid=concat('HAA',numericvalue);


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
call cmxsd_efs_storage(varcustomer_id,form_xsd,user);
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `getstencildata_by_stencilid`(in stencilid varchar(10))
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
/*!50003 DROP PROCEDURE IF EXISTS `get_stencil_template_by_stencil_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `get_stencil_template_by_stencil_id`(in stencilid varchar(10))
BEGIN
Select
  hethi.cindexclassifystencil.*
From
  hethi.cindexclassifystencil 
Where
  hethi.cindexclassifystencil.form_stencid = stencilid;


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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `hethi_authentication`(in username varchar(50),
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
declare namePrefix,lName,roleName,contactName,businessEmail,businessName,businessFax,customerName,userName,cust_locZip,cust_business_name,gpsCoordinate,whatsApp,linkedIn,socialType varchar(100);
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
`contact_number` = contactNumber
WHERE `customer_id` = customerId;


set userId=ExtractValue(regData,'/root/data[$i]/user_id');
set roleId=ExtractValue(regData,'/root/data[$i]/role_id');
set userAddress=ExtractValue(regData,'/root/data[$i]/user_address');
set user_loginId=ExtractValue(regData,'/root/data[$i]/login_id');
set user_loginPassword=ExtractValue(regData,'/root/data[$i]/user_login_password');
set userName=ExtractValue(regData,'/root/data[$i]/userName');
set lName=ExtractValue(regData,'/root/data[$i]/last_name');
set namePrefix=ExtractValue(regData,'/root/data[$i]/name_prefix');

UPDATE `hethi`.`duser`
SET
`customer_id` = customerId,
`lastupdtm` = now(),
`role_id` = roleId,
`user_address` = userAddress,
`user_firstname` = customerName,
`user_lastname` = lName,
`user_login_id` = user_loginId,
`user_login_password` = user_loginPassword,
`user_prefix` = namePrefix,
`user_name`=userName
WHERE `user_id` = userId;


set roleName=ExtractValue(regData,'/root/data[$i]/role_name');



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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `listuploadeddocument`(
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
/*!50003 DROP PROCEDURE IF EXISTS `loadAvailableRoles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `loadAvailableRoles`(in customerId int(11))
BEGIN
select 
 drole.* 
from drole 
where 
  customer_id=customerId;

Select
  duser.role_id,
  duser.user_name,
  drole.*,
  duser.user_id
From
  drole Inner Join
  duser On duser.customer_id = drole.customer_id And duser.role_id =
    drole.role_id
Where
  duser.role_id Not In (1) And
  duser.customer_id = customerId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loadRuleRepo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `loadRuleRepo`(in ruleUin varchar(10))
BEGIN
Select
  duser.user_firstname,
  rules_repository.*
From
  rules_repository Inner Join
  duser On rules_repository.lastupuser = duser.user_id
Where
  rules_repository.rule_uin = ruleUin
;

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
/*!50003 DROP PROCEDURE IF EXISTS `load_all_forms_with_owner_and_template` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_all_forms_with_owner_and_template`()
BEGIN


Select
  hethi.cformowner.efslobowner_name,
  hethi.cformowner.owner_email,
  hethi.cmarketplace.Makertplace_type,
  hethi.cindexclassifystencil.efs_uin,
  hethi.cindexclassifystencil.eFS_XSD,
  hethi.cindexclassifystencil.eFS_XSD_location,
  hethi.cindexclassifystencil.efslobowner_id,
  hethi.cform_lob.*,
  hethi.cbpaas_service_offering.BPaaS_service,
  hethi.cindustry_offering.indus_service,
  hethi.ciconnector_efs.*
From
  hethi.cindexclassifystencil Inner Join
  hethi.cformowner On hethi.cindexclassifystencil.efslobowner_id =
    hethi.cformowner.efslobowner_id Inner Join
  hethi.cmarketplace On hethi.cformowner.marketplace_ID =
    hethi.cmarketplace.marketplace_ID Inner Join
  hethi.cform_lob On hethi.cform_lob.form_stencid =
    hethi.cindexclassifystencil.form_stencid Inner Join
  hethi.ciconnector_efs On hethi.ciconnector_efs.efslob_id =
    hethi.cform_lob.efslob_id Inner Join
  hethi.cbpaas_service_offering On hethi.ciconnector_efs.BpaaS_id =
    hethi.cbpaas_service_offering.BpaaS_id Inner Join
  hethi.cindustry_offering On hethi.ciconnector_efs.indus_id =
    hethi.cindustry_offering.indus_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_all_master_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_all_master_data`()
BEGIN

-- 0

SELECT `cbpaas_service_offering`.* FROM `hethi`.`cbpaas_service_offering`;

-- 1

SELECT `cindustry_offering`.* FROM `hethi`.`cindustry_offering`;


-- 2

SELECT `cform_lob`.* FROM `hethi`.`cform_lob`;

-- 3

SELECT `cformowner`.* FROM `hethi`.`cformowner`;

-- 4

SELECT `cmarketplace`.* FROM `hethi`.`cmarketplace`;






END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_all_process_and_sub_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `load_all_process_and_sub_process`()
BEGIN


Select
  chethi_services.*
From
  chethi_services;
  
  
Select
  csconnector.*,
  chethi_services.*,
  ccore_serviceplays.hethi_subservicecode
From
  csconnector Inner Join
  chethi_services
    On csconnector.hethi_service_id = chethi_services.hethi_service_id
  Inner Join
  ccore_serviceplays
    On csconnector.subservice_id = ccore_serviceplays.serviceplay_id;
    

  Select
  csconnector.*,
  chethi_services.*,
  ccore_serviceplays.hethi_subservicecode,
  cmicro_process.*
From
  csconnector Inner Join
  chethi_services
    On csconnector.hethi_service_id = chethi_services.hethi_service_id
  Inner Join
  ccore_serviceplays
    On csconnector.subservice_id = ccore_serviceplays.serviceplay_id Inner Join
  cmicro_process
    On cmicro_process.sfs_UIN = csconnector.sfs_UIN;
    
    


SELECT * FROM hethi.dupload_log_status;
  

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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_artistlist`(
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
/*!50003 DROP PROCEDURE IF EXISTS `load_cbaas_workflow_rule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_cbaas_workflow_rule`( in form_efs_uin varchar(100))
BEGIN
Select
  hethi.cbaas_workflow.*,
  hethi.cruleset.*
From
  hethi.cbaas_workflow Inner Join
  hethi.cruleset On hethi.cbaas_workflow.cruleset_id =
    hethi.cruleset.cruleset_id
Where
  hethi.cbaas_workflow.efs_uin = form_efs_uin;
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_ccore_serviceplays`(in varcustomer_id int,in varefs_uin char(10))
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
/*!50003 DROP PROCEDURE IF EXISTS `load_classify_templ_apply` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_classify_templ_apply`(in dbimgefsuin char(10),in customerid int,in uploadid int)
BEGIN

Select
  cindexclassifystencil.eFS_XSD_location,
  dupload_file.efs_uin As efs_uin1
From
  dupload_file Inner Join
  ciconnector_efs On dupload_file.efs_uin = ciconnector_efs.efs_uin Inner Join
  cform_lob On ciconnector_efs.efslob_id = cform_lob.efslob_id Inner Join
  cindexclassifystencil On cindexclassifystencil.form_stencid =
    cform_lob.form_stencid
Where
  dupload_file.efs_uin = dbimgefsuin
Group By
   ciconnector_efs.efs_uin;


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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_customer_serviceplay`(in customer_id int)
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
  
  SELECT `dupload`.*
FROM `hethi`.`dupload`
Inner Join
  dcustomer_upload On dupload.upload_id = dcustomer_upload.upload_id
Where
  dcustomer_upload.customer_id = varcustomer_id;




Select
  dupload_file.*,
  dupload_log_status.status_text,
  dupload_log.lastupdtm As lastupdtm1,
  cmicro_process.micro_process_name
From
  dupload_file Inner Join
  dcustomer_upload
    On dupload_file.upload_id = dcustomer_upload.upload_id Inner Join
  dupload_log
    On dupload_file.upload_id = dupload_log.upload_id And dupload_file.file_id =
    dupload_log.file_id Inner Join
  dupload_log_status
    On dupload_log.status = dupload_log_status.status_id Inner Join
  cmicro_process
    On dupload_log.micro_process_id = cmicro_process.micro_process_id
Where
  dcustomer_upload.customer_id =varcustomer_id;
  
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_dashboard_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `load_dashboard_data`()
BEGIN

Select
  dupload_log_status.status_text,
  cmicro_process.micro_process_name,
  cmicro_process.sub_index,
  dupload_log.*,
  dcustomer.*,
  chethi_services.hethi_servicecode,
  cmicro_process.sfs_UIN,
  ccore_services.master_service,
  csconnector.hethi_service_id,
  csconnector.subservice_id,
  csconnector.service_id,
  ccore_serviceplays.hethi_subservicecode
From
  dupload_log Inner Join
  dupload_log_status
    On dupload_log.status = dupload_log_status.status_id Inner Join
  cmicro_process
    On dupload_log.micro_process_id = cmicro_process.micro_process_id Inner Join
  csconnector
    On cmicro_process.sfs_UIN = csconnector.sfs_UIN Inner Join
  chethi_services
    On csconnector.hethi_service_id = chethi_services.hethi_service_id
  Inner Join
  ccore_serviceplays
    On csconnector.subservice_id = ccore_serviceplays.serviceplay_id Inner Join
  ccore_services
    On chethi_services.service_id = ccore_services.service_id Inner Join
  dcustomer
    On dupload_log.customer_id = dcustomer.customer_id;
    
    
    
    
    
    Select
  dupload_log_status.status_text,
  cmicro_process.micro_process_name,
  cmicro_process.sub_index,
  dcustomer.*,
  chethi_services.hethi_servicecode,
  cmicro_process.sfs_UIN,
  ccore_services.master_service,
  csconnector.hethi_service_id,
  csconnector.subservice_id,
  csconnector.service_id,
  ccore_serviceplays.hethi_subservicecode,
  dupload_log_history.*
From
  dupload_log_status Inner Join
  dupload_log_history
    On dupload_log_history.status = dupload_log_status.status_id Inner Join
  cmicro_process
    On dupload_log_history.micro_process_id = cmicro_process.micro_process_id
  Inner Join
  csconnector
    On cmicro_process.sfs_UIN = csconnector.sfs_UIN Inner Join
  chethi_services
    On csconnector.hethi_service_id = chethi_services.hethi_service_id
  Inner Join
  ccore_serviceplays
    On csconnector.subservice_id = ccore_serviceplays.serviceplay_id Inner Join
  ccore_services
    On chethi_services.service_id = ccore_services.service_id Inner Join
  dcustomer
    On dupload_log_history.customer_id = dcustomer.customer_id;
    

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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_hethi_artist_task_list`(
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
/*!50003 DROP PROCEDURE IF EXISTS `load_img_fullextract` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_img_fullextract`(in uid int,in cusid int )
BEGIN
SELECT file_location, file_id FROM hethi.dupload_file where upload_id=uid;
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
  hethi.dcustomrules.*
From
  hethi.dcustomrules 
Where 
dcustomrules.efs_uin = EFS and  
dcustomrules.sfs_uin = SFS and  
dcustomrules.customer_id = cid ;


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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_offer_serviceplay`()
BEGIN

SELECT `hethi_offers`.*
FROM `hethi`.`hethi_offers`;



Select
  csconnector.sfs_UIN,
  chethi_services.hethi_servicecode,
  hethi_offers_details.sfs_uin As sfs_uin1,
  hethi_offers.offer_name,
  csconnector.subservice_id,
  ccore_serviceplays.hethi_subservicecode,
  hethi_offers_details.offer_id
From
  hethi_offers Inner Join
  hethi_offers_details On hethi_offers.offer_id = hethi_offers_details.offer_id
  Inner Join
  csconnector On hethi_offers_details.sfs_uin = csconnector.sfs_UIN Inner Join
  chethi_services On csconnector.hethi_service_id =
    chethi_services.hethi_service_id Inner Join
  ccore_serviceplays On csconnector.subservice_id =
    ccore_serviceplays.serviceplay_id
Group By
  csconnector.subservice_id, hethi_offers_details.offer_id,
  hethi_offers.offer_id, csconnector.service_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_pdf_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_pdf_location`(in uid int,in cusid int)
BEGIN
SELECT file_location, file_id,efs_uin FROM hethi.dupload_file where upload_id=uid;
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
`cstandardrules`.`effective_enddate`,
`cstandardrules`.`effective_startdate`,
`cstandardrules`.`efs_uin`,
`cstandardrules`.`lastupdtm`,
`cstandardrules`.`lastupuser`,
`cstandardrules`.`rule_action`,
`cstandardrules`.`rule_comments`,
`cstandardrules`.`rule_condition`,
`cstandardrules`.`rule_failure`,
`cstandardrules`.`rule_name`,
`cstandardrules`.`rule_order`,
`cstandardrules`.`rule_status`,
`cstandardrules`.`rule_type`,
`cstandardrules`.`rule_uin`,
`cstandardrules`.`ruleset_id`,
`cstandardrules`.`rule_category`
FROM `hethi`.`cstandardrules`
 ;

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
SELECT
`rule_operations`.`custom_message`,
`rule_operations`.`custom_type_options`,
`rule_operations`.`custom_type`,
`rule_operations`.`custom_value`,
`rule_operations`.`description`,
`rule_operations`.`expression_input`,
`rule_operations`.`operation_expression`,
`rule_operations`.`rule_type`,
`rule_operations`.`operation_id`,
`rule_operations`.`operation_name`,
`rule_operations`.`operation_type`,
`rule_operations`.`status`
FROM `hethi`.`rule_operations`;


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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_task_list_by_user`(in customerID bigint,in roleID bigint)
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
/*!50003 DROP PROCEDURE IF EXISTS `load_uploaded_files_by_upload_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_uploaded_files_by_upload_id`(upload_id bigint)
BEGIN

SELECT
`dupload_file`.*
FROM `hethi`.`dupload_file`
where
`dupload_file`.`upload_id`=upload_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `load_uploads_by_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `load_uploads_by_status`( stats int)
BEGIN

Select
  dupload.*,
  dcustomer_upload.*,
  dcustomer.*,
  (Select
    ifnull(Count(dupload_file.file_id),0)
  From
    dupload_file
  Where
    dupload_file.upload_id = dupload.upload_id
  Group By
    dupload_file.upload_id) As file_count
From
  dupload Inner Join
  dcustomer_upload On dupload.upload_id = dcustomer_upload.upload_id Inner Join
  dcustomer On dcustomer_upload.customer_id = dcustomer.customer_id
Where
  hethi.dupload.upload_status = stats;

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
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `new_procedure`(in operationId int)
BEGIN
select * 
from rule_operations 
where operation_id=operationId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `offer_assingnto_artist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `offer_assingnto_artist`(
in customer_id bigint,in artist_id bigint,in efs_data text,in sfs_data text)
BEGIN
declare RowCount int default  ExtractValue(efs_data,'count(//data)');
declare RowCount1 int default  ExtractValue(sfs_data,'count(//data)');

declare varsfs_uin,varefs_uin char(10);
declare isExists,upload_id,user_id int;
declare i int default 1;

declare JobID int default 1;
declare nextJobID int;

declare j int default 1;


while i<=RowCount do
set varefs_uin= ExtractValue(efs_data,'/root/data[$i]/efs_uin');
set upload_id= ExtractValue(efs_data,'/root/data[$i]/upload_id');
set user_id= ExtractValue(efs_data,'/root/data[$i]/user_id');

DELETE FROM `hethi`.`dassign_customer_serviceplay` 
WHERE `customer_id`=user_id and`efs_uin`=varefs_uin;

while j<=RowCount1 do

set varsfs_uin= ExtractValue(sfs_data,'/root/data[$j]/sfs_UIN');
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
set j=j+1;
end while;


UPDATE `hethi`.`dcustomer_upload`
SET
`dcustomer_upload`.`assigneddtm` = now(),
`dcustomer_upload`.`business_artist` = artist_id,
`dcustomer_upload`.`lastupuser` = user_id
WHERE `dcustomer_upload`.`customer_id` = customer_id and 
 `dcustomer_upload`.`upload_id`=upload_id;

set nextJobID=(select ifnull( (SELECT `cjob_flow`.`next_job_id` FROM `hethi`.`cjob_flow` where `cjob_flow`.`current_job_id`=JobID),2));

UPDATE `hethi`.`dupload_status` SET
 `status`=nextJobID, 
`lastupuser`=user_id, 
`lastupdtm`=now() WHERE 
`upload_id`=upload_id;


INSERT INTO `hethi`.`dupload_status_history`
(
SELECT
upload_id,
`dupload_file`.`file_id`,
JobID,
user_id,
now()
FROM `hethi`.`dupload_file`
WHERE 
`dupload_file`.`upload_id`= upload_id
);

set i=i+1;

end while;

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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `previewgenerator`(
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_customer_serviceplay`(
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
/*!50003 DROP PROCEDURE IF EXISTS `save_ixml_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_ixml_data`(in customerId int,in mxsd text)
BEGIN
declare RowCount1 int ;
declare RowCount2,RowCount8,RowCount9 int;
declare RowCount3,RowCount4,RowCount5,RowCount6,RowCount7 int;
declare i int default 1;
declare j int default 1;
declare k,l,m,n,o,p,q int default 1;
declare efsUin,ownerId char(10);
declare dataTop,dataLeft,dataWidth,dataHeight char(20);
declare labelTop,labelLeft,labelWidth,labelHeight char(20);
declare customName,ixsdFieldName,fieldType,versionNo,ixsdVersion,groupName varchar(45);
declare createdDate datetime;
declare classify,reject,Auther,splitMerge,fieldLocation varchar(100);
declare dataContent,labelContent,ixsdLocation,ixsdXPath,dataSequence,labelSequence varchar(250);
set efsUin=ExtractValue(mxsd,'/mxsd/form/efsuin');
set ownerId=ExtractValue(mxsd,'/mxsd/_owner');
set Auther=ExtractValue(mxsd,'/mxsd/_auther');
set versionNo=ExtractValue(mxsd,'/mxsd/_version');
set ixsdLocation=ExtractValue(mxsd,'/mxsd/_ixsdlocation');
set ixsdVersion=ExtractValue(mxsd,'/mxsd/_ixsdversion');

   set fieldLocation='header';
   set RowCount1 = ExtractValue(mxsd,'count(//mxsd/form/header/group)');
   if RowCount1 > 0 then
   while i<=RowCount1 do
    set RowCount2=ExtractValue(mxsd,'count(//mxsd/form/header/group[$i]/field)');
    if RowCount2 > 0 then
       while j<=RowCount2 do

          set ixsdFieldName=ExtractValue(mxsd,'/mxsd/form/header/group[$i]/field[$j]/ixsdfieldname');
          set dataContent=ExtractValue(mxsd,'/mxsd/form/header/group[$i]/field[$j]/data/content');


       set j=j+1; 
       end while;
    end if;
    set i=i+1; 
 end while;
end if; 


set i=1,j=1,k=1,l=1,m=1,n=1,o=1,p=1;
set fieldLocation='header';
set RowCount1 = ExtractValue(mxsd,'count(//mxsd/form/footer/group)');
   if RowCount1 > 0 then
   while i<=RowCount1 do
    
    set groupName=ExtractValue(mxsd,'/mxsd/form/footer/group/_name');
    set RowCount2=ExtractValue(mxsd,'count(//mxsd/form/footer/group[$i]/field)');
    if RowCount2 > 0 then
       while j<=RowCount1 do

          set ixsdFieldName=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/ixsdfieldname');
              set customName=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/name');
              set fieldType=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/type');
              set ixsdXPath=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/ixsdxpath');
                   set labelSequence=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/label/sequence');
                   set labelContent=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/label/content');
                       set labelTop=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/label/position/top');
                       set labelLeft=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/label/position/left');
                       set labelWidth=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/label/position/width');
                       set labelHeight=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/label/position/height'); 
                   set dataSequence=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/data/sequence');
                   set dataContent=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/data/content');
                       set dataTop=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/data/position/top');
                       set dataLeft=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/data/position/left');
                       set dataWidth=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/data/position/width');
                       set dataHeight=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/data/position/height'); 
                   set classify=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/indexing/Classify');
                   set reject=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/indexing/Reject');
                   set splitMerge=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/indexing/SplitMerge');
                   
              INSERT INTO `hethi`.`cmxsd_efs_storage`
(`author`,
`created_date`,
`customer_id`,
`customfieldname`,
`data_content`,
`data_position_height`,
`data_position_left`,
`data_position_top`,
`data_position_width`,
`data_sequence`,
`efs_uin`,
`field_location`,
`field_type`,
`group_name`,
`index_to_classify`,
`index_to_reject`,
`index_to_split_merge`,
`ixsdfieldname`,
`ixsdlocation`,
`ixsdversion`,
`ixsdxpath`,
`label_content`,
`label_position_height`,
`label_position_left`,
`label_position_top`,
`label_position_width`,
`label_sequence`,
`owner`,
`type`,
`version`)
VALUES
(
Auther,
createdDate,
customerId,
customName,
dataContent,
dataHeight,
dataLeft,
dataTop,
dataWidth,
dataSequence,
efsUin,
fieldLocation,
'',
groupName,
classify,
reject,
splitMerge,
ixsdFieldName,
ixsdLocation,
ixsdVersion,
ixsdXPath,
labelContent,
labelHeight,
labelLeft,
labelTop,
labelWidth,
labelSequence,
ownerId,
fieldType,
versionNo
);

       set j=j+1; 
       end while;
    end if;
    set i=i+1; 
 end while;
end if; 
set i=1,j=1,k=1,l=1,m=1,n=1,o=1,p=1;
set fieldLocation='header';
set RowCount1 = ExtractValue(mxsd,'count(//mxsd/form/body/group)');
   if RowCount1 > 0 then
   while i<=RowCount1 do
    
    set groupName=ExtractValue(mxsd,'/mxsd/form/body/group/_name');
    set RowCount2=ExtractValue(mxsd,'count(//mxsd/form/body/group[$i]/field)');
    if RowCount2 > 0 then
       while j<=RowCount1 do
          set ixsdFieldName=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/ixsdfieldname');
              set customName=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/field[$j]/name');
              set fieldType=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/type');
              set ixsdXPath=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/ixsdxpath');
                   set labelSequence=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/label/sequence');
                   set labelContent=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/label/content');
                       set labelTop=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/label/position/top');
                       set labelLeft=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/label/position/left');
                       set labelWidth=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/label/position/width');
                       set labelHeight=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/label/position/height'); 
                   set dataSequence=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/data/sequence');
                   set dataContent=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/data/content');
                       set dataTop=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/data/position/top');
                       set dataLeft=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/data/position/left');
                       set dataWidth=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/data/position/width');
                       set dataHeight=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/data/position/height'); 
                   set classify=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/indexing/Classify');
                   set reject=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/indexing/Reject');
                   set splitMerge=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/field[$j]/indexing/SplitMerge');
                   
INSERT INTO `hethi`.`cmxsd_efs_storage`
(`author`,
`created_date`,
`customer_id`,
`customfieldname`,
`data_content`,
`data_position_height`,
`data_position_left`,
`data_position_top`,
`data_position_width`,
`data_sequence`,
`efs_uin`,
`field_location`,
`field_type`,
`group_name`,
`index_to_classify`,
`index_to_reject`,
`index_to_split_merge`,
`ixsdfieldname`,
`ixsdlocation`,
`ixsdversion`,
`ixsdxpath`,
`label_content`,
`label_position_height`,
`label_position_left`,
`label_position_top`,
`label_position_width`,
`label_sequence`,
`owner`,
`type`,
`version`)
VALUES
(
Auther,
createdDate,
customerId,
customName,
dataContent,
dataHeight,
dataLeft,
dataTop,
dataWidth,
dataSequence,
efsUin,
fieldLocation,
'',
groupName,
classify,
reject,
splitMerge,
ixsdFieldName,
ixsdLocation,
ixsdVersion,
ixsdXPath,
labelContent,
labelHeight,
labelLeft,
labelTop,
labelWidth,
labelSequence,
ownerId,
fieldType,
versionNo
);

       set j=j+1; 
       end while;
    end if;
    set RowCount9=ExtractValue(mxsd,'count(//mxsd/form/body/group[$i]/fieldist/field)');
   set j=1,k=1,l=1,m=1,n=1,o=1,p=1;
    if RowCount9 > 0 then
      while q <=RowCount9 do
  
          set ixsdFieldName=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/ixsdfieldname');
              set customName=ExtractValue(mxsd,'/mxsd/form/footer/group[$i]/fieldist/field[$q]/name');
              set fieldType=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/type');
              set ixsdXPath=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/ixsdxpath');
                   set labelSequence=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/label/sequence');
                   set labelContent=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/label/content');
                       set labelTop=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/label/position/top');
                       set labelLeft=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/label/position/left');
                       set labelWidth=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/label/position/width');
                       set labelHeight=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/label/position/height'); 
                   set dataSequence=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/data/sequence');
                   set dataContent=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/data/content');
                       set dataTop=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/data/position/top');
                       set dataLeft=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/data/position/left');
                       set dataWidth=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/data/position/width');
                       set dataHeight=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/data/position/height'); 
                   set classify=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/indexing/Classify');
                   set reject=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/indexing/Reject');
                   set splitMerge=ExtractValue(mxsd,'/mxsd/form/body/group[$i]/fieldist/field[$q]/indexing/SplitMerge');
                   
INSERT INTO `hethi`.`cmxsd_efs_storage`
(`author`,
`created_date`,
`customer_id`,
`customfieldname`,
`data_content`,
`data_position_height`,
`data_position_left`,
`data_position_top`,
`data_position_width`,
`data_sequence`,
`efs_uin`,
`field_location`,
`field_type`,
`group_name`,
`index_to_classify`,
`index_to_reject`,
`index_to_split_merge`,
`ixsdfieldname`,
`ixsdlocation`,
`ixsdversion`,
`ixsdxpath`,
`label_content`,
`label_position_height`,
`label_position_left`,
`label_position_top`,
`label_position_width`,
`label_sequence`,
`owner`,
`type`,
`version`)
VALUES
(
Auther,
createdDate,
customerId,
customName,
dataContent,
dataHeight,
dataLeft,
dataTop,
dataWidth,
dataSequence,
efsUin,
fieldLocation,
'',
groupName,
classify,
reject,
splitMerge,
ixsdFieldName,
ixsdLocation,
ixsdVersion,
ixsdXPath,
labelContent,
labelHeight,
labelLeft,
labelTop,
labelWidth,
labelSequence,
ownerId,
fieldType,
versionNo
);

    
       set q=q+1;
      end while;
    end if; 
    set i=i+1; 
 end while;
end if; 

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
in ruleCondition longtext,in ruleAction varchar(250),in ruleFailure varchar(250),
in startdate date,in enddate date,in ruleStatus int,in lastUpuser char(10),
in ruleCategory varchar(10))
BEGIN
declare ruleOrder int(11);
declare repositoryNo int(11);
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
`rule_type`,
`rule_failure`,
`rule_category`)
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
ruleType,
ruleFailure,
ruleCategory
);
set repositoryNo=(select ifnull((select max(`rules_repository`.`repository_no`) from `hethi`.`rules_repository`),0));
set repositoryNo=repositoryNo+1;
INSERT INTO `hethi`.`rules_repository`
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
`rule_type`,
`rule_failure`,
`repository_no`,
`rule_category`)
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
ruleType,
ruleFailure,
repositoryNo,
ruleCategory
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_offer_serviceplay`(
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
/*!50003 DROP PROCEDURE IF EXISTS `save_update_fullocr_pdf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `save_update_fullocr_pdf`(in uid int,in cusid int,in dbimgfileid int)
BEGIN

update hethi.dupload_status
set
status= '20'
where
upload_id = uid and file_id = dbimgfileid;

INSERT INTO `hethi`.`dupload_status_history`
(`upload_id`,
`file_id`,
`status`,
`lastupuser`,
`lastupdtm`)
VALUES
(uid,
cusid,
dbimgfileid,
'100',
now());




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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `select_customer_services`(in customerid int,in efsuin char(20))
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `store_uploaded_document`(
in file_name varchar(100),in file_type char(15),
in file_size bigint,in user bigint,in formSource varchar(45)
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
`upload_type`,
`upload_source`)
VALUES
(
now(),
now(),
upload_id,
file_name,
file_size,
0,
file_type,
formSource
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
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `store_uploaded_document_details`(in filepath varchar(100),
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
declare fileId,default_status,numericvalue int(11);
declare varstencil_id char(10);
if((SELECT max(`dupload_file`.`file_id`) FROM `hethi`.`dupload_file` WHERE `dupload_file`.`upload_id`=uploadId )!='') then
set fileId=(SELECT max(`dupload_file`.`file_id`) FROM `hethi`.`dupload_file` WHERE `dupload_file`.`upload_id`=uploadId );
set fileId=fileId+1; 
else
set fileId=1;
end if;

set varstencil_id=(select ifnull(max(`cindexclassifystencil`.`form_stencid`),'HAA000000') from `cindexclassifystencil`);
set numericvalue=substring(varstencil_id,4)+1;

set varstencil_id=concat('HAA',numericvalue);

-- set varstencil_id=(select ifnull(max(`cindexclassifystencil`.`form_stencid`)+1,1)from `cindexclassifystencil` 
-- where `cindexclassifystencil`.`efslobowner_id`=customerId and `cindexclassifystencil`.`efs_uin`=efsUin );
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

CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',1, 1,1);
CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',1, 2,1);
CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',1, 3,1);

CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',2, 1,1);
CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',2, 2,1);
CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',2, 3,1);

CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',3, 1,1);
CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',3, 2,1);
CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',3, 3,1);

CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',4, 1,1);
CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',4, 2,1);
CALL `hethi`.`upload_file_logging`(customerId,uploadId,fileId, 'csfs100101',4, 3,1);



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
/*!50003 DROP PROCEDURE IF EXISTS `updateRoleByAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `updateRoleByAdmin`(in userData text)
BEGIN
declare i int default 1;
declare userId,roleId,customerId int(11);
declare RowCount int default  ExtractValue(userData,'count(//data)');
while i<= RowCount do
set customerId=ExtractValue(userData,'/root/data[$i]/customer_id');
set roleId=ExtractValue(userData,'/root/data[$i]/role_id');
set userId=ExtractValue(userData,'/root/data[$i]/user_id');
UPDATE `hethi`.`duser`
SET
`lastupdtm` = now(),
`role_id` = roleId
WHERE `customer_id` = customerId and 
`user_id` = userId ;
set i=i+1;
end while;
Select
  duser.role_id,
  duser.user_name,
  drole.*,
  duser.user_id
From
  drole Inner Join
  duser On duser.customer_id = drole.customer_id And duser.role_id =
    drole.role_id
Where
  duser.role_id Not In (1) And
  duser.customer_id = customerId;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateRule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `updateRule`(
in ruleUin varchar(10),in rulesetId varchar(10),in ruleName varchar(100),
in ruleDesc varchar(500),in ruleEfs varchar(20),in ruleType varchar(10),
in ruleCondition longtext,in ruleAction varchar(250),in ruleFailure varchar(250),
in startdate date,in enddate date,in ruleStatus int,in lastUpuser char(10),
in ruleOrder int(11),in ruleCategory varchar(15))
BEGIN
declare repositoryNo int(11);
 UPDATE `hethi`.`cstandardrules`
SET
`effective_enddate` = enddate,
`effective_startdate` = startdate,
`lastupdtm` = now(),
`lastupuser` = lastUpuser,
`rule_action` = ruleAction,
`rule_category` = ruleCategory,
`rule_comments` = ruleDesc,
`rule_condition` = ruleCondition,
`rule_failure` = ruleFailure,
`rule_name` = ruleName,
`rule_order` = ruleOrder,
`rule_status` =ruleStatus,
`rule_type` = ruleType

WHERE `rule_uin` = ruleUin;

set repositoryNo=(select ifnull((select max(`rules_repository`.`repository_no`) from `hethi`.`rules_repository`),0));
set repositoryNo=repositoryNo+1;
INSERT INTO `hethi`.`rules_repository`
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
`rule_type`,
`rule_failure`,
`repository_no`)
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
ruleUin,
ruleType,
ruleFailure,
repositoryNo
);

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
/*!50003 DROP PROCEDURE IF EXISTS `upload_file_logging` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`%`*/ /*!50003 PROCEDURE `upload_file_logging`(in Cus_id int,in  uid int,in file_id int, in  process_id varchar(50) ,in sub_process_id varchar(50) ,in status_t varchar(50) ,user_id varchar(10))
BEGIN

declare micro_process_id , tmp bigint default 0;
set  micro_process_id = (select ifnull( (SELECT `cmicro_process`.`micro_process_id` FROM `hethi`.`cmicro_process` where `cmicro_process`.`sfs_UIN`=process_id and `cmicro_process`.`sub_index`=sub_process_id ),0));

set tmp= (select ifnull( (SELECT `dupload_log`.`upload_id` FROM `hethi`.`dupload_log` where `dupload_log`.`upload_id`=uid and `dupload_log`.`file_id`=file_id ),0));

if(tmp=0) then

INSERT INTO `hethi`.`dupload_log` (`customer_id`, `upload_id`, `file_id`, `micro_process_id`, `status`, `lastupuser`, `lastupdtm`) VALUES (Cus_id, uid, file_id, micro_process_id , status_t, user_id, now() );else

UPDATE `hethi`.`dupload_log` SET `micro_process_id`=micro_process_id, `status`=status_t, `lastupuser`=user_id, `lastupdtm`=now()  WHERE `upload_id`=uid and`file_id`=file_id ;

end if;
INSERT INTO `hethi`.`dupload_log_history`
(`customer_id`,
`upload_id`,
`file_id`,
`micro_process_id`,
`status`,
`lastupuser`,
`lastupdtm`)
VALUES
(Cus_id,
uid,
file_id,
micro_process_id,
status_t,
user_id,
now());


select * from    `hethi`.`dupload_log`   WHERE `upload_id`=uid and`file_id`=file_id ;

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

-- Dump completed on 2016-03-04 18:04:19
