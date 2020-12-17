CREATE DATABASE  IF NOT EXISTS `jeeproject_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jeeproject_db`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jeeproject_db
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentaire` (
  `comment_id` int(11) NOT NULL,
  `nbr_love` int(11) DEFAULT NULL,
  `auteur` varchar(50) DEFAULT NULL,
  `contenu` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_auteur_comment_username` (`auteur`),
  KEY `fk_post_id_comment` (`post_id`),
  CONSTRAINT `fk_auteur_comment_username` FOREIGN KEY (`auteur`) REFERENCES `user` (`email`),
  CONSTRAINT `fk_post_id_comment` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaire`
--

LOCK TABLES `commentaire` WRITE;
/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notif_id` int(11) NOT NULL,
  `contenu` varchar(50) DEFAULT NULL,
  `destinataire` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`notif_id`),
  KEY `fk_post_id` (`post_id`),
  KEY `fk_auteur` (`destinataire`),
  CONSTRAINT `fk_auteur` FOREIGN KEY (`destinataire`) REFERENCES `user` (`email`),
  CONSTRAINT `fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `auteur` varchar(50) DEFAULT NULL,
  `contenu` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `nbr_like` int(11) DEFAULT NULL,
  `nbr_dislike` int(11) DEFAULT NULL,
  `nbr_signal` int(11) DEFAULT NULL,
  `localisation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_auteur_username` (`auteur`),
  CONSTRAINT `fk_auteur_username` FOREIGN KEY (`auteur`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(50) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2020-12-17 22:43:09
