/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : acme

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-06-10 16:43:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` char(5) NOT NULL,
  `fname` char(15) NOT NULL,
  `Iname` char(15) NOT NULL,
  `dbay` date NOT NULL,
  `phone` char(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('11111', 'Glem', 'Stamler', '1974-09-13', '555-3232');
INSERT INTO `customer` VALUES ('22222', 'Maddy', 'Gray', '1984-08-04', '555-8475');
INSERT INTO `customer` VALUES ('33333', 'Black', 'Shelton', '1975-07-25', '555-4875');
INSERT INTO `customer` VALUES ('44444', 'EJ', 'Thornton', '1988-02-04', '555-9845');

-- ----------------------------
-- Table structure for lineitem
-- ----------------------------
DROP TABLE IF EXISTS `lineitem`;
CREATE TABLE `lineitem` (
  `xorderid` char(5) NOT NULL,
  `productid` char(5) NOT NULL,
  `quanitity` decimal(20,0) NOT NULL,
  `sale_price` decimal(20,2) NOT NULL,
  PRIMARY KEY (`xorderid`,`productid`),
  KEY `fk_productid` (`productid`),
  CONSTRAINT `fk_productid` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_xorderid` FOREIGN KEY (`xorderid`) REFERENCES `xorder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lineitem
-- ----------------------------
INSERT INTO `lineitem` VALUES ('10000', '1', '1', '15.75');
INSERT INTO `lineitem` VALUES ('10000', '3', '2', '13.95');
INSERT INTO `lineitem` VALUES ('10001', '2', '1', '23.95');
INSERT INTO `lineitem` VALUES ('10001', '5', '1', '18.50');
INSERT INTO `lineitem` VALUES ('10002', '8', '3', '21.70');
INSERT INTO `lineitem` VALUES ('10003', '1', '2', '15.95');
INSERT INTO `lineitem` VALUES ('10003', '3', '1', '12.95');
INSERT INTO `lineitem` VALUES ('10003', '4', '4', '19.98');
INSERT INTO `lineitem` VALUES ('10003', '6', '1', '18.35');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` char(5) NOT NULL,
  `list_price` decimal(20,2) NOT NULL,
  `description` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '15.95', 'lager');
INSERT INTO `product` VALUES ('2', '25.24', 'stout');
INSERT INTO `product` VALUES ('3', '13.95', 'light');
INSERT INTO `product` VALUES ('4', '19.98', 'pilsner');
INSERT INTO `product` VALUES ('5', '18.75', 'microbrew');
INSERT INTO `product` VALUES ('6', '18.57', 'aie');
INSERT INTO `product` VALUES ('7', '15.95', 'bock');
INSERT INTO `product` VALUES ('8', '19.95', 'portor');

-- ----------------------------
-- Table structure for xorder
-- ----------------------------
DROP TABLE IF EXISTS `xorder`;
CREATE TABLE `xorder` (
  `id` char(5) NOT NULL,
  `customerid` char(5) NOT NULL,
  `delivery` char(10) NOT NULL,
  `wrap` char(1) NOT NULL,
  `xdate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cunstomerid` (`customerid`),
  CONSTRAINT `fk_cunstomerid` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xorder
-- ----------------------------
INSERT INTO `xorder` VALUES ('10000', '11111', 'N', 'N', '2003-02-04');
INSERT INTO `xorder` VALUES ('10001', '22222', 'Y', 'Y', '2003-02-05');
INSERT INTO `xorder` VALUES ('10002', '11111', 'N', 'N', '2003-02-05');
INSERT INTO `xorder` VALUES ('10003', '33333', 'Y', 'N', '2003-02-06');
