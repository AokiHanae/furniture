/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2020-06-11 22:03:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `total` varchar(255) DEFAULT NULL COMMENT '总价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='购物车表';

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '58', '14', '1', '204.00', '204.0');
INSERT INTO `car` VALUES ('4', '74', '12', '1', '129.00', '129.0');
INSERT INTO `car` VALUES ('5', '66', '14', '1', '152.00', '152.0');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `item_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `content` varchar(255) DEFAULT NULL COMMENT '评价内容',
  `addTime` datetime DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='评价表';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('7', '3', '35', null, '真的很不错', '2018-03-20 19:23:03');
INSERT INTO `comment` VALUES ('8', '3', '28', null, '真好吃', '2018-03-20 19:32:31');
INSERT INTO `comment` VALUES ('9', '3', '27', null, '很不错', '2019-05-11 11:31:06');
INSERT INTO `comment` VALUES ('10', '3', '27', null, '很不错', '2019-05-11 11:31:18');
INSERT INTO `comment` VALUES ('11', '3', '27', null, '很不错', '2019-05-11 11:44:49');
INSERT INTO `comment` VALUES ('12', '3', '32', '28', '很不错', '2019-05-11 15:18:06');
INSERT INTO `comment` VALUES ('13', '3', '28', '32', '很不错', '2019-05-11 15:26:21');
INSERT INTO `comment` VALUES ('14', '3', '28', '32', '很不错', '2019-05-11 15:26:42');
INSERT INTO `comment` VALUES ('15', '3', '28', '32', '很不错', '2019-05-11 15:29:15');
INSERT INTO `comment` VALUES ('16', '3', '28', '32', '很不错', '2019-05-11 15:33:02');
INSERT INTO `comment` VALUES ('17', '3', '35', null, '很不错', '2019-05-11 15:43:21');
INSERT INTO `comment` VALUES ('18', '3', '30', '30', '很不错', '2019-05-11 15:53:12');
INSERT INTO `comment` VALUES ('19', '3', '36', '29', '很不错', '2019-05-11 15:53:28');
INSERT INTO `comment` VALUES ('20', '9', '51', '41', '很喜欢哦', '2020-03-10 10:03:47');
INSERT INTO `comment` VALUES ('21', '9', '48', '42', '很喜欢哦', '2020-05-04 17:43:26');
INSERT INTO `comment` VALUES ('22', '12', '56', '44', '鬼泣4帅帅帅', '2020-05-16 21:40:07');
INSERT INTO `comment` VALUES ('23', '12', '58', '45', '不错', '2020-05-16 21:41:56');
INSERT INTO `comment` VALUES ('24', '13', '61', '46', '蒂法我老婆', '2020-05-16 22:17:02');
INSERT INTO `comment` VALUES ('25', '13', '62', '47', '王子我老公！', '2020-05-16 22:17:13');
INSERT INTO `comment` VALUES ('26', '13', '70', '48', ' 一玩就是一整天。', '2020-05-16 23:10:17');
INSERT INTO `comment` VALUES ('27', '14', '74', '49', '不错', '2020-05-16 23:20:51');
INSERT INTO `comment` VALUES ('28', '12', '60', '50', '太刀天下第一', '2020-05-18 23:43:10');
INSERT INTO `comment` VALUES ('29', '12', '59', '51', 'tinghao', '2020-05-20 00:27:45');
INSERT INTO `comment` VALUES ('30', '12', '72', '52', '好玩', '2020-05-20 00:32:06');
INSERT INTO `comment` VALUES ('31', '15', '72', '53', '好玩', '2020-05-20 00:36:31');
INSERT INTO `comment` VALUES ('32', '17', '58', '55', 'henhaowan', '2020-05-20 08:49:31');
INSERT INTO `comment` VALUES ('33', '14', '70', '57', ' 一玩就是一整天。', '2020-05-28 02:05:57');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `price` varchar(255) DEFAULT NULL COMMENT '价格',
  `scNum` int(11) DEFAULT NULL COMMENT '收藏数',
  `gmNum` int(11) DEFAULT NULL COMMENT '购买数',
  `url1` varchar(255) DEFAULT NULL COMMENT '主图1',
  `url2` varchar(255) DEFAULT NULL COMMENT '主图2',
  `url3` varchar(255) DEFAULT NULL COMMENT '主图3',
  `url4` varchar(255) DEFAULT NULL COMMENT '主图4',
  `url5` varchar(255) DEFAULT NULL COMMENT '主图5',
  `ms` text,
  `pam1` varchar(255) DEFAULT NULL COMMENT '参数1',
  `pam2` varchar(255) DEFAULT NULL COMMENT '参数2',
  `pam3` varchar(255) DEFAULT NULL COMMENT '参数3',
  `val3` varchar(255) DEFAULT NULL COMMENT '值3',
  `val2` varchar(255) DEFAULT NULL COMMENT '值2',
  `val1` varchar(255) DEFAULT NULL COMMENT '值1',
  `type` int(11) DEFAULT NULL,
  `zk` int(10) DEFAULT NULL COMMENT '折扣',
  `category_id_one` int(11) DEFAULT NULL COMMENT '一级类别id',
  `category_id_two` int(11) DEFAULT NULL COMMENT '类别2级',
  `isDelete` int(2) DEFAULT NULL COMMENT '是否删除：0否 1是',
  `stock` int(5) DEFAULT NULL COMMENT '库存数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('56', '鬼泣5', '271', '0', '1', '\\upload\\278c82c0977111ead1c782cfbc5cf4e9鬼泣3.jpg', '\\upload\\278cd0e0977111ead1c782cfbc5cf4e9鬼泣1.jpg', '\\upload\\278ea5a0977111ead1c782cfbc5cf4e9鬼泣2.jpg', '\\upload\\278eccb0977111ead1c782cfbc5cf4e9鬼泣4.jpg', '\\upload\\278ef3c0977111ead1c782cfbc5cf4e9鬼泣.jpg', '<p>《鬼泣5》是由日本<a target=\"_blank\" href=\"https://baike.baidu.com/item/CAPCOM\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">CAPCOM</a>开发的一款动作冒险游戏，该作是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%AC%BC%E6%B3%A3/24368\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">鬼泣</a>》系列第六部，且是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%AC%BC%E6%B3%A34/3486754\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">鬼泣4</a>》的正统续作，故事发生在《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%AC%BC%E6%B3%A34/3486754\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">鬼泣4</a>》之后，于2019年3月8日发售，登陆PC、PS4和XBOX One平台。</p><p>游戏剧情设定为城市出现大批恶魔，玩家需要扮演游戏角色参与对抗。游戏采用Capcom内部专有的RE引擎开发，使得游戏在图形保真度方面达到了全新的高度。</p><p><br/></p>', null, null, null, null, null, null, null, '10', '95', '99', '0', '998');
INSERT INTO `item` VALUES ('57', '鬼泣4', '128', '0', '1', '/upload/e5a42ff0977211ea629d4ccbf09832d5a686c9177f3e67090cbd801e33c79f3df9dc5596.jpg', '/upload/e5a47e10977211ea629d4ccbf09832d5562c11dfa9ec8a13b2b83302ff03918fa1ecc0b6.jpg', '/upload/e5a4a520977211ea629d4ccbf09832d58601a18b87d6277f26cd51d220381f30e824fc79.jpg', '/upload/e5a4f340977211ea629d4ccbf09832d5cb8065380cd791237201dcc8a5345982b3b780ad.jpg', '/upload/e5a56870977211ea629d4ccbf09832d52fdda3cc7cd98d10203468d3293fb80e7aec906b.jpg', '<p>《鬼泣4》是由日本游戏开发商<a target=\"_blank\" href=\"https://baike.baidu.com/item/CAPCOM\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">CAPCOM</a>开发的一款动作冒险游戏，是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%AC%BC%E6%B3%A3/24368\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">鬼泣</a>》系列的第四部作品，于2008年1月31日发行。</p><p>该游戏的剧情发生在《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%AC%BC%E6%B3%A32/560945\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">鬼泣2</a>》之后与《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%AC%BC%E6%B3%A35/10364244\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">鬼泣5</a>》之前，玩家将跟随主角<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B0%BC%E7%A6%84/13010611\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">尼禄</a>经历冒险并揭露教皇的阴谋。</p><p><br/></p>', null, null, null, null, null, null, null, '7', '95', '99', '0', '998');
INSERT INTO `item` VALUES ('58', '尼尔机械纪元', '408', '2', '2', '/upload/bd1effa0977311ea629d4ccbf09832d5尼尔.jpg', '/upload/bd1f26b0977311ea629d4ccbf09832d5尼尔1.jpg', '/upload/bd1f4dc0977311ea629d4ccbf09832d5尼尔2.jpg', '/upload/bd1f74d0977311ea629d4ccbf09832d5尼尔3.jpg', '/upload/bd1fc2f0977311ea629d4ccbf09832d5尼尔4.jpg', '<p>《尼尔：机械纪元》是由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%B2%E5%85%8B%E5%A8%81%E5%B0%94%E8%89%BE%E5%B0%BC%E5%85%8B%E6%96%AF/133643\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">史克威尔艾尼克斯</a>与<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%99%BD%E9%87%91%E5%B7%A5%E4%BD%9C%E5%AE%A4/3832183\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">白金工作室</a>双方联合开发的M级动作冒险游戏，为《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B0%BC%E5%B0%94%EF%BC%9A%E4%BC%AA%E8%A3%85%E8%80%85/17394329\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">尼尔：伪装者</a>》和《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B0%BC%E5%B0%94%EF%BC%9A%E5%AE%8C%E5%85%A8%E5%BD%A2%E6%80%81/15105631\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">尼尔：完全形态</a>》的续作。</p><p>《尼尔：机械纪元》于2016年12月22日在日本地区开放发售预订，由Square Enix发行<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;</span>。该作Demo于2016年12月22日登陆北美和欧洲市场<em>（上线PS4平台）</em>，完整版在2017年2月23日于日本首发，登陆的平台为PlayStation 4，PC端延迟至3月17日发售<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[2]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;，并上架Steam商店&nbsp;，其中，中国区于4月27日解锁。</p><p>《尼尔：机械纪元》游戏官方于2017年5月31日宣布，至该日游戏全球出货量和数字版销量已突破150万，游戏的PC版中，中国区销量占到了12.68%，国区玩家比例则是19.94%，均排在第二位，国区玩家约在7万人左右。</p><p>《尼尔：机械纪元》故事发生在和前作相同的世界，重新设立一个全新的故事剧情，和1代几乎没有关联<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[6]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;，剧情与《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%BE%99%E8%83%8C%E4%B8%8A%E7%9A%84%E9%AA%91%E5%85%B53/8037960\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">龙背上的骑兵3</a>》有关联&nbsp;。</p><p><br/></p>', null, null, null, null, null, null, null, '5', '95', '100', '0', '997');
INSERT INTO `item` VALUES ('59', '怪物猎人世界', '208', '0', '1', '/upload/6db79610977411ea629d4ccbf09832d5怪物猎人世界.jpg', '/upload/6db7bd20977411ea629d4ccbf09832d5怪物猎人世界1.jpg', '/upload/6db7e430977411ea629d4ccbf09832d5怪物猎人世界2.jpg', '/upload/6dbb1880977411ea629d4ccbf09832d5怪物猎人世界3.jpg', '/upload/6dbb3f90977411ea629d4ccbf09832d5怪物猎人世界.jpg', '<p>《怪物猎人：世界》<em>（モンスターハンターワールド）</em>是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%A1%E6%99%AE%E7%A9%BA\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">卡普空</a>采用<a target=\"_blank\" href=\"https://baike.baidu.com/item/MT%20Framework\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">MT Framework</a>引擎开发制作达四年之久的第三人称角色扮演类动作游戏<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;</span>。</p><p>2018年8月13日，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%85%BE%E8%AE%AF/112204\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">腾讯</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/Wegame/20629146\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Wegame</a>发布公告，称“因<a target=\"_blank\" href=\"https://baike.baidu.com/item/WeGame/20629146\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">WeGame</a>平台发行的该作部分游戏内容未完全符合政策法规要求”，相关政府管理部门接到大量举报，该游戏相应运营资质文件现在已被取消。应主管部门要求，现执行下架整改，停止游戏售卖。</p><p><br/></p>', null, null, null, null, null, null, null, '9', '95', '106', '0', '998');
INSERT INTO `item` VALUES ('60', '怪物猎人X', '100', '0', '1', '/upload/cb4eefd0977411ea629d4ccbf09832d5怪物猎人X1.jpg', '/upload/cb4f3df0977411ea629d4ccbf09832d5怪物猎人X.jpg', '/upload/cb4f6500977411ea629d4ccbf09832d5怪物猎人X2.jpg', '/upload/cb4f8c10977411ea629d4ccbf09832d5怪物猎人X3.jpg', '/upload/cb4fb320977411ea629d4ccbf09832d5怪物猎人X4.jpg', '<p><span style=\"font-weight: 700;\">怪物猎人X</span>是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%A1%E6%99%AE%E7%A9%BA\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">卡普空</a>公司开发的<a target=\"_blank\" href=\"https://baike.baidu.com/item/3DS\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">3DS</a>怪物猎人正统续作，游戏于2015年冬季发布为<a target=\"_blank\" href=\"https://baike.baidu.com/item/3DS\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">3DS</a>独占。怪物猎人P3制作人小岛慎太郎创作。&nbsp;采用了《怪物猎人3G、4、4G》的引擎，拥有类似怪物猎人边境系列的气派动作。<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[1]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;游戏以全新的狩技和狩猎风格为核心内容，玩家可将狩猎风格与狩技组合，打造独特的战斗方式，这就是游戏起名为Cross的意义。</p><p>游戏于8月1日起正式接受预约。《怪物猎人X》两天内实体版销量突破150万套，达154.2万套。&nbsp;数字版首周50万。本作出货量在销售后不到一个月时间内突破300万套，CAPCOM早前的财报预计在新财年度怪物猎人X达250万套销量，这次出货量突破300万套，提前了3个月超量完成了目标。</p><p>2016-10-27 卡普空宣布，《怪物猎人X》在全球总销量突破410万。<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[5]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;在10月27日举行的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BB%BB%E5%A4%A9%E5%A0%82%E7%9B%B4%E9%9D%A2%E4%BC%9A/16006595\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">任天堂直面会</a>怪物猎人专场上，卡普空公布了系列<a target=\"_blank\" href=\"https://baike.baidu.com/item/3DS\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">3DS</a>新作《怪物猎人XX》。</p><p><br/></p>', null, null, null, null, null, null, null, '7', '95', '106', '0', '998');
INSERT INTO `item` VALUES ('61', '最终幻想7重制版', '258', '0', '1', '/upload/401139e0977511ea629d4ccbf09832d5最终幻想7重制版.png', '/upload/4011af10977511ea629d4ccbf09832d5最终幻想7重制版1.jpg', '/upload/4011fd30977511ea629d4ccbf09832d5最终幻想7重制版2.jpg', '/upload/40122440977511ea629d4ccbf09832d5最终幻想7重制版3.jpg', '/upload/40127260977511ea629d4ccbf09832d5最终幻想7重制版4.jpg', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">《最终幻想7重制版》是由Square Enix基于经典的《</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%80%E7%BB%88%E5%B9%BB%E6%83%B37/7509169\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">最终幻想7</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">》所进行的的完全重制版，但并非对原作的 1 比 1 复刻。除了次世代主机带来的画面革新外，游戏战斗风格也更加偏向于“动作”，</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%85%8B%E5%8A%B3%E5%BE%B7/66997\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">克劳德</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">的突刺颇似《</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%80%E7%BB%88%E5%B9%BB%E6%83%B315/2220974\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">最终幻想15</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">》里</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%AF%BA%E5%85%8B%E6%8F%90%E6%96%AF/5722105\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">诺克提斯</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">的长枪突刺，整个游戏的游戏系统可以理解为半即时遭遇战斗模式，其最大的特色是通过积攒ATB槽进行与回合制相仿的技能攻击。由于没有了战斗进场与结算镜头，因此使整个游戏的推动变得尤为顺滑，希望可以给玩家带来更爽快的砍杀体验。</span></p>', null, null, null, null, null, null, null, '10', '92', '102', '0', '998');
INSERT INTO `item` VALUES ('62', '最终幻想XV', '238', '0', '1', '/upload/524f1130977611eadbd874610c769759最终幻想XV.jpg', '/upload/524f5f50977611eadbd874610c769759最终幻想XV1.jpg', '/upload/524fad70977611eadbd874610c769759最终幻想XV2.png', '/upload/524fd480977611eadbd874610c769759最终幻想XV3.png', '/upload/524ffb90977611eadbd874610c769759最终幻想XV4.png', '<p>《最终幻想XV》<em>（Final Fantasy XV，简称：FFXV、FF15）</em>是由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%B2%E5%85%8B%E5%A8%81%E5%B0%94%E8%89%BE%E5%B0%BC%E5%85%8B%E6%96%AF/133643\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">史克威尔艾尼克斯</a>开发制作的动作角色扮演类游戏，于2015年3月17日发行了试玩版。</p><p>该作品支持<a target=\"_blank\" href=\"https://baike.baidu.com/item/PS4\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">PS4</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/Xbox%20One/4728387\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Xbox One</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/PC/107\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">PC</a>，是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%80%E7%BB%88%E5%B9%BB%E6%83%B3/74508\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">最终幻想</a>》系列、《FABULA NOVA CRYSTALLIS FINAL FANTASY》系列之一。</p><p>该作是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%80%E7%BB%88%E5%B9%BB%E6%83%B3/74508\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">最终幻想</a>》系列的第15部正传作品，剧情集中在试图争夺水晶的战争国家的入侵，表现了广阔的世界，和伙伴们一起去看看的旅行。<a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a></p><p>《最终幻想XV》获得2017年<a target=\"_blank\" href=\"https://baike.baidu.com/item/TGS/32813\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">TGS</a>日本游戏大赏优秀奖。</p><p><br/></p>', null, null, null, null, null, null, null, '9', '92', '102', '0', '998');
INSERT INTO `item` VALUES ('63', '最终幻想XIII', '200', '0', '0', '/upload/aeca04d0977e11ea5989a72aebfc2015最终幻想XIII.jpg', '/upload/aeca52f0977e11ea5989a72aebfc2015最终幻想XIII1.jpg', '/upload/aeca7a00977e11ea5989a72aebfc2015最终幻想XIII2.jpg', '/upload/aecd3920977e11ea5989a72aebfc2015最终幻想XIII3.jpg', '/upload/aecd6030977e11ea5989a72aebfc2015最终幻想XIII4.jpg', '<p>《最终幻想XIII》是由<a target=\"_blank\" href=\"https://baike.baidu.com/item/SQUARE-ENIX/3237812\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">SQUARE-ENIX</a>公司于2009年推出的多平台<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%A7%92%E8%89%B2%E6%89%AE%E6%BC%94%E6%B8%B8%E6%88%8F/1730573\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">角色扮演游戏</a>，是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%80%E7%BB%88%E5%B9%BB%E6%83%B3/74508\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">最终幻想</a>》系列作品的第十三作。</p><div class=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 28px; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"></div><p>游戏讲述了玩家扮演的埃克莱尔等人，为了拯救世界展开冒险的故事。</p><p><br/></p>', null, null, null, null, null, null, null, '8', '92', '102', '0', '999');
INSERT INTO `item` VALUES ('64', '最终幻想XII', '198', '0', '0', '/upload/f29b1800978011ea95b499dbc19d2de8最终幻想XII.jpg', '/upload/f29b6620978011ea95b499dbc19d2de8最终幻想XII1.jpg', '/upload/f29bb440978011ea95b499dbc19d2de8最终幻想XII2.jpg', '/upload/f29c0260978011ea95b499dbc19d2de8最终幻想XII2.jpg', '/upload/f29c5080978011ea95b499dbc19d2de8最终幻想XII4.jpg', '<p>《最终幻想XII》是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%B2%E5%85%8B%E5%A8%81%E5%B0%94%E8%89%BE%E5%B0%BC%E5%85%8B%E6%96%AF/133643\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">史克威尔艾尼克斯</a>公司为<a target=\"_blank\" href=\"https://baike.baidu.com/item/PlayStation%202\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">PlayStation 2</a>开发的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%A7%92%E8%89%B2%E6%89%AE%E6%BC%94%E6%B8%B8%E6%88%8F/1730573\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">角色扮演游戏</a>。该作是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9C%80%E7%BB%88%E5%B9%BB%E6%83%B3/74508\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">最终幻想</a>》系列的第12部正传，于2006年发行。该作高清复刻版于2017年7月在PlayStation 4平台发售，并有支持繁体和简体的中文版。</p><p>游戏中玩家将扮演主角，带领队员们共同反抗阿尔卡迪亚帝国的暴行。</p><p><br/></p>', null, null, null, null, null, null, null, '7', '92', '102', '0', '999');
INSERT INTO `item` VALUES ('65', '战神4', '240', '0', '0', '/upload/45761290978211ea95b499dbc19d2de8战神4.jpg', '/upload/457687c0978211ea95b499dbc19d2de8战神42.png', '/upload/4576aed0978211ea95b499dbc19d2de8战神43.png', '/upload/4576d5e0978211ea95b499dbc19d2de8战神44.png', '/upload/4576fcf0978211ea95b499dbc19d2de8战神4.jpg', '<p>《战神》<em>（God Of War）</em>是一款由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%B4%A2%E5%B0%BC/999090\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">索尼</a>旗下圣莫尼卡工作室制作的，PlayStation®4平台独占的第三人称动作角色扮演游戏，于2018年4月20日由索尼互动娱乐发行。该作是《战神》系列的重启之作。</p><p>该作对主角克雷多斯来讲，这也是一个史诗级新篇章的开始。他将摆脱神的影子，作为普通人隐居北欧神话的新大陆，为了他的儿子以及新目标，克雷多斯必须为生存而战斗，对抗威胁他全新人生的强大敌人。</p><p>该作于2018年12月7日获TGA 2018年度最佳游戏、最佳动作冒险游戏、最佳游戏指导&nbsp;；2018年12月22日获IGN 2018年度最佳游戏<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;</span>&nbsp;；2019年2月获D.I.C.E年度最佳游戏&nbsp;、第七十一届美国编剧工会奖年度最佳游戏剧本<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;；2019年3月获GDC年度最佳游戏<a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;；2019年4月获第十五届英国电影和电视学院奖最佳游戏等<a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;。</p><p><br/></p>', null, null, null, null, null, null, null, '10', '92', '101', '0', '999');
INSERT INTO `item` VALUES ('66', '战神3', '190', '0', '0', '/upload/7c580f70978211ea95b499dbc19d2de8战神3.png', '/upload/7c583680978211ea95b499dbc19d2de8战神31.jpg', '/upload/7c585d90978211ea95b499dbc19d2de8战神32.jpg', '/upload/7c5884a0978211ea95b499dbc19d2de8战神33.png', '/upload/7c58abb0978211ea95b499dbc19d2de8战神34.png', '<p>《战神3》是<a target=\"_blank\" href=\"https://baike.baidu.com/item/SCEA\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">SCEA</a>开发并于2010年3月16日发行的<a target=\"_blank\" href=\"https://baike.baidu.com/item/ACT\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">ACT</a>动作冒险游戏，也是该系列登陆<a target=\"_blank\" href=\"https://baike.baidu.com/item/PS3\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">PS3</a>主机的首款作品。是“战神”系列中的第五部，第七部按时间顺序排列，以及2007年“战神2”的续集。这个游戏以希腊神话为基础，以复仇为中心，以古希腊为背景。玩家控制主角战神奎托斯，在他背叛了他的父亲宙斯，奥海王之王的手中。奎托斯重新点燃大战，登上奥林匹斯山，直到被泰坦盖亚遗弃。在雅典娜的精神指导下，奎托斯与怪物，神灵和泰坦们一起寻找潘多拉，没有他们就无法打开潘多拉盒子，击败宙斯，结束奥林匹亚众神的统治。</p><p>它在2012年6月前在全球销售了近520万份，并被纳入2012年8月28日发布的PS3“《战神:传说》”中。</p><p>为纪念战神的特许经营十周年，战神3的修复版，名为《战神3重制版》于2015年7月14日在PS4上发布。</p><p><br/></p>', null, null, null, null, null, null, null, '8', '92', '101', '0', '999');
INSERT INTO `item` VALUES ('67', '文明6', '120', '0', '2', '/upload/c968c250978211ea95b499dbc19d2de8文明6.jpg', '/upload/c968e960978211ea95b499dbc19d2de8文明61.jpg', '/upload/c9691070978211ea95b499dbc19d2de8文明62.jpg', '/upload/c9691071978211ea95b499dbc19d2de8文明63.jpg', '/upload/c9693780978211ea95b499dbc19d2de8文明64.jpg', '<p>《文明6》是Firaxis Games开发，<a target=\"_blank\" href=\"https://baike.baidu.com/item/2K%20Games\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">2K Games</a>发行的历史策略回合制游戏，于2016年10月21日发行PC版本，2018年11月16日登陆<a target=\"_blank\" href=\"https://baike.baidu.com/item/Switch/20233079\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Switch</a>平台，2019年11月22日发布了<a target=\"_blank\" href=\"https://baike.baidu.com/item/XboxOne/4754978\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">XboxOne</a>、PS4版本。该游戏是游戏设计师<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B8%AD%E5%BE%B7%C2%B7%E6%A2%85%E5%B0%94/317646\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">席德·梅尔</a>创作的《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%96%87%E6%98%8E/1580931\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">文明</a>》系列第6部。</p><p>游戏中玩家建立起一个帝国，并接受时间的考验。玩家将创建及带领自己的文明从石器时代迈向信息时代，并成为世界的领导者。在尝试建立起世界上赫赫有名的伟大文明的过程中，玩家将启动战争、实行外交、促进文化，同时正面对抗历史上的众多领袖。</p><p><br/></p>', null, null, null, null, null, null, null, '10', '89', '103', '0', '997');
INSERT INTO `item` VALUES ('68', '文明5', '115', '0', '0', '/upload/7025e3b0978411ea95b499dbc19d2de8文明5.jpg', '/upload/70293f10978411ea95b499dbc19d2de8文明51.png', '/upload/70298d30978411ea95b499dbc19d2de8文明52.jpg', '/upload/7029b440978411ea95b499dbc19d2de8文明53.jpg', '/upload/7029db50978411ea95b499dbc19d2de8文明54.jpg', '<p>《文明5》是Firaxis Games开发，2K发行的一款历史策略回合制游戏，在2010年9月推出Demo试玩，与2010年9月21号在北美地区发布，2010年9月24日开启全球发售。</p><p>玩家需要建立和领导人类文明进入太空时代，成为世界的统治者：发动战争，进行外交，发现新技术，与一些历史上最伟大的领导人面对面，建立世界上最强大的帝国。</p><p><br/></p>', null, null, null, null, null, null, null, '8', '89', '103', '0', '999');
INSERT INTO `item` VALUES ('69', '绝地求生', '98', '0', '0', '/upload/c5c63540978411ea95b499dbc19d2de8绝地求生.jpg', '/upload/c5c65c50978411ea95b499dbc19d2de8绝地求生2.png', '/upload/c5c6aa70978411ea95b499dbc19d2de8绝地求生1.jpg', '/upload/c5c6aa71978411ea95b499dbc19d2de8绝地求生3.jpg', '/upload/c5c6f890978411ea95b499dbc19d2de8绝地求生4.jpg', '<p>《绝地求生》(PUBG) 是由蓝洞开发的一款战术竞技型射击类<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B2%99%E7%9B%92%E6%B8%B8%E6%88%8F/634349\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">沙盒游戏</a>&nbsp;。</p><p>在该游戏中，玩家需要在游戏地图上收集各种资源，并在不断缩小的安全区域内对抗其他玩家，让自己生存到最后。</p><p>游戏《绝地求生》除获得<a target=\"_blank\" href=\"https://baike.baidu.com/item/G-STAR/18839401\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">G-STAR</a>最高奖项总统奖以及其他五项大奖，还打破了7项<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%90%89%E5%B0%BC%E6%96%AF%E7%BA%AA%E5%BD%95/303397\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">吉尼斯纪录</a>。</p><p>2018年8月9日，《绝地求生》官方宣布，将开启“百日行动”，进行持续数月的自查运动，为玩家提供一个更好的游戏体验；11月，有超过200万个账户被冻结<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;</span>。该游戏于2018年12月7日登陆PS4平台。</p><p>2020年2月4日，《绝地求生》向武汉捐赠300万元支持抗击肺炎疫情。</p><p><br/></p>', null, null, null, null, null, null, null, '9', '85', '105', '0', '999');
INSERT INTO `item` VALUES ('70', '反恐精英：全球攻势', '99', '0', '3', '/upload/15812090978511ea95b499dbc19d2de8反恐精英：全球攻势.jpg', '/upload/158147a0978511ea95b499dbc19d2de8反恐精英：全球攻势2.jpg', '/upload/15816eb0978511ea95b499dbc19d2de8反恐精英：全球攻势3.jpg', '/upload/158195c0978511ea95b499dbc19d2de8反恐精英：全球攻势4.jpg', '/upload/1581bcd0978511ea95b499dbc19d2de8反恐精英：全球攻势1.png', '<p>《反恐精英：全球攻势》是一款由<a target=\"_blank\" href=\"https://baike.baidu.com/item/VALVE\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">VALVE</a>与Hidden Path Entertainment合作开发的第一人称射击游戏，于2012年8月21日在欧美地区正式发售，国服发布会于2017年4月11日在北京召开。游戏为《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8F%8D%E6%81%90%E7%B2%BE%E8%8B%B1/69155\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">反恐精英</a>》系列游戏的第四款作品（不包括Neo和<a target=\"_blank\" href=\"https://baike.baidu.com/item/Online\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Online</a>等衍生作品）。</p><p>游戏玩家分为反恐精英（CT阵营）与恐怖份子（T阵营）两个阵营，双方需在一个地图上进行多回合的战斗，达到地图要求目标或消灭全部敌方则取得胜利。</p><p><br/></p>', null, null, null, null, null, null, null, '5', '85', '86', '0', '996');
INSERT INTO `item` VALUES ('71', '反恐精英cs1.6', '10', '0', '0', '/upload/606d6cd0978511ea95b499dbc19d2de8精英cs.jpg', '/upload/606d93e0978511ea95b499dbc19d2de8精英cs3.jpg', '/upload/606dbaf0978511ea95b499dbc19d2de8精英cs1.jpg', '/upload/606de200978511ea95b499dbc19d2de8精英cs2.jpg', '/upload/606de201978511ea95b499dbc19d2de8精英cs4.jpg', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">《反恐精英cs1.6》（Counter-Strike，简称CS）是由</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/Valve%20Software\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">Valve Software</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">公司研发的一款第一人称射击类游戏。于2003年9月9日正式发行，属于《</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%8A%E6%9D%A1%E5%91%BD/1020164\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">半条命</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">》（Half-Life）的其中一个</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%B8%B8%E6%88%8F%E6%A8%A1%E7%BB%84\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">游戏模组</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">衍生而成的游戏.。</span></p>', null, null, null, null, null, null, null, '10', '85', '86', '0', '999');
INSERT INTO `item` VALUES ('72', '星际争霸', '10', '0', '2', '/upload/bb06a1c0978511ea95b499dbc19d2de8星际争霸.jpg', '/upload/bb06efe0978511ea95b499dbc19d2de8星际争霸1.jpg', '/upload/bb0716f0978511ea95b499dbc19d2de8星际争霸2.jpg', '/upload/bb073e00978511ea95b499dbc19d2de8星际争霸3.jpg', '/upload/bb076510978511ea95b499dbc19d2de8星际争霸4.jpg', '<p>《星际争霸》（英语：StarCraft）是<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%9A%B4%E9%9B%AA%E5%A8%B1%E4%B9%90/1277972\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">暴雪娱乐</a>制作发行的一款<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8D%B3%E6%97%B6%E6%88%98%E7%95%A5%E6%B8%B8%E6%88%8F/925324\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">即时战略游戏</a>。这是星际争霸系列游戏的第一部作品，于<a target=\"_blank\" href=\"https://baike.baidu.com/item/1998%E5%B9%B4/5189723\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">1998年</a>3月31日正式发行。游戏拥有3部资料片，但是正式发行的只有《星际争霸：母巢之战》。其续作《星际争霸II：自由之翼》已于<a target=\"_blank\" href=\"https://baike.baidu.com/item/2010%E5%B9%B4/8256367\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">2010年</a>7月27日发行。</p><p>《星际争霸》使用《魔兽争霸Ⅱ》引擎，但不同的是融合了三个截然不同的种族：Protoss，Zerg和Terran，他们各自有着迥然不同的战斗单位与科技树。</p><p><br/></p>', null, null, null, null, null, null, null, '10', '89', '91', '0', '997');
INSERT INTO `item` VALUES ('73', '刺客信条：奥德赛', '258', '0', '0', '/upload/7b1420f0978611ea95b499dbc19d2de8奥德赛.jpg', '/upload/7b144800978611ea95b499dbc19d2de8奥德赛1.jpg', '/upload/7b146f10978611ea95b499dbc19d2de8奥德赛2.jpg', '/upload/7b149620978611ea95b499dbc19d2de8奥德赛3.jpg', '/upload/7b14e440978611ea95b499dbc19d2de8奥德赛4.png', '<p>《刺客信条：奥德赛》<em>（Assassin&#39;s Creed Odyssey）</em>是一款由育碧魁北克工作室开发，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%82%B2%E7%A2%A7/950025\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">育碧</a>发行的动作扮演类游戏，于2018年10月5日发行并登陆PC、PS4、XboxOne平台。该作是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%BA%E5%AE%A2%E4%BF%A1%E6%9D%A1/85070\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">刺客信条</a>》的第八部主系列作品，也是2017年游戏《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%BA%E5%AE%A2%E4%BF%A1%E6%9D%A1%EF%BC%9A%E8%B5%B7%E6%BA%90/20798301\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">刺客信条：起源</a>》的续作。</p><p>游戏设定于距《刺客信条：起源》故事发生前四百年的公元前431年，讲述了古希腊城邦之间的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BC%AF%E7%BD%97%E5%A5%94%E5%B0%BC%E6%92%92%E6%88%98%E4%BA%89/875074\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">伯罗奔尼撒战争</a>的秘密虚构历史。玩家扮演一名雇佣兵，可加入以雅典为首的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%8F%90%E6%B4%9B%E5%90%8C%E7%9B%9F/7471610\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">提洛同盟</a>或以斯巴达为首的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BC%AF%E7%BD%97%E5%A5%94%E5%B0%BC%E6%92%92%E5%90%8C%E7%9B%9F/1106410\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">伯罗奔尼撒同盟</a>。</p><p><br/></p>', null, null, null, null, null, null, null, '7', '92', '94', '0', '999');
INSERT INTO `item` VALUES ('74', '刺客信条：起源', '258', '1', '1', '/upload/da3994c0978611ea95b499dbc19d2de8起源.jpg', '/upload/da39e2e0978611ea95b499dbc19d2de8起源1.jpg', '/upload/da3a09f0978611ea95b499dbc19d2de8起源2.jpg', '/upload/da3a3100978611ea95b499dbc19d2de8起源3.jpg', '/upload/da3a7f20978611ea95b499dbc19d2de8起源4.jpg', '<p>《刺客信条：起源》<em>（Assassin&#39;s Creed Origins）</em>是一部由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%82%B2%E7%A2%A7%E8%92%99%E7%89%B9%E5%88%A9%E5%B0%94%E5%B7%A5%E4%BD%9C%E5%AE%A4/10071976\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">育碧蒙特利尔工作室</a>开发、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%82%B2%E7%A2%A7/950025\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">育碧</a>发行的动作冒险游戏。本作是《<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%88%BA%E5%AE%A2%E4%BF%A1%E6%9D%A1/85070\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">刺客信条</a>》主系列的第七部作品，也是系列首次把时间线推前到刺客信条初代以前。<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;</span></p><p>游戏背景设定于<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%89%98%E5%8B%92%E5%AF%86%E7%8E%8B%E6%9C%9D/2675729\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">托勒密王朝</a><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%9F%83%E5%8F%8A%E8%89%B3%E5%90%8E/6038\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">埃及艳后</a>统治下的<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%9F%83%E5%8F%8A/158267\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">埃及</a>，玩家所操控的角色是一位隶属于法老的护卫，称为守护者，是一名来自<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E9%94%A1%E7%93%A6/2696846\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">锡瓦</a>名为<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%B7%B4%E8%80%B6%E5%85%8B/22169697\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">巴耶克</a>的埃及刺客。<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;</span></p><p>该作于2017年10月27日正式发售，登陆<a target=\"_blank\" href=\"https://baike.baidu.com/item/PC/107\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">PC</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/PS4/5619865\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">PS4</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/Xbox%20One/4728387\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Xbox One</a>等平台，游戏同时登陆于2017年11月7日发售的全新主机<a target=\"_blank\" href=\"https://baike.baidu.com/item/Xbox%20One%20X/20609107\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Xbox One X</a>。<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;</span></p><p><br/></p>', null, null, null, null, null, null, null, '5', '92', '94', '0', '998');
INSERT INTO `item` VALUES ('75', '只狼：影逝二度', '238', '0', '0', '/upload/23040080978911ea95b499dbc19d2de8只狼.jpg', '/upload/23086d50978911ea95b499dbc19d2de8只狼1.jpg', '/upload/2308bb70978911ea95b499dbc19d2de8只狼2.jpg', '/upload/230930a0978911ea95b499dbc19d2de8只狼3.jpg', '/upload/23097ec0978911ea95b499dbc19d2de8只狼4.jpg', '<p>《只狼：影逝二度(Sekiro：Shadows Die Twice)》是一款由From Software制作的第三人称视角的动作冒险沙盒类游戏，玩家将操控一位忍者，拯救他的主人---拥有日本贵族血统的大能的皇子，并向他的天敌复仇。该游戏已于2019年3月22日全球同步上市，并支持中文版。<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[1]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a></p><p>游戏剧情将探索生死冲突不断的16世纪后期，残酷的日本战国时代。在黑暗、扭曲的世界，玩家与威胁生命的敌人对峙，活用义手装备各种致命武器，大显忍者身手，在血腥对抗中潜行、上下穿梭，与敌人正面激烈交锋。</p><p>2019年12月13日，《只狼：影逝二度》获得TGA 2019最佳年度游戏</p><p><br/></p>', null, null, null, null, null, null, null, '9', '92', '107', '0', '999');
INSERT INTO `item` VALUES ('76', '使命召唤：现代战争', '120', '0', '0', '/upload/30eb38009a3411eace10885bda9dd416使命召唤.jpg', '/upload/30eb86209a3411eace10885bda9dd416使命召唤1.jpg', '/upload/30ebad309a3411eace10885bda9dd416使命召唤2.jpg', '/upload/30ee45409a3411eace10885bda9dd416使命召唤3.jpg', '/upload/30ee93609a3411eace10885bda9dd416使命召唤4.jpg', '<p>《使命召唤：现代战争》<em>（Call of Duty: Modern Warfare）</em>是一款由<a target=\"_blank\" href=\"https://baike.baidu.com/item/Infinity%20Ward/2162990\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Infinity Ward</a>开发，<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%8A%A8%E8%A7%86/4076908\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">动视</a>发行的第一人称射击游戏，是使命召唤游戏系列第16部作品，也是使命召唤“现代战争”系列的重启之作<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[1-2]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;。</p><p>本作于2019年10月25日正式发售，登陆<a target=\"_blank\" href=\"https://baike.baidu.com/item/PS4/5619865\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">PS4</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/Xbox%20One/4728387\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Xbox One</a>及<a target=\"_blank\" href=\"https://baike.baidu.com/item/PC/107\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">PC</a>平台，其中PC版本由<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%88%98%E7%BD%91/2350383\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">战网</a>独占<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[3-4]</span><a class=\"sup-anchor\" style=\"color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;\">&nbsp;</a>&nbsp;。</p><p>从9月12日起，《使命召唤：现代战争》进行了玩家测试，直至9月23日为止，创造了三项历史最高纪录。</p><p>在进行测试期间，《使命召唤：现代战争》创造了系列历史以来测试版PS4，Xbox One，PC平台参与玩家数、总游玩时间和同时在线人数的三项最高纪录。<span class=\"sup--normal\" style=\"font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;\">&nbsp;[5]</span></p><p><img src=\"/ueditor/2fb4dae09a3411eace10885bda9dd416反恐精英：全球攻势2.jpg\" title=\"\" alt=\"反恐精英：全球攻势2.jpg\"/></p>', null, null, null, null, null, null, null, '10', '85', '108', '0', '999');

-- ----------------------------
-- Table structure for item_category
-- ----------------------------
DROP TABLE IF EXISTS `item_category`;
CREATE TABLE `item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '类目名称',
  `pid` int(11) DEFAULT NULL COMMENT '父级ID',
  `isDelete` int(11) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='商品类目表';

