-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: l2_201945d_khilfi_project
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `serviceId` varchar(5) NOT NULL,
  `ticketId` varchar(5) NOT NULL,
  `vehicleId` varchar(45) NOT NULL,
  `operatorId` varchar(5) NOT NULL,
  `prices` decimal(4,2) NOT NULL,
  `departingTime` time NOT NULL,
  `departingDate` date NOT NULL,
  `destination` varchar(45) NOT NULL,
  PRIMARY KEY (`serviceId`,`ticketId`),
  KEY `ticketId` (`ticketId`),
  KEY `operatorId` (`operatorId`),
  KEY `vehicleId` (`vehicleId`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`ticketId`) REFERENCES `tickets` (`ticketId`),
  CONSTRAINT `services_ibfk_2` FOREIGN KEY (`operatorId`) REFERENCES `operator` (`operatorId`),
  CONSTRAINT `services_ibfk_3` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`vehicleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES ('S0001','T0001','V0001','O0001',5.50,'13:30:00','2022-02-19','Singapore'),('S0001','T0080','V0002','O0002',10.00,'13:30:00','2022-02-19','Malaysia'),('S0001','T0081','V0002','O0002',10.00,'13:30:00','2022-02-19','Malaysia'),('S0001','T0082','V0002','O0002',10.00,'13:30:00','2022-02-19','Malaysia'),('S0002','T0083','V0002','O0001',15.00,'14:00:00','2022-02-19','Johor'),('S0002','T0084','V0002','O0001',15.00,'14:00:00','2022-02-19','Johor'),('S0002','T0085','V0002','O0001',15.00,'14:00:00','2022-02-19','Johor');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-03 11:28:07
