/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17 : Database - badminton
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`badminton` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `badminton`;

/*Table structure for table `changdi` */

DROP TABLE IF EXISTS `changdi`;

CREATE TABLE `changdi` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `telphone` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `admin` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `introduce` varchar(555) COLLATE utf8_unicode_ci NOT NULL,
  `route` varchar(555) COLLATE utf8_unicode_ci NOT NULL,
  `pic` varchar(555) COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `changdi` */

insert  into `changdi`(`id`,`name`,`address`,`telphone`,`admin`,`introduce`,`route`,`pic`,`price`) values (1,'新宫羽毛球馆','地铁4号线新宫站','18301057019','梁博文2b','专治各种儿童','哈哈哈哈哈哈','/BadmintonOrder/img/1.jpg',80),(2,'人民大学羽毛球馆','地铁4号线人民大学站','18301057019','梁博文','啪啪啪啪啪','啪啪啪啪啪','/BadmintonOrder/img/2.jpg',100),(3,'xxx羽毛球馆','xxxx号线','12345678901','xxx','啪啪啪','啪啪啪','/BadmintonOrder/img/1.jpg',100),(4,'巴巴爸爸不','吞吞吐吐拖拖','11111111','灌灌灌灌','uuuuuu','1111111','/BadmintonOrder/img/1.jpg',66),(5,'柔柔弱弱若若','一月又一月晕晕','44444444','坎坎坷坷扩扩扩扩','4444444','1111111111','/BadmintonOrder/img/1.jpg',88),(6,'8888888','灌灌灌灌灌过','6666666666','拒绝','uuuuuuuuuuuummmmmmm呃呃呃呃呃呃呃呃呃','吞吞吐吐拖拖拖','/BadmintonOrder/img/1.jpg',99),(7,'7','7','7','7','7','7','/BadmintonOrder/img/1.jpg',77),(8,'8','8','8','8','8','8','/BadmintonOrder/img/1.jpg',88),(9,'9','9','9','9','9','9','/BadmintonOrder/img/1.jpg',9),(10,'0','0','0','0','0','0','/BadmintonOrder/img/1.jpg',90);

/*Table structure for table `dingdan` */

DROP TABLE IF EXISTS `dingdan`;

CREATE TABLE `dingdan` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `changdiid` int(3) NOT NULL,
  `userid` int(3) NOT NULL,
  `playtime` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  `time` float NOT NULL,
  `starttime` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  `endtime` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `dingdan` */

insert  into `dingdan`(`id`,`changdiid`,`userid`,`playtime`,`time`,`starttime`,`endtime`) values (24,2,1,'2017-05-27 00:42',4.91667,'2017-05-27 00:45','2017-05-27 05:40'),(25,2,1,'2017-05-27 00:44',0.916667,'2017-05-28 01:05','2017-05-28 02:00'),(26,2,1,'2017-05-27 00:47',28,'2017-05-29 01:45','2017-05-30 05:45'),(27,1,1,'2017-05-27 21:29',17,'2017-05-31 01:25','2017-05-31 18:25'),(28,1,1,'2017-05-27 22:00',24,'2017-06-01 05:55','2017-06-02 05:55');

/*Table structure for table `payrecord` */

DROP TABLE IF EXISTS `payrecord`;

CREATE TABLE `payrecord` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `userid` int(3) NOT NULL,
  `money` float NOT NULL,
  `time` varchar(44) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `payrecord` */

insert  into `payrecord`(`id`,`userid`,`money`,`time`) values (1,1,11,NULL),(2,1,9,NULL),(3,1,10,NULL),(4,1,10,NULL),(5,1,99,NULL),(6,1,100,NULL),(7,1,1,NULL),(8,1,100,'2017-05-24 22:02:00'),(9,1,100,'2017-05-27 00:32:57'),(10,1,100,'2017-05-27 00:33:15'),(11,1,100,'2017-05-27 00:33:47'),(12,1,100,'2017-05-27 00:35:20'),(13,1,100,'2017-05-27 00:36:27'),(14,1,100,'2017-05-27 00:44:30'),(15,1,100,'2017-05-27 00:47:58'),(16,1,100,'2017-05-27 20:50:27'),(17,1,100,'2017-05-27 20:50:33'),(18,1,100,'2017-05-27 20:50:59'),(19,1,100,'2017-05-27 20:59:25'),(20,1,100,'2017-05-27 21:10:43'),(21,1,100,'2017-05-27 21:11:16'),(22,1,100,'2017-05-27 21:30:14'),(23,1,100,'2017-05-27 21:30:30'),(24,1,100,'2017-05-27 21:30:36'),(25,1,500,'2017-05-27 21:30:40'),(26,3,100,'2017-05-27 21:39:48'),(27,1,1000,'2017-05-27 22:00:33'),(28,4,100,'2017-05-27 22:04:01');

/*Table structure for table `pingjia` */

DROP TABLE IF EXISTS `pingjia`;

CREATE TABLE `pingjia` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `changdiid` int(3) NOT NULL,
  `score` int(3) NOT NULL,
  `pingjia` varchar(555) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(3) NOT NULL,
  `time` varchar(33) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `pingjia` */

insert  into `pingjia`(`id`,`changdiid`,`score`,`pingjia`,`userid`,`time`) values (1,1,5,'哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈',1,'2017-05-21'),(2,1,4,'啪啪啪啪啪啪啪啪啪',1,'2017-05-21'),(3,1,5,'5555555555555555555555',1,'2017-05-21'),(4,1,5,'嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿嘿黑嘿嘿嘿或或或',1,'2017-05-21'),(5,1,4,'uuuuuuuuuuuuuuuuuuuu',1,'2017-05-21'),(6,1,3,'不好，张乱差',1,'2017-05-21'),(7,2,9,'87',1,'2017-05-30'),(9,2,3,'舒服啥地方',1,'2017-05-27 21:57:19'),(10,2,4,'啊哈哈哈哈哈',1,'2017-05-27 22:00:49');

/*Table structure for table `root` */

DROP TABLE IF EXISTS `root`;

CREATE TABLE `root` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `realname` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `telphone` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `pic` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `root` */

insert  into `root`(`id`,`username`,`password`,`realname`,`telphone`,`pic`) values (1,'1','1','1','1','1');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `realname` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `telphone` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `money` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`realname`,`telphone`,`money`) values (1,'小坟堆儿','1','刘杰','18301057019',3000),(2,'1','1','1','18301057019',600),(3,'123','1','哈哈哈','12345678988',100);

/*Table structure for table `xinwen` */

DROP TABLE IF EXISTS `xinwen`;

CREATE TABLE `xinwen` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(555) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `pic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `xinwen` */

insert  into `xinwen`(`id`,`title`,`content`,`time`,`pic`) values (1,'1','1','2017-05-21','/BadmintonOrder/img/1.jpg'),(2,'2','2','2017-05-22','/BadmintonOrder/img/2.jpg'),(3,'3','3','2017-05-22','/BadmintonOrder/img/3.jpg'),(4,'4','4','2017-05-22','/BadmintonOrder/img/4.jpg'),(5,'5','5','2017-05-22','/BadmintonOrder/img/5.jpg'),(6,'6','6','2017-05-22','/BadmintonOrder/img/1.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
