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
  `patientPhoneNumber` bigint(15) DEFAULT NULL,
  `patientCivilStatus` int(11) NOT NULL,
  `patientAge` int(11) DEFAULT NULL,
  `patientAddress` varchar(100) DEFAULT NULL,
  `patientBarangay` int(11) NOT NULL,
  `incidentLocation` varchar(45) DEFAULT NULL,
  `incidentBarangay` int(11) NOT NULL,
  `knownAllergies` varchar(45) DEFAULT NULL,
  `companionFirstName` varchar(45) DEFAULT NULL,
  `companionLastName` varchar(45) DEFAULT NULL,
  `companionAge` int(11) DEFAULT NULL,
  `companionBirthdate` date DEFAULT NULL,
  `companionPhoneNumber` bigint(15) NOT NULL,
  `companionRelationship` int(11) NOT NULL,
  `companionAddress` varchar(100) DEFAULT NULL,
  `companionBarangay` int(11) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  `dateFiled` date NOT NULL,
  PRIMARY KEY (`admittanceID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admittance`
--

LOCK TABLES `admittance` WRITE;
/*!40000 ALTER TABLE `admittance` DISABLE KEYS */;
INSERT INTO `admittance` VALUES (1,'Peter','Parker','2015-06-08',9156310899,2,12,'123 Sesame Street',1,'123',1,'You','Nicholas','Fury',12,'2015-06-08',123,1,'123',1,0,'2015-06-08'),(2,'John','Payne','2015-06-08',9156310899,2,12,'619 Sa Puso Mo',2,'123',1,'You','Nicholas','Fury',12,'2015-06-08',123,1,'123',1,0,'2015-06-08'),(3,'Natasha','Romanov','2015-06-08',9156310899,2,12,'143 Swag University',1,'123',1,'You','Nicholas','Fury',12,'2015-06-08',123,1,'123',1,0,'2015-06-08'),(4,'Tony','Stark','2015-07-01',123,0,22,'221122',0,'123',0,'You','Pepper','Potts',12,'2015-07-01',123,0,'123',0,0,'2015-07-01');
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
-- Table structure for table `history_procedure`
--

DROP TABLE IF EXISTS `history_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_procedure` (
  `procedureID` int(11) NOT NULL AUTO_INCREMENT,
  `dateTaken` date DEFAULT NULL,
  `patientID` int(11) NOT NULL,
  `hemocrit` tinyint(1) DEFAULT NULL,
  `differential` tinyint(1) DEFAULT NULL,
  `rbcdw` tinyint(1) DEFAULT NULL,
  `hemoglobin` tinyint(1) DEFAULT NULL,
  `platelet` tinyint(1) DEFAULT NULL,
  `wbc` tinyint(1) DEFAULT NULL,
  `chloride` tinyint(1) DEFAULT NULL,
  `urea` tinyint(1) DEFAULT NULL,
  `mcv` tinyint(1) DEFAULT NULL,
  `packed` tinyint(1) DEFAULT NULL,
  `sodium` tinyint(1) DEFAULT NULL,
  `potassium` tinyint(1) DEFAULT NULL,
  `bicarbonate` tinyint(1) DEFAULT NULL,
  `creatinine` tinyint(1) DEFAULT NULL,
  `esr` tinyint(1) DEFAULT NULL,
  `ast` tinyint(1) DEFAULT NULL,
  `alt` tinyint(1) DEFAULT NULL,
  `tourniquet` tinyint(1) DEFAULT NULL,
  `cbc` tinyint(1) DEFAULT NULL,
  `mchb` tinyint(1) DEFAULT NULL,
  `rbc` tinyint(1) DEFAULT NULL,
  `creatine` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`procedureID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_procedure`
--

LOCK TABLES `history_procedure` WRITE;
/*!40000 ALTER TABLE `history_procedure` DISABLE KEYS */;
INSERT INTO `history_procedure` VALUES (1,NULL,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,NULL,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,NULL,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(4,NULL,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,NULL,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,NULL,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(7,NULL,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `history_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_symptom`
--

DROP TABLE IF EXISTS `history_symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_symptom` (
  `symptomID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) NOT NULL,
  `abdominalPain` tinyint(1) DEFAULT NULL,
  `pleuralEffusion` tinyint(1) DEFAULT NULL,
  `ascites` tinyint(1) DEFAULT NULL,
  `hypotension` tinyint(1) DEFAULT NULL,
  `jaundice` varchar(45) DEFAULT NULL,
  `liver` float DEFAULT NULL,
  `spleen` float DEFAULT NULL,
  `dateTaken` date DEFAULT NULL,
  PRIMARY KEY (`symptomID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_symptom`
--

LOCK TABLES `history_symptom` WRITE;
/*!40000 ALTER TABLE `history_symptom` DISABLE KEYS */;
INSERT INTO `history_symptom` VALUES (1,4,0,0,0,0,NULL,0,0,NULL),(2,4,0,0,0,0,NULL,0,0,NULL),(3,2,0,0,0,0,NULL,0,0,NULL),(4,2,0,0,0,0,NULL,0,0,NULL),(5,2,0,0,0,0,NULL,0,0,NULL),(6,2,0,0,0,0,NULL,0,0,NULL),(7,4,0,0,0,0,NULL,0,0,NULL),(8,4,0,0,0,0,NULL,0,0,NULL);
/*!40000 ALTER TABLE `history_symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_vitals`
--

DROP TABLE IF EXISTS `history_vitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_vitals` (
  `vitalsID` int(11) NOT NULL AUTO_INCREMENT,
  `dateTaken` date DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `bloodPressure` varchar(45) DEFAULT NULL,
  `lastDextrose` date DEFAULT NULL,
  `patientID` int(11) NOT NULL,
  PRIMARY KEY (`vitalsID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_vitals`
--

LOCK TABLES `history_vitals` WRITE;
/*!40000 ALTER TABLE `history_vitals` DISABLE KEYS */;
INSERT INTO `history_vitals` VALUES (1,'2015-07-01',21,'123','2015-07-01',3),(2,'2015-07-01',21,'123','2015-07-02',3),(3,'2015-07-01',21,'123','2015-07-04',3),(4,NULL,0,NULL,NULL,4),(5,'2015-07-01',23,'56/76','2015-07-01',4),(6,'2015-07-01',32,'34/76','2015-07-02',4),(7,'2015-07-01',23,'231','2015-07-02',4);
/*!40000 ALTER TABLE `history_vitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `patientDiagnosis` int(11) DEFAULT NULL,
  `patientWard` int(11) DEFAULT NULL,
  `dateDischarged` date DEFAULT NULL,
  `dateTaken` date DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `bloodPressure` varchar(45) DEFAULT NULL,
  `lastDextrose` date DEFAULT NULL,
  `abdominalPain` tinyint(1) DEFAULT NULL,
  `pleuralEffusion` tinyint(1) DEFAULT NULL,
  `ascites` tinyint(1) DEFAULT NULL,
  `hypotension` tinyint(1) DEFAULT NULL,
  `jaundice` varchar(45) DEFAULT NULL,
  `liver` float DEFAULT NULL,
  `spleen` float DEFAULT NULL,
  `staffID` int(11) NOT NULL,
  `dateTaken2` date DEFAULT NULL,
  `dateTaken3` date DEFAULT NULL,
  `hemocrit` tinyint(1) DEFAULT NULL,
  `differential` tinyint(1) DEFAULT NULL,
  `rbcdw` tinyint(1) DEFAULT NULL,
  `hemoglobin` tinyint(1) DEFAULT NULL,
  `platelet` tinyint(1) DEFAULT NULL,
  `wbc` tinyint(1) DEFAULT NULL,
  `chloride` tinyint(1) DEFAULT NULL,
  `urea` tinyint(1) DEFAULT NULL,
  `mcv` tinyint(1) DEFAULT NULL,
  `packed` tinyint(1) DEFAULT NULL,
  `sodium` tinyint(1) DEFAULT NULL,
  `potassium` tinyint(1) DEFAULT NULL,
  `bicarbonate` tinyint(1) DEFAULT NULL,
  `creatinine` tinyint(1) DEFAULT NULL,
  `esr` tinyint(1) DEFAULT NULL,
  `ast` tinyint(1) DEFAULT NULL,
  `alt` tinyint(1) DEFAULT NULL,
  `tourniquet` tinyint(1) DEFAULT NULL,
  `cbc` tinyint(1) DEFAULT NULL,
  `mchb` tinyint(1) DEFAULT NULL,
  `rbc` tinyint(1) DEFAULT NULL,
  `creatine` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,1,1,'2015-06-30','2015-07-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,1),(2,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,2,2,NULL,'2015-07-01',21,'123','2015-07-04',1,1,1,1,'123',123,123,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,1,NULL,'2015-07-01',12,'123','2015-07-02',1,1,1,1,'12',12,12,3,'2015-07-01','2015-07-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
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
  `barangayContact` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`barangayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_barangay`
--

LOCK TABLES `ref_barangay` WRITE;
/*!40000 ALTER TABLE `ref_barangay` DISABLE KEYS */;
INSERT INTO `ref_barangay` VALUES (0,'Escopa I',639156781256),(1,'Escopa II',29828901),(2,'Escopa III',27895671),(3,'Escopa IV',NULL),(4,'Project IV-Marilag',NULL),(5,'Blue Ridge A',NULL),(6,'Blue Ridge B',NULL),(7,'Masagana',NULL),(8,'Milagrosa Quirino 2-A',NULL),(9,'Quirino 2-B',NULL),(10,'Quirino 2-C',NULL),(11,'Quirino 3-A',NULL),(12,'Quirino 3-B',NULL),(13,'San Roque',NULL),(14,'Libis',NULL),(15,'Amihan',NULL),(16,'Bayanihan',NULL),(17,'Others',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_civil_status`
--

LOCK TABLES `ref_civil_status` WRITE;
/*!40000 ALTER TABLE `ref_civil_status` DISABLE KEYS */;
INSERT INTO `ref_civil_status` VALUES (0,'Single'),(1,'Married'),(2,'Widowed'),(3,'Separated'),(4,'Other');
/*!40000 ALTER TABLE `ref_civil_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_diagnosis`
--

DROP TABLE IF EXISTS `ref_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_diagnosis` (
  `diagnosisID` int(11) NOT NULL,
  `diagnosisName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`diagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_diagnosis`
--

LOCK TABLES `ref_diagnosis` WRITE;
/*!40000 ALTER TABLE `ref_diagnosis` DISABLE KEYS */;
INSERT INTO `ref_diagnosis` VALUES (0,'Leptospirosis'),(1,'Dengue A'),(2,'Dengue B'),(3,'Dengue C');
/*!40000 ALTER TABLE `ref_diagnosis` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_hospital`
--

LOCK TABLES `ref_hospital` WRITE;
/*!40000 ALTER TABLE `ref_hospital` DISABLE KEYS */;
INSERT INTO `ref_hospital` VALUES (0,'QMMC',0),(1,'East Avenue Medical Center',4264405),(2,'National Children\'s Hospital',7254533),(3,'Philippine Children\'s Hospital',9240836);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_privilege`
--

LOCK TABLES `ref_privilege` WRITE;
/*!40000 ALTER TABLE `ref_privilege` DISABLE KEYS */;
INSERT INTO `ref_privilege` VALUES (0,'Super User'),(1,'IT'),(2,'Head Nurse'),(3,'Nurse Pedia'),(4,'Patient'),(5,'Pharmacy'),(6,'Staff');
/*!40000 ALTER TABLE `ref_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_protocol`
--

DROP TABLE IF EXISTS `ref_protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_protocol` (
  `protocolID` int(11) NOT NULL AUTO_INCREMENT,
  `protocolName` varchar(500) DEFAULT NULL,
  `protocolColor` int(11) NOT NULL,
  `dcondition` int(11) DEFAULT NULL,
  PRIMARY KEY (`protocolID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_protocol`
--

LOCK TABLES `ref_protocol` WRITE;
/*!40000 ALTER TABLE `ref_protocol` DISABLE KEYS */;
INSERT INTO `ref_protocol` VALUES (1,'Locate established hotspots. Clean stagnant water areas. Alert nearby residents.',0,0),(2,'Locate established hotspots. Clean stagnant water areas. Alert nearby residents. Prepare stations for transfering possible patients. Distribute sanitized mosquito nets. Distribute mosquito repellants.',1,0),(3,'7-day course of antibiotic tablets. Penicillin or a tetracycline antibiotic called doxycycline are the preferred choices. Paracetamol and ibuprofen to relieve symptoms.',0,1),(4,'Hospitalize with antibiotics injected directly into the bloodstream. Organ problems will be treated as lungs, kidneys and intravenous fluids are restored into the body (dextrose): ventilator to assist breathing, dialysis to artificially replicate the functions of the kidneys by removing waste materials, intravenous fluids to restore fluids and nutrients into the body.',1,1);
/*!40000 ALTER TABLE `ref_protocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_protocol_color`
--

DROP TABLE IF EXISTS `ref_protocol_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_protocol_color` (
  `colorID` int(11) NOT NULL,
  `colorName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_protocol_color`
--

LOCK TABLES `ref_protocol_color` WRITE;
/*!40000 ALTER TABLE `ref_protocol_color` DISABLE KEYS */;
INSERT INTO `ref_protocol_color` VALUES (0,'Yellow'),(1,'Orange'),(2,'Red');
/*!40000 ALTER TABLE `ref_protocol_color` ENABLE KEYS */;
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
INSERT INTO `ref_relationship` VALUES (0,'Mother'),(1,'Father'),(2,'Grandfather'),(4,'Grandmother'),(5,'Guardian'),(6,'Others');
/*!40000 ALTER TABLE `ref_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_shiftstatus`
--

DROP TABLE IF EXISTS `ref_shiftstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_shiftstatus` (
  `shiftID` int(11) NOT NULL,
  `shiftName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shiftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_shiftstatus`
--

LOCK TABLES `ref_shiftstatus` WRITE;
/*!40000 ALTER TABLE `ref_shiftstatus` DISABLE KEYS */;
INSERT INTO `ref_shiftstatus` VALUES (0,'Regular'),(1,'Overtime'),(2,'Shifted');
/*!40000 ALTER TABLE `ref_shiftstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_ward`
--

DROP TABLE IF EXISTS `ref_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_ward` (
  `wardID` int(11) NOT NULL,
  `wardName` varchar(45) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`wardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_ward`
--

LOCK TABLES `ref_ward` WRITE;
/*!40000 ALTER TABLE `ref_ward` DISABLE KEYS */;
INSERT INTO `ref_ward` VALUES (0,'Pediatric',100),(1,'Medicine',20),(2,'ER',50);
/*!40000 ALTER TABLE `ref_ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `staffFirstName` varchar(45) DEFAULT NULL,
  `staffLastName` varchar(45) DEFAULT NULL,
  `daysAssigned` varchar(45) DEFAULT NULL,
  `timeAssigned` varchar(45) DEFAULT NULL,
  `shiftStatus` int(11) NOT NULL,
  `assignedWard` int(11) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Nurse','Supreme','MTWTHFSaSu','0800-2300',0,1,1),(2,'Nurse','Almost Supreme','TTH','0900-1800',0,0,1),(3,'Nurse','Slightly Supreme','MTHFSaSu','0800-2300',0,1,0);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_schedule`
--

DROP TABLE IF EXISTS `staff_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_schedule` (
  `assignedWard` int(11) NOT NULL,
  `daysAssigned` varchar(45) DEFAULT NULL,
  `timeAssigned` varchar(45) DEFAULT NULL,
  `shiftStatus` int(11) NOT NULL,
  `staffID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_schedule`
--

LOCK TABLES `staff_schedule` WRITE;
/*!40000 ALTER TABLE `staff_schedule` DISABLE KEYS */;
INSERT INTO `staff_schedule` VALUES (1,'Monday-Thursday','0900-1700',0,1),(1,'Monday-Thursday','1700-0200',0,2),(0,'Friday','0100-0900',0,1);
/*!40000 ALTER TABLE `staff_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `patientDiagnosis` int(11) DEFAULT NULL,
  `patientWard` int(11) DEFAULT NULL,
  `tourniquet` tinyint(1) DEFAULT NULL,
  `platelets` tinyint(1) DEFAULT NULL,
  `cbc` tinyint(1) DEFAULT NULL,
  `ast` tinyint(1) DEFAULT NULL,
  `wbc` tinyint(1) DEFAULT NULL,
  `alt` tinyint(1) DEFAULT NULL,
  `hemocrit` tinyint(1) DEFAULT NULL,
  `hemoglobin` tinyint(1) DEFAULT NULL,
  `dateDischarged` date DEFAULT NULL,
  `dateTaken` date DEFAULT NULL,
  `temperature` float DEFAULT NULL,
  `bloodPressure` varchar(45) DEFAULT NULL,
  `lastDextrose` date DEFAULT NULL,
  `abdominalPain` tinyint(1) DEFAULT NULL,
  `pleuralEffusion` tinyint(1) DEFAULT NULL,
  `ascites` tinyint(1) DEFAULT NULL,
  `hypotension` tinyint(1) DEFAULT NULL,
  `jaundice` varchar(45) DEFAULT NULL,
  `liver` float DEFAULT NULL,
  `spleen` float DEFAULT NULL,
  `staffID` int(11) NOT NULL,
  `dateTaken2` date DEFAULT NULL,
  `dateTaken3` date DEFAULT NULL,
  PRIMARY KEY (`patientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
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
  `capacity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`supplyID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'Supply B',56,'1','100'),(2,'Supply C',24,'1','100'),(3,'Supply A',4,'1','100');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'SuperUser','81dc9bdb52d04dc2036dbd8313ed055',9260751,0,0),(2,'Nurse','81dc9bdb52d04dc2036dbd8313ed055',12345667,3,0);
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

-- Dump completed on 2015-07-02  6:00:15
