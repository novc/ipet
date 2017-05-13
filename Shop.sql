/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2014-01-09 20:24:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `ID` int(4) NOT NULL AUTO_INCREMENT,
  `AdminType` int(11) DEFAULT NULL,
  `AdminName` varchar(50) DEFAULT NULL,
  `LoginName` varchar(12) DEFAULT NULL,
  `LoginPwd` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AdminType` (`AdminType`),
  CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`AdminType`) REFERENCES `tb_admintype` (`adminTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '1', '商品管理员', 'admin1', 'admin1');
INSERT INTO `tb_admin` VALUES ('2', '2', '订单管理员', 'admin2', 'admin2');
INSERT INTO `tb_admin` VALUES ('3', '3', '会员管理员', 'admin3', 'admin3');
INSERT INTO `tb_admin` VALUES ('4', '4', '系统管理员', 'admin4', 'admin4');

-- ----------------------------
-- Table structure for tb_admintype
-- ----------------------------
DROP TABLE IF EXISTS `tb_admintype`;
CREATE TABLE `tb_admintype` (
  `adminTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `adminTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admintype
-- ----------------------------
INSERT INTO `tb_admintype` VALUES ('1', '商品管理员');
INSERT INTO `tb_admintype` VALUES ('2', '订单管理员');
INSERT INTO `tb_admintype` VALUES ('3', '会员管理员');
INSERT INTO `tb_admintype` VALUES ('4', '系统管理员');

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `superTypeId` int(11) DEFAULT NULL,
  `subTypeId` int(11) DEFAULT NULL,
  `goodsName` varchar(200) DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `introduce` text,
  `price` float DEFAULT NULL,
  `nowPrice` float DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `produceDate` varchar(20) DEFAULT NULL,
  `publisher` varchar(40) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `inTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `newgoods` int(11) DEFAULT NULL,
  `salegoods` int(11) DEFAULT NULL,
  `hostgoods` int(11) DEFAULT NULL,
  `specialgoods` int(11) DEFAULT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `subTypeId` (`subTypeId`),
  KEY `superTypeId` (`superTypeId`),
  CONSTRAINT `tb_goods_ibfk_1` FOREIGN KEY (`subTypeId`) REFERENCES `tb_subtype` (`subTypeId`),
  CONSTRAINT `tb_goods_ibfk_2` FOREIGN KEY (`superTypeId`) REFERENCES `tb_supertype` (`superTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('206', '66', '235', '金毛犬', 'jinmaoquan', '金毛犬', '1250', '1234', 'images/0001.jpg', '2014/02/23', '江苏', '金毛犬', '2014-01-09 18:01:25', '1', '0', '0', '0', '222');
INSERT INTO `tb_goods` VALUES ('207', '66', '236', '牧羊犬', 'muyangquan', '牧羊犬', '3399', '3322', 'images/0002.jpg', '2014/02/23', '上海', '牧羊犬', '2014-01-09 18:04:51', '0', '0', '1', '0', '332');
INSERT INTO `tb_goods` VALUES ('208', '66', '237', '哈士奇犬 ', 'haqishiquan', '哈士奇犬 ', '3954', '3923', 'images/0003.jpg', '2014/02/23', '广东', '哈士奇犬 ', '2014-01-09 18:07:22', '1', '0', '0', '0', '213123');
INSERT INTO `tb_goods` VALUES ('209', '66', '238', '阿拉斯加 ', 'alasijia', '阿拉斯加 ', '7400', '7300', 'images/0004.jpg', '2014/02/23', '中国', '阿拉斯加 ', '2014-01-09 18:09:46', '0', '0', '0', '1', '512');
INSERT INTO `tb_goods` VALUES ('210', '67', '241', '加菲猫', 'jiafeimao', '加菲猫', '2999', '2333', 'images/0005.jpg', '2014/02/23', '海外', '加菲猫', '2014-01-09 18:17:14', '1', '0', '0', '0', '2122');
INSERT INTO `tb_goods` VALUES ('211', '67', '242', '波斯猫', 'bosimao', '波斯猫', '9973', '9711', 'images/0006.jpg', '2014/02/23', '波斯', '波斯猫', '2014-01-09 18:18:59', '0', '0', '0', '1', '3333');
INSERT INTO `tb_goods` VALUES ('212', '67', '243', '巴厘猫', 'balimao', '巴厘猫', '1133', '1122', 'images/0007.jpg', '2014/02/23', '巴厘', '巴厘猫', '2014-01-09 18:21:58', '1', '0', '0', '0', '2112');
INSERT INTO `tb_goods` VALUES ('213', '67', '245', '金吉拉', 'jinjila', '金吉拉', '4000', '3699', 'images/0008.jpg', '2014/02/23', '海外', '金吉拉', '2014-01-09 19:03:10', '1', '0', '0', '0', '1233');
INSERT INTO `tb_goods` VALUES ('214', '68', '247', '金鱼', 'jinyu', '金鱼', '499', '399', 'images/0009.jpg', '2014/02/23', '中国', '金鱼', '2014-01-09 18:34:42', '0', '0', '0', '1', '1329');
INSERT INTO `tb_goods` VALUES ('215', '69', '248', '鹦鹉', 'yingwu', '鹦鹉', '899', '799', 'images/1000.jpg', '2014/02/23', '中国', '鹦鹉', '2014-01-09 18:40:20', '0', '0', '1', '0', '895');
INSERT INTO `tb_goods` VALUES ('216', '70', '250', '白兔', 'baitu', '白兔', '999', '932', 'images/1001.jpg', '2014/02/23', '中国', '白兔', '2014-01-09 18:43:33', '0', '0', '0', '1', '2311');
INSERT INTO `tb_goods` VALUES ('217', '70', '254', '荷兰兔', 'helantu', '荷兰兔', '1599', '1212', 'images/1122.jpg', '2014/02/23', '荷兰', '荷兰兔', '2014-01-09 18:48:12', '0', '1', '0', '1', '2133');
INSERT INTO `tb_goods` VALUES ('218', '71', '256', '荷兰猪', 'helanzhu', '荷兰猪', '2344', '2112', 'images/1222.jpg', '2014/02/23', '荷兰', '荷兰猪', '2014-01-09 18:50:48', '0', '0', '1', '0', '4545');
INSERT INTO `tb_goods` VALUES ('219', '67', '257', '可爱小猫咪', 'XMM', '超可爱小猫咪', '655', '650', 'images/dfm.jpg', '2014/03/22', '中国', '猫咪', '2014-01-09 18:58:40', '1', '1', '0', '0', '333');
INSERT INTO `tb_goods` VALUES ('220', '67', '257', '小猫咪', 'XMM-21', '小猫咪', '388', '358', 'images/xmm0.jpg', '2014/03/12', '中国', '猫咪', '2014-01-09 20:22:24', '0', '0', '0', '1', '554');

-- ----------------------------
-- Table structure for tb_inform
-- ----------------------------
DROP TABLE IF EXISTS `tb_inform`;
CREATE TABLE `tb_inform` (
  `informId` int(11) NOT NULL AUTO_INCREMENT,
  `informTitle` varchar(30) DEFAULT NULL,
  `informContent` varchar(30) DEFAULT NULL,
  `informTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`informId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_inform
-- ----------------------------
INSERT INTO `tb_inform` VALUES ('1', '电子商务网站试营业啦~~', '欢迎大家光临，有任何意见请您及时给我们留言，谢谢啦。', '2014-01-04 14:09:53');

-- ----------------------------
-- Table structure for tb_note
-- ----------------------------
DROP TABLE IF EXISTS `tb_note`;
CREATE TABLE `tb_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `content` varchar(50) NOT NULL,
  `ly_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `imgs` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_note
-- ----------------------------
INSERT INTO `tb_note` VALUES ('2', '能不能便宜点', 'kitty15', '求便宜点。。。', '2014-01-04 20:55:33', 'images/face/pic4.gif');
INSERT INTO `tb_note` VALUES ('4', '有没有优惠啊', 'demo123', '有木有？', '2014-01-05 17:37:42', 'images/face/pic2.gif');
INSERT INTO `tb_note` VALUES ('5', '好多哦', 'ha2222', '好看哦', '2014-01-06 19:57:24', 'images/face/pic4.gif');
INSERT INTO `tb_note` VALUES ('6', '有没有特价啊？', 'hello111', '有没有活动秒杀啊', '2014-01-06 23:05:14', 'images/face/pic1.gif');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `recvName` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('35', 'hellokitty', '上海', 'hellokitty', '111222', '1095080675@qq.com', '2014-01-09 19:32:30', '0');
INSERT INTO `tb_order` VALUES ('36', 'hellokitty', '上海', 'hellokitty', '111222', '1095080675@qq.com', '2014-01-09 20:22:24', '1');

-- ----------------------------
-- Table structure for tb_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `bookId` int(11) DEFAULT NULL,
  `goodsName` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `orderId` (`orderId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `tb_orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `tb_order` (`orderId`),
  CONSTRAINT `tb_orderitem_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `tb_goods` (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_orderitem
-- ----------------------------
INSERT INTO `tb_orderitem` VALUES ('87', '35', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('88', '35', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('89', '36', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('90', '36', '217', '荷兰兔', '1212', '1');
INSERT INTO `tb_orderitem` VALUES ('91', '36', '214', '金鱼', '399', '1');

-- ----------------------------
-- Table structure for tb_subtype
-- ----------------------------
DROP TABLE IF EXISTS `tb_subtype`;
CREATE TABLE `tb_subtype` (
  `subTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `superTypeId` int(11) DEFAULT NULL,
  `subTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subTypeId`),
  KEY `superTypeId` (`superTypeId`),
  CONSTRAINT `tb_subtype_ibfk_1` FOREIGN KEY (`superTypeId`) REFERENCES `tb_supertype` (`superTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_subtype
-- ----------------------------
INSERT INTO `tb_subtype` VALUES ('235', '66', '金毛犬');
INSERT INTO `tb_subtype` VALUES ('236', '66', '牧羊犬');
INSERT INTO `tb_subtype` VALUES ('237', '66', '哈士奇犬 ');
INSERT INTO `tb_subtype` VALUES ('238', '66', '阿拉斯加 ');
INSERT INTO `tb_subtype` VALUES ('239', '66', '拉布拉多 ');
INSERT INTO `tb_subtype` VALUES ('240', '66', '博美犬');
INSERT INTO `tb_subtype` VALUES ('241', '67', '加菲猫');
INSERT INTO `tb_subtype` VALUES ('242', '67', '波斯猫');
INSERT INTO `tb_subtype` VALUES ('243', '67', '巴厘猫');
INSERT INTO `tb_subtype` VALUES ('244', '67', '布偶猫');
INSERT INTO `tb_subtype` VALUES ('245', '67', '金吉拉');
INSERT INTO `tb_subtype` VALUES ('246', '68', '孔雀鱼');
INSERT INTO `tb_subtype` VALUES ('247', '68', '金鱼');
INSERT INTO `tb_subtype` VALUES ('248', '69', '鹦鹉');
INSERT INTO `tb_subtype` VALUES ('249', '69', '珍珠鸟');
INSERT INTO `tb_subtype` VALUES ('250', '70', '白兔');
INSERT INTO `tb_subtype` VALUES ('251', '70', '蝴蝶兔');
INSERT INTO `tb_subtype` VALUES ('252', '69', '英国安哥拉兔');
INSERT INTO `tb_subtype` VALUES ('253', '70', '猫猫兔');
INSERT INTO `tb_subtype` VALUES ('254', '70', '荷兰兔');
INSERT INTO `tb_subtype` VALUES ('255', '71', '小香猪');
INSERT INTO `tb_subtype` VALUES ('256', '71', '荷兰猪');
INSERT INTO `tb_subtype` VALUES ('257', '67', '猫咪');

-- ----------------------------
-- Table structure for tb_supertype
-- ----------------------------
DROP TABLE IF EXISTS `tb_supertype`;
CREATE TABLE `tb_supertype` (
  `superTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`superTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_supertype
-- ----------------------------
INSERT INTO `tb_supertype` VALUES ('66', '宠物狗');
INSERT INTO `tb_supertype` VALUES ('67', '宠物猫');
INSERT INTO `tb_supertype` VALUES ('68', '宠物鱼');
INSERT INTO `tb_supertype` VALUES ('69', '宠物鸟');
INSERT INTO `tb_supertype` VALUES ('70', '宠物兔');
INSERT INTO `tb_supertype` VALUES ('71', '宠物猪');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(50) NOT NULL,
  `trueName` varchar(40) NOT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `mphone` varchar(15) DEFAULT NULL,
  `question` varchar(30) NOT NULL,
  `answer` varchar(30) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `score` int(11) DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'hellokitty', '111111', '1095080675@qq.com', '咔咔咔', '男', '1995-11-25', '上海', '111222', '021-55558888', '13513513555', '你最爱的人的名字叫什么', 'cat', null, null);
INSERT INTO `tb_user` VALUES ('2', 'go2013', '123456', 'go13@qq.com', '李琦', '女', '1995-10-22', '中华人民共和国', '111111', '010-58694562', '13913813777', '你喜欢的业余爱好是什么', '乒乓球', null, null);
INSERT INTO `tb_user` VALUES ('3', 'hellokitty2', '123456', 'ello@qq.com', '哇哈哈', '男', '1993-10-18', '上海市', '111111', '021-88885555', '13512510001', '你喜欢的业余爱好是什么', '行吗好', null, null);
INSERT INTO `tb_user` VALUES ('4', 'kitty14', '111111', 'kitty@qq.com', '张三四', '男', '1995-11-11', '中国上海', '111111', '021-22221111', '13913813888', '你喜欢的业余爱好是什么', '打球', null, null);
INSERT INTO `tb_user` VALUES ('5', 'kitty15', '111111', 'kitty@qq.com', '李四五', '男', '1993-09-08', '中国', '100100', '010-68688888', '13313313333', '你喜欢的业余爱好是什么', '看书', null, null);
INSERT INTO `tb_user` VALUES ('6', 'gogo2014', '111111', 'gogo@qq.com', '前进', '男', '1995-10-10', '中国', '100100', '010-88889999', '13512512888', '你喜欢的业余爱好是什么', 'play', null, null);
INSERT INTO `tb_user` VALUES ('7', 'demo123', '123456', 'demo@qq.com', '王二', '男', '1993-12-12', '中国', '100100', '010-68688888', '13913913999', '你喜欢的业余爱好是什么', '游泳', null, null);
INSERT INTO `tb_user` VALUES ('8', 'zhangyi', '111111', 'zhang@qq.com', '张呵呵', '男', '1994-12-11', '中国', '100111', '010-68688888', '13913813888', '你喜欢的业余爱好是什么', '跑步', null, null);
INSERT INTO `tb_user` VALUES ('9', 'ha2222', '123456', 'ha222@qq.com', '哈哈哈', '男', '1996-11-11', '中国', '111111', '88885555', '13813713888', '你喜欢的业余爱好是什么', '打球', null, null);
INSERT INTO `tb_user` VALUES ('10', 'hello111', '111111', 'hello@qq.com', '张三', '男', '1995-12-18', '中国', '111222', '55558888', '13513813999', '你喜欢的业余爱好是什么', '乒乓球', null, null);
INSERT INTO `tb_user` VALUES ('11', 'aaa2014', '111111', 'aaa@qq.com', '呵呵好', '男', '1993-10-10', '中国', '111111', '88885555', '13913800001', '你喜欢的业余爱好是什么', '看电视', null, null);
INSERT INTO `tb_user` VALUES ('12', 'wawawa', '111111', 'wahaha@qq.com', '哇哇', '男', '1994-11-11', '中国', '222222', '010-68688888', '13913913999', '你喜欢的业余爱好是什么', '打球', null, null);
