/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.17-log : Database - comadmin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`comadmin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `comadmin`;

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` varchar(36) DEFAULT NULL COMMENT '父菜单',
  `level` bigint(2) DEFAULT NULL COMMENT '菜单层级',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '父菜单联集',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `bg_color` varchar(255) DEFAULT NULL COMMENT '显示背景色',
  `is_show` tinyint(2) DEFAULT NULL COMMENT '是否显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(36) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`parent_id`,`level`,`parent_ids`,`sort`,`href`,`target`,`icon`,`bg_color`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values 
(1,'系统管理',NULL,1,'',1,'',NULL,'',NULL,1,'','2','2018-01-16 11:29:46','2','2018-01-20 03:09:26',NULL,0),
(3,'编辑权限','5',3,'1,5,3,',1,'',NULL,NULL,NULL,0,'sys:menu:edit','2','2018-02-08 09:50:16','2','2018-02-08 09:50:25',NULL,0),
(4,'删除权限','5',3,'1,5,4,',2,'',NULL,NULL,NULL,0,'sys:menu:delete','2','2018-02-08 09:51:53','2','2018-02-08 09:53:42',NULL,0),
(5,'权限管理','1',2,'1,5,',20,'/admin/system/menu/list',NULL,'','#d4573b',1,'sys:menu:list','2','2018-01-16 11:33:19','2','2018-02-08 09:49:28',NULL,0),
(16,'新增权限','5',3,'1,5,16,',3,'',NULL,NULL,'',0,'sys:menu:add','1','2019-04-13 11:06:39','1','2019-04-13 11:06:39',NULL,0),
(17,'角色管理','1',2,'1,17,',21,'/admin/system/role/list',NULL,'','',1,'sys:role:list','1','2019-04-13 11:11:08','1','2019-04-13 11:11:08',NULL,0),
(18,'新增角色','17',3,'1,17,18,',0,'',NULL,NULL,NULL,0,'sys:role:add','1','2018-02-08 09:58:11','12','2018-02-08 09:58:11',NULL,0),
(19,'编辑权限','17',3,'1,17,19,',10,'',NULL,NULL,NULL,0,'sys:role:edit','1','2018-02-08 09:59:01','1','2018-02-08 09:59:01',NULL,0),
(20,'删除角色','17',3,'1,17,20,',20,'',NULL,NULL,NULL,0,'sys:role:delete','1','2018-02-08 09:59:56','1','2018-02-08 09:59:56',NULL,0),
(21,'用户管理','1',2,'21,',22,'/admin/system/user/list',NULL,'','',1,'sys:user:list','1','2019-04-13 11:55:36','1','2019-04-13 11:55:36',NULL,0),
(22,'新增用户','21',3,'21,22,',1,'',NULL,NULL,'',0,'sys:user:add','1','2019-04-13 11:56:30','1','2019-04-13 11:56:30',NULL,0),
(23,'编辑用户','21',3,'21,23,',2,'',NULL,NULL,'',0,'sys:user:edit','1','2019-04-13 11:57:13','1','2019-04-13 11:57:13',NULL,0),
(24,'删除用户','21',3,'21,24,',3,'',NULL,NULL,'',0,'sys:user:delete','1','2019-04-13 11:57:41','1','2019-04-13 11:57:41',NULL,0);

/*Table structure for table `sys_rescource` */

DROP TABLE IF EXISTS `sys_rescource`;

CREATE TABLE `sys_rescource` (
  `id` int(36) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `web_url` varchar(500) DEFAULT NULL COMMENT '资源网络地址',
  `hash` varchar(255) DEFAULT NULL COMMENT '文件标识',
  `file_size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `original_net_url` text,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(36) DEFAULT NULL COMMENT '创建人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(36) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源';

/*Data for the table `sys_rescource` */

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(36) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '角色名称',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`create_date`,`create_by`,`update_date`,`update_by`,`remarks`,`del_flag`) values 
(1,'前台用户','2017-11-02 14:19:07','1','2019-04-13 10:17:06','1','',0),
(2,'系统管理员','2017-11-29 19:36:37','1','2019-04-13 11:57:57','1','',0),
(3,'测试员','2019-04-13 11:45:18','1','2019-04-13 11:54:09','1','用于测试',0);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` int(36) NOT NULL,
  `menu_id` int(36) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(2,1),
(2,3),
(2,4),
(2,5),
(2,16),
(2,17),
(2,18),
(2,19),
(2,20),
(2,21),
(2,22),
(2,23),
(2,24),
(3,1),
(3,17),
(3,18),
(3,19);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(36) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(36) DEFAULT NULL COMMENT '登录名',
  `nick_name` varchar(40) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(2000) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `salt` varchar(40) DEFAULT NULL COMMENT 'shiro加密盐',
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱地址',
  `locked` tinyint(2) DEFAULT NULL COMMENT '是否锁定',
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(36) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(36) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(4) NOT NULL,
  `is_admin` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`login_name`,`nick_name`,`icon`,`password`,`salt`,`tel`,`email`,`locked`,`create_date`,`create_by`,`update_date`,`update_by`,`remarks`,`del_flag`,`is_admin`) values 
(1,'java','我是管理员',NULL,'9c5feb7aba88c7c87bc047c7cec7c6e3b63e1894','08c5900125b80cd2','13776055179','b@qq.com',0,'2017-11-27 22:19:39','1','2018-08-28 13:25:18','1','',0,1);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` int(36) NOT NULL,
  `role_id` int(36) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
(1,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
