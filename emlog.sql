-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: emlog
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Current Database: `emlog`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `emlog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `emlog`;

--
-- Table structure for table `emlog_attachment`
--

DROP TABLE IF EXISTS `emlog_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blogid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) NOT NULL DEFAULT '0',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `addtime` bigint(20) NOT NULL DEFAULT '0',
  `width` int(10) NOT NULL DEFAULT '0',
  `height` int(10) NOT NULL DEFAULT '0',
  `mimetype` varchar(40) NOT NULL DEFAULT '',
  `thumfor` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `blogid` (`blogid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_attachment`
--

LOCK TABLES `emlog_attachment` WRITE;
/*!40000 ALTER TABLE `emlog_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `emlog_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_block`
--

DROP TABLE IF EXISTS `emlog_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) NOT NULL DEFAULT '0',
  `serverip` varchar(200) NOT NULL DEFAULT '',
  `attack_num` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `serverip` (`serverip`),
  KEY `block` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_block`
--

LOCK TABLES `emlog_block` WRITE;
/*!40000 ALTER TABLE `emlog_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `emlog_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_blog`
--

DROP TABLE IF EXISTS `emlog_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_blog` (
  `gid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `date` bigint(20) NOT NULL,
  `content` longtext NOT NULL,
  `excerpt` longtext NOT NULL,
  `thumbs` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(200) NOT NULL DEFAULT '',
  `author` int(10) NOT NULL DEFAULT '1',
  `sortid` int(10) NOT NULL DEFAULT '-1',
  `copy` int(10) NOT NULL DEFAULT '-1',
  `copyurl` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'blog',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `comnum` int(10) unsigned NOT NULL DEFAULT '0',
  `attnum` int(10) unsigned NOT NULL DEFAULT '0',
  `top` enum('n','y') NOT NULL DEFAULT 'n',
  `sortop` enum('n','y') NOT NULL DEFAULT 'n',
  `hide` enum('n','y') NOT NULL DEFAULT 'n',
  `checked` enum('n','y') NOT NULL DEFAULT 'y',
  `allow_remark` enum('n','y') NOT NULL DEFAULT 'y',
  `password` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(255) NOT NULL DEFAULT '',
  `tags` text,
  PRIMARY KEY (`gid`),
  KEY `author` (`author`),
  KEY `views` (`views`),
  KEY `comnum` (`comnum`),
  KEY `sortid` (`sortid`),
  KEY `top` (`top`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_blog`
--

LOCK TABLES `emlog_blog` WRITE;
/*!40000 ALTER TABLE `emlog_blog` DISABLE KEYS */;
INSERT INTO `emlog_blog` VALUES (1,'欢迎使用Emlog',1577324802,'恭喜您成功安装了Emlog，这是系统自动生成的演示文章。编辑或者删除它，然后开始您的创作吧！','','','',1,1,1,'','blog',0,0,0,'n','n','n','y','y','','','1');
/*!40000 ALTER TABLE `emlog_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_comment`
--

DROP TABLE IF EXISTS `emlog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_comment` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `date` bigint(20) NOT NULL,
  `poster` varchar(20) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `mail` varchar(60) NOT NULL DEFAULT '',
  `url` varchar(75) NOT NULL DEFAULT '',
  `ip` varchar(128) NOT NULL DEFAULT '',
  `hide` enum('n','y') NOT NULL DEFAULT 'n',
  `useragent` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`),
  KEY `gid` (`gid`),
  KEY `date` (`date`),
  KEY `hide` (`hide`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_comment`
--

LOCK TABLES `emlog_comment` WRITE;
/*!40000 ALTER TABLE `emlog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `emlog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_link`
--

DROP TABLE IF EXISTS `emlog_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(30) NOT NULL DEFAULT '',
  `siteurl` varchar(75) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sitepic` varchar(255) NOT NULL DEFAULT '',
  `linksortid` int(10) unsigned NOT NULL DEFAULT '0',
  `hide` enum('n','y') NOT NULL DEFAULT 'n',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_link`
--

LOCK TABLES `emlog_link` WRITE;
/*!40000 ALTER TABLE `emlog_link` DISABLE KEYS */;
INSERT INTO `emlog_link` VALUES (1,'emlog','http://www.emlog.net','官方主页','',1,'n',0);
/*!40000 ALTER TABLE `emlog_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_navi`
--

DROP TABLE IF EXISTS `emlog_navi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_navi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naviname` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(75) NOT NULL DEFAULT '',
  `newtab` enum('n','y') NOT NULL DEFAULT 'n',
  `hide` enum('n','y') NOT NULL DEFAULT 'n',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `isdefault` enum('n','y') NOT NULL DEFAULT 'n',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_navi`
--

LOCK TABLES `emlog_navi` WRITE;
/*!40000 ALTER TABLE `emlog_navi` DISABLE KEYS */;
INSERT INTO `emlog_navi` VALUES (1,'首页','','n','n',1,0,'y',1,0),(2,'微语','t','n','n',2,0,'y',2,0),(3,'登录','admin','n','n',3,0,'y',3,0);
/*!40000 ALTER TABLE `emlog_navi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_options`
--

DROP TABLE IF EXISTS `emlog_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_options` (
  `option_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `option_value` longtext NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_options`
--

LOCK TABLES `emlog_options` WRITE;
/*!40000 ALTER TABLE `emlog_options` DISABLE KEYS */;
INSERT INTO `emlog_options` VALUES (1,'blogname','点滴记忆'),(2,'bloginfo','使用Emlog搭建的站点'),(3,'site_title',''),(4,'site_description',''),(5,'site_key','emlog'),(6,'log_title_style','0'),(7,'blogurl','https://emlog.xiaobing.com/'),(8,'icp',''),(9,'footer_info',''),(10,'admin_perpage_num','15'),(11,'rss_output_num','10'),(12,'rss_output_fulltext','y'),(13,'index_lognum','10'),(14,'index_comnum','10'),(15,'index_twnum','10'),(16,'index_newtwnum','5'),(17,'index_newlognum','5'),(18,'index_randlognum','5'),(19,'index_hotlognum','5'),(20,'comment_subnum','20'),(21,'nonce_templet','default'),(22,'admin_style','admin-default'),(23,'tpl_sidenum','1'),(24,'comment_code','n'),(25,'comment_needchinese','y'),(26,'comment_interval','60'),(27,'isgravatar','y'),(28,'isthumbnail','y'),(29,'att_maxsize','20480'),(30,'att_type','rar,zip,gif,jpg,jpeg,png,txt,pdf,docx,doc,xls,xlsx'),(31,'att_imgmaxw','420'),(32,'att_imgmaxh','460'),(33,'comment_paging','y'),(34,'comment_pnum','10'),(35,'comment_order','newer'),(36,'login_code','n'),(37,'iscomment','y'),(38,'ischkcomment','y'),(39,'isurlrewrite','0'),(40,'isalias','n'),(41,'isalias_html','n'),(42,'isgzipenable','n'),(43,'isexcerpt','n'),(44,'excerpt_subnum','300'),(45,'istwitter','y'),(46,'timezone','Asia/Shanghai'),(47,'active_plugins',''),(48,'widget_title','a:13:{s:7:\"blogger\";s:12:\"个人资料\";s:8:\"calendar\";s:6:\"日历\";s:7:\"twitter\";s:12:\"最新微语\";s:3:\"tag\";s:6:\"标签\";s:4:\"sort\";s:6:\"分类\";s:7:\"archive\";s:6:\"存档\";s:7:\"newcomm\";s:12:\"最新评论\";s:6:\"newlog\";s:12:\"最新文章\";s:10:\"random_log\";s:12:\"随机文章\";s:6:\"hotlog\";s:12:\"热门文章\";s:4:\"link\";s:6:\"链接\";s:6:\"search\";s:6:\"搜索\";s:11:\"custom_text\";s:15:\"自定义组件\";}'),(49,'custom_widget','a:0:{}'),(50,'widgets1','a:3:{i:0;s:7:\"archive\";i:1;s:4:\"link\";i:2;s:6:\"search\";}'),(51,'widgets2',''),(52,'widgets3',''),(53,'widgets4',''),(54,'detect_url','n'),(55,'webscan_log','0'),(56,'webscan_switch','0'),(57,'webscan_post','0'),(58,'webscan_get','0'),(59,'webscan_cookie','0'),(60,'webscan_referre','0'),(61,'webscan_white_directory','admin|\\/content\\/'),(62,'webscan_block_ip','0.0.0.0'),(63,'attacks','10'),(64,'MAIL_SMTP','stmp.163.com'),(65,'MAIL_PORT','25'),(66,'MAIL_SENDEMAIL',''),(67,'MAIL_PASSWORD',''),(68,'MAIL_TOEMAIL',''),(69,'MAIL_SENDTYPE','0'),(70,'SEND_MAIL','0'),(71,'REPLY_MAIL','0');
/*!40000 ALTER TABLE `emlog_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_sort`
--

DROP TABLE IF EXISTS `emlog_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_sort` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sortname` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(200) NOT NULL DEFAULT '',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `template` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_sort`
--

LOCK TABLES `emlog_sort` WRITE;
/*!40000 ALTER TABLE `emlog_sort` DISABLE KEYS */;
INSERT INTO `emlog_sort` VALUES (1,'默认','default',1,0,'','');
/*!40000 ALTER TABLE `emlog_sort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_sortlink`
--

DROP TABLE IF EXISTS `emlog_sortlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_sortlink` (
  `linksort_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `linksort_name` varchar(255) NOT NULL DEFAULT '',
  `taxis` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linksort_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_sortlink`
--

LOCK TABLES `emlog_sortlink` WRITE;
/*!40000 ALTER TABLE `emlog_sortlink` DISABLE KEYS */;
INSERT INTO `emlog_sortlink` VALUES (1,'默认分类',0);
/*!40000 ALTER TABLE `emlog_sortlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_tag`
--

DROP TABLE IF EXISTS `emlog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_tag` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(60) NOT NULL DEFAULT '',
  `gid` text NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `tagname` (`tagname`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_tag`
--

LOCK TABLES `emlog_tag` WRITE;
/*!40000 ALTER TABLE `emlog_tag` DISABLE KEYS */;
INSERT INTO `emlog_tag` VALUES (1,'默认','1');
/*!40000 ALTER TABLE `emlog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_twitter`
--

DROP TABLE IF EXISTS `emlog_twitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_twitter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `img` varchar(200) DEFAULT NULL,
  `author` int(10) NOT NULL DEFAULT '1',
  `date` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_twitter`
--

LOCK TABLES `emlog_twitter` WRITE;
/*!40000 ALTER TABLE `emlog_twitter` DISABLE KEYS */;
INSERT INTO `emlog_twitter` VALUES (1,'使用微语记录您身边的新鲜事','',1,1577324802);
/*!40000 ALTER TABLE `emlog_twitter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emlog_user`
--

DROP TABLE IF EXISTS `emlog_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emlog_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `role` varchar(60) NOT NULL DEFAULT '',
  `ischeck` enum('n','y') NOT NULL DEFAULT 'n',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(75) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emlog_user`
--

LOCK TABLES `emlog_user` WRITE;
/*!40000 ALTER TABLE `emlog_user` DISABLE KEYS */;
INSERT INTO `emlog_user` VALUES (1,'root','$P$BYFCwjE7AdW0XJ7EJ8vqpzg7.dwbkR0','','admin','n','','','','');
/*!40000 ALTER TABLE `emlog_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-26  9:51:51