-- ----------------------------
-- Records of item_category
-- ----------------------------
INSERT INTO `item_category` VALUES ('85', '射击', null, '0');
INSERT INTO `item_category` VALUES ('86', '反恐精英', '85', '0');
INSERT INTO `item_category` VALUES ('87', '模拟', null, '1');
INSERT INTO `item_category` VALUES ('89', '策略', null, '0');
INSERT INTO `item_category` VALUES ('91', '星际争霸', '89', '0');
INSERT INTO `item_category` VALUES ('92', '冒险', null, '0');
INSERT INTO `item_category` VALUES ('94', '刺客信条', '92', '0');
INSERT INTO `item_category` VALUES ('95', '动作', null, '0');
INSERT INTO `item_category` VALUES ('99', '鬼泣', '95', '0');
INSERT INTO `item_category` VALUES ('100', '尼尔', '95', '0');
INSERT INTO `item_category` VALUES ('101', '战神', '92', '0');
INSERT INTO `item_category` VALUES ('102', '最终幻想', '92', '0');
INSERT INTO `item_category` VALUES ('103', '文明', '89', '0');
INSERT INTO `item_category` VALUES ('105', '绝地求生', '85', '0');
INSERT INTO `item_category` VALUES ('106', '怪物猎人', '95', '0');
INSERT INTO `item_category` VALUES ('107', '只狼', '92', '0');
INSERT INTO `item_category` VALUES ('108', '使命召唤', '85', '0');

