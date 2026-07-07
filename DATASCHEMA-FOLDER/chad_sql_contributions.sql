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
-- Table structure for table `sql_contributions`
--

DROP TABLE IF EXISTS `sql_contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sql_contributions` (
  `sql_id` int NOT NULL AUTO_INCREMENT,
  `problem_id` int DEFAULT NULL,
  `sql_statement` text NOT NULL,
  PRIMARY KEY (`sql_id`),
  KEY `problem_id` (`problem_id`),
  CONSTRAINT `SQL_Contributions_fk_problem` FOREIGN KEY (`problem_id`) REFERENCES `problems` (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_contributions`
--

LOCK TABLES `sql_contributions` WRITE;
/*!40000 ALTER TABLE `sql_contributions` DISABLE KEYS */;
INSERT INTO `sql_contributions` VALUES (1,1,'select t2.response_description\nFrom (select Q46, count(Q46) as total_count from chad_encoded_data\nwhere Q48 = \'5\'\ngroup by Q46\norder by total_count desc\nlimit 1) A, data_dictionary t1, response_description t2\nwhere t1.question_label = \"Q46\" and t1.response_encoded_value = A.Q46\nand t1.ref_response_description = t2.response_description_pk;\n'),(2,2,'select count(*)\nfrom chad_encoded_data\nwhere Q47 in (\'0\', \'1\', \'2\')   	\n and CAST(Q28 AS SIGNED) % 2 != 0;\n'),(3,3,'select sum(A.category_count), sum(A.total_sum)/sum(A.category_count)\nfrom (select Q47 alias_Q47, count(Q47) category_count, \nCount(Q47)*CAST(Q47 AS SIGNED)*25000 total_sum\n		from chad_encoded_data\n		where Q12 = 5 -- and Q47 in (\'0\', \'1\', \'2\')\n		group by Q47) A;\n');
/*!40000 ALTER TABLE `sql_contributions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07 15:41:21
