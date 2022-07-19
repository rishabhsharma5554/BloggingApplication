-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: blog_app_apis
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Java','Topics Related to Java'),(2,'Operating System','Topics Related to OS');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `post_post_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKml8v0aac8qo7cbgh37tocvxd4` (`post_post_id`),
  CONSTRAINT `FKml8v0aac8qo7cbgh37tocvxd4` FOREIGN KEY (`post_post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (2,'First comment of post 2.',2),(3,'First comment of post 3.',3),(4,'First comment of post 1.',1),(5,'First comment of post 2.',1),(6,'First comment of post 2.',1),(7,'First comment of post 2.',1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (14);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `added_date` datetime(6) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `post_title` varchar(100) NOT NULL,
  `category_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FKjl0ab1c7s7gsd0tp830a7oogx` (`category_id`),
  KEY `FK7ky67sgi7k0ayf22652f7763r` (`user_id`),
  CONSTRAINT `FK7ky67sgi7k0ayf22652f7763r` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKjl0ab1c7s7gsd0tp830a7oogx` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2022-07-14 20:37:38.449000','It\'s is an OOPS.','74533602-bfca-41f1-8e34-61fc7c54654e.PNG','What is java?',1,1),(2,'2022-07-15 09:57:08.907000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(3,'2022-07-14 22:31:31.102000','It\'s is an OOPS.','default.png','What is Golang?',1,1),(4,'2022-07-15 09:56:51.936000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(5,'2022-07-15 09:56:53.249000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(6,'2022-07-15 09:56:53.952000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(7,'2022-07-15 09:56:54.484000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(8,'2022-07-15 09:56:55.033000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(9,'2022-07-15 09:56:55.600000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(10,'2022-07-15 09:56:56.113000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(11,'2022-07-15 09:56:56.667000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(12,'2022-07-15 09:56:57.211000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(13,'2022-07-15 09:56:57.846000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(14,'2022-07-15 09:56:58.402000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(15,'2022-07-15 09:56:58.963000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(16,'2022-07-15 09:56:59.464000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(17,'2022-07-15 09:57:00.001000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(18,'2022-07-15 09:57:00.578000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(19,'2022-07-15 09:57:01.110000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(20,'2022-07-15 09:57:01.595000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(21,'2022-07-15 09:57:02.143000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(22,'2022-07-15 09:57:02.693000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(23,'2022-07-15 09:57:03.203000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(24,'2022-07-15 09:57:03.831000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(25,'2022-07-15 09:57:04.435000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(26,'2022-07-15 09:57:05.011000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(27,'2022-07-15 09:57:05.598000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(28,'2022-07-15 09:57:06.170000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(29,'2022-07-15 09:57:06.721000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(30,'2022-07-15 09:57:07.280000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(31,'2022-07-15 09:57:07.787000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(32,'2022-07-15 09:57:08.440000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1),(33,'2022-07-15 09:57:08.907000','It\'s is an OOPS and Iterative Language.','default.png','What is Python?',1,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (501,'ROLE_ADMIN'),(502,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user` int NOT NULL,
  `role` int NOT NULL,
  PRIMARY KEY (`user`,`role`),
  KEY `FK26f1qdx6r8j1ggkgras9nrc1d` (`role`),
  CONSTRAINT `FK26f1qdx6r8j1ggkgras9nrc1d` FOREIGN KEY (`role`) REFERENCES `role` (`id`),
  CONSTRAINT `FKlduspqw8rg0gbcpludbfadw6l` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,501),(2,502);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `about` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Programmer','rishabh@rishabhtechnologies.com','Rishabh','$2a$10$mwX/hun99HQGcUjjvWyYLOCoWXOJ2dEYTpo/aze9RnRnrIjq0f8Pq'),(2,'Data Analyst','apurva@rishabhtech.com','Apurva','$2a$10$mwX/hun99HQGcUjjvWyYLOCoWXOJ2dEYTpo/aze9RnRnrIjq0f8Pq'),(3,'System Engineer','shikha@rishabhtechnologies.com','Shikha','abc'),(4,'Software Engineer','karan@rishabhtech.com','Karan','$2a$10$mwX/hun99HQGcUjjvWyYLOCoWXOJ2dEYTpo/aze9RnRnrIjq0f8Pq'),(6,'Software Engineer','Lensi@rishabhtech.com','Lensi','abc'),(7,'System Engineer','shikha@rishabhtech.com','Shikha','abc'),(10,'Data Engineer','mohan@rishabhtech.com','Mohan','abc'),(11,'System Engineer','pritam@rishabhtech.com','Pritam','$2a$10$qboTkzfLbCAN1gDcEflmd.95U/mKaFelv33P/ySLVireQtOjftWfq'),(12,'System Engineer','Shasha@rishabhtech.com','Shasha','$2a$10$m2iEWHUpFkfd03IXRP3Wp.vkfr1FgeeKRERsljtBKW8Ul1sbJWtmu');
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

-- Dump completed on 2022-07-19 14:37:13
