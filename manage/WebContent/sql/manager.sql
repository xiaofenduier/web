/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17 : Database - manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manage` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `manage`;

/*Table structure for table `t_buy` */

DROP TABLE IF EXISTS `t_buy`;

CREATE TABLE `t_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `managerId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_buy` */

insert  into `t_buy`(`id`,`company`,`managerId`,`name`,`num`,`staffId`,`state`,`password`,`roleName`,`username`) values (1,'1',1,'王帅',1,1,1,'123','manage','123'),(2,'1',2,'1',1,3,2,NULL,NULL,NULL),(3,'2',0,'2',2,3,2,NULL,NULL,NULL),(4,'3',2,'3',3,3,1,NULL,NULL,NULL),(5,'4',2,'4',4,3,1,NULL,NULL,NULL),(6,'12',2,'12',12,3,1,NULL,NULL,NULL),(7,'66',2,'66',66,3,2,NULL,NULL,NULL),(8,'555',0,'555',555,3,0,NULL,NULL,NULL),(9,'44',0,'44',44,3,0,NULL,NULL,NULL);

/*Table structure for table `t_out` */

DROP TABLE IF EXISTS `t_out`;

CREATE TABLE `t_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `managerId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_out` */

insert  into `t_out`(`id`,`company`,`managerId`,`name`,`num`,`staffId`,`state`) values (1,'12',1,'12',12,1,1),(2,'12',1,'12',12,1,2),(3,NULL,0,'13',13,1,0),(4,NULL,0,'1',1,3,0),(5,NULL,0,'1',1,3,0),(6,NULL,0,'1',1,3,0),(12,NULL,0,'11',11,3,0);

/*Table structure for table `t_production` */

DROP TABLE IF EXISTS `t_production`;

CREATE TABLE `t_production` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(5) DEFAULT NULL,
  `productTime` date DEFAULT NULL,
  `expirationTime` int(5) DEFAULT NULL,
  `company` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_production` */

insert  into `t_production`(`id`,`username`,`num`,`productTime`,`expirationTime`,`company`,`inTime`) values (1,'1',0,'2017-02-06',0,NULL,'2017-02-07'),(2,'2',0,'2017-02-06',0,NULL,'2017-02-06'),(3,'3',0,'2017-02-06',0,NULL,'2017-02-06'),(4,'4',0,'2017-02-06',0,NULL,'2017-02-06'),(5,'5',0,'2017-02-06',0,NULL,'2017-02-06'),(6,'6',0,'2017-02-06',0,NULL,'2017-02-06'),(7,'7',0,'2017-02-06',0,NULL,'2017-02-06'),(8,'8',0,'2017-02-06',0,NULL,'2017-02-06'),(9,'9',0,'2017-02-06',0,NULL,'2017-02-06'),(10,'10',0,'2017-02-06',0,NULL,'2017-02-06'),(12,'12',12,'2017-02-03',4,'12','2017-02-01'),(13,'8',8,'2017-02-09',8,'8','2017-02-10'),(15,'12',12,NULL,12,'哈哈哈',NULL),(16,'55',55,'2017-02-02',55,'999','2017-02-08');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`name`) values (1,'root'),(2,'manage'),(3,'staff');

/*Table structure for table `t_stock` */

DROP TABLE IF EXISTS `t_stock`;

CREATE TABLE `t_stock` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `inTime` date DEFAULT NULL,
  `sraffId` int(5) DEFAULT NULL,
  `company` varchar(33) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staffId` int(11) DEFAULT NULL,
  `outTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_stock` */

insert  into `t_stock`(`id`,`name`,`num`,`inTime`,`sraffId`,`company`,`staffId`,`outTime`) values (1,'12',24,NULL,NULL,'12',12,'2017-02-14 23:45:04'),(2,'12',12,'2017-02-01',NULL,'3',12,NULL),(3,'3',3,NULL,NULL,'3',3,'2017-02-18 00:56:09'),(4,'3',6,'2017-02-18',NULL,'2',3,NULL),(5,'3',3,'2017-02-18',NULL,'4',3,NULL),(6,'8',5,NULL,NULL,'8',3,'2017-02-18 14:12:20'),(7,'99',187,NULL,NULL,'99',3,'2017-02-18 15:27:33'),(8,'99',99,'2017-02-18',NULL,'11',3,NULL);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(33) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rolename` varchar(33) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`name`,`username`,`password`,`rolename`) values (1,'瓦','1','1','manager'),(2,'地方','2','2','root'),(3,'沃尔沃','3','3','staff'),(4,'张三','zhangsan','123456','staff'),(5,'132','3123','132','manage');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
