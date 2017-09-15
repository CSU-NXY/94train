-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: 94train
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `SectionID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `TrainID` varchar(20) NOT NULL,
  `StartStation` varchar(20) NOT NULL,
  `EndStation` varchar(20) NOT NULL,
  `DepartureTime` time NOT NULL,
  `ArrivalTime` time NOT NULL,
  `Type` int(11) NOT NULL DEFAULT '0',
  `Price` double NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '0',
  `OrderDate` date NOT NULL,
  PRIMARY KEY (`SectionID`),
  UNIQUE KEY `ID_UNIQUE` (`SectionID`),
  KEY `UserID_idx` (`UserID`),
  KEY `TrainID_idx` (`TrainID`),
  CONSTRAINT `TrainID` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `SectionID` int(11) NOT NULL AUTO_INCREMENT,
  `TrainID` varchar(20) NOT NULL,
  `StationID` int(11) NOT NULL,
  `Index` int(11) NOT NULL,
  `Count` int(11) DEFAULT NULL,
  `ArrivalTime` datetime DEFAULT NULL,
  `DepartureTime` datetime DEFAULT NULL,
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`SectionID`),
  KEY `StationID_idx` (`StationID`),
  KEY `TrainID_idx` (`TrainID`),
  CONSTRAINT `StationID` FOREIGN KEY (`StationID`) REFERENCES `station` (`StationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TrianID` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'G2306',1,0,150,NULL,NULL,5),(2,'G2306',2,1,150,NULL,NULL,6),(3,'G2306',3,2,150,NULL,NULL,7),(4,'G2306',4,3,150,NULL,NULL,8),(5,'G2306',5,4,150,NULL,NULL,9),(6,'G2306',6,5,150,NULL,NULL,10),(7,'G2306',7,6,150,NULL,NULL,11),(8,'G2306',8,7,150,NULL,NULL,12),(9,'G2306',9,8,150,NULL,NULL,13),(10,'G2306',10,9,150,NULL,NULL,14),(11,'G2306',11,10,150,NULL,NULL,15),(12,'G2306',12,11,150,NULL,NULL,16),(13,'G2306',13,12,150,NULL,NULL,17);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `StationID` int(11) NOT NULL AUTO_INCREMENT,
  `StationName` varchar(45) NOT NULL,
  PRIMARY KEY (`StationID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'温州南'),(2,'丽水'),(3,'缙云西'),(4,'永康南'),(5,'金华南'),(6,'金华'),(7,'衢州'),(8,'上饶'),(9,'鹰潭北'),(10,'南昌西'),(11,'高安'),(12,'萍乡北'),(13,'长沙南');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train` (
  `TrainID` varchar(20) NOT NULL,
  `Seats` int(11) NOT NULL,
  `StationCount` int(11) NOT NULL,
  PRIMARY KEY (`TrainID`),
  UNIQUE KEY `TrainID_UNIQUE` (`TrainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES ('G2306',120,9);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `PhoneNum` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `ID` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`),
  UNIQUE KEY `UserName_UNIQUE` (`PhoneNum`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Xiang','Ezio1234',NULL,NULL,NULL),(2,'Xiang2','Ezio1234',NULL,NULL,NULL),(3,'Ezio','Ezio1234',NULL,NULL,NULL),(4,'18932449487','Ezio1234',NULL,NULL,NULL),(5,'18832449487','Ezio1234',NULL,NULL,NULL);
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

-- Dump completed on 2017-09-15  8:36:02
