-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: seatmanagement
-- ------------------------------------------------------
-- Server version 5.7.11-log

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
-- Table structure for table `route`
--

USE seatmanagement;

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `route_station`
--

DROP TABLE IF EXISTS `route_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  `time_of_stop` bigint(20) NOT NULL,
  `platform` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_route_station` (`route_id`,`station_id`),
  KEY `fk_route_id_idx1` (`route_id`),
  KEY `fk_station_id_idx2` (`station_id`),
  CONSTRAINT `fk_route_id3` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_station_id` FOREIGN KEY (`station_id`) REFERENCES `station` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_station`
--
LOCK TABLES `route_station` WRITE;
/*!40000 ALTER TABLE `route_station` DISABLE KEYS */;
INSERT INTO `route_station` VALUES (1,1,1,0,1),(2,1,2,600000,3),(3,1,3,1200000,2),(4,1,4,1800000,2),(5,1,5,2400000,1),(6,2,1,0,1),(7,2,2,660000,3),(8,2,3,1320000,2),(9,2,4,1980000,1),(10,3,5,0,2),(11,3,4,600000,4),(12,3,3,1200000,2),(13,3,2,1800000,1),(14,3,1,2400000,3);
/*!40000 ALTER TABLE `route_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` enum('1','2') NOT NULL DEFAULT '2',
  `area` enum('Handy','Ruhe') NOT NULL,
  `location` enum('Fenster','Gang') NOT NULL,
  `compartment_type` enum('Grossraum','Tisch','Abteil') NOT NULL,
  `upper_level` tinyint(1) NOT NULL,
  `state` varchar(45) DEFAULT 'ready',
  `wagon_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wagon_id_idx` (`wagon_id`),
  CONSTRAINT `fk_wagon_id` FOREIGN KEY (`wagon_id`) REFERENCES `wagon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--
LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,'2','Ruhe','Fenster','Grossraum',0,'ready',1),(2,'2','Ruhe','Fenster','Grossraum',0,'ready',1),(3,'2','Ruhe','Fenster','Grossraum',0,'ready',1),(4,'2','Ruhe','Fenster','Grossraum',0,'ready',1),(5,'1','Ruhe','Fenster','Grossraum',0,'ready',1),(6,'1','Ruhe','Fenster','Grossraum',0,'ready',1),(7,'2','Ruhe','Fenster','Grossraum',0,'ready',2),(8,'2','Ruhe','Fenster','Grossraum',0,'ready',2),(9,'2','Ruhe','Fenster','Grossraum',0,'ready',2),(10,'2','Ruhe','Fenster','Grossraum',0,'ready',2),(11,'1','Ruhe','Fenster','Grossraum',0,'ready',2),(12,'1','Ruhe','Fenster','Grossraum',0,'ready',2),(13,'2','Ruhe','Fenster','Grossraum',0,'ready',3),(14,'2','Ruhe','Fenster','Grossraum',0,'ready',3),(15,'2','Ruhe','Fenster','Grossraum',0,'ready',3),(16,'2','Ruhe','Fenster','Grossraum',0,'ready',3),(17,'1','Ruhe','Fenster','Grossraum',0,'ready',3),(18,'1','Ruhe','Fenster','Grossraum',0,'ready',3),(19,'2','Ruhe','Fenster','Grossraum',0,'ready',4),(20,'2','Ruhe','Fenster','Grossraum',0,'ready',4),(21,'2','Ruhe','Fenster','Grossraum',0,'ready',4),(22,'2','Ruhe','Fenster','Grossraum',0,'ready',4),(23,'1','Ruhe','Fenster','Grossraum',0,'ready',4),(24,'1','Ruhe','Fenster','Grossraum',0,'ready',4),(25,'2','Ruhe','Fenster','Grossraum',0,'ready',5),(26,'2','Ruhe','Fenster','Grossraum',0,'ready',5),(27,'2','Ruhe','Fenster','Grossraum',0,'ready',5),(28,'2','Ruhe','Fenster','Grossraum',0,'ready',5),(29,'1','Ruhe','Fenster','Grossraum',0,'ready',5),(30,'1','Ruhe','Fenster','Grossraum',0,'ready',5),(31,'2','Ruhe','Fenster','Grossraum',0,'ready',6),(32,'2','Ruhe','Fenster','Grossraum',0,'ready',6),(33,'2','Ruhe','Fenster','Grossraum',0,'ready',6),(34,'2','Ruhe','Fenster','Grossraum',0,'ready',6),(35,'1','Ruhe','Fenster','Grossraum',0,'ready',6),(36,'1','Ruhe','Fenster','Grossraum',0,'ready',6),(37,'2','Ruhe','Fenster','Grossraum',0,'ready',7),(38,'2','Ruhe','Fenster','Grossraum',0,'ready',7),(39,'2','Ruhe','Fenster','Grossraum',0,'ready',7),(40,'2','Ruhe','Fenster','Grossraum',0,'ready',7),(41,'1','Ruhe','Fenster','Grossraum',0,'ready',7),(42,'1','Ruhe','Fenster','Grossraum',0,'ready',7),(43,'2','Ruhe','Fenster','Grossraum',0,'ready',8),(44,'2','Ruhe','Fenster','Grossraum',0,'ready',8),(45,'2','Ruhe','Fenster','Grossraum',0,'ready',8),(46,'2','Ruhe','Fenster','Grossraum',0,'ready',8),(47,'1','Ruhe','Fenster','Grossraum',0,'ready',8),(48,'1','Ruhe','Fenster','Grossraum',0,'ready',8),(49,'2','Ruhe','Fenster','Grossraum',0,'ready',9),(50,'2','Ruhe','Fenster','Grossraum',0,'ready',9),(51,'2','Ruhe','Fenster','Grossraum',0,'ready',9),(52,'2','Ruhe','Fenster','Grossraum',0,'ready',9),(53,'1','Ruhe','Fenster','Grossraum',0,'ready',9),(54,'1','Ruhe','Fenster','Grossraum',0,'ready',9),(55,'2','Ruhe','Fenster','Grossraum',0,'ready',10),(56,'2','Ruhe','Fenster','Grossraum',0,'ready',10),(57,'2','Ruhe','Fenster','Grossraum',0,'ready',10),(58,'2','Ruhe','Fenster','Grossraum',0,'ready',10),(59,'1','Ruhe','Fenster','Grossraum',0,'ready',10),(60,'1','Ruhe','Fenster','Grossraum',0,'ready',10),(61,'2','Ruhe','Fenster','Grossraum',0,'ready',11),(62,'2','Ruhe','Fenster','Grossraum',0,'ready',11),(63,'2','Ruhe','Fenster','Grossraum',0,'ready',11),(64,'2','Ruhe','Fenster','Grossraum',0,'ready',11),(65,'1','Ruhe','Fenster','Grossraum',0,'ready',11),(66,'1','Ruhe','Fenster','Grossraum',0,'ready',11),(67,'2','Ruhe','Fenster','Grossraum',0,'ready',12),(68,'2','Ruhe','Fenster','Grossraum',0,'ready',12),(69,'2','Ruhe','Fenster','Grossraum',0,'ready',12),(70,'2','Ruhe','Fenster','Grossraum',0,'ready',12),(71,'1','Ruhe','Fenster','Grossraum',0,'ready',12),(72,'1','Ruhe','Fenster','Grossraum',0,'ready',12);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `seat_allocation`
--

DROP TABLE IF EXISTS `seat_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) NOT NULL,
  `train_connection_id` int(11) NOT NULL,
  `allocated_from` bigint(20) NOT NULL,
  `allocated_until` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seat` (`seat_id`),
  KEY `fk_train_connection_id` (`train_connection_id`),
  CONSTRAINT `fk_seat` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_train_connection_id` FOREIGN KEY (`train_connection_id`) REFERENCES `train_connection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_allocation`
--

-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `category` enum('ICE','IC','EC','CNL','TGV','Thalis','railjet') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number_UNIQUE` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--
LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,1,'IC'),(2,2,'ICE'),(3,3,'IC');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_connection`
--

DROP TABLE IF EXISTS `train_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `departure_time` bigint(20) NOT NULL,
  `day_of_week` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_route_train_departure_day` (`route_id`,`train_id`,`departure_time`,`day_of_week`),
  KEY `fk_route_idx` (`route_id`),
  KEY `fk_train_idx` (`train_id`),
  CONSTRAINT `fk_route` FOREIGN KEY (`route_id`) REFERENCES `route` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_train` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_connection`
--
LOCK TABLES `train_connection` WRITE;
/*!40000 ALTER TABLE `train_connection` DISABLE KEYS */;
INSERT INTO `train_connection` VALUES (1,1,1,36000000,1),(2,1,1,36120000,2),(3,1,1,36240000,3),(4,1,1,36360000,4),(5,1,1,36480000,5),(6,1,1,36600000,6),(7,1,1,36720000,7),(8,1,2,64800000,1),(9,1,2,64920000,2),(10,1,2,65040000,3),(11,1,2,65160000,4),(12,1,2,65280000,5),(13,1,2,65400000,6),(14,1,2,65520000,7),(15,2,3,41400000,1),(16,3,1,39600000,1),(17,3,1,39720000,2),(18,3,1,39840000,3),(19,3,1,39960000,4),(20,3,1,40080000,5),(21,3,1,40200000,6),(22,3,1,40320000,7),(23,3,2,68400000,1),(24,3,2,68520000,2),(25,3,2,68640000,3),(26,3,2,68760000,4),(27,3,2,68880000,5),(28,3,2,69000000,6),(29,3,2,69120000,7);
/*!40000 ALTER TABLE `train_connection` ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table `train_connection_cancellation`
--

DROP TABLE IF EXISTS `train_connection_cancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train_connection_cancellation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `train_connection_id` int(11) NOT NULL,
  `date` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_train_connection_date` (`train_connection_id`,`date`),
  KEY `fk_train_connection_idx` (`train_connection_id`),
  CONSTRAINT `fk_train_connection2` FOREIGN KEY (`train_connection_id`) REFERENCES `train_connection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_connection_cancellation`
--


--
-- Table structure for table `wagon`
--

DROP TABLE IF EXISTS `wagon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(45) DEFAULT 'ready',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagon`
--
LOCK TABLES `wagon` WRITE;
/*!40000 ALTER TABLE `wagon` DISABLE KEYS */;
INSERT INTO `wagon` VALUES (1,'ready'),(2,'ready'),(3,'ready'),(4,'ready'),(5,'ready'),(6,'ready'),(7,'ready'),(8,'ready'),(9,'ready'),(10,'ready'),(11,'ready'),(12,'ready');
/*!40000 ALTER TABLE `wagon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wagon_train_connection`
--

DROP TABLE IF EXISTS `wagon_train_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wagon_train_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wagon_id` int(11) NOT NULL,
  `train_connection_id` int(11) NOT NULL,
  `wagon_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_wagon_train_connection` (`wagon_id`,`train_connection_id`),
  KEY `fk_train_connection` (`train_connection_id`),
  CONSTRAINT `fk_train_connection` FOREIGN KEY (`train_connection_id`) REFERENCES `train_connection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wagon` FOREIGN KEY (`wagon_id`) REFERENCES `wagon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wagon_train_connection`
--
LOCK TABLES `wagon_train_connection` WRITE;
/*!40000 ALTER TABLE `wagon_train_connection` DISABLE KEYS */;
INSERT INTO `wagon_train_connection` VALUES (1,1,1,1),(2,2,1,2),(3,3,1,3),(4,4,1,4),(5,1,2,1),(6,2,2,2),(7,3,2,3),(8,4,2,4),(9,1,3,1),(10,2,3,2),(11,3,3,3),(12,4,3,4),(13,1,4,1),(14,2,4,2),(15,3,4,3),(16,4,4,4),(17,1,5,1),(18,2,5,2),(19,3,5,3),(20,4,5,4),(21,1,6,1),(22,2,6,2),(23,3,6,3),(24,4,6,4),(25,1,7,1),(26,2,7,2),(27,3,7,3),(28,4,7,4),(29,9,8,1),(30,10,8,2),(31,11,8,3),(32,12,8,4),(33,9,9,1),(34,10,9,2),(35,11,9,3),(36,12,9,4),(37,9,10,1),(38,10,10,2),(39,11,10,3),(40,12,10,4),(41,9,11,1),(42,10,11,2),(43,11,11,3),(44,12,11,4),(45,9,12,1),(46,10,12,2),(47,11,12,3),(48,12,12,4),(49,9,13,1),(50,10,13,2),(51,11,13,3),(52,12,13,4),(53,9,14,1),(54,10,14,2),(55,11,14,3),(56,12,14,4),(57,5,15,1),(58,6,15,2),(59,7,15,3),(60,8,15,4),(61,1,16,1),(62,2,16,2),(63,3,16,3),(64,4,16,4),(65,1,17,1),(66,2,17,2),(67,3,17,3),(68,4,17,4),(69,1,18,1),(70,2,18,2),(71,3,18,3),(72,4,18,4),(73,1,19,1),(74,2,19,2),(75,3,19,3),(76,4,19,4),(77,1,20,1),(78,2,20,2),(79,3,20,3),(80,4,20,4),(81,1,21,1),(82,2,21,2),(83,3,21,3),(84,4,21,4),(85,1,22,1),(86,2,22,2),(87,3,22,3),(88,4,22,4),(89,9,23,1),(90,10,23,2),(91,11,23,3),(92,12,23,4),(93,9,24,1),(94,10,24,2),(95,11,24,3),(96,12,24,4),(97,9,25,1),(98,10,25,2),(99,11,25,3),(100,12,25,4),(101,9,26,1),(102,10,26,2),(103,11,26,3),(104,12,26,4),(105,9,27,1),(106,10,27,2),(107,11,27,3),(108,12,27,4),(109,9,28,1),(110,10,28,2),(111,11,28,3),(112,12,28,4),(113,9,29,1),(114,10,29,2),(115,11,29,3),(116,12,29,4);
/*!40000 ALTER TABLE `wagon_train_connection` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-23 10:25:41
