/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.7.17 : Database - zhaopin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zhaopin` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `zhaopin`;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telphone` decimal(11,0) DEFAULT NULL,
  `fanwei` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jigou` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shuiwu` decimal(10,0) DEFAULT NULL,
  `starttime` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `yyzz` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xy` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userpassport` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `introduce` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pic` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `company` */

insert  into `company`(`id`,`password`,`name`,`address`,`telphone`,`fanwei`,`jigou`,`shuiwu`,`starttime`,`yyzz`,`xy`,`username`,`userpassport`,`state`,`introduce`,`pic`) values (24,'1','网易','软件园西区','18301057019','游戏，广告，电商，互联网','123456','123456','2017-05-03','123456','123456','丁磊','123456789012345678',1,'网易','img/t10.jpg'),(25,'1','百度','软件园西区','18301057019','搜索，广告，互联网','123456','123456','2017-05-03','123456','123456','李彦宏','123456789012345678',1,'百度','img/t11.jpg'),(26,'1','腾讯','软件园西区','18301057019','游戏，社交，互联网','123456','123456','2017-05-03','123456','123456','马化腾','123456789012345678',1,'腾讯','img/t12.jpg'),(27,'1','阿里','国家广告产业园','18301057019','电商，支付，互联网','123456','123456','2017-05-03','123456','123456','马云','123456789012345678',1,'阿里','img/t13.jpg'),(28,'1','京东','亦庄','18301057019','电商，支付，互联网','123456','123456','2017-05-03','123456','123456','刘强东','123456789012345678',1,'京东','img/t14.jpg'),(29,'1','小蓝单车','国家广告产业园','18301057019','单车，互联网','123456','123456','2017-05-03','123456','123456','不认识','123456789012345678',0,'小懒蛋城','img/t15.jpg');

/*Table structure for table `jianli` */

DROP TABLE IF EXISTS `jianli`;

CREATE TABLE `jianli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passport` varchar(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telphone` bigint(20) DEFAULT NULL,
  `school` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xueli` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zhuanye` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hxueli` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hzhuanye` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `job` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gongzi` int(11) DEFAULT NULL,
  `createtime` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jiangli` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shijian` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pingjia` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `jianli` */

insert  into `jianli`(`id`,`userid`,`name`,`sex`,`age`,`birthday`,`passport`,`address`,`telphone`,`school`,`xueli`,`zhuanye`,`hxueli`,`hzhuanye`,`language`,`job`,`gongzi`,`createtime`,`jiangli`,`shijian`,`pingjia`) values (5,14,'刘杰','男',22,'2017-05-02','123456789012345678','丰台',18301057019,'清大','本科','软件','本科','软件','英语','JAVA',15000,'2017-05-11','file/个人奖励.docx','file/实践.docx','file/评价.docx');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logintime` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`logintime`) values (220,'网易','2017-05-11 21:03:55'),(221,'root','2017-05-11 21:04:08'),(222,'网易','2017-05-11 21:05:00'),(223,'百度','2017-05-11 21:09:04'),(224,'阿里','2017-05-11 21:11:49'),(225,'刘杰','2017-05-11 21:16:02'),(226,'刘杰','2017-05-11 21:39:12'),(227,'刘杰','2017-05-11 21:51:01'),(228,'网易','2017-05-11 21:53:48');

/*Table structure for table `root` */

DROP TABLE IF EXISTS `root`;

CREATE TABLE `root` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telphone` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `root` */

insert  into `root`(`id`,`password`,`name`,`sex`,`telphone`) values (1,'1','root','男','1212124');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jianliid` int(11) DEFAULT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `realname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telphone` decimal(11,0) DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`jianliid`,`password`,`realname`,`sex`,`telphone`,`email`) values (14,0,'1','刘杰','男','18301057019','2568238105@qq.com');

/*Table structure for table `zhaopin` */

DROP TABLE IF EXISTS `zhaopin`;

CREATE TABLE `zhaopin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) DEFAULT NULL,
  `telphone` decimal(20,0) DEFAULT NULL,
  `endtime` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  `starttime` varchar(55) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `zhaopin` */

insert  into `zhaopin`(`id`,`companyid`,`telphone`,`endtime`,`starttime`) values (19,24,'18301057019','2017-05-31','2017-05-11'),(20,24,'18301057019','2017-05-31','2017-05-11'),(21,25,'18301057019','2017-05-25','2017-05-11'),(22,25,'18301057019','2017-05-24','2017-05-11'),(23,27,'18301057019','2017-05-23','2017-05-11'),(24,27,'18301057019','2017-05-17','2017-05-11');

/*Table structure for table `zhiwei` */

DROP TABLE IF EXISTS `zhiwei`;

CREATE TABLE `zhiwei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhaopinid` int(11) DEFAULT NULL,
  `zhiweiname` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gongzi` int(11) DEFAULT NULL,
  `zuidixueli` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `zhuanye` varchar(155) COLLATE utf8_unicode_ci DEFAULT NULL,
  `renshu` int(11) DEFAULT NULL,
  `zige` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zhize` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `zhiwei` */

insert  into `zhiwei`(`id`,`zhaopinid`,`zhiweiname`,`gongzi`,`zuidixueli`,`sex`,`age`,`zhuanye`,`renshu`,`zige`,`zhize`) values (19,19,'JAVA开发工程师',15000,'本科','不限',22,'软件工程',10,'熟悉JAVA开发，熟练使用框架','开发广告引擎，优化代码'),(20,20,'openresty开发工程师',20000,'本科','不限',22,'计算机',2,'熟悉openresty开发','负责adx开发'),(21,21,'C++',25000,'研究生','不限',22,'计算机',5,'熟悉C++开发，研究生学历','参与搜索引擎开发'),(22,22,'C',30000,'博士生','不限',25,'计算机',5,'熟练使用C开发，熟练使用各种算法','蔡玉搜索引擎开发'),(23,23,'spark工程师',20000,'本科','不限',30,'软件工程',5,'熟练使用hadoop，spark，kafka','负责阿里云维护'),(24,24,'大数据开发工程师',20000,'本科','不限',22,'软件工程',5,'大数据开发','负责淘宝大数据分析');

/*Table structure for table `zhiweijianli` */

DROP TABLE IF EXISTS `zhiweijianli`;

CREATE TABLE `zhiweijianli` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhiweiid` int(11) DEFAULT NULL,
  `jianliid` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `zhiweijianli` */

insert  into `zhiweijianli`(`id`,`zhiweiid`,`jianliid`,`state`) values (15,19,5,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
