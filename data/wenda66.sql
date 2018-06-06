/*
Navicat MySQL Data Transfer

Source Server         : phpwamp
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : wenda66

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2018-06-06 18:01:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for hd_admin
-- ----------------------------
DROP TABLE IF EXISTS `hd_admin`;
CREATE TABLE `hd_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` char(20) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `loginip` char(23) NOT NULL DEFAULT '' COMMENT '上次登录IP',
  `lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:锁定.2:未锁定,管理员是否锁定',
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

-- ----------------------------
-- Records of hd_admin
-- ----------------------------
INSERT INTO `hd_admin` VALUES ('1', 'admin', '96e79218965eb72c92a549dd5a330112', '1528272513', '127.0.0.1', '0');

-- ----------------------------
-- Table structure for hd_answer
-- ----------------------------
DROP TABLE IF EXISTS `hd_answer`;
CREATE TABLE `hd_answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '回答内容',
  `adopt` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被采纳1：已采纳， 0：未采纳',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT '所属用户id',
  PRIMARY KEY (`id`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户回答';

-- ----------------------------
-- Records of hd_answer
-- ----------------------------

-- ----------------------------
-- Table structure for hd_ask
-- ----------------------------
DROP TABLE IF EXISTS `hd_ask`;
CREATE TABLE `hd_ask` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '问题内容',
  `reward` smallint(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖励金币',
  `solve` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:已解决  0:未解决',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提问时间',
  `answer` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回答数',
  `uid` int(10) unsigned NOT NULL COMMENT '所属用户id',
  `cid` int(10) unsigned NOT NULL COMMENT '所属分类id',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户问题';

-- ----------------------------
-- Records of hd_ask
-- ----------------------------

-- ----------------------------
-- Table structure for hd_category
-- ----------------------------
DROP TABLE IF EXISTS `hd_category`;
CREATE TABLE `hd_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` char(20) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级ID，0：顶级分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of hd_category
-- ----------------------------
INSERT INTO `hd_category` VALUES ('1', '编程开发1', '0');
INSERT INTO `hd_category` VALUES ('2', '社会人生', '0');
INSERT INTO `hd_category` VALUES ('3', '明星娱乐', '0');
INSERT INTO `hd_category` VALUES ('4', 'PHP', '1');
INSERT INTO `hd_category` VALUES ('5', 'Linux', '1');
INSERT INTO `hd_category` VALUES ('6', 'Html', '1');
INSERT INTO `hd_category` VALUES ('7', 'Css', '1');
INSERT INTO `hd_category` VALUES ('8', '人生百态', '2');
INSERT INTO `hd_category` VALUES ('9', '函数', '4');
INSERT INTO `hd_category` VALUES ('10', 'array_merge', '9');
INSERT INTO `hd_category` VALUES ('11', '12313', '3');
INSERT INTO `hd_category` VALUES ('14', '1', '11');

-- ----------------------------
-- Table structure for hd_user
-- ----------------------------
DROP TABLE IF EXISTS `hd_user`;
CREATE TABLE `hd_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(20) NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户密码',
  `username` char(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `face` varchar(60) NOT NULL DEFAULT '' COMMENT '用户头像',
  `answer` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回答数',
  `adopt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '答案采纳数',
  `ask` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '提问数',
  `point` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `exp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '经验',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上一次登录时间',
  `loginip` char(20) NOT NULL DEFAULT '' COMMENT '上一次的登录IP',
  `registime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `lock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1：锁定，2：未锁定',
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='前台用户表';

-- ----------------------------
-- Records of hd_user
-- ----------------------------
