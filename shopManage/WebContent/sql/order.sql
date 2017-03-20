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
  `typeid` int(5) DEFAULT NULL,
  `goodsname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `introduce` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `nowprice` double DEFAULT NULL,
  `picture` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `intime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `newgoods` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_cp` */

insert  into `t_cp`(`id`,`typeid`,`goodsname`,`introduce`,`price`,`nowprice`,`picture`,`intime`,`newgoods`) values (1,1,'1','1',1,1,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',1),(2,2,'2','2',2,2,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',2),(3,3,'3','3',3,3,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',3),(4,4,'4','4',4,4,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',4),(5,5,'5','5',5,5,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',5),(6,6,'6','6',6,6,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',6),(7,7,'7','7',7,7,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',7),(8,8,'8','8',8,8,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',8),(9,9,'9','9',9,9,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',9),(10,10,'10','10',10,10,'/test/img/t014d3503dd2d67d728.jpg','2017-03-09 22',10);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_message` */

insert  into `t_message`(`id`,`username`,`phone`,`content`,`reply`) values (2,'2','123','123','123'),(3,'3','3','3','3'),(4,'4','1234','1234','1234'),(5,'5','23412','2314','435345342'),(7,'7','7','7','7'),(8,'1','1','1111111','erwrwer'),(9,'130634199411243522','3234','234','啊哈哈哈发送到发送到'),(13,'1','1','123123123123哈哈哈哈哈','');

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `intime` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_notice` */

insert  into `t_notice`(`id`,`title`,`content`,`intime`) values (8,'234234','dfgdsfg','2017-03-05 23'),(9,'2342','sgsfdf','2017-03-11 01'),(10,'啊哈哈哈','1234355','2017-03-11 10');

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `orderdata` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `enforce` int(5) DEFAULT NULL,
  `bz` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ispay` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`username`,`orderdata`,`enforce`,`bz`,`ispay`,`cpname`,`num`) values (19,'1','2017-03-10 00',0,NULL,'0','8',3),(20,'1','2017-03-10 00',0,NULL,'0','5',2);

/*Table structure for table `t_shopcar` */

DROP TABLE IF EXISTS `t_shopcar`;

CREATE TABLE `t_shopcar` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `cpid` int(5) DEFAULT NULL,
  `userid` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_shopcar` */

insert  into `t_shopcar`(`id`,`cpid`,`userid`) values (1,9,1),(2,NULL,NULL),(3,NULL,NULL),(4,NULL,NULL),(5,NULL,NULL);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`name`,`password`,`address`,`phone`) values (1,'1','1','1','1','1'),(2,'2','2','2','4','2'),(3,'8','8','8','5','8'),(4,'88','88','88','哈哈哈','88'),(5,'9','9','9','哈哈哈','9'),(6,'444','444','444','哈哈哈','444'),(7,'77','77','77','哈哈哈','77'),(8,'111','111','111','哈哈哈','111'),(9,'1234','1234','12','哈哈哈','45678'),(10,'99999','99999','99','哈哈哈','99999'),(13,'2121','2121','21','哈哈哈','21'),(14,'哈哈','哈哈','123','123123123','1234'),(15,'666','6666','666','6666','666');

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
