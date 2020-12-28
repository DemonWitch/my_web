-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: timo
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cm_agents`
--

DROP TABLE IF EXISTS `cm_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_agents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `level` tinyint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL,
  `update_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg3a2bbv9e1hx73c2rdil6rt95` (`create_by`),
  KEY `FKkucn87edb0tfqjf2da0gwrmbi` (`update_by`),
  CONSTRAINT `FKg3a2bbv9e1hx73c2rdil6rt95` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKkucn87edb0tfqjf2da0gwrmbi` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_agents`
--

LOCK TABLES `cm_agents` WRITE;
/*!40000 ALTER TABLE `cm_agents` DISABLE KEYS */;
INSERT INTO `cm_agents` VALUES (1,'广东深圳','腾讯','2020-12-19 17:59:31',1,'马爸爸','10001','test',1,'2020-12-19 17:59:31',1,1);
/*!40000 ALTER TABLE `cm_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_apps`
--

DROP TABLE IF EXISTS `cm_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_apps` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app_download_url` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `app_pkg_name` varchar(255) DEFAULT NULL,
  `app_version` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL,
  `update_by` bigint DEFAULT NULL,
  `max_run_seconds` varchar(255) DEFAULT NULL,
  `app_type` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK49d96catxb9jdakijio7wtqg` (`create_by`),
  KEY `FKkuq9ieu11f13rfoh895e3v3go` (`update_by`),
  CONSTRAINT `FK49d96catxb9jdakijio7wtqg` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKkuq9ieu11f13rfoh895e3v3go` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_apps`
--

LOCK TABLES `cm_apps` WRITE;
/*!40000 ALTER TABLE `cm_apps` DISABLE KEYS */;
INSERT INTO `cm_apps` VALUES (1,'https://softforspeed.51xiazai.cn/down/QQ_PCDownload1100109234.exe','QQ','com.tencent.qq','1.0.0','2020-12-19 17:58:17','test',1,'2020-12-19 17:58:17',1,1,'1800',1),(2,'https://softforspeed.51xiazai.cn/down/QQ_PCDownload1100109234.exe','WeChat','com.tencent.wechat','2.0.0','2020-12-20 17:08:26','test',1,'2020-12-20 17:08:26',1,1,'9000',2);
/*!40000 ALTER TABLE `cm_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_devices`
--

DROP TABLE IF EXISTS `cm_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_devices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `deviceid` varchar(255) DEFAULT NULL,
  `device_name` varchar(255) DEFAULT NULL,
  `device_type` tinyint DEFAULT NULL,
  `is_online` tinyint DEFAULT NULL,
  `register_status` tinyint DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `task_status` tinyint DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL,
  `update_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8v5stsnj3mtswkod25brxywrm` (`create_by`),
  KEY `FK91qckeoh8ew8sbmjcqem2ngbf` (`update_by`),
  CONSTRAINT `FK8v5stsnj3mtswkod25brxywrm` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FK91qckeoh8ew8sbmjcqem2ngbf` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_devices`
--

LOCK TABLES `cm_devices` WRITE;
/*!40000 ALTER TABLE `cm_devices` DISABLE KEYS */;
INSERT INTO `cm_devices` VALUES (1,'2020-12-19 17:57:12','XafF451AF','One Plus 8 Pro',1,1,1,'test',1,1,'2020-12-19 17:57:12',1,1);
/*!40000 ALTER TABLE `cm_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_license`
--

DROP TABLE IF EXISTS `cm_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_license` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `activation_date` datetime DEFAULT NULL,
  `agent` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `invitation_code` varchar(255) DEFAULT NULL,
  `is_used` tinyint DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL,
  `update_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1w3oufmlqeriyr63bued9w2ie` (`create_by`),
  KEY `FK7gcr8cp3eq6csak5u52e4o8a5` (`update_by`),
  CONSTRAINT `FK1w3oufmlqeriyr63bued9w2ie` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FK7gcr8cp3eq6csak5u52e4o8a5` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_license`
--

LOCK TABLES `cm_license` WRITE;
/*!40000 ALTER TABLE `cm_license` DISABLE KEYS */;
INSERT INTO `cm_license` VALUES (1,'2020-12-19 00:00:00','腾讯','2020-12-19 17:58:57','2021-12-19 00:00:00','DSAF45A1',2,'test',1,'2020-12-19 17:58:57',1,1),(2,'2020-12-20 00:00:00','网易','2020-12-20 15:24:26','2021-12-20 00:00:00',NULL,1,'TEST',3,'2020-12-20 15:24:26',1,1),(3,'2020-12-20 00:00:00','网易','2020-12-20 15:29:26','2021-12-20 00:00:00','',2,'TEST',3,'2020-12-20 15:29:26',1,1),(4,'2020-12-20 15:35:15','网易','2020-12-20 15:36:54','2020-12-20 15:35:18','SHD856KJ,DHF987OK,ASD9099L',2,'TEST',3,'2020-12-20 15:36:54',1,1),(5,'2020-12-20 15:54:59','网易','2020-12-20 15:55:47','2021-12-20 00:00:00','GH89SDF3',2,'TEST',1,'2020-12-20 15:55:47',1,1),(6,'2020-12-20 15:54:59','网易','2020-12-20 15:55:47','2021-12-20 00:00:00','ASDFUJ66',2,'TEST',1,'2020-12-20 15:56:24',1,1),(7,'2020-12-20 15:54:59','网易','2020-12-20 15:55:47','2021-12-20 00:00:00','ASDF6577',2,'TEST',1,'2020-12-20 15:56:09',1,1);
/*!40000 ALTER TABLE `cm_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cm_scripts`
--

DROP TABLE IF EXISTS `cm_scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cm_scripts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `script_name` varchar(255) DEFAULT NULL,
  `script_url` varchar(255) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_by` bigint DEFAULT NULL,
  `update_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8u9qlmsm9c7g5hef2y5i1f3co` (`create_by`),
  KEY `FKfjb3fu17fjpfi162qasyxyh9o` (`update_by`),
  CONSTRAINT `FK8u9qlmsm9c7g5hef2y5i1f3co` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKfjb3fu17fjpfi162qasyxyh9o` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cm_scripts`
--

LOCK TABLES `cm_scripts` WRITE;
/*!40000 ALTER TABLE `cm_scripts` DISABLE KEYS */;
INSERT INTO `cm_scripts` VALUES (1,'2020-12-19 18:00:23','test','yellow.js','http://downloadjs.com?js=yellow.js',1,'2020-12-19 18:00:23',1,1);
/*!40000 ALTER TABLE `cm_scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_action_log`
--

DROP TABLE IF EXISTS `sys_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_action_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `type` tinyint DEFAULT NULL COMMENT '日志类型',
  `ipaddr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `clazz` varchar(255) DEFAULT NULL COMMENT '产生日志的类',
  `method` varchar(255) DEFAULT NULL COMMENT '产生日志的方法',
  `model` varchar(255) DEFAULT NULL COMMENT '产生日志的表',
  `record_id` bigint DEFAULT NULL COMMENT '产生日志的数据id',
  `message` text COMMENT '日志消息',
  `create_date` datetime DEFAULT NULL COMMENT '记录时间',
  `oper_name` varchar(255) DEFAULT NULL COMMENT '产生日志的用户昵称',
  `oper_by` bigint DEFAULT NULL COMMENT '产生日志的用户',
  PRIMARY KEY (`id`),
  KEY `FK32gm4dja0jetx58r9dc2uljiu` (`oper_by`),
  CONSTRAINT `FK32gm4dja0jetx58r9dc2uljiu` FOREIGN KEY (`oper_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_action_log`
--

LOCK TABLES `sys_action_log` WRITE;
/*!40000 ALTER TABLE `sys_action_log` DISABLE KEYS */;
INSERT INTO `sys_action_log` VALUES (1,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2019-10-31 15:20:29','超级管理员',1),(2,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2019-10-31 17:51:54','超级管理员',1),(3,'用户管理',1,'127.0.0.1','com.linln.admin.system.controller.UserController','save','sys_user',1,'更新用户成功：admin','2019-10-31 18:04:23','超级管理员',1),(4,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录失败：[admin]用户名或密码错误','2019-11-01 15:36:05','admin',NULL),(5,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录失败：[admin]用户名或密码错误','2019-11-01 15:36:16','admin',NULL),(6,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2019-11-01 15:36:37','超级管理员',1),(7,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2019-11-06 19:51:41','超级管理员',1),(8,'字典管理',1,'127.0.0.1','com.linln.admin.system.controller.DictController','save','sys_dict',4,'更新字典：菜单类型','2019-11-06 20:08:46','超级管理员',1),(9,'用户密码',1,'127.0.0.1','com.linln.admin.system.controller.UserController','editPassword','sys_user',1,'修改用户密码成功admin','2019-11-06 20:09:17','超级管理员',1),(10,'用户密码',1,'127.0.0.1','com.linln.admin.system.controller.UserController','editPassword','sys_user',2,'修改用户密码成功linln','2019-11-06 20:09:17','超级管理员',1),(216,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-13 16:20:19','超级管理员',1),(217,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-13 19:19:43','超级管理员',1),(218,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录失败：[richard]用户名或密码错误','2020-12-19 17:04:23','richard',NULL),(219,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 17:04:37','超级管理员',1),(220,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 17:19:11','超级管理员',1),(221,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 17:38:06','超级管理员',1),(222,'字典管理',1,'127.0.0.1','com.linln.admin.system.controller.DictController','save','sys_dict',7,'添加字典：设备在线状态','2020-12-19 17:50:36','超级管理员',1),(223,'字典管理',1,'127.0.0.1','com.linln.admin.system.controller.DictController','save','sys_dict',8,'添加字典：任务状态','2020-12-19 17:51:23','超级管理员',1),(224,'字典管理',1,'127.0.0.1','com.linln.admin.system.controller.DictController','save','sys_dict',9,'添加字典：注册状态','2020-12-19 17:52:44','超级管理员',1),(225,'字典管理',1,'127.0.0.1','com.linln.admin.system.controller.DictController','save','sys_dict',10,'添加字典：设备类型','2020-12-19 17:53:14','超级管理员',1),(226,'字典管理',1,'127.0.0.1','com.linln.admin.system.controller.DictController','save','sys_dict',11,'添加字典：授权码是否使用','2020-12-19 17:54:40','超级管理员',1),(227,'字典管理',1,'127.0.0.1','com.linln.admin.system.controller.DictController','save','sys_dict',12,'添加字典：代理商等级','2020-12-19 17:56:05','超级管理员',1),(228,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 21:39:49','超级管理员',1),(229,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:00:57','超级管理员',1),(230,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:00:57','超级管理员',1),(231,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:05:19','超级管理员',1),(232,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:09:21','超级管理员',1),(233,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:14:19','超级管理员',1),(234,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:16:00','超级管理员',1),(235,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:21:27','超级管理员',1),(236,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:22:44','超级管理员',1),(237,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:25:57','超级管理员',1),(238,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-19 22:31:37','超级管理员',1),(239,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 14:09:09','超级管理员',1),(240,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 14:53:28','超级管理员',1),(241,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 15:05:33','超级管理员',1),(242,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 15:21:03','超级管理员',1),(243,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 15:21:03','超级管理员',1),(244,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 15:27:32','超级管理员',1),(245,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 15:34:29','超级管理员',1),(246,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 15:54:20','超级管理员',1),(247,'字典管理',1,'127.0.0.1','com.linln.admin.system.controller.DictController','save','sys_dict',13,'添加字典：APP类型','2020-12-20 16:06:26','超级管理员',1),(248,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 16:39:03','超级管理员',1),(249,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 16:42:57','超级管理员',1),(250,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 16:57:19','超级管理员',1),(251,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 17:05:03','超级管理员',1),(252,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 17:13:41','超级管理员',1),(253,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 17:24:25','超级管理员',1),(254,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 17:26:57','超级管理员',1),(255,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 17:28:07','超级管理员',1),(256,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 17:31:17','超级管理员',1),(257,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 17:47:52','超级管理员',1),(258,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 19:36:12','超级管理员',1),(259,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 19:39:13','超级管理员',1),(260,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 21:09:34','超级管理员',1),(261,'用户登录',2,'127.0.0.1','com.linln.admin.system.controller.LoginController','login',NULL,NULL,'后台登录成功','2020-12-20 21:44:12','超级管理员',1);
/*!40000 ALTER TABLE `sys_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `name` varchar(255) DEFAULT NULL COMMENT '字典键名',
  `type` tinyint DEFAULT NULL COMMENT '字典类型',
  `value` text COMMENT '字典键值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint DEFAULT NULL COMMENT '更新用户',
  `status` tinyint DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKag4shuprf2tjot9i1mhh37kk6` (`create_by`),
  KEY `FKoyng5jlifhsme0gc1lwiub0lr` (`update_by`),
  CONSTRAINT `FKag4shuprf2tjot9i1mhh37kk6` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKoyng5jlifhsme0gc1lwiub0lr` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES (1,'数据状态','DATA_STATUS',2,'1:正常,2:冻结,3:删除','','2018-10-05 16:03:11','2018-10-05 16:11:41',1,1,1),(2,'字典类型','DICT_TYPE',2,'2:键值对','','2018-10-05 20:08:55','2019-01-17 23:39:23',1,1,1),(3,'用户性别','USER_SEX',2,'1:男,2:女','','2018-10-05 20:12:32','2018-10-05 20:12:32',1,1,1),(4,'菜单类型','MENU_TYPE',2,'1:目录,2:菜单,3:按钮','','2018-10-05 20:24:57','2019-11-06 20:08:46',1,1,1),(5,'搜索栏状态','SEARCH_STATUS',2,'1:正常,2:冻结','','2018-10-05 20:25:45','2019-02-26 00:34:34',1,1,1),(6,'日志类型','LOG_TYPE',2,'1:业务,2:登录,3:系统','','2018-10-05 20:28:47','2019-02-26 00:31:43',1,1,1),(7,'设备在线状态','DEVICE_ONLINE',2,'1:在线,2:离线','','2020-12-19 17:50:36','2020-12-19 17:50:36',1,1,1),(8,'任务状态','TASK_STATUS',2,'1:等待执行,2:正在执行,3:执行完成','','2020-12-19 17:51:23','2020-12-19 17:51:23',1,1,1),(9,'注册状态','REGIST_STATUS',2,'1:已注册,2:未注册','','2020-12-19 17:52:44','2020-12-19 17:52:44',1,1,1),(10,'设备类型','DEVICE_TYPE',2,'1:安卓,2:苹果','','2020-12-19 17:53:14','2020-12-19 17:53:14',1,1,1),(11,'授权码是否使用','IS_USED',2,'1:是,2:否','','2020-12-19 17:54:40','2020-12-19 17:54:40',1,1,1),(12,'代理商等级','AGENT_LEVEL',2,'1:一级,2:二级,3:三级','','2020-12-19 17:56:05','2020-12-19 17:56:05',1,1,1),(13,'APP类型','APP_TYPE',2,'1:常规,2:区块链','','2020-12-20 16:06:26','2020-12-20 16:06:26',1,1,1);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `mime` varchar(255) DEFAULT NULL COMMENT 'MIME文件类型',
  `size` bigint DEFAULT NULL COMMENT '文件大小',
  `md5` varchar(255) DEFAULT NULL COMMENT 'MD5值',
  `sha1` varchar(255) DEFAULT NULL COMMENT 'SHA1值',
  `create_by` bigint DEFAULT NULL COMMENT '上传者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FKkkles8yp0a156p4247cc22ovn` (`create_by`),
  CONSTRAINT `FKkkles8yp0a156p4247cc22ovn` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (3,'8f3959dd869841849729b87006df332a.jpg','/upload/picture/20201219/8f3959dd869841849729b87006df332a.jpg','image/jpeg',21612,'77c0037987c5e3348700aff541eb423','1ffa0d09252ad2895d90709d2f3897da5031f02a',1,'2020-12-19 17:06:43');
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `pid` bigint DEFAULT NULL COMMENT '父级编号',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有父级编号',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `type` tinyint DEFAULT NULL COMMENT '类型（1:一级菜单,2:子级菜单,3:不是菜单）',
  `sort` int DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint DEFAULT NULL COMMENT '更新用户',
  `status` tinyint DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKoxg2hi96yr9pf2m0stjomr3we` (`create_by`),
  KEY `FKsiko0qcr8ddamvrxf1tk4opgc` (`update_by`),
  CONSTRAINT `FKoxg2hi96yr9pf2m0stjomr3we` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKsiko0qcr8ddamvrxf1tk4opgc` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'菜单管理',2,'[0],[2]','/system/menu/index','system:menu:index','',2,3,'','2018-09-29 00:02:10','2019-02-24 16:10:40',1,1,1),(2,'系统管理',0,'[0]','#','#','fa fa-cog',1,2,'','2018-09-29 00:05:50','2019-02-27 21:34:56',1,1,1),(3,'添加',1,'[0],[2],[1]','/system/menu/add','system:menu:add','',3,1,'','2018-09-29 00:06:57','2019-02-24 16:12:59',1,1,1),(4,'角色管理',2,'[0],[2]','/system/role/index','system:role:index','',2,2,'','2018-09-29 00:08:14','2019-02-24 16:10:34',1,1,1),(5,'添加',4,'[0],[2],[4]','/system/role/add','system:role:add','',3,1,'','2018-09-29 00:09:04','2019-02-24 16:12:04',1,1,1),(6,'主页',0,'[0]','/index','index','layui-icon layui-icon-home',1,1,'','2018-09-29 00:09:56','2019-02-27 21:34:56',1,1,1),(7,'用户管理',2,'[0],[2]','/system/user/index','system:user:index','',2,1,'','2018-09-29 00:43:50','2019-04-05 17:43:25',1,2,1),(8,'编辑',1,'[0],[2],[1]','/system/menu/edit','system:menu:edit','',3,2,'','2018-09-29 00:57:33','2019-02-24 16:13:05',1,1,1),(9,'详细',1,'[0],[2],[1]','/system/menu/detail','system:menu:detail','',3,3,'','2018-09-29 01:03:00','2019-02-24 16:13:12',1,1,1),(10,'修改状态',1,'[0],[2],[1]','/system/menu/status','system:menu:status','',3,4,'','2018-09-29 01:03:43','2019-02-24 16:13:21',1,1,1),(11,'编辑',4,'[0],[2],[4]','/system/role/edit','system:role:edit','',3,2,'','2018-09-29 01:06:13','2019-02-24 16:12:10',1,1,1),(12,'授权',4,'[0],[2],[4]','/system/role/auth','system:role:auth','',3,3,'','2018-09-29 01:06:57','2019-02-24 16:12:17',1,1,1),(13,'详细',4,'[0],[2],[4]','/system/role/detail','system:role:detail','',3,4,'','2018-09-29 01:08:00','2019-02-24 16:12:24',1,1,1),(14,'修改状态',4,'[0],[2],[4]','/system/role/status','system:role:status','',3,5,'','2018-09-29 01:08:22','2019-02-24 16:12:43',1,1,1),(15,'编辑',7,'[0],[2],[7]','/system/user/edit','system:user:edit','',3,2,'','2018-09-29 21:17:17','2019-02-24 16:11:03',1,1,1),(16,'添加',7,'[0],[2],[7]','/system/user/add','system:user:add','',3,1,'','2018-09-29 21:17:58','2019-02-24 16:10:28',1,1,1),(17,'修改密码',7,'[0],[2],[7]','/system/user/pwd','system:user:pwd','',3,3,'','2018-09-29 21:19:40','2019-02-24 16:11:11',1,1,1),(18,'权限分配',7,'[0],[2],[7]','/system/user/role','system:user:role','',3,4,'','2018-09-29 21:20:35','2019-02-24 16:11:18',1,1,1),(19,'详细',7,'[0],[2],[7]','/system/user/detail','system:user:detail','',3,5,'','2018-09-29 21:21:00','2019-02-24 16:11:26',1,1,1),(20,'修改状态',7,'[0],[2],[7]','/system/user/status','system:user:status','',3,6,'','2018-09-29 21:21:18','2019-02-24 16:11:35',1,1,1),(21,'字典管理',2,'[0],[2]','/system/dict/index','system:dict:index','',2,5,'','2018-10-05 00:55:52','2019-02-24 16:14:24',1,1,1),(22,'字典添加',21,'[0],[2],[21]','/system/dict/add','system:dict:add','',3,1,'','2018-10-05 00:56:26','2019-02-24 16:14:10',1,1,1),(23,'字典编辑',21,'[0],[2],[21]','/system/dict/edit','system:dict:edit','',3,2,'','2018-10-05 00:57:08','2019-02-24 16:14:34',1,1,1),(24,'字典详细',21,'[0],[2],[21]','/system/dict/detail','system:dict:detail','',3,3,'','2018-10-05 00:57:42','2019-02-24 16:14:41',1,1,1),(25,'修改状态',21,'[0],[2],[21]','/system/dict/status','system:dict:status','',3,4,'','2018-10-05 00:58:27','2019-02-24 16:14:49',1,1,1),(26,'行为日志',2,'[0],[2]','/system/actionLog/index','system:actionLog:index','',2,6,'','2018-10-14 16:52:01','2019-02-27 21:34:15',1,1,1),(27,'日志详细',26,'[0],[2],[26]','/system/actionLog/detail','system:actionLog:detail','',3,1,'','2018-10-14 21:07:11','2019-02-27 21:34:15',1,1,1),(28,'日志删除',26,'[0],[2],[26]','/system/actionLog/delete','system:actionLog:delete','',3,2,'','2018-10-14 21:08:17','2019-02-27 21:34:15',1,1,1),(30,'开发中心',0,'[0]','#','#','fa fa-gavel',1,3,'','2018-10-19 16:38:23','2019-02-27 21:34:56',1,1,1),(31,'代码生成',30,'[0],[30]','/dev/code','#','',2,1,'','2018-10-19 16:39:04','2019-03-13 17:43:58',1,1,1),(125,'表单构建',30,'[0],[30]','/dev/build','#','',2,2,'','2018-11-25 16:12:23','2019-02-24 16:16:40',1,1,1),(137,'添加',136,'[0],[2],[136]','/system/dept/add','system:dept:add','',3,1,'','2018-12-02 16:33:23','2019-02-24 16:13:34',1,1,1),(138,'编辑',136,'[0],[2],[136]','/system/dept/edit','system:dept:edit','',3,2,'','2018-12-02 16:33:23','2019-02-24 16:13:42',1,1,1),(139,'详细',136,'[0],[2],[136]','/system/dept/detail','system:dept:detail','',3,3,'','2018-12-02 16:33:23','2019-02-24 16:13:49',1,1,1),(140,'改变状态',136,'[0],[2],[136]','/system/dept/status','system:dept:status','',3,4,'','2018-12-02 16:33:23','2019-02-24 16:13:57',1,1,1),(146,'数据接口',30,'[0],[30]','/dev/swagger','#','',2,3,'','2018-12-09 21:11:11','2019-02-24 23:38:18',1,1,1),(147,'云控管理',0,'[0]','#','#','fa fa-globe',1,4,NULL,'2020-12-19 17:36:20','2020-12-19 17:36:21',1,1,1),(148,'设备管理',147,'[0],[147]','/cloud/devices/index','cloud:devices:index',NULL,2,1,NULL,'2020-12-19 17:44:22','2020-12-19 17:44:22',1,1,1),(149,'添加',148,'[0],[147],[148]','/cloud/devices/add','cloud:devices:add',NULL,3,1,NULL,'2020-12-19 17:44:22','2020-12-19 17:44:22',1,1,1),(150,'编辑',148,'[0],[147],[148]','/cloud/devices/edit','cloud:devices:edit',NULL,3,1,NULL,'2020-12-19 17:44:22','2020-12-19 17:44:22',1,1,1),(151,'详细',148,'[0],[147],[148]','/cloud/devices/detail','cloud:devices:detail',NULL,3,1,NULL,'2020-12-19 17:44:22','2020-12-19 17:44:22',1,1,1),(152,'修改状态',148,'[0],[147],[148]','/cloud/devices/status','cloud:devices:status',NULL,3,1,NULL,'2020-12-19 17:44:22','2020-12-19 17:44:22',1,1,1),(153,'APP管理',147,'[0],[147]','/cloud/apps/index','cloud:apps:index',NULL,2,2,NULL,'2020-12-19 17:46:15','2020-12-19 17:46:15',1,1,1),(154,'添加',153,'[0],[147],[153]','/cloud/apps/add','cloud:apps:add',NULL,3,1,NULL,'2020-12-19 17:46:15','2020-12-19 17:46:15',1,1,1),(155,'编辑',153,'[0],[147],[153]','/cloud/apps/edit','cloud:apps:edit',NULL,3,1,NULL,'2020-12-19 17:46:15','2020-12-19 17:46:15',1,1,1),(156,'详细',153,'[0],[147],[153]','/cloud/apps/detail','cloud:apps:detail',NULL,3,1,NULL,'2020-12-19 17:46:15','2020-12-19 17:46:15',1,1,1),(157,'修改状态',153,'[0],[147],[153]','/cloud/apps/status','cloud:apps:status',NULL,3,1,NULL,'2020-12-19 17:46:15','2020-12-19 17:46:15',1,1,1),(158,'授权码管理',147,'[0],[147]','/cloud/license/index','cloud:license:index',NULL,2,3,NULL,'2020-12-19 17:47:36','2020-12-19 17:47:36',1,1,1),(159,'添加',158,'[0],[147],[158]','/cloud/license/add','cloud:license:add',NULL,3,1,NULL,'2020-12-19 17:47:36','2020-12-19 17:47:36',1,1,1),(160,'编辑',158,'[0],[147],[158]','/cloud/license/edit','cloud:license:edit',NULL,3,1,NULL,'2020-12-19 17:47:36','2020-12-19 17:47:36',1,1,1),(161,'详细',158,'[0],[147],[158]','/cloud/license/detail','cloud:license:detail',NULL,3,1,NULL,'2020-12-19 17:47:36','2020-12-19 17:47:36',1,1,1),(162,'修改状态',158,'[0],[147],[158]','/cloud/license/status','cloud:license:status',NULL,3,1,NULL,'2020-12-19 17:47:36','2020-12-19 17:47:36',1,1,1),(163,'代理商管理',147,'[0],[147]','/cloud/agents/index','cloud:agents:index',NULL,2,4,NULL,'2020-12-19 17:48:19','2020-12-19 17:48:19',1,1,1),(164,'添加',163,'[0],[147],[163]','/cloud/agents/add','cloud:agents:add',NULL,3,1,NULL,'2020-12-19 17:48:19','2020-12-19 17:48:19',1,1,1),(165,'编辑',163,'[0],[147],[163]','/cloud/agents/edit','cloud:agents:edit',NULL,3,1,NULL,'2020-12-19 17:48:19','2020-12-19 17:48:19',1,1,1),(166,'详细',163,'[0],[147],[163]','/cloud/agents/detail','cloud:agents:detail',NULL,3,1,NULL,'2020-12-19 17:48:19','2020-12-19 17:48:19',1,1,1),(167,'修改状态',163,'[0],[147],[163]','/cloud/agents/status','cloud:agents:status',NULL,3,1,NULL,'2020-12-19 17:48:19','2020-12-19 17:48:19',1,1,1),(168,'脚本管理',147,'[0],[147]','/cloud/scripts/index','cloud:scripts:index',NULL,2,5,NULL,'2020-12-19 17:48:57','2020-12-19 17:48:57',1,1,1),(169,'添加',168,'[0],[147],[168]','/cloud/scripts/add','cloud:scripts:add',NULL,3,1,NULL,'2020-12-19 17:48:57','2020-12-19 17:48:57',1,1,1),(170,'编辑',168,'[0],[147],[168]','/cloud/scripts/edit','cloud:scripts:edit',NULL,3,1,NULL,'2020-12-19 17:48:57','2020-12-19 17:48:57',1,1,1),(171,'详细',168,'[0],[147],[168]','/cloud/scripts/detail','cloud:scripts:detail',NULL,3,1,NULL,'2020-12-19 17:48:57','2020-12-19 17:48:57',1,1,1),(172,'修改状态',168,'[0],[147],[168]','/cloud/scripts/status','cloud:scripts:status',NULL,3,1,NULL,'2020-12-19 17:48:57','2020-12-19 17:48:57',1,1,1);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) DEFAULT NULL COMMENT '角色名称（中文名）',
  `name` varchar(255) DEFAULT NULL COMMENT '标识名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint DEFAULT NULL COMMENT '创建用户',
  `update_by` bigint DEFAULT NULL COMMENT '更新用户',
  `status` tinyint DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`),
  KEY `FKdkwvv0rm6j3d5l6hwsy2dplol` (`create_by`),
  KEY `FKrouqqi3f2bgc5o83wdstlh6q4` (`update_by`),
  CONSTRAINT `FKdkwvv0rm6j3d5l6hwsy2dplol` FOREIGN KEY (`create_by`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKrouqqi3f2bgc5o83wdstlh6q4` FOREIGN KEY (`update_by`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'管理员','admin','','2018-09-29 00:12:40','2019-01-18 21:09:51',1,1,1),(2,'开发组','group','','2018-09-30 16:04:32','2019-04-28 00:10:00',1,1,1),(3,'用户组','group1','','2018-09-30 16:24:20','2019-04-28 00:11:09',1,1,1);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FKf3mud4qoc7ayew8nml4plkevo` (`menu_id`),
  CONSTRAINT `FKf3mud4qoc7ayew8nml4plkevo` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`),
  CONSTRAINT `FKkeitxsgxwayackgqllio4ohn5` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,1),(3,1),(1,2),(2,2),(3,2),(1,3),(3,3),(1,4),(2,4),(1,5),(2,5),(1,6),(2,6),(3,6),(1,7),(2,7),(1,8),(3,8),(1,9),(3,9),(1,10),(3,10),(1,11),(2,11),(1,12),(2,12),(1,13),(2,13),(1,14),(2,14),(1,15),(2,15),(1,16),(2,16),(1,17),(2,17),(1,18),(2,18),(1,19),(2,19),(1,20),(2,20),(1,21),(3,21),(1,22),(3,22),(1,23),(3,23),(1,24),(3,24),(1,25),(3,25),(1,26),(1,27),(1,28),(1,30),(1,31),(1,125),(1,137),(3,137),(1,138),(3,138),(1,139),(3,139),(1,140),(3,140),(1,146),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `password` char(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '密码盐',
  `picture` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` tinyint DEFAULT NULL COMMENT '性别（1:男,2:女）',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint DEFAULT NULL COMMENT '状态（1:正常,2:冻结,3:删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','超级管理员','5fa04c0758ae596e2a93cd2802640693a5b08bdfacd4307abce323c85e481154','7rl2t9','/upload/picture/20201219/8f3959dd869841849729b87006df332a.jpg',1,'10086@163.com','10086','','2018-08-09 23:00:03','2020-12-19 17:06:44',1),(2,'linln','Richard','28bfc4f19b0d4b8a40018faf9aec4ad9db5491082dda439040b1c35ff8c533a7','gzNkXt',NULL,2,'1008612@qq.com','1008612','','2018-09-30 16:25:22','2019-11-06 20:09:17',1);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`),
  CONSTRAINT `FKb40xxfch70f5qnyfw8yme1n1s` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FKhh52n8vd4ny9ff4x9fb8v65qx` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(2,3);
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

-- Dump completed on 2020-12-20 21:54:15
