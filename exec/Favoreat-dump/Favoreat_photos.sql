-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: j8d108.p.ssafy.io    Database: Favoreat
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `photos_id` int NOT NULL AUTO_INCREMENT,
  `id` int DEFAULT NULL,
  `original_name` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `saved_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`photos_id`),
  KEY `FK_photos_diary_id` (`id`),
  CONSTRAINT `FK_photos_diary_id` FOREIGN KEY (`id`) REFERENCES `diary` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (41,60,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(42,60,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(43,61,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(44,61,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(45,62,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(46,62,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(47,63,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(48,63,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(49,64,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(50,64,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(51,65,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(52,65,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(53,66,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(54,66,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(55,67,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(56,67,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(57,68,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(58,68,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(59,69,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(60,69,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(61,70,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(62,70,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(63,71,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(64,71,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(65,72,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(66,72,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(67,73,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(68,73,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(69,74,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(70,74,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(71,75,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(72,75,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(73,76,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(74,76,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(75,77,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(76,77,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(77,78,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(78,78,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(79,79,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(80,79,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(81,80,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(82,80,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(83,81,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(84,81,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(85,82,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(86,82,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(87,83,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(88,83,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(89,84,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(90,84,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(91,85,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(92,85,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(93,86,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(94,86,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(95,87,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(96,87,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(97,88,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(98,88,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(99,89,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(100,89,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(101,90,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(102,90,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(103,91,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(104,91,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(105,92,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(106,92,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(107,93,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(108,93,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(109,94,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(110,94,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(111,95,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(112,95,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(113,96,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(114,96,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(115,97,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(116,97,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(117,98,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png'),(118,98,'https://leechangmin-s3-bucket.s3.ap-northeast-2.amazonaws.com/%EC%98%88%EC%88%A0+%EC%9E%91%ED%92%88','.png');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-06 10:32:27
