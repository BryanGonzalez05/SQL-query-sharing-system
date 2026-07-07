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
-- Table structure for table `data_dictionary`
--

DROP TABLE IF EXISTS `data_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_dictionary` (
  `data_dictionary_pk` int NOT NULL AUTO_INCREMENT,
  `question_label` varchar(45) NOT NULL,
  `response_encoded_value` int NOT NULL,
  `ref_response_description` int DEFAULT NULL,
  PRIMARY KEY (`data_dictionary_pk`),
  KEY `ref_response_description` (`ref_response_description`),
  CONSTRAINT `data_dictionary_ibfk_1` FOREIGN KEY (`ref_response_description`) REFERENCES `response_description` (`response_description_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_dictionary`
--

LOCK TABLES `data_dictionary` WRITE;
/*!40000 ALTER TABLE `data_dictionary` DISABLE KEYS */;
INSERT INTO `data_dictionary` VALUES (1,'S6',0,1),(2,'S6',1,2),(3,'S6',2,3),(4,'S6',3,4),(5,'S6',4,5),(6,'Q28',1,6),(7,'Q28',2,7),(8,'Q28',4,8),(9,'Q28',8,9),(10,'Q28',16,10),(11,'Q28',32,11),(12,'Q28',64,12),(13,'Q28',128,13),(14,'Q28',256,14),(15,'Q28',512,15),(16,'Q28',1024,16),(17,'Q28',2048,17),(18,'Q29b',0,18),(19,'Q29b',1,19),(20,'Q29b',2,20),(21,'Q29b',3,21),(22,'Q29b',4,22),(23,'Q45',1,23),(24,'Q45',2,24),(25,'Q45',4,25),(26,'Q45',8,26),(27,'Q45',16,27),(28,'Q45',32,28),(29,'Q45',128,29),(30,'Q45',64,30),(31,'Q46',0,31),(32,'Q46',1,32),(33,'Q46',2,33),(34,'Q46',3,34),(35,'Q46',4,35),(36,'Q46',5,36),(37,'Q46',6,37),(38,'Q46',7,38),(39,'Q46',8,39),(40,'Q47',0,40),(41,'Q47',1,41),(42,'Q47',2,42),(43,'Q47',3,43),(44,'Q47',4,44),(45,'Q47',5,45),(46,'Q47',6,46),(47,'Q47',7,47),(48,'Q47',8,48),(49,'Q48',1,49),(50,'Q48',2,50),(51,'Q48',3,51),(52,'Q48',4,52),(53,'Q48',5,53),(54,'Q48',0,22),(55,'Q8',1,54),(56,'Q8',2,55),(57,'Q8',3,56),(58,'Q8',4,57),(59,'Q8',5,58),(60,'Q8',0,59),(61,'Q9',1,54),(62,'Q9',2,55),(63,'Q9',3,56),(64,'Q9',4,57),(65,'Q9',5,58),(66,'Q9',0,59),(67,'Q12',1,54),(68,'Q12',2,55),(69,'Q12',3,56),(70,'Q12',4,57),(71,'Q12',5,58),(72,'Q12',0,59),(73,'Q16',1,54),(74,'Q16',2,55),(75,'Q16',3,56),(76,'Q16',4,57),(77,'Q16',5,58),(78,'Q16',0,59),(79,'Q17',1,54),(80,'Q17',2,55),(81,'Q17',3,56),(82,'Q17',4,57),(83,'Q17',5,58),(84,'Q17',0,59),(85,'Q18',1,54),(86,'Q18',2,55),(87,'Q18',3,56),(88,'Q18',4,57),(89,'Q18',5,58),(90,'Q18',0,59),(91,'Q19',1,54),(92,'Q19',2,55),(93,'Q19',3,56),(94,'Q19',4,57),(95,'Q19',5,58),(96,'Q19',0,59),(97,'Q24',1,54),(98,'Q24',2,55),(99,'Q24',3,56),(100,'Q24',4,57),(101,'Q24',5,58),(102,'Q24',0,59);
/*!40000 ALTER TABLE `data_dictionary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07 15:41:17
