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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-02  5:31:25
