/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : amazon

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-06-10 16:43:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `isbn` char(10) NOT NULL,
  `title` char(20) NOT NULL,
  `fname` char(15) NOT NULL,
  `Iname` char(15) NOT NULL,
  `list_price` decimal(20,2) NOT NULL,
  `qoh` decimal(20,0) NOT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('014025448X', 'At Home in Mitford', 'Jan', 'Karon', '12.95', '97');
INSERT INTO `book` VALUES ('0312009943', 'Women of the silk', 'Dail', 'Tsukiyama', '12.95', '150');
INSERT INTO `book` VALUES ('0345423097', 'Joy School', 'Elizabeth', 'Berg', '11.95', '129');
INSERT INTO `book` VALUES ('0670894370', 'A Common Life', 'Jan', 'Karon', '24.95', '45');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `email` char(20) NOT NULL,
  `Iname` char(15) NOT NULL,
  `fname` char(15) NOT NULL,
  `street` char(20) NOT NULL,
  `city` char(15) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` char(10) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('mtfrost@yahoo.com', 'Tete', 'Frost', '75 Algaringo', 'Miami', 'FL', '33134');
INSERT INTO `client` VALUES ('perotti@ohio.edu', 'Jim', 'Perotti', '54 Pine PI.', 'Athens', 'OH', '45701');
INSERT INTO `client` VALUES ('thacker@ohio.edu', 'Rececker', 'Thacker', '93 Maple Dr', 'Athens', 'OH', '45701');

-- ----------------------------
-- Table structure for lientem
-- ----------------------------
DROP TABLE IF EXISTS `lientem`;
CREATE TABLE `lientem` (
  `xorderid` char(5) NOT NULL,
  `bookisbn` char(10) NOT NULL,
  `sale_price` decimal(20,2) NOT NULL,
  `quantity` decimal(20,0) NOT NULL,
  PRIMARY KEY (`xorderid`,`bookisbn`),
  KEY `fk_bookisbn` (`bookisbn`),
  CONSTRAINT `fk_bookisbn` FOREIGN KEY (`bookisbn`) REFERENCES `book` (`isbn`),
  CONSTRAINT `fk_xorderid` FOREIGN KEY (`xorderid`) REFERENCES `xorder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lientem
-- ----------------------------
INSERT INTO `lientem` VALUES ('1', '014025448X', '10.36', '3');
INSERT INTO `lientem` VALUES ('1', '0312009943', '10.36', '2');
INSERT INTO `lientem` VALUES ('2', '0312009943', '11.50', '1');
INSERT INTO `lientem` VALUES ('2', '0670894370', '17.46', '2');
INSERT INTO `lientem` VALUES ('3', '0670894370', '18.00', '1');

-- ----------------------------
-- Table structure for xorder
-- ----------------------------
DROP TABLE IF EXISTS `xorder`;
CREATE TABLE `xorder` (
  `id` char(5) NOT NULL,
  `clientemail` char(20) NOT NULL,
  `order_date` date NOT NULL,
  `credit_card` char(16) NOT NULL,
  `exp_date` date NOT NULL,
  `ship_method` char(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clientemail` (`clientemail`),
  CONSTRAINT `fk_clientemail` FOREIGN KEY (`clientemail`) REFERENCES `client` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xorder
-- ----------------------------
INSERT INTO `xorder` VALUES ('1', 'thacker@ohio.edu', '2002-11-15', '9999888877776666', '2003-07-31', 'Fedex');
INSERT INTO `xorder` VALUES ('2', 'perotti@ohio.edu', '2002-11-23', '3333444455556666', '2005-04-30', 'USPS');
INSERT INTO `xorder` VALUES ('3', 'thacker@ohio.edu', '2002-12-02', '4444111122223333', '2004-10-31', 'USPS');
