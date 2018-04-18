/*
Navicat MySQL Data Transfer

Source Server         : tx
Source Server Version : 50716
Source Host           : 119.29.229.49:3306
Source Database       : beshop

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-10-03 23:18:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(40) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '手机数码');
INSERT INTO `category` VALUES ('2', '电脑办公');
INSERT INTO `category` VALUES ('3', '家具家居');
INSERT INTO `category` VALUES ('4', '鞋靴箱包');
INSERT INTO `category` VALUES ('5', '图书音像');
INSERT INTO `category` VALUES ('6', '母婴孕婴');
INSERT INTO `category` VALUES ('7', '汽车用品');
INSERT INTO `category` VALUES ('8', '户外运动');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` varchar(50) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` varchar(50) DEFAULT NULL,
  `oid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_0001` (`pid`) USING BTREE,
  KEY `fk_0002` (`oid`) USING BTREE,
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('02ceeea702ceeea702ceeea702ceeea702ceeea7', '1', '3999', '17', '5c66735b5c66735b5c66735b5c66735b5c66735b');
INSERT INTO `orderitem` VALUES ('033f7dcc033f7dcc033f7dcc033f7dcc033f7dcc', '1', '3999', '17', '36bbf72b36bbf72b36bbf72b36bbf72b36bbf72b');
INSERT INTO `orderitem` VALUES ('0726cf360726cf360726cf360726cf360726cf36', '1', '6688', '32', 'f8b6357cf8b6357cf8b6357cf8b6357cf8b6357c');
INSERT INTO `orderitem` VALUES ('07b1e81507b1e81507b1e81507b1e81507b1e815', '1', '3999', '17', 'b62e9edfb62e9edfb62e9edfb62e9edfb62e9edf');
INSERT INTO `orderitem` VALUES ('0ab6437a0ab6437a0ab6437a0ab6437a0ab6437a', '1', '3999', '17', '64ef1de764ef1de764ef1de764ef1de764ef1de7');
INSERT INTO `orderitem` VALUES ('0e056ee20e056ee20e056ee20e056ee20e056ee2', '1', '3999', '17', '391ce602391ce602391ce602391ce602391ce602');
INSERT INTO `orderitem` VALUES ('10e585f010e585f010e585f010e585f010e585f0', '10', '22990', '31', 'a7342f71a7342f71a7342f71a7342f71a7342f71');
INSERT INTO `orderitem` VALUES ('13d5410113d5410113d5410113d5410113d54101', '10', '22990', '31', '522e0b54522e0b54522e0b54522e0b54522e0b54');
INSERT INTO `orderitem` VALUES ('1ad638f41ad638f41ad638f41ad638f41ad638f4', '10', '22990', '31', '8e2a5c568e2a5c568e2a5c568e2a5c568e2a5c56');
INSERT INTO `orderitem` VALUES ('1c761bd01c761bd01c761bd01c761bd01c761bd0', '1', '3999', '17', '97b6821597b6821597b6821597b6821597b68215');
INSERT INTO `orderitem` VALUES ('2021268820212688202126882021268820212688', '10', '22990', '31', 'e22aaa94e22aaa94e22aaa94e22aaa94e22aaa94');
INSERT INTO `orderitem` VALUES ('27949aa927949aa927949aa927949aa927949aa9', '1', '3999', '17', '17b738db17b738db17b738db17b738db17b738db');
INSERT INTO `orderitem` VALUES ('2bc7a20f2bc7a20f2bc7a20f2bc7a20f2bc7a20f', '10', '22990', '31', 'c02b34bac02b34bac02b34bac02b34bac02b34ba');
INSERT INTO `orderitem` VALUES ('2e584adc2e584adc2e584adc2e584adc2e584adc', '10', '22990', '31', 'a30db4efa30db4efa30db4efa30db4efa30db4ef');
INSERT INTO `orderitem` VALUES ('34f62f4834f62f4834f62f4834f62f4834f62f48', '1', '3999', '17', '86baf24f86baf24f86baf24f86baf24f86baf24f');
INSERT INTO `orderitem` VALUES ('3939045f3939045f3939045f3939045f3939045f', '1', '3999', '17', '3b049e8f3b049e8f3b049e8f3b049e8f3b049e8f');
INSERT INTO `orderitem` VALUES ('3f75c0b93f75c0b93f75c0b93f75c0b93f75c0b9', '1', '3999', '17', 'c02b34bac02b34bac02b34bac02b34bac02b34ba');
INSERT INTO `orderitem` VALUES ('40fcff7040fcff7040fcff7040fcff7040fcff70', '10', '22990', '31', 'cb3537e8cb3537e8cb3537e8cb3537e8cb3537e8');
INSERT INTO `orderitem` VALUES ('41769c4741769c4741769c4741769c4741769c47', '1', '3999', '17', 'bb2e3cd6bb2e3cd6bb2e3cd6bb2e3cd6bb2e3cd6');
INSERT INTO `orderitem` VALUES ('4493afed4493afed4493afed4493afed4493afed', '10', '22990', '31', 'b7687e70b7687e70b7687e70b7687e70b7687e70');
INSERT INTO `orderitem` VALUES ('481d5d4d481d5d4d481d5d4d481d5d4d481d5d4d', '1', '3999', '17', '015bbd98015bbd98015bbd98015bbd98015bbd98');
INSERT INTO `orderitem` VALUES ('4910a72d4910a72d4910a72d4910a72d4910a72d', '1', '3999', '17', '522e0b54522e0b54522e0b54522e0b54522e0b54');
INSERT INTO `orderitem` VALUES ('4e1aafdb4e1aafdb4e1aafdb4e1aafdb4e1aafdb', '1', '1799', '12', '317dc295317dc295317dc295317dc295317dc295');
INSERT INTO `orderitem` VALUES ('4efb7e724efb7e724efb7e724efb7e724efb7e72', '1', '6688', '32', 'ecb6257eecb6257eecb6257eecb6257eecb6257e');
INSERT INTO `orderitem` VALUES ('53af041953af041953af041953af041953af0419', '10', '22990', '31', '7e6c96c27e6c96c27e6c96c27e6c96c27e6c96c2');
INSERT INTO `orderitem` VALUES ('56c7c25556c7c25556c7c25556c7c25556c7c255', '10', '22990', '31', '015bbd98015bbd98015bbd98015bbd98015bbd98');
INSERT INTO `orderitem` VALUES ('5785335c5785335c5785335c5785335c5785335c', '1', '3999', '17', 'e22aaa94e22aaa94e22aaa94e22aaa94e22aaa94');
INSERT INTO `orderitem` VALUES ('57e25ce157e25ce157e25ce157e25ce157e25ce1', '1', '2599', '10', '1151426b1151426b1151426b1151426b1151426b');
INSERT INTO `orderitem` VALUES ('5b422b315b422b315b422b315b422b315b422b31', '10', '22990', '31', 'de360e85de360e85de360e85de360e85de360e85');
INSERT INTO `orderitem` VALUES ('5b787cf35b787cf35b787cf35b787cf35b787cf3', '1', '3999', '17', '1fbe6fd61fbe6fd61fbe6fd61fbe6fd61fbe6fd6');
INSERT INTO `orderitem` VALUES ('5d481d565d481d565d481d565d481d565d481d56', '10', '22990', '31', '9d391e3a9d391e3a9d391e3a9d391e3a9d391e3a');
INSERT INTO `orderitem` VALUES ('6400253764002537640025376400253764002537', '1', '3999', '17', 'b7687e70b7687e70b7687e70b7687e70b7687e70');
INSERT INTO `orderitem` VALUES ('659875d2659875d2659875d2659875d2659875d2', '10', '22990', '31', '17b738db17b738db17b738db17b738db17b738db');
INSERT INTO `orderitem` VALUES ('71999d9c71999d9c71999d9c71999d9c71999d9c', '10', '22990', '31', '97b6821597b6821597b6821597b6821597b68215');
INSERT INTO `orderitem` VALUES ('72c273b172c273b172c273b172c273b172c273b1', '1', '3999', '17', '18d75b9618d75b9618d75b9618d75b9618d75b96');
INSERT INTO `orderitem` VALUES ('769a6a4b769a6a4b769a6a4b769a6a4b769a6a4b', '10', '22990', '31', '36bbf72b36bbf72b36bbf72b36bbf72b36bbf72b');
INSERT INTO `orderitem` VALUES ('76e7bb4176e7bb4176e7bb4176e7bb4176e7bb41', '10', '22990', '31', '9d35a6f39d35a6f39d35a6f39d35a6f39d35a6f3');
INSERT INTO `orderitem` VALUES ('78dbd94c78dbd94c78dbd94c78dbd94c78dbd94c', '1', '3999', '17', '35071df435071df435071df435071df435071df4');
INSERT INTO `orderitem` VALUES ('79adc9b579adc9b579adc9b579adc9b579adc9b5', '10', '22990', '31', '3abcf21f3abcf21f3abcf21f3abcf21f3abcf21f');
INSERT INTO `orderitem` VALUES ('7d5d805f7d5d805f7d5d805f7d5d805f7d5d805f', '1', '6688', '32', '72c2a39e72c2a39e72c2a39e72c2a39e72c2a39e');
INSERT INTO `orderitem` VALUES ('7e1f17cd7e1f17cd7e1f17cd7e1f17cd7e1f17cd', '1', '3999', '17', '7e6c96c27e6c96c27e6c96c27e6c96c27e6c96c2');
INSERT INTO `orderitem` VALUES ('7f4687967f4687967f4687967f4687967f468796', '1', '3999', '17', '4522eacd4522eacd4522eacd4522eacd4522eacd');
INSERT INTO `orderitem` VALUES ('7fd6d2057fd6d2057fd6d2057fd6d2057fd6d205', '1', '3699', '35', '3b5c9f583b5c9f583b5c9f583b5c9f583b5c9f58');
INSERT INTO `orderitem` VALUES ('80c0076980c0076980c0076980c0076980c00769', '1', '2599', '10', '21df50ea21df50ea21df50ea21df50ea21df50ea');
INSERT INTO `orderitem` VALUES ('80d8b55780d8b55780d8b55780d8b55780d8b557', '10', '22990', '31', '8f9438228f9438228f9438228f9438228f943822');
INSERT INTO `orderitem` VALUES ('8502955f8502955f8502955f8502955f8502955f', '1', '1999', '22', '3b5c9f583b5c9f583b5c9f583b5c9f583b5c9f58');
INSERT INTO `orderitem` VALUES ('8771cc8f8771cc8f8771cc8f8771cc8f8771cc8f', '2', '8998', '34', 'a30db4efa30db4efa30db4efa30db4efa30db4ef');
INSERT INTO `orderitem` VALUES ('88de28aa88de28aa88de28aa88de28aa88de28aa', '10', '22990', '31', '1c42e8861c42e8861c42e8861c42e8861c42e886');
INSERT INTO `orderitem` VALUES ('8cdee6b28cdee6b28cdee6b28cdee6b28cdee6b2', '2', '8998', '34', '9d391e3a9d391e3a9d391e3a9d391e3a9d391e3a');
INSERT INTO `orderitem` VALUES ('93a6332893a6332893a6332893a6332893a63328', '10', '22990', '31', 'b62e9edfb62e9edfb62e9edfb62e9edfb62e9edf');
INSERT INTO `orderitem` VALUES ('94cb36ba94cb36ba94cb36ba94cb36ba94cb36ba', '1', '3999', '17', '59e4cb0a59e4cb0a59e4cb0a59e4cb0a59e4cb0a');
INSERT INTO `orderitem` VALUES ('98f11c7698f11c7698f11c7698f11c7698f11c76', '1', '3999', '17', '1c42e8861c42e8861c42e8861c42e8861c42e886');
INSERT INTO `orderitem` VALUES ('9cf723db9cf723db9cf723db9cf723db9cf723db', '10', '36990', '35', '9d391e3a9d391e3a9d391e3a9d391e3a9d391e3a');
INSERT INTO `orderitem` VALUES ('9f961abc9f961abc9f961abc9f961abc9f961abc', '2', '8998', '34', 'd778d182d778d182d778d182d778d182d778d182');
INSERT INTO `orderitem` VALUES ('a2b24ecca2b24ecca2b24ecca2b24ecca2b24ecc', '10', '36990', '35', 'a30db4efa30db4efa30db4efa30db4efa30db4ef');
INSERT INTO `orderitem` VALUES ('a4131a82a4131a82a4131a82a4131a82a4131a82', '10', '22990', '31', 'a996649ba996649ba996649ba996649ba996649b');
INSERT INTO `orderitem` VALUES ('a42fccd3a42fccd3a42fccd3a42fccd3a42fccd3', '1', '3999', '17', 'a996649ba996649ba996649ba996649ba996649b');
INSERT INTO `orderitem` VALUES ('a5c1c723a5c1c723a5c1c723a5c1c723a5c1c723', '1', '3999', '17', 'de360e85de360e85de360e85de360e85de360e85');
INSERT INTO `orderitem` VALUES ('ab884795ab884795ab884795ab884795ab884795', '10', '22990', '31', 'bb2e3cd6bb2e3cd6bb2e3cd6bb2e3cd6bb2e3cd6');
INSERT INTO `orderitem` VALUES ('b0f80243b0f80243b0f80243b0f80243b0f80243', '10', '22990', '31', '391ce602391ce602391ce602391ce602391ce602');
INSERT INTO `orderitem` VALUES ('b6a91255b6a91255b6a91255b6a91255b6a91255', '10', '36990', '35', '9d35a6f39d35a6f39d35a6f39d35a6f39d35a6f3');
INSERT INTO `orderitem` VALUES ('bc4ddcbebc4ddcbebc4ddcbebc4ddcbebc4ddcbe', '10', '22990', '31', '86baf24f86baf24f86baf24f86baf24f86baf24f');
INSERT INTO `orderitem` VALUES ('bd6cad13bd6cad13bd6cad13bd6cad13bd6cad13', '1', '3999', '17', '8e2a5c568e2a5c568e2a5c568e2a5c568e2a5c56');
INSERT INTO `orderitem` VALUES ('c13d290ec13d290ec13d290ec13d290ec13d290e', '1', '3699', '35', 'bd28c29dbd28c29dbd28c29dbd28c29dbd28c29d');
INSERT INTO `orderitem` VALUES ('c214aa04c214aa04c214aa04c214aa04c214aa04', '1', '1299', '1', 'bd28c29dbd28c29dbd28c29dbd28c29dbd28c29d');
INSERT INTO `orderitem` VALUES ('c218bda8c218bda8c218bda8c218bda8c218bda8', '1', '6688', '32', 'f6cb9f62f6cb9f62f6cb9f62f6cb9f62f6cb9f62');
INSERT INTO `orderitem` VALUES ('c229136bc229136bc229136bc229136bc229136b', '1', '2599', '10', '9eb56da19eb56da19eb56da19eb56da19eb56da1');
INSERT INTO `orderitem` VALUES ('c4fbbd14c4fbbd14c4fbbd14c4fbbd14c4fbbd14', '1', '5499', '41', '317dc295317dc295317dc295317dc295317dc295');
INSERT INTO `orderitem` VALUES ('cfed16a7cfed16a7cfed16a7cfed16a7cfed16a7', '10', '22990', '31', '59e4cb0a59e4cb0a59e4cb0a59e4cb0a59e4cb0a');
INSERT INTO `orderitem` VALUES ('d3190026d3190026d3190026d3190026d3190026', '1', '3999', '17', 'a7342f71a7342f71a7342f71a7342f71a7342f71');
INSERT INTO `orderitem` VALUES ('d3dff7f1d3dff7f1d3dff7f1d3dff7f1d3dff7f1', '1', '6688', '32', '7c2295c17c2295c17c2295c17c2295c17c2295c1');
INSERT INTO `orderitem` VALUES ('d6c94371d6c94371d6c94371d6c94371d6c94371', '10', '22990', '31', 'ad25e90aad25e90aad25e90aad25e90aad25e90a');
INSERT INTO `orderitem` VALUES ('d6f0fbaad6f0fbaad6f0fbaad6f0fbaad6f0fbaa', '1', '6688', '32', '0eba9c170eba9c170eba9c170eba9c170eba9c17');
INSERT INTO `orderitem` VALUES ('da216420da216420da216420da216420da216420', '10', '22990', '31', '3b049e8f3b049e8f3b049e8f3b049e8f3b049e8f');
INSERT INTO `orderitem` VALUES ('dc7ffccfdc7ffccfdc7ffccfdc7ffccfdc7ffccf', '1', '3999', '17', 'ad25e90aad25e90aad25e90aad25e90aad25e90a');
INSERT INTO `orderitem` VALUES ('dd98ac31dd98ac31dd98ac31dd98ac31dd98ac31', '1', '6688', '32', '2e9fd0272e9fd0272e9fd0272e9fd0272e9fd027');
INSERT INTO `orderitem` VALUES ('e258d171e258d171e258d171e258d171e258d171', '1', '3999', '17', '3abcf21f3abcf21f3abcf21f3abcf21f3abcf21f');
INSERT INTO `orderitem` VALUES ('e2840742e2840742e2840742e2840742e2840742', '10', '22990', '31', '1fbe6fd61fbe6fd61fbe6fd61fbe6fd61fbe6fd6');
INSERT INTO `orderitem` VALUES ('e3a344d7e3a344d7e3a344d7e3a344d7e3a344d7', '1', '2599', '10', '3beba2593beba2593beba2593beba2593beba259');
INSERT INTO `orderitem` VALUES ('e3a5c923e3a5c923e3a5c923e3a5c923e3a5c923', '10', '22990', '31', '92e8d1ff92e8d1ff92e8d1ff92e8d1ff92e8d1ff');
INSERT INTO `orderitem` VALUES ('e8068538e8068538e8068538e8068538e8068538', '10', '22990', '31', '35071df435071df435071df435071df435071df4');
INSERT INTO `orderitem` VALUES ('e9d499f5e9d499f5e9d499f5e9d499f5e9d499f5', '1', '3999', '17', 'cb3537e8cb3537e8cb3537e8cb3537e8cb3537e8');
INSERT INTO `orderitem` VALUES ('eba0332eeba0332eeba0332eeba0332eeba0332e', '1', '3999', '17', '92e8d1ff92e8d1ff92e8d1ff92e8d1ff92e8d1ff');
INSERT INTO `orderitem` VALUES ('efedbf29efedbf29efedbf29efedbf29efedbf29', '2', '8998', '34', '9d35a6f39d35a6f39d35a6f39d35a6f39d35a6f3');
INSERT INTO `orderitem` VALUES ('f3c7e5d5f3c7e5d5f3c7e5d5f3c7e5d5f3c7e5d5', '1', '3999', '17', '8f9438228f9438228f9438228f9438228f943822');
INSERT INTO `orderitem` VALUES ('f542c621f542c621f542c621f542c621f542c621', '10', '22990', '31', '4522eacd4522eacd4522eacd4522eacd4522eacd');
INSERT INTO `orderitem` VALUES ('f674a517f674a517f674a517f674a517f674a517', '10', '22990', '31', '5c66735b5c66735b5c66735b5c66735b5c66735b');
INSERT INTO `orderitem` VALUES ('f98f3376f98f3376f98f3376f98f3376f98f3376', '10', '22990', '31', '64ef1de764ef1de764ef1de764ef1de764ef1de7');
INSERT INTO `orderitem` VALUES ('fa0542b5fa0542b5fa0542b5fa0542b5fa0542b5', '10', '22990', '31', '18d75b9618d75b9618d75b9618d75b9618d75b96');
INSERT INTO `orderitem` VALUES ('fca1682efca1682efca1682efca1682efca1682e', '10', '22990', '31', 'd778d182d778d182d778d182d778d182d778d182');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` varchar(40) NOT NULL,
  `ordertime` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `uid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('015bbd98015bbd98015bbd98015bbd98015bbd98', '2017-09-29 22:04:37', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('0eba9c170eba9c170eba9c170eba9c170eba9c17', '2017-09-29 23:21:29', '6688', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('1151426b1151426b1151426b1151426b1151426b', '2017-09-30 08:37:55', '2599', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('17b738db17b738db17b738db17b738db17b738db', '2017-09-29 22:04:38', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('18d75b9618d75b9618d75b9618d75b9618d75b96', '2017-09-29 22:04:37', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('1c42e8861c42e8861c42e8861c42e8861c42e886', '2017-09-29 22:04:28', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('1fbe6fd61fbe6fd61fbe6fd61fbe6fd61fbe6fd6', '2017-09-29 22:04:35', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('21df50ea21df50ea21df50ea21df50ea21df50ea', '2017-09-29 23:23:24', '2599', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('2e9fd0272e9fd0272e9fd0272e9fd0272e9fd027', '2017-09-29 23:12:14', '6688', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('317dc295317dc295317dc295317dc295317dc295', '2017-09-29 21:09:08', '7298', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('35071df435071df435071df435071df435071df4', '2017-09-29 22:04:29', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('36bbf72b36bbf72b36bbf72b36bbf72b36bbf72b', '2017-09-29 22:04:36', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('391ce602391ce602391ce602391ce602391ce602', '2017-09-29 22:04:32', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('3abcf21f3abcf21f3abcf21f3abcf21f3abcf21f', '2017-09-29 22:04:37', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('3b049e8f3b049e8f3b049e8f3b049e8f3b049e8f', '2017-09-29 22:04:34', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('3b5c9f583b5c9f583b5c9f583b5c9f583b5c9f58', '2017-09-27 23:44:38', '5698', '1', '金阊区闻钟苑1区14幢601', '普铭 沈', '13812630871', 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('3beba2593beba2593beba2593beba2593beba259', '2017-09-30 08:39:17', '2599', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('4522eacd4522eacd4522eacd4522eacd4522eacd', '2017-09-29 22:04:35', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('522e0b54522e0b54522e0b54522e0b54522e0b54', '2017-09-29 22:04:33', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('59e4cb0a59e4cb0a59e4cb0a59e4cb0a59e4cb0a', '2017-09-29 22:04:33', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('5c66735b5c66735b5c66735b5c66735b5c66735b', '2017-09-29 22:04:35', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('64ef1de764ef1de764ef1de764ef1de764ef1de7', '2017-09-29 22:04:34', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('72c2a39e72c2a39e72c2a39e72c2a39e72c2a39e', '2017-09-29 23:22:45', '6688', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('7c2295c17c2295c17c2295c17c2295c17c2295c1', '2017-09-29 23:10:04', '6688', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('7e6c96c27e6c96c27e6c96c27e6c96c27e6c96c2', '2017-09-29 22:04:23', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('86baf24f86baf24f86baf24f86baf24f86baf24f', '2017-09-29 22:04:37', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('8e2a5c568e2a5c568e2a5c568e2a5c568e2a5c56', '2017-09-29 22:04:31', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('8f9438228f9438228f9438228f9438228f943822', '2017-09-29 22:04:32', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('92e8d1ff92e8d1ff92e8d1ff92e8d1ff92e8d1ff', '2017-09-29 22:04:38', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('97b6821597b6821597b6821597b6821597b68215', '2017-09-29 22:04:25', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('9d35a6f39d35a6f39d35a6f39d35a6f39d35a6f3', '2017-09-29 21:56:17', '68978', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('9d391e3a9d391e3a9d391e3a9d391e3a9d391e3a', '2017-09-29 21:56:23', '68978', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('9eb56da19eb56da19eb56da19eb56da19eb56da1', '2017-09-30 08:39:14', '2599', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('a30db4efa30db4efa30db4efa30db4efa30db4ef', '2017-09-29 21:56:21', '68978', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('a7342f71a7342f71a7342f71a7342f71a7342f71', '2017-09-29 22:04:35', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('a996649ba996649ba996649ba996649ba996649b', '2017-09-29 22:04:36', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('ad25e90aad25e90aad25e90aad25e90aad25e90a', '2017-09-29 22:04:37', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('b62e9edfb62e9edfb62e9edfb62e9edfb62e9edf', '2017-09-29 22:04:33', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('b7687e70b7687e70b7687e70b7687e70b7687e70', '2017-09-29 22:04:32', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('bb2e3cd6bb2e3cd6bb2e3cd6bb2e3cd6bb2e3cd6', '2017-09-29 22:04:34', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('bd28c29dbd28c29dbd28c29dbd28c29dbd28c29d', '2017-09-29 23:01:23', '4998', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('c02b34bac02b34bac02b34bac02b34bac02b34ba', '2017-09-29 22:04:36', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('cb3537e8cb3537e8cb3537e8cb3537e8cb3537e8', '2017-09-29 22:04:34', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('d778d182d778d182d778d182d778d182d778d182', '2017-09-29 21:56:09', '31988', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('de360e85de360e85de360e85de360e85de360e85', '2017-09-29 22:04:35', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('e22aaa94e22aaa94e22aaa94e22aaa94e22aaa94', '2017-09-29 22:04:36', '26989', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('ecb6257eecb6257eecb6257eecb6257eecb6257e', '2017-09-29 23:22:25', '6688', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('f6cb9f62f6cb9f62f6cb9f62f6cb9f62f6cb9f62', '2017-09-29 23:21:31', '6688', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');
INSERT INTO `orders` VALUES ('f8b6357cf8b6357cf8b6357cf8b6357cf8b6357c', '2017-09-29 23:12:15', '6688', '0', null, null, null, 'ac95e004ac95e004ac95e004ac95e004ac95e004');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(40) NOT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `pimage` varchar(200) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `pflag` int(11) DEFAULT NULL,
  `cid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `sfk_0001` (`cid`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '小米 4c 标准版', '1399', '1299', 'products/1/c_0001.jpg', '2015-11-02', '1', '小米 4c 标准版 全网通 白色 移动联通电信4G手机 双卡双待', '0', '1');
INSERT INTO `product` VALUES ('10', '华为 Ascend Mate7', '2699', '2599', 'products/1/c_0010.jpg', '2015-11-02', '1', '华为 Ascend Mate7 月光银 移动4G手机 双卡双待双通6英寸高清大屏，纤薄机身，智能超八核，按压式指纹识别！!选择下方“移动老用户4G飞享合约”，无需换号，还有话费每月返还！', '0', '1');
INSERT INTO `product` VALUES ('11', 'vivo X5Pro', '2399', '2298', 'products/1/c_0014.jpg', '2015-11-02', '1', '移动联通双4G手机 3G运存版 极光白【购机送蓝牙耳机+蓝牙自拍杆】新升级3G运行内存·双2.5D弧面玻璃·眼球识别技术', '0', '1');
INSERT INTO `product` VALUES ('12', '努比亚（nubia）My 布拉格', '1899', '1799', 'products/1/c_0013.jpg', '2015-11-02', '0', '努比亚（nubia）My 布拉格 银白 移动联通4G手机 双卡双待【嗨11，下单立减100】金属机身，快速充电！布拉格相机全新体验！', '0', '1');
INSERT INTO `product` VALUES ('13', '华为 麦芒4', '2599', '2499', 'products/1/c_0012.jpg', '2015-11-02', '1', '华为 麦芒4 晨曦金 全网通版4G手机 双卡双待金属机身 2.5D弧面屏 指纹解锁 光学防抖', '0', '1');
INSERT INTO `product` VALUES ('14', 'vivo X5M', '1899', '1799', 'products/1/c_0011.jpg', '2015-11-02', '0', 'vivo X5M 移动4G手机 双卡双待 香槟金【购机送蓝牙耳机+蓝牙自拍杆】5.0英寸大屏显示·八核双卡双待·Hi-Fi移动KTV', '0', '1');
INSERT INTO `product` VALUES ('15', 'Apple iPhone 6 (A1586)', '4399', '4288', 'products/1/c_0015.jpg', '2015-11-02', '1', 'Apple iPhone 6 (A1586) 16GB 金色 移动联通电信4G手机长期省才是真的省！点击购机送费版，月月送话费，月月享优惠，畅享4G网络，就在联通4G！', '0', '1');
INSERT INTO `product` VALUES ('16', '华为 HUAWEI Mate S 臻享版', '4200', '4087', 'products/1/c_0016.jpg', '2015-11-03', '0', '华为 HUAWEI Mate S 臻享版 手机 极昼金 移动联通双4G(高配)满星评价即返30元话费啦；买就送电源+清水套+创意手机支架；优雅弧屏，mate7升级版', '0', '1');
INSERT INTO `product` VALUES ('17', '索尼(SONY) E6533 Z3+', '4099', '3999', 'products/1/c_0017.jpg', '2015-11-02', '0', '索尼(SONY) E6533 Z3+ 双卡双4G手机 防水防尘 涧湖绿索尼z3专业防水 2070万像素 移动联通双4G', '0', '1');
INSERT INTO `product` VALUES ('18', 'HTC One M9+', '3599', '3499', 'products/1/c_0018.jpg', '2015-11-02', '0', 'HTC One M9+（M9pw） 金银汇 移动联通双4G手机5.2英寸，8核CPU，指纹识别，UltraPixel超像素前置相机+2000万/200万后置双镜头相机！降价特卖，惊喜不断！', '0', '1');
INSERT INTO `product` VALUES ('19', 'HTC Desire 826d 32G 臻珠白', '1599', '1469', 'products/1/c_0020.jpg', '2015-11-02', '1', '后置1300万+UltraPixel超像素前置摄像头+【双】前置扬声器+5.5英寸【1080p】大屏！', '0', '1');
INSERT INTO `product` VALUES ('1b2c140e1b2c140e1b2c140e1b2c140e1b2c140e', '奶粉', '0', '999', 'products/1dd41c8b1dd41c8b1dd41c8b1dd41c8b1dd41c8b_20171003180046_53003270_p0.jpg', '2017-10-03', '1', '奶粉奶粉奶粉奶粉奶粉', '0', '6');
INSERT INTO `product` VALUES ('2', '中兴 AXON', '2899', '2699', 'products/1/c_0002.jpg', '2015-11-05', '1', '中兴 AXON 天机 mini 压力屏版 B2015 华尔金 移动联通电信4G 双卡双待', '0', '1');
INSERT INTO `product` VALUES ('20', '小米 红米2A 增强版 白色', '649', '549', 'products/1/c_0019.jpg', '2015-11-02', '0', '新增至2GB 内存+16GB容量！4G双卡双待，联芯 4 核 1.5GHz 处理器！', '0', '1');
INSERT INTO `product` VALUES ('21', '魅族 魅蓝note2 16GB 白色', '1099', '999', 'products/1/c_0021.jpg', '2015-11-02', '0', '现货速抢，抢完即止！5.5英寸1080P分辨率屏幕，64位八核1.3GHz处理器，1300万像素摄像头，双色温双闪光灯！', '0', '1');
INSERT INTO `product` VALUES ('22', '三星 Galaxy S5 (G9008W) 闪耀白', '2099', '1999', 'products/1/c_0022.jpg', '2015-11-02', '1', '5.1英寸全高清炫丽屏，2.5GHz四核处理器，1600万像素', '0', '1');
INSERT INTO `product` VALUES ('23', 'sonim XP7700 4G手机', '1799', '1699', 'products/1/c_0023.jpg', '2015-11-09', '1', '三防智能手机 移动/联通双4G 安全 黑黄色 双4G美国军工IP69 30天长待机 3米防水防摔 北斗', '0', '1');
INSERT INTO `product` VALUES ('24', '努比亚（nubia）Z9精英版 金色', '3988', '3888', 'products/1/c_0024.jpg', '2015-11-02', '1', '移动联通电信4G手机 双卡双待真正的无边框！金色尊贵版！4GB+64GB大内存！', '0', '1');
INSERT INTO `product` VALUES ('25', 'Apple iPhone 6 Plus (A1524) 16GB 金色', '5188', '4988', 'products/1/c_0025.jpg', '2015-11-02', '0', 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机 硬货 硬实力', '0', '1');
INSERT INTO `product` VALUES ('26', 'Apple iPhone 6s (A1700) 64G 玫瑰金色', '6388', '6088', 'products/1/c_0026.jpg', '2015-11-02', '0', 'Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机 硬货 硬实力', '0', '1');
INSERT INTO `product` VALUES ('27', '三星 Galaxy Note5（N9200）32G版', '5588', '5388', 'products/1/c_0027.jpg', '2015-11-02', '0', '旗舰机型！5.7英寸大屏，4+32G内存！不一样的SPen更优化的浮窗指令！赠无线充电板！', '0', '1');
INSERT INTO `product` VALUES ('28', '三星 Galaxy S6 Edge+（G9280）32G版 铂光金', '5999', '5888', 'products/1/c_0028.jpg', '2015-11-02', '0', '赠移动电源+自拍杆+三星OTG金属U盘+无线充电器+透明保护壳', '0', '1');
INSERT INTO `product` VALUES ('29', 'LG G4（H818）陶瓷白 国际版', '3018', '2978', 'products/1/c_0029.jpg', '2015-11-02', '0', '李敏镐代言，F1.8大光圈1600万后置摄像头，5.5英寸2K屏，3G+32G内存，LG年度旗舰机！', '0', '1');
INSERT INTO `product` VALUES ('3', '华为荣耀6', '1599', '1499', 'products/1/c_0003.jpg', '2015-11-02', '0', '荣耀 6 (H60-L01) 3GB内存标准版 黑色 移动4G手机', '0', '1');
INSERT INTO `product` VALUES ('30', '微软(Microsoft) Lumia 640 LTE DS (RM-1113)', '1099', '999', 'products/1/c_0030.jpg', '2015-11-02', '0', '微软首款双网双卡双4G手机，5.0英寸高清大屏，双网双卡双4G！', '0', '1');
INSERT INTO `product` VALUES ('31', '宏碁（acer）ATC705-N50 台式电脑', '2399', '2299', 'products/1/c_0031.jpg', '2015-11-02', '0', '爆款直降，满千减百，品质宏碁，特惠来袭，何必苦等11.11，早买早便宜！', '0', '2');
INSERT INTO `product` VALUES ('32', 'Apple MacBook Air MJVE2CH/A 13.3英寸', '6788', '6688', 'products/1/c_0032.jpg', '2015-11-02', '0', '宽屏笔记本电脑 128GB 闪存', '0', '2');
INSERT INTO `product` VALUES ('33', '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)', '4399', '4199', 'products/1/c_0033.jpg', '2015-11-02', '0', '联想（ThinkPad） 轻薄系列E450C(20EH0001CD)14英寸笔记本电脑(i5-4210U 4G 500G 2G独显 Win8.1)', '0', '2');
INSERT INTO `product` VALUES ('34', '联想（Lenovo）小新V3000经典版', '4599', '4499', 'products/1/c_0034.jpg', '2015-11-02', '0', '14英寸超薄笔记本电脑（i7-5500U 4G 500G+8G SSHD 2G独显 全高清屏）黑色满1000減100，狂减！火力全开，横扫3天！', '0', '2');
INSERT INTO `product` VALUES ('35', '华硕（ASUS）经典系列R557LI', '3799', '3699', 'products/1/c_0035.jpg', '2015-11-02', '0', '15.6英寸笔记本电脑（i5-5200U 4G 7200转500G 2G独显 D刻 蓝牙 Win8.1 黑色）', '0', '2');
INSERT INTO `product` VALUES ('36', '华硕（ASUS）X450J', '4599', '4399', 'products/1/c_0036.jpg', '2015-11-02', '0', '14英寸笔记本电脑 （i5-4200H 4G 1TB GT940M 2G独显 蓝牙4.0 D刻 Win8.1 黑色）', '0', '2');
INSERT INTO `product` VALUES ('37', '戴尔（DELL）灵越 飞匣3000系列', '3399', '3299', 'products/1/c_0037.jpg', '2015-11-03', '0', ' Ins14C-4528B 14英寸笔记本（i5-5200U 4G 500G GT820M 2G独显 Win8）黑', '0', '2');
INSERT INTO `product` VALUES ('38', '惠普(HP)WASD 暗影精灵', '5699', '5499', 'products/1/c_0038.jpg', '2015-11-02', '0', '15.6英寸游戏笔记本电脑(i5-6300HQ 4G 1TB+128G SSD GTX950M 4G独显 Win10)', '0', '2');
INSERT INTO `product` VALUES ('39', 'Apple 配备 Retina 显示屏的 MacBook', '11299', '10288', 'products/1/c_0039.jpg', '2015-11-02', '0', 'Pro MF840CH/A 13.3英寸宽屏笔记本电脑 256GB 闪存', '0', '2');
INSERT INTO `product` VALUES ('4', '联想 P1', '2199', '1999', 'products/1/c_0004.jpg', '2015-11-02', '0', '联想 P1 16G 伯爵金 移动联通4G手机充电5分钟，通话3小时！科技源于超越！品质源于沉淀！5000mAh大电池！高端商务佳配！', '0', '1');
INSERT INTO `product` VALUES ('40', '机械革命（MECHREVO）MR X6S-M', '6799', '6599', 'products/1/c_0040.jpg', '2015-11-02', '0', '15.6英寸游戏本(I7-4710MQ 8G 64GSSD+1T GTX960M 2G独显 IPS屏 WIN7)黑色', '0', '2');
INSERT INTO `product` VALUES ('41', '神舟（HASEE） 战神K660D-i7D2', '5699', '5499', 'products/1/c_0041.jpg', '2015-11-02', '0', '15.6英寸游戏本(i7-4710MQ 8G 1TB GTX960M 2G独显 1080P)黑色', '0', '2');
INSERT INTO `product` VALUES ('42', '微星（MSI）GE62 2QC-264XCN', '6199', '5999', 'products/1/c_0042.jpg', '2015-11-02', '0', '15.6英寸游戏笔记本电脑（i5-4210H 8G 1T GTX960MG DDR5 2G 背光键盘）黑色', '0', '2');
INSERT INTO `product` VALUES ('43', '雷神（ThundeRobot）G150S', '5699', '5499', 'products/1/c_0043.jpg', '2015-11-02', '0', '15.6英寸游戏本 ( i7-4710MQ 4G 500G GTX950M 2G独显 包无亮点全高清屏) 金', '0', '2');
INSERT INTO `product` VALUES ('44', '惠普（HP）轻薄系列 HP', '3199', '3099', 'products/1/c_0044.jpg', '2015-11-02', '0', '15-r239TX 15.6英寸笔记本电脑（i5-5200U 4G 500G GT820M 2G独显 win8.1）金属灰', '0', '2');
INSERT INTO `product` VALUES ('45', '未来人类（Terrans Force）T5', '10999', '9899', 'products/1/c_0045.jpg', '2015-11-02', '0', '15.6英寸游戏本（i7-5700HQ 16G 120G固态+1TB GTX970M 3G GDDR5独显）黑', '0', '2');
INSERT INTO `product` VALUES ('46', '戴尔（DELL）Vostro 3800-R6308 台式电脑', '3299', '3199', 'products/1/c_0046.jpg', '2015-11-02', '0', '（i3-4170 4G 500G DVD 三年上门服务 Win7）黑', '0', '2');
INSERT INTO `product` VALUES ('47', '联想（Lenovo）H3050 台式电脑', '5099', '4899', 'products/1/c_0047.jpg', '2015-11-11', '0', '（i5-4460 4G 500G GT720 1G独显 DVD 千兆网卡 Win10）23英寸', '0', '2');
INSERT INTO `product` VALUES ('48', 'Apple iPad mini 2 ME279CH/A', '2088', '1888', 'products/1/c_0048.jpg', '2015-11-02', '0', '（配备 Retina 显示屏 7.9英寸 16G WLAN 机型 银色）', '0', '2');
INSERT INTO `product` VALUES ('49', '小米（MI）7.9英寸平板', '1399', '1299', 'products/1/c_0049.jpg', '2015-11-02', '0', 'WIFI 64GB（NVIDIA Tegra K1 2.2GHz 2G 64G 2048*1536视网膜屏 800W）白色', '0', '2');
INSERT INTO `product` VALUES ('5', '摩托罗拉 moto x（x+1）', '1799', '1699', 'products/1/c_0005.jpg', '2015-11-01', '0', '摩托罗拉 moto x（x+1）(XT1085) 32GB 天然竹 全网通4G手机11月11天！MOTO X震撼特惠来袭！1699元！带你玩转黑科技！天然材质，原生流畅系统！', '0', '1');
INSERT INTO `product` VALUES ('50', 'Apple iPad Air 2 MGLW2CH/A', '2399', '2299', 'products/1/c_0050.jpg', '2015-11-12', '0', '（9.7英寸 16G WLAN 机型 银色）', '0', '2');
INSERT INTO `product` VALUES ('6', '魅族 MX5 16GB 银黑色', '1899', '1799', 'products/1/c_0006.jpg', '2015-11-02', '0', '魅族 MX5 16GB 银黑色 移动联通双4G手机 双卡双待送原厂钢化膜+保护壳+耳机！5.5英寸大屏幕，3G运行内存，2070万+500万像素摄像头！长期省才是真的省！', '0', '1');
INSERT INTO `product` VALUES ('7', '三星 Galaxy On7', '1499', '1398', 'products/1/c_0007.jpg', '2015-11-14', '0', '三星 Galaxy On7（G6000）昂小七 金色 全网通4G手机 双卡双待新品火爆抢购中！京东尊享千元良机！5.5英寸高清大屏！1300+500W像素！评价赢30元话费券！', '0', '1');
INSERT INTO `product` VALUES ('8', 'NUU NU5', '1288', '1190', 'products/1/c_0008.jpg', '2015-11-02', '0', 'NUU NU5 16GB 移动联通双4G智能手机 双卡双待 晒单有礼 晨光金香港品牌 2.5D弧度前后钢化玻璃 随机附赠手机套+钢化贴膜 晒单送移动电源+蓝牙耳机', '0', '1');
INSERT INTO `product` VALUES ('8805118188051181880511818805118188051181', '户外运动', '11', '111', 'products/f896fe20f896fe20f896fe20f896fe20f896fe20_20171003161855_64138434_p0.jpg', '2017-10-03', '1', '123', '0', '8');
INSERT INTO `product` VALUES ('9', '乐视（Letv）乐1pro（X800）', '2399', '2299', 'products/1/c_0009.jpg', '2015-11-02', '0', '乐视（Letv）乐1pro（X800）64GB 金色 移动联通4G手机 双卡双待乐视生态UI+5.5英寸2K屏+高通8核处理器+4GB运行内存+64GB存储+1300万摄像头！', '0', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(40) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', 'admin', null, null, null, null, '1', null);
INSERT INTO `user` VALUES ('ac95e004ac95e004ac95e004ac95e004ac95e004', '2015011110', '81dc9bdb52d04dc20036dbd8313ed055', '沈', '714772696@qq.com', null, '1970-01-01', 'male', '1', '87d3105d87d3105d87d3105d87d3105d87d3105d');