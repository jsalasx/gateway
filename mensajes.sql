-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: mensajes
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add mensajes model',7,'add_mensajesmodel'),(26,'Can change mensajes model',7,'change_mensajesmodel'),(27,'Can delete mensajes model',7,'delete_mensajesmodel'),(28,'Can view mensajes model',7,'view_mensajesmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$DSvPaS5J2IakWmHabqOfBX$wEsTlIEq67B+NbnssyGvyyGDp7QotxEHmqZU8CBvqUo=','2021-04-27 20:30:45.070960',1,'megaspeed','','','joal.sala@gmail.com',1,1,'2021-04-27 20:26:26.157915');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auxiliar`
--

DROP TABLE IF EXISTS `auxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auxiliar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aux` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auxiliar`
--

LOCK TABLES `auxiliar` WRITE;
/*!40000 ALTER TABLE `auxiliar` DISABLE KEYS */;
INSERT INTO `auxiliar` VALUES (1,0);
/*!40000 ALTER TABLE `auxiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'gateway','mensajesmodel'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-04-27 20:25:49.287031'),(2,'auth','0001_initial','2021-04-27 20:25:49.598064'),(3,'admin','0001_initial','2021-04-27 20:25:49.850844'),(4,'admin','0002_logentry_remove_auto_add','2021-04-27 20:25:49.863051'),(5,'admin','0003_logentry_add_action_flag_choices','2021-04-27 20:25:49.873559'),(6,'contenttypes','0002_remove_content_type_name','2021-04-27 20:25:49.936223'),(7,'auth','0002_alter_permission_name_max_length','2021-04-27 20:25:49.976133'),(8,'auth','0003_alter_user_email_max_length','2021-04-27 20:25:50.004280'),(9,'auth','0004_alter_user_username_opts','2021-04-27 20:25:50.015023'),(10,'auth','0005_alter_user_last_login_null','2021-04-27 20:25:50.051309'),(11,'auth','0006_require_contenttypes_0002','2021-04-27 20:25:50.054927'),(12,'auth','0007_alter_validators_add_error_messages','2021-04-27 20:25:50.065677'),(13,'auth','0008_alter_user_username_max_length','2021-04-27 20:25:50.105638'),(14,'auth','0009_alter_user_last_name_max_length','2021-04-27 20:25:50.147574'),(15,'auth','0010_alter_group_name_max_length','2021-04-27 20:25:50.175279'),(16,'auth','0011_update_proxy_permissions','2021-04-27 20:25:50.188368'),(17,'auth','0012_alter_user_first_name_max_length','2021-04-27 20:25:50.229266'),(18,'sessions','0001_initial','2021-04-27 20:25:50.253280');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('m41m8ccpef4zdvsw82e1stcq1qpu2x9f','.eJxVjDsOwjAQBe_iGlnxZ9cOJT1nsHbXDg4gR8qnQtwdIqWA9s3Me6lE21rTtpQ5jVmdlVGn341JHqXtIN-p3SYtU1vnkfWu6IMu-jrl8rwc7t9BpaV-a_TgIvEQgwdmE3JBHx176FiQ0HYEDqzL0hnTA4oAI0oYbI8xZIPq_QHLvzcV:1lbUM1:WjGyzxNu4ATwWUyPI0eaLyK674-g9z6Apt9aDBpSBOE','2021-05-11 20:30:45.073520');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensaje` text,
  `fecha` datetime DEFAULT NULL,
  `auxiliar` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (100,'Hola, soy un mensaje62021-10-28 16:37:50','2021-10-28 16:37:50',1),(101,'Hola, soy un mensaje62021-10-28 16:38:05','2021-10-28 16:38:05',1),(102,'Hola, soy un mensaje62021-10-28 16:42:10','2021-10-28 16:42:10',1),(103,'Hola, soy un mensaje62021-10-28 16:45:01','2021-10-28 16:45:01',1),(104,'Hola, soy un mensaje62021-10-28 16:45:28','2021-10-28 16:45:28',1),(105,'Hola, soy un mensaje62021-10-28 16:45:40','2021-10-28 16:45:40',1),(106,'Hola, soy un mensaje62021-10-28 16:49:28','2021-10-28 16:49:28',1),(107,'Hola, soy un mensaje62021-10-28 16:49:52','2021-10-28 16:49:52',1),(108,'Hola, soy un mensaje62021-10-28 16:50:10','2021-10-28 16:50:10',1),(109,'Hola, soy un mensaje62021-10-28 16:50:27','2021-10-28 16:50:27',1),(110,'Hola, soy un mensaje62021-10-28 16:50:41','2021-10-28 16:50:41',1),(111,'Hola, soy un mensaje62021-10-28 16:51:19','2021-10-28 16:51:19',1),(112,'Hola, soy un mensaje62021-10-28 16:51:36','2021-10-28 16:51:36',1),(113,'Hola, soy un mensaje62021-10-28 16:51:51','2021-10-28 16:51:51',1),(114,'Hola, soy un mensaje62021-10-28 16:52:04','2021-10-28 16:52:04',1),(115,'Hola, soy un mensaje62021-10-28 16:52:24','2021-10-28 16:52:24',1),(116,'Hola, soy un mensaje62021-10-28 16:52:34','2021-10-28 16:52:34',1),(117,'Hola, soy un mensaje62021-10-28 16:52:47','2021-10-28 16:52:47',1),(118,'Hola, soy un mensaje62021-10-28 16:53:02','2021-10-28 16:53:02',1),(119,'Hola, soy un mensaje62021-10-28 16:53:24','2021-10-28 16:53:24',1),(120,'Hola, soy un mensaje62021-10-28 16:53:40','2021-10-28 16:53:40',1),(121,'Hola, soy un mensaje62021-10-28 16:53:54','2021-10-28 16:53:54',1),(122,'Hola, soy un mensaje62021-10-28 16:54:08','2021-10-28 16:54:08',1),(123,'Hola, soy un mensaje62021-10-28 16:54:12','2021-10-28 16:54:12',1),(124,'Hola, soy un mensaje62021-10-28 16:54:21','2021-10-28 16:54:21',1),(125,'Hola, soy un mensaje62021-10-28 16:55:18','2021-10-28 16:55:18',1),(126,'Hola, soy un mensaje62021-10-28 16:59:38','2021-10-28 16:59:38',1),(127,'Hola, soy un mensaje62021-10-28 17:00:04','2021-10-28 17:00:04',1),(128,'Hola, soy un mensaje62021-10-28 17:00:20','2021-10-28 17:00:20',1),(129,'Hola, soy un mensaje62021-10-28 17:00:40','2021-10-28 17:00:40',1),(130,'Hola, soy un mensaje62021-10-28 17:01:00','2021-10-28 17:01:00',1),(131,'Hola, soy un mensaje62021-10-28 17:01:13','2021-10-28 17:01:13',1),(132,'Hola, soy un mensaje62021-10-28 17:02:06','2021-10-28 17:02:06',1),(133,'Hola, soy un mensaje62021-10-28 17:02:29','2021-10-28 17:02:29',1),(134,'Su pago ha sido registrado2021-10-29 10:29:53','2021-10-29 10:29:53',1),(135,'Mensaje de Prueba','2021-11-27 15:07:57',1),(136,'Mensaje de Prueba','2021-11-27 15:13:21',1),(137,'Mensaje de Prueba2','2021-11-27 15:18:35',1),(138,'Mensaje de Prueba2','2021-11-27 15:22:35',1),(139,'Mensaje de Prueba2','2021-11-27 15:32:51',1),(140,'Mensaje de Prueba2','2021-11-27 15:33:20',1),(141,'Mensaje de Prueba2','2021-11-27 15:44:50',1),(142,'Mensaje de Prueba2','2021-11-27 15:45:32',1),(143,'Mensaje de Prueba2','2021-11-27 15:57:42',1),(144,'Mensaje de Prueba3','2021-11-27 15:58:07',1),(145,'Mensaje de Prueba4','2021-11-27 15:59:58',1),(146,'Mensaje de Prueba5','2021-11-27 16:01:41',1),(147,'Mensaje de Prueba6','2021-11-27 16:02:52',1),(148,'Mensaje de Prueba6','2021-11-27 16:13:51',1),(149,'Mensaje de Prueba6','2021-11-27 16:17:55',1),(150,'Mensaje de Prueba7','2021-11-27 16:19:45',1),(151,'Mensaje de Prueba8','2021-11-27 16:20:45',1);
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` text,
  `estadoToken` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'d5FYFvLbTQ601fEDuF7BaP:APA91bEuTUPfyxCHWJowHT4RwtUOb9EvYZ69jbilVQuruOOWREV9gth00YjltZXHmDh66GPCPAuvXymg83AuyKvP6t5zSnSN5nBqMulHLMhDKapEgYgBNl_f2uBO70zIX2nGhLn2nAGw',1),(2,'fVD8tTJXTCyipjp2BGFd1c:APA91bHN4_HQCdtvZBlv68aToqk2xUeJAzrSlv-iEX332yFWgJrdcNJkPkXIufQd-0iV927t1WFFo0YIlHEcfoD2O2sn2jtO1G4Jtb1itulhavL38j7w4mFwp6tTV826o2ReBLyx64e3',1),(3,'cl0SAesxRqu1kbcXZq6N4r:APA91bEcA-8n_53hmApAU_pMCASOcsTDBU-dha6cEZh_AmpyKOxLA_P9as_FKBEdGJ2DHvg5IYVyMwXVyYS7Vx__AIaEudWw8PTVawqFnwQjmk84j0C3SKi5ndw5F85qd1AKAe9q26TO',1),(4,'dUOkPgaDTQij3UIHClvQ6s:APA91bFfrtpwELHzcpYbkkOMgaQGI86GXMS3kB9QQEoxJFu_eTCo5E2lBsB5Q30Z5mW_e1TMEL2huP1sZ8LgT4jvYSGlTcwEfIMUEiEzV_d3HNSf8vqggG_N99_r70Am_m6BX6-TJNh_',1);
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-27 17:21:28