-- ----------------------------
-- Table structure for item_order
-- ----------------------------
DROP TABLE IF EXISTS `item_order`;
CREATE TABLE `item_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `code` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `addTime` datetime DEFAULT NULL COMMENT '添加时间',
  `total` varchar(255) DEFAULT NULL COMMENT '总金额',
  `isDelete` int(255) DEFAULT NULL COMMENT '是否删除',
  `status` int(255) DEFAULT NULL COMMENT '0.新建待发货 1. 已取消  2 已发货待收货 3 已收货待评价 4 已评价  5 退货待确认  6 已退货',
  `content` varchar(6000) DEFAULT NULL COMMENT '退货缘由',
  `refund_way` varchar(255) DEFAULT NULL COMMENT '退款方式',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='商品订单表';

-- ----------------------------
-- Records of item_order
-- ----------------------------
INSERT INTO `item_order` VALUES ('44', null, '12', '2020051620240001', '2020-05-16 20:24:37', '27.11', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('45', null, '12', '2020051621410001', '2020-05-16 21:41:06', '293.6', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('46', null, '13', '2020051622050001', '2020-05-16 22:05:22', '258.0', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('47', null, '13', '2020051622050002', '2020-05-16 22:05:48', '214.2', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('48', null, '13', '2020051623090001', '2020-05-16 23:09:28', '169.5', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('49', null, '14', '2020051623200001', '2020-05-16 23:20:20', '129.0', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('50', null, '12', '2020051823420001', '2020-05-18 23:42:31', '70.0', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('51', null, '12', '2020052000270001', '2020-05-20 00:27:06', '187.2', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('52', null, '12', '2020052000310001', '2020-05-20 00:31:25', '10.0', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('54', null, '12', '2020052008250001', '2020-05-20 08:25:06', '120.0', '0', '1', null, null, null);
INSERT INTO `item_order` VALUES ('55', null, '17', '2020052008480001', '2020-05-20 08:48:46', '204.0', '0', '4', null, null, null);
INSERT INTO `item_order` VALUES ('56', null, '14', '2020052802040001', '2020-05-28 02:04:06', '49.5', '0', '2', null, null, null);
INSERT INTO `item_order` VALUES ('57', null, '14', '2020052802050001', '2020-05-28 02:05:03', '49.5', '0', '4', null, null, null);

-- ----------------------------
-- Table structure for manage
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `passWord` varchar(255) DEFAULT NULL COMMENT '密码',
  `realName` varchar(255) DEFAULT NULL COMMENT '真实名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES ('1', 'admin', '123456', '管理员');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(255) DEFAULT NULL COMMENT '商品ID',
  `order_id` int(11) DEFAULT NULL COMMENT '订单Id',
  `status` int(11) DEFAULT NULL COMMENT '0.未退货  1 已退货待卖家确认  2卖家确认 3 卖家拒绝  ',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `total` varchar(255) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='订单明细表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('54', '27', '27', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('55', '32', '28', '0', '5', '25');
INSERT INTO `order_detail` VALUES ('56', '27', '28', '0', '3', '9');
INSERT INTO `order_detail` VALUES ('57', '28', '28', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('58', '35', '29', '0', '2', '4');
INSERT INTO `order_detail` VALUES ('59', '34', '29', '0', '4', '16');
INSERT INTO `order_detail` VALUES ('60', '32', '29', '0', '3', '9');
INSERT INTO `order_detail` VALUES ('61', '36', '29', '0', '3', '9');
INSERT INTO `order_detail` VALUES ('62', '32', '29', '0', '2', '4');
INSERT INTO `order_detail` VALUES ('63', '35', '30', '0', '6', '36');
INSERT INTO `order_detail` VALUES ('64', '30', '30', '0', '3', '9');
INSERT INTO `order_detail` VALUES ('65', '28', '31', '0', '4', '16');
INSERT INTO `order_detail` VALUES ('66', '28', '31', '0', '2', '4');
INSERT INTO `order_detail` VALUES ('67', '28', '32', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('68', '27', '33', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('69', '30', '34', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('70', '27', '35', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('71', '28', '36', '1', '2', '4');
INSERT INTO `order_detail` VALUES ('72', '27', '36', '1', '2', '4');
INSERT INTO `order_detail` VALUES ('73', '27', '37', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('74', '32', '38', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('75', '29', '39', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('76', '51', '40', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('77', '51', '41', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('78', '48', '42', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('79', '53', '43', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('80', '56', '44', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('81', '58', '45', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('82', '57', '45', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('83', '61', '46', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('84', '62', '47', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('85', '70', '48', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('86', '67', '48', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('87', '74', '49', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('88', '60', '50', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('89', '59', '51', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('90', '72', '52', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('91', '72', '53', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('92', '67', '54', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('93', '58', '55', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('94', '70', '56', '0', '1', '1');
INSERT INTO `order_detail` VALUES ('95', '70', '57', '0', '1', '1');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL COMMENT '商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('17', '27', '3');
INSERT INTO `sc` VALUES ('18', '28', '3');
INSERT INTO `sc` VALUES ('19', '29', '1');
INSERT INTO `sc` VALUES ('20', '53', '9');
INSERT INTO `sc` VALUES ('21', '74', '14');
INSERT INTO `sc` VALUES ('22', '58', '17');
INSERT INTO `sc` VALUES ('23', '58', '12');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `passWord` varchar(255) DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `realName` varchar(255) DEFAULT NULL COMMENT '真实名称',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('12', 'zhang3', '123456', '13269052799', 'hanae aoki', '男', '北京', 'aoki_hanae@qq.com');
INSERT INTO `user` VALUES ('13', 'li4', '123456', '13269052798', 'lisi', '男', '北京', 'aoki_hanae1@qq.com');
INSERT INTO `user` VALUES ('14', 'wang5', '123456', '13269052797', '王五', '男', '北京', 'aoki_hanae2@qq.com');
INSERT INTO `user` VALUES ('17', 'zhao1', '123456', '13269052755', 'zhao', '男', '北京', 'aoki_han22@qq.com');

-- ----------------------------
-- Table structure for user_post
-- ----------------------------
DROP TABLE IF EXISTS `user_post`;
CREATE TABLE `user_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `title` varchar(55) DEFAULT NULL COMMENT '帖子主题',
  `field0` varchar(255) DEFAULT NULL COMMENT '保存发帖人名字',
  `field1` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  `field2` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  `content` text COMMENT '内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户帖子表';

