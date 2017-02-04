/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : qiubeixin

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2016-06-02 00:03:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addmanager
-- ----------------------------
DROP TABLE IF EXISTS `addmanager`;
CREATE TABLE `addmanager` (
  `managerid` varchar(10) NOT NULL,
  `managername` varchar(8) DEFAULT NULL,
  `managerpassword` varchar(10) DEFAULT NULL,
  `managertouch` varchar(12) DEFAULT NULL,
  `manageremail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`managerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addmanager
-- ----------------------------
INSERT INTO `addmanager` VALUES ('1234567', '仇蓓鑫', '1234567', '15822166239', '2533959357@qq.com');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` varchar(10) NOT NULL,
  `goodsname` varchar(50) DEFAULT NULL,
  `goodsprice` varchar(10) DEFAULT NULL,
  `goodsimg` varchar(50) DEFAULT NULL,
  `goodstime` varchar(10) DEFAULT NULL,
  `goodsplace` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('004', '碧浪洗衣凝珠自然清新20颗盒', '42.8', 'top20.jpg', '2016-12-01', '北京');
INSERT INTO `goods` VALUES ('005', 'Koh coconut酷椰 椰汁饮料1L', '22.90', 'top23.jpg', '2016-10-31', '上海');
INSERT INTO `goods` VALUES ('006', '山萃  红莲子330g', '75', 'top28.jpg', '2016-01-31', '上海');
INSERT INTO `goods` VALUES ('007', 'SUNSIDES上质全脂纯牛奶1L', '9.90', 'tejia8.jpg', '2016-01-31', '北京');
INSERT INTO `goods` VALUES ('008', '八喜珍品四合一冰淇凌（盒装260g）', '18.90', 'tejia5.jpg', '2016-11-29', '北京');
INSERT INTO `goods` VALUES ('009', '雀巢脆脆鲨巧克力威化640g', '24.90', 'tuijian4.jpg', '2016-01-31', '北京');
INSERT INTO `goods` VALUES ('010', '优鲜沛芒蔓越莓果汁饮料1.5', '19.90', 'top21.jpg', '2016-08-29', '北京');
INSERT INTO `goods` VALUES ('011', '蓝月亮自然清香深层洁净洗衣液1kg', '18.50', 'top17.jpg', '2016-12-31', '北京');
INSERT INTO `goods` VALUES ('012', '埃及进口橙（3000g/箱）', '29.00', 'top1.jpg', '2016-01-01', '北京');
INSERT INTO `goods` VALUES ('014', '越南火龙果700g/袋', '15.90', 'top2.jpg', '2016-12-31', '上海');
INSERT INTO `goods` VALUES ('015', '每日阳光盐焗腰果（袋袋450g）', '66.60', 'top6.jpg', '2015-12-31', '上海');
INSERT INTO `goods` VALUES ('016', '波利海苔（原味 袋袋24.7g）', '15.90', 'top8.png', '2016-12-01', '北京');
INSERT INTO `goods` VALUES ('017', '金龙鱼葵籽油5L', '59.90', 'top11.jpg', '2016-01-31', '北京');
INSERT INTO `goods` VALUES ('018', '北冰洋苏打水330ml*24', '108.00', 'top22.jpg', '2016-01-01', '上海');
INSERT INTO `goods` VALUES ('019', '深森压缩银耳250g', '59.00', 'top26.jpg', '2016-12-31', '上海');
INSERT INTO `goods` VALUES ('020', '西湖藕粉醇香园桂花莲子礼盒', '42.90', 'top30.png', '2016-10-01', '北京');
INSERT INTO `goods` VALUES ('021', '熊氏牧场加拿大猪肋排', '55.00', 'tuijian2.jpg', '2016-01-31', '北京');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `managerid` varchar(255) NOT NULL,
  `managerpassword` varchar(255) DEFAULT NULL,
  `managertype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`managerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1234567', '1234567', '管理员');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `stockid` varchar(10) NOT NULL,
  `stockname` varchar(50) DEFAULT NULL,
  `stockprice` varchar(10) DEFAULT NULL,
  `stockimg` varchar(50) DEFAULT NULL,
  `stocknumber` varchar(10) DEFAULT NULL,
  `stockplace` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`stockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('004', '碧浪洗衣凝珠自然清新20颗盒', '42.8', 'top20.jpg', null, '北京');
INSERT INTO `stock` VALUES ('005', 'Koh coconut酷椰 椰汁饮料1L', '22.90', 'top23.jpg', null, '上海');
INSERT INTO `stock` VALUES ('006', '山萃  红莲子330g', '75', 'top28.jpg', null, '上海');
INSERT INTO `stock` VALUES ('007', 'SUNSIDES上质全脂纯牛奶1L', '9.90', 'tejia8.jpg', null, '北京');
INSERT INTO `stock` VALUES ('008', '八喜珍品四合一冰淇凌（盒装260g）', '18.90', 'tejia5.jpg', null, '北京');
INSERT INTO `stock` VALUES ('009', '雀巢脆脆鲨巧克力威化640g', '24.90', 'tuijian4.jpg', null, '北京');
INSERT INTO `stock` VALUES ('010', '优鲜沛芒蔓越莓果汁饮料1.5', '19.90', 'top21.jpg', null, '北京');
INSERT INTO `stock` VALUES ('011', '蓝月亮自然清香深层洁净洗衣液1kg', '18.50', 'top17.jpg', null, '北京');
INSERT INTO `stock` VALUES ('012', '埃及进口橙（3000g/箱）', '29.00', 'top1.jpg', null, '北京');
INSERT INTO `stock` VALUES ('014', '越南火龙果700g/袋', '15.90', 'top2.jpg', null, '上海');
INSERT INTO `stock` VALUES ('015', '每日阳光盐焗腰果（袋袋450g）', '66.60', 'top6.jpg', null, '上海');
INSERT INTO `stock` VALUES ('016', '波利海苔（原味 袋袋24.7g）', '15.90', 'top8.png', null, '北京');
INSERT INTO `stock` VALUES ('017', '金龙鱼葵籽油5L', '59.90', 'top11.jpg', null, '北京');
INSERT INTO `stock` VALUES ('018', '北冰洋苏打水330ml*24', '108.00', 'top22.jpg', null, '上海');
INSERT INTO `stock` VALUES ('019', '深森压缩银耳250g', '59.00', 'top26.jpg', null, '上海');
INSERT INTO `stock` VALUES ('020', '西湖藕粉醇香园桂花莲子礼盒', '42.90', 'top30.png', null, '北京');
INSERT INTO `stock` VALUES ('021', '熊氏牧场加拿大猪肋排', '55.00', 'tuijian2.jpg', null, '北京');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(255) NOT NULL,
  `userpassword` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('15822166239', '12345678', '客户');

-- ----------------------------
-- Table structure for zhuceuser
-- ----------------------------
DROP TABLE IF EXISTS `zhuceuser`;
CREATE TABLE `zhuceuser` (
  `zhuceid` varchar(20) NOT NULL,
  `zhucename` varchar(8) DEFAULT NULL,
  `zhucepassword` varchar(10) DEFAULT NULL,
  `zhucetouch` varchar(12) DEFAULT NULL,
  `zhuceemail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`zhuceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zhuceuser
-- ----------------------------
INSERT INTO `zhuceuser` VALUES ('小明', '仇蓓鑫', '12345678', '15822166239', '2533959357@qq.com');
