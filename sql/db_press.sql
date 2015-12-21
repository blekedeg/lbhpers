-- MySQL dump 10.15  Distrib 10.0.17-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: db_press
-- ------------------------------------------------------
-- Server version	10.0.17-MariaDB

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
-- Table structure for table `core_settings`
--

DROP TABLE IF EXISTS `core_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique - slug` (`slug`),
  KEY `index - slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_settings`
--

LOCK TABLES `core_settings` WRITE;
/*!40000 ALTER TABLE `core_settings` DISABLE KEYS */;
INSERT INTO `core_settings` VALUES ('date_format','g:ia -- m/d/y','g:ia -- m/d/y'),('lang_direction','ltr','ltr'),('status_message','This site has been disabled by a super-administrator.','This site has been disabled by a super-administrator.');
/*!40000 ALTER TABLE `core_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_sites`
--

DROP TABLE IF EXISTS `core_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique ref` (`ref`),
  UNIQUE KEY `Unique domain` (`domain`),
  KEY `ref` (`ref`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_sites`
--

LOCK TABLES `core_sites` WRITE;
/*!40000 ALTER TABLE `core_sites` DISABLE KEYS */;
INSERT INTO `core_sites` VALUES (1,'Default Site','default','localhost',1,1370575337,0);
/*!40000 ALTER TABLE `core_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_users`
--

DROP TABLE IF EXISTS `core_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_users`
--

LOCK TABLES `core_users` WRITE;
/*!40000 ALTER TABLE `core_users` DISABLE KEYS */;
INSERT INTO `core_users` VALUES (1,'blekedeg@gmail.com','c3db809c792921a5a31ccc4d1228bb92b4ddd5ba','3a7fc',1,'',1,'',1370575336,1370575336,'ttg',NULL,NULL);
/*!40000 ALTER TABLE `core_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_alert`
--

DROP TABLE IF EXISTS `default_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_alert` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_alert`
--

LOCK TABLES `default_alert` WRITE;
/*!40000 ALTER TABLE `default_alert` DISABLE KEYS */;
INSERT INTO `default_alert` VALUES (1,'2015-03-13 18:49:00',NULL,1,1,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore','Lorem ipsum dolor sit amet','lorem-ipsum-dolor-sit-amet','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore<br />\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore<br />\r\n​Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore','','',1,1426247340,0,'live','wysiwyg-advanced','','IMG_20150314_015134.jpg'),(2,'2015-03-16 19:11:00','2015-03-16 19:11:00',1,2,'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Duis aute irure dolor in reprehenderit in voluptate velit esse cillum','duis-aute-irure-dolor-in-reprehenderit-in-voluptate-velit-esse-cillum','Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\n<br />\r\n​Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','',1,1426507860,1426507860,'live','wysiwyg-advanced','','IMG_20150317_021217.jpg');
/*!40000 ALTER TABLE `default_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_blog`
--

DROP TABLE IF EXISTS `default_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_blog` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_blog`
--

LOCK TABLES `default_blog` WRITE;
/*!40000 ALTER TABLE `default_blog` DISABLE KEYS */;
INSERT INTO `default_blog` VALUES (3,'2014-10-28 08:31:00','2014-10-28 08:31:00',1,3,'<span style=\"font-size: 13px; line-height: 20.7999992370605px;\">Manado 28 Oktober 2014</span><br style=\"font-size: 13px; line-height: 20.7999992370605px;\" />\r\n<span style=\"font-size: 14px;\">Telah dilaksanakan kegiatan bimbingan teknis penyusunan RP3KP Wilayah Provinsi Sulawesi Utara di Manado, yang diikuti oleh 10 Kabupaten Kota.</span>','Bimbingan Teknis Penyusunan RP3KP Wilayah Sulawesi Utara','bimbingan-teknis-penyusunan-rp3kp-wilayah-sulawesi-utara',0,'<span style=\"font-size:18px;\">Manado 28 Oktober 2015<br />\r\nTelah dilaksanakan kegiatan bimbingan teknis penyusunan RP3KP Wilayah Provinsi Sulawesi Utara di Manado, yang diikuti oleh 10 Kabupaten Kota.</span>','','',1,1414481460,1414481460,'no','live','wysiwyg-advanced',''),(2,'2014-10-16 07:16:00','2014-10-16 07:16:00',1,2,'<img src=\"http://www.kemenpera.go.id/images/news/img_0755.jpg\" style=\"float: left; margin: 0px 10px;\" /><strong>MAKASSAR -</strong>&nbsp;Kemenpera menargetkan penyelesaian masalah backlog perumahan di Indonesia dapat diatasi secara keseluruhan pada tahun 2030 mendatang. Untuk itu diperlukan kerjasama dari berbagai pihak khususnya para pemangku kepentingan bidang perumahan baik pemerintah pusat, pemerintah daerah, pengembang dan masyarakat luas untuk mendukung pelaksanaan program perumahan di seluruh Indonesia.<br />\r\n&quot;Berdasarkan perhitungan dari Kemenpera kami asumsikan tahun 2030 mendatang masalah backlog perumahan bisa diselesaikan,&quot; ujar Kepala Biro Perencanaan Kemenpera Hardi Simamora pada pembukaan kegiatan Rapat Konsultasi Regional Kemenpera Tahun 2014 di Hotel Sahid, Makassar.<br />\r\n<br />\r\n<br />\r\n<br />\r\n&nbsp;','Rakonreg Kemenpera Wilayah Kalimantan Sulawesi','rakonreg-kemenpera-wilayah-kalimantan-sulawesi',1,'<img src=\"http://www.kemenpera.go.id/images/news/img_0755.jpg\" style=\"margin: 0px 10px; float: left;\" /> <strong>MAKASSAR -</strong>&nbsp;Kemenpera menargetkan penyelesaian masalah backlog perumahan di Indonesia dapat diatasi secara keseluruhan pada tahun 2030 mendatang. Untuk itu diperlukan kerjasama dari berbagai pihak khususnya para pemangku kepentingan bidang perumahan baik pemerintah pusat, pemerintah daerah, pengembang dan masyarakat luas untuk mendukung pelaksanaan program perumahan di seluruh Indonesia.<br />\r\n&quot;Berdasarkan perhitungan dari Kemenpera kami asumsikan tahun 2030 mendatang masalah backlog perumahan bisa diselesaikan,&quot; ujar Kepala Biro Perencanaan Kemenpera Hardi Simamora pada pembukaan kegiatan Rapat Konsultasi Regional Kemenpera Tahun 2014 di Hotel Sahid, Makassar.<br />\r\nKegiatan Rakonreg Kemenpera tahun 2014 tersebut dihadiri Staf Ahli Gubernur Sulsel Bidang Pembangunan Abdul Haris serta perwakilan pejabat dari tiap-tiap Kedeputian, Bappenas, Kemendagri serta Bappeda Provinsi, Kepala Dinas Provinsi dan Kabupaten/ Kota yang menangani urusan perumahan dan kawasan permukiman.<br />\r\nMenurut Hardi, Kemenpera sangat mengharapkan dukungan Pemda, pengembang dan masyarakat guna mengatasi masalah backlog perumahan tersebut. Sebab kebutuhan rumah merupakan salah satu kebutuhan pokok masyarakat yang harus dipenuhi dengan baik.<br />\r\nPemerintah, imbuhnya, memperkirakan kebutuhan rumah masyarakat berpenghasilan rendah per tahun mencapai angka 800 ribu unit. Sedangkan kemampuan pemerintah untuk memenuhi pembangunan rumah hanya 200 hingga 300 ribu unit rumah setiap tahunnya.<br />\r\n&quot;Selama ini masih ada kesenjangan antara jumlah kebutuhan rumah masyarakat dan pasokan dari pemerintah dan pengembang. Pemda dalam hal ini diharapkan juga bisa aktif mendorong pembangunan rumah bagi masyarakatnya karena berdasarkan PP Nomor 38 Tahun 2007 masalah perumahan menjadi salah satu urusan wajib Pemda,&quot; terangnya.<br />\r\nAdanya program perumahan yang terlaksana dengan baik di daerah diharapkan dapat menjadi motor pembangunan kesejahteraan dan ekonomi masyarakat. Oleh karena itu, Kemenpera juga terus berupaya agar peran Pemda dalam program pembangunan perumahan bisa lebih diperkuat lagi.&nbsp;<br />\r\n&quot;Kemenpera juga meminta Pemda untuk dapat memastikan rencana lokasi program pembangunan perumahan tahun 2015 mendatang. Selain itu Pemda juga harus mulai mengidentifikasi berapa kebutuhan perumahan bagi masyarakatnya sehingga pemerintab dapat mengetahui secara pasti berapa kekurangan rumah di Indonesia secara keseluruhan,&quot; tandasnya.<br />\r\nSebelumnya, Ketua Panitia Rakonreg Kemenpera Nostra Tarigan mengungkapkan, kegiatan tersebut juga membahasa mengenai pokok-pokok kebijakan perencanaan program perumahan tahun 2015-2019 mendatang. Kegiatan serupa juga dilaksanakan di tiga wilayah yakni Bali, Jakarta dan Batam.<br />\r\n&quot;Kami juga akan membahas usulan kegiatan dari Pemda mulai dari tingkat Provinsi dan Kabupaten/kota yang diselaraskan dengan program dari Kedeputian di Kemenpera sehingga sinergi program pemerintah pusat dan daerah dapat berjalan dengan baik,&quot; harapnya.','','',1,1413414960,1413414960,'no','live','wysiwyg-advanced','');
/*!40000 ALTER TABLE `default_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_blog_categories`
--

DROP TABLE IF EXISTS `default_blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_blog_categories`
--

LOCK TABLES `default_blog_categories` WRITE;
/*!40000 ALTER TABLE `default_blog_categories` DISABLE KEYS */;
INSERT INTO `default_blog_categories` VALUES (1,'aktivitas-rp3kp','Aktivitas RP3KP');
/*!40000 ALTER TABLE `default_blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_ci_sessions`
--

DROP TABLE IF EXISTS `default_ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_ci_sessions`
--

LOCK TABLES `default_ci_sessions` WRITE;
/*!40000 ALTER TABLE `default_ci_sessions` DISABLE KEYS */;
INSERT INTO `default_ci_sessions` VALUES ('03e23b38ba804b360a7c0a928141c779','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411335753,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('af1baac901b284b68a8dee9c35f76651','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1410847530,''),('026fd4043971a843bfb2b3e525e53a2c','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0',1410774761,''),('2fb5eeecd8fdb6aab71cf20221358768','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410698677,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e82fc97bfda3e4037e603844c97401c2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410832831,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9abad201e28a6537eeafbb5ab3c5c5d8','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410664614,''),('4f353e0beeeb3237bf07b5e3aba60e0d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410664459,''),('af9bf5ab5fa1907026419079dc0fd358','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410664241,''),('f2173edfba46fbe0bed63ba1697b6501','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410664243,''),('d0f7684f35a37e74d442cef6801cd267','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410663421,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}'),('4490093abdec1d42b60a691dcc3400a8','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410663214,'a:8:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:32:\"You have logged in successfully.\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}'),('98d516e0cfe896ee2ba776c8d82eb57b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410663180,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}'),('36c774d0f06a7a7a23e800e9d49e071a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410663179,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}'),('da3b18972a3f40bc3dc8e0b7506bbb25','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410663178,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}'),('29032c73a2979ff6594f28499409ddfb','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410663085,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}'),('e9c8b50dfde27e24224bbd72d0d6fa88','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410662429,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a05408b99177d79debcec5dcd943ecfd','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36',1410663175,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:new:success\";s:32:\"You have logged in successfully.\";}'),('2a8083333b7258906402f1cecf612d5b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411326061,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('05b796939ea7922d98609a3e82cd08ed','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411326061,'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),('e5f6e93915a80f812afc7cb94c274d35','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.63',1411415549,''),('55a11ea7ff5bae42fc39128c0226f578','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.63',1411417035,'a:6:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:8:\"username\";s:3:\"ttg\";}'),('f146e10a5308b363b5b9d035d1637da6','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.63',1411488404,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a7ac217902fa73d86773c09b6ebb83e2','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.63',1411500779,''),('532057150306b1ecfb1bc3219811e79d','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.63',1411515969,'a:7:{s:14:\"admin_redirect\";s:25:\"admin/permissions/group/2\";s:8:\"username\";s:6:\"Ghojir\";s:5:\"email\";s:24:\"gho_za_nemoziz@yahoo.com\";s:2:\"id\";s:1:\"2\";s:7:\"user_id\";s:1:\"2\";s:8:\"group_id\";s:1:\"2\";s:5:\"group\";s:4:\"user\";}'),('c785e7029b1b83a170cf4fd4c9e841c9','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.63',1411516007,''),('e6587bd6adad4be375405fddf0b330b2','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.63',1411522900,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('003b930f7af103893ce4269b1f5aa9cd','::1','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36 OPR/18.0.1284.63',1411536902,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('83985badd080fefc97e6c61c1213b481','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411512974,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('18ba9f4217510f86b2e4daa08c9dd188','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411515868,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('0f3edbd8030013e7b77edbeece83ed12','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411516284,''),('e14163c48973f2f744996941288f1d22','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411516365,''),('cd5a044f7a84461aad55906221fe75ee','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411520070,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c383057b3d448c9f7af3a3bf3fe6d8bf','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411642215,''),('4106f057fbe98c839063b20fe4a5a76b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411642206,''),('2e1b8b7ff8b68761bb4fb22022912d84','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411632816,''),('46923ed01b0eec0fdcc0b500f469f06c','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411642027,''),('c4eacc51dc2deb30c9a5277e3f10800d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411642263,''),('7ca310e6cb222a0aad1139a99adb13a3','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411642352,''),('21cf7f3075e1cdc01778c3023efcc843','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411642375,''),('b847b2e4966c64d89b13d6c58d5ca7fe','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411642381,''),('bb5df40c33e69585e391fbabec495e73','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36',1411643949,''),('6cba458b6cc099fac043d4e84241d177','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1411692460,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('1ac5c145fd0f4d7fc99d35543a4b0a79','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412553696,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a8314b3a20e2f4f567d4c5d212cd1093','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412587069,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e3bf5ff668ab12277e6144fc6fba5fda','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856685,''),('d84b7d9dff3a9296708049b8ff549606','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856686,''),('4b163726d719fc88883454871e4ef38d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856686,''),('43b53d3830d40f64897f08b8618938d6','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856686,''),('390668ee5a825f9779a2300414cef62a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856687,''),('307ab06f971971e902269f64dfa4a447','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856687,''),('09f2d46ec662b1a8b1a4859356bc3473','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856688,''),('bb641c6e107a373b69430739bebb35cc','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856688,''),('a48e452b577711679cd1b8b2bf8a54c3','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856688,''),('424732d1b3aff84e8b6bbdb065fb8d03','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856689,''),('1c0c7696f46ea191fa99971e574635dd','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856689,''),('5605a105737add7249b4363deb8a50c8','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856690,''),('147d31665b3d56b7f02d4fa95f989005','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856690,''),('17e2a7c12e18d4a422196053fe0fab61','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856691,''),('eff15a732601eb6b7167bfbd4b2e74e7','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856691,''),('9f485ea5eb81a0cc4c165e1dd6ed29ed','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856691,''),('c220d6badfd9aa4187c2c78c36d2ae9e','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856692,''),('60a7d15fd3111e3ec16b959c0feca776','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856692,''),('cf11dd93c9eac822e78b064e944451b8','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856692,''),('e9dd65a6656c1b5e910b1a22695e7c68','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856693,''),('d6ab8a3ae73fa67e4d20f9e42d854e0c','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856693,''),('050f23c219a8b8033a85c8d9f0ed6958','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856694,''),('0768475354bc7726c4d7a71843371fc4','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856694,''),('4469cffe22bea7dcbc27d1d141cc6da9','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856694,''),('20e5a798c5586d087c390a007b57013f','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412856695,''),('bb2034e83f95fc13a29b2a66e84b0c01','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1412892571,''),('36d4ecf8ce39b244f2f45c1740446003','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413181575,'a:1:{s:14:\"admin_redirect\";s:10:\"admin/blog\";}'),('d00ae5e0521b06ac4801876a490faf95','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413181536,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3771d3b4e88cdda8439068c0b2cb37d6','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413181572,'a:1:{s:14:\"admin_redirect\";s:11:\"admin/pages\";}'),('3a87fc9f58e4f7dbefee86fda1935f86','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413181575,''),('f836bacee8dc73a4151601817cf201aa','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413182732,'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),('fe7b6c6a3eeeff9dc3b2cb14040a42ef','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413184630,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:17:\"flash:old:success\";s:32:\"You have logged in successfully.\";}'),('07ab240bcfedab164690d76715d0af7d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413629972,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('d054947439e5c6e370401a7b147f1ae5','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413629980,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('fa979afc03a91753b16a8218fe1fe3ad','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413630597,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c53cdb9b0a28a54450a9dfe6614608fb','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413630703,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('8a21d55974c9530a4a506259cbf39c86','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413630704,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3d6773ed3485b66c2dd7a2ab823c64cc','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413630705,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3341522d170177f1d96df3ee4841192b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413630706,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('0fa56862b7afa143c9c576ece3ce97b7','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413631020,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('36d309042ff2ed73c13ee6b51b4cfe11','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413631034,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('201e04bf61b8d4b30559fd77dbbdff3f','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413631035,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('7bc6aaae97123ec817f96ac684ebadea','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36',1413834935,''),('3c562e8355962af289ec30f3f3d369be','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414132635,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('9e8827bba9f50e91dc9c3968dbf27a93','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414318313,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('e20a6a5442ad1403abe5202bc1b6a61d','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414358916,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('2d1a59e8d668d72cc83f93cdef326993','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414383693,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('2a6e4192155c1b44f22dc674e593c7bf','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414397489,'a:1:{s:18:\"flash:new:referrer\";s:34:\"news/2014/09/21/peringati-hapernas\";}'),('d28b1cdc7654ae387d0b60355d1a05f7','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414441832,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('856b85539b42651f68f76bf7f46f67b6','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414441836,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c2a64ecb514f07ee73cb4e62145e0c3d','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1415066965,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('cf3cf39a426299435868816eb9bd1e33','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414993476,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('1231b4b0f9bc6b14892c65dcb48bc641','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36',1414919968,''),('ad34a7ab51f21fb384913c63c6a6f7e8','::1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0',1415243797,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('3f89280206d3271d731c80e19009ae0c','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36',1415236369,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('7713c5a8f6b9ae1bdcedff433bc2615d','::1','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0',1415325009,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('e4ad312fda40421c3386fe4dd156a57f','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425065038,''),('9cb63db5bd0f613e4fa24b6d156dcee4','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425065038,''),('eaf2e5cab9315c2052108a0d2af4fabd','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425065038,''),('981e11c6defb066380a04262e9ad7525','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425065038,''),('20e1f30a2e020fdc262a97197fa7130d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425065038,''),('d68556f64704ba037d573d951dae7f0a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425310536,'a:7:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:12:\"user_wilayah\";s:1:\"1\";}'),('9f6102b8a188b18721ecccb0450567a9','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425489371,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('aa33fedb2190e9e743da54f29a4f5e9b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425489371,''),('0cebc90811bf71712f2d846fecf64141','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425489371,''),('f2fb94f90e520365bdc3e41831ed81a7','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425489371,''),('b342df9aa7efcef253147c2a8c97721a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425489371,''),('13076dcf56d7b9b6a46039b5f6e542b6','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425489372,''),('3e700364aaf7c9b96b6665fa805d7a8d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425489372,''),('bb7d95f8392fb3f74eef98b2abceec9e','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425489372,''),('b948fcb8919a6759074f5a3faf0bffa9','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425498466,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('00b077dad7ca3412de1bb2ff737d57ee','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425599820,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('ce4ae1fd359c1518710571b7c0be44e5','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425586346,''),('95c88b85881c9708d2c47d8014119858','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425599820,''),('b8e4476c6c6afd70a666ad2dcd990f3b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425627568,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3476cd3d291dc8c4221c55bfb0b93320','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425714043,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('aa88560ef410bb01605da325b4f61c4b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425742217,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a4d50c0ed21d6b942b26c170d9ddc9ad','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425742217,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a5fd657a80a522e8626fa38df81240bf','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425742218,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9190b862b94a5611bc705316d00692dd','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425742218,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('3210dcca999493eb00c7568755f2890f','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425742218,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c1ad0d735c246c6f2e74674fb325a49b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425742219,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('f21aa0c5658b33ea8d81bc0ac0190ec3','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425742219,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e7d0f831da673fbd1241cb5668610fa2','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425742219,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('36976f66bd38f0b20ac4f24da26300fc','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748801,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c27a93c2318c237a068f543afaa4b809','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748801,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('8a4783e4f240289a6ba0d88bbe97e681','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748801,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6a67a593f96ea773b565c2b331ea1380','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748803,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('2a5649889583a0a243b70b949bc03fd8','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748804,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('654c1876fdfbd2ea004e547be6230ccd','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748806,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('41017c17054f0843e9b2ac1a5f3bb75c','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748807,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('18f1a94cd69bfdda31f29d960bcf2352','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748809,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('65ac6a834a1d8f045c68d8feacd4049f','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425748810,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('174aa1671815c4025abe332ea4f66b30','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425751226,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a2e4e86aea3a5b0ce017eb864953931c','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754236,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('70ac260a48c1643b6bc519a8ee67313d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754237,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('e66aa1687a4d712bc8bcdf45fa6e1133','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754237,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('1ea5d5fe9ff6e965599be44df1a6f09f','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754237,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('391cd9924639df91ab19390516ad7267','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754238,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('46f732e193e358a0c858c4138ccfb1a8','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754238,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('cdf1806d58b5d228ff39619f63c7dbda','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754239,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('51217e418c8ec30ce32ece8b5e29c052','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754239,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a45ffce9231d1d933d4bfe2b0368d913','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425754239,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('9d7c56a772b9947787cb48c43dc515e9','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425755175,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('a84c2b00263935e35f8a29b3a2d8c45c','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425755175,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('0096a4be00f1ab81c22c8abd16cf0c7d','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425755175,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('676933db3bf8fa4a144d5019f194ee4a','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1426032279,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('dbbe42a899c5a46361a94956bad81c4e','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1426133623,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('8c2b98ea3f6a529ccb3dc87bfb834cf4','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1425910303,'a:1:{s:14:\"admin_redirect\";s:5:\"admin\";}'),('e4837ab26db678bd8e69170e5e97bea2','127.0.0.1','Lynx/2.8.7rel.1 libwww-FM/2.14 SSL-MM/1.4.1 OpenSSL/1.0.1k',1425975114,''),('6bcca16f14504b9a1d3ec7bc2ad4e2a0','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1426148906,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('c744e6a9e5fa299346e879387f917fe1','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36',1426151154,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('cba403f9a24079452e0e6df2bbb4d623','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36',1426244265,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('6b7c4d959c1325bced74da55c2094654','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36',1426244268,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('52f39f1687299d08a0ff7087aa64f6a5','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36',1426256354,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('72c475e74699d13d9cd7dbb627754589','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36',1426514817,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('4b8a81b212fa22887334f015aa6df47b','127.0.0.1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36',1426767974,'a:8:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";s:18:\"flash:old:referrer\";s:47:\"program/1/2015/03/21/lorem-ipsum-dolor-sit-amet\";s:18:\"flash:new:referrer\";s:47:\"program/1/2015/03/21/lorem-ipsum-dolor-sit-amet\";}'),('67e8f0334a569fabf6c97b2ca6921d6f','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1450329282,'a:6:{s:8:\"username\";s:3:\"ttg\";s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}'),('cb520e52deabed6634e7ad27fa9c5f53','::1','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36',1450395171,'a:5:{s:5:\"email\";s:18:\"blekedeg@gmail.com\";s:2:\"id\";s:1:\"1\";s:7:\"user_id\";s:1:\"1\";s:8:\"group_id\";s:1:\"1\";s:5:\"group\";s:5:\"admin\";}');
/*!40000 ALTER TABLE `default_ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_comment_blacklists`
--

DROP TABLE IF EXISTS `default_comment_blacklists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_comment_blacklists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_comment_blacklists`
--

LOCK TABLES `default_comment_blacklists` WRITE;
/*!40000 ALTER TABLE `default_comment_blacklists` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_comment_blacklists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_comments`
--

DROP TABLE IF EXISTS `default_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `entry_title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_comments`
--

LOCK TABLES `default_comments` WRITE;
/*!40000 ALTER TABLE `default_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_contact_log`
--

DROP TABLE IF EXISTS `default_contact_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_contact_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_contact_log`
--

LOCK TABLES `default_contact_log` WRITE;
/*!40000 ALTER TABLE `default_contact_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_contact_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_field_assignments`
--

DROP TABLE IF EXISTS `default_data_field_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_field_assignments`
--

LOCK TABLES `default_data_field_assignments` WRITE;
/*!40000 ALTER TABLE `default_data_field_assignments` DISABLE KEYS */;
INSERT INTO `default_data_field_assignments` VALUES (17,1,11,17,'yes','no',NULL,NULL),(2,1,2,2,'no','no',NULL,NULL),(3,1,3,3,'yes','no',NULL,NULL),(4,2,4,4,'yes','no',NULL,NULL),(5,3,3,5,'no','no',NULL,NULL),(6,4,3,6,'no','no',NULL,NULL),(7,5,3,7,'no','no',NULL,NULL),(8,6,3,8,'no','no',NULL,NULL),(9,7,3,9,'no','no',NULL,NULL),(10,8,3,10,'no','no',NULL,NULL),(11,9,3,11,'no','no',NULL,NULL),(12,10,3,12,'no','no',NULL,NULL),(13,11,3,13,'no','no',NULL,NULL),(14,12,3,14,'no','no',NULL,NULL),(15,13,3,15,'no','no',NULL,NULL),(16,14,3,16,'no','no',NULL,NULL),(18,1,13,18,'yes','no',NULL,NULL);
/*!40000 ALTER TABLE `default_data_field_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_fields`
--

DROP TABLE IF EXISTS `default_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_fields`
--

LOCK TABLES `default_data_fields` WRITE;
/*!40000 ALTER TABLE `default_data_fields` DISABLE KEYS */;
INSERT INTO `default_data_fields` VALUES (17,'lang:news:intro_label','intro','news','wysiwyg','a:2:{s:11:\"editor_type\";s:6:\"simple\";s:10:\"allow_tags\";s:1:\"y\";}',NULL,'no'),(2,'lang:pages:body_label','body','pages','wysiwyg','a:2:{s:11:\"editor_type\";s:8:\"advanced\";s:10:\"allow_tags\";s:1:\"y\";}',NULL,'no'),(3,'lang:user:first_name_label','first_name','users','text','a:2:{s:10:\"max_length\";i:50;s:13:\"default_value\";N;}',NULL,'no'),(4,'lang:user:last_name_label','last_name','users','text','a:2:{s:10:\"max_length\";i:50;s:13:\"default_value\";N;}',NULL,'no'),(5,'lang:profile_company','company','users','text','a:2:{s:10:\"max_length\";i:100;s:13:\"default_value\";N;}',NULL,'no'),(6,'lang:profile_bio','bio','users','textarea','a:3:{s:12:\"default_text\";N;s:10:\"allow_tags\";N;s:12:\"content_type\";N;}',NULL,'no'),(7,'lang:user:lang','lang','users','pyro_lang','a:1:{s:12:\"filter_theme\";s:3:\"yes\";}',NULL,'no'),(8,'lang:profile_dob','dob','users','datetime','a:5:{s:8:\"use_time\";s:2:\"no\";s:10:\"start_date\";s:5:\"-100Y\";s:8:\"end_date\";N;s:7:\"storage\";s:4:\"unix\";s:10:\"input_type\";s:8:\"dropdown\";}',NULL,'no'),(9,'lang:profile_gender','gender','users','choice','a:5:{s:11:\"choice_data\";s:34:\" : Not Telling\nm : Male\nf : Female\";s:11:\"choice_type\";s:8:\"dropdown\";s:13:\"default_value\";N;s:11:\"min_choices\";N;s:11:\"max_choices\";N;}',NULL,'no'),(10,'lang:profile_phone','phone','users','text','a:2:{s:10:\"max_length\";i:20;s:13:\"default_value\";N;}',NULL,'no'),(11,'lang:profile_mobile','mobile','users','text','a:2:{s:10:\"max_length\";i:20;s:13:\"default_value\";N;}',NULL,'no'),(12,'lang:profile_address_line1','address_line1','users','text','a:2:{s:10:\"max_length\";N;s:13:\"default_value\";N;}',NULL,'no'),(13,'lang:profile_address_line2','address_line2','users','text','a:2:{s:10:\"max_length\";N;s:13:\"default_value\";N;}',NULL,'no'),(14,'lang:profile_address_line3','address_line3','users','text','a:2:{s:10:\"max_length\";N;s:13:\"default_value\";N;}',NULL,'no'),(15,'lang:profile_address_postcode','postcode','users','text','a:2:{s:10:\"max_length\";i:20;s:13:\"default_value\";N;}',NULL,'no'),(16,'lang:profile_website','website','users','url',NULL,NULL,'no'),(18,'lang:alert:intro_label','intro','alert','wysiwyg','a:2:{s:11:\"editor_type\";s:6:\"simple\";s:10:\"allow_tags\";s:1:\"y\";}',NULL,'no');
/*!40000 ALTER TABLE `default_data_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_data_streams`
--

DROP TABLE IF EXISTS `default_data_streams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_data_streams` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_data_streams`
--

LOCK TABLES `default_data_streams` WRITE;
/*!40000 ALTER TABLE `default_data_streams` DISABLE KEYS */;
INSERT INTO `default_data_streams` VALUES (11,'lang:news:news_title','news','news',NULL,NULL,'a:2:{i:0;s:2:\"id\";i:1;s:7:\"created\";}',NULL,'title',NULL,'no',NULL),(2,'Default','def_page_fields','pages',NULL,'A simple page type with a WYSIWYG editor that will get you started adding content.','a:2:{i:0;s:2:\"id\";i:1;s:7:\"created\";}',NULL,'title',NULL,'no',NULL),(3,'lang:user_profile_fields_label','profiles','users',NULL,'Profiles for users module','a:1:{i:0;s:12:\"display_name\";}','display_name','title',NULL,'no',NULL),(4,'lang:news:news_title','news_','news_',NULL,NULL,'',NULL,'title',NULL,'no',NULL),(10,'lang:program:program_title','program','programs',NULL,NULL,'a:2:{i:0;s:2:\"id\";i:1;s:7:\"created\";}',NULL,'title',NULL,'no',NULL),(12,'lang:kasus:kasus_title','kasus','kasus',NULL,NULL,'a:2:{i:0;s:2:\"id\";i:1;s:7:\"created\";}',NULL,'title',NULL,'no',NULL),(13,'lang:alert:alert_title','alert','alert',NULL,NULL,'a:2:{i:0;s:2:\"id\";i:1;s:7:\"created\";}',NULL,'title',NULL,'no',NULL);
/*!40000 ALTER TABLE `default_data_streams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_def_page_fields`
--

DROP TABLE IF EXISTS `default_def_page_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_def_page_fields` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_def_page_fields`
--

LOCK TABLES `default_def_page_fields` WRITE;
/*!40000 ALTER TABLE `default_def_page_fields` DISABLE KEYS */;
INSERT INTO `default_def_page_fields` VALUES (1,'2013-06-07 11:22:20','2014-10-22 22:30:51',1,NULL,'<h3>Selamat&nbsp; Datang di Klinik RP3KP</h3>\r\n\r\n<p>Klinik ini bertujuan untuk memberikan layanan / konsultasi dalam penyusunan RP3KP.</p>\r\n\r\n<p>Kemenpera mengundang pemangku kepentingan untuk memanfaatkan layanan klinik ini.</p>\r\n'),(2,'2013-06-07 11:22:20','2015-03-04 19:57:29',1,NULL,'<span style=\"font-size:20px;\">Asdep Perencanaan Pengembangan Kawasan<br />\r\nDeputi Bidang Pengembangan Kawasan<br />\r\n<br />\r\nJl. Raden Patah I/1, Lt. 6 Wing 3<br />\r\nKebayoran Baru-Jakarta Selatan<br />\r\nTelp/Fax (021) 72788108&nbsp;<br />\r\nKode Pos 12110<br />\r\n<br />\r\nEmail: asdepppk@yahoo.co.id</span>'),(3,'2013-06-07 11:22:20',NULL,1,NULL,'{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}'),(4,'2013-06-07 11:22:20',NULL,1,NULL,'{{ search:form class=\"search-form\" }} \n		<input name=\"q\" placeholder=\"Search terms...\" />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for \"{{ query }}\".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href=\"{{ url }}\">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}'),(5,'2013-06-07 11:22:20',NULL,1,NULL,'<p>We cannot find the page you are looking for, please click <a title=\"Home\" href=\"{{ pages:url id=\'1\' }}\">here</a> to go to the homepage.</p>'),(6,'2014-09-11 21:45:15','2015-03-04 18:58:51',1,1,NULL),(17,'2015-03-04 19:32:09',NULL,1,10,NULL),(18,'2015-03-04 19:35:14','2015-03-04 19:38:28',1,11,NULL),(19,'2015-03-04 19:46:39','2015-03-04 19:46:54',1,12,NULL),(20,'2015-03-04 19:48:19',NULL,1,13,NULL),(21,'2015-03-04 19:49:25',NULL,1,14,NULL),(22,'2015-03-04 19:51:03',NULL,1,15,NULL),(23,'2015-03-04 19:51:41',NULL,1,16,NULL),(24,'2015-03-04 19:52:16',NULL,1,17,NULL),(25,'2015-03-04 19:52:44',NULL,1,18,NULL),(26,'2015-03-04 19:53:22',NULL,1,19,NULL),(27,'2015-03-04 19:53:46',NULL,1,20,NULL),(7,'2014-09-12 03:53:15','2015-03-04 19:06:35',1,2,NULL),(8,'2014-09-12 04:03:23','2015-03-04 19:19:18',1,3,NULL),(11,'2014-09-12 14:08:52','2015-03-04 19:21:28',1,4,NULL),(12,'2014-09-12 16:29:04','2015-03-04 19:24:22',1,5,'dfasfasf'),(13,'2014-09-16 04:26:57','2015-03-04 19:24:55',1,6,'loewm ipsum dolor <!--?php echo time() ?-->'),(14,'2014-09-16 04:29:21','2015-03-04 19:26:30',1,7,'lorem ipsum dolor sit amet'),(15,'2014-09-16 04:30:14','2015-03-04 19:27:11',1,8,'lorem ipsum dolor sit amet'),(16,'2014-09-16 04:32:02','2015-03-04 19:29:42',1,9,NULL);
/*!40000 ALTER TABLE `default_def_page_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_download`
--

DROP TABLE IF EXISTS `default_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_download`
--

LOCK TABLES `default_download` WRITE;
/*!40000 ALTER TABLE `default_download` DISABLE KEYS */;
INSERT INTO `default_download` VALUES (1,'test ajah','test-ajah_cover_20151217_180048.png','test-ajah_file_20151217_180048.pdf',0,'2015-12-17 15:07:29',1,'2015-12-18 10:57:47',1),(2,'Formulir Pengaduan','formulir-pengaduan_cover_20151218_110238.png','lorem-ipsum-dolor-sit-amet_file_20151217_180500.pdf',1,'2015-12-17 18:05:00',1,'2015-12-18 11:02:38',1);
/*!40000 ALTER TABLE `default_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_email_templates`
--

DROP TABLE IF EXISTS `default_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_lang` (`slug`,`lang`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_email_templates`
--

LOCK TABLES `default_email_templates` WRITE;
/*!40000 ALTER TABLE `default_email_templates` DISABLE KEYS */;
INSERT INTO `default_email_templates` VALUES (1,'comments','Comment Notification','Email that is sent to admin when someone creates a comment','You have just received a comment from {{ name }}','<h3>You have received a comment from {{ name }}</h3>\n				<p>\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}<br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>\n				<p>{{ comment }}</p>\n				<p>View Comment: {{ redirect_url }}</p>','en',1,'comments'),(2,'contact','Contact Notification','Template for the contact form','{{ settings:site_name }} :: {{ subject }}','This message was sent via the contact form on with the following details:\n				<hr />\n				IP Address: {{ sender_ip }}\n				OS {{ sender_os }}\n				Agent {{ sender_agent }}\n				<hr />\n				{{ message }}\n\n				{{ name }},\n\n				{{ email }}','en',1,'pages'),(3,'registered','New User Registered','Email sent to the site contact e-mail when a new user registers','{{ settings:site_name }} :: You have just received a registration from {{ name }}','<h3>You have received a registration from {{ name }}</h3>\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}</strong><br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>','en',1,'users'),(4,'activation','Activation Email','The email which contains the activation code that is sent to a new user','{{ settings:site_name }} - Account Activation','<p>Hello {{ user:first_name }},</p>\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n				<p><a href=\"{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}\">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n				<p>&nbsp;</p>\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n				<p><a href=\"{{ url:site }}users/activate\">{{ url:site }}users/activate</a></p>\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>','en',1,'users'),(5,'forgotten_password','Forgotten Password Email','The email that is sent containing a password reset code','{{ settings:site_name }} - Forgotten Password','<p>Hello {{ user:first_name }},</p>\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href=\"{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}\">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>','en',1,'users'),(6,'new_password','New Password Email','After a password is reset this email is sent containing the new password','{{ settings:site_name }} - New Password','<p>Hello {{ user:first_name }},</p>\n				<p>Your new password is: {{ new_password }}</p>\n				<p>After logging in you may change your password by visiting <a href=\"{{ url:site }}edit-profile\">{{ url:site }}edit-profile</a></p>','en',1,'users');
/*!40000 ALTER TABLE `default_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_eventcal`
--

DROP TABLE IF EXISTS `default_eventcal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_eventcal` (
  `id_eventcal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `event_date_begin` datetime DEFAULT NULL,
  `event_date_end` datetime DEFAULT NULL,
  `event_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_content` text COLLATE utf8_unicode_ci,
  `event_repeat` smallint(1) DEFAULT '0',
  `event_repeat_prm` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `privacy` enum('public','private') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'public',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_eventcal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_eventcal`
--

LOCK TABLES `default_eventcal` WRITE;
/*!40000 ALTER TABLE `default_eventcal` DISABLE KEYS */;
INSERT INTO `default_eventcal` VALUES (1,1,'2015-03-07 20:10:00','2015-03-31 00:00:00','Lorem dolor consectetur elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elementum molestie urna, id scelerisque leo sodales sit amet. Curabitur volutpat lorem euismod nunc tincidunt condimentum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed elementum molestie urna.',1,'{\"type\":\"2\",\"minute\":\"0\",\"time\":\"0\",\"day\":\"0\",\"date\":\"1\"}','public','IMG_20150309_223058.jpg'),(2,1,'2015-03-11 15:33:00','2015-03-31 00:00:00','hahahaha','test ajah',1,'{\"type\":\"0\",\"minute\":\"0\",\"time\":\"0\",\"day\":\"0\",\"date\":\"1\"}','public',NULL);
/*!40000 ALTER TABLE `default_eventcal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_file_folders`
--

DROP TABLE IF EXISTS `default_file_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_file_folders`
--

LOCK TABLES `default_file_folders` WRITE;
/*!40000 ALTER TABLE `default_file_folders` DISABLE KEYS */;
INSERT INTO `default_file_folders` VALUES (1,0,'public','public','local','',1370558956,1370558956,0),(3,0,'test','test','local','',1425743685,1425743685,0);
/*!40000 ALTER TABLE `default_file_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_files`
--

DROP TABLE IF EXISTS `default_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_files` (
  `id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_files`
--

LOCK TABLES `default_files` WRITE;
/*!40000 ALTER TABLE `default_files` DISABLE KEYS */;
INSERT INTO `default_files` VALUES ('d096e8f323283aa',1,1,'i','5453a3db41d26.jpg','0e9d74e2607dd9e551277b9406fb08d1.jpg','{{ url:site }}files/large/0e9d74e2607dd9e551277b9406fb08d1.jpg','','.jpg','image/jpeg','',350,350,29,'',0,1425743529,0),('d3d49656cb90ae5',1,1,'i','3281.jpg','cafb2e342495cd865948940e1de8a141.jpg','{{ url:site }}files/large/cafb2e342495cd865948940e1de8a141.jpg','','.jpg','image/jpeg','',1024,576,161,'',0,1425743605,0),('661fe4b880078b6',3,1,'i','4688.jpg','394d1bb93b85b5e44c9b830ad5d431b6.jpg','{{ url:site }}files/large/394d1bb93b85b5e44c9b830ad5d431b6.jpg','','.jpg','image/jpeg','',960,600,57,'',0,1425743748,0);
/*!40000 ALTER TABLE `default_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_gallery`
--

DROP TABLE IF EXISTS `default_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_gallery`
--

LOCK TABLES `default_gallery` WRITE;
/*!40000 ALTER TABLE `default_gallery` DISABLE KEYS */;
INSERT INTO `default_gallery` VALUES (1,NULL,'Lorem ipsum dolor sit amet','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','IMG_20150314_034317.jpg',1,'2015-03-12 23:06:10',1,'2015-03-14 03:43:17',1),(2,NULL,'Lorem ipsum dolor sit amet hehehe','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','IMG_20150314_031851.jpg',1,'2015-03-12 23:10:38',1,'2015-03-14 03:18:51',1);
/*!40000 ALTER TABLE `default_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_gallery_categories`
--

DROP TABLE IF EXISTS `default_gallery_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_gallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_gallery_categories`
--

LOCK TABLES `default_gallery_categories` WRITE;
/*!40000 ALTER TABLE `default_gallery_categories` DISABLE KEYS */;
INSERT INTO `default_gallery_categories` VALUES (1,'gathering','Gathering');
/*!40000 ALTER TABLE `default_gallery_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_groups`
--

DROP TABLE IF EXISTS `default_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_groups`
--

LOCK TABLES `default_groups` WRITE;
/*!40000 ALTER TABLE `default_groups` DISABLE KEYS */;
INSERT INTO `default_groups` VALUES (1,'admin','Administrator'),(2,'user','User');
/*!40000 ALTER TABLE `default_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_kasus`
--

DROP TABLE IF EXISTS `default_kasus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_kasus` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_desc` text COLLATE utf8_unicode_ci,
  `long_desc` text COLLATE utf8_unicode_ci,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_kasus`
--

LOCK TABLES `default_kasus` WRITE;
/*!40000 ALTER TABLE `default_kasus` DISABLE KEYS */;
INSERT INTO `default_kasus` VALUES (1,'2015-03-13 18:05:21',NULL,1,1,1,'Lorem ipsum dolor sit amet hehehe','lorem-ipsum-dolor-sit-amet-hehehe','Lorem ipsum kolor si memet melorot mulu jadi repot deh','<span  13px; line-height: 20.7999992370605px;\">Lorem ipsum kolor si memet melorot mulu jadi repot deh<br />\r\nLorem ipsum kolor si memet melorot mulu jadi repot deh</span>','2015-03-13 18:05:21',NULL,NULL,1,'IMG_20150314_010521.jpg'),(2,'2015-03-16 18:52:24',NULL,1,2,2,'Duis aute irure dolor in reprehenderit in voluptate','duis-aute-irure-dolor-in-reprehenderit-in-voluptate','Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2015-03-16 18:52:24',NULL,NULL,1,'IMG_20150317_015224.jpg');
/*!40000 ALTER TABLE `default_kasus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_kasus_categories`
--

DROP TABLE IF EXISTS `default_kasus_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_kasus_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_kasus_categories`
--

LOCK TABLES `default_kasus_categories` WRITE;
/*!40000 ALTER TABLE `default_kasus_categories` DISABLE KEYS */;
INSERT INTO `default_kasus_categories` VALUES (1,'perdata','Perdata'),(2,'pidana','Pidana'),(3,'tun','TUN'),(4,'phs','PHS');
/*!40000 ALTER TABLE `default_kasus_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_keywords`
--

DROP TABLE IF EXISTS `default_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_keywords`
--

LOCK TABLES `default_keywords` WRITE;
/*!40000 ALTER TABLE `default_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_keywords_applied`
--

DROP TABLE IF EXISTS `default_keywords_applied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_keywords_applied`
--

LOCK TABLES `default_keywords_applied` WRITE;
/*!40000 ALTER TABLE `default_keywords_applied` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_keywords_applied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_migrations`
--

DROP TABLE IF EXISTS `default_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_migrations`
--

LOCK TABLES `default_migrations` WRITE;
/*!40000 ALTER TABLE `default_migrations` DISABLE KEYS */;
INSERT INTO `default_migrations` VALUES (125);
/*!40000 ALTER TABLE `default_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_modules`
--

DROP TABLE IF EXISTS `default_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_modules`
--

LOCK TABLES `default_modules` WRITE;
/*!40000 ALTER TABLE `default_modules` DISABLE KEYS */;
INSERT INTO `default_modules` VALUES (1,'a:25:{s:2:\"en\";s:8:\"Settings\";s:2:\"ar\";s:18:\"الإعدادات\";s:2:\"br\";s:15:\"Configurações\";s:2:\"pt\";s:15:\"Configurações\";s:2:\"cs\";s:10:\"Nastavení\";s:2:\"da\";s:13:\"Indstillinger\";s:2:\"de\";s:13:\"Einstellungen\";s:2:\"el\";s:18:\"Ρυθμίσεις\";s:2:\"es\";s:15:\"Configuraciones\";s:2:\"fa\";s:14:\"تنظیمات\";s:2:\"fi\";s:9:\"Asetukset\";s:2:\"fr\";s:11:\"Paramètres\";s:2:\"he\";s:12:\"הגדרות\";s:2:\"id\";s:10:\"Pengaturan\";s:2:\"it\";s:12:\"Impostazioni\";s:2:\"lt\";s:10:\"Nustatymai\";s:2:\"nl\";s:12:\"Instellingen\";s:2:\"pl\";s:10:\"Ustawienia\";s:2:\"ru\";s:18:\"Настройки\";s:2:\"sl\";s:10:\"Nastavitve\";s:2:\"tw\";s:12:\"網站設定\";s:2:\"cn\";s:12:\"网站设定\";s:2:\"hu\";s:14:\"Beállítások\";s:2:\"th\";s:21:\"ตั้งค่า\";s:2:\"se\";s:14:\"Inställningar\";}','settings','1.0.0',NULL,'a:25:{s:2:\"en\";s:89:\"Allows administrators to update settings like Site Name, messages and email address, etc.\";s:2:\"ar\";s:161:\"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.\";s:2:\"br\";s:120:\"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.\";s:2:\"pt\";s:113:\"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.\";s:2:\"cs\";s:102:\"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.\";s:2:\"da\";s:90:\"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.\";s:2:\"de\";s:92:\"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.\";s:2:\"el\";s:230:\"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.\";s:2:\"es\";s:131:\"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.\";s:2:\"fa\";s:105:\"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود\";s:2:\"fi\";s:105:\"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.\";s:2:\"fr\";s:118:\"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.\";s:2:\"he\";s:116:\"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו\";s:2:\"id\";s:112:\"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.\";s:2:\"it\";s:109:\"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.\";s:2:\"lt\";s:104:\"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.\";s:2:\"nl\";s:114:\"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.\";s:2:\"pl\";s:103:\"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.\";s:2:\"ru\";s:135:\"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.\";s:2:\"sl\";s:98:\"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.\";s:2:\"tw\";s:99:\"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。\";s:2:\"cn\";s:99:\"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。\";s:2:\"hu\";s:125:\"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...\";s:2:\"th\";s:232:\"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น\";s:2:\"se\";s:84:\"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.\";}',1,0,1,'settings',1,1,1,1450336686),(2,'a:11:{s:2:\"en\";s:12:\"Streams Core\";s:2:\"pt\";s:14:\"Núcleo Fluxos\";s:2:\"fr\";s:10:\"Noyau Flux\";s:2:\"el\";s:23:\"Πυρήνας Ροών\";s:2:\"se\";s:18:\"Streams grundmodul\";s:2:\"tw\";s:14:\"Streams 核心\";s:2:\"cn\";s:14:\"Streams 核心\";s:2:\"ar\";s:31:\"الجداول الأساسية\";s:2:\"it\";s:12:\"Streams Core\";s:2:\"fa\";s:26:\"هسته استریم ها\";s:2:\"fi\";s:13:\"Striimit ydin\";}','streams_core','1.0.0',NULL,'a:11:{s:2:\"en\";s:29:\"Core data module for streams.\";s:2:\"pt\";s:37:\"Módulo central de dados para fluxos.\";s:2:\"fr\";s:32:\"Noyau de données pour les Flux.\";s:2:\"el\";s:113:\"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.\";s:2:\"se\";s:50:\"Streams grundmodul för enklare hantering av data.\";s:2:\"tw\";s:29:\"Streams 核心資料模組。\";s:2:\"cn\";s:29:\"Streams 核心资料模组。\";s:2:\"ar\";s:57:\"وحدة البيانات الأساسية للجداول\";s:2:\"it\";s:17:\"Core dello Stream\";s:2:\"fa\";s:48:\"ماژول مرکزی برای استریم ها\";s:2:\"fi\";s:48:\"Ydin datan hallinoiva moduuli striimejä varten.\";}',1,0,0,'0',1,1,1,1450336686),(3,'a:21:{s:2:\"en\";s:15:\"Email Templates\";s:2:\"ar\";s:48:\"قوالب الرسائل الإلكترونية\";s:2:\"br\";s:17:\"Modelos de e-mail\";s:2:\"pt\";s:17:\"Modelos de e-mail\";s:2:\"da\";s:16:\"Email skabeloner\";s:2:\"el\";s:22:\"Δυναμικά email\";s:2:\"es\";s:19:\"Plantillas de email\";s:2:\"fa\";s:26:\"قالب های ایمیل\";s:2:\"fr\";s:17:\"Modèles d\'emails\";s:2:\"he\";s:12:\"תבניות\";s:2:\"id\";s:14:\"Template Email\";s:2:\"lt\";s:22:\"El. laiškų šablonai\";s:2:\"nl\";s:15:\"Email sjablonen\";s:2:\"ru\";s:25:\"Шаблоны почты\";s:2:\"sl\";s:14:\"Email predloge\";s:2:\"tw\";s:12:\"郵件範本\";s:2:\"cn\";s:12:\"邮件范本\";s:2:\"hu\";s:15:\"E-mail sablonok\";s:2:\"fi\";s:25:\"Sähköposti viestipohjat\";s:2:\"th\";s:33:\"แม่แบบอีเมล\";s:2:\"se\";s:12:\"E-postmallar\";}','templates','1.1.0',NULL,'a:21:{s:2:\"en\";s:46:\"Create, edit, and save dynamic email templates\";s:2:\"ar\";s:97:\"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.\";s:2:\"br\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"pt\";s:51:\"Criar, editar e salvar modelos de e-mail dinâmicos\";s:2:\"da\";s:49:\"Opret, redigér og gem dynamiske emailskabeloner.\";s:2:\"el\";s:108:\"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.\";s:2:\"es\";s:54:\"Crear, editar y guardar plantillas de email dinámicas\";s:2:\"fa\";s:92:\"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا\";s:2:\"fr\";s:61:\"Créer, éditer et sauver dynamiquement des modèles d\'emails\";s:2:\"he\";s:54:\"ניהול של תבניות דואר אלקטרוני\";s:2:\"id\";s:55:\"Membuat, mengedit, dan menyimpan template email dinamis\";s:2:\"lt\";s:58:\"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.\";s:2:\"nl\";s:49:\"Maak, bewerk, en beheer dynamische emailsjablonen\";s:2:\"ru\";s:127:\"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны\";s:2:\"sl\";s:52:\"Ustvari, uredi in shrani spremenljive email predloge\";s:2:\"tw\";s:61:\"新增、編輯與儲存可顯示動態資料的 email 範本\";s:2:\"cn\";s:61:\"新增、编辑与储存可显示动态资料的 email 范本\";s:2:\"hu\";s:63:\"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat\";s:2:\"fi\";s:66:\"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.\";s:2:\"th\";s:129:\"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก\";s:2:\"se\";s:49:\"Skapa, redigera och spara dynamiska E-postmallar.\";}',1,0,1,'structure',0,1,1,1450336686),(4,'a:25:{s:2:\"en\";s:7:\"Add-ons\";s:2:\"ar\";s:16:\"الإضافات\";s:2:\"br\";s:12:\"Complementos\";s:2:\"pt\";s:12:\"Complementos\";s:2:\"cs\";s:8:\"Doplňky\";s:2:\"da\";s:7:\"Add-ons\";s:2:\"de\";s:13:\"Erweiterungen\";s:2:\"el\";s:16:\"Πρόσθετα\";s:2:\"es\";s:9:\"Agregados\";s:2:\"fa\";s:17:\"افزونه ها\";s:2:\"fi\";s:9:\"Lisäosat\";s:2:\"fr\";s:10:\"Extensions\";s:2:\"he\";s:12:\"תוספות\";s:2:\"id\";s:7:\"Pengaya\";s:2:\"it\";s:7:\"Add-ons\";s:2:\"lt\";s:7:\"Priedai\";s:2:\"nl\";s:7:\"Add-ons\";s:2:\"pl\";s:12:\"Rozszerzenia\";s:2:\"ru\";s:20:\"Дополнения\";s:2:\"sl\";s:11:\"Razširitve\";s:2:\"tw\";s:12:\"附加模組\";s:2:\"cn\";s:12:\"附加模组\";s:2:\"hu\";s:14:\"Bővítmények\";s:2:\"th\";s:27:\"ส่วนเสริม\";s:2:\"se\";s:8:\"Tillägg\";}','addons','2.0.0',NULL,'a:25:{s:2:\"en\";s:59:\"Allows admins to see a list of currently installed modules.\";s:2:\"ar\";s:91:\"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.\";s:2:\"br\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"pt\";s:75:\"Permite aos administradores ver a lista dos módulos instalados atualmente.\";s:2:\"cs\";s:68:\"Umožňuje administrátorům vidět seznam nainstalovaných modulů.\";s:2:\"da\";s:63:\"Lader administratorer se en liste over de installerede moduler.\";s:2:\"de\";s:56:\"Zeigt Administratoren alle aktuell installierten Module.\";s:2:\"el\";s:152:\"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.\";s:2:\"es\";s:71:\"Permite a los administradores ver una lista de los módulos instalados.\";s:2:\"fa\";s:93:\"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت\";s:2:\"fi\";s:60:\"Listaa järjestelmänvalvojalle käytössä olevat moduulit.\";s:2:\"fr\";s:66:\"Permet aux administrateurs de voir la liste des modules installés\";s:2:\"he\";s:160:\"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים\";s:2:\"id\";s:57:\"Memperlihatkan kepada admin daftar modul yang terinstall.\";s:2:\"it\";s:83:\"Permette agli amministratori di vedere una lista dei moduli attualmente installati.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:79:\"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.\";s:2:\"pl\";s:81:\"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.\";s:2:\"ru\";s:83:\"Список модулей, которые установлены на сайте.\";s:2:\"sl\";s:65:\"Dovoljuje administratorjem pregled trenutno nameščenih modulov.\";s:2:\"tw\";s:54:\"管理員可以檢視目前已經安裝模組的列表\";s:2:\"cn\";s:54:\"管理员可以检视目前已经安装模组的列表\";s:2:\"hu\";s:79:\"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.\";s:2:\"th\";s:162:\"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน\";s:2:\"se\";s:67:\"Gör det möjligt för administratören att se installerade mouler.\";}',0,0,1,'0',1,1,1,1450336686),(5,'a:17:{s:2:\"en\";s:4:\"Blog\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"fa\";s:8:\"بلاگ\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"tw\";s:6:\"文章\";s:2:\"cn\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}','blog','2.0.0',NULL,'a:25:{s:2:\"en\";s:18:\"Post blog entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fa\";s:44:\"مقالات منتشر شده در بلاگ\";s:2:\"fr\";s:34:\"Poster des articles d\'actualités.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"tw\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"cn\";s:42:\"发表新闻讯息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}',1,1,1,'content',0,1,1,1450336686),(6,'a:25:{s:2:\"en\";s:8:\"Comments\";s:2:\"ar\";s:18:\"التعليقات\";s:2:\"br\";s:12:\"Comentários\";s:2:\"pt\";s:12:\"Comentários\";s:2:\"cs\";s:11:\"Komentáře\";s:2:\"da\";s:11:\"Kommentarer\";s:2:\"de\";s:10:\"Kommentare\";s:2:\"el\";s:12:\"Σχόλια\";s:2:\"es\";s:11:\"Comentarios\";s:2:\"fi\";s:9:\"Kommentit\";s:2:\"fr\";s:12:\"Commentaires\";s:2:\"fa\";s:10:\"نظرات\";s:2:\"he\";s:12:\"תגובות\";s:2:\"id\";s:8:\"Komentar\";s:2:\"it\";s:8:\"Commenti\";s:2:\"lt\";s:10:\"Komentarai\";s:2:\"nl\";s:8:\"Reacties\";s:2:\"pl\";s:10:\"Komentarze\";s:2:\"ru\";s:22:\"Комментарии\";s:2:\"sl\";s:10:\"Komentarji\";s:2:\"tw\";s:6:\"回應\";s:2:\"cn\";s:6:\"回应\";s:2:\"hu\";s:16:\"Hozzászólások\";s:2:\"th\";s:33:\"ความคิดเห็น\";s:2:\"se\";s:11:\"Kommentarer\";}','comments','1.1.0',NULL,'a:25:{s:2:\"en\";s:76:\"Users and guests can write comments for content like blog, pages and photos.\";s:2:\"ar\";s:152:\"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.\";s:2:\"br\";s:97:\"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"pt\";s:100:\"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.\";s:2:\"cs\";s:100:\"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.\";s:2:\"da\";s:83:\"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.\";s:2:\"de\";s:65:\"Benutzer und Gäste können für fast alles Kommentare schreiben.\";s:2:\"el\";s:224:\"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.\";s:2:\"es\";s:130:\"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.\";s:2:\"fa\";s:168:\"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند\";s:2:\"fi\";s:107:\"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.\";s:2:\"fr\";s:130:\"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.\";s:2:\"he\";s:94:\"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו\";s:2:\"id\";s:100:\"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.\";s:2:\"it\";s:85:\"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.\";s:2:\"lt\";s:75:\"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.\";s:2:\"nl\";s:52:\"Gebruikers en gasten kunnen reageren op bijna alles.\";s:2:\"pl\";s:93:\"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.\";s:2:\"ru\";s:187:\"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.\";s:2:\"sl\";s:89:\"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike\";s:2:\"tw\";s:75:\"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。\";s:2:\"cn\";s:75:\"用户和访客可以针对新闻、页面与照片等内容发表回应。\";s:2:\"hu\";s:117:\"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).\";s:2:\"th\";s:240:\"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย\";s:2:\"se\";s:98:\"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.\";}',0,0,1,'content',0,1,1,1450336686),(37,'a:25:{s:2:\"en\";s:7:\"Contact\";s:2:\"ar\";s:14:\"الإتصال\";s:2:\"br\";s:7:\"Contato\";s:2:\"pt\";s:8:\"Contacto\";s:2:\"cs\";s:7:\"Kontakt\";s:2:\"da\";s:7:\"Kontakt\";s:2:\"de\";s:7:\"Kontakt\";s:2:\"el\";s:22:\"Επικοινωνία\";s:2:\"es\";s:8:\"Contacto\";s:2:\"fa\";s:18:\"تماس با ما\";s:2:\"fi\";s:13:\"Ota yhteyttä\";s:2:\"fr\";s:7:\"Contact\";s:2:\"he\";s:17:\"יצירת קשר\";s:2:\"id\";s:6:\"Kontak\";s:2:\"it\";s:10:\"Contattaci\";s:2:\"lt\";s:18:\"Kontaktinė formą\";s:2:\"nl\";s:7:\"Contact\";s:2:\"pl\";s:7:\"Kontakt\";s:2:\"ru\";s:27:\"Обратная связь\";s:2:\"sl\";s:7:\"Kontakt\";s:2:\"tw\";s:12:\"聯絡我們\";s:2:\"cn\";s:12:\"联络我们\";s:2:\"hu\";s:9:\"Kapcsolat\";s:2:\"th\";s:18:\"ติดต่อ\";s:2:\"se\";s:7:\"Kontakt\";}','contact','1.0.0',NULL,'a:25:{s:2:\"en\";s:112:\"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.\";s:2:\"ar\";s:157:\"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.\";s:2:\"br\";s:139:\"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.\";s:2:\"pt\";s:116:\"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.\";s:2:\"cs\";s:149:\"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.\";s:2:\"da\";s:123:\"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse\";s:2:\"de\";s:119:\"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.\";s:2:\"el\";s:273:\"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.\";s:2:\"fa\";s:239:\"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.\";s:2:\"es\";s:156:\"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.\";s:2:\"fi\";s:128:\"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.\";s:2:\"fr\";s:122:\"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.\";s:2:\"he\";s:155:\"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות\";s:2:\"id\";s:149:\"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka\";s:2:\"it\";s:119:\"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.\";s:2:\"lt\";s:124:\"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.\";s:2:\"nl\";s:125:\"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.\";s:2:\"pl\";s:126:\"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.\";s:2:\"ru\";s:234:\"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.\";s:2:\"sl\";s:113:\"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.\";s:2:\"tw\";s:147:\"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。\";s:2:\"cn\";s:147:\"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。\";s:2:\"th\";s:316:\"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา\";s:2:\"hu\";s:156:\"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.\";s:2:\"se\";s:53:\"Lägger till ett kontaktformulär till din webbplats.\";}',0,0,0,'0',1,1,1,1450336686),(8,'a:24:{s:2:\"en\";s:5:\"Files\";s:2:\"ar\";s:16:\"الملفّات\";s:2:\"br\";s:8:\"Arquivos\";s:2:\"pt\";s:9:\"Ficheiros\";s:2:\"cs\";s:7:\"Soubory\";s:2:\"da\";s:5:\"Filer\";s:2:\"de\";s:7:\"Dateien\";s:2:\"el\";s:12:\"Αρχεία\";s:2:\"es\";s:8:\"Archivos\";s:2:\"fa\";s:13:\"فایل ها\";s:2:\"fi\";s:9:\"Tiedostot\";s:2:\"fr\";s:8:\"Fichiers\";s:2:\"he\";s:10:\"קבצים\";s:2:\"id\";s:4:\"File\";s:2:\"it\";s:4:\"File\";s:2:\"lt\";s:6:\"Failai\";s:2:\"nl\";s:9:\"Bestanden\";s:2:\"ru\";s:10:\"Файлы\";s:2:\"sl\";s:8:\"Datoteke\";s:2:\"tw\";s:6:\"檔案\";s:2:\"cn\";s:6:\"档案\";s:2:\"hu\";s:7:\"Fájlok\";s:2:\"th\";s:12:\"ไฟล์\";s:2:\"se\";s:5:\"Filer\";}','files','2.0.0',NULL,'a:24:{s:2:\"en\";s:40:\"Manages files and folders for your site.\";s:2:\"ar\";s:50:\"إدارة ملفات ومجلّدات موقعك.\";s:2:\"br\";s:53:\"Permite gerenciar facilmente os arquivos de seu site.\";s:2:\"pt\";s:59:\"Permite gerir facilmente os ficheiros e pastas do seu site.\";s:2:\"cs\";s:43:\"Spravujte soubory a složky na vašem webu.\";s:2:\"da\";s:41:\"Administrer filer og mapper for dit site.\";s:2:\"de\";s:35:\"Verwalte Dateien und Verzeichnisse.\";s:2:\"el\";s:100:\"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.\";s:2:\"es\";s:43:\"Administra archivos y carpetas en tu sitio.\";s:2:\"fa\";s:79:\"مدیریت فایل های چند رسانه ای و فولدر ها سایت\";s:2:\"fi\";s:43:\"Hallitse sivustosi tiedostoja ja kansioita.\";s:2:\"fr\";s:46:\"Gérer les fichiers et dossiers de votre site.\";s:2:\"he\";s:47:\"ניהול תיקיות וקבצים שבאתר\";s:2:\"id\";s:42:\"Mengatur file dan folder dalam situs Anda.\";s:2:\"it\";s:38:\"Gestisci file e cartelle del tuo sito.\";s:2:\"lt\";s:28:\"Katalogų ir bylų valdymas.\";s:2:\"nl\";s:41:\"Beheer bestanden en mappen op uw website.\";s:2:\"ru\";s:78:\"Управление файлами и папками вашего сайта.\";s:2:\"sl\";s:38:\"Uredi datoteke in mape na vaši strani\";s:2:\"tw\";s:33:\"管理網站中的檔案與目錄\";s:2:\"cn\";s:33:\"管理网站中的档案与目录\";s:2:\"hu\";s:41:\"Fájlok és mappák kezelése az oldalon.\";s:2:\"th\";s:141:\"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ\";s:2:\"se\";s:45:\"Hanterar filer och mappar för din webbplats.\";}',0,0,1,'content',1,1,1,1450336686),(9,'a:24:{s:2:\"en\";s:6:\"Groups\";s:2:\"ar\";s:18:\"المجموعات\";s:2:\"br\";s:6:\"Grupos\";s:2:\"pt\";s:6:\"Grupos\";s:2:\"cs\";s:7:\"Skupiny\";s:2:\"da\";s:7:\"Grupper\";s:2:\"de\";s:7:\"Gruppen\";s:2:\"el\";s:12:\"Ομάδες\";s:2:\"es\";s:6:\"Grupos\";s:2:\"fa\";s:13:\"گروه ها\";s:2:\"fi\";s:7:\"Ryhmät\";s:2:\"fr\";s:7:\"Groupes\";s:2:\"he\";s:12:\"קבוצות\";s:2:\"id\";s:4:\"Grup\";s:2:\"it\";s:6:\"Gruppi\";s:2:\"lt\";s:7:\"Grupės\";s:2:\"nl\";s:7:\"Groepen\";s:2:\"ru\";s:12:\"Группы\";s:2:\"sl\";s:7:\"Skupine\";s:2:\"tw\";s:6:\"群組\";s:2:\"cn\";s:6:\"群组\";s:2:\"hu\";s:9:\"Csoportok\";s:2:\"th\";s:15:\"กลุ่ม\";s:2:\"se\";s:7:\"Grupper\";}','groups','1.0.0',NULL,'a:24:{s:2:\"en\";s:54:\"Users can be placed into groups to manage permissions.\";s:2:\"ar\";s:100:\"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.\";s:2:\"br\";s:72:\"Usuários podem ser inseridos em grupos para gerenciar suas permissões.\";s:2:\"pt\";s:74:\"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.\";s:2:\"cs\";s:77:\"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.\";s:2:\"da\";s:49:\"Brugere kan inddeles i grupper for adgangskontrol\";s:2:\"de\";s:85:\"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.\";s:2:\"el\";s:168:\"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.\";s:2:\"es\";s:75:\"Los usuarios podrán ser colocados en grupos para administrar sus permisos.\";s:2:\"fa\";s:149:\"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد\";s:2:\"fi\";s:84:\"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.\";s:2:\"fr\";s:82:\"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.\";s:2:\"he\";s:62:\"נותן אפשרות לאסוף משתמשים לקבוצות\";s:2:\"id\";s:68:\"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.\";s:2:\"it\";s:69:\"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.\";s:2:\"lt\";s:67:\"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.\";s:2:\"nl\";s:73:\"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.\";s:2:\"ru\";s:134:\"Пользователей можно объединять в группы, для управления правами доступа.\";s:2:\"sl\";s:64:\"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj\";s:2:\"tw\";s:45:\"用戶可以依群組分類並管理其權限\";s:2:\"cn\";s:45:\"用户可以依群组分类并管理其权限\";s:2:\"hu\";s:73:\"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.\";s:2:\"th\";s:84:\"สามารถวางผู้ใช้ลงในกลุ่มเพื่\";s:2:\"se\";s:76:\"Användare kan delas in i grupper för att hantera roller och behörigheter.\";}',0,0,1,'users',1,1,1,1450336686),(10,'a:17:{s:2:\"en\";s:8:\"Keywords\";s:2:\"ar\";s:21:\"كلمات البحث\";s:2:\"br\";s:14:\"Palavras-chave\";s:2:\"pt\";s:14:\"Palavras-chave\";s:2:\"da\";s:9:\"Nøgleord\";s:2:\"el\";s:27:\"Λέξεις Κλειδιά\";s:2:\"fa\";s:21:\"کلمات کلیدی\";s:2:\"fr\";s:10:\"Mots-Clés\";s:2:\"id\";s:10:\"Kata Kunci\";s:2:\"nl\";s:14:\"Sleutelwoorden\";s:2:\"tw\";s:6:\"鍵詞\";s:2:\"cn\";s:6:\"键词\";s:2:\"hu\";s:11:\"Kulcsszavak\";s:2:\"fi\";s:10:\"Avainsanat\";s:2:\"sl\";s:15:\"Ključne besede\";s:2:\"th\";s:15:\"คำค้น\";s:2:\"se\";s:9:\"Nyckelord\";}','keywords','1.1.0',NULL,'a:17:{s:2:\"en\";s:71:\"Maintain a central list of keywords to label and organize your content.\";s:2:\"ar\";s:124:\"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.\";s:2:\"br\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"pt\";s:85:\"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.\";s:2:\"da\";s:72:\"Vedligehold en central liste af nøgleord for at organisere dit indhold.\";s:2:\"el\";s:181:\"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.\";s:2:\"fa\";s:110:\"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا\";s:2:\"fr\";s:87:\"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.\";s:2:\"id\";s:71:\"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.\";s:2:\"nl\";s:91:\"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.\";s:2:\"tw\";s:64:\"集中管理可用於標題與內容的鍵詞(keywords)列表。\";s:2:\"cn\";s:64:\"集中管理可用于标题与内容的键词(keywords)列表。\";s:2:\"hu\";s:65:\"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.\";s:2:\"fi\";s:92:\"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.\";s:2:\"sl\";s:82:\"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.\";s:2:\"th\";s:189:\"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ\";s:2:\"se\";s:61:\"Hantera nyckelord för att organisera webbplatsens innehåll.\";}',0,0,1,'data',0,1,1,1450336686),(11,'a:15:{s:2:\"en\";s:11:\"Maintenance\";s:2:\"pt\";s:12:\"Manutenção\";s:2:\"ar\";s:14:\"الصيانة\";s:2:\"el\";s:18:\"Συντήρηση\";s:2:\"hu\";s:13:\"Karbantartás\";s:2:\"fa\";s:15:\"نگه داری\";s:2:\"fi\";s:9:\"Ylläpito\";s:2:\"fr\";s:11:\"Maintenance\";s:2:\"id\";s:12:\"Pemeliharaan\";s:2:\"it\";s:12:\"Manutenzione\";s:2:\"se\";s:10:\"Underhåll\";s:2:\"sl\";s:12:\"Vzdrževanje\";s:2:\"th\";s:39:\"การบำรุงรักษา\";s:2:\"tw\";s:6:\"維護\";s:2:\"cn\";s:6:\"维护\";}','maintenance','1.0.0',NULL,'a:15:{s:2:\"en\";s:63:\"Manage the site cache and export information from the database.\";s:2:\"pt\";s:68:\"Gerir o cache do seu site e exportar informações da base de dados.\";s:2:\"ar\";s:81:\"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.\";s:2:\"el\";s:142:\"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.\";s:2:\"id\";s:60:\"Mengatur cache situs dan mengexport informasi dari database.\";s:2:\"it\";s:65:\"Gestisci la cache del sito e esporta le informazioni dal database\";s:2:\"fa\";s:73:\"مدیریت کش سایت و صدور اطلاعات از دیتابیس\";s:2:\"fr\";s:71:\"Gérer le cache du site et exporter les contenus de la base de données\";s:2:\"fi\";s:59:\"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.\";s:2:\"hu\";s:66:\"Az oldal gyorsítótár kezelése és az adatbázis exportálása.\";s:2:\"se\";s:76:\"Underhåll webbplatsens cache och exportera data från webbplatsens databas.\";s:2:\"sl\";s:69:\"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.\";s:2:\"th\";s:150:\"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล\";s:2:\"tw\";s:45:\"經由管理介面手動刪除暫存資料。\";s:2:\"cn\";s:45:\"经由管理介面手动删除暂存资料。\";}',0,0,1,'data',0,1,1,1450336686),(12,'a:25:{s:2:\"en\";s:10:\"Navigation\";s:2:\"ar\";s:14:\"الروابط\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"cs\";s:8:\"Navigace\";s:2:\"da\";s:10:\"Navigation\";s:2:\"de\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"es\";s:11:\"Navegación\";s:2:\"fa\";s:11:\"منو ها\";s:2:\"fi\";s:10:\"Navigointi\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"he\";s:10:\"ניווט\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"it\";s:11:\"Navigazione\";s:2:\"lt\";s:10:\"Navigacija\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"pl\";s:9:\"Nawigacja\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"sl\";s:10:\"Navigacija\";s:2:\"tw\";s:12:\"導航選單\";s:2:\"cn\";s:12:\"导航选单\";s:2:\"th\";s:36:\"ตัวช่วยนำทาง\";s:2:\"hu\";s:11:\"Navigáció\";s:2:\"se\";s:10:\"Navigation\";}','navigation','1.1.0',NULL,'a:25:{s:2:\"en\";s:78:\"Manage links on navigation menus and all the navigation groups they belong to.\";s:2:\"ar\";s:85:\"إدارة روابط وقوائم ومجموعات الروابط في الموقع.\";s:2:\"br\";s:91:\"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.\";s:2:\"pt\";s:93:\"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.\";s:2:\"cs\";s:73:\"Správa odkazů v navigaci a všech souvisejících navigačních skupin.\";s:2:\"da\";s:82:\"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.\";s:2:\"de\";s:76:\"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen\";s:2:\"el\";s:207:\"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.\";s:2:\"es\";s:102:\"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.\";s:2:\"fa\";s:68:\"مدیریت منو ها و گروه های مربوط به آنها\";s:2:\"fi\";s:91:\"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.\";s:2:\"fr\";s:97:\"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.\";s:2:\"he\";s:73:\"ניהול שלוחות תפריטי ניווט וקבוצות ניווט\";s:2:\"id\";s:73:\"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.\";s:2:\"it\";s:97:\"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.\";s:2:\"lt\";s:95:\"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.\";s:2:\"nl\";s:92:\"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.\";s:2:\"pl\";s:95:\"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.\";s:2:\"ru\";s:136:\"Управление ссылками в меню навигации и группах, к которым они принадлежат.\";s:2:\"sl\";s:64:\"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.\";s:2:\"tw\";s:72:\"管理導航選單中的連結，以及它們所隸屬的導航群組。\";s:2:\"cn\";s:72:\"管理导航选单中的连结，以及它们所隶属的导航群组。\";s:2:\"th\";s:108:\"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง\";s:2:\"se\";s:33:\"Hantera länkar och länkgrupper.\";s:2:\"hu\";s:100:\"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.\";}',0,0,1,'structure',1,1,1,1450336686),(13,'a:25:{s:2:\"en\";s:5:\"Pages\";s:2:\"ar\";s:14:\"الصفحات\";s:2:\"br\";s:8:\"Páginas\";s:2:\"pt\";s:8:\"Páginas\";s:2:\"cs\";s:8:\"Stránky\";s:2:\"da\";s:5:\"Sider\";s:2:\"de\";s:6:\"Seiten\";s:2:\"el\";s:14:\"Σελίδες\";s:2:\"es\";s:8:\"Páginas\";s:2:\"fa\";s:14:\"صفحه ها \";s:2:\"fi\";s:5:\"Sivut\";s:2:\"fr\";s:5:\"Pages\";s:2:\"he\";s:8:\"דפים\";s:2:\"id\";s:7:\"Halaman\";s:2:\"it\";s:6:\"Pagine\";s:2:\"lt\";s:9:\"Puslapiai\";s:2:\"nl\";s:13:\"Pagina&apos;s\";s:2:\"pl\";s:6:\"Strony\";s:2:\"ru\";s:16:\"Страницы\";s:2:\"sl\";s:6:\"Strani\";s:2:\"tw\";s:6:\"頁面\";s:2:\"cn\";s:6:\"页面\";s:2:\"hu\";s:7:\"Oldalak\";s:2:\"th\";s:21:\"หน้าเพจ\";s:2:\"se\";s:5:\"Sidor\";}','pages','2.2.0',NULL,'a:25:{s:2:\"en\";s:55:\"Add custom pages to the site with any content you want.\";s:2:\"ar\";s:99:\"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.\";s:2:\"br\";s:82:\"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.\";s:2:\"pt\";s:86:\"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.\";s:2:\"cs\";s:74:\"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.\";s:2:\"da\";s:71:\"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.\";s:2:\"de\";s:49:\"Füge eigene Seiten mit anpassbaren Inhalt hinzu.\";s:2:\"el\";s:152:\"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.\";s:2:\"es\";s:77:\"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.\";s:2:\"fa\";s:96:\"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید\";s:2:\"fi\";s:47:\"Lisää mitä tahansa sisältöä sivustollesi.\";s:2:\"fr\";s:89:\"Permet d\'ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.\";s:2:\"he\";s:35:\"ניהול דפי תוכן האתר\";s:2:\"id\";s:75:\"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.\";s:2:\"it\";s:73:\"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.\";s:2:\"lt\";s:46:\"Pridėkite nuosavus puslapius betkokio turinio\";s:2:\"nl\";s:70:\"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.\";s:2:\"pl\";s:53:\"Dodaj własne strony z dowolną treścią do witryny.\";s:2:\"ru\";s:134:\"Управление информационными страницами сайта, с произвольным содержимым.\";s:2:\"sl\";s:44:\"Dodaj stran s kakršno koli vsebino želite.\";s:2:\"tw\";s:39:\"為您的網站新增自定的頁面。\";s:2:\"cn\";s:39:\"为您的网站新增自定的页面。\";s:2:\"th\";s:168:\"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ\";s:2:\"hu\";s:67:\"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.\";s:2:\"se\";s:39:\"Lägg till egna sidor till webbplatsen.\";}',1,1,1,'content',1,1,1,1450336686),(14,'a:25:{s:2:\"en\";s:11:\"Permissions\";s:2:\"ar\";s:18:\"الصلاحيات\";s:2:\"br\";s:11:\"Permissões\";s:2:\"pt\";s:11:\"Permissões\";s:2:\"cs\";s:12:\"Oprávnění\";s:2:\"da\";s:14:\"Adgangskontrol\";s:2:\"de\";s:14:\"Zugriffsrechte\";s:2:\"el\";s:20:\"Δικαιώματα\";s:2:\"es\";s:8:\"Permisos\";s:2:\"fa\";s:15:\"اجازه ها\";s:2:\"fi\";s:16:\"Käyttöoikeudet\";s:2:\"fr\";s:11:\"Permissions\";s:2:\"he\";s:12:\"הרשאות\";s:2:\"id\";s:9:\"Perizinan\";s:2:\"it\";s:8:\"Permessi\";s:2:\"lt\";s:7:\"Teisės\";s:2:\"nl\";s:15:\"Toegangsrechten\";s:2:\"pl\";s:11:\"Uprawnienia\";s:2:\"ru\";s:25:\"Права доступа\";s:2:\"sl\";s:10:\"Dovoljenja\";s:2:\"tw\";s:6:\"權限\";s:2:\"cn\";s:6:\"权限\";s:2:\"hu\";s:14:\"Jogosultságok\";s:2:\"th\";s:18:\"สิทธิ์\";s:2:\"se\";s:13:\"Behörigheter\";}','permissions','1.0.0',NULL,'a:25:{s:2:\"en\";s:68:\"Control what type of users can see certain sections within the site.\";s:2:\"ar\";s:127:\"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.\";s:2:\"br\";s:68:\"Controle quais tipos de usuários podem ver certas seções no site.\";s:2:\"pt\";s:75:\"Controle quais os tipos de utilizadores podem ver certas secções no site.\";s:2:\"cs\";s:93:\"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.\";s:2:\"da\";s:72:\"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.\";s:2:\"de\";s:70:\"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.\";s:2:\"el\";s:180:\"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.\";s:2:\"es\";s:81:\"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.\";s:2:\"fa\";s:59:\"مدیریت اجازه های گروه های کاربری\";s:2:\"fi\";s:72:\"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.\";s:2:\"fr\";s:104:\"Permet de définir les autorisations des groupes d\'utilisateurs pour afficher les différentes sections.\";s:2:\"he\";s:75:\"ניהול הרשאות כניסה לאיזורים מסוימים באתר\";s:2:\"id\";s:76:\"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.\";s:2:\"it\";s:78:\"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.\";s:2:\"lt\";s:72:\"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.\";s:2:\"nl\";s:71:\"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.\";s:2:\"pl\";s:79:\"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.\";s:2:\"ru\";s:209:\"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.\";s:2:\"sl\";s:85:\"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.\";s:2:\"tw\";s:81:\"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。\";s:2:\"cn\";s:81:\"用来控制不同类别的用户，设定其浏览特定网站内容的权限。\";s:2:\"hu\";s:129:\"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.\";s:2:\"th\";s:117:\"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง\";s:2:\"se\";s:27:\"Hantera gruppbehörigheter.\";}',0,0,1,'users',1,1,1,1450336686),(15,'a:24:{s:2:\"en\";s:9:\"Redirects\";s:2:\"ar\";s:18:\"التوجيهات\";s:2:\"br\";s:17:\"Redirecionamentos\";s:2:\"pt\";s:17:\"Redirecionamentos\";s:2:\"cs\";s:16:\"Přesměrování\";s:2:\"da\";s:13:\"Omadressering\";s:2:\"el\";s:30:\"Ανακατευθύνσεις\";s:2:\"es\";s:13:\"Redirecciones\";s:2:\"fa\";s:17:\"انتقال ها\";s:2:\"fi\";s:18:\"Uudelleenohjaukset\";s:2:\"fr\";s:12:\"Redirections\";s:2:\"he\";s:12:\"הפניות\";s:2:\"id\";s:8:\"Redirect\";s:2:\"it\";s:11:\"Reindirizzi\";s:2:\"lt\";s:14:\"Peradresavimai\";s:2:\"nl\";s:12:\"Verwijzingen\";s:2:\"ru\";s:30:\"Перенаправления\";s:2:\"sl\";s:12:\"Preusmeritve\";s:2:\"tw\";s:6:\"轉址\";s:2:\"cn\";s:6:\"转址\";s:2:\"hu\";s:17:\"Átirányítások\";s:2:\"pl\";s:14:\"Przekierowania\";s:2:\"th\";s:42:\"เปลี่ยนเส้นทาง\";s:2:\"se\";s:14:\"Omdirigeringar\";}','redirects','1.0.0',NULL,'a:24:{s:2:\"en\";s:33:\"Redirect from one URL to another.\";s:2:\"ar\";s:47:\"التوجيه من رابط URL إلى آخر.\";s:2:\"br\";s:39:\"Redirecionamento de uma URL para outra.\";s:2:\"pt\";s:40:\"Redirecionamentos de uma URL para outra.\";s:2:\"cs\";s:43:\"Přesměrujte z jedné adresy URL na jinou.\";s:2:\"da\";s:35:\"Omadresser fra en URL til en anden.\";s:2:\"el\";s:81:\"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη\";s:2:\"es\";s:34:\"Redireccionar desde una URL a otra\";s:2:\"fa\";s:63:\"انتقال دادن یک صفحه به یک آدرس دیگر\";s:2:\"fi\";s:45:\"Uudelleenohjaa käyttäjän paikasta toiseen.\";s:2:\"fr\";s:34:\"Redirection d\'une URL à un autre.\";s:2:\"he\";s:43:\"הפניות מכתובת אחת לאחרת\";s:2:\"id\";s:40:\"Redirect dari satu URL ke URL yang lain.\";s:2:\"it\";s:35:\"Reindirizza da una URL ad un altra.\";s:2:\"lt\";s:56:\"Peradresuokite puslapį iš vieno adreso (URL) į kitą.\";s:2:\"nl\";s:38:\"Verwijs vanaf een URL naar een andere.\";s:2:\"ru\";s:78:\"Перенаправления с одного адреса на другой.\";s:2:\"sl\";s:44:\"Preusmeritev iz enega URL naslova na drugega\";s:2:\"tw\";s:33:\"將網址轉址、重新定向。\";s:2:\"cn\";s:33:\"将网址转址、重新定向。\";s:2:\"hu\";s:38:\"Egy URL átirányítása egy másikra.\";s:2:\"pl\";s:44:\"Przekierowanie z jednego adresu URL na inny.\";s:2:\"th\";s:123:\"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง\";s:2:\"se\";s:38:\"Omdirigera från en URL till en annan.\";}',0,0,1,'structure',0,1,1,1450336686),(16,'a:9:{s:2:\"en\";s:6:\"Search\";s:2:\"fr\";s:9:\"Recherche\";s:2:\"se\";s:4:\"Sök\";s:2:\"ar\";s:10:\"البحث\";s:2:\"tw\";s:6:\"搜尋\";s:2:\"cn\";s:6:\"搜寻\";s:2:\"it\";s:7:\"Ricerca\";s:2:\"fa\";s:10:\"جستجو\";s:2:\"fi\";s:4:\"Etsi\";}','search','1.0.0',NULL,'a:9:{s:2:\"en\";s:72:\"Search through various types of content with this modular search system.\";s:2:\"fr\";s:84:\"Rechercher parmi différents types de contenus avec système de recherche modulaire.\";s:2:\"se\";s:36:\"Sök igenom olika typer av innehåll\";s:2:\"ar\";s:102:\"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.\";s:2:\"tw\";s:63:\"此模組可用以搜尋網站中不同類型的資料內容。\";s:2:\"cn\";s:63:\"此模组可用以搜寻网站中不同类型的资料内容。\";s:2:\"it\";s:71:\"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare\";s:2:\"fa\";s:115:\"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.\";s:2:\"fi\";s:76:\"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.\";}',0,0,0,'0',1,1,1,1450336686),(17,'a:20:{s:2:\"en\";s:7:\"Sitemap\";s:2:\"ar\";s:23:\"خريطة الموقع\";s:2:\"br\";s:12:\"Mapa do Site\";s:2:\"pt\";s:12:\"Mapa do Site\";s:2:\"de\";s:7:\"Sitemap\";s:2:\"el\";s:31:\"Χάρτης Ιστότοπου\";s:2:\"es\";s:14:\"Mapa del Sitio\";s:2:\"fa\";s:17:\"نقشه سایت\";s:2:\"fi\";s:10:\"Sivukartta\";s:2:\"fr\";s:12:\"Plan du site\";s:2:\"id\";s:10:\"Peta Situs\";s:2:\"it\";s:14:\"Mappa del sito\";s:2:\"lt\";s:16:\"Svetainės medis\";s:2:\"nl\";s:7:\"Sitemap\";s:2:\"ru\";s:21:\"Карта сайта\";s:2:\"tw\";s:12:\"網站地圖\";s:2:\"cn\";s:12:\"网站地图\";s:2:\"th\";s:21:\"ไซต์แมพ\";s:2:\"hu\";s:13:\"Oldaltérkép\";s:2:\"se\";s:9:\"Sajtkarta\";}','sitemap','1.3.0',NULL,'a:21:{s:2:\"en\";s:87:\"The sitemap module creates an index of all pages and an XML sitemap for search engines.\";s:2:\"ar\";s:120:\"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.\";s:2:\"br\";s:102:\"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"pt\";s:102:\"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.\";s:2:\"da\";s:86:\"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.\";s:2:\"de\";s:92:\"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.\";s:2:\"el\";s:190:\"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.\";s:2:\"es\";s:111:\"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.\";s:2:\"fa\";s:150:\"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد\";s:2:\"fi\";s:82:\"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.\";s:2:\"fr\";s:106:\"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.\";s:2:\"id\";s:110:\"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.\";s:2:\"it\";s:104:\"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.\";s:2:\"lt\";s:86:\"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.\";s:2:\"nl\";s:89:\"De sitemap module maakt een index van alle pagina\'s en een XML sitemap voor zoekmachines.\";s:2:\"ru\";s:144:\"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.\";s:2:\"tw\";s:84:\"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。\";s:2:\"cn\";s:84:\"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。\";s:2:\"th\";s:202:\"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.\";s:2:\"hu\";s:94:\"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.\";s:2:\"se\";s:86:\"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.\";}',0,1,0,'content',1,1,1,1450336686),(18,'a:25:{s:2:\"en\";s:5:\"Users\";s:2:\"ar\";s:20:\"المستخدمون\";s:2:\"br\";s:9:\"Usuários\";s:2:\"pt\";s:12:\"Utilizadores\";s:2:\"cs\";s:11:\"Uživatelé\";s:2:\"da\";s:7:\"Brugere\";s:2:\"de\";s:8:\"Benutzer\";s:2:\"el\";s:14:\"Χρήστες\";s:2:\"es\";s:8:\"Usuarios\";s:2:\"fa\";s:14:\"کاربران\";s:2:\"fi\";s:12:\"Käyttäjät\";s:2:\"fr\";s:12:\"Utilisateurs\";s:2:\"he\";s:14:\"משתמשים\";s:2:\"id\";s:8:\"Pengguna\";s:2:\"it\";s:6:\"Utenti\";s:2:\"lt\";s:10:\"Vartotojai\";s:2:\"nl\";s:10:\"Gebruikers\";s:2:\"pl\";s:12:\"Użytkownicy\";s:2:\"ru\";s:24:\"Пользователи\";s:2:\"sl\";s:10:\"Uporabniki\";s:2:\"tw\";s:6:\"用戶\";s:2:\"cn\";s:6:\"用户\";s:2:\"hu\";s:14:\"Felhasználók\";s:2:\"th\";s:27:\"ผู้ใช้งาน\";s:2:\"se\";s:10:\"Användare\";}','users','1.1.0',NULL,'a:25:{s:2:\"en\";s:81:\"Let users register and log in to the site, and manage them via the control panel.\";s:2:\"ar\";s:133:\"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.\";s:2:\"br\";s:125:\"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.\";s:2:\"pt\";s:125:\"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.\";s:2:\"cs\";s:103:\"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.\";s:2:\"da\";s:89:\"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.\";s:2:\"de\";s:108:\"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.\";s:2:\"el\";s:208:\"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.\";s:2:\"es\";s:138:\"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.\";s:2:\"fa\";s:151:\"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید\";s:2:\"fi\";s:126:\"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.\";s:2:\"fr\";s:112:\"Permet aux utilisateurs de s\'enregistrer et de se connecter au site et de les gérer via le panneau de contrôle\";s:2:\"he\";s:62:\"ניהול משתמשים: רישום, הפעלה ומחיקה\";s:2:\"id\";s:102:\"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.\";s:2:\"it\";s:95:\"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.\";s:2:\"lt\";s:106:\"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.\";s:2:\"nl\";s:88:\"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.\";s:2:\"pl\";s:87:\"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.\";s:2:\"ru\";s:155:\"Управление зарегистрированными пользователями, активирование новых пользователей.\";s:2:\"sl\";s:96:\"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče\";s:2:\"tw\";s:87:\"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。\";s:2:\"cn\";s:87:\"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。\";s:2:\"th\";s:210:\"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม\";s:2:\"hu\";s:120:\"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.\";s:2:\"se\";s:111:\"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.\";}',0,0,1,'0',1,1,1,1450336686),(19,'a:25:{s:2:\"en\";s:9:\"Variables\";s:2:\"ar\";s:20:\"المتغيّرات\";s:2:\"br\";s:10:\"Variáveis\";s:2:\"pt\";s:10:\"Variáveis\";s:2:\"cs\";s:10:\"Proměnné\";s:2:\"da\";s:8:\"Variable\";s:2:\"de\";s:9:\"Variablen\";s:2:\"el\";s:20:\"Μεταβλητές\";s:2:\"es\";s:9:\"Variables\";s:2:\"fa\";s:16:\"متغییرها\";s:2:\"fi\";s:9:\"Muuttujat\";s:2:\"fr\";s:9:\"Variables\";s:2:\"he\";s:12:\"משתנים\";s:2:\"id\";s:8:\"Variabel\";s:2:\"it\";s:9:\"Variabili\";s:2:\"lt\";s:10:\"Kintamieji\";s:2:\"nl\";s:10:\"Variabelen\";s:2:\"pl\";s:7:\"Zmienne\";s:2:\"ru\";s:20:\"Переменные\";s:2:\"sl\";s:13:\"Spremenljivke\";s:2:\"tw\";s:12:\"系統變數\";s:2:\"cn\";s:12:\"系统变数\";s:2:\"th\";s:18:\"ตัวแปร\";s:2:\"se\";s:9:\"Variabler\";s:2:\"hu\";s:10:\"Változók\";}','variables','1.0.0',NULL,'a:25:{s:2:\"en\";s:59:\"Manage global variables that can be accessed from anywhere.\";s:2:\"ar\";s:97:\"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.\";s:2:\"br\";s:61:\"Gerencia as variáveis globais acessíveis de qualquer lugar.\";s:2:\"pt\";s:58:\"Gerir as variáveis globais acessíveis de qualquer lugar.\";s:2:\"cs\";s:56:\"Spravujte globální proměnné přístupné odkudkoliv.\";s:2:\"da\";s:51:\"Håndtér globale variable som kan tilgås overalt.\";s:2:\"de\";s:74:\"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.\";s:2:\"el\";s:129:\"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.\";s:2:\"es\";s:50:\"Manage global variables to access from everywhere.\";s:2:\"fa\";s:136:\"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند\";s:2:\"fi\";s:66:\"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.\";s:2:\"fr\";s:92:\"Gérer des variables globales pour pouvoir y accéder depuis n\'importe quel endroit du site.\";s:2:\"he\";s:96:\"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר\";s:2:\"id\";s:59:\"Mengatur variabel global yang dapat diakses dari mana saja.\";s:2:\"it\";s:58:\"Gestisci le variabili globali per accedervi da ogni parte.\";s:2:\"lt\";s:64:\"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.\";s:2:\"nl\";s:54:\"Beheer globale variabelen die overal beschikbaar zijn.\";s:2:\"pl\";s:86:\"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.\";s:2:\"ru\";s:136:\"Управление глобальными переменными, которые доступны в любом месте сайта.\";s:2:\"sl\";s:53:\"Urejanje globalnih spremenljivk za dostop od kjerkoli\";s:2:\"th\";s:148:\"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.\";s:2:\"tw\";s:45:\"管理此網站內可存取的全局變數。\";s:2:\"cn\";s:45:\"管理此网站内可存取的全局变数。\";s:2:\"hu\";s:62:\"Globális változók kezelése a hozzáféréshez, bárhonnan.\";s:2:\"se\";s:66:\"Hantera globala variabler som kan avändas över hela webbplatsen.\";}',0,0,1,'data',0,1,1,1450336686),(20,'a:23:{s:2:\"en\";s:7:\"Widgets\";s:2:\"br\";s:7:\"Widgets\";s:2:\"pt\";s:7:\"Widgets\";s:2:\"cs\";s:7:\"Widgety\";s:2:\"da\";s:7:\"Widgets\";s:2:\"de\";s:7:\"Widgets\";s:2:\"el\";s:7:\"Widgets\";s:2:\"es\";s:7:\"Widgets\";s:2:\"fa\";s:13:\"ویجت ها\";s:2:\"fi\";s:9:\"Vimpaimet\";s:2:\"fr\";s:7:\"Widgets\";s:2:\"id\";s:6:\"Widget\";s:2:\"it\";s:7:\"Widgets\";s:2:\"lt\";s:11:\"Papildiniai\";s:2:\"nl\";s:7:\"Widgets\";s:2:\"ru\";s:14:\"Виджеты\";s:2:\"sl\";s:9:\"Vtičniki\";s:2:\"tw\";s:9:\"小組件\";s:2:\"cn\";s:9:\"小组件\";s:2:\"hu\";s:9:\"Widget-ek\";s:2:\"th\";s:21:\"วิดเจ็ต\";s:2:\"se\";s:8:\"Widgetar\";s:2:\"ar\";s:14:\"الودجتس\";}','widgets','1.2.0',NULL,'a:23:{s:2:\"en\";s:69:\"Manage small sections of self-contained logic in blocks or \"Widgets\".\";s:2:\"ar\";s:132:\"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ\"ودجتس\".\";s:2:\"br\";s:77:\"Gerenciar pequenas seções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"pt\";s:74:\"Gerir pequenas secções de conteúdos em bloco conhecidos como \"Widgets\".\";s:2:\"cs\";s:56:\"Spravujte malé funkční části webu neboli \"Widgety\".\";s:2:\"da\";s:74:\"Håndter små sektioner af selv-opretholdt logik i blokke eller \"Widgets\".\";s:2:\"de\";s:62:\"Verwaltet kleine, eigentständige Bereiche, genannt \"Widgets\".\";s:2:\"el\";s:149:\"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή \"Widgets\".\";s:2:\"es\";s:75:\"Manejar pequeñas secciones de lógica autocontenida en bloques o \"Widgets\"\";s:2:\"fa\";s:76:\"مدیریت قسمت های کوچکی از سایت به طور مستقل\";s:2:\"fi\";s:81:\"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai \"Vimpaimia\".\";s:2:\"fr\";s:41:\"Gérer des mini application ou \"Widgets\".\";s:2:\"id\";s:101:\"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah \"Widget\".\";s:2:\"it\";s:70:\"Gestisci piccole sezioni di logica a se stante in blocchi o \"Widgets\".\";s:2:\"lt\";s:43:\"Nedidelių, savarankiškų blokų valdymas.\";s:2:\"nl\";s:75:\"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel \"Widgets\".\";s:2:\"ru\";s:91:\"Управление небольшими, самостоятельными блоками.\";s:2:\"sl\";s:61:\"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)\";s:2:\"tw\";s:103:\"可將小段的程式碼透過小組件來管理。即所謂 \"Widgets\"，或稱為小工具、部件。\";s:2:\"cn\";s:103:\"可将小段的程式码透过小组件来管理。即所谓 \"Widgets\"，或称为小工具、部件。\";s:2:\"hu\";s:56:\"Önálló kis logikai tömbök vagy widget-ek kezelése.\";s:2:\"th\";s:152:\"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต\";s:2:\"se\";s:83:\"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.\";}',1,0,1,'content',0,1,1,1450336686),(21,'a:9:{s:2:\"en\";s:7:\"WYSIWYG\";s:2:\"fa\";s:7:\"WYSIWYG\";s:2:\"fr\";s:7:\"WYSIWYG\";s:2:\"pt\";s:7:\"WYSIWYG\";s:2:\"se\";s:15:\"HTML-redigerare\";s:2:\"tw\";s:7:\"WYSIWYG\";s:2:\"cn\";s:7:\"WYSIWYG\";s:2:\"ar\";s:27:\"المحرر الرسومي\";s:2:\"it\";s:7:\"WYSIWYG\";}','wysiwyg','1.0.0',NULL,'a:10:{s:2:\"en\";s:60:\"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.\";s:2:\"fa\";s:73:\"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. \";s:2:\"fr\";s:63:\"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor\";s:2:\"pt\";s:61:\"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.\";s:2:\"el\";s:113:\"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.\";s:2:\"se\";s:37:\"Redigeringsmodul för HTML, CKEditor.\";s:2:\"tw\";s:83:\"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。\";s:2:\"cn\";s:83:\"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。\";s:2:\"ar\";s:76:\"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.\";s:2:\"it\";s:57:\"Fornisce l\'editor WYSIWYG per PtroCMS creato con CKEditor\";}',0,0,0,'0',1,1,1,1450336686),(45,'a:1:{s:2:\"en\";s:6:\"Forums\";}','forums','1.5.1',NULL,'a:1:{s:2:\"en\";s:23:\"The forum for your site\";}',0,1,1,'content',0,0,0,1425066092),(23,'a:17:{s:2:\"en\";s:12:\"Consultation\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"fa\";s:8:\"بلاگ\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"tw\";s:6:\"文章\";s:2:\"cn\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}','konsultasiz','1.0',NULL,'a:25:{s:2:\"en\";s:26:\"Post Consultation entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fa\";s:44:\"مقالات منتشر شده در بلاگ\";s:2:\"fr\";s:34:\"Poster des articles d\'actualités.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"tw\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"cn\";s:42:\"发表新闻讯息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}',1,0,1,'content',1,1,1,1411144850),(24,'a:2:{s:2:\"en\";s:12:\"Media Sosial\";s:2:\"id\";s:12:\"Media Sosial\";}','socmed','2.0.0',NULL,'a:2:{s:2:\"en\";s:21:\"Social Media entries.\";s:2:\"id\";s:12:\"Media Sosial\";}',1,1,0,'content',0,1,1,1414829785),(44,'a:2:{s:2:\"en\";s:6:\"Agenda\";s:2:\"id\";s:6:\"Agenda\";}','calendar','1.3.3',NULL,'a:1:{s:2:\"en\";s:23:\"Organize your schedule.\";}',0,1,1,'content',1,1,0,1450336686),(56,'a:2:{s:2:\"en\";s:4:\"News\";s:2:\"id\";s:6:\"Berita\";}','news','2.0.0',NULL,'a:2:{s:2:\"en\";s:18:\"Post news entries.\";s:2:\"id\";s:17:\"Post entri berita\";}',1,1,1,'content',1,1,0,1450336686),(32,'a:2:{s:2:\"en\";s:7:\"Wilayah\";s:2:\"id\";s:7:\"Wilayah\";}','area','1.1.0',NULL,'a:2:{s:2:\"en\";s:47:\"Manage wilayah (Provinsi, Kabupaten/Kota, etc.)\";s:2:\"id\";s:48:\"Manage wilayah (Provinsi, Kabupaten/Kota, etc.).\";}',0,0,1,'content',0,1,1,1414396666),(42,'a:2:{s:2:\"en\";s:8:\"Data PKP\";s:2:\"id\";s:8:\"Data PKP\";}','data_pkp','1.1.0',NULL,'a:2:{s:2:\"en\";s:15:\"Manage data PKP\";s:2:\"id\";s:15:\"Manage data PKP\";}',0,1,1,'content',0,1,1,1414396666),(34,'a:17:{s:2:\"en\";s:12:\"Consultation\";s:2:\"ar\";s:16:\"المدوّنة\";s:2:\"br\";s:4:\"Blog\";s:2:\"pt\";s:4:\"Blog\";s:2:\"el\";s:18:\"Ιστολόγιο\";s:2:\"fa\";s:8:\"بلاگ\";s:2:\"he\";s:8:\"בלוג\";s:2:\"id\";s:4:\"Blog\";s:2:\"lt\";s:6:\"Blogas\";s:2:\"pl\";s:4:\"Blog\";s:2:\"ru\";s:8:\"Блог\";s:2:\"tw\";s:6:\"文章\";s:2:\"cn\";s:6:\"文章\";s:2:\"hu\";s:4:\"Blog\";s:2:\"fi\";s:5:\"Blogi\";s:2:\"th\";s:15:\"บล็อก\";s:2:\"se\";s:5:\"Blogg\";}','consultation','2.0.0',NULL,'a:25:{s:2:\"en\";s:26:\"Post consultation entries.\";s:2:\"ar\";s:48:\"أنشر المقالات على مدوّنتك.\";s:2:\"br\";s:30:\"Escrever publicações de blog\";s:2:\"pt\";s:39:\"Escrever e editar publicações no blog\";s:2:\"cs\";s:49:\"Publikujte nové články a příspěvky na blog.\";s:2:\"da\";s:17:\"Skriv blogindlæg\";s:2:\"de\";s:47:\"Veröffentliche neue Artikel und Blog-Einträge\";s:2:\"sl\";s:23:\"Objavite blog prispevke\";s:2:\"fi\";s:28:\"Kirjoita blogi artikkeleita.\";s:2:\"el\";s:93:\"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.\";s:2:\"es\";s:54:\"Escribe entradas para los artículos y blog (web log).\";s:2:\"fa\";s:44:\"مقالات منتشر شده در بلاگ\";s:2:\"fr\";s:34:\"Poster des articles d\'actualités.\";s:2:\"he\";s:19:\"ניהול בלוג\";s:2:\"id\";s:15:\"Post entri blog\";s:2:\"it\";s:36:\"Pubblica notizie e post per il blog.\";s:2:\"lt\";s:40:\"Rašykite naujienas bei blog\'o įrašus.\";s:2:\"nl\";s:41:\"Post nieuwsartikelen en blogs op uw site.\";s:2:\"pl\";s:27:\"Dodawaj nowe wpisy na blogu\";s:2:\"ru\";s:49:\"Управление записями блога.\";s:2:\"tw\";s:42:\"發表新聞訊息、部落格等文章。\";s:2:\"cn\";s:42:\"发表新闻讯息、部落格等文章。\";s:2:\"th\";s:48:\"โพสต์รายการบล็อก\";s:2:\"hu\";s:32:\"Blog bejegyzések létrehozása.\";s:2:\"se\";s:18:\"Inlägg i bloggen.\";}',1,1,1,'content',1,1,1,1411231247),(35,'a:2:{s:2:\"en\";s:11:\"Kelembagaan\";s:2:\"id\";s:11:\"Kelembagaan\";}','kelembagaan','1.0.0',NULL,'a:2:{s:2:\"en\";s:19:\"Kelembagaan module.\";s:2:\"id\";s:18:\"Module Kelembagaan\";}',0,1,1,'content',0,1,1,1425069662),(43,'a:2:{s:2:\"en\";s:13:\"Rencana Kerja\";s:2:\"id\";s:13:\"Rencana Kerja\";}','rencana_kerja','1.1.0',NULL,'a:2:{s:2:\"en\";s:25:\"Manage data Rencana Kerja\";s:2:\"id\";s:25:\"Manage data Rencana Kerja\";}',0,1,1,'content',0,1,1,1414829785),(38,'a:2:{s:2:\"en\";s:7:\"Capaian\";s:2:\"id\";s:7:\"Capaian\";}','capaian','1.0',NULL,'a:2:{s:2:\"en\";s:36:\"This is an RP3KP Achievement Module.\";s:2:\"id\";s:31:\"Ini adalah modul capaian RP3KP.\";}',0,1,1,'content',0,1,1,1414396666),(39,'a:2:{s:2:\"en\";s:11:\"Keanggotaan\";s:2:\"id\";s:11:\"Keanggotaan\";}','keanggotaan','1.0.0',NULL,'a:2:{s:2:\"en\";s:19:\"Keanggotaan module.\";s:2:\"id\";s:17:\"Modul Keanggotaan\";}',0,1,1,'content',0,1,1,1414780297),(46,'a:2:{s:2:\"en\";s:10:\"Konsultasi\";s:2:\"id\";s:10:\"Konsultasi\";}','konsultasi','1.0',NULL,'a:2:{s:2:\"en\";s:30:\"This is a consultation module.\";s:2:\"id\";s:28:\"Ini adalah modul konsultasi.\";}',0,1,1,'content',0,0,0,1425066098),(41,'a:2:{s:2:\"en\";s:7:\"Katalog\";s:2:\"id\";s:7:\"Katalog\";}','catalogue','1.0.0',NULL,'a:2:{s:2:\"en\";s:42:\"Menambahkan katalog untuk bisa didownload.\";s:2:\"id\";s:42:\"Menambahkan katalog untuk bisa didownload.\";}',0,0,1,'content',0,1,1,1414396666),(55,'a:2:{s:2:\"en\";s:7:\"Program\";s:2:\"id\";s:7:\"Program\";}','program','1.0.0',NULL,'a:2:{s:2:\"en\";s:15:\"Program module.\";s:2:\"id\";s:13:\"Modul Program\";}',0,1,1,'content',1,1,0,1450336686),(59,'a:2:{s:2:\"en\";s:7:\"Gallery\";s:2:\"id\";s:7:\"Gallery\";}','gallery','1.0.0',NULL,'a:2:{s:2:\"en\";s:15:\"Gallery module.\";s:2:\"id\";s:13:\"Modul Gallery\";}',0,1,1,'content',1,1,0,1450336686),(58,'a:2:{s:2:\"en\";s:6:\"Videos\";s:2:\"id\";s:5:\"Video\";}','videos','1.0.0',NULL,'a:2:{s:2:\"en\";s:14:\"Videos module.\";s:2:\"id\";s:11:\"Modul Video\";}',0,1,1,'content',1,1,0,1450336686),(60,'a:2:{s:2:\"en\";s:9:\"Pengaduan\";s:2:\"id\";s:9:\"Pengaduan\";}','pengaduan','1.0.0',NULL,'a:2:{s:2:\"en\";s:17:\"Pengaduan module.\";s:2:\"id\";s:11:\"Modul Video\";}',0,1,1,'content',1,1,0,1450336686),(61,'a:2:{s:2:\"en\";s:5:\"Kasus\";s:2:\"id\";s:5:\"Kasus\";}','kasus','1.0.0',NULL,'a:2:{s:2:\"en\";s:13:\"Kasus module.\";s:2:\"id\";s:11:\"Modul Kasus\";}',0,1,1,'content',1,1,0,1450336686),(62,'a:2:{s:2:\"en\";s:5:\"Alert\";s:2:\"id\";s:5:\"Alert\";}','alert','2.0.0',NULL,'a:2:{s:2:\"en\";s:14:\"Alert entries.\";s:2:\"id\";s:16:\"Post entri Alert\";}',1,1,1,'content',1,1,0,1450336686),(63,'a:2:{s:2:\"en\";s:8:\"Download\";s:2:\"id\";s:8:\"Download\";}','download','1.0.0',NULL,'a:2:{s:2:\"en\";s:16:\"Download module.\";s:2:\"id\";s:14:\"Modul Download\";}',0,1,1,'content',1,1,0,1450337119),(64,'a:2:{s:2:\"en\";s:10:\"Slide show\";s:2:\"id\";s:10:\"Slide show\";}','slideshow','1.0.0',NULL,'a:2:{s:2:\"en\";s:17:\"Slideshow module.\";s:2:\"id\";s:15:\"Modul Slideshow\";}',0,1,1,'content',1,1,0,1450412976);
/*!40000 ALTER TABLE `default_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_navigation_groups`
--

DROP TABLE IF EXISTS `default_navigation_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abbrev` (`abbrev`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_navigation_groups`
--

LOCK TABLES `default_navigation_groups` WRITE;
/*!40000 ALTER TABLE `default_navigation_groups` DISABLE KEYS */;
INSERT INTO `default_navigation_groups` VALUES (1,'Header','header'),(2,'Sidebar','sidebar'),(3,'Footer','footer');
/*!40000 ALTER TABLE `default_navigation_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_navigation_links`
--

DROP TABLE IF EXISTS `default_navigation_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `navigation_group_id` (`navigation_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_navigation_links`
--

LOCK TABLES `default_navigation_links` WRITE;
/*!40000 ALTER TABLE `default_navigation_links` DISABLE KEYS */;
INSERT INTO `default_navigation_links` VALUES (1,'Home',0,'page',1,'','','',1,0,'','0',''),(2,'Profile',0,'uri',0,'','','#',1,1,'','0',''),(3,'Kontak',0,'page',2,'','','',1,10,'','0',''),(4,'Berita',0,'module',0,'news','','',1,2,'','0',''),(5,'Visi Misi',2,'page',6,'','','',1,0,'','0',''),(6,'Badan Pengurus',2,'page',7,'','','',1,1,'','0',''),(7,'Dewan Pengawas',2,'page',8,'','','',1,2,'','0',''),(8,'Dewan Penyantun',2,'page',11,'','','',1,3,'','0',''),(9,'Press Release',4,'uri',0,'','','/news/category/press-release',1,0,'','0',''),(10,'LBH Pers on Media',4,'uri',0,'','','/news/category/lbh-pers-on-media',1,1,'','0',''),(11,'Program',0,'module',0,'program','','',1,3,'','0',''),(12,'Bantuan Hukum Pers',11,'uri',0,'','','/program/category/bantuan-hukum-pers',1,0,'','0',''),(13,'Perlindungan Kekerasan Terhadap Jurnalis',11,'uri',0,'','','program/category/perlindungan-kekerasan-terhadap-jurnalis',1,1,'','0',''),(14,'Keterbukaan Forum Publik',11,'uri',0,'','','program/category/keterbukaan-forum-publik',1,2,'','0',''),(15,'Internet Freedom',11,'uri',0,'','','program/category/internet-freedom',1,3,'','0',''),(16,'Demokrasi Penyiaran',11,'uri',0,'','','program/category/demokrasi-penyiaran',1,4,'','0',''),(17,'Kasus',0,'module',0,'kasus','','',1,4,'','0',''),(18,'Perdata',17,'uri',0,'','','/kasus/category/perdata',1,0,'','0',''),(19,'Pidana',17,'uri',0,'','','/kasus/category/pidana',1,1,'','0',''),(20,'TUN',17,'uri',0,'','','/kasus/category/tun',1,2,'','0',''),(21,'PHS',17,'uri',0,'','','/kasus/category/phs',1,3,'','0',''),(22,'Data',0,'uri',0,'','','#',1,5,'','0',''),(24,'Foto',22,'module',0,'gallery','','',1,1,'','0',''),(25,'Video',22,'module',0,'videos','','',1,2,'','0',''),(26,'Peraturan Undang-Undang',22,'page',17,'','','',1,3,'','0',''),(27,'Alert',0,'page',18,'','','',1,6,'','0',''),(28,'Pengaduan',0,'uri',0,'','','/pengaduan',1,7,'','0',''),(31,'Donasi',0,'page',21,'','','',1,8,'','0',''),(32,'Jaringan',0,'uri',0,'','','#',1,9,'','0',''),(33,'LBH Pers Padang',32,'page',22,'','','',1,0,'','0',''),(34,'LBH Pers Surabaya',32,'page',23,'','','',1,1,'','0',''),(35,'LBH Pers Makasar',32,'page',24,'','','',1,2,'','0',''),(36,'LBH Pers Kendari',32,'page',25,'','','',1,3,'','0',''),(37,'LBH Pers Yogyakarta',32,'page',26,'','','',1,4,'','0',''),(38,'LBH Pers Manado',32,'page',27,'','','',1,5,'','0',''),(41,'Activity Report',NULL,'page',19,'','','',0,1,'','0',''),(42,'Anual Report',NULL,'page',20,'','','',0,2,'','0','');
/*!40000 ALTER TABLE `default_navigation_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_news`
--

DROP TABLE IF EXISTS `default_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_news` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_news`
--

LOCK TABLES `default_news` WRITE;
/*!40000 ALTER TABLE `default_news` DISABLE KEYS */;
INSERT INTO `default_news` VALUES (1,'2015-03-07 16:11:00','2015-03-07 16:11:00',1,1,'lorem ipsum dolor sit amet 456 gdfjglfdgkfgfgfg','Lorem ipsum dolor sit amet 456','lorem-ipsum-dolor-sit-amet',2,'lorem ajah yayaya','','',1,1425719460,1425719460,'no','live','wysiwyg-advanced','','IMG_20150316_234432.jpg'),(2,'2015-03-07 16:26:00','2015-03-07 16:26:00',1,2,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Lorem ipsum dolor sit amet hehehe 123','lorem-ipsum-dolor-sit-amet-hehehe',1,'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br />\r\n​<br />\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','','',1,1425720360,1425720360,'no','live','wysiwyg-advanced','','IMG_20150309_195305.jpg');
/*!40000 ALTER TABLE `default_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_news_categories`
--

DROP TABLE IF EXISTS `default_news_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_news_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_news_categories`
--

LOCK TABLES `default_news_categories` WRITE;
/*!40000 ALTER TABLE `default_news_categories` DISABLE KEYS */;
INSERT INTO `default_news_categories` VALUES (1,'press-release','Press Release'),(2,'lbh-pers-on-media','LBH Pers on Media');
/*!40000 ALTER TABLE `default_news_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_page_types`
--

DROP TABLE IF EXISTS `default_page_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_page_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `stream_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  `save_as_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `content_label` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_page_types`
--

LOCK TABLES `default_page_types` WRITE;
/*!40000 ALTER TABLE `default_page_types` DISABLE KEYS */;
INSERT INTO `default_page_types` VALUES (1,'default','Default','A simple page type with a WYSIWYG editor that will get you started adding content.',2,'',NULL,'','<!-- <h2>{{ page:title }}</h2> -->\r\n\r\n{{ body }}','','','default.html',1410647777,'n','','');
/*!40000 ALTER TABLE `default_page_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pages`
--

DROP TABLE IF EXISTS `default_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_no_index` tinyint(1) DEFAULT NULL,
  `meta_robots_no_follow` tinyint(1) DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pages`
--

LOCK TABLES `default_pages` WRITE;
/*!40000 ALTER TABLE `default_pages` DISABLE KEYS */;
INSERT INTO `default_pages` VALUES (1,'home','','Home','home',0,'1','1','','','','',0,0,'',0,0,'live',1370575341,1413959451,'0',1,1,0),(2,'kontak','','Kontak','kontak',0,'1','2','','','','',0,0,'',0,0,'live',1370575341,1425491849,'0',0,1,1),(3,'search','','Search','search',0,'1','3',NULL,NULL,NULL,'',NULL,NULL,NULL,0,0,'live',1370575341,0,'',0,1,2),(4,'results','','Results','search/results',3,'1','4',NULL,NULL,NULL,'',NULL,NULL,NULL,0,0,'live',1370575341,0,'',0,0,0),(5,'404','','Page missing','404',0,'1','5',NULL,NULL,NULL,'',NULL,NULL,NULL,0,0,'live',1370575341,0,'',0,1,3),(6,'visi-misi','','Visi Misi','visi-misi',0,'1','6','','','','',0,0,'',0,0,'live',1410414315,1425488331,'0',0,1,4),(7,'badan-pengurus','','Badan Pengurus','badan-pengurus',0,'1','7','','','','',0,0,'',0,0,'live',1410436395,1425488795,'0',0,1,5),(8,'dewan-pengawas','','Dewan Pengawas','dewan-pengawas',0,'1','8','','','','',0,0,'',0,0,'live',1410437003,1425489558,'0',0,1,6),(11,'dewan-penyantun','','Dewan Penyantun','dewan-penyantun',0,'1','11','','','','',0,0,'',0,0,'live',1410473332,1425489688,'0',0,1,7),(12,'kasus-perdata','','Kasus - Perdata','kasus-perdata',0,'1','12','','','','',0,0,'',0,0,'live',1410481744,1425489862,'0',0,1,8),(13,'kasus-pidana','','Kasus - Pidana','kasus-pidana',0,'1','13','','','','',0,0,'',0,0,'live',1410784017,1425489895,'0',0,1,9),(14,'kasus-tun','','Kasus - TUN','kasus-tun',0,'1','14','','','','',0,0,'',0,0,'live',1410784161,1425489990,'0',0,1,10),(15,'kasus-phs','','Kasus - PHS','kasus-phs',0,'1','15','','','','',0,0,'',0,0,'live',1410784214,1425490031,'0',0,1,11),(16,'data-kasus','','Data - Kasus','data-kasus',0,'1','16','','','','',0,0,'',0,0,'live',1410784322,1425490182,'0',0,1,12),(17,'data-peraturan-undangundang','','Data - Peraturan Undang-Undang','data-peraturan-undangundang',0,'1','17','','','','',0,0,'',0,0,'live',1425490329,0,'0',0,1,1425490329),(18,'alert','','Alert','alert',0,'1','18','','','','',0,0,'',0,0,'live',1425490514,1425490708,'0',0,1,1425490514),(19,'pengaduan-activity-report','','Activity Report','pengaduan-activity-report',0,'1','19','','','','',0,0,'',0,0,'live',1425491199,1425491214,'0',0,1,1425491199),(20,'pengaduan-anual-report','','Anual Report','pengaduan-anual-report',0,'1','20','','','','',0,0,'',0,0,'live',1425491299,0,'0',0,1,1425491299),(21,'donasi','','Donasi','donasi',0,'1','21','','','','',0,0,'',0,0,'live',1425491364,0,'0',0,1,1425491364),(22,'jaringan-lbh-pers-padang','','Jaringan - LBH Pers Padang','jaringan-lbh-pers-padang',0,'1','22','','','','',0,0,'',0,0,'live',1425491463,0,'0',0,1,1425491463),(23,'jaringan-lbh-pers-surabaya','','Jaringan - LBH Pers Surabaya','jaringan-lbh-pers-surabaya',0,'1','23','','','','',0,0,'',0,0,'live',1425491500,0,'0',0,1,1425491500),(24,'jaringan-lbh-pers-makasar','','Jaringan - LBH Pers Makasar','jaringan-lbh-pers-makasar',0,'1','24','','','','',0,0,'',0,0,'live',1425491536,0,'0',0,1,1425491536),(25,'jaringan-lbh-pers-kendari','','Jaringan - LBH Pers Kendari','jaringan-lbh-pers-kendari',0,'1','25','','','','',0,0,'',0,0,'live',1425491564,0,'0',0,1,1425491564),(26,'jaringan-lbh-pers-yogyakarta','','Jaringan - LBH Pers Yogyakarta','jaringan-lbh-pers-yogyakarta',0,'1','26','','','','',0,0,'',0,0,'live',1425491602,0,'0',0,1,1425491602),(27,'jaringan-lbh-pers-manado','','Jaringan - LBH Pers Manado','jaringan-lbh-pers-manado',0,'1','27','','','','',0,0,'',0,0,'live',1425491626,0,'0',0,1,1425491626);
/*!40000 ALTER TABLE `default_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_pengaduan`
--

DROP TABLE IF EXISTS `default_pengaduan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_pengaduan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` int(1) DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_pengaduan`
--

LOCK TABLES `default_pengaduan` WRITE;
/*!40000 ALTER TABLE `default_pengaduan` DISABLE KEYS */;
INSERT INTO `default_pengaduan` VALUES (1,'aa','a','a','a',NULL,'2015-03-13 23:45:46',NULL,NULL,NULL);
/*!40000 ALTER TABLE `default_pengaduan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_permissions`
--

DROP TABLE IF EXISTS `default_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_permissions`
--

LOCK TABLES `default_permissions` WRITE;
/*!40000 ALTER TABLE `default_permissions` DISABLE KEYS */;
INSERT INTO `default_permissions` VALUES (2,2,'konsultasi','{\"bertanya\":\"1\",\"menjawab\":\"1\",\"menata\":\"1\"}');
/*!40000 ALTER TABLE `default_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_profiles`
--

DROP TABLE IF EXISTS `default_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_profiles`
--

LOCK TABLES `default_profiles` WRITE;
/*!40000 ALTER TABLE `default_profiles` DISABLE KEYS */;
INSERT INTO `default_profiles` VALUES (1,NULL,NULL,NULL,NULL,1,'Abu','Tatang','Al-Mubarak','1/IMG_20141107_154321.jpg',NULL,'en','',-25200,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1426241177),(2,'2014-09-23 01:52:16',NULL,1,1,2,'Muhajir','Muhajir','ajir',NULL,'farrasindo','en','seorang lelaki',568108800,'m',NULL,'085697790130',NULL,NULL,'jakarta','11610',NULL,NULL),(3,'2014-10-18 03:58:56',NULL,1,2,3,'Tatang Ajah','Tatang','Ajah',NULL,NULL,'en',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `default_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_program`
--

DROP TABLE IF EXISTS `default_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_program` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_desc` text COLLATE utf8_unicode_ci,
  `long_desc` text COLLATE utf8_unicode_ci,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_program`
--

LOCK TABLES `default_program` WRITE;
/*!40000 ALTER TABLE `default_program` DISABLE KEYS */;
INSERT INTO `default_program` VALUES (1,1,'2015-03-06 08:45:33',NULL,1,1,'Lorem ipsum dolor sit amet','lorem-ipsum-dolor-sit-amet','Lorem ipsum dolor sit amet kolor si memet melorot melulu jadi repot deh','Lorem ipsum dolor sit amet kolor si memet melorot melulu jadi repot deh<br />\r\nLorem ipsum dolor sit amet kolor si memet melorot melulu jadi repot deh &#39;Lorem ipsum dolor sit amet kolor si memet melorot melulu jadi repot deh','2015-03-21 08:45:33','2015-03-09 22:06:08',1,1,'IMG_20150309_211807.jpg'),(2,2,'2015-03-11 20:42:07',NULL,1,2,'hahahaha hohohoho','hahahaha-hohohoho','aaaaaaaaaaaaaaaa','aaaaaaaaaaaaaaaa<br />\r\naaaaaaaaaaaaaaaaa','2015-03-22 20:42:07','2015-03-12 04:38:13',1,1,'IMG_20150312_043813.jpg');
/*!40000 ALTER TABLE `default_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_program_categories`
--

DROP TABLE IF EXISTS `default_program_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_program_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_slug` (`slug`),
  UNIQUE KEY `unique_title` (`title`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_program_categories`
--

LOCK TABLES `default_program_categories` WRITE;
/*!40000 ALTER TABLE `default_program_categories` DISABLE KEYS */;
INSERT INTO `default_program_categories` VALUES (1,'bantuan-hukum-pers','Bantuan Hukum Pers'),(2,'perlindungan-kekerasan-terhadap-jurnalis','Perlindungan Kekerasan Terhadap Jurnalis'),(3,'keterbukaan-forum-publik','Keterbukaan Forum Publik'),(4,'internet-freedom','Internet Freedom'),(5,'demokrasi-penyiaran','Demokrasi Penyiaran');
/*!40000 ALTER TABLE `default_program_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_redirects`
--

DROP TABLE IF EXISTS `default_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302',
  PRIMARY KEY (`id`),
  KEY `from` (`from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_redirects`
--

LOCK TABLES `default_redirects` WRITE;
/*!40000 ALTER TABLE `default_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_search_index`
--

DROP TABLE IF EXISTS `default_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_search_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `keyword_hash` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_edit_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`module`,`entry_key`,`entry_id`(190)),
  FULLTEXT KEY `full search` (`title`,`description`,`keywords`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_search_index`
--

LOCK TABLES `default_search_index` WRITE;
/*!40000 ALTER TABLE `default_search_index` DISABLE KEYS */;
INSERT INTO `default_search_index` VALUES (58,'Home','',NULL,NULL,'pages','pages:page','pages:pages','1','home','admin/pages/edit/1','admin/pages/delete/1'),(105,'Kontak','',NULL,NULL,'pages','pages:page','pages:pages','2','kontak','admin/pages/edit/2','admin/pages/delete/2'),(3,'Search','',NULL,NULL,'pages','pages:page','pages:pages','3','search','admin/pages/edit/3','admin/pages/delete/3'),(4,'Results','',NULL,NULL,'pages','pages:page','pages:pages','4','search/results','admin/pages/edit/4','admin/pages/delete/4'),(5,'Page missing','',NULL,NULL,'pages','pages:page','pages:pages','5','404','admin/pages/edit/5','admin/pages/delete/5'),(83,'Visi Misi','',NULL,NULL,'pages','pages:page','pages:pages','6','visi-misi','admin/pages/edit/6','admin/pages/delete/6'),(84,'Badan Pengurus','',NULL,NULL,'pages','pages:page','pages:pages','7','badan-pengurus','admin/pages/edit/7','admin/pages/delete/7'),(85,'Dewan Pengawas','',NULL,NULL,'pages','pages:page','pages:pages','8','dewan-pengawas','admin/pages/edit/8','admin/pages/delete/8'),(88,'Kasus - Pidana','',NULL,NULL,'pages','pages:page','pages:pages','13','kasus-pidana','admin/pages/edit/13','admin/pages/delete/13'),(116,'Rakonreg Kemenpera Wilayah Kalimantan Sulawesi',' MAKASSAR -&nbsp;Kemenpera menargetkan penyelesaian masalah backlog perumahan di Indonesia dapat diatasi secara keseluruhan pada tahun 2030 mendatang. Untuk itu diperlukan kerjasama dari berbagai pihak khususnya para pemangku kepentingan bidang perumahan baik pemerintah pusat, pemerintah daerah, pengembang dan masyarakat luas untuk mendukung pelaksanaan program perumahan di seluruh Indonesia.\r\n&quot;Berdasarkan perhitungan dari Kemenpera kami asumsikan tahun 2030 mendatang masalah backlog perumahan bisa diselesaikan,&quot; ujar Kepala Biro Perencanaan Kemenpera Hardi Simamora pada pembukaan kegiatan Rapat Konsultasi Regional Kemenpera Tahun 2014 di Hotel Sahid, Makassar.\r\nKegiatan Rakonreg Kemenpera tahun 2014 tersebut dihadiri Staf Ahli Gubernur Sulsel Bidang Pembangunan Abdul Haris serta perwakilan pejabat dari tiap-tiap Kedeputian, Bappenas, Kemendagri serta Bappeda Provinsi, Kepala Dinas Provinsi dan Kabupaten/ Kota yang menangani urusan perumahan dan kawasan permukiman.\r\nMenurut Hardi, Kemenpera sangat mengharapkan dukungan Pemda, pengembang dan masyarakat guna mengatasi masalah backlog perumahan tersebut. Sebab kebutuhan rumah merupakan salah satu kebutuhan pokok masyarakat yang harus dipenuhi dengan baik.\r\nPemerintah, imbuhnya, memperkirakan kebutuhan rumah masyarakat berpenghasilan rendah per tahun mencapai angka 800 ribu unit. Sedangkan kemampuan pemerintah untuk memenuhi pembangunan rumah hanya 200 hingga 300 ribu unit rumah setiap tahunnya.\r\n&quot;Selama ini masih ada kesenjangan antara jumlah kebutuhan rumah masyarakat dan pasokan dari pemerintah dan pengembang. Pemda dalam hal ini diharapkan juga bisa aktif mendorong pembangunan rumah bagi masyarakatnya karena berdasarkan PP Nomor 38 Tahun 2007 masalah perumahan menjadi salah satu urusan wajib Pemda,&quot; terangnya.\r\nAdanya program perumahan yang terlaksana dengan baik di daerah diharapkan dapat menjadi motor pembangunan kesejahteraan dan ekonomi masyarakat. Oleh karena itu, Kemenpera juga terus berupaya agar peran Pemda dalam program pembangunan perumahan bisa lebih diperkuat lagi.&nbsp;\r\n&quot;Kemenpera juga meminta Pemda untuk dapat memastikan rencana lokasi program pembangunan perumahan tahun 2015 mendatang. Selain itu Pemda juga harus mulai mengidentifikasi berapa kebutuhan perumahan bagi masyarakatnya sehingga pemerintab dapat mengetahui secara pasti berapa kekurangan rumah di Indonesia secara keseluruhan,&quot; tandasnya.\r\nSebelumnya, Ketua Panitia Rakonreg Kemenpera Nostra Tarigan mengungkapkan, kegiatan tersebut juga membahasa mengenai pokok-pokok kebijakan perencanaan program perumahan tahun 2015-2019 mendatang. Kegiatan serupa juga dilaksanakan di tiga wilayah yakni Bali, Jakarta dan Batam.\r\n&quot;Kami juga akan membahas usulan kegiatan dari Pemda mulai dari tingkat Provinsi dan Kabupaten/kota yang diselaraskan dengan program dari Kedeputian di Kemenpera sehingga sinergi program pemerintah pusat dan daerah dapat berjalan dengan baik,&quot; harapnya.',NULL,NULL,'blog','blog:post','blog:posts','2','blog/2014/10/rakonreg-kemenpera-wilayah-kalimantan-sulawesi','admin/blog/edit/2','admin/blog/delete/2'),(86,'Dewan Penyantun','',NULL,NULL,'pages','pages:page','pages:pages','11','dewan-penyantun','admin/pages/edit/11','admin/pages/delete/11'),(87,'Kasus - Perdata','',NULL,NULL,'pages','pages:page','pages:pages','12','kasus-perdata','admin/pages/edit/12','admin/pages/delete/12'),(89,'Kasus - TUN','',NULL,NULL,'pages','pages:page','pages:pages','14','kasus-tun','admin/pages/edit/14','admin/pages/delete/14'),(92,'Data - Kasus','',NULL,NULL,'pages','pages:page','pages:pages','16','data-kasus','admin/pages/edit/16','admin/pages/delete/16'),(108,'Bimbingan Teknis Penyusunan RP3KP Wilayah Sulawesi Utara','Manado 28 Oktober 2015\r\nTelah dilaksanakan kegiatan bimbingan teknis penyusunan RP3KP Wilayah Provinsi Sulawesi Utara di Manado, yang diikuti oleh 10 Kabupaten Kota.',NULL,NULL,'blog','blog:post','blog:posts','3','blog/2014/10/bimbingan-teknis-penyusunan-rp3kp-wilayah-sulawesi-utara','admin/blog/edit/3','admin/blog/delete/3'),(91,'Kasus - PHS','',NULL,NULL,'pages','pages:page','pages:pages','15','kasus-phs','admin/pages/edit/15','admin/pages/delete/15'),(93,'Data - Peraturan Undang-Undang','',NULL,NULL,'pages','pages:page','pages:pages','17','data-peraturan-undangundang','admin/pages/edit/17','admin/pages/delete/17'),(95,'Alert','',NULL,NULL,'pages','pages:page','pages:pages','18','alert','admin/pages/edit/18','admin/pages/delete/18'),(96,'Activity Report','',NULL,NULL,'pages','pages:page','pages:pages','19','pengaduan-activity-report','admin/pages/edit/19','admin/pages/delete/19'),(97,'Anual Report','',NULL,NULL,'pages','pages:page','pages:pages','20','pengaduan-anual-report','admin/pages/edit/20','admin/pages/delete/20'),(98,'Donasi','',NULL,NULL,'pages','pages:page','pages:pages','21','donasi','admin/pages/edit/21','admin/pages/delete/21'),(99,'Jaringan - LBH Pers Padang','',NULL,NULL,'pages','pages:page','pages:pages','22','jaringan-lbh-pers-padang','admin/pages/edit/22','admin/pages/delete/22'),(100,'Jaringan - LBH Pers Surabaya','',NULL,NULL,'pages','pages:page','pages:pages','23','jaringan-lbh-pers-surabaya','admin/pages/edit/23','admin/pages/delete/23'),(101,'Jaringan - LBH Pers Makasar','',NULL,NULL,'pages','pages:page','pages:pages','24','jaringan-lbh-pers-makasar','admin/pages/edit/24','admin/pages/delete/24'),(102,'Jaringan - LBH Pers Kendari','',NULL,NULL,'pages','pages:page','pages:pages','25','jaringan-lbh-pers-kendari','admin/pages/edit/25','admin/pages/delete/25'),(103,'Jaringan - LBH Pers Yogyakarta','',NULL,NULL,'pages','pages:page','pages:pages','26','jaringan-lbh-pers-yogyakarta','admin/pages/edit/26','admin/pages/delete/26'),(104,'Jaringan - LBH Pers Manado','',NULL,NULL,'pages','pages:page','pages:pages','27','jaringan-lbh-pers-manado','admin/pages/edit/27','admin/pages/delete/27'),(123,'Lorem ipsum dolor sit amet 456','lorem ajah yayaya',NULL,NULL,'news','news:post','news:posts','1','news/2015/03/lorem-ipsum-dolor-sit-amet','admin/news/edit/1','admin/news/delete/1'),(124,'Lorem ipsum dolor sit amet hehehe 123','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n​\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL,'news','news:post','news:posts','2','news/2015/03/lorem-ipsum-dolor-sit-amet-hehehe','admin/news/edit/2','admin/news/delete/2');
/*!40000 ALTER TABLE `default_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_settings`
--

DROP TABLE IF EXISTS `default_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`),
  UNIQUE KEY `unique_slug` (`slug`),
  KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_settings`
--

LOCK TABLES `default_settings` WRITE;
/*!40000 ALTER TABLE `default_settings` DISABLE KEYS */;
INSERT INTO `default_settings` VALUES ('site_name','Site Name','The name of the website for page titles and for use around the site.','text','Un-named Website','LBH Pers','',1,1,'',1000),('site_slogan','Site Slogan','The slogan of the website for page titles and for use around the site','text','','Selamat Datang','',0,1,'',999),('meta_topic','Meta Topic','Two or three words describing this type of company/website.','text','Content Management','Add your slogan here','',0,1,'',998),('site_lang','Site Language','The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.','select','en','en','func:get_supported_lang',1,1,'',997),('site_public_lang','Public Languages','Which are the languages really supported and offered on the front-end of your website?','checkbox','en','id','func:get_supported_lang',1,1,'',996),('date_format','Date Format','How should dates be displayed across the website and control panel? Using the <a target=\"_blank\" href=\"http://php.net/manual/en/function.date.php\">date format</a> from PHP - OR - Using the format of <a target=\"_blank\" href=\"http://php.net/manual/en/function.strftime.php\">strings formatted as date</a> from PHP.','text','F j, Y','','',1,1,'',995),('currency','Currency','The currency symbol for use on products, services, etc.','text','&pound;','','',1,1,'',994),('records_per_page','Records Per Page','How many records should we show per page in the admin section?','select','10','','10=10|25=25|50=50|100=100',1,1,'',992),('rss_feed_items','Feed item count','How many items should we show in RSS/blog feeds?','select','25','','10=10|25=25|50=50|100=100',1,1,'',991),('dashboard_rss','Dashboard RSS Feed','Link to an RSS feed that will be displayed on the dashboard.','text','https://www.pyrocms.com/blog/rss/all.rss','','',0,1,'',990),('dashboard_rss_count','Dashboard RSS Items','How many RSS items would you like to display on the dashboard?','text','5','5','',1,1,'',989),('frontend_enabled','Site Status','Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.','radio','1','','1=Open|0=Closed',1,1,'',988),('unavailable_message','Unavailable Message','When the site is turned off or there is a major problem, this message will show to users.','textarea','Sorry, this website is currently unavailable.','','',0,1,'',987),('ga_tracking','Google Tracking Code','Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6','text','','','',0,1,'integration',985),('ga_profile','Google Analytic Profile ID','Profile ID for this website in Google Analytics','text','','','',0,1,'integration',984),('ga_email','Google Analytic E-mail','E-mail address used for Google Analytics, we need this to show the graph on the dashboard.','text','','ttg','',0,1,'integration',983),('ga_password','Google Analytic Password','This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href=\"https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US\" target=\"_blank\">Authorized Access to your Google Account</a>','password','','12345678','',0,1,'integration',982),('contact_email','Contact E-mail','All e-mails from users, guests and the site will go to this e-mail address.','text','blekedeg@gmail.com','tatangajah@gmail.com','',1,1,'email',979),('server_email','Server E-mail','All e-mails to users will come from this e-mail address.','text','admin@localhost','','',1,1,'email',978),('mail_protocol','Mail Protocol','Select desired email protocol.','select','mail','mail','mail=Mail|sendmail=Sendmail|smtp=SMTP',1,1,'email',977),('mail_smtp_host','SMTP Host Name','The host name of your smtp server.','text','','','',0,1,'email',976),('mail_smtp_pass','SMTP password','SMTP password.','password','','','',0,1,'email',975),('mail_smtp_port','SMTP Port','SMTP port number.','text','','','',0,1,'email',974),('mail_smtp_user','SMTP User Name','SMTP user name.','text','','','',0,1,'email',973),('mail_sendmail_path','Sendmail Path','Path to server sendmail binary.','text','','','',0,1,'email',972),('mail_line_endings','Email Line Endings','Change from the standard \\r\\n line ending to PHP_EOL for some email servers.','select','1','1','0=PHP_EOL|1=\\r\\n',0,1,'email',972),('admin_force_https','Force HTTPS for Control Panel?','Allow only the HTTPS protocol when using the Control Panel?','radio','0','','1=Yes|0=No',1,1,'',0),('api_enabled','API Enabled','Allow API access to all modules which have an API controller.','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),('api_user_keys','API User Keys','Allow users to sign up for API keys (if the API is Enabled).','select','0','0','0=Disabled|1=Enabled',0,0,'api',0),('cdn_domain','CDN Domain','CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.','text','','','',0,1,'integration',1000),('addons_upload','Addons Upload Permissions','Keeps mere admins from uploading addons by default','text','0','1','',1,0,'',0),('default_theme','Default Theme','Select the theme you want users to see by default.','','default','lbhpers','func:get_themes',1,0,'',0),('admin_theme','Control Panel Theme','Select the theme for the control panel.','','','pyrocms','func:get_themes',1,0,'',0),('akismet_api_key','Akismet API Key','Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.','text','','','',0,1,'integration',981),('enable_comments','Enable Comments','Enable comments.','radio','0','0','1=Enabled|0=Disabled',1,1,'comments',968),('moderate_comments','Moderate Comments','Force comments to be approved before they appear on the site.','radio','1','0','1=Enabled|0=Disabled',1,1,'comments',967),('comment_order','Comment Order','Sort order in which to display comments.','select','ASC','ASC','ASC=Oldest First|DESC=Newest First',1,1,'comments',966),('comment_markdown','Allow Markdown','Do you want to allow visitors to post comments using Markdown?','select','0','0','0=Text Only|1=Allow Markdown',1,1,'comments',965),('files_cache','Files Cache','When outputting an image via site.com/files what shall we set the cache expiration for?','select','480','480','0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days',1,1,'files',986),('files_enabled_providers','Enabled File Storage Providers','Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below','checkbox','0','0','amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files',0,1,'files',994),('files_s3_access_key','Amazon S3 Access Key','To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href=\"https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials\">Find your credentials</a>','text','','','',0,1,'files',993),('files_s3_secret_key','Amazon S3 Secret Key','You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.','text','','','',0,1,'files',992),('files_s3_geographic_location','Amazon S3 Geographic Location','Either US or EU. If you change this you must also change the S3 URL.','radio','US','US','US=United States|EU=Europe',1,1,'files',991),('files_s3_url','Amazon S3 URL','Change this if using one of Amazon\'s EU locations or a custom domain.','text','http://{{ bucket }}.s3.amazonaws.com/','http://{{ bucket }}.s3.amazonaws.com/','',0,1,'files',991),('files_cf_username','Rackspace Cloud Files Username','To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href=\"https://manage.rackspacecloud.com/APIAccess.do\">Find your credentials</a>','text','','','',0,1,'files',990),('files_cf_api_key','Rackspace Cloud Files API Key','You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.','text','','','',0,1,'files',989),('files_upload_limit','Filesize Limit','Maximum filesize to allow when uploading. Specify the size in MB. Example: 5','text','5','5','',1,1,'files',987),('auto_username','Auto Username','Create the username automatically, meaning users can skip making one on registration.','radio','1','','1=Enabled|0=Disabled',0,1,'users',964),('enable_profiles','Enable profiles','Allow users to add and edit profiles.','radio','1','','1=Enabled|0=Disabled',1,1,'users',963),('activation_email','Activation Email','Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.','select','1','','0=activate_by_admin|1=activate_by_email|2=no_activation',0,1,'users',961),('registered_email','User Registered Email','Send a notification email to the contact e-mail when someone registers.','radio','1','','1=Enabled|0=Disabled',0,1,'users',962),('enable_registration','Enable user registration','Allow users to register in your site.','radio','1','','1=Enabled|0=Disabled',0,1,'users',961),('profile_visibility','Profile Visibility','Specify who can view user profiles on the public site','select','public','','public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member',0,1,'users',960),('ckeditor_config','CKEditor Config','You can find a list of valid configuration items in <a target=\"_blank\" href=\"http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html\">CKEditor\'s documentation.</a>','textarea','','{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(\'textarea#intro.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'pyroimages\'],\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\'],\r\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\r\n	  ],\r\n	extraPlugins: \'pyroimages\',\r\n	width: \'99%\',\r\n	height: 200,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(\'textarea.wysiwyg-simple\').ckeditor({\r\n	toolbar: [\r\n		[\'Bold\', \'Italic\', \'-\', \'NumberedList\', \'BulletedList\', \'-\', \'Link\', \'Unlink\'],\r\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\r\n	  ],\r\n	width: \'99%\',\r\n	height: 200,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(\'textarea.wysiwyg-advanced\').ckeditor({\r\n	toolbar: [\r\n		[\'Maximize\'],\r\n		[\'pyroimages\', \'pyrofiles\'],\r\n		[\'Cut\',\'Copy\',\'Paste\',\'PasteFromWord\'],\r\n		[\'Undo\',\'Redo\',\'-\',\'Find\',\'Replace\'],\r\n		[\'Link\',\'Unlink\'],\r\n		[\'Table\',\'HorizontalRule\',\'SpecialChar\'],\r\n		[\'Bold\',\'Italic\',\'StrikeThrough\'],\r\n		[\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\r\n		[\'Format\', \'FontSize\', \'Subscript\',\'Superscript\', \'NumberedList\',\'BulletedList\',\'Outdent\',\'Indent\',\'Blockquote\'],\r\n		[\'ShowBlocks\', \'RemoveFormat\', \'Source\']\r\n	],\r\n	extraPlugins: \'pyroimages,pyrofiles\',\r\n	width: \'99%\',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: \'#000\',\r\n	removePlugins: \'elementspath\',\r\n	defaultLanguage: \'{{ helper:config item=\"default_language\" }}\',\r\n	language: \'{{ global:current_language }}\'\r\n});','',1,1,'wysiwyg',993),('forums_editor','Forum Editor','Which editor should the forums use?','select','bbcode','bbcode','bbcode=BBCode|textile=Textile',1,1,'forums',0);
/*!40000 ALTER TABLE `default_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_slideshow`
--

DROP TABLE IF EXISTS `default_slideshow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_slideshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_slideshow`
--

LOCK TABLES `default_slideshow` WRITE;
/*!40000 ALTER TABLE `default_slideshow` DISABLE KEYS */;
INSERT INTO `default_slideshow` VALUES (1,'Lorem Ipsum Dolor Sit Amet','heheheh yayaya','lorem-ipsum-dolor-sit-amet_img_20151218_114817.jpg',1,'2015-12-18 11:48:17',1,NULL,NULL),(2,'Test Ajah dulu','ya boleh-boleh sajah toh','test-ajah-dulu_img_20151218_131811.jpg',1,'2015-12-18 13:09:17',1,'2015-12-18 13:18:11',1);
/*!40000 ALTER TABLE `default_slideshow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_theme_options`
--

DROP TABLE IF EXISTS `default_theme_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_theme_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_theme_options`
--

LOCK TABLES `default_theme_options` WRITE;
/*!40000 ALTER TABLE `default_theme_options` DISABLE KEYS */;
INSERT INTO `default_theme_options` VALUES (1,'pyrocms_recent_comments','Recent Comments','Would you like to display recent comments on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(2,'pyrocms_news_feed','News Feed','Would you like to display the news feed on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(3,'pyrocms_quick_links','Quick Links','Would you like to display quick links on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(4,'pyrocms_analytics_graph','Analytics Graph','Would you like to display the graph on the dashboard?','radio','yes','yes','yes=Yes|no=No',1,'pyrocms'),(5,'show_breadcrumbs','Show Breadcrumbs','Would you like to display breadcrumbs?','radio','yes','yes','yes=Yes|no=No',1,'default'),(6,'layout','Layout','Which type of layout shall we use?','select','2 column','2 column','2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page',1,'default'),(7,'background','Background','Choose the default background for the theme.','select','fabric','fabric','black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture',1,'base'),(8,'slider','Slider','Would you like to display the slider on the homepage?','radio','yes','yes','yes=Yes|no=No',1,'base'),(9,'color','Default Theme Color','This changes things like background color, link colors etc…','select','pink','pink','red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink',1,'base'),(10,'show_breadcrumbs','Do you want to show breadcrumbs?','If selected it shows a string of breadcrumbs at the top of the page.','radio','yes','yes','yes=Yes|no=No',1,'base'),(11,'show_breadcrumbs','Show Breadcrumbs','Would you like to display breadcrumbs?','radio','yes','yes','yes=Yes|no=No',1,'kementrian'),(12,'layout','Layout','Which type of layout shall we use?','select','2 column','2 column','2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page',1,'kementrian'),(13,'show_breadcrumbs','Show Breadcrumbs','Would you like to display breadcrumbs?','radio','yes','yes','yes=Yes|no=No',1,'lbhpers'),(14,'layout','Layout','Which type of layout shall we use?','select','2 column','2 column','2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page',1,'lbhpers');
/*!40000 ALTER TABLE `default_theme_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_ticket`
--

DROP TABLE IF EXISTS `default_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_ticket` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `issuer_id` int(11) DEFAULT NULL,
  `datetime_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_ticket`
--

LOCK TABLES `default_ticket` WRITE;
/*!40000 ALTER TABLE `default_ticket` DISABLE KEYS */;
INSERT INTO `default_ticket` VALUES (1,'Kesehatan',1,'2014-09-12 10:31:49');
/*!40000 ALTER TABLE `default_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_ticket_message`
--

DROP TABLE IF EXISTS `default_ticket_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_ticket_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned DEFAULT NULL,
  `sender_id` int(11) unsigned DEFAULT NULL,
  `datetime_gmt` datetime DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_ticket_message`
--

LOCK TABLES `default_ticket_message` WRITE;
/*!40000 ALTER TABLE `default_ticket_message` DISABLE KEYS */;
INSERT INTO `default_ticket_message` VALUES (1,1,1,'2014-09-12 10:31:49','Bagaimana kesehatan Anda?');
/*!40000 ALTER TABLE `default_ticket_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_users`
--

DROP TABLE IF EXISTS `default_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catatan_tatang` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_users`
--

LOCK TABLES `default_users` WRITE;
/*!40000 ALTER TABLE `default_users` DISABLE KEYS */;
INSERT INTO `default_users` VALUES (1,'blekedeg@gmail.com','e10adc3949ba59abbe56e057f20f883e','3a7fc',1,'',1,'',1370575336,1450385806,'ttg','855767963950e9d01f7188e982951464','10470c3b4b1fed12c3baac014be15fac67c6e815','user: ttg; pass: 123456(c3db809c792921a5a31ccc4d1228bb92b4ddd5ba)'),(2,'gho_za_nemoziz@yahoo.com','bfb0932448a9b32c7f67aba7628ad7f2','78bf5e',2,'::1',1,NULL,1411487535,1411525409,'Ghojir',NULL,NULL,NULL),(3,'tatangajah@gmail.com','e10adc3949ba59abbe56e057f20f883e','a7c79e',1,'127.0.0.1',1,NULL,1413547136,1413547166,'tatang',NULL,'10470c3b4b1fed12c3baac014be15fac67c6e815',NULL);
/*!40000 ALTER TABLE `default_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_variables`
--

DROP TABLE IF EXISTS `default_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_variables`
--

LOCK TABLES `default_variables` WRITE;
/*!40000 ALTER TABLE `default_variables` DISABLE KEYS */;
INSERT INTO `default_variables` VALUES (1,'modcalendar_home_styles','0'),(2,'modcalendar_widget_styles','0'),(3,'modcalendar_menu_status','0'),(4,'modcalendar_widget_size','0'),(5,'modcalendar_widget_hover','0'),(6,'modcalendar_calendar_size','biggest'),(7,'modcalendar_calendar_style','orig'),(8,'modcalendar_calendar_dateformat','M d, Y H:i');
/*!40000 ALTER TABLE `default_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_videos`
--

DROP TABLE IF EXISTS `default_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `video_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_videos`
--

LOCK TABLES `default_videos` WRITE;
/*!40000 ALTER TABLE `default_videos` DISABLE KEYS */;
INSERT INTO `default_videos` VALUES (1,'The NEW king of motorbike in ASIA (teaser)  LC150 Jupiter MX Sniper Exciter 150 Spark Yamaha','Valentino Rossi rides the new king of of motorbike in asia!','LYiymbjJGfU',1,'2015-03-20 01:12:39',NULL,'2015-03-20 02:03:25',1),(2,'Deklarasi LBH Pers Yogyakarta di Makam Jurnalis yang Terbunuh','Deklarasi berdirinya LBH Pers yang dilakukan di hadapan pusara seorang jurnalis ini bukan tanpa sebab. Kasus Udin menjadi contoh tidak adanya perlindungan hukum terhadap jurnalis. Kasus Udin yang dibunuh orang tak dikenal 16 tahun lalu, sudah hampir mencapai tanggal kadaluarsanya beberapa bulan lagi, sementara penyidikan masih belum menemukan titik terang.','WakXaiQM_Zw',1,'2015-03-20 02:09:09',1,NULL,NULL),(3,'Konferensi Pers Bambang Widjojanto','Wakil Pimpinan KPK, Bambang Widjojanto, memberikan keterangan pers di kediamannya pasca ditangkap oleh pihak kepolisian ketika mengantar anaknya bersekolah di sekitar Depok, Jawa Barat pada Jumat (23/1) pagi hari.','TOBQYTafnms',1,'2015-03-20 02:11:52',1,'2015-03-20 02:19:54',1),(4,'LAWAN KRIMINALISASI PERS','Tiga organisasi profesi, AJI, IJTI dan PWI, bersama LBH Pers Jakarta dan pers korban kriminalisasi yang diwakili Arif Zulkifli dari Tempo, menggelar jumpa pers di Dewan Pers, Kamis (5/3/2015) sore. Dalam pertemuan, diserukan upaya melawan kriminalisasi pers yang belakangan kembali marak.','1EOzlF3Hhzw',1,'2015-03-20 02:13:22',1,NULL,NULL);
/*!40000 ALTER TABLE `default_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_videos_`
--

DROP TABLE IF EXISTS `default_videos_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_videos_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `created_by` int(10) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_videos_`
--

LOCK TABLES `default_videos_` WRITE;
/*!40000 ALTER TABLE `default_videos_` DISABLE KEYS */;
INSERT INTO `default_videos_` VALUES (1,'Lorem ipsum dolor sit ametz','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','VID_20150312_032919.mp4','AU-wp1.jpg',1,'2015-03-08 04:45:01',1,'2015-03-12 03:29:19',1),(2,'Batu Mulia dan Akik','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','Batu Aneh 3.mp4','CA-wp1.jpg',1,'2015-03-08 05:01:35',1,'2015-03-12 03:13:14',1);
/*!40000 ALTER TABLE `default_videos_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_visitors_counter`
--

DROP TABLE IF EXISTS `default_visitors_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_visitors_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `time_hit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_visitors_counter`
--

LOCK TABLES `default_visitors_counter` WRITE;
/*!40000 ALTER TABLE `default_visitors_counter` DISABLE KEYS */;
INSERT INTO `default_visitors_counter` VALUES (1,'',1,'2015-02-28 03:55:25'),(2,'/news/2014/10/28/bimbingan-teknis-penyusunan-rp3kp-wilayah-sulawesi-utara',1,'2015-03-02 20:53:05'),(3,'edit-profile',2,'2015-03-03 15:22:34'),(4,'news',62,'2015-03-04 23:57:32'),(5,'news/1',1,'2015-03-04 01:51:08'),(6,'news/2014/10/28/bimbingan-teknis-penyusunan-rp3kp-wilayah-sulawesi-utara',4,'2015-03-04 02:29:51'),(7,'news/2014/10/16/rakonreg-kemenpera-wilayah-kalimantan-sulawesi',5,'2015-03-04 02:30:07'),(8,'edit-profile',1,'2015-03-04 02:18:22'),(9,'news/category/aktivitas-rp3kp',2,'2015-03-04 02:25:38'),(10,'news',81,'2015-03-05 04:13:57'),(11,'news/2014/10/28/lorem-ipsum-dolor-sit-amet',5,'2015-03-05 04:02:32'),(12,'news/category/cat-1',3,'2015-03-05 04:04:23'),(13,'news/2014/10/16/lorem-ipsum-dolor-sit-amet-hehehe',3,'2015-03-05 04:53:47'),(14,'news/press-release',1,'2015-03-05 04:10:52'),(15,'news/category/press-release',10,'2015-03-05 05:05:03'),(16,'news/category/lbh-pers-on-media',5,'2015-03-05 04:13:54'),(17,'news',1,'2015-03-06 04:15:01'),(18,'news/category/press-release',1,'2015-03-06 04:16:19'),(19,'news/2014/10/16/lorem-ipsum-dolor-sit-amet-hehehe',18,'2015-03-06 05:32:25'),(20,'news/2014/10/28/lorem-ipsum-dolor-sit-amet',14,'2015-03-06 05:32:28'),(21,'program/2015/03/06/Lorem-ipsum-dolor-sit-amet',23,'2015-03-06 17:37:15'),(22,'program/2015/03/06/lorem_ipsum_dolor_sit_amet',2,'2015-03-06 16:59:08'),(23,'program/2015/03/06/lorem-ipsum-dolor-sit-amet',30,'2015-03-07 17:48:45'),(24,'news/2014/10/28/lorem-ipsum-dolor-sit-amet',24,'2015-03-07 15:55:14'),(25,'news',2,'2015-03-07 17:15:32'),(26,'news/2014/10/16/lorem-ipsum-dolor-sit-amet-hehehe',9,'2015-03-07 16:30:17'),(27,'program',6,'2015-03-07 16:45:28'),(28,'news/2015/03/07/lorem-ipsum-dolor-sit-amet',36,'2015-03-07 23:47:09'),(29,'news/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',67,'2015-03-07 23:36:14'),(30,'files/cloud_thumb/d096e8f323283aa',4,'2015-03-07 23:54:24'),(31,'files/cloud_thumb/d3d49656cb90ae5',2,'2015-03-07 23:54:24'),(32,'files/cloud_thumb/661fe4b880078b6',1,'2015-03-07 23:55:49'),(33,'news/2015/03/07/lorem-ipsum-dolor-sit-amet',28,'2015-03-08 10:24:09'),(34,'news/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',55,'2015-03-08 05:19:33'),(35,'program/2015/03/06/lorem-ipsum-dolor-sit-amet',2,'2015-03-08 01:07:17'),(36,'program/show/MQ',55,'2015-03-08 05:19:50'),(37,'program',2,'2015-03-08 04:25:56'),(38,'calendar/detail/1/2015-03-07-20.Lorem-dolor-consectetur-elit-',37,'2015-03-08 05:20:02'),(39,'calendar',1,'2015-03-08 02:45:54'),(40,'videos/view/MQ',57,'2015-03-08 10:24:39'),(41,'videos/view/Mg',3,'2015-03-08 11:21:58'),(42,'news/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',2,'2015-03-09 22:25:43'),(43,'news/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',31,'2015-03-10 05:48:36'),(44,'news/2015/03/07/lorem-ipsum-dolor-sit-amet',6,'2015-03-10 03:42:19'),(45,'program/show/MQ',40,'2015-03-10 03:46:51'),(46,'program/show/MQ/2015/03/06',12,'2015-03-10 03:52:42'),(47,'program/show/MQ/2015/03/06/lorem-ipsum-dolor-sit-amet',3,'2015-03-10 05:47:59'),(48,'calendar/detail/1/2015-03-07-20.Lorem-dolor-consectetur-elit-',98,'2015-03-10 05:48:05'),(49,'videos/view/Mg',1,'2015-03-10 05:48:13'),(50,'news',45,'2015-03-10 21:32:48'),(51,'news/lorem-ipsum-dolor-sit-amet',1,'2015-03-10 21:29:00'),(52,'news/1970/01/01/lorem-ipsum-dolor-sit-amet',1,'2015-03-10 21:29:32'),(53,'news/category/press-release',6,'2015-03-10 21:52:12'),(54,'news/category/lbh-pers-on-media',7,'2015-03-10 21:54:43'),(55,'news/category/lbh-pers-on-media',5,'2015-03-11 23:01:21'),(56,'news',53,'2015-03-11 23:58:59'),(57,'news/2015/03/07/lorem-ipsum-dolor-sit-amet',61,'2015-03-11 23:21:06'),(58,'calendar/detail/2/2015-03-11-00.hahahaha',1,'2015-03-11 22:17:05'),(59,'calendar/detail/1/2015-03-01-00.Lorem-dolor-consectetur-elit-',5,'2015-03-11 22:53:43'),(60,'program/show/MQ/2015/03/06/lorem-ipsum-dolor-sit-amet',3,'2015-03-11 22:52:51'),(61,'news/category/press-release',6,'2015-03-11 23:00:52'),(62,'news/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',25,'2015-03-11 23:21:37'),(63,'calendar',1,'2015-03-11 22:54:35'),(64,'program',47,'2015-03-11 23:58:55'),(65,'news',24,'2015-03-12 21:09:37'),(66,'program',44,'2015-03-12 22:00:29'),(67,'program/2015/03/06/lorem-ipsum-dolor-sit-amet',51,'2015-03-12 00:54:37'),(68,'news/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',2,'2015-03-12 23:02:21'),(69,'program/show/MQ/2015/03/06/lorem-ipsum-dolor-sit-amet',3,'2015-03-12 00:18:41'),(70,'program/2015/03/21/lorem-ipsum-dolor-sit-amet',10,'2015-03-12 09:20:05'),(71,'program/category/bantuan-hukum-pers',31,'2015-03-12 02:50:29'),(72,'program/category/perlindungan-kekerasan-terhadap-jurnalis',7,'2015-03-12 04:43:38'),(73,'program/category/keterbukaan-forum-publik',2,'2015-03-12 01:49:38'),(74,'program/category/internet-freedom',3,'2015-03-12 02:04:10'),(75,'program/category/demokrasi-penyiaran',2,'2015-03-12 01:49:43'),(76,'news/category/press-release',2,'2015-03-12 01:46:07'),(77,'news/category/lbh-pers-on-media',2,'2015-03-12 01:46:10'),(78,'videos/view/MQ',1,'2015-03-12 03:36:12'),(79,'program/2015/03/11/hahahaha-hohohoho',1,'2015-03-12 04:09:29'),(80,'program/2015/03/22/hahahaha-hohohoho',1,'2015-03-12 04:44:30'),(81,'calendar',18,'2015-03-12 21:40:23'),(82,'calendar/detail/2/2015-3-12',3,'2015-03-12 21:17:56'),(83,'calendar/detail/1/2015-3-1',1,'2015-03-12 21:15:24'),(84,'calendar/show/1427821200',5,'2015-03-12 21:39:35'),(85,'calendar/show/1430413200',2,'2015-03-12 21:39:51'),(86,'calendar/show/1462035600',1,'2015-03-12 21:16:55'),(87,'calendar/detail/1/2016-5-1',1,'2015-03-12 21:17:01'),(88,'calendar/detail/1/2015-5-1',1,'2015-03-12 21:40:13'),(89,'news',49,'2015-03-13 22:37:53'),(90,'news/category/press-release',1,'2015-03-13 21:48:23'),(91,'news/page/1',4,'2015-03-13 22:25:36'),(92,'news/page',2,'2015-03-13 22:24:58'),(93,'pengaduan',6,'2015-03-13 23:55:46'),(94,'pengaduan/create',35,'2015-03-13 23:56:51'),(95,'edit-profile',3,'2015-03-13 23:53:43'),(96,'pengaduan/create',22,'2015-03-14 00:34:44'),(97,'edit-profile',1,'2015-03-14 00:06:17'),(98,'users/edit',1,'2015-03-14 00:06:18'),(99,'pengaduan',3,'2015-03-14 00:15:07'),(100,'program/category/demokrasi-penyiaran',1,'2015-03-14 00:35:34'),(101,'kasus/categories/perdata',2,'2015-03-14 01:08:03'),(102,'kasus',12,'2015-03-14 01:16:43'),(103,'program',4,'2015-03-14 01:14:25'),(104,'program/category/perdata',2,'2015-03-14 01:12:24'),(105,'program/category/perlindungan-kekerasan-terhadap-jurnalis',1,'2015-03-14 01:12:34'),(106,'kasus/2015/03/13/lorem-ipsum-dolor-sit-amet-hehehe',3,'2015-03-14 01:16:54'),(107,'kasus/category/perdata',1,'2015-03-14 01:16:50'),(108,'alert/2015/03/13/lorem-ipsum-dolor-sit-amet',25,'2015-03-14 02:07:31'),(109,'alert',2,'2015-03-14 02:07:35'),(110,'news/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',6,'2015-03-14 02:18:15'),(111,'news',10,'2015-03-14 03:12:03'),(112,'gallery',17,'2015-03-14 03:59:31'),(113,'videos/view/Mg',1,'2015-03-14 03:52:32'),(114,'news/2015/03/lorem-ipsum-dolor-sit-amet-hehehe',1,'2015-03-16 23:47:05'),(115,'news',2,'2015-03-16 23:54:36'),(116,'news',86,'2015-03-17 02:24:55'),(117,'news/2015/03/lorem-ipsum-dolor-sit-amet-hehehe',12,'2015-03-17 00:57:04'),(118,'program',32,'2015-03-17 02:41:19'),(119,'news/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',3,'2015-03-17 00:07:38'),(120,'news/2/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',48,'2015-03-17 03:00:15'),(121,'news/2/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehez',1,'2015-03-17 00:17:36'),(122,'news/2/2015/03/07',2,'2015-03-17 00:18:01'),(123,'news/2/2015/03/07/x',1,'2015-03-17 00:17:54'),(124,'news/2/2015/03/x/lorem-ipsum-dolor-sit-amet-hehehe',1,'2015-03-17 00:19:07'),(125,'news/21/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',7,'2015-03-17 00:23:47'),(126,'news/1/2015/03/07/lorem-ipsum-dolor-sit-amet-hehehe',1,'2015-03-17 00:22:15'),(127,'kasus',41,'2015-03-17 02:32:24'),(128,'news/1/2015/03/07/lorem-ipsum-dolor-sit-amet',5,'2015-03-17 02:46:00'),(129,'news/category/press-release',12,'2015-03-17 02:19:49'),(130,'news/category/lbh-pers-on-media',1,'2015-03-17 01:15:10'),(131,'news/page/1',2,'2015-03-17 01:18:35'),(132,'news/page',1,'2015-03-17 01:18:32'),(133,'program/2015/03/22/hahahaha-hohohoho',5,'2015-03-17 02:42:40'),(134,'program/category/bantuan-hukum-pers',4,'2015-03-17 02:30:20'),(135,'kasus/2015/03/16/duis-aute-irure-dolor-in-reprehenderit-in-voluptate',3,'2015-03-17 02:08:17'),(136,'kasus/category/pidana',10,'2015-03-17 02:32:49'),(137,'program/category/perlindungan-kekerasan-terhadap-jurnalis',7,'2015-03-17 02:25:07'),(138,'alert',18,'2015-03-17 02:36:13'),(139,'alert/2015/03/13/lorem-ipsum-dolor-sit-amet',1,'2015-03-17 02:10:47'),(140,'alert/2015/03/16/duis-aute-irure-dolor-in-reprehenderit-in-voluptate-velit-esse-cillum',4,'2015-03-17 02:34:00'),(141,'alert/page/1',1,'2015-03-17 02:18:55'),(142,'alert/page',1,'2015-03-17 02:18:58'),(143,'alert/1/2015/03/16/duis-aute-irure-dolor-in-reprehenderit-in-voluptate-velit-esse-cillum',1,'2015-03-17 02:19:17'),(144,'program/2015/03/21/lorem-ipsum-dolor-sit-amet',2,'2015-03-17 02:21:04'),(145,'program/1/2015/03/21/lorem-ipsum-dolor-sit-amet',9,'2015-03-17 03:00:20'),(146,'program/2/2015/03/22/hahahaha-hohohoho',11,'2015-03-17 02:42:48'),(147,'kasus/2/2015/03/16/duis-aute-irure-dolor-in-reprehenderit-in-voluptate',14,'2015-03-17 02:32:51'),(148,'kasus/category/perdata',5,'2015-03-17 02:33:49'),(149,'kasus/1/2015/03/13/lorem-ipsum-dolor-sit-amet-hehehe',3,'2015-03-17 02:33:51'),(150,'kasus/categories/perdata',3,'2015-03-17 02:30:34'),(151,'kasus/categories/pidana',1,'2015-03-17 02:30:38'),(152,'kasus/category/tun',1,'2015-03-17 02:32:40'),(153,'kasus/category/phs',1,'2015-03-17 02:32:44'),(154,'alert/2/2015/03/16/duis-aute-irure-dolor-in-reprehenderit-in-voluptate-velit-esse-cillum',2,'2015-03-17 02:35:49'),(155,'alert/1/2015/03/13/lorem-ipsum-dolor-sit-amet',1,'2015-03-17 02:36:01'),(156,'alert/12/2015/03/13/lorem-ipsum-dolor-sit-amet',1,'2015-03-17 02:36:12'),(157,'pengaduan',1,'2015-03-17 02:36:19'),(158,'pengaduan/create',1,'2015-03-17 02:36:20'),(159,'videos',2,'2015-03-17 02:37:11'),(160,'gallery',70,'2015-03-17 04:11:03'),(161,'calendar/detail/1/2015-03-01-00.Lorem-dolor-consectetur-elit-',1,'2015-03-17 02:43:01'),(162,'news',7,'2015-03-20 01:09:36'),(163,'videos/view/MQ',7,'2015-03-20 01:23:11'),(164,'videos/view/Mg',1,'2015-03-20 02:09:55'),(165,'videos/view/Mw',1,'2015-03-20 02:20:39'),(166,'program/1/2015/03/21/lorem-ipsum-dolor-sit-amet',6,'2015-03-20 02:29:55');
/*!40000 ALTER TABLE `default_visitors_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widget_areas`
--

DROP TABLE IF EXISTS `default_widget_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widget_areas`
--

LOCK TABLES `default_widget_areas` WRITE;
/*!40000 ALTER TABLE `default_widget_areas` DISABLE KEYS */;
INSERT INTO `default_widget_areas` VALUES (1,'sidebar','Sidebar');
/*!40000 ALTER TABLE `default_widget_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widget_instances`
--

DROP TABLE IF EXISTS `default_widget_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widget_instances`
--

LOCK TABLES `default_widget_instances` WRITE;
/*!40000 ALTER TABLE `default_widget_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `default_widget_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `default_widgets`
--

DROP TABLE IF EXISTS `default_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `default_widgets`
--

LOCK TABLES `default_widgets` WRITE;
/*!40000 ALTER TABLE `default_widgets` DISABLE KEYS */;
INSERT INTO `default_widgets` VALUES (1,'google_maps','a:10:{s:2:\"en\";s:11:\"Google Maps\";s:2:\"el\";s:19:\"Χάρτης Google\";s:2:\"nl\";s:11:\"Google Maps\";s:2:\"br\";s:11:\"Google Maps\";s:2:\"pt\";s:11:\"Google Maps\";s:2:\"ru\";s:17:\"Карты Google\";s:2:\"id\";s:11:\"Google Maps\";s:2:\"fi\";s:11:\"Google Maps\";s:2:\"fr\";s:11:\"Google Maps\";s:2:\"fa\";s:17:\"نقشه گوگل\";}','a:10:{s:2:\"en\";s:32:\"Display Google Maps on your site\";s:2:\"el\";s:78:\"Προβάλετε έναν Χάρτη Google στον ιστότοπό σας\";s:2:\"nl\";s:27:\"Toon Google Maps in uw site\";s:2:\"br\";s:34:\"Mostra mapas do Google no seu site\";s:2:\"pt\";s:34:\"Mostra mapas do Google no seu site\";s:2:\"ru\";s:80:\"Выводит карты Google на страницах вашего сайта\";s:2:\"id\";s:37:\"Menampilkan Google Maps di Situs Anda\";s:2:\"fi\";s:39:\"Näytä Google Maps kartta sivustollasi\";s:2:\"fr\";s:42:\"Publiez un plan Google Maps sur votre site\";s:2:\"fa\";s:59:\"نمایش داده نقشه گوگل بر روی سایت \";}','Gregory Athons','http://www.gregathons.com','1.0.0',1,1,1450329319),(2,'html','s:4:\"HTML\";','a:10:{s:2:\"en\";s:28:\"Create blocks of custom HTML\";s:2:\"el\";s:80:\"Δημιουργήστε περιοχές με δικό σας κώδικα HTML\";s:2:\"br\";s:41:\"Permite criar blocos de HTML customizados\";s:2:\"pt\";s:41:\"Permite criar blocos de HTML customizados\";s:2:\"nl\";s:30:\"Maak blokken met maatwerk HTML\";s:2:\"ru\";s:83:\"Создание HTML-блоков с произвольным содержимым\";s:2:\"id\";s:24:\"Membuat blok HTML apapun\";s:2:\"fi\";s:32:\"Luo lohkoja omasta HTML koodista\";s:2:\"fr\";s:36:\"Créez des blocs HTML personnalisés\";s:2:\"fa\";s:58:\"ایجاد قسمت ها به صورت اچ تی ام ال\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.0.0',1,2,1450329319),(3,'login','a:10:{s:2:\"en\";s:5:\"Login\";s:2:\"el\";s:14:\"Σύνδεση\";s:2:\"nl\";s:5:\"Login\";s:2:\"br\";s:5:\"Login\";s:2:\"pt\";s:5:\"Login\";s:2:\"ru\";s:22:\"Вход на сайт\";s:2:\"id\";s:5:\"Login\";s:2:\"fi\";s:13:\"Kirjautuminen\";s:2:\"fr\";s:9:\"Connexion\";s:2:\"fa\";s:10:\"لاگین\";}','a:10:{s:2:\"en\";s:36:\"Display a simple login form anywhere\";s:2:\"el\";s:96:\"Προβάλετε μια απλή φόρμα σύνδεσης χρήστη οπουδήποτε\";s:2:\"br\";s:69:\"Permite colocar um formulário de login em qualquer lugar do seu site\";s:2:\"pt\";s:69:\"Permite colocar um formulário de login em qualquer lugar do seu site\";s:2:\"nl\";s:32:\"Toon overal een simpele loginbox\";s:2:\"ru\";s:72:\"Выводит простую форму для входа на сайт\";s:2:\"id\";s:32:\"Menampilkan form login sederhana\";s:2:\"fi\";s:52:\"Näytä yksinkertainen kirjautumislomake missä vain\";s:2:\"fr\";s:54:\"Affichez un formulaire de connexion où vous souhaitez\";s:2:\"fa\";s:70:\"نمایش یک لاگین ساده در هر قسمتی از سایت\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.0.0',1,3,1450329319),(4,'navigation','a:10:{s:2:\"en\";s:10:\"Navigation\";s:2:\"el\";s:16:\"Πλοήγηση\";s:2:\"nl\";s:9:\"Navigatie\";s:2:\"br\";s:11:\"Navegação\";s:2:\"pt\";s:11:\"Navegação\";s:2:\"ru\";s:18:\"Навигация\";s:2:\"id\";s:8:\"Navigasi\";s:2:\"fi\";s:10:\"Navigaatio\";s:2:\"fr\";s:10:\"Navigation\";s:2:\"fa\";s:10:\"منوها\";}','a:10:{s:2:\"en\";s:40:\"Display a navigation group with a widget\";s:2:\"el\";s:100:\"Προβάλετε μια ομάδα στοιχείων πλοήγησης στον ιστότοπο\";s:2:\"nl\";s:38:\"Toon een navigatiegroep met een widget\";s:2:\"br\";s:62:\"Exibe um grupo de links de navegação como widget em seu site\";s:2:\"pt\";s:62:\"Exibe um grupo de links de navegação como widget no seu site\";s:2:\"ru\";s:88:\"Отображает навигационную группу внутри виджета\";s:2:\"id\";s:44:\"Menampilkan grup navigasi menggunakan widget\";s:2:\"fi\";s:37:\"Näytä widgetillä navigaatio ryhmä\";s:2:\"fr\";s:47:\"Affichez un groupe de navigation dans un widget\";s:2:\"fa\";s:71:\"نمایش گروهی از منوها با استفاده از ویجت\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.2.0',1,4,1450329319),(5,'rss_feed','a:10:{s:2:\"en\";s:8:\"RSS Feed\";s:2:\"el\";s:24:\"Τροφοδοσία RSS\";s:2:\"nl\";s:8:\"RSS Feed\";s:2:\"br\";s:8:\"Feed RSS\";s:2:\"pt\";s:8:\"Feed RSS\";s:2:\"ru\";s:31:\"Лента новостей RSS\";s:2:\"id\";s:8:\"RSS Feed\";s:2:\"fi\";s:10:\"RSS Syöte\";s:2:\"fr\";s:8:\"Flux RSS\";s:2:\"fa\";s:19:\"خبر خوان RSS\";}','a:10:{s:2:\"en\";s:41:\"Display parsed RSS feeds on your websites\";s:2:\"el\";s:82:\"Προβάλετε τα περιεχόμενα μιας τροφοδοσίας RSS\";s:2:\"nl\";s:28:\"Toon RSS feeds op uw website\";s:2:\"br\";s:48:\"Interpreta e exibe qualquer feed RSS no seu site\";s:2:\"pt\";s:48:\"Interpreta e exibe qualquer feed RSS no seu site\";s:2:\"ru\";s:94:\"Выводит обработанную ленту новостей на вашем сайте\";s:2:\"id\";s:42:\"Menampilkan kutipan RSS feed di situs Anda\";s:2:\"fi\";s:39:\"Näytä purettu RSS syöte sivustollasi\";s:2:\"fr\";s:39:\"Affichez un flux RSS sur votre site web\";s:2:\"fa\";s:46:\"نمایش خوراک های RSS در سایت\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.2.0',1,5,1450329319),(6,'social_bookmark','a:10:{s:2:\"en\";s:15:\"Social Bookmark\";s:2:\"el\";s:35:\"Κοινωνική δικτύωση\";s:2:\"nl\";s:19:\"Sociale Bladwijzers\";s:2:\"br\";s:15:\"Social Bookmark\";s:2:\"pt\";s:15:\"Social Bookmark\";s:2:\"ru\";s:37:\"Социальные закладки\";s:2:\"id\";s:15:\"Social Bookmark\";s:2:\"fi\";s:24:\"Sosiaalinen kirjanmerkki\";s:2:\"fr\";s:13:\"Liens sociaux\";s:2:\"fa\";s:52:\"بوکمارک های شبکه های اجتماعی\";}','a:10:{s:2:\"en\";s:47:\"Configurable social bookmark links from AddThis\";s:2:\"el\";s:111:\"Παραμετροποιήσιμα στοιχεία κοινωνικής δικτυώσης από το AddThis\";s:2:\"nl\";s:43:\"Voeg sociale bladwijzers toe vanuit AddThis\";s:2:\"br\";s:87:\"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações\";s:2:\"pt\";s:87:\"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações\";s:2:\"ru\";s:90:\"Конфигурируемые социальные закладки с сайта AddThis\";s:2:\"id\";s:60:\"Tautan social bookmark yang dapat dikonfigurasi dari AddThis\";s:2:\"fi\";s:59:\"Konfiguroitava sosiaalinen kirjanmerkki linkit AddThis:stä\";s:2:\"fr\";s:43:\"Liens sociaux personnalisables avec AddThis\";s:2:\"fa\";s:71:\"تنظیم و نمایش لینک های شبکه های اجتماعی\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.0.0',1,6,1450329319),(7,'archive','a:8:{s:2:\"en\";s:7:\"Archive\";s:2:\"br\";s:15:\"Arquivo do Blog\";s:2:\"fa\";s:10:\"آرشیو\";s:2:\"pt\";s:15:\"Arquivo do Blog\";s:2:\"el\";s:33:\"Αρχείο Ιστολογίου\";s:2:\"fr\";s:16:\"Archives du Blog\";s:2:\"ru\";s:10:\"Архив\";s:2:\"id\";s:7:\"Archive\";}','a:8:{s:2:\"en\";s:64:\"Display a list of old months with links to posts in those months\";s:2:\"br\";s:95:\"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente\";s:2:\"fa\";s:101:\"نمایش لیست ماه های گذشته به همراه لینک به پست های مربوطه\";s:2:\"pt\";s:95:\"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente\";s:2:\"el\";s:155:\"Προβάλλει μια λίστα μηνών και συνδέσμους σε αναρτήσεις που έγιναν σε κάθε από αυτούς\";s:2:\"fr\";s:95:\"Permet d\'afficher une liste des mois passés avec des liens vers les posts relatifs à ces mois\";s:2:\"ru\";s:114:\"Выводит список по месяцам со ссылками на записи в этих месяцах\";s:2:\"id\";s:63:\"Menampilkan daftar bulan beserta tautan post di setiap bulannya\";}','Phil Sturgeon','http://philsturgeon.co.uk/','1.0.0',1,7,1450329319),(8,'blog_categories','a:8:{s:2:\"en\";s:15:\"Blog Categories\";s:2:\"br\";s:18:\"Categorias do Blog\";s:2:\"pt\";s:18:\"Categorias do Blog\";s:2:\"el\";s:41:\"Κατηγορίες Ιστολογίου\";s:2:\"fr\";s:19:\"Catégories du Blog\";s:2:\"ru\";s:29:\"Категории Блога\";s:2:\"id\";s:12:\"Kateori Blog\";s:2:\"fa\";s:28:\"مجموعه های بلاگ\";}','a:8:{s:2:\"en\";s:30:\"Show a list of blog categories\";s:2:\"br\";s:57:\"Mostra uma lista de navegação com as categorias do Blog\";s:2:\"pt\";s:57:\"Mostra uma lista de navegação com as categorias do Blog\";s:2:\"el\";s:97:\"Προβάλει την λίστα των κατηγοριών του ιστολογίου σας\";s:2:\"fr\";s:49:\"Permet d\'afficher la liste de Catégories du Blog\";s:2:\"ru\";s:57:\"Выводит список категорий блога\";s:2:\"id\";s:35:\"Menampilkan daftar kategori tulisan\";s:2:\"fa\";s:55:\"نمایش لیستی از مجموعه های بلاگ\";}','Stephen Cozart','http://github.com/clip/','1.0.0',1,8,1450329319),(9,'latest_posts','a:8:{s:2:\"en\";s:12:\"Latest posts\";s:2:\"br\";s:24:\"Artigos recentes do Blog\";s:2:\"fa\";s:26:\"آخرین ارسال ها\";s:2:\"pt\";s:24:\"Artigos recentes do Blog\";s:2:\"el\";s:62:\"Τελευταίες αναρτήσεις ιστολογίου\";s:2:\"fr\";s:17:\"Derniers articles\";s:2:\"ru\";s:31:\"Последние записи\";s:2:\"id\";s:12:\"Post Terbaru\";}','a:8:{s:2:\"en\";s:39:\"Display latest blog posts with a widget\";s:2:\"br\";s:81:\"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog\";s:2:\"fa\";s:65:\"نمایش آخرین پست های وبلاگ در یک ویجت\";s:2:\"pt\";s:81:\"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog\";s:2:\"el\";s:103:\"Προβάλει τις πιο πρόσφατες αναρτήσεις στο ιστολόγιό σας\";s:2:\"fr\";s:68:\"Permet d\'afficher la liste des derniers posts du blog dans un Widget\";s:2:\"ru\";s:100:\"Выводит список последних записей блога внутри виджета\";s:2:\"id\";s:51:\"Menampilkan posting blog terbaru menggunakan widget\";}','Erik Berman','http://www.nukleo.fr','1.0.0',1,9,1450329319),(12,'calendar_month','a:1:{s:2:\"en\";s:22:\"Monthly Calendar Event\";}','a:1:{s:2:\"en\";s:51:\"Display a list of dates that contain monthly events\";}','Eko Muhammad Isa','http://www.enotes.web.id/','0.2',1,10,1450329319);
/*!40000 ALTER TABLE `default_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-18 13:36:45
