-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: chad
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `response_description`
--

DROP TABLE IF EXISTS `response_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response_description` (
  `response_description_pk` int NOT NULL AUTO_INCREMENT,
  `response_choice` varchar(35) NOT NULL,
  `response_description` varchar(1024) NOT NULL,
  PRIMARY KEY (`response_description_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response_description`
--

LOCK TABLES `response_description` WRITE;
/*!40000 ALTER TABLE `response_description` DISABLE KEYS */;
INSERT INTO `response_description` VALUES (1,'N/A','13440'),(2,'N/A','13502'),(3,'N/A','13501'),(4,'N/A','13492'),(5,'N/A','13413'),(6,'a','I have no insurance'),(7,'b','Too expensive/Cannot afford'),(8,'c','Could not get appointment(s)'),(9,'d','Lack of transportation'),(10,'e','Too much time to wait before an appointment'),(11,'f','Doctor is too far away'),(12,'g','Services are not available'),(13,'h','Provider does not accept my insurance'),(14,'i','Doctor not accepting new patients'),(15,'j','Did not know how to get in contact with provider'),(16,'k','Other (please specify)'),(17,'N/A','Missing value'),(18,'N/A','yes'),(19,'N/A','No'),(20,'N/A','Not Sure'),(21,'N/A','Not Due Yet'),(22,'N/A','Prefer not to answer'),(23,'a','Employed full-time'),(24,'b','Employed part-time'),(25,'c','Retired'),(26,'d','Unemployed'),(27,'e','Disabled'),(28,'f','Student'),(29,'g','Other (please specify)'),(30,'h','Prefer not to answer'),(31,'a','Less than high school'),(32,'b','Some high school'),(33,'c','High school graduate (or equivalent)'),(34,'d','Some college, no degree'),(35,'e','Two-year associate degree from a college or university'),(36,'f','Four-year college or university degree/Bachelor degree (e.g., BS, BA, AB)'),(37,'g','Some postgraduate or professional schooling, no postgraduate degree (e.g., some graduate school'),(38,'h','Postgraduate or professional degree (e.g., MA, MS, PhD, JD, graduate school)'),(39,'i','Do not know/Refused'),(40,'a','Less than $25,000'),(41,'b','$25,000-$49,999'),(42,'c','$50,000-$74,999'),(43,'d','$75,000-$99,999'),(44,'e','$100,000-$124,999'),(45,'f','$125,000-$149,999'),(46,'g','$150,000-$199,999'),(47,'h','$200,000 or more'),(48,'i','Prefer not to answer'),(49,'N/A','Never'),(50,'N/A','Rarely'),(51,'N/A','Sometimes'),(52,'N/A','Often'),(53,'N/A','Always'),(54,'N/A','1'),(55,'N/A','2'),(56,'N/A','3'),(57,'N/A','4'),(58,'N/A','5'),(59,'N/A','Do not know');
/*!40000 ALTER TABLE `response_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07 15:41:14
