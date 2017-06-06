/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Host           : localhost:3306
Source Database       : shop
Target Server Type    : MYSQL
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
-- Records of tb_admin 1 商品管理 2 订单管理 3 会员管理 4 系统
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '1', '商水', 'admin1', 'admin1');
INSERT INTO `tb_admin` VALUES ('2', '2', '丁琪', 'admin2', 'admin2');
INSERT INTO `tb_admin` VALUES ('3', '3', '文会', 'admin3', 'admin3');
INSERT INTO `tb_admin` VALUES ('4', '4', '夏瑕', 'admin4', 'admin4');
INSERT INTO `tb_admin` VALUES ('5', '1', '优乐', 'youyue', '123');
INSERT INTO `tb_admin` VALUES ('6', '2', '白栎', 'baili', '123');
INSERT INTO `tb_admin` VALUES ('7', '3', '李美婷', 'li', '123');
INSERT INTO `tb_admin` VALUES ('8', '1', '李达', 'lida', '123');
INSERT INTO `tb_admin` VALUES ('9', '2', '李建设', 'lijianshe', '123');
INSERT INTO `tb_admin` VALUES ('10', '3', '白奕竹', 'baiyizhu', '123');
INSERT INTO `tb_admin` VALUES ('11', '1', '容景', 'rongjing', '123');
INSERT INTO `tb_admin` VALUES ('12', '2', '风书晚', 'shuwan', '123');
INSERT INTO `tb_admin` VALUES ('13', '3', '杨子琪', 'yang', '123');
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
  `goodsId` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`goodsId`),
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
INSERT INTO `tb_inform` VALUES ('1', 'ipet商城营业啦~~', '欢迎大家光临，有任何意见请您及时给我们留言，谢谢啦。', '2017-5-14');
INSERT INTO `tb_inform` VALUES ('2', '这里提供宠物', '欢迎大家光临，有任何意见请您及时给我们留言', '2017-5-14');
INSERT INTO `tb_inform` VALUES ('3', '测试', '你看到我了吗', '2017-5-14');


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
INSERT INTO `tb_user` VALUES ('1', 'baiyizhu', '123', '1235@qq.com', '白奕竹', '男', '1995-11-25', '上海', '1000001', '88546461', '15646113645', '你的第一任老师是谁', '庞龙', null, null);
INSERT INTO `tb_user` VALUES ('2', 'tom', '123', 'tom@163.com', '汤姆', '男', '1995-11-25', '天津', '1000002', '23873736', '15646113645', '你母亲的名字是什么', '张珂', null, null);
INSERT INTO `tb_user` VALUES ('3', 'Jerry', '123', 'jerry@163.com', '珍妮', '女', '1995-11-25', '上海', '1000003', '87389646', '15646113645', '你父亲的名字是什么', '张龙', null, null);
INSERT INTO `tb_user` VALUES ('4', 'gusheng', '123', 'gusheng@qust.com', '顾声声', '女', '1995-11-25', '北京', '1000004', '84613116', '15646113645', '你小学什么时候毕业的', '2010', null, null);
INSERT INTO `tb_user` VALUES ('5', 'qiang', '123', 'qiang@qust.com', '莫青城', '男', '1995-11-25', '山西太原', '1000005', '4335964', '15646113645', '你的出生日期', '1889-7-6', null, null);
INSERT INTO `tb_user` VALUES ('6', 'xuan', '123', 'xuan@qust.com', '林轩', '女', '1995-11-25', '黑龙江', '1000006', '56416126', '15646113645', '你最喜欢的星座', '射手', null, null);
INSERT INTO `tb_user` VALUES ('7', 'duan', '123', 'duan@qust.com', '段轻晚', '女', '1995-11-25', '吉林长春', '1000007', '296532036', '15646113645', '', '庞龙', null, null);
INSERT INTO `tb_user` VALUES ('8', 'ning', '123', 'ning@qust.com', '宁宁', '男', '1995-11-25', '安徽合肥', '1000008', '5914320', '15646113645', '你的第一任老师是谁', '庞龙', null, null);
INSERT INTO `tb_user` VALUES ('9', 'miao', '123', 'miao@qust.com', '林思妙', '女', '1995-11-25', '江西', '1000009', '126230', '15646113645', '你的第一任老师是谁', '庞龙', null, null);
INSERT INTO `tb_user` VALUES ('10', 'lan', '123', 'lan@qust.com', '叶海蓝', '女', '1995-11-25', '广东广州', '1000010', '88546461', '15646113645', '你做喜欢的职业', '程序员', null, null);
INSERT INTO `tb_user` VALUES ('11', 'ling', '123', 'ling@qust.com', '灵歌', '女', '1995-11-25', '河南郑州', '1000011', '88546461', '15646113645', '你的座右铭', '我爱学习，学习使我快乐', null, null);
INSERT INTO `tb_user` VALUES ('12', 'monkey', '123', 'monkey@qust.com', '毛斌', '男', '1995-11-25', '上海', '1000012', '88546461', '15646113645', '我爱工作', '工作使我快乐', null, null);
INSERT INTO `tb_user` VALUES ('13', 'tang', '123', 'tang@qust.com', '唐伯虎', '男', '1995-11-25', '山东济南', '1000013', '88546461', '15646113645', '你第一任班主任是谁', '宫倾城', null, null);
INSERT INTO `tb_user` VALUES ('14', 'yao', '123', 'yao@qust.com', '李逍遥', '男', '1995-11-25', '河北沧州', '1000014', '88546461', '15646113645', '我爱java', 'java使我快乐', null, null);
INSERT INTO `tb_user` VALUES ('15', 'shan', '123', 'shan@qust.com', '张山', '男', '1995-11-25', '山西大同', '1000015', '88546461', '15646113645', '我爱SQL', 'SQL使我快乐', null, null);
INSERT INTO `tb_user` VALUES ('16', 'like', '123', 'like@qust.com', '李可', '男', '1995-11-25', '上海', '1000016', '88546461', '15646113645', '我爱前端开发', '前端使我快乐', null, null);


