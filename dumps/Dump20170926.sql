-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: corepetstore
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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20170326074600_CorePetStore','1.1.1');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `level` int(2) NOT NULL DEFAULT '1',
  `phone` varchar(45) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Ezio@qq.com','12345678',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'1094708529@qq.com','Ezio1234','Ezio','X',1,'123456789','Address1','Address2','WZ','ZJ','123456','CHINA'),(7,'23213@qq.com','Ezio1234',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `itemid` varchar(255) NOT NULL,
  `productid` varchar(255) NOT NULL,
  `listprice` float NOT NULL,
  `unitcost` float NOT NULL,
  `supplier` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `attr1` varchar(255) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('EST-1','FI-SW-01',16.5,10,1,'P','Large'),('EST-10','K9-DL-01',18.5,12,1,'P','Spotted Adult Female'),('EST-11','RP-SN-01',18.5,12,1,'P','Venomless'),('EST-12','RP-SN-01',18.5,12,1,'P','Rattleless'),('EST-13','RP-LI-02',18.5,12,1,'P','Green Adult'),('EST-14','FL-DSH-01',58.5,12,1,'P','Tailless'),('EST-15','FL-DSH-01',23.5,12,1,'P','With tail'),('EST-16','FL-DLH-02',93.5,12,1,'P','Adult Female'),('EST-17','FL-DLH-02',93.5,12,1,'P','Adult Male'),('EST-18','AV-CB-01',193.5,92,1,'P','Adult Male'),('EST-19','AV-SB-02',15.5,2,1,'P','Adult Male'),('EST-2','FI-SW-01',16.5,10,1,'P','Small'),('EST-20','FI-FW-02',5.5,2,1,'P','Adult Male'),('EST-21','FI-FW-02',5.29,1,1,'P','Adult Female'),('EST-22','K9-RT-02',135.5,100,1,'P','Adult Male'),('EST-23','K9-RT-02',145.49,100,1,'P','Adult Female'),('EST-24','K9-RT-02',255.5,92,1,'P','Adult Male'),('EST-25','K9-RT-02',325.29,90,1,'P','Adult Female'),('EST-26','K9-CW-01',125.5,92,1,'P','Adult Male'),('EST-27','K9-CW-01',155.29,90,1,'P','Adult Female'),('EST-28','K9-RT-01',155.29,90,1,'P','Adult Female'),('EST-3','FI-SW-02',18.5,12,1,'P','Toothless'),('EST-4','FI-FW-01',18.5,12,1,'P','Spotted'),('EST-5','FI-FW-01',18.5,12,1,'P','Spotless'),('EST-6','K9-BD-01',18.5,12,1,'P','Male Adult'),('EST-7','K9-BD-01',18.5,12,1,'P','Female Puppy'),('EST-8','K9-PO-02',18.5,12,1,'P','Male Puppy'),('EST-9','K9-DL-01',18.5,12,1,'P','Spotless Male Puppy');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productid` varchar(255) NOT NULL,
  `Catagory` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  `picture` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('AV-CB-01','BIRDS','Amazon Parrot','Great companion for up to 75 years','/images/animals/bird2.gif'),('AV-SB-02','BIRDS','Finch','Great stress reliever','/images/animals/bird1.gif'),('FI-FW-01','FISH','Koi','Fresh Water fish from Japan','/images/animals/fish3.gif'),('FI-FW-02','FISH','Goldfish','Fresh Water fish from China','/images/animals/fish2.gif'),('FI-SW-01','FISH','Angelfish','Salt Water fish from Australia','/images/animals/fish1.gif'),('FI-SW-02','FISH','Tiger Shark','Salt Water fish from Australia','/images/animals/fish4.gif'),('FL-DLH-02','CATS','Persian','Friendly house cat, doubles as a princess','/images/animals/cat1.gif'),('FL-DSH-01','CATS','Manx','Great for reducing mouse populations','/images/animals/cat2.gif'),('K9-BD-01','DOGS','Bulldog','Friendly dog from England','/images/animals/dog2.gif'),('K9-CW-01','DOGS','Chihuahua','Great companion dog','/images/animals/dog4.gif'),('K9-DL-01','DOGS','Dalmation','Great dog for a Fire Station','/images/animals/dog5.gif'),('K9-PO-02','DOGS','Poodle','Cute dog from France','/images/animals/dog6.gif'),('K9-RT-01','DOGS','Golden Retriever','Great family dog','/images/animals/dog1.gif'),('K9-RT-02','DOGS','Labrador Retriever','Great hunting dog','/images/animals/dog5.gif'),('RP-LI-02','REPTILES','Iguana','Friendly green friend','/images/animals/lizard1.gif'),('RP-SN-01','REPTILES','Rattlesnake','Doubles as a watch dog','/images/animals/lizard1.gif');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 21:05:27
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mypetstore
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `userid` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `firstname` varchar(80) NOT NULL,
  `lastname` varchar(80) NOT NULL,
  `status` varchar(2) DEFAULT NULL,
  `addr1` varchar(80) NOT NULL,
  `addr2` varchar(40) DEFAULT NULL,
  `city` varchar(80) NOT NULL,
  `state` varchar(80) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phone` varchar(80) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('a','a','a','a',NULL,'a','a','aa','a','a','a','a'),('ACID','acid@yourdomain.com','ABC','XYX','OK','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','555-555-5555'),('j2ee','yourname@yourdomain.com','ABC','XYX',NULL,'901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','555-555-5555');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannerdata`
--

DROP TABLE IF EXISTS `bannerdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannerdata` (
  `favcategory` varchar(80) NOT NULL,
  `bannername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`favcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannerdata`
