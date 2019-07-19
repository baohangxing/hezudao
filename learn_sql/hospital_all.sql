/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hospital

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-06-10 16:44:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` char(5) NOT NULL,
  `fname` char(15) NOT NULL,
  `Iname` char(15) NOT NULL,
  `phone` char(12) NOT NULL,
  `beeper` char(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('00001', 'Perry', 'Cox', '555-1111', '555-1212');
INSERT INTO `doctor` VALUES ('00002', 'Elliot', 'Reid', '555-2222', '555-2323');
INSERT INTO `doctor` VALUES ('00003', 'JD', 'Dorian', '555-3333', '555-3434');
INSERT INTO `doctor` VALUES ('00004', 'Chris', 'Turk', '555-5555', '555-4545');
INSERT INTO `doctor` VALUES ('00005', 'Bob', 'Kelso', '555-6666', '555-5656');

-- ----------------------------
-- Table structure for insurance
-- ----------------------------
DROP TABLE IF EXISTS `insurance`;
CREATE TABLE `insurance` (
  `company` char(15) NOT NULL,
  `contact_fname` char(15) NOT NULL,
  `contact_Lname` char(15) NOT NULL,
  `phone` char(12) NOT NULL,
  PRIMARY KEY (`company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of insurance
-- ----------------------------
INSERT INTO `insurance` VALUES ('Nationwide', 'Randy', 'Buck', '555-7654');
INSERT INTO `insurance` VALUES ('PRudential', 'Jan', 'Johnson', '555-9876');
INSERT INTO `insurance` VALUES ('State Farm', 'Sam', 'Smith', '555-8765');

-- ----------------------------
-- Table structure for insure
-- ----------------------------
DROP TABLE IF EXISTS `insure`;
CREATE TABLE `insure` (
  `patientid` char(5) NOT NULL,
  `insurancescompany` char(15) NOT NULL,
  PRIMARY KEY (`patientid`,`insurancescompany`),
  KEY `fk_insurcom` (`insurancescompany`),
  CONSTRAINT `fk_insurcom` FOREIGN KEY (`insurancescompany`) REFERENCES `insurance` (`company`),
  CONSTRAINT `fk_patientid` FOREIGN KEY (`patientid`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of insure
-- ----------------------------
INSERT INTO `insure` VALUES ('44444', 'Nationwide');
INSERT INTO `insure` VALUES ('55555', 'Nationwide');
INSERT INTO `insure` VALUES ('11111', 'PRudential');
INSERT INTO `insure` VALUES ('22222', 'PRudential');
INSERT INTO `insure` VALUES ('33333', 'State Farm');
INSERT INTO `insure` VALUES ('66666', 'State Farm');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` char(5) NOT NULL,
  `doctorid` char(5) NOT NULL,
  `fname` char(15) NOT NULL,
  `Iname` char(15) NOT NULL,
  `street` char(15) NOT NULL,
  `city` char(10) NOT NULL,
  `state` char(2) NOT NULL,
  `zip` char(10) NOT NULL,
  `phone` char(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctorid` (`doctorid`),
  CONSTRAINT `fk_doctorid` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('11111', '00001', 'Jim', 'Perotti', '12 Osk St', 'Shade', 'OH', '45701', '555-1234');
INSERT INTO `patient` VALUES ('22222', '00002', 'Glen', 'Stamier', '1 Walnut Ave', 'Athens', 'FL', '58474', '555-2345');
INSERT INTO `patient` VALUES ('33333', '00002', 'Maddy', 'Gray', '45 Maple', 'Glouster', 'KY', '73674', '555-3456');
INSERT INTO `patient` VALUES ('44444', '00003', 'Blake', 'Shelton', '3 Elm', 'Shade', 'OH', '45701', '555-4567');
INSERT INTO `patient` VALUES ('55555', '00004', 'EJ', 'Thornton', '92 Ash St', 'ORlando', 'FL', '85744', '555-4568');
INSERT INTO `patient` VALUES ('66666', '00004', 'Dyrk', 'Ashton', '33 Poplar Ave', 'Columbus', 'OH', '47837', '555-6789');
