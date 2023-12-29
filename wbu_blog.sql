-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: wbu_blog
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `article_user_id` int(11) unsigned DEFAULT NULL COMMENT '用户ID',
  `article_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `article_content` mediumtext COMMENT '内容',
  `article_view_count` int(11) DEFAULT '0' COMMENT '访问量',
  `article_comment_count` int(11) DEFAULT '0' COMMENT '评论数',
  `article_like_count` int(11) DEFAULT '0' COMMENT '点赞数',
  `article_is_comment` int(1) unsigned DEFAULT NULL COMMENT '是否允许评论',
  `article_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  `article_order` int(11) unsigned DEFAULT NULL COMMENT '排序值',
  `article_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `article_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `article_summary` text COMMENT '摘要',
  `article_thumbnail` varchar(255) DEFAULT NULL COMMENT '缩略图',
  PRIMARY KEY (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_category_ref`
--

DROP TABLE IF EXISTS `article_category_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article_category_ref` (
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`article_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_tag_ref`
--

DROP TABLE IF EXISTS `article_tag_ref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `article_tag_ref` (
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `tag_id` int(11) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`article_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_pid` int(11) DEFAULT NULL COMMENT '分类父ID',
  `category_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `category_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `category_order` int(11) unsigned DEFAULT '1' COMMENT '排序值',
  `category_icon` varchar(20) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100000009 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `comment_pid` int(11) unsigned DEFAULT '0' COMMENT '上级评论ID',
  `comment_pname` varchar(255) DEFAULT NULL COMMENT '上级评论名称',
  `comment_article_id` int(11) unsigned NOT NULL COMMENT '文章ID',
  `comment_author_name` varchar(50) DEFAULT NULL COMMENT '评论人名称',
  `comment_author_email` varchar(50) DEFAULT NULL COMMENT '评论人邮箱',
  `comment_author_url` varchar(50) DEFAULT NULL COMMENT '评论人个人主页',
  `comment_author_avatar` varchar(100) DEFAULT NULL COMMENT '评论人头像',
  `comment_content` varchar(1000) DEFAULT NULL COMMENT '内容',
  `comment_agent` varchar(200) DEFAULT NULL COMMENT '浏览器信息',
  `comment_ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  `comment_create_time` datetime DEFAULT NULL COMMENT '评论时间',
  `comment_role` int(1) DEFAULT NULL COMMENT '角色，是否管理员',
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论ID,可能为空',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `link` (
  `link_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `link_name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `link_image` varchar(255) DEFAULT NULL COMMENT '头像',
  `link_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `link_owner_nickname` varchar(40) DEFAULT NULL COMMENT '所属人名称',
  `link_owner_contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `link_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `link_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `link_order` int(2) unsigned DEFAULT '1' COMMENT '排序号',
  `link_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `link_name` (`link_name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `menu_url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `menu_level` int(11) DEFAULT NULL COMMENT '等级',
  `menu_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `menu_order` int(11) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name` (`menu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `notice_content` varchar(10000) DEFAULT NULL COMMENT '内容',
  `notice_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `notice_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `notice_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  `notice_order` int(2) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `options` (
  `option_id` int(11) NOT NULL,
  `option_site_title` varchar(255) DEFAULT NULL,
  `option_site_descrption` varchar(255) DEFAULT NULL,
  `option_meta_descrption` varchar(255) DEFAULT NULL,
  `option_meta_keyword` varchar(255) DEFAULT NULL,
  `option_aboutsite_avatar` varchar(255) DEFAULT NULL,
  `option_aboutsite_title` varchar(255) DEFAULT NULL,
  `option_aboutsite_content` varchar(255) DEFAULT NULL,
  `option_aboutsite_wechat` varchar(255) DEFAULT NULL,
  `option_aboutsite_qq` varchar(255) DEFAULT NULL,
  `option_aboutsite_github` varchar(255) DEFAULT NULL,
  `option_aboutsite_weibo` varchar(255) DEFAULT NULL,
  `option_tongji` varchar(255) DEFAULT NULL,
  `option_status` int(1) DEFAULT '1',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `page` (
  `page_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自定义页面ID',
  `page_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `page_title` varchar(50) DEFAULT NULL COMMENT '标题',
  `page_content` mediumtext COMMENT '内容',
  `page_create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `page_update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `page_view_count` int(10) unsigned DEFAULT '0' COMMENT '访问量',
  `page_comment_count` int(5) unsigned DEFAULT '0' COMMENT '评论数',
  `page_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_key` (`page_key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tag` (
  `tag_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `tag_name` varchar(50) DEFAULT NULL COMMENT '标签名称',
  `tag_description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(100) NOT NULL DEFAULT '' COMMENT '密码',
  `user_nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `user_email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `user_url` varchar(100) DEFAULT '' COMMENT '个人主页',
  `user_avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `user_last_login_ip` varchar(30) DEFAULT NULL COMMENT '上传登录IP',
  `user_register_time` datetime DEFAULT NULL COMMENT '注册时间',
  `user_last_login_time` datetime DEFAULT NULL COMMENT '上传登录时间',
  `user_status` int(1) unsigned DEFAULT '1' COMMENT '状态',
  `user_role` varchar(20) NOT NULL DEFAULT 'user' COMMENT '角色',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-30  7:16:48