--

LOCK TABLES `bannerdata` WRITE;
/*!40000 ALTER TABLE `bannerdata` DISABLE KEYS */;
INSERT INTO `bannerdata` VALUES ('BIRDS','<image src=\"../images/banner_birds.gif\">'),('CATS','<image src=\"../images/banner_cats.gif\">'),('DOGS','<image src=\"../images/banner_dogs.gif\">'),('FISH','<image src=\"../images/banner_fish.gif\">'),('REPTILES','<image src=\"../images/banner_reptiles.gif\">');
/*!40000 ALTER TABLE `bannerdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `catid` varchar(10) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('BIRDS','Birds','<image src=\"../images/birds_icon.gif\"><font size=\"5\" color=\"blue\"> Birds</font>'),('CATS','Cats','<image src=\"../images/cats_icon.gif\"><font size=\"5\" color=\"blue\"> Cats</font>'),('DOGS','Dogs','<image src=\"../images/dogs_icon.gif\"><font size=\"5\" color=\"blue\"> Dogs</font>'),('FISH','Fish','<image src=\"../images/fish_icon.gif\"><font size=\"5\" color=\"blue\"> Fish</font>'),('REPTILES','Reptiles','<image src=\"../images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\"> Reptiles</font>');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `itemid` varchar(10) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('EST-1',10000),('EST-10',10000),('EST-11',10000),('EST-12',10000),('EST-13',10000),('EST-14',10000),('EST-15',10000),('EST-16',10000),('EST-17',10000),('EST-18',10000),('EST-19',10000),('EST-2',10000),('EST-20',10000),('EST-21',10000),('EST-22',10000),('EST-23',10000),('EST-24',10000),('EST-25',10000),('EST-26',10000),('EST-27',10000),('EST-28',10000),('EST-3',10000),('EST-4',10000),('EST-5',10000),('EST-6',10000),('EST-7',10000),('EST-8',10000),('EST-9',10000);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `itemid` varchar(10) NOT NULL,
  `productid` varchar(10) NOT NULL,
  `listprice` decimal(10,2) DEFAULT NULL,
  `unitcost` decimal(10,2) DEFAULT NULL,
  `supplier` int(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `attr1` varchar(80) DEFAULT NULL,
  `attr2` varchar(80) DEFAULT NULL,
  `attr3` varchar(80) DEFAULT NULL,
  `attr4` varchar(80) DEFAULT NULL,
  `attr5` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_item_2` (`supplier`),
  KEY `itemProd` (`productid`),
  CONSTRAINT `fk_item_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  CONSTRAINT `fk_item_2` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('EST-1','FI-SW-01',16.50,10.00,1,'P','Large',NULL,NULL,NULL,NULL),('EST-10','K9-DL-01',18.50,12.00,1,'P','Spotted Adult Female',NULL,NULL,NULL,NULL),('EST-11','RP-SN-01',18.50,12.00,1,'P','Venomless',NULL,NULL,NULL,NULL),('EST-12','RP-SN-01',18.50,12.00,1,'P','Rattleless',NULL,NULL,NULL,NULL),('EST-13','RP-LI-02',18.50,12.00,1,'P','Green Adult',NULL,NULL,NULL,NULL),('EST-14','FL-DSH-01',58.50,12.00,1,'P','Tailless',NULL,NULL,NULL,NULL),('EST-15','FL-DSH-01',23.50,12.00,1,'P','With tail',NULL,NULL,NULL,NULL),('EST-16','FL-DLH-02',93.50,12.00,1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-17','FL-DLH-02',93.50,12.00,1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-18','AV-CB-01',193.50,92.00,1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-19','AV-SB-02',15.50,2.00,1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-2','FI-SW-01',16.50,10.00,1,'P','Small',NULL,NULL,NULL,NULL),('EST-20','FI-FW-02',5.50,2.00,1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-21','FI-FW-02',5.29,1.00,1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-22','K9-RT-02',135.50,100.00,1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-23','K9-RT-02',145.49,100.00,1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-24','K9-RT-02',255.50,92.00,1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-25','K9-RT-02',325.29,90.00,1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-26','K9-CW-01',125.50,92.00,1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-27','K9-CW-01',155.29,90.00,1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-28','K9-RT-01',155.29,90.00,1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-3','FI-SW-02',18.50,12.00,1,'P','Toothless',NULL,NULL,NULL,NULL),('EST-4','FI-FW-01',18.50,12.00,1,'P','Spotted',NULL,NULL,NULL,NULL),('EST-5','FI-FW-01',18.50,12.00,1,'P','Spotless',NULL,NULL,NULL,NULL),('EST-6','K9-BD-01',18.50,12.00,1,'P','Male Adult',NULL,NULL,NULL,NULL),('EST-7','K9-BD-01',18.50,12.00,1,'P','Female Puppy',NULL,NULL,NULL,NULL),('EST-8','K9-PO-02',18.50,12.00,1,'P','Male Puppy',NULL,NULL,NULL,NULL),('EST-9','K9-DL-01',18.50,12.00,1,'P','Spotless Male Puppy',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineitem`
--

DROP TABLE IF EXISTS `lineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineitem` (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `itemid` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unitprice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderid`,`linenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineitem`
--

LOCK TABLES `lineitem` WRITE;
/*!40000 ALTER TABLE `lineitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `lineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `userid` varchar(80) NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) NOT NULL,
  `shipaddr2` varchar(80) DEFAULT NULL,
  `shipcity` varchar(80) NOT NULL,
  `shipstate` varchar(80) NOT NULL,
  `shipzip` varchar(20) NOT NULL,
  `shipcountry` varchar(20) NOT NULL,
  `billaddr1` varchar(80) NOT NULL,
  `billaddr2` varchar(80) DEFAULT NULL,
  `billcity` varchar(80) NOT NULL,
  `billstate` varchar(80) NOT NULL,
  `billzip` varchar(20) NOT NULL,
  `billcountry` varchar(20) NOT NULL,
  `courier` varchar(80) NOT NULL,
  `totalprice` decimal(10,2) NOT NULL,
  `billtofirstname` varchar(80) NOT NULL,
  `billtolastname` varchar(80) NOT NULL,
  `shiptofirstname` varchar(80) NOT NULL,
  `shiptolastname` varchar(80) NOT NULL,
  `creditcard` varchar(80) NOT NULL,
  `exprdate` varchar(7) NOT NULL,
  `cardtype` varchar(80) NOT NULL,
  `locale` varchar(80) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderstatus` (
  `orderid` int(11) NOT NULL,
  `linenum` int(11) NOT NULL,
  `timestamp` date NOT NULL,
  `status` varchar(2) NOT NULL,
  PRIMARY KEY (`orderid`,`linenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productid` varchar(10) NOT NULL,
  `category` varchar(10) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `descn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `productCat` (`category`),
  KEY `productName` (`name`),
  CONSTRAINT `fk_product_1` FOREIGN KEY (`category`) REFERENCES `category` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('AV-CB-01','BIRDS','Amazon Parrot','<image src=\"../images/bird4.gif\">Great companion for up to 75 years'),('AV-SB-02','BIRDS','Finch','<image src=\"../images/bird1.gif\">Great stress reliever'),('FI-FW-01','FISH','Koi','<image src=\"../images/fish3.gif\">Fresh Water fish from Japan'),('FI-FW-02','FISH','Goldfish','<image src=\"../images/fish2.gif\">Fresh Water fish from China'),('FI-SW-01','FISH','Angelfish','<image src=\"../images/fish1.gif\">Salt Water fish from Australia'),('FI-SW-02','FISH','Tiger Shark','<image src=\"../images/fish4.gif\">Salt Water fish from Australia'),('FL-DLH-02','CATS','Persian','<image src=\"../images/cat1.gif\">Friendly house cat, doubles as a princess'),('FL-DSH-01','CATS','Manx','<image src=\"../images/cat3.gif\">Great for reducing mouse populations'),('K9-BD-01','DOGS','Bulldog','<image src=\"../images/dog2.gif\">Friendly dog from England'),('K9-CW-01','DOGS','Chihuahua','<image src=\"../images/dog4.gif\">Great companion dog'),('K9-DL-01','DOGS','Dalmation','<image src=\"../images/dog5.gif\">Great dog for a Fire Station'),('K9-PO-02','DOGS','Poodle','<image src=\"../images/dog6.gif\">Cute dog from France'),('K9-RT-01','DOGS','Golden Retriever','<image src=\"../images/dog1.gif\">Great family dog'),('K9-RT-02','DOGS','Labrador Retriever','<image src=\"../images/dog5.gif\">Great hunting dog'),('RP-LI-02','REPTILES','Iguana','<image src=\"../images/lizard2.gif\">Friendly green friend'),('RP-SN-01','REPTILES','Rattlesnake','<image src=\"../images/lizard3.gif\">Doubles as a watch dog');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `userid` varchar(80) NOT NULL,
  `langpref` varchar(80) NOT NULL,
  `favcategory` varchar(30) DEFAULT NULL,
  `mylistopt` tinyint(1) DEFAULT NULL,
  `banneropt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES ('a','japanese','DOGS',NULL,NULL),('ACID','english','CATS',1,1),('j2ee','english','FISH',1,1);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `name` varchar(30) NOT NULL,
  `nextid` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES ('linenum',1000),('ordernum',1000);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signon`
--

DROP TABLE IF EXISTS `signon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signon` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signon`
--

LOCK TABLES `signon` WRITE;
/*!40000 ALTER TABLE `signon` DISABLE KEYS */;
INSERT INTO `signon` VALUES ('a','a'),('ACID','ACID'),('j2ee','j2ee');
/*!40000 ALTER TABLE `signon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `suppid` int(11) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `status` varchar(2) NOT NULL,
  `addr1` varchar(80) DEFAULT NULL,
  `addr2` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `zip` varchar(5) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`suppid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'XYZ Pets','AC','600 Avon Way','','Los Angeles','CA','94024','212-947-0797'),(2,'ABC Pets','AC','700 Abalone Way','','San Francisco ','CA','94024','415-947-0797');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 21:05:27
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: student
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
-- Table structure for table `stuinfo`
--

DROP TABLE IF EXISTS `stuinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stuinfo` (
  `idstuinfo` int(11) NOT NULL,
  PRIMARY KEY (`idstuinfo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuinfo`
--

LOCK TABLES `stuinfo` WRITE;
/*!40000 ALTER TABLE `stuinfo` DISABLE KEYS */;
INSERT INTO `stuinfo` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `stuinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 21:05:27
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: test
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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20170321143643_test','1.1.1');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'1'),(2,'2'),(5,'233');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 21:05:27
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

-- Dump completed on 2017-09-25 21:05:27
