/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17 : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `hospital`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telphone` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduce` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`telphone`,`introduce`) values (46,'心脑血管科','010-123456789','专治各种疾病'),(47,'普通外科','010-234567890','专治各种那个');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(5) DEFAULT NULL,
  `level` int(5) DEFAULT NULL,
  `departmentid` int(5) DEFAULT NULL,
  `introduce` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `doctor` */

insert  into `doctor`(`id`,`name`,`password`,`sex`,`level`,`departmentid`,`introduce`,`time`,`pic`) values (55,'刘杰','1',1,2,46,'不对老中医','周一上午,周一下午,周二上午,周二下午,周三上午,周三下午,周四上午,周四下午,周五上午,周五下午,周六上午,周六下午,周日上午,周日下午','img/1.jpg'),(56,'溜大街','1',1,2,47,'专治各种疾病','周一上午,周一下午,周二上午,周二下午,周三上午,周三下午,周四上午,周四下午,周五上午,周五下午,周六上午,周六下午,周日上午,周日下午','img/2.jpg');

/*Table structure for table `guahao` */

DROP TABLE IF EXISTS `guahao`;

CREATE TABLE `guahao` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `doctorid` int(5) DEFAULT NULL,
  `departmentid` int(5) DEFAULT NULL,
  `doctorname` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` int(5) DEFAULT NULL,
  `state` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `guahao` */

insert  into `guahao`(`id`,`doctorid`,`departmentid`,`doctorname`,`time`,`userid`,`state`) values (21,55,46,'刘杰','17:00',12,0),(22,55,46,'刘杰','15:00-17:00',12,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` int(5) DEFAULT NULL,
  `age` int(5) DEFAULT NULL,
  `telphone` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`realname`,`password`,`sex`,`age`,`telphone`,`email`,`passport`) values (1,'root','root','1',1,1,'1','1',NULL),(12,'liudapan','刘大盼','1',1,26,'18231182205','2568238105@qq.com',NULL),(14,'1','1','123',1,12,'','','12121'),(15,'liujie','刘杰','null',1,123,'123123123','12312312312','121212123');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