-- ----------------------------
-- Table structure for tb_note
-- ----------------------------
DROP TABLE IF EXISTS `tb_note`;
CREATE TABLE `tb_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `author` varchar(30) NOT NULL,
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
  `orderDate` TIMESTAMP defAULT  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('35', 'yao', '黎明', '上海', '161616', '16465262@qq.com', '2017-5-15', '0');
INSERT INTO `tb_order` VALUES ('36', 'tom', '汤姆', '天津', '100610', '5dfgd@163.com', '2017-5-15', '0');
INSERT INTO `tb_order` VALUES ('37', 'gusheng', '顾声', '北京', '521213', 'faef@sina.com', '2017-5-15', '1');
INSERT INTO `tb_order` VALUES ('38', 'baiyizhu', '白奕竹', '青岛', '366552', '1215445@163.com', '2017-5-15', '1');
INSERT INTO `tb_order` VALUES ('39', 'gusheng', '顾声', '北京', '521213', 'faef@sina.com', '2017-5-15', '1');
INSERT INTO `tb_order` VALUES ('40', 'baiyizhu', '白奕竹', '青岛', '366552', '1215445@163.com', '2017.5.5', '0');
INSERT INTO `tb_order` VALUES ('41', 'gusheng', '顾声', '北京', '521213', 'faef@sina.com', '2017-5-15', '1');
INSERT INTO `tb_order` VALUES ('42', 'baiyizhu', '白g奕竹', '青岛', '366552', '1215445@163.com', '2017.5.5', '0');
INSERT INTO `tb_order` VALUES ('43', 'gusheng', '顾声ca', '北京', '521213', 'faef@sina.com', '2017-5-15', '1');
INSERT INTO `tb_order` VALUES ('44', 'baiyizhu', '白奕竹ver', '青岛', '366552', '1215445@163.com', '2017.5.5', '0');
INSERT INTO `tb_order` VALUES ('45', 'gwusheng', '顾声gw', '北京', '521213', 'faef@sina.com', '2017-5-15', '1');
INSERT INTO `tb_order` VALUES ('46', 'baiyizhu', '白奕rw竹', '青岛', '366552', '1215445@163.com', '2017.5.5', '0');
INSERT INTO `tb_order` VALUES ('47', 'gusheng', '顾gr声', '北京', '521213', 'faef@sina.com', '2017-5-15', '1');
INSERT INTO `tb_order` VALUES ('48', 'baiyizhu', '白df奕竹', '青岛', '366552', '1215445@163.com', '2017.5.5', '0');
INSERT INTO `tb_order` VALUES ('49', 'gusheng', '顾声ge', '北京', '521213', 'faef@sina.com', '2017-5-15', '1');
INSERT INTO `tb_order` VALUES ('50', 'baiyizhu', '白gsgr奕竹', '青岛', '366552', '1215445@163.com', '2017.5.5', '0');
INSERT INTO `tb_order` VALUES ('51', 'gusheng', '顾s声', '北京', '521213', 'faef@sina.com', '2017-5-15', '1');



-- ----------------------------
-- Table structure for tb_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `orderItemId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `goodsName` varchar(50) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `goodsNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `orderId` (`orderId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `tb_orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `tb_order` (`orderId`),
  CONSTRAINT `tb_orderitem_ibfk_2` FOREIGN KEY (`goodsId`) REFERENCES `tb_goods` (`goodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_orderitem
-- ----------------------------
INSERT INTO `tb_orderitem` VALUES ('87', '35', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('88', '35', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('89', '36', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('90', '36', '217', '荷兰兔', '1212', '1');
INSERT INTO `tb_orderitem` VALUES ('91', '36', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('92', '37', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('93', '37', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('94', '38', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('95', '39', '217', '荷兰兔', '1212', '1');
INSERT INTO `tb_orderitem` VALUES ('96', '40', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('97', '41', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('98', '42', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('99', '43', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('100', '44', '217', '荷兰兔', '1212', '1');
INSERT INTO `tb_orderitem` VALUES ('101', '45', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('102', '46', '217', '荷兰兔', '1212', '1');
INSERT INTO `tb_orderitem` VALUES ('103', '46', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('104', '47', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('105', '47', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('106', '48', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('107', '49', '217', '荷兰兔', '1212', '1');
INSERT INTO `tb_orderitem` VALUES ('108', '49', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('109', '48', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('110', '49', '214', '金鱼', '399', '1');
INSERT INTO `tb_orderitem` VALUES ('111', '50', '220', '小猫咪', '358', '1');
INSERT INTO `tb_orderitem` VALUES ('112', '50', '217', '荷兰兔', '1212', '1');
INSERT INTO `tb_orderitem` VALUES ('113', '51', '214', '金鱼', '399', '1');
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



