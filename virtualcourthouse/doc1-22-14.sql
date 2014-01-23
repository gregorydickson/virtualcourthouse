# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.15)
# Database: doc
# Generation Time: 2014-01-23 02:04:18 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table assignment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assignment`;

CREATE TABLE `assignment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7siujb7wuq03ebg9qf42ds5pv` (`user_id`),
  CONSTRAINT `FK_7siujb7wuq03ebg9qf42ds5pv` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table assignment_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assignment_image`;

CREATE TABLE `assignment_image` (
  `assignment_images_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`assignment_images_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `identifer` varchar(255) DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `booktype_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table book_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_image`;

CREATE TABLE `book_image` (
  `book_images_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` bigint(11) DEFAULT NULL,
  `book_number` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`book_images_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table book_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book_types`;

CREATE TABLE `book_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_type` varchar(20) DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table district
# ------------------------------------------------------------

DROP TABLE IF EXISTS `district`;

CREATE TABLE `district` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  `usstate_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table district_book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `district_book`;

CREATE TABLE `district_book` (
  `district_books_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` bigint(11) DEFAULT NULL,
  `district_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`district_books_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document`;

CREATE TABLE `document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_number` int(11) DEFAULT NULL,
  `file_date` datetime DEFAULT NULL,
  `instrument_date` datetime DEFAULT NULL,
  `instrument_number` varchar(9) DEFAULT NULL,
  `page_number` int(11) DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  `book_type` bigint(20) DEFAULT NULL,
  `instrument_type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table document_document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document_document`;

CREATE TABLE `document_document` (
  `document_document_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `document_child_document_id` bigint(20) DEFAULT NULL,
  `document_parent_document_id` bigint(20) DEFAULT NULL,
  `document_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`document_document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table document_images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `document_images`;

CREATE TABLE `document_images` (
  `document_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `document_images_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_images_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_loaded` datetime NOT NULL,
  `image` longblob,
  `version` bigint(11) DEFAULT NULL,
  `assignment` bigint(20) DEFAULT NULL,
  `page_number` int(20) DEFAULT NULL,
  `book_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table instrument_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `instrument_types`;

CREATE TABLE `instrument_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instrument_type` varchar(20) DEFAULT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `salt` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `enabled`, `password`, `role`, `username`, `version`, `date_created`, `salt`)
VALUES
	(1,1,'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','admin','admin',NULL,NULL,NULL),
	(2,1,'04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb','user','user',NULL,NULL,NULL);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table usstate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usstate`;

CREATE TABLE `usstate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `version` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
