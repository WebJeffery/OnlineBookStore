/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : good

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-08-08 16:26:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` char(32) NOT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `adminpwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a5', 'admin', '123456');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` char(32) NOT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `discount` decimal(3,1) DEFAULT NULL,
  `press` varchar(100) DEFAULT NULL,
  `publishtime` char(10) DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `pageNum` int(11) DEFAULT NULL,
  `wordNum` int(11) DEFAULT NULL,
  `printtime` char(10) DEFAULT NULL,
  `booksize` int(11) DEFAULT NULL,
  `paper` varchar(50) DEFAULT NULL,
  `cid` char(32) DEFAULT NULL,
  `image_w` varchar(100) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bid`) USING BTREE,
  KEY `orderBy` (`orderBy`) USING BTREE,
  KEY `FK_t_book_t_category` (`cid`) USING BTREE,
  CONSTRAINT `FK_t_book_t_category` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('001', '罗生门', '芥川龙之介', '28.40', '19.60', '6.9', '江苏凤凰文艺出版社', '2012-6-7', '1', '456', '876000', '2012-6-7', '16', '胶版纸', '005', 'book_img/001_w.jpg', 'book_img/001_b.jpg', '66');
INSERT INTO `book` VALUES ('002', '局外人(诺贝尔文学奖60周年纪念版)', '加缪', '28.67', '19.78', '6.9', '江苏凤凰文艺出版社', '2013-7-6', '1', '704', '769000', '2013-7-6', '16', '胶版纸', '005', 'book_img/002_w.jpg', 'book_img/002_b.jpg', '9');
INSERT INTO `book` VALUES ('003', '烟火人间(老舍经典作品精选集纪念珍藏版)', '老舍', '34.50', '23.81', '6.9', '长江文艺出版社', '2008-6-8', '2', '287', '373000', '2008-6-8', '16', '胶版纸', '005', 'book_img/003_w.jpg', 'book_img/003_b.jpg', '25');
INSERT INTO `book` VALUES ('004', '追风筝的人', '卡勒德•胡赛尼 (Khaled Hosseini) ', '24.49', '16.70', '6.9', '上海人民出版社', '2006-4-21', '1', '1012', '1657000', '2006-4-21', '32', '胶版纸', '005', 'book_img/004_w.jpg', 'book_img/004_b.jpg', '88');
INSERT INTO `book` VALUES ('005', '高兴死了!!!', '珍妮•罗森(Jenny Lawson)', '29.95', '20.67', '6.9', '江苏凤凰文艺出版社', '2009-5-8', '1', '507', '678000', '2009-5-8', '16', '胶版纸', '005', 'book_img/005_w.jpg', 'book_img/005_b.jpg', '48');
INSERT INTO `book` VALUES ('006', '三体(1-3)(套装共3册)', '刘慈欣', '62.80', '43.33', '6.9', '重庆出版社', '2014-9-11', '1', '1004', '999000', '2014-9-11', '16', '胶版纸', '005', 'book_img/006_w.jpg', 'book_img/006_b.jpg', '4');
INSERT INTO `book` VALUES ('007', '必须找到阿历克斯', '皮耶尔•勒迈特(Pierre Lemaitre)', '38.30', '26.43', '6.9', '文汇出版社', '2016-2-1', '1', '393', '553000', '2016-2-1', '16', '胶版纸', '005', 'book_img/007_w.jpg', 'book_img/007_b.jpg', '51');
INSERT INTO `book` VALUES ('008', '云边有个小卖部', '张嘉佳', '31.50', '21.74', '6.9', '湖南文艺出版社', '2018-6-1', '1', '374', '487000', '2018-6-1', '16', '胶版纸', '005', 'book_img/008_w.jpg', 'book_img/008_b.jpg', '11');
INSERT INTO `book` VALUES ('009', '伤心咖啡馆之歌（2018作家榜未删减插图珍藏版', '卡森•麦卡勒斯', '32.50', '22.43', '6.9', '华东师范大学出版社', '2018-1-1', '1', '547', '979000', '2018-1-1', '16', '胶版纸', '005', 'book_img/009_w.jpg', 'book_img/009_b.jpg', '23');
INSERT INTO `book` VALUES ('010', '岛上书店', '加·泽文', '17.50', '12.08', '6.9', '江苏凤凰文艺出版社', '2017-1-4', '1', '1010', '1368000', '2017-1-4', '16', '胶版纸', '005', 'book_img/010_w.jpg', 'book_img/010_b.jpg', '17');
INSERT INTO `book` VALUES ('011', '解忧杂货店', '东野圭吾', '27.30', '18.84', '6.9', '南海出版公司', '2015-2-6', '1', '394', '617000', '2015-2-6', '16', '胶版纸', '005', 'book_img/011_w.jpg', 'book_img/011_b.jpg', '79');
INSERT INTO `book` VALUES ('012', '边城(修订纪念典藏版)', '沈从文', '26.63', '18.37', '6.9', '武汉出版社', '2013-3-6', '1', '512', '625000', '2013-3-6', '16', '胶版纸', '005', 'book_img/012_w.jpg', 'book_img/012_b.jpg', '68');
INSERT INTO `book` VALUES ('013', '这难得的世间(傅雷作品精选集彩插纪念版)', '傅雷', '28.67', '19.78', '6.9', '江苏凤凰文艺出版社', '2011-5-10', '3', '413', '642000', '2011-5-10', '16', '胶版纸', '005', 'book_img/013_w.jpg', 'book_img/013_b.jpg', '71');
INSERT INTO `book` VALUES ('014', '花间集', '温庭筠', '32.08', '22.14', '6.9', '江苏凤凰文艺出版社', '2008-8-8', '1', '386', '545000', '2008-8-8', '16', '胶版纸', '005', 'book_img/014_w.jpg', 'book_img/014_b.jpg', '52');
INSERT INTO `book` VALUES ('015', '春琴抄(浮世绘彩图纪念版)', '谷崎润一郎', '31.73', '21.89', '6.9', '江苏凤凰文艺出版社', '2009-9-9', '1', '526', '875000', '2009-9-9', '16', '胶版纸', '005', 'book_img/015_w.jpg', 'book_img/015_b.jpg', '81');
INSERT INTO `book` VALUES ('016', '小小小小的火', '伍绮诗', '31.20', '21.53', '6.9', '江苏凤凰文艺出版社', '2010-10-10', '1', '710', '1158000', '2010-10-10', '16', '胶版纸', '005', 'book_img/016_w.jpg', 'book_img/016_b.jpg', '24');
INSERT INTO `book` VALUES ('017', '无声告白（简体中文）', '伍绮诗', '17.50', '12.08', '6.9', '江苏凤凰文艺出版社', '2011-2-3', '1', '484', '7710000', '2011-2-3', '16', '胶版纸', '005', 'book_img/017_w.jpg', 'book_img/017_b.jpg', '89');
INSERT INTO `book` VALUES ('018', '如父如子', '是枝裕和 ', '35.12', '24.23', '6.9', '湖南文艺出版社', '2000-1-1', '1', '292', '436000', '2000-1-1', '16', '胶版纸', '005', 'book_img/018_w.jpg', 'book_img/018_b.jpg', '8');
INSERT INTO `book` VALUES ('019', '使女的故事', '玛格丽特•阿特伍德', '33.80', '23.32', '6.9', '上海译文出版社有限公司', '2001-9-8', '3', '564', '1013000', '2001-9-8', '16', '胶版纸', '005', 'book_img/019_w.jpg', 'book_img/019_b.jpg', '1');
INSERT INTO `book` VALUES ('020', '忏悔录', '让-雅克·卢梭', '41.12', '28.37', '6.9', '中国友谊出版公司', '2007-7-8', '1', '730', '1092000', '2007-7-8', '16', '胶版纸', '005', 'book_img/020_w.jpg', 'book_img/020_b.jpg', '5');
INSERT INTO `book` VALUES ('021', '你坏', '大冰 ', '29.70', '20.49', '6.9', '湖南文艺出版社社', '2009-2-17', '1', '400', '649000', '2009-2-17', '16', '胶版纸', '005', 'book_img/021_w.jpg', 'book_img/021_b.jpg', '27');
INSERT INTO `book` VALUES ('022', '格林文集:命运的内核', '格雷厄姆•格林 (Graham Greene)', '50.68', '34.97', '6.9', '江苏凤凰文艺出版社', '2004-6-25', '1', '241', '301000', '2004-6-25', '16', '胶版纸', '005', 'book_img/022_w.jpg', 'book_img/022_b.jpg', '40');
INSERT INTO `book` VALUES ('023', '平凡的世界：全三册', '路遥 ', '74.50', '51.41', '6.9', '北京十月文艺出版社', '2005-7-14', '1', '504', '789000', '2005-7-14', '16', '胶版纸', '005', 'book_img/023_w.jpg', 'book_img/023_b.jpg', '42');
INSERT INTO `book` VALUES ('024', '失踪的总统', '比尔·克林顿 (Bill Clinton)', '32.43', '22.38', '6.9', '江苏凤凰文艺出版社', '2012-6-5', '2', '605', '1037000', '2012-6-5', '16', '胶版纸', '005', 'book_img/024_w.jpg', 'book_img/024_b.jpg', '64');
INSERT INTO `book` VALUES ('025', '老残游记', '刘鹗', '32.30', '22.28', '6.9', '浙江文艺出版社', '2014-5-9', '1', '442', '746000', '2014-5-9', '16', '胶版纸', '005', 'book_img/025_w.jpg', 'book_img/025_b.jpg', '50');
INSERT INTO `book` VALUES ('026', '清明上河图密码5:隐藏在千古名画中的阴谋与杀局', '冶文彪 ', '41.70', '28.77', '6.9', '北京联合出版公司', '2011-2-1', '1', '359', '446400', '2011-2-1', '16', '胶版纸', '005', 'book_img/026_w.jpg', 'book_img/026_b.jpg', '44');
INSERT INTO `book` VALUES ('027', '小丑之花', '太宰治', '31.73', '21.89', '6.9', '江苏凤凰文艺出版社', '2017-3-2', '1', '410', '781000', '2017-3-2', '16', '胶版纸', '005', 'book_img/027_w.jpg', 'book_img/027_b.jpg', '46');
INSERT INTO `book` VALUES ('028', '月亮与六便士', '毛姆 ', '28.00', '19.32', '6.9', '浙江文艺出版社', '2018-6-1', '1', '718', '668000', '2018-6-1', '16', '胶版纸', '005', 'book_img/028_w.jpg', 'book_img/028_b.jpg', '35');
INSERT INTO `book` VALUES ('029', '恶意(2016版)', '东野圭吾 ', '32.90', '22.70', '6.9', '南海出版公司', '2016-1-1', '1', '718', '1488000', '2016-1-1', '16', '胶版纸', '005', 'book_img/029_w.jpg', 'book_img/029_b.jpg', '91');
INSERT INTO `book` VALUES ('030', '嫌疑人X的献身', '东野圭吾 ', '31.00', '21.39', '6.9', '南海出版公司', '2018-2-8', '1', '459', '745000', '2018-2-8', '16', '胶版纸', '005', 'book_img/030_w.jpg', 'book_img/030_b.jpg', '85');
INSERT INTO `book` VALUES ('031', '呼兰河传', '耿祥义', '39.50', '27.26', '6.9', '清华大学出版社', '2017-6-15', '4', '479', '782000', '2017-6-15', '16', '胶版纸', '005', 'book_img/031_w.jpg', 'book_img/031_b.jpg', '73');
INSERT INTO `book` VALUES ('032', '活着(2017版)', '余华 ', '29.40', '20.29', '6.9', '北京十月文艺出版社', '2017-1-1', '1', '1118', '1370000', '2017-1-1', '16', '胶版纸', '005', 'book_img/032_w.jpg', 'book_img/032_b.jpg', '57');
INSERT INTO `book` VALUES ('033', '马尔克斯：百年孤独', '加西亚·马尔克斯 ', '41.30', '28.50', '6.9', '南海出版公司', '2017-4-20', '1', '385', '666000', '2017-4-20', '16', '胶版纸', '005', 'book_img/033_w.jpg', 'book_img/033_b.jpg', '75');
INSERT INTO `book` VALUES ('034', '本源', '丹·布朗 (Dan Brown)', '34.81', '24.02', '6.9', '人民文学出版社', '2015-9-1', '1', '816', '1440000', '2015-9-1', '16', '胶版纸', '005', 'book_img/034_w.jpg', 'book_img/034_b.jpg', '6');
INSERT INTO `book` VALUES ('035', '无处停歇', '杰米·阿滕贝格 (Jami Attenberg)', '22.05', '15.21', '6.9', '湖南文艺出版社', '2011-2-1', '1', '640', '1030000', '2011-2-1', '16', '胶版纸', '005', 'book_img/035_w.jpg', 'book_img/035_b.jpg', '16');
INSERT INTO `book` VALUES ('036', '我是猫', '夏目漱石 ', '19.50', '13.46', '6.9', '九州出版社', '2013-5-18', '1', '468', '721000', '2013-5-18', '16', '胶版纸', '005', 'book_img/036_w.jpg', 'book_img/036_b.jpg', '58');

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cartItemId`) USING BTREE,
  KEY `orderBy` (`orderBy`) USING BTREE,
  KEY `FK_t_cartitem_t_user` (`uid`) USING BTREE,
  KEY `FK_t_cartitem_t_book` (`bid`) USING BTREE,
  CONSTRAINT `FK_t_cartitem_t_book` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`),
  CONSTRAINT `FK_t_cartitem_t_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` char(32) NOT NULL,
  `cname` varchar(50) DEFAULT NULL,
  `pid` char(32) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `orderBy` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE KEY `cname` (`cname`) USING BTREE,
  KEY `FK_t_category_t_category` (`pid`) USING BTREE,
  KEY `orderBy` (`orderBy`) USING BTREE,
  CONSTRAINT `FK_t_category_t_category` FOREIGN KEY (`pid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('001', '考试', '1', '考试类', '24');
