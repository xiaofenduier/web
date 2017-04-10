/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `test`;

/*Table structure for table `t_cp` */

DROP TABLE IF EXISTS `t_cp`;

CREATE TABLE `t_cp` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `typeid` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `goodsname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `introduce` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `nowprice` double DEFAULT NULL,
  `picture` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `intime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `newgoods` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_cp` */

insert  into `t_cp`(`id`,`typeid`,`goodsname`,`introduce`,`price`,`nowprice`,`picture`,`intime`,`newgoods`) values (1,'1','牛油果香辣鸡肉卷','1',1,1,'1','1',1),(2,'2','班柠檬菊香果茶','2',2,2,'2','2',2);

/*Table structure for table `t_information` */

DROP TABLE IF EXISTS `t_information`;

CREATE TABLE `t_information` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `time` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_information` */

insert  into `t_information`(`id`,`title`,`content`,`time`) values (1,'1','1','2017-03-10'),(2,'2','2','2017-03-10');

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `reply` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `shopname` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_message` */

insert  into `t_message`(`id`,`username`,`phone`,`content`,`reply`,`shopname`) values (2,'2','123','123','123','2'),(3,'3','3','3','3','2'),(4,'4','1234','1234','1234','2'),(5,'5','23412','2314','435345342','1'),(7,'7','7','7','7','1'),(8,'1','1','1111111','erwrwer','1'),(9,'130634199411243522','3234','234','啊哈哈哈发送到发送到','1'),(13,'1','1','123123123123哈哈哈哈哈','','1'),(14,'1','1','111111111111111111111111111','','1'),(15,'3','3','哈哈哈哈哈哈','','1'),(16,'','','不错范范范范范范','','2'),(17,'55','55','11212121212121','','12'),(18,'','','1666666665555555555','','5');

/*Table structure for table `t_mycp` */

DROP TABLE IF EXISTS `t_mycp`;

CREATE TABLE `t_mycp` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cpname` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_mycp` */

insert  into `t_mycp`(`id`,`cpname`,`username`,`price`,`pic`,`name`) values (1,'2','3','4','/test/img/t014d3503dd2d67d728.jpg','1'),(2,'3','3','3','/test/img/t014d3503dd2d67d728.jpg','2');

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pic` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `shopid` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_notice` */

insert  into `t_notice`(`id`,`title`,`content`,`pic`,`shopid`) values (9,'2342','sgsfdf委屈委屈尾萼蔷薇','/test/img/3.jpg',2),(11,'12312','王企鹅群翁群无','/test/img/2.jpg',2),(12,'123213132321111111111111111','2222222222222222222222','/test/img/1.jpg',2),(21,'1111111111111111111qqqq','1111111111111111111',NULL,3),(22,'222222222222222','2222222222222222222','/test/img/2.jpg',1),(23,'333333333333333','333333333333333333','/test/img/3.jpg',1),(24,'4444444444444','444444444444444','/test/img/1.jpg',1);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `orderdata` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `enforce` int(5) DEFAULT NULL,
  `bz` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ispay` int(50) DEFAULT NULL,
  `cpname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_order` */

/*Table structure for table `t_shop` */

DROP TABLE IF EXISTS `t_shop`;

CREATE TABLE `t_shop` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `shopname` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduce` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_shop` */

insert  into `t_shop`(`id`,`shopname`,`introduce`,`pic`) values (10,'2','2','/test/img/t014d3503dd2d67d728.jpg');

/*Table structure for table `t_shopcar` */

DROP TABLE IF EXISTS `t_shopcar`;

CREATE TABLE `t_shopcar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cpname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  `price` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_shopcar` */

insert  into `t_shopcar`(`id`,`cpname`,`username`,`num`,`price`) values (16,'牛油果香辣鸡肉卷','3',1,1),(17,'班柠檬菊香果茶','3',1,2);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `rolename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`name`,`password`,`address`,`phone`,`rolename`,`state`) values (1,'1','1','1','1','1','root',1),(32,'2','2','2','2','2','shopper',0),(43,'3','3','3','3','3','customer',0),(44,'4','4','4','4444','4','customer',0);

/*Table structure for table `t_vote` */

DROP TABLE IF EXISTS `t_vote`;

CREATE TABLE `t_vote` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `cpid` int(20) DEFAULT NULL,
  `sjid` int(20) DEFAULT NULL,
  `ztpj` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `rj` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `bq` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bz` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_vote` */

insert  into `t_vote`(`id`,`username`,`cpid`,`sjid`,`ztpj`,`title`,`rj`,`content`,`bq`,`bz`) values (1,'1',4,1,'3','1111','55','123123',NULL,NULL),(2,'1',8,1,'2','12','12','1223',NULL,NULL),(3,'1',8,1,'2','12','12','1223',NULL,NULL),(4,'1',5,1,'2','好哦','22','号',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
