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
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`OrderID`),
  UNIQUE KEY `ID_UNIQUE` (`OrderID`),
  KEY `UserID_idx` (`UserID`),
  KEY `TrainID_idx` (`TrainID`),
  CONSTRAINT `TrainID` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3,3,'G2306','金华','长沙南','01:40:00','03:45:00',0,91,0,'2017-09-18');
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
  `ArrivalTime` time DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`SectionID`),
  KEY `StationID_idx` (`StationID`),
  KEY `TrainID_idx` (`TrainID`),
  CONSTRAINT `StationID` FOREIGN KEY (`StationID`) REFERENCES `station` (`StationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TrianID` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'G2306',1,0,150,NULL,'00:00:00',5),(2,'G2306',2,1,150,'00:15:00','00:20:00',6),(3,'G2306',3,2,150,'00:35:00','00:40:00',7),(4,'G2306',4,3,150,'00:45:00','01:00:00',8),(5,'G2306',5,4,150,'01:05:00','01:20:00',9),(6,'G2306',6,5,150,'01:25:00','01:40:00',10),(7,'G2306',7,6,150,'01:45:00','02:00:00',11),(8,'G2306',8,7,150,'02:05:00','02:20:00',12),(9,'G2306',9,8,150,'02:25:00','02:40:00',13),(10,'G2306',10,9,150,'02:45:00','03:00:00',14),(11,'G2306',11,10,150,'03:25:00','03:20:00',15),(12,'G2306',12,11,150,'03:25:00','03:40:00',16),(13,'G2306',13,12,150,'03:45:00','03:00:00',17),(14,'G2306',14,13,150,'03:15:00','04:00:00',16),(15,'G2306',15,14,150,'04:05:00','04:30:00',15),(16,'G2306',16,15,150,'04:50:00','05:00:00',20),(17,'G2306',17,16,150,'05:50:00','06:00:00',20),(18,'G2306',18,17,150,'06:50:00','07:00:00',20),(19,'G2306',19,18,150,'07:50:00','08:00:00',20),(20,'G2306',20,19,150,'08:50:00','09:00:00',20),(21,'G2306',21,20,150,'09:50:00','10:00:00',20),(66,'G501',22,0,150,NULL,'00:00:00',20),(67,'G501',23,1,150,'00:55:00','01:00:00',20),(68,'G501',24,2,150,'01:55:00','02:00:00',20),(69,'G501',25,3,150,'02:55:00','03:00:00',20),(70,'G501',26,4,150,'03:55:00','04:00:00',20),(71,'G501',27,5,150,'04:55:00','05:00:00',20),(72,'G501',28,6,150,'05:55:00','06:00:00',20),(73,'G501',29,7,150,'06:55:00','07:00:00',20),(74,'G501',30,8,150,'07:55:00','08:00:00',20),(75,'G501',31,9,150,'08:55:00','09:00:00',20),(76,'G501',32,10,150,'09:55:00','10:00:00',20),(77,'G501',33,11,150,'10:55:00','11:00:00',20),(78,'G501',34,12,150,'11:55:00','12:00:00',20),(79,'G501',13,13,150,'12:55:00',NULL,20);
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
  PRIMARY KEY (`StationID`),
  UNIQUE KEY `StationName_UNIQUE` (`StationName`),
  UNIQUE KEY `StationID_UNIQUE` (`StationID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (19,'三穗站'),(8,'上饶'),(2,'丽水'),(24,'保定东'),(31,'信阳东'),(22,'北京西'),(10,'南昌西'),(33,'咸宁北'),(36,'天'),(15,'娄底南'),(28,'安阳东'),(17,'怀化南站'),(18,'新晃西站'),(32,'武汉'),(4,'永康南'),(34,'汨罗东站'),(1,'温州南'),(16,'溆浦南'),(25,'石家庄'),(3,'缙云西'),(12,'萍乡北'),(7,'衢州'),(20,'贵定北站'),(21,'贵阳北站'),(26,'邢台东'),(27,'邯郸东'),(29,'郑州东'),(6,'金华'),(5,'金华南'),(13,'长沙南'),(37,'长沙南1'),(14,'韶山南'),(30,'驻马店西'),(11,'高安'),(23,'高碑店东'),(9,'鹰潭北');
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
INSERT INTO `train` VALUES ('G2306',120,21),('G501',120,14);
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
INSERT INTO `user` VALUES (1,'110','admin','admin2','2','admin2@qq.com'),(2,'113','admin','admin3','3','admin3@qq.com'),(3,'111','admin','admin1','2','admin1@qq.com'),(4,'18932449487','Ezio1234','项港华','123456789','1094708529@qq.com'),(5,'112321','admin','admin4','4','admin4@qq.com');
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

-- Dump completed on 2017-09-24  9:21:09
