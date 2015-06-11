-- MySQL dump 10.13  Distrib 5.6.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: outbreakresponsemanagement
-- ------------------------------------------------------
-- Server version	5.1.72-community

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
-- Table structure for table `admittance`
--

DROP TABLE IF EXISTS `admittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admittance` (
  `admittanceID` int(11) NOT NULL AUTO_INCREMENT,
  `patientFirstName` varchar(45) DEFAULT NULL,
  `patientLastName` varchar(45) DEFAULT NULL,
  `patientBirthdate` date DEFAULT NULL,
  `patientPhoneNumber` int(11) DEFAULT NULL,
  `patientCivilStatus` int(11) NOT NULL,
  `patientAge` int(11) DEFAULT NULL,
  `patientAddress` varchar(45) DEFAULT NULL,
  `patientBarangay` int(11) NOT NULL,
  `incidentLocation` varchar(45) DEFAULT NULL,
  `incidentBarangay` int(11) NOT NULL,
  `knownAllergies` varchar(45) DEFAULT NULL,
  `companionFirstName` varchar(45) DEFAULT NULL,
  `companionLastName` varchar(45) DEFAULT NULL,
  `companionAge` int(11) DEFAULT NULL,
  `companionBirthdate` date DEFAULT NULL,
  `companionPhoneNumber` int(11) NOT NULL,
  `companionRelationship` int(11) NOT NULL,
  `companionAddress` varchar(45) DEFAULT NULL,
  `companionBarangay` int(11) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  `dateFiled` date NOT NULL,
  PRIMARY KEY (`admittanceID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admittance`
--

LOCK TABLES `admittance` WRITE;
/*!40000 ALTER TABLE `admittance` DISABLE KEYS */;
INSERT INTO `admittance` VALUES (1,'123','123','2015-06-08',123,2,12,'123',1,'123',1,'123','123','123',12,'2015-06-08',123,1,'123',1,0,'2015-06-08');
/*!40000 ALTER TABLE `admittance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discharge`
--

DROP TABLE IF EXISTS `discharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discharge` (
  `dischargeID` int(11) NOT NULL AUTO_INCREMENT,
  `lastName` varchar(45) DEFAULT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `attendingPhysician` varchar(45) DEFAULT NULL,
  `roomNumber` int(11) DEFAULT NULL,
  `patientNumber` int(11) DEFAULT NULL,
  `dateOfAdmission` date DEFAULT NULL,
  `dateOfDischarge` date DEFAULT NULL,
  `provisionalDiagnosis` varchar(45) DEFAULT NULL,
  `finalDiagnosis` varchar(45) DEFAULT NULL,
  `briefHistory` varchar(45) DEFAULT NULL,
  `findings` varchar(45) DEFAULT NULL,
  `courseOfTreatment` varchar(45) DEFAULT NULL,
  `dischargeCondition` varchar(45) DEFAULT NULL,
  `rehabPotential` varchar(45) DEFAULT NULL,
  `followUp` varchar(45) DEFAULT NULL,
  `dateFiled` date DEFAULT NULL,
  `approvedBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dischargeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discharge`
--

LOCK TABLES `discharge` WRITE;
/*!40000 ALTER TABLE `discharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `discharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_barangay`
--

DROP TABLE IF EXISTS `ref_barangay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_barangay` (
  `barangayID` int(11) NOT NULL,
  `barangayName` varchar(45) DEFAULT NULL,
  `barangayContact` int(11) DEFAULT NULL,
  PRIMARY KEY (`barangayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_barangay`
--

LOCK TABLES `ref_barangay` WRITE;
/*!40000 ALTER TABLE `ref_barangay` DISABLE KEYS */;
INSERT INTO `ref_barangay` VALUES (0,'Barangay A',1223),(1,'Barangay B',123),(2,'Barangay C',123);
/*!40000 ALTER TABLE `ref_barangay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_civil_status`
--

DROP TABLE IF EXISTS `ref_civil_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_civil_status` (
  `civilStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `civilStatusName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`civilStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_civil_status`
--

LOCK TABLES `ref_civil_status` WRITE;
/*!40000 ALTER TABLE `ref_civil_status` DISABLE KEYS */;
INSERT INTO `ref_civil_status` VALUES (0,'Single'),(1,'Married'),(2,'Widowed'),(3,'Separated');
/*!40000 ALTER TABLE `ref_civil_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_hospital`
--

DROP TABLE IF EXISTS `ref_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_hospital` (
  `hospitalID` int(11) NOT NULL AUTO_INCREMENT,
  `hospitalName` varchar(45) DEFAULT NULL,
  `hospitalContact` int(11) DEFAULT NULL,
  PRIMARY KEY (`hospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_hospital`
--

LOCK TABLES `ref_hospital` WRITE;
/*!40000 ALTER TABLE `ref_hospital` DISABLE KEYS */;
INSERT INTO `ref_hospital` VALUES (0,'QMMC',6310899),(1,'Dummy Hospital A',6310931),(2,'Dummy Hospital B',6310907);
/*!40000 ALTER TABLE `ref_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_privilege`
--

DROP TABLE IF EXISTS `ref_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_privilege` (
  `privilegeID` int(11) NOT NULL AUTO_INCREMENT,
  `privilegeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`privilegeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_privilege`
--

LOCK TABLES `ref_privilege` WRITE;
/*!40000 ALTER TABLE `ref_privilege` DISABLE KEYS */;
INSERT INTO `ref_privilege` VALUES (0,'Super User');
/*!40000 ALTER TABLE `ref_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_relationship`
--

DROP TABLE IF EXISTS `ref_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_relationship` (
  `relationshipID` int(11) NOT NULL,
  `relationshipName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`relationshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_relationship`
--

LOCK TABLES `ref_relationship` WRITE;
/*!40000 ALTER TABLE `ref_relationship` DISABLE KEYS */;
INSERT INTO `ref_relationship` VALUES (0,'Mother'),(1,'Father'),(2,'Grandfather'),(4,'Grandmother'),(5,'Guardian');
/*!40000 ALTER TABLE `ref_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `supplyID` int(11) NOT NULL AUTO_INCREMENT,
  `supplyName` varchar(45) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `hospitalID` varchar(45) NOT NULL,
  PRIMARY KEY (`supplyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply_transfer`
--

DROP TABLE IF EXISTS `supply_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supply_transfer` (
  `supplyTransferID` int(11) NOT NULL AUTO_INCREMENT,
  `supplyID` int(11) NOT NULL,
  `toHospital` int(11) NOT NULL,
  `fromHospital` int(11) NOT NULL,
  `amountNeeded` int(11) DEFAULT NULL,
  PRIMARY KEY (`supplyTransferID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply_transfer`
--

LOCK TABLES `supply_transfer` WRITE;
/*!40000 ALTER TABLE `supply_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `supply_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(31) DEFAULT NULL,
  `password` varchar(31) DEFAULT NULL,
  `contactNumber` int(11) DEFAULT NULL,
  `privilegeID` int(11) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'SuperUser','81dc9bdb52d04dc2036dbd8313ed055',9260751,0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-09 23:06:56
