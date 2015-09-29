-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: myweb
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `sys_operation`
--

DROP TABLE IF EXISTS `sys_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_operation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8xnmipoec6b3bk0gy12v3f0wu` (`operation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation`
--

LOCK TABLES `sys_operation` WRITE;
/*!40000 ALTER TABLE `sys_operation` DISABLE KEYS */;
INSERT INTO `sys_operation` VALUES (1,'创建操作','创建','create'),(2,'编辑权限','编辑','edit'),(3,'删除权限','删除','delete'),(4,'浏览权限','浏览','view');
/*!40000 ALTER TABLE `sys_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hexim9uyc5qv6kb7rnhkg10sh` (`resource_id`),
  CONSTRAINT `FK_hexim9uyc5qv6kb7rnhkg10sh` FOREIGN KEY (`resource_id`) REFERENCES `sys_resource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
INSERT INTO `sys_permission` VALUES (1,'用户管理相关权限','用户管理',1),(12,NULL,NULL,2),(13,NULL,NULL,3),(14,NULL,NULL,4),(15,NULL,NULL,1),(16,NULL,NULL,2),(17,NULL,NULL,3),(18,NULL,NULL,4),(19,NULL,NULL,1),(20,NULL,NULL,2),(21,NULL,NULL,3),(22,NULL,NULL,4);
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission_operation`
--

DROP TABLE IF EXISTS `sys_permission_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_permission_operation` (
  `permission_id` bigint(20) NOT NULL,
  `operation_id` bigint(20) NOT NULL,
  PRIMARY KEY (`permission_id`,`operation_id`),
  KEY `FK_6p2gdb3um9jfpwo8dbrkbfgy2` (`operation_id`),
  CONSTRAINT `FK_6p2gdb3um9jfpwo8dbrkbfgy2` FOREIGN KEY (`operation_id`) REFERENCES `sys_operation` (`id`),
  CONSTRAINT `FK_rtyal4hl133bdr8v4srilar7w` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_permission_operation`
--

LOCK TABLES `sys_permission_operation` WRITE;
/*!40000 ALTER TABLE `sys_permission_operation` DISABLE KEYS */;
INSERT INTO `sys_permission_operation` VALUES (1,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(1,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(1,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3),(18,3),(1,4),(12,4),(13,4),(14,4),(15,4),(16,4),(17,4),(18,4),(19,4),(20,4),(21,4),(22,4);
/*!40000 ALTER TABLE `sys_permission_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource`
--

DROP TABLE IF EXISTS `sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identity` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8bwkb99txnsskncmlrljwqpby` (`identity`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource`
--

LOCK TABLES `sys_resource` WRITE;
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;
INSERT INTO `sys_resource` VALUES (1,'user','用户管理'),(2,'role','角色管理'),(3,'resource','资源管理'),(4,'operation','操作权限管理');
/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_mwbqlu5c82jfd2w9oa9d6e87d` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'拥有所有权限','超级管理员','admin'),(2,'用户管理权限','用户管理员','admin_user'),(3,'角色管理权限','角色管理员','admin_role'),(4,'资源管理权限','资源管理员','admin_resource'),(6,'操作权限管理','操作权限管理员','admin_operation'),(7,'查看系统权限','查看员','checker');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_permission`
--

DROP TABLE IF EXISTS `sys_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_permission` (
  `role_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_8n7kjpptsuop8jvkeh4ls34ct` (`permission_id`),
  KEY `FK_6ov1c9l6b3e2o9d3q889c90l` (`role_id`),
  CONSTRAINT `FK_6ov1c9l6b3e2o9d3q889c90l` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_8n7kjpptsuop8jvkeh4ls34ct` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_permission`
--

LOCK TABLES `sys_role_permission` WRITE;
/*!40000 ALTER TABLE `sys_role_permission` DISABLE KEYS */;
INSERT INTO `sys_role_permission` VALUES (1,1),(1,12),(1,13),(1,14),(2,15),(3,16),(4,17),(6,18),(7,19),(7,20),(7,21),(7,22);
/*!40000 ALTER TABLE `sys_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_51bvuyvihefoh4kp5syh2jpi4` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'2015-09-26 17:05:33','abcd@qq.com','\0','30e30f4f4071c0e738738b5a6aebcd74','9cddc655c7f8bdf5843c1b78d108bcc1','admin'),(2,'2015-09-26 22:12:47','abcd@qq.com','\0','297f337103bf46f0a651a2188a385215','f63bd7e3257030dc5b565eb96f7ada08','admin_user'),(3,'2015-09-26 22:13:18','abcd@qq.com','\0','b95bd1d99a1ab2e2ec065616784a2815','3451ca495cd99b6f5e67c7af99857477','admin_role'),(4,'2015-09-26 22:19:17','abcd@qq.com','\0','8ab3b2b2747dbc812129edea04fa68d9','790fa4e0994732c4d02925c3feb5d367','admin_resource'),(5,'2015-09-26 22:41:16','abcd@qq.com','\0','386e7b7182704488cd5871a9c7326c27','b0531908540f13bbb9e7a41e19951ffc','checker');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_fxu3td9m5o7qov1kbdvmn0g0x` (`role_id`),
  CONSTRAINT `FK_fethvr269t6stivlddbo5pxry` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FK_fxu3td9m5o7qov1kbdvmn0g0x` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,3),(4,4),(5,7);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-29 10:37:09