INSERT INTO `category` VALUES ('002', '外语学习', '1', '外语学习类', '20');
INSERT INTO `category` VALUES ('003', '教材', '1', '教材类', '10');
INSERT INTO `category` VALUES ('004', '工具书', '1', '工具书类', '28');
INSERT INTO `category` VALUES ('005', '小说', '2', '小说类', '18');
INSERT INTO `category` VALUES ('006', '文学', '2', '文学类', '22');
INSERT INTO `category` VALUES ('007', '传记', '2', '传记类', '29');
INSERT INTO `category` VALUES ('008', '艺术', '2', '艺术类', '13');
INSERT INTO `category` VALUES ('009', '历史', '3', '历史类', '21');
INSERT INTO `category` VALUES ('010', '国学古籍', '3', '国学古籍类', '12');
INSERT INTO `category` VALUES ('011', '法律', '3', '法律类', '33');
INSERT INTO `category` VALUES ('012', '心理学', '3', '心理学类', '35');
INSERT INTO `category` VALUES ('013', '投资理财', '4', '投资理财类', '23');
INSERT INTO `category` VALUES ('014', '管理', '4', '管理类', '19');
INSERT INTO `category` VALUES ('015', '经济与金融', '4', '经济与金融类', '14');
INSERT INTO `category` VALUES ('016', '市场营销', '4', '市场营销类', '17');
INSERT INTO `category` VALUES ('017', '科普', '5', '科普类', '15');
INSERT INTO `category` VALUES ('018', '计算机与网络', '5', '计算机与网络类', '11');
INSERT INTO `category` VALUES ('019', '医学', '5', '医学类', '25');
INSERT INTO `category` VALUES ('020', '建筑', '5', '建筑类', '30');
INSERT INTO `category` VALUES ('1', '教材教辅', null, '教材教辅类', '1');
INSERT INTO `category` VALUES ('2', '文学艺术', null, '文学艺术类', '2');
INSERT INTO `category` VALUES ('3', '人文社科', null, '人文社科类', '3');
INSERT INTO `category` VALUES ('4', '经济管理', null, '经济管理类', '4');
INSERT INTO `category` VALUES ('5', '科技', null, '科技类', '5');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` char(32) NOT NULL,
  `ordertime` char(19) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `uid` char(32) DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  KEY `FK_t_order_t_user` (`uid`) USING BTREE,
  CONSTRAINT `FK_t_order_t_user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('058F48DA33694C6D8F5C2C13F3D26CEA', '2013-12-26 21:47:04', '16.70', '1', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('08B28BAC52FF491AB78AC977D5CB6E69', '2018-08-07 23:43:50', '60.97', '1', '广东省 广州市 海珠区 ', '1EECB65A5F7F4D188AE99492AC1F307D');
INSERT INTO `order` VALUES ('0A1F4C5BDE754277B984D1E7E763051D', '2014-01-16 15:18:47', '12.08', '5', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('0ADCEE0510844D2697E7A5C0903A8D3B', '2014-01-16 15:13:03', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('0B657B624D8D4B919B7E5F175AA90530', '2014-01-16 15:06:20', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('0CA1A9B0287C43B2AA9435F11F237E9B', '2014-02-06 15:21:27', '12.08', '2', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('0CD9939DC9AE4DA2A12F772293F55A4B', '2014-01-16 15:12:04', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('0FD72F77655D43E2B7989892E965864D', '2013-12-30 20:05:53', '38.51', '1', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('148668BE43754CE2B64A0AC999C5A2D5', '2014-01-16 14:51:08', '36.31', '1', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('159B58B3BBCB4069A550BF1A358B4905', '2014-02-07 01:17:28', '12.08', '2', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('161A05BEBBAA468199131EAD175CCFEA', '2014-01-16 14:58:34', '12.08', '1', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('2AFD7DC9619548BA8727464D77AFB9C2', '2014-01-16 14:59:33', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('303E12F4821A4B3F9DB97B23947220C7', '2013-12-26 22:00:41', '23.81', '2', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('32739173C1E247558358B1A8FE9FE012', '2014-01-16 15:04:11', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('553AFF48D76A48AD89ED3FE8F7E2F587', '2013-12-26 21:54:43', '52.18', '4', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('55FCBF5960BE4BE8B592CC86C3EE6156', '2018-07-06 14:32:48', '23.32', '4', '广东省 广州市 海珠区 滨江街道 东沙街24号 仲恺农业工程学院', '26FA1CF7F0D8441393F0E544116F523B');
INSERT INTO `order` VALUES ('5668668DAB1F4406819D37881BC5D5B1', '2014-01-02 10:23:14', '16.70', '4', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('57197A448F9A4F15B76B1ED1EB3A15E6', '2014-01-16 14:56:58', '12.08', '1', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('57856B1A295B437CA0F7991540897B47', '2014-01-16 15:11:26', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('59A15DD3A0704508B1C2BC9B682A329F', '2014-02-07 16:55:40', '21.74', '3', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('5FB1E131DD294CBBA34FE93228DF2F02', '2014-01-16 14:48:48', '100.48', '1', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('6504C742FE65413494E028E714D4D609', '2014-01-16 14:54:43', '12.08', '1', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('673170D78D9D4EE6AE083167CFB81C1A', '2014-02-06 15:34:44', '21.49', '2', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('674878FE6CAB48918DB4A9688262FBD5', '2014-01-16 15:10:23', '12.08', '1', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('6C921E50C3E54EA0AFD8CC4B661963AD', '2014-02-07 00:40:36', '12.08', '2', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('7237A47B1B5B4A78822D662AE01671B6', '2014-02-08 10:10:21', '12.08', '5', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('744110B92B4F476EA5FDCD752E60DDEB', '2018-06-29 19:34:50', '23.32', '1', '广东省 广州市 海珠区 滨江街道 东沙街24号 仲恺农业工程学院', '4DE7E4D829A54D4FAB150B7451407198');
INSERT INTO `order` VALUES ('7858221EA1DF4B318A632A9C1CD3E1F7', '2014-01-16 15:02:13', '12.08', '1', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('7B3FA2910C9149829AB1EF3A39C4785F', '2013-12-31 23:37:41', '18.84', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('8BB662E4C0444BC88F1DBE82584595BC', '2013-12-31 23:35:44', '22.38', '4', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('96C6D91D916E472681EEC37B1770DE87', '2013-12-31 23:37:06', '30.42', '4', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('984468779C164A6098A7FE7EECE9E273', '2014-01-16 15:16:15', '12.08', '5', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('98C6731604944BA0BF79C4165B4C8F50', '2018-07-06 21:34:06', '97.74', '5', '广东省 广州市 海珠区 滨江街道 东沙街24号 仲恺农业工程学院', '26FA1CF7F0D8441393F0E544116F523B');
INSERT INTO `order` VALUES ('9E1C0A9FDF1F49B18FA0BFA33E132BDD', '2014-01-16 15:05:33', '12.08', '1', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('A20FAD83E5CF4238912B23E2E8D99606', '2018-08-06 22:20:12', '70.45', '3', '广东省 广州市 海珠区 滨江街道 东沙街24号 仲恺农业工程学院', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('A2DB4A7B4EA640ADA63F22A7E8311F4B', '2014-01-16 14:51:51', '36.31', '1', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('B62C7C1BA61C47C4BCEC4BE96897A72C', '2014-01-16 15:16:07', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('B69C6849120D4B28A6CCF99351B88575', '2014-02-05 18:56:02', '129.33', '2', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('BB7789E41C524030832B7E5E426633E7', '2014-02-05 18:55:39', '12.08', '2', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('BD1BD9AB58B1413FA0BDC0AACCC8C65F', '2013-12-26 21:40:48', '39.44', '1', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('BDB995AF80D34716ABB9D10CB6962F87', '2013-12-27 11:58:17', '24.23', '3', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('BE24BB4187B1472AA08E206BF8B0ABF7', '2013-12-30 20:08:10', '19.32', '3', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('C0841F4DFE7A43BFB183E4E82AE7914C', '2014-01-01 13:48:07', '18.84', '4', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('C34F025EF6BB4B88A8409B00A0ABC891', '2014-01-16 15:02:45', '12.08', '1', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('C6F8379F9E3E4F8381763B54E5BF986C', '2014-02-07 11:02:37', '12.08', '2', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('C9F3DE2AF9794AECA2D8BA8E41D35989', '2018-07-06 14:43:32', '47.62', '2', '广东省 广州市 海珠区 滨江街道 东沙街24号 仲恺农业工程学院', '26FA1CF7F0D8441393F0E544116F523B');
INSERT INTO `order` VALUES ('CE537015382640E1AE15B9A8FD08B9EE', '2013-12-26 21:53:34', '12.08', '5', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('D929BD17AB374B49B61B93AF9A194D1A', '2013-12-31 23:39:19', '23.81', '5', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('DD5135AEDA2E464BAF52DEC4727E2A3D', '2014-01-16 15:03:26', '12.08', '1', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('E106BFE7029C485D95A124C733BCC539', '2014-01-16 15:17:50', '12.08', '5', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('E3A1EB6D0543489F9729B2B5BC5DB365', '2014-01-02 10:30:30', '48.39', '1', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('E6EEEB39CECC4089BC65142BADCC4FC3', '2013-12-26 21:40:10', '44.90', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('E891D2A05DA6485EB7E12436E8FB3107', '2014-02-06 10:52:56', '36.48', '2', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('EB96C305ECF04E0793675F5A3F8AB20F', '2018-06-29 19:32:40', '23.81', '1', '广东省 广州市 海珠区 滨江街道 东沙街24号 仲恺农业工程学院', '4DE7E4D829A54D4FAB150B7451407198');
INSERT INTO `order` VALUES ('EBEDAB71A4DA4C30A39638280A082A79', '2018-06-29 19:20:08', '23.32', '2', '广东省 广州市 海珠区 滨江街道 东沙街24号 仲恺农业工程学院', '4DE7E4D829A54D4FAB150B7451407198');
INSERT INTO `order` VALUES ('EC3696A4C443494A9B8DD6E8A9B82072', '2014-01-16 15:09:19', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('ECB47FBA81F64751B7AC89CCB8DDFD09', '2014-02-06 15:23:14', '12.08', '2', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('ED3A585E4CB2442A9D940C65A70004E6', '2018-08-07 19:55:27', '30.42', '1', '广东省 广州市 海珠区 ', '1EECB65A5F7F4D188AE99492AC1F307D');
INSERT INTO `order` VALUES ('EE1F00D88FDC44BD966AF05C1F7FABE0', '2013-12-26 21:48:17', '21.74', '1', '谢先生 广东省 广州市 天河区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('F64FD5E198BB4114AB091034C5C6D8B7', '2014-01-16 15:09:56', '12.08', '1', '陈先生 广东省 广州市 海珠区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');
INSERT INTO `order` VALUES ('F7E603F5179348B9BC3417B9BFB8558D', '2014-02-07 00:12:40', '12.08', '2', '邓先生 广东省 广州市 越秀区 xxx xxx xxx', '531D8A16D524478D86F8A115FE95D93F');
INSERT INTO `order` VALUES ('FAC08EE0DF2C4487A6FA2B11B343307E', '2013-12-26 21:30:19', '51.28', '1', '冯先生 广东省 广州市 白云区 xxx xxx xxx', '32DB3700D2564254982BC58B0E4D95BC');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderItemId` char(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `bid` char(32) DEFAULT NULL,
  `bname` varchar(200) DEFAULT NULL,
  `currPrice` decimal(8,2) DEFAULT NULL,
  `image_b` varchar(100) DEFAULT NULL,
  `oid` char(32) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`) USING BTREE,
  KEY `FK_t_orderitem_t_order` (`oid`) USING BTREE,
  CONSTRAINT `FK_t_orderitem_t_order` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('01D2DF3E5BB34E9F9D2477180C8D94D3', '1', '18.84', '011', '解忧杂货店', '18.84', 'book_img/011_b.jpg', 'C0841F4DFE7A43BFB183E4E82AE7914C');
INSERT INTO `orderitem` VALUES ('01E58D4FB7964805A1557A5EF2677586', '1', '18.84', '011', '解忧杂货店', '18.84', 'book_img/011_b.jpg', '7B3FA2910C9149829AB1EF3A39C4785F');
INSERT INTO `orderitem` VALUES ('06AD3253E7EA415B828D1299462DE812', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '159B58B3BBCB4069A550BF1A358B4905');
INSERT INTO `orderitem` VALUES ('0844DB419E91407FAE223E3ED6B63707', '1', '23.81', '003', '烟火人间(老舍经典作品精选集纪念珍藏版)', '23.81', 'book_img/003_b.jpg', 'D929BD17AB374B49B61B93AF9A194D1A');
INSERT INTO `orderitem` VALUES ('0F8620EDA20642D1B6CF6D2768086B0A', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'F7E603F5179348B9BC3417B9BFB8558D');
INSERT INTO `orderitem` VALUES ('0F8FCF81AE4D402892AD73C11477B971', '3', '64.17', '030', '嫌疑人X的献身', '21.39', 'book_img/030_b.jpg', '5FB1E131DD294CBBA34FE93228DF2F02');
INSERT INTO `orderitem` VALUES ('0FDE8F9F0C1D4B65AE470BC63783FBF5', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '984468779C164A6098A7FE7EECE9E273');
INSERT INTO `orderitem` VALUES ('10C2D433E7704AC6A0CB74EBDB1B0AEC', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'FAC08EE0DF2C4487A6FA2B11B343307E');
INSERT INTO `orderitem` VALUES ('1B6B185D53AB44798EE74AE33439BB1A', '2', '30.42', '035', '无处停歇', '15.21', 'book_img/035_b.jpg', '96C6D91D916E472681EEC37B1770DE87');
INSERT INTO `orderitem` VALUES ('1BF158F7D2E24DC3AE8AD4748A125F7F', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'E106BFE7029C485D95A124C733BCC539');
INSERT INTO `orderitem` VALUES ('1D529CD78B34458D96D03F9FB9E8DDC5', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'EC3696A4C443494A9B8DD6E8A9B82072');
INSERT INTO `orderitem` VALUES ('1D5352893B8F421CAD3DCCA2623671CA', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '0ADCEE0510844D2697E7A5C0903A8D3B');
INSERT INTO `orderitem` VALUES ('26D125337FB146FD923620A8E7C87556', '1', '24.23', '018', '如父如子', '24.23', 'book_img/018_b.jpg', 'E6EEEB39CECC4089BC65142BADCC4FC3');
INSERT INTO `orderitem` VALUES ('2754A72B64774B03A6FF5E08233D5445', '1', '16.70', '004', '追风筝的人', '16.70', 'book_img/004_b.jpg', 'E891D2A05DA6485EB7E12436E8FB3107');
INSERT INTO `orderitem` VALUES ('2953F9C5BC6F4475AE3AD52B921B6875', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '0FD72F77655D43E2B7989892E965864D');
INSERT INTO `orderitem` VALUES ('2D376E6B7D3245538F91EF1E9337D060', '2', '47.62', '003', '烟火人间(老舍经典作品精选集纪念珍藏版)', '23.81', 'book_img/003_b.jpg', 'C9F3DE2AF9794AECA2D8BA8E41D35989');
INSERT INTO `orderitem` VALUES ('2E3E86265EC34D8F9907F52044AE2DD2', '1', '26.43', '007', '必须找到阿历克斯', '26.43', 'book_img/007_b.jpg', '0FD72F77655D43E2B7989892E965864D');
INSERT INTO `orderitem` VALUES ('2EC79387485D42F699DFAC6CF2CFF26A', '2', '24.16', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'E3A1EB6D0543489F9729B2B5BC5DB365');
INSERT INTO `orderitem` VALUES ('346BFB39E1524650A695DEAD8397F811', '2', '39.20', '001', '罗生门', '19.60', 'book_img/001_b.jpg', 'FAC08EE0DF2C4487A6FA2B11B343307E');
INSERT INTO `orderitem` VALUES ('35B0B801D25845D8B76B61DD3CD5759A', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'B62C7C1BA61C47C4BCEC4BE96897A72C');
INSERT INTO `orderitem` VALUES ('37D26DB2F215411E8BFB761D61769021', '1', '19.32', '028', '月亮与六便士', '19.32', 'book_img/028_b.jpg', 'BE24BB4187B1472AA08E206BF8B0ABF7');
INSERT INTO `orderitem` VALUES ('38132C2B0A8E4A7499A4A00A2C68D342', '1', '24.23', '018', '如父如子', '24.23', 'book_img/018_b.jpg', '148668BE43754CE2B64A0AC999C5A2D5');
INSERT INTO `orderitem` VALUES ('3C585F544A494041AE75375D1CE8F086', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'A2DB4A7B4EA640ADA63F22A7E8311F4B');
INSERT INTO `orderitem` VALUES ('44AF075EF3BD4DBEB55C23C1930CB3B7', '1', '24.23', '018', '如父如子', '24.23', 'book_img/018_b.jpg', '5FB1E131DD294CBBA34FE93228DF2F02');
INSERT INTO `orderitem` VALUES ('4694075EAF544DED9113BD94588B1A58', '4', '75.36', '011', '解忧杂货店', '18.84', 'book_img/011_b.jpg', '98C6731604944BA0BF79C4165B4C8F50');
INSERT INTO `orderitem` VALUES ('49B78C86330547CABA2F7F22B888C94D', '2', '46.64', '019', '使女的故事', '23.32', 'book_img/019_b.jpg', 'A20FAD83E5CF4238912B23E2E8D99606');
INSERT INTO `orderitem` VALUES ('4A53FDF198474C16A0D4028CC9C1532B', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '674878FE6CAB48918DB4A9688262FBD5');
INSERT INTO `orderitem` VALUES ('4FCDAF1C9A9D47F89AA22094B4B1BA13', '1', '15.21', '035', '无处停歇', '15.21', 'book_img/035_b.jpg', '08B28BAC52FF491AB78AC977D5CB6E69');
INSERT INTO `orderitem` VALUES ('50C4D3F0F28A4648BF89BD18C7931B60', '1', '16.70', '004', '追风筝的人', '16.70', 'book_img/004_b.jpg', '058F48DA33694C6D8F5C2C13F3D26CEA');
INSERT INTO `orderitem` VALUES ('55232FEA656A4BDA85C10AF32AE21265', '1', '22.38', '024', '失踪的总统', '22.38', 'book_img/024_b.jpg', '98C6731604944BA0BF79C4165B4C8F50');
INSERT INTO `orderitem` VALUES ('57096D64025847F9A1627E2B6A37564E', '1', '23.32', '019', '使女的故事', '23.32', 'book_img/019_b.jpg', 'EBEDAB71A4DA4C30A39638280A082A79');
INSERT INTO `orderitem` VALUES ('59C13A2A03C448098F20E5DC07B6D1D9', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '6504C742FE65413494E028E714D4D609');
INSERT INTO `orderitem` VALUES ('5AD3850D25D143C6B54FBD84890A15EB', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '148668BE43754CE2B64A0AC999C5A2D5');
INSERT INTO `orderitem` VALUES ('5B17BD28CDAA4E4F98C5AAC48BCEB7BB', '1', '23.81', '003', '烟火人间(老舍经典作品精选集纪念珍藏版)', '23.81', 'book_img/003_b.jpg', '303E12F4821A4B3F9DB97B23947220C7');
INSERT INTO `orderitem` VALUES ('5F6DAEB9C7E64DAB890320C0255B0242', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '0CA1A9B0287C43B2AA9435F11F237E9B');
INSERT INTO `orderitem` VALUES ('65CFB83DF1CC4052B0D6657D2B444188', '1', '16.70', '004', '追风筝的人', '16.70', 'book_img/004_b.jpg', 'B69C6849120D4B28A6CCF99351B88575');
INSERT INTO `orderitem` VALUES ('6F4239EBB3D84A29911AEF08B16C4B78', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '0A1F4C5BDE754277B984D1E7E763051D');
INSERT INTO `orderitem` VALUES ('79A5CCB6ED5E4ABBA2ADCD9E93103302', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '32739173C1E247558358B1A8FE9FE012');
INSERT INTO `orderitem` VALUES ('7D35B85D027148ABBD9EBF560C3A912F', '1', '21.74', '008', '云边有个小卖部', '21.74', 'book_img/008_b.jpg', '08B28BAC52FF491AB78AC977D5CB6E69');
INSERT INTO `orderitem` VALUES ('7D8C796483A548108E0845FECB651599', '1', '23.81', '003', '烟火人间(老舍经典作品精选集纪念珍藏版)', '23.81', 'book_img/003_b.jpg', 'EB96C305ECF04E0793675F5A3F8AB20F');
INSERT INTO `orderitem` VALUES ('80764A7FDE044EFF969B7960AD95BC50', '1', '24.02', '034', '本源', '24.02', 'book_img/034_b.jpg', '08B28BAC52FF491AB78AC977D5CB6E69');
INSERT INTO `orderitem` VALUES ('85DA1674B58C450291901E923B13B53C', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'DD5135AEDA2E464BAF52DEC4727E2A3D');
INSERT INTO `orderitem` VALUES ('87BE2F926AF5401595CECDF656752E96', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '0CD9939DC9AE4DA2A12F772293F55A4B');
INSERT INTO `orderitem` VALUES ('882D2D4A06B645AC9DE56B60622EC4E8', '1', '23.81', '003', '烟火人间(老舍经典作品精选集纪念珍藏版)', '23.81', 'book_img/003_b.jpg', '553AFF48D76A48AD89ED3FE8F7E2F587');
INSERT INTO `orderitem` VALUES ('8BEA49FAE0924D05BD5903325BFB4E0A', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'CE537015382640E1AE15B9A8FD08B9EE');
INSERT INTO `orderitem` VALUES ('8C75EAC8C39845FE8D7540F208D31F86', '1', '24.23', '018', '如父如子', '24.23', 'book_img/018_b.jpg', 'A2DB4A7B4EA640ADA63F22A7E8311F4B');
INSERT INTO `orderitem` VALUES ('8ECC3B67784F45F2BF92E285093FA41A', '2', '30.42', '035', '无处停歇', '15.21', 'book_img/035_b.jpg', 'ED3A585E4CB2442A9D940C65A70004E6');
INSERT INTO `orderitem` VALUES ('914175F8FB55422BB407DD0AC9DB3D63', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'F64FD5E198BB4114AB091034C5C6D8B7');
INSERT INTO `orderitem` VALUES ('93069308B4C04E16A9D1EE7B8EFEEBA6', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '57856B1A295B437CA0F7991540897B47');
INSERT INTO `orderitem` VALUES ('942BE069B7B345BAA5D4FE19E2D87C12', '2', '48.46', '018', '如父如子', '24.23', 'book_img/018_b.jpg', 'B69C6849120D4B28A6CCF99351B88575');
INSERT INTO `orderitem` VALUES ('9979731BC91D43B690E8ECD51DCC0F77', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '7237A47B1B5B4A78822D662AE01671B6');
INSERT INTO `orderitem` VALUES ('A00770D667394EAD9DC8599FA025046C', '1', '21.74', '008', '云边有个小卖部', '21.74', 'book_img/008_b.jpg', 'EE1F00D88FDC44BD966AF05C1F7FABE0');
INSERT INTO `orderitem` VALUES ('A12B5835A2AA416491E59A1F470B03DF', '1', '16.70', '004', '追风筝的人', '16.70', 'book_img/004_b.jpg', '5668668DAB1F4406819D37881BC5D5B1');
INSERT INTO `orderitem` VALUES ('A4938F10E31243FCBEDDBF762F887F12', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'C6F8379F9E3E4F8381763B54E5BF986C');
INSERT INTO `orderitem` VALUES ('A5CA013362854C7FBF1267670DDA659A', '3', '64.17', '030', '嫌疑人X的献身', '21.39', 'book_img/030_b.jpg', 'B69C6849120D4B28A6CCF99351B88575');
INSERT INTO `orderitem` VALUES ('A9FFF01E6D2E4E699B5F76D3E3C1FF68', '1', '23.32', '019', '使女的故事', '23.32', 'book_img/019_b.jpg', '744110B92B4F476EA5FDCD752E60DDEB');
INSERT INTO `orderitem` VALUES ('AA2BC081EBFE40D889671C95A8B63A66', '1', '20.67', '005', '高兴死了!!!', '20.67', 'book_img/005_b.jpg', 'E6EEEB39CECC4089BC65142BADCC4FC3');
INSERT INTO `orderitem` VALUES ('B57029A4B38C48619E951EA3AAA62B5D', '1', '19.78', '002', '局外人(诺贝尔文学奖60周年纪念版)', '19.78', 'book_img/002_b.jpg', 'E891D2A05DA6485EB7E12436E8FB3107');
INSERT INTO `orderitem` VALUES ('B93CD7AC6B3C4044AE8186279C33803B', '1', '28.37', '020', '忏悔录', '28.37', 'book_img/020_b.jpg', '553AFF48D76A48AD89ED3FE8F7E2F587');
INSERT INTO `orderitem` VALUES ('C01A7D87FC924BAD8D3A4255BE415D14', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '7858221EA1DF4B318A632A9C1CD3E1F7');
INSERT INTO `orderitem` VALUES ('C08547828C9445648F049ABC6127768D', '1', '24.23', '018', '如父如子', '24.23', 'book_img/018_b.jpg', 'E3A1EB6D0543489F9729B2B5BC5DB365');
INSERT INTO `orderitem` VALUES ('C2DC9CDECD724065A6ABE92C693B4F75', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'ECB47FBA81F64751B7AC89CCB8DDFD09');
INSERT INTO `orderitem` VALUES ('C3575A8B7DED44B3937237DD6795FD46', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '6C921E50C3E54EA0AFD8CC4B661963AD');
INSERT INTO `orderitem` VALUES ('C4B479673E0E454580A3B47747B954E7', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '5FB1E131DD294CBBA34FE93228DF2F02');
INSERT INTO `orderitem` VALUES ('C588A712ADFD4D8282A328E49CBD01FB', '1', '24.23', '018', '如父如子', '24.23', 'book_img/018_b.jpg', 'BDB995AF80D34716ABB9D10CB6962F87');
INSERT INTO `orderitem` VALUES ('D544F15EEE69445B9BD10FF04253896E', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '9E1C0A9FDF1F49B18FA0BFA33E132BDD');
INSERT INTO `orderitem` VALUES ('D7D546DB926B4FA9805524752279F923', '1', '22.38', '024', '失踪的总统', '22.38', 'book_img/024_b.jpg', '8BB662E4C0444BC88F1DBE82584595BC');
INSERT INTO `orderitem` VALUES ('DCD8DB735DE44894B30D142E6228BD89', '1', '23.81', '003', '烟火人间(老舍经典作品精选集纪念珍藏版)', '23.81', 'book_img/003_b.jpg', 'A20FAD83E5CF4238912B23E2E8D99606');
INSERT INTO `orderitem` VALUES ('E1FDF0B54C4741639C5A9E33A0923177', '1', '15.21', '035', '无处停歇', '15.21', 'book_img/035_b.jpg', 'BD1BD9AB58B1413FA0BDC0AACCC8C65F');
INSERT INTO `orderitem` VALUES ('E27C5B203B7D49289FB471103037B4CD', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '971D4105466745E7B29CA1023BD900D3');
INSERT INTO `orderitem` VALUES ('E35724F886094E5AB2076A690EC28917', '1', '21.74', '008', '云边有个小卖部', '21.74', 'book_img/008_b.jpg', '59A15DD3A0704508B1C2BC9B682A329F');
INSERT INTO `orderitem` VALUES ('ED5722353C0A4F15A11B28A5A9B2745A', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '57197A448F9A4F15B76B1ED1EB3A15E6');
INSERT INTO `orderitem` VALUES ('EE61A6CCC02148F68DF99293F2EEE88F', '1', '21.39', '030', '嫌疑人X的献身', '21.39', 'book_img/030_b.jpg', '673170D78D9D4EE6AE083167CFB81C1A');
INSERT INTO `orderitem` VALUES ('EFCAF77235D94975A095027562F643C5', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'BB7789E41C524030832B7E5E426633E7');
INSERT INTO `orderitem` VALUES ('F1C3FC9D6AAE406ABA251689B8ACC291', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', 'C34F025EF6BB4B88A8409B00A0ABC891');
INSERT INTO `orderitem` VALUES ('F5A6C0D585ED4126B51A4296CBD95237', '1', '23.32', '019', '使女的故事', '23.32', 'book_img/019_b.jpg', '55FCBF5960BE4BE8B592CC86C3EE6156');
INSERT INTO `orderitem` VALUES ('F5AFF80B998D4FF7A3DB9CDFE798D0B0', '2', '44.86', '009', '伤心咖啡馆之歌（2018作家榜未删减插图珍藏版', '22.43', 'book_img/009_b.jpg', '2632C6F9B447419A9A5CA29445FBF04D');
INSERT INTO `orderitem` VALUES ('F7074572D71A454097B9019B7D5897FA', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '161A05BEBBAA468199131EAD175CCFEA');
INSERT INTO `orderitem` VALUES ('F84DB5D9AD0441FE81A52DCCCAC0EEA1', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '2AFD7DC9619548BA8727464D77AFB9C2');
INSERT INTO `orderitem` VALUES ('F9AD99717BDF4DD481FF35CC2A11B2D3', '1', '12.08', '010', '岛上书店', '12.08', 'book_img/010_b.jpg', '0B657B624D8D4B919B7E5F175AA90530');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` char(32) NOT NULL,
  `loginname` varchar(50) DEFAULT NULL,
  `loginpass` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `activationCode` char(64) DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `loginname` (`loginname`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1EECB65A5F7F4D188AE99492AC1F307D', 'John', '1234567', '123456@qq.com', '1', 'A1C3977D6FCA443F9CE5E4C131B7C7E93E47109068DA4C2894A078CEC420B4B2');
INSERT INTO `user` VALUES ('26FA1CF7F0D8441393F0E544116F523B', '王老五', '123', '1232@qq.com', '1', '919C089D7E034A38AFA9775A1D4FF1E41AEA74C45AA14FD7BCAB81870287762E');
INSERT INTO `user` VALUES ('32DB3700D2564254982BC58B0E4D95BC', 'xzf', '111', 'fgfdg@126.com', '1', '15682E9C4D2849E2AB5D8AFF55D2F7BA87126B0EF55A45C6A136E3CAA90D60F2');
INSERT INTO `user` VALUES ('4DE7E4D829A54D4FAB150B7451407198', 'fzz', '111', 'wqrwq@soh.com', '1', 'D00FAA82457748FF8C1B912042E615B39F3602053E154181B98CDD48D9ECFC96');
INSERT INTO `user` VALUES ('531D8A16D524478D86F8A115FE95D93F', 'czn', '111', 'fafw@163.com', '1', 'FCF142D04C4A420992FF4E7BAC92C1E58AF905F1A46B4818BB455BD925E52DDD');
INSERT INTO `user` VALUES ('55790D9C1A1845738E6D93866A148C7E', 'dwq', '123', 'rterf@sina.com', '1', '659903B3D5FF4576B82425A593962DFE64B6137EBE934AE5AE19F614E71F4549');