-- ----------------------------
-- Records of user_post
-- ----------------------------
INSERT INTO `user_post` VALUES ('3', '12', '鬼泣五好不好玩啊', 'zhang3', null, null, '<p><img src=\"/ueditor/e67cd48097a511ea3946b1ab811e819d80820149_p0.jpg\" title=\"\" alt=\"80820149_p0.jpg\"/>我一直买了吃灰，不知道好不好玩啊</p>', '2020-05-16 22:41:11', null);
INSERT INTO `user_post` VALUES ('4', '14', '只狼好不好玩', 'wang5', null, null, '<p><img src=\"/ueditor/3d2f6660a0db11ea0941ca53284a4733只狼2.jpg\" width=\"309\" height=\"379\"/></p><p><img src=\"/ueditor/3d2f6661a0db11ea0941ca53284a4733只狼3.jpg\" width=\"293\" height=\"319\"/></p><p>没玩过<br/></p>', '2020-05-16 23:23:35', null);

-- ----------------------------
-- Table structure for user_post_comment
-- ----------------------------
DROP TABLE IF EXISTS `user_post_comment`;
CREATE TABLE `user_post_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '评论人ID',
  `post_id` int(11) DEFAULT NULL COMMENT '帖子ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '评论人名字',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `field0` varchar(255) DEFAULT NULL COMMENT '保存帖子title',
  `field1` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  `field2` varchar(255) DEFAULT NULL COMMENT '冗余字段',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='评价表';

-- ----------------------------
-- Records of user_post_comment
-- ----------------------------
INSERT INTO `user_post_comment` VALUES ('31', '12', '3', 'zhang3', '顶顶顶', '鬼泣五好不好玩啊', null, null, '2020-05-16 22:41:24', null);
INSERT INTO `user_post_comment` VALUES ('32', '13', '3', 'li4', '挺好', '鬼泣五好不好玩啊', null, null, '2020-05-16 23:08:13', null);
INSERT INTO `user_post_comment` VALUES ('33', '12', '4', 'zhang3', '挺好玩的', '只狼好不好玩', null, null, '2020-05-16 23:23:54', null);
INSERT INTO `user_post_comment` VALUES ('34', '12', '4', 'zhang3', '不错', '只狼好不好玩', null, null, '2020-05-20 08:53:09', null);
