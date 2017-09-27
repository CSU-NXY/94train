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
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (85,'G234',1,0,120,NULL,'12:00:00',20),(86,'G234',13,1,120,'13:00:00',NULL,20),(91,'S2',1,0,120,NULL,'01:00:00',20),(92,'S2',13,1,120,'02:00:00',NULL,20),(93,'S3',1,0,120,NULL,'01:00:00',20),(94,'S3',13,1,120,'02:00:00',NULL,20),(137,'S4',1,0,120,NULL,'01:00:00',20),(138,'S4',13,1,0,'02:00:00',NULL,0),(139,'S1',1,0,120,NULL,'01:00:00',50),(140,'S1',13,1,0,'02:00:00',NULL,0),(145,'S7',1,0,150,NULL,'12:00:00',20),(146,'S7',13,1,0,'17:00:00',NULL,0),(147,'G501',22,0,150,NULL,'00:00:00',20),(148,'G501',23,1,150,'00:55:00','01:00:00',20),(149,'G501',24,2,150,'01:55:00','02:00:00',20),(150,'G501',25,3,150,'02:55:00','03:00:00',20),(151,'G501',26,4,150,'03:55:00','04:00:00',20),(152,'G501',27,5,150,'04:55:00','05:00:00',20),(153,'G501',28,6,150,'05:55:00','06:00:00',20),(154,'G501',29,7,150,'06:55:00','07:00:00',20),(155,'G501',30,8,150,'07:55:00','08:00:00',20),(156,'G501',31,9,150,'08:55:00','09:00:00',20),(157,'G501',32,10,150,'09:55:00','10:00:00',20),(158,'G501',33,11,150,'10:55:00','11:00:00',20),(159,'G501',34,12,150,'11:55:00','12:00:00',20),(160,'G501',13,13,0,'12:55:00',NULL,0),(161,'G123',43,0,120,NULL,'11:05:00',54.5),(162,'G123',44,1,120,'11:39:00','11:41:00',89),(163,'G123',45,2,120,'12:25:00','12:27:00',40),(164,'G123',46,3,120,'12:51:00','12:53:00',20),(165,'G123',47,4,120,'13:43:00','13:45:00',35),(166,'G123',48,5,120,'14:59:00','15:01:00',28),(167,'G123',49,6,120,'15:19:00','15:21:00',80),(168,'G123',50,7,120,'15:53:00','15:55:00',99),(169,'G123',51,8,120,'16:17:00','16:19:00',124),(170,'G123',52,9,120,'16:30:00','15:55:00',95),(171,'G123',53,10,0,'16:50:00',NULL,0),(172,'G233',54,0,120,NULL,'16:22:00',42),(173,'G233',55,1,120,'17:08:00','17:09:00',32),(174,'G233',56,2,0,'17:36:00','17:37:00',89),(175,'G233',57,3,120,'18:13:00','18:14:00',23.5),(176,'G233',58,4,120,'18:39:00','18:40:00',75),(177,'G233',59,5,120,'19:06:00','19:08:00',20.5),(178,'G233',60,6,120,'19:46:00','19:49:00',68),(179,'G233',61,7,120,'20:25:00','20:27:00',12),(180,'G233',48,8,120,'21:28:00','21:30:00',32),(181,'G233',49,9,120,'21:49:00','21:50:00',67.5),(182,'G233',62,10,120,'22:34:00','22:36:00',21),(183,'G233',51,11,120,'22:46:00','22:48:00',20),(184,'G233',53,12,0,'23:12:00',NULL,0),(185,'G2312',1,0,120,NULL,'07:19:00',15),(186,'G2312',63,1,120,'07:38:00','07:40:00',18.5),(187,'G2312',2,2,120,'07:59:00','08:01:00',26.5),(188,'G2312',64,3,120,'08:28:00','08:30:00',7.5),(189,'G2312',5,4,120,'08:41:00','08:43:00',9),(190,'G2312',6,5,120,'08:55:00','08:57:00',33),(191,'G2312',7,6,120,'09:18:00','09:24:00',74),(192,'G2312',65,7,120,'10:05:00','10:07:00',38.5),(193,'G2312',66,8,120,'10:30:00','10:39:00',45),(194,'G2312',10,9,120,'11:05:00','11:11:00',76.5),(195,'G2312',67,10,120,'11:53:00','11:55:00',20),(196,'G2312',12,11,120,'12:13:00','12:15:00',30),(197,'G2312',13,12,0,'12:47:00',NULL,0),(198,'K123',68,0,120,NULL,'13:40:00',9),(199,'K123',69,1,120,'13:59:00','14:02:00',3.5),(200,'K123',70,2,120,'14:00:00','14:43:00',4),(201,'K123',71,3,120,'15:05:00','15:08:00',8),(202,'K123',72,4,129,'15:54:00','16:00:00',22),(203,'K123',73,5,129,'17:21:00','17:24:00',18),(204,'K123',7,6,129,'19:15:00','19:18:00',13.5),(205,'K123',8,7,129,'20:50:00','20:55:00',15),(206,'K123',74,8,129,'22:04:00','22:11:00',12),(207,'G2306',1,0,150,NULL,'08:10:00',33.5),(208,'G2306',2,1,150,'08:44:00','08:46:00',10.5),(209,'G2306',3,2,150,'08:59:00','09:01:00',8),(210,'G2306',4,3,150,'09:12:00','09:15:00',16),(211,'G2306',5,4,150,'01:05:00','01:20:00',9),(212,'G2306',6,5,150,'09:48:00','09:50:00',33),(213,'G2306',7,6,150,'10:12:00','10:14:00',45.5),(214,'G2306',8,7,150,'10:40:00','10:42:00',45.5),(215,'G2306',9,8,150,'11:08:00','11:10:00',64.5),(216,'G2306',10,9,150,'11:45:00','11:49:00',64.5),(217,'G2306',11,10,150,'12:05:00','12:07:00',42),(218,'G2306',12,11,150,'12:51:00','12:54:00',43.5),(219,'G2306',13,12,150,'13:26:00','13:31:00',32),(220,'G2306',14,13,150,'13:54:00','13:56:00',16),(221,'G2306',15,14,150,'14:13:00','14:19:00',23),(222,'G2306',16,15,150,'14:55:00','14:57:00',22.5),(223,'G2306',17,16,150,'15:18:00','15:22:00',32),(224,'G2306',18,17,150,'15:46:00','15:48:00',20),(225,'G2306',19,18,150,'16:08:00','16:08:00',21),(226,'G2306',20,19,150,'16:53:00','16:55:00',25),(227,'G2306',21,20,0,'17:15:00',NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (19,'三穗站'),(68,'上海南'),(53,'上海虹桥'),(8,'上饶'),(2,'丽水'),(73,'义乌'),(24,'保定东'),(31,'信阳东'),(43,'北京南'),(22,'北京西'),(49,'南京南'),(10,'南昌西'),(33,'咸宁北'),(70,'嘉兴'),(36,'天'),(44,'天津南'),(15,'娄底南'),(28,'安阳东'),(67,'宜春'),(50,'常州北'),(65,'弋阳'),(61,'徐州东'),(45,'德州东'),(17,'怀化南站'),(66,'抚州东'),(18,'新晃西站'),(62,'无锡东'),(52,'昆山南'),(60,'曲阜东'),(72,'杭州东'),(69,'松江'),(47,'枣庄'),(64,'武义北'),(32,'武汉'),(4,'永康南'),(34,'汨罗东站'),(59,'济南'),(46,'济南西'),(71,'海宁'),(57,'淄博'),(41,'温州北'),(1,'温州南'),(16,'溆浦南'),(48,'滁州'),(56,'潍坊'),(25,'石家庄'),(58,'章丘'),(3,'缙云西'),(51,'苏州北'),(12,'萍乡北'),(7,'衢州'),(20,'贵定北站'),(21,'贵阳北站'),(26,'邢台东'),(27,'邯郸东'),(29,'郑州东'),(6,'金华'),(5,'金华南'),(13,'长沙南'),(37,'长沙南1'),(54,'青岛'),(63,'青田'),(14,'韶山南'),(30,'驻马店西'),(11,'高安'),(55,'高密'),(23,'高碑店东'),(74,'鹰潭'),(9,'鹰潭北');
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
INSERT INTO `train` VALUES ('G123',120,11),('G2306',150,21),('G2312',120,13),('G233',120,13),('G234',120,2),('G501',120,14),('K123',129,9),('S1',120,2),('S2',120,2),('S3',120,2),('S4',120,2),('S7',150,2);
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
INSERT INTO `user` VALUES (1,'110','admin','admin','1','admin2@qq.com'),(2,'113','admin','admin3','3','admin3@qq.com'),(3,'111','admin','admin1','2','admin1@qq.com'),(4,'18932449487','Ezio1234','项港华','123456789','1094708529@qq.com'),(5,'112321','admin','admin4','4','admin4@qq.com');
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

-- Dump completed on 2017-09-25 21:23:59
