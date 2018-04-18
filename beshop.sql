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
INSERT INTO `category` VALUES ('1', '�ֻ�����');
INSERT INTO `category` VALUES ('2', '���԰칫');
INSERT INTO `category` VALUES ('3', '�Ҿ߼Ҿ�');
INSERT INTO `category` VALUES ('4', 'Ьѥ���');
INSERT INTO `category` VALUES ('5', 'ͼ������');
INSERT INTO `category` VALUES ('6', 'ĸӤ��Ӥ');
INSERT INTO `category` VALUES ('7', '������Ʒ');
INSERT INTO `category` VALUES ('8', '�����˶�');

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
INSERT INTO `orders` VALUES ('3b5c9f583b5c9f583b5c9f583b5c9f583b5c9f58', '2017-09-27 23:44:38', '5698', '1', '����������Է1��14��601', '���� ��', '13812630871', 'ac95e004ac95e004ac95e004ac95e004ac95e004');
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
INSERT INTO `product` VALUES ('1', 'С�� 4c ��׼��', '1399', '1299', 'products/1/c_0001.jpg', '2015-11-02', '1', 'С�� 4c ��׼�� ȫ��ͨ ��ɫ �ƶ���ͨ����4G�ֻ� ˫��˫��', '0', '1');
INSERT INTO `product` VALUES ('10', '��Ϊ Ascend Mate7', '2699', '2599', 'products/1/c_0010.jpg', '2015-11-02', '1', '��Ϊ Ascend Mate7 �¹��� �ƶ�4G�ֻ� ˫��˫��˫ͨ6Ӣ�����������˱��������ܳ��˺ˣ���ѹʽָ��ʶ��!ѡ���·����ƶ����û�4G�����Լ�������軻�ţ����л���ÿ�·�����', '0', '1');
INSERT INTO `product` VALUES ('11', 'vivo X5Pro', '2399', '2298', 'products/1/c_0014.jpg', '2015-11-02', '1', '�ƶ���ͨ˫4G�ֻ� 3G�˴�� ����ס���������������+�������ĸˡ�������3G�����ڴ桤˫2.5D���沣��������ʶ����', '0', '1');
INSERT INTO `product` VALUES ('12', 'Ŭ���ǣ�nubia��My ������', '1899', '1799', 'products/1/c_0013.jpg', '2015-11-02', '0', 'Ŭ���ǣ�nubia��My ������ ���� �ƶ���ͨ4G�ֻ� ˫��˫������11���µ�����100�������������ٳ�磡���������ȫ�����飡', '0', '1');
INSERT INTO `product` VALUES ('13', '��Ϊ ��â4', '2599', '2499', 'products/1/c_0012.jpg', '2015-11-02', '1', '��Ϊ ��â4 ���ؽ� ȫ��ͨ��4G�ֻ� ˫��˫���������� 2.5D������ ָ�ƽ��� ��ѧ����', '0', '1');
INSERT INTO `product` VALUES ('14', 'vivo X5M', '1899', '1799', 'products/1/c_0011.jpg', '2015-11-02', '0', 'vivo X5M �ƶ�4G�ֻ� ˫��˫�� ���Ľ𡾹�������������+�������ĸˡ�5.0Ӣ�������ʾ���˺�˫��˫����Hi-Fi�ƶ�KTV', '0', '1');
INSERT INTO `product` VALUES ('15', 'Apple iPhone 6 (A1586)', '4399', '4288', 'products/1/c_0015.jpg', '2015-11-02', '1', 'Apple iPhone 6 (A1586) 16GB ��ɫ �ƶ���ͨ����4G�ֻ�����ʡ�������ʡ����������ͷѰ棬�����ͻ��ѣ��������Żݣ�����4G���磬������ͨ4G��', '0', '1');
INSERT INTO `product` VALUES ('16', '��Ϊ HUAWEI Mate S �����', '4200', '4087', 'products/1/c_0016.jpg', '2015-11-03', '0', '��Ϊ HUAWEI Mate S ����� �ֻ� ����� �ƶ���ͨ˫4G(����)�������ۼ���30Ԫ������������͵�Դ+��ˮ��+�����ֻ�֧�ܣ����Ż�����mate7������', '0', '1');
INSERT INTO `product` VALUES ('17', '����(SONY) E6533 Z3+', '4099', '3999', 'products/1/c_0017.jpg', '2015-11-02', '0', '����(SONY) E6533 Z3+ ˫��˫4G�ֻ� ��ˮ���� ����������z3רҵ��ˮ 2070������ �ƶ���ͨ˫4G', '0', '1');
INSERT INTO `product` VALUES ('18', 'HTC One M9+', '3599', '3499', 'products/1/c_0018.jpg', '2015-11-02', '0', 'HTC One M9+��M9pw�� ������ �ƶ���ͨ˫4G�ֻ�5.2Ӣ�磬8��CPU��ָ��ʶ��UltraPixel������ǰ�����+2000��/200�����˫��ͷ�����������������ϲ���ϣ�', '0', '1');
INSERT INTO `product` VALUES ('19', 'HTC Desire 826d 32G �����', '1599', '1469', 'products/1/c_0020.jpg', '2015-11-02', '1', '����1300��+UltraPixel������ǰ������ͷ+��˫��ǰ��������+5.5Ӣ�硾1080p��������', '0', '1');
INSERT INTO `product` VALUES ('1b2c140e1b2c140e1b2c140e1b2c140e1b2c140e', '�̷�', '0', '999', 'products/1dd41c8b1dd41c8b1dd41c8b1dd41c8b1dd41c8b_20171003180046_53003270_p0.jpg', '2017-10-03', '1', '�̷��̷��̷��̷��̷�', '0', '6');
INSERT INTO `product` VALUES ('2', '���� AXON', '2899', '2699', 'products/1/c_0002.jpg', '2015-11-05', '1', '���� AXON ��� mini ѹ������ B2015 ������ �ƶ���ͨ����4G ˫��˫��', '0', '1');
INSERT INTO `product` VALUES ('20', 'С�� ����2A ��ǿ�� ��ɫ', '649', '549', 'products/1/c_0019.jpg', '2015-11-02', '0', '������2GB �ڴ�+16GB������4G˫��˫������о 4 �� 1.5GHz ��������', '0', '1');
INSERT INTO `product` VALUES ('21', '���� ����note2 16GB ��ɫ', '1099', '999', 'products/1/c_0021.jpg', '2015-11-02', '0', '�ֻ����������꼴ֹ��5.5Ӣ��1080P�ֱ�����Ļ��64λ�˺�1.3GHz��������1300����������ͷ��˫ɫ��˫����ƣ�', '0', '1');
INSERT INTO `product` VALUES ('22', '���� Galaxy S5 (G9008W) ��ҫ��', '2099', '1999', 'products/1/c_0022.jpg', '2015-11-02', '1', '5.1Ӣ��ȫ������������2.5GHz�ĺ˴�������1600������', '0', '1');
INSERT INTO `product` VALUES ('23', 'sonim XP7700 4G�ֻ�', '1799', '1699', 'products/1/c_0023.jpg', '2015-11-09', '1', '���������ֻ� �ƶ�/��ͨ˫4G ��ȫ �ڻ�ɫ ˫4G��������IP69 30�쳤���� 3�׷�ˮ��ˤ ����', '0', '1');
INSERT INTO `product` VALUES ('24', 'Ŭ���ǣ�nubia��Z9��Ӣ�� ��ɫ', '3988', '3888', 'products/1/c_0024.jpg', '2015-11-02', '1', '�ƶ���ͨ����4G�ֻ� ˫��˫���������ޱ߿򣡽�ɫ���棡4GB+64GB���ڴ棡', '0', '1');
INSERT INTO `product` VALUES ('25', 'Apple iPhone 6 Plus (A1524) 16GB ��ɫ', '5188', '4988', 'products/1/c_0025.jpg', '2015-11-02', '0', 'Apple iPhone 6 Plus (A1524) 16GB ��ɫ �ƶ���ͨ����4G�ֻ� Ӳ�� Ӳʵ��', '0', '1');
INSERT INTO `product` VALUES ('26', 'Apple iPhone 6s (A1700) 64G õ���ɫ', '6388', '6088', 'products/1/c_0026.jpg', '2015-11-02', '0', 'Apple iPhone 6 Plus (A1524) 16GB ��ɫ �ƶ���ͨ����4G�ֻ� Ӳ�� Ӳʵ��', '0', '1');
INSERT INTO `product` VALUES ('27', '���� Galaxy Note5��N9200��32G��', '5588', '5388', 'products/1/c_0027.jpg', '2015-11-02', '0', '�콢���ͣ�5.7Ӣ�������4+32G�ڴ棡��һ����SPen���Ż��ĸ���ָ������߳��壡', '0', '1');
INSERT INTO `product` VALUES ('28', '���� Galaxy S6 Edge+��G9280��32G�� �����', '5999', '5888', 'products/1/c_0028.jpg', '2015-11-02', '0', '���ƶ���Դ+���ĸ�+����OTG����U��+���߳����+͸��������', '0', '1');
INSERT INTO `product` VALUES ('29', 'LG G4��H818���մɰ� ���ʰ�', '3018', '2978', 'products/1/c_0029.jpg', '2015-11-02', '0', '��������ԣ�F1.8���Ȧ1600���������ͷ��5.5Ӣ��2K����3G+32G�ڴ棬LG����콢����', '0', '1');
INSERT INTO `product` VALUES ('3', '��Ϊ��ҫ6', '1599', '1499', 'products/1/c_0003.jpg', '2015-11-02', '0', '��ҫ 6 (H60-L01) 3GB�ڴ��׼�� ��ɫ �ƶ�4G�ֻ�', '0', '1');
INSERT INTO `product` VALUES ('30', '΢��(Microsoft) Lumia 640 LTE DS (RM-1113)', '1099', '999', 'products/1/c_0030.jpg', '2015-11-02', '0', '΢���׿�˫��˫��˫4G�ֻ���5.0Ӣ����������˫��˫��˫4G��', '0', '1');
INSERT INTO `product` VALUES ('31', '�곞��acer��ATC705-N50 ̨ʽ����', '2399', '2299', 'products/1/c_0031.jpg', '2015-11-02', '0', '����ֱ������ǧ���٣�Ʒ�ʺ곞���ػ���Ϯ���αؿ��11.11����������ˣ�', '0', '2');
INSERT INTO `product` VALUES ('32', 'Apple MacBook Air MJVE2CH/A 13.3Ӣ��', '6788', '6688', 'products/1/c_0032.jpg', '2015-11-02', '0', '�����ʼǱ����� 128GB ����', '0', '2');
INSERT INTO `product` VALUES ('33', '���루ThinkPad�� �ᱡϵ��E450C(20EH0001CD)', '4399', '4199', 'products/1/c_0033.jpg', '2015-11-02', '0', '���루ThinkPad�� �ᱡϵ��E450C(20EH0001CD)14Ӣ��ʼǱ�����(i5-4210U 4G 500G 2G���� Win8.1)', '0', '2');
INSERT INTO `product` VALUES ('34', '���루Lenovo��С��V3000�����', '4599', '4499', 'products/1/c_0034.jpg', '2015-11-02', '0', '14Ӣ�糬���ʼǱ����ԣ�i7-5500U 4G 500G+8G SSHD 2G���� ȫ����������ɫ��1000�p100�����������ȫ������ɨ3�죡', '0', '2');
INSERT INTO `product` VALUES ('35', '��˶��ASUS������ϵ��R557LI', '3799', '3699', 'products/1/c_0035.jpg', '2015-11-02', '0', '15.6Ӣ��ʼǱ����ԣ�i5-5200U 4G 7200ת500G 2G���� D�� ���� Win8.1 ��ɫ��', '0', '2');
INSERT INTO `product` VALUES ('36', '��˶��ASUS��X450J', '4599', '4399', 'products/1/c_0036.jpg', '2015-11-02', '0', '14Ӣ��ʼǱ����� ��i5-4200H 4G 1TB GT940M 2G���� ����4.0 D�� Win8.1 ��ɫ��', '0', '2');
INSERT INTO `product` VALUES ('37', '������DELL����Խ ��ϻ3000ϵ��', '3399', '3299', 'products/1/c_0037.jpg', '2015-11-03', '0', ' Ins14C-4528B 14Ӣ��ʼǱ���i5-5200U 4G 500G GT820M 2G���� Win8����', '0', '2');
INSERT INTO `product` VALUES ('38', '����(HP)WASD ��Ӱ����', '5699', '5499', 'products/1/c_0038.jpg', '2015-11-02', '0', '15.6Ӣ����Ϸ�ʼǱ�����(i5-6300HQ 4G 1TB+128G SSD GTX950M 4G���� Win10)', '0', '2');
INSERT INTO `product` VALUES ('39', 'Apple �䱸 Retina ��ʾ���� MacBook', '11299', '10288', 'products/1/c_0039.jpg', '2015-11-02', '0', 'Pro MF840CH/A 13.3Ӣ������ʼǱ����� 256GB ����', '0', '2');
INSERT INTO `product` VALUES ('4', '���� P1', '2199', '1999', 'products/1/c_0004.jpg', '2015-11-02', '0', '���� P1 16G ������ �ƶ���ͨ4G�ֻ����5���ӣ�ͨ��3Сʱ���Ƽ�Դ�ڳ�Խ��Ʒ��Դ�ڳ���5000mAh���أ��߶�������䣡', '0', '1');
INSERT INTO `product` VALUES ('40', '��е������MECHREVO��MR X6S-M', '6799', '6599', 'products/1/c_0040.jpg', '2015-11-02', '0', '15.6Ӣ����Ϸ��(I7-4710MQ 8G 64GSSD+1T GTX960M 2G���� IPS�� WIN7)��ɫ', '0', '2');
INSERT INTO `product` VALUES ('41', '���ۣ�HASEE�� ս��K660D-i7D2', '5699', '5499', 'products/1/c_0041.jpg', '2015-11-02', '0', '15.6Ӣ����Ϸ��(i7-4710MQ 8G 1TB GTX960M 2G���� 1080P)��ɫ', '0', '2');
INSERT INTO `product` VALUES ('42', '΢�ǣ�MSI��GE62 2QC-264XCN', '6199', '5999', 'products/1/c_0042.jpg', '2015-11-02', '0', '15.6Ӣ����Ϸ�ʼǱ����ԣ�i5-4210H 8G 1T GTX960MG DDR5 2G ������̣���ɫ', '0', '2');
INSERT INTO `product` VALUES ('43', '����ThundeRobot��G150S', '5699', '5499', 'products/1/c_0043.jpg', '2015-11-02', '0', '15.6Ӣ����Ϸ�� ( i7-4710MQ 4G 500G GTX950M 2G���� ��������ȫ������) ��', '0', '2');
INSERT INTO `product` VALUES ('44', '���գ�HP���ᱡϵ�� HP', '3199', '3099', 'products/1/c_0044.jpg', '2015-11-02', '0', '15-r239TX 15.6Ӣ��ʼǱ����ԣ�i5-5200U 4G 500G GT820M 2G���� win8.1��������', '0', '2');
INSERT INTO `product` VALUES ('45', 'δ�����ࣨTerrans Force��T5', '10999', '9899', 'products/1/c_0045.jpg', '2015-11-02', '0', '15.6Ӣ����Ϸ����i7-5700HQ 16G 120G��̬+1TB GTX970M 3G GDDR5���ԣ���', '0', '2');
INSERT INTO `product` VALUES ('46', '������DELL��Vostro 3800-R6308 ̨ʽ����', '3299', '3199', 'products/1/c_0046.jpg', '2015-11-02', '0', '��i3-4170 4G 500G DVD �������ŷ��� Win7����', '0', '2');
INSERT INTO `product` VALUES ('47', '���루Lenovo��H3050 ̨ʽ����', '5099', '4899', 'products/1/c_0047.jpg', '2015-11-11', '0', '��i5-4460 4G 500G GT720 1G���� DVD ǧ������ Win10��23Ӣ��', '0', '2');
INSERT INTO `product` VALUES ('48', 'Apple iPad mini 2 ME279CH/A', '2088', '1888', 'products/1/c_0048.jpg', '2015-11-02', '0', '���䱸 Retina ��ʾ�� 7.9Ӣ�� 16G WLAN ���� ��ɫ��', '0', '2');
INSERT INTO `product` VALUES ('49', 'С�ף�MI��7.9Ӣ��ƽ��', '1399', '1299', 'products/1/c_0049.jpg', '2015-11-02', '0', 'WIFI 64GB��NVIDIA Tegra K1 2.2GHz 2G 64G 2048*1536����Ĥ�� 800W����ɫ', '0', '2');
INSERT INTO `product` VALUES ('5', 'Ħ������ moto x��x+1��', '1799', '1699', 'products/1/c_0005.jpg', '2015-11-01', '0', 'Ħ������ moto x��x+1��(XT1085) 32GB ��Ȼ�� ȫ��ͨ4G�ֻ�11��11�죡MOTO X���ػ���Ϯ��1699Ԫ��������ת�ڿƼ�����Ȼ���ʣ�ԭ������ϵͳ��', '0', '1');
INSERT INTO `product` VALUES ('50', 'Apple iPad Air 2 MGLW2CH/A', '2399', '2299', 'products/1/c_0050.jpg', '2015-11-12', '0', '��9.7Ӣ�� 16G WLAN ���� ��ɫ��', '0', '2');
INSERT INTO `product` VALUES ('6', '���� MX5 16GB ����ɫ', '1899', '1799', 'products/1/c_0006.jpg', '2015-11-02', '0', '���� MX5 16GB ����ɫ �ƶ���ͨ˫4G�ֻ� ˫��˫����ԭ���ֻ�Ĥ+������+������5.5Ӣ�����Ļ��3G�����ڴ棬2070��+500����������ͷ������ʡ�������ʡ��', '0', '1');
INSERT INTO `product` VALUES ('7', '���� Galaxy On7', '1499', '1398', 'products/1/c_0007.jpg', '2015-11-14', '0', '���� Galaxy On7��G6000����С�� ��ɫ ȫ��ͨ4G�ֻ� ˫��˫����Ʒ�������У���������ǧԪ������5.5Ӣ����������1300+500W���أ�����Ӯ30Ԫ����ȯ��', '0', '1');
INSERT INTO `product` VALUES ('8', 'NUU NU5', '1288', '1190', 'products/1/c_0008.jpg', '2015-11-02', '0', 'NUU NU5 16GB �ƶ���ͨ˫4G�����ֻ� ˫��˫�� ɹ������ ��������Ʒ�� 2.5D����ǰ��ֻ����� ��������ֻ���+�ֻ���Ĥ ɹ�����ƶ���Դ+��������', '0', '1');
INSERT INTO `product` VALUES ('8805118188051181880511818805118188051181', '�����˶�', '11', '111', 'products/f896fe20f896fe20f896fe20f896fe20f896fe20_20171003161855_64138434_p0.jpg', '2017-10-03', '1', '123', '0', '8');
INSERT INTO `product` VALUES ('9', '���ӣ�Letv����1pro��X800��', '2399', '2299', 'products/1/c_0009.jpg', '2015-11-02', '0', '���ӣ�Letv����1pro��X800��64GB ��ɫ �ƶ���ͨ4G�ֻ� ˫��˫��������̬UI+5.5Ӣ��2K��+��ͨ8�˴�����+4GB�����ڴ�+64GB�洢+1300������ͷ��', '0', '1');

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
INSERT INTO `user` VALUES ('ac95e004ac95e004ac95e004ac95e004ac95e004', '2015011110', '81dc9bdb52d04dc20036dbd8313ed055', '��', '714772696@qq.com', null, '1970-01-01', 'male', '1', '87d3105d87d3105d87d3105d87d3105d87d3105d');