/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : liuhecai2

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-01-28 11:16:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adad`
-- ----------------------------
DROP TABLE IF EXISTS `adad`;
CREATE TABLE `adad` (
  `id` int(11) NOT NULL DEFAULT '0',
  `zm` int(11) DEFAULT NULL,
  `zm6` int(11) DEFAULT NULL,
  `lm` int(11) DEFAULT NULL,
  `zlm` int(11) DEFAULT NULL,
  `ys` int(11) DEFAULT NULL,
  `ls` int(11) DEFAULT NULL,
  `dx` int(11) DEFAULT NULL,
  `tm` int(11) DEFAULT NULL,
  `spx` int(11) DEFAULT NULL,
  `bb` int(11) DEFAULT NULL,
  `bbb` int(11) DEFAULT NULL,
  `qsb` int(11) DEFAULT NULL,
  `zhx` int(11) DEFAULT NULL,
  `zmt` int(11) DEFAULT NULL,
  `ts` int(11) DEFAULT NULL,
  `ws` int(11) DEFAULT NULL,
  `ztws` int(11) DEFAULT NULL,
  `best` int(11) DEFAULT NULL,
  `zm1` double DEFAULT NULL,
  `zm61` double DEFAULT NULL,
  `lm1` double DEFAULT NULL,
  `zlm1` double DEFAULT NULL,
  `ys1` double DEFAULT NULL,
  `ls1` double DEFAULT NULL,
  `dx1` double DEFAULT NULL,
  `tm1` double DEFAULT NULL,
  `spx1` double DEFAULT NULL,
  `bb1` double DEFAULT NULL,
  `bbb1` double DEFAULT NULL,
  `qsb1` double DEFAULT NULL,
  `zhx1` double DEFAULT NULL,
  `zmt1` double DEFAULT NULL,
  `ts1` double DEFAULT NULL,
  `ws1` double DEFAULT NULL,
  `ztws1` double DEFAULT NULL,
  `ps1` double DEFAULT NULL,
  `ps` int(11) DEFAULT NULL,
  `rake` double DEFAULT '42.5',
  `ds` double DEFAULT '13',
  `zf_num` double DEFAULT '30000',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adad
-- ----------------------------
INSERT INTO `adad` VALUES ('1', '3', '30', '500', '5', '100', '50', '50', '10', '10', '1', '8', '1', '10', '50', '200', '0', '300', '0', '10', '4', '2', '3', '2.5', '2.5', '1', '11', '1', '0', '10', '1', '1', '10', '1', '1', '2', '2.5', '10', '42', '13', '1500');

-- ----------------------------
-- Table structure for `agent`
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cname` varchar(32) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `state` tinyint(2) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent
-- ----------------------------

-- ----------------------------
-- Table structure for `agent_level`
-- ----------------------------
DROP TABLE IF EXISTS `agent_level`;
CREATE TABLE `agent_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `cname` varchar(32) NOT NULL,
  `prefix` varchar(32) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_level
-- ----------------------------
INSERT INTO `agent_level` VALUES ('1', '0', '', '大股东', 'g', '1544512529', '1544512529', null);
INSERT INTO `agent_level` VALUES ('2', '1', '', '股东', 'a', '1544512831', '1544512831', null);
INSERT INTO `agent_level` VALUES ('3', '2', null, '总代', 'b', '1544512831', '1544512831', null);
INSERT INTO `agent_level` VALUES ('4', '3', null, '代理', 'c', '1544512831', '1544512831', null);

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_1` int(11) DEFAULT NULL,
  `class_2` int(11) DEFAULT NULL,
  `class_3` int(11) DEFAULT NULL,
  `cname` varchar(32) NOT NULL COMMENT '名称',
  `keywords` varchar(64) DEFAULT NULL COMMENT '关键字',
  `description` varchar(256) DEFAULT NULL COMMENT '描述',
  `content` longtext COMMENT '内容',
  `link` varchar(128) DEFAULT NULL COMMENT '链接',
  `click` int(11) DEFAULT '0' COMMENT '点击次数',
  `object` tinyint(2) DEFAULT '0' COMMENT '面向对象',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0草稿 1发布',
  `operator` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '8', '0', '0', '许可及服务协议', '', '', '<table width=\"91%\" border=\"0\" align=\"center\"><tbody><tr><td>用户在进行游戏前应核实其所在地区进行联机游戏是否符合当地法律。</td></tr><tr><td><p>本网站只向符合法定年龄的用户提供服务,用户须注意其居住地区的法律年龄限制,在不违反年龄限制之下才可使用本网站服务。使用或参与本公司所有游戏之用户,均被视为符合该用户当地之法定年龄,以及该用户完全明白并且同意本协议之内容。 本公司将不承担任何用户因违反当地相关法律而引起之任何责任,任何用户在参与本公司所有游戏而触犯当地法律之任何责任,本公司概不负责。</p></td></tr></tbody></table>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;	', null, '0', '0', '1', null, '1543395600', '1544603680', null);
INSERT INTO `article` VALUES ('2', '7', '0', '0', '欢迎', '', '', '<p>\n    欢迎来到小马游娱\n</p>', null, '0', '0', '1', null, '1543974203', '1543976083', null);
INSERT INTO `article` VALUES ('3', '7', '0', '0', '充值赠送', '', '', '<p>充值越多赠送越多<br/></p>', null, '0', '0', '1', null, '1543974267', '1543974267', null);
INSERT INTO `article` VALUES ('4', '8', '0', '0', '规则', '', '', '<p>&lt;OL&gt;<br/>&nbsp; &lt;LI&gt;客户一经在本公司开户或投注，即被视为已接受这些规则。 <br/>&nbsp; &lt;LI&gt;如果客户怀疑自己的资料被盗用，应立即通知本公司，并更改个人详细资料，且之前所使用的使用者名称及密码将全部无效。 <br/>&nbsp; &lt;LI&gt;客户有责任确保自己的帐户及登入资料的保密性。在本网站上以个人的使用者名称及密码进行的任何网上投注将被视为有效。 <br/>&nbsp; &lt;LI&gt;&lt;FONT color=red&gt;&lt;B&gt;为了避免出现争议，请务必在下注之后检查“下注状况”。&nbsp; &lt;/B&gt;&lt;/FONT&gt;<br/>&nbsp; &lt;LI&gt;&lt;FONT color=red&gt;&lt;B&gt;开奖后接受的投注，将被视为“无效”。 &lt;/B&gt;&lt;/FONT&gt;<br/>&nbsp; &lt;LI&gt;任何的投诉必须在开奖之前提出，本公司将不会受理任何开奖之后的投诉。 <br/>&nbsp; &lt;LI&gt;公布的投注时间、项目及赔率出现任何打字错误或非故意人为失误，本公司将保留改正错误和按正确搅珠时间、赔率结算注单的权力。 <br/>&nbsp; &lt;LI&gt;&lt;FONT color=red&gt;&lt;B&gt;所有赔率将不时浮动，派彩时的赔率将以下注状况内所显示之赔率为准。&lt;/B&gt;&lt;/FONT&gt; <br/>&nbsp; &lt;LI&gt;如本公司察觉客户投注状况异常时，有权即时中止客户投注；在本公司中止下注前，客户之所有投注仍属有效，不得要求取消或延迟交收，以及不得有任何异议。 <br/>&nbsp; &lt;LI&gt;如因在本网站投注触犯当地法律，本公司概不负责。 &lt;/LI&gt;&lt;/OL&gt;<br/>&lt;span class=&quot;fw12 style2&quot;&gt;&lt;span class=&quot;fw12&nbsp; style4&quot;&gt;　　　六合彩规则说明&lt;/span&gt;&lt;/span&gt;&lt;br&gt;<br/>&lt;OL&gt;<br/>&nbsp; &lt;LI&gt;&lt;FONT color=blue&gt;以下所有投注皆含本金&lt;/FONT&gt;&lt;/B&gt;。&lt;BR&gt; <br/>&nbsp; &lt;LI&gt;&lt;FONT color=cc4422&gt;每期六合彩开奖球数共七粒(包括特码) &lt;/FONT&gt; &lt;/B&gt;。&lt;BR&gt; &nbsp;<br/>&nbsp; &lt;LI&gt;&lt;B&gt;特码&lt;/B&gt;&lt;BR&gt; <br/>&nbsp;&nbsp;&nbsp; &lt;B&gt;特别号&lt;FONT color=blue&gt;单码&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;<br/><br/>香港六合彩公司当期开出的最后一码为特码。特码页面内投注任意一个号码，并以即时赔率作为派奖依据，买中即获奖。&nbsp; &lt;BR&gt; <br/>&nbsp;&nbsp;&nbsp; &lt;B&gt;特别号&lt;FONT color=blue&gt;单双&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;特码为双数叫特双，如 08、16；为单数叫特单， 如 21、35；&lt;FONT color=red&gt;&lt;B&gt;（特码开49号，则视为和）&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt; <br/>&nbsp;&nbsp;&nbsp; &lt;B&gt;特别号&lt;FONT color=blue&gt;大小&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;开出之特码范围在（1-24）为特码小， 范围在（25-48）为特码大； &lt;FONT color=red&gt;&lt;B&gt;（特码开49号，则视为和）&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt; &nbsp;<br/>&nbsp;&nbsp;&nbsp; &lt;B&gt;特别号&lt;FONT color=blue&gt;合数单双&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;以特码个位和十位数字之和来判断，如 01、12、32 为合单，02、11、33 为合双；&lt;FONT color=red&gt;&lt;B&gt;（特码开49号，则视为和）&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt; <br/>&nbsp;&nbsp;&nbsp; &lt;B&gt;特别号&lt;FONT color=blue&gt;合数大小&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;以特别号个位数和十位数之和来决定大小，合数大於或等於7为大，小於或等於6为小；&lt;FONT color=red&gt;&lt;B&gt;（特码开49号，则视为和）&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt; <br/>&nbsp; &lt;B&gt;特别号&lt;FONT color=blue&gt;尾数大小&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;<br/>以特别号尾数若0尾~4尾为小、5尾~9尾为大；如01、32、44为特尾小；如05、18、19为特尾大，&lt;FONT color=red&gt;&lt;B&gt;（特码开49号，则视为和）&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt;<br/>&lt;B&gt;特码&lt;FONT color=blue&gt;半特&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;<br/>以特别号大小与特别号单双游戏为一个投注组合；当期特别号开出符合投注组合，即视为中奖；其馀情形视为不中奖，&lt;FONT color=red&gt;&lt;B&gt;（特码开49号，则视为和）&lt;/B&gt;&lt;/FONT&gt;。<br/><br/>&nbsp; &lt;LI&gt;&lt;B&gt;正码&lt;/B&gt;&lt;BR&gt;香港六合彩公司当期开出之前 6 个号码叫正码。下注号码如在六个正码号码里为中奖。&lt;BR&gt;<br/>&nbsp; <br/>&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;正特总和单双&lt;/FONT&gt;(请在“正码”页面中投注)&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 所有七个开奖号码的分数总和是单数叫(总分单)，如分数总和是115、183；分数总和是双数叫(总分双)，如分数总和是108、162。假如投注组合符合中奖结果，视为中奖，其馀情形视为不中奖。&lt;FONT color=red&gt;&lt;B&gt;（此玩法无和局的情况）&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt; &nbsp;<br/>&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;正特总和大小&lt;/FONT&gt;(请在“正码”页面中投注)&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 所有七个开奖号码的分数总和大於或等於175为总分大；分数总和小於或等於174为总分小。 如开奖号码为02、08、17、28、39、46、25，分数总和是165，则总分小。假如投注组合符合中奖结果，视为中奖，其馀情形视为不中奖。&lt;FONT color=red&gt;&lt;B&gt;（此玩法无和局的情况）&lt;/B&gt;&lt;/FONT&gt;。&lt;LI&gt;<br/>&nbsp;&lt;B&gt;正码特&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 指正1特...正6特，下注的正码特与现场滚波开出之正码其开奖顺序及开奖号码相同，视为中奖，如现场滚球第一个正码开奖为18号，下注正1码特为18则视为中奖，其它情况视为不中。<br/>&nbsp;&lt;/LI&gt; <br/>&nbsp; &lt;LI&gt;&lt;B&gt;正码1-6&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 香港六合彩公司当期开出之前6个号码叫正码。第一时间出来的叫正码1，依次为正码2、正码3┅┅ 正码6(并不以号码大小排序)。正码1、正码2、正码3、正码4、正码5、正码6的大小单双合码和特别号码的大小单双合码规则相同，如正码1为29，则正码1为大，为单；正码2为8，则正码2为小， 为双；假如投注组合符合中奖结果，视为中奖，其馀情形视为不中奖。&lt;FONT color=red&gt;&lt;B&gt;（6个正码中如有号码为49，则单项为和）&lt;/B&gt;&lt;/FONT&gt; 。<br/><br/>&nbsp; &lt;LI&gt;&lt;B&gt;正码过关&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp; 游戏规则同正码1-6盘势，但须同时投注多项结果，串联成投注组合，只要单期所开出之开奖结果符合您所选定之串联结果，即视为中奖。若其中一项结果不中，则视为不中奖；若其中一项结果为和，其馀结果都中奖的情形，也视为中奖；和的项目赔率以一计算。 &nbsp;<br/><br/><br/>&nbsp; &lt;LI&gt;&lt;B&gt;特码生肖色波头尾数&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;<br/>&nbsp; &lt;B&gt;特码&lt;FONT color=blue&gt;生肖&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 生肖顺序为 鼠 &gt; 牛 &gt; 虎 &gt; 兔 &gt; 龙 &gt; 蛇 &gt; 马 &gt; 羊 &gt; 猴 &gt; 鸡 &gt; 狗 &gt; 猪&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 假如今年是狗年，就以狗为开始，依顺序将49个号码分为12个生肖(如下)，再以生肖下注。&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; &lt;TABLE cellSpacing=0 cellPadding=3 border=0&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TBODY&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;鼠11 , 23 , 35 , 47 &lt;BR&gt;<br/>牛10 , 22 , 34 , 46 &lt;BR&gt;<br/>虎09 , 21 , 33 , 45 &lt;BR&gt;<br/>兔08 , 20 , 32 , 44 &lt;BR&gt;<br/>龙07 , 19 , 31 , 43 &lt;BR&gt;<br/>蛇06 , 18 , 30 , 42 &lt;BR&gt;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/TD&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD width=20&gt;&lt;/TD&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;马05 , 17 , 29 , 41&lt;BR&gt;<br/>&nbsp;羊04 , 16 , 28 , 40 &lt;BR&gt;<br/>猴03 , 15 , 27 , 39 &lt;BR&gt;<br/>鸡02 , 14 , 26 , 38 &lt;BR&gt;<br/>狗01 , 13 , 25 , 37 , 49 &lt;BR&gt;<br/>猪12 , 24 , 36 , 48&nbsp; &lt;BR&gt;<br/>&nbsp; &lt;/TD&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/TBODY&gt;<br/>&nbsp;&nbsp;&nbsp; &lt;/TABLE&gt;<br/>&nbsp;&nbsp;&nbsp; 若当期特别号，落在下注生肖范围内，视为中奖。 &lt;FONT color=red&gt;&lt;B&gt;（特码开49亦算输赢，不为和）&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt;<br/>&nbsp; &lt;B&gt;特码&lt;FONT color=blue&gt;色波&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 以特别号的球色下注，开奖的球色与下注的颜色相同，视为中奖，球色号码分布如下:&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; &lt;FONT <br/>&nbsp; color=red&gt;红波 ∶ 01, 02, 07, 08, 12, 13, 18, 19, 23, 24, 29, 30, 34, 35, 40, 45, 46。&lt;/FONT&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; &lt;FONT color=blue&gt;蓝波 ∶ 03, 04, 09, 10, 14, 15, 20, 25, 26, 31, 36, 37, 41, 42, 47, 48。&lt;/FONT&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; &lt;FONT color=green&gt;绿波 ∶ 05, 06, 11, 16, 17, 21, 22, 27, 28, 32, 33, 38, 39, 43, 44, 49。&lt;/FONT&gt;&lt;BR&gt;<br/><br/>&nbsp; &lt;B&gt;特码&lt;FONT color=blue&gt;头尾数&lt;/FONT&gt;&lt;/B&gt;&lt;BR&gt;<br/><br/>&nbsp;&lt;B&gt;&lt;FONT color=cc44dd&gt;头数&lt;/FONT&gt;&lt;/B&gt;&nbsp;&nbsp; &nbsp;<br/>&nbsp;指特别号所属头数的号码。&lt;BR&gt;<br/>&quot;0&quot;头：01.02.03.04.05.06.07.08.09&lt;BR&gt;<br/>&quot;1&quot;头：10.11.12.13.14.15.16.17.18.19&lt;BR&gt;<br/>&quot;2&quot;头：20.21.22.23.24.25.26.27.28.29&lt;BR&gt;<br/>&quot;3&quot;头：30.31.32.33.34.35.36.37.38.39&lt;BR&gt;<br/>&quot;4&quot;头：40.41.42.43.44.45.46.47.48.49&lt;BR&gt;<br/>例如：开奖结果特别号码是21 则 “2”头为中奖，其他头数都不中奖。&lt;BR&gt;<br/>&lt;B&gt;&lt;FONT color=cc44dd&gt;尾数&lt;/FONT&gt;&lt;/B&gt;<br/>&nbsp;指特别号所属尾数的号码。&lt;BR&gt;<br/>&quot;1&quot;尾：01.11.21.31.41&lt;BR&gt;<br/>&quot;2&quot;尾：02.12.22.32.42&lt;BR&gt;<br/>&quot;3&quot;尾：03.13.23.33.43&lt;BR&gt;<br/>&quot;4&quot;尾：04.14.24.34.44&lt;BR&gt;<br/>&quot;5&quot;尾：05.15.25.35.45&lt;BR&gt;<br/><br/>&quot;6&quot;尾：06.16.26.36.46&lt;BR&gt;<br/>&quot;7&quot;尾：07.17.27.37.47&lt;BR&gt;<br/>&quot;8&quot;尾：08.18.28.38.48&lt;BR&gt;<br/>&quot;9&quot;尾：09.19.29.39.49&lt;BR&gt;<br/>&quot;0&quot;尾：10.20.30.40&lt;BR&gt;<br/>例如：开奖结果特别号码是21 则&quot;1&quot;尾为中奖，其他尾数都不中奖。&lt;BR&gt;<br/><br/>&nbsp; &lt;LI&gt;&lt;B&gt;连码&lt;/B&gt;&lt;BR&gt;<br/><br/>&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;三全中&lt;/FONT&gt;（可选择多码复式或者胆拖形式进行投注）&lt;/B&gt;&nbsp; &lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 所投注的每三个号码为一组合，若三个号码都是开奖号码之正码，视为中奖，其馀情形视为 不中奖。如06、07、08三个都是开奖号码之正码，视为中奖，如两个正码加上一个特别号码视为不中奖。&lt;BR&gt; &nbsp;<br/>&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;三中二&lt;/FONT&gt;（可选择多码复式或者胆拖形式进行投注）&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 所投注的每三个号码为一组合，若其中2个是开奖号码中的正码，即为三中二，视为中奖；若3个都是开奖号码中的正码，即为三中二之中三，其馀情形视为不中奖，如06、07、08 为一组合，开奖号码中有06、07两个正码，没有08，即为三中二，按三中二赔付；如开奖 号码中有06、07、08三个正码，即为三中二之中三，按中三赔付；如出现1个或没有，视为不中奖。&lt;BR&gt; &nbsp;<br/>&nbsp;<br/>&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;二全中&lt;/FONT&gt;（可选择多码复式或者胆拖形式进行投注）&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 所投注的每二个号码为一组合，二个号码都是开奖号码之正码，视为中奖，其馀情形视为不中奖（含一个正码加一个特别号码之情形）。&lt;BR&gt; <br/>&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;二中特&lt;/FONT&gt;（可选择多码复式或者胆拖形式进行投注）&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 所投注的每二个号码为一组合，二个号码都是开奖号码之正码，叫二中特之中二；若其中一 个是正码，一个是特别号码，叫二中特之中特；其馀情形视为不中奖。&lt;BR&gt; <br/>&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;特串&lt;/FONT&gt;（可选择多码复式或者胆拖形式进行投注）&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 所投注的每二个号码为一组合，其中一个是正码，一个是特别号码，视为中奖，其馀情形视为不中奖（含二个号码都是正码之情形）。&lt;BR&gt; <br/><br/>&nbsp; &lt;LI&gt;&lt;B&gt;半波&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 以特码色波和特单，特双，特大，特小为一个投注组合，当期特码开出符合投注组合，即视为中奖；其馀情形视为不中奖。 &lt;FONT color=red&gt;&lt;B&gt;（特码开49号，则视为和）&lt;/B&gt;&lt;/FONT&gt;。 <br/><br/>&nbsp; &lt;LI&gt;&lt;B&gt;正肖总肖&lt;/B&gt;&lt;BR&gt;<br/>&nbsp; 依据开出的所有正码为主。&lt;BR&gt; <br/><br/>&lt;B&gt;&lt;FONT color=blue&gt;正肖&lt;/FONT&gt;&lt;/B&gt;<br/>&nbsp;只要当期6个正码，只要有1个落在下注生肖所属号码范围内，则视为中奖。如超过1个正码落在下注生肖所属号码范围内 ，派彩将倍增！如：下注＄100. 正肖猪倍率1.8<br/>6个正码开出01，派彩为＄80.&lt;BR&gt;<br/>6个正码开出01，13，派彩为＄160.&lt;BR&gt;<br/>6个正码开出01，13，25，派彩为＄240.&lt;BR&gt;<br/>6个正码开出01，13，25，37，派彩为＄320.&lt;BR&gt;<br/>6个正码开出01，13，25，37，49，派彩为＄400.&lt;FONT color=red&gt;&lt;B&gt;（请注意:49亦算输赢，不为和)&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt;<br/><br/>&lt;B&gt;&lt;FONT color=blue&gt;总肖&lt;/FONT&gt;&lt;/B&gt;<br/>&nbsp;只要当期号码(所有正码与最后开出的特码)开出的不同生肖总数，与所投注之预计开出之生肖总数符合(不用指定特定生肖)，则视为中奖，其馀情形视为不中奖。<br/>例如如果当期号码为19, 24, 12, 34, 40, 39, 特别号: 49 总计六个生肖，若选取总肖 [6] 则为中奖&lt;FONT color=red&gt;&lt;B&gt;（请注意:49亦算输赢，不为和)&lt;/B&gt;&lt;/FONT&gt;。<br/>&nbsp;<br/>&nbsp;<br/><br/>&nbsp; &lt;LI&gt;&lt;B&gt;连肖&lt;/B&gt;&lt;BR&gt; &nbsp;<br/>&nbsp; 挑选1~7生肖(排列如同生肖)为一个组合，当期号码(所有正码与最后开出的特码)坐落於投注时所勾选之生肖组合所属号码内，所勾选之生肖皆至少有中一个号码，则视为中奖，其馀情形视为不中奖&lt;br&gt;<br/>如：投注四肖碰--7个开奖号码中四个生肖都出现则视为中奖。&lt;FONT color=red&gt;&lt;B&gt;（49亦算输赢，不为和)&lt;/B&gt;&lt;/FONT&gt;。<br/>&nbsp; <br/>&nbsp; &lt;LI&gt;&lt;B&gt;多肖&lt;/B&gt;&lt;BR&gt;<br/>&nbsp; 必须挑选 3 个以上生肖（排列如同生肖）为一个组合，并选择开奖号码的特码是否在此组合内，开奖号码的特码亦在此组合内，则视为中奖。开奖号码的特码无一在此组合内，即视为不中奖。&lt;FONT color=red&gt;&lt;B&gt;（若特码开出49号，则此玩法所有投注种类均被视为和局）&lt;/B&gt;&lt;/FONT&gt;。<br/>&nbsp; <br/>&nbsp; &lt;LI&gt;&lt;B&gt;一肖尾数七色波&lt;/B&gt;&lt;BR&gt; &nbsp;<br/>&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;一肖&lt;/FONT&gt;(请在“一肖尾数七色波”页面中投注)&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 指开奖&lt;FONT color=red&gt;&lt;B&gt;7个号码中&lt;/B&gt;&lt;/FONT&gt;含有所属生肖的一个或多个号码，但派彩只派一次，即不论同生肖号码出今现一个或多个号码都只派彩一次。&lt;FONT color=red&gt;&lt;B&gt;（此玩法49亦算输赢，不为和）&lt;/B&gt;&lt;/FONT&gt;。&lt;BR&gt;<br/>假如今年是狗年，则由狗年为起始生肖，代表如下∶<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TABLE cellSpacing=0 cellPadding=3 border=0&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TBODY&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;狗&nbsp;&nbsp; 01 , 13 , 25 , 37 , 49&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 鼠&nbsp;&nbsp; 11 , 23 , 35 , 47&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 牛&nbsp;&nbsp; 10 , 22 , 34 , 46&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 虎&nbsp;&nbsp; 09 , 21 , 33 , 45&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 兔&nbsp;&nbsp; 08 , 20 , 32 , 44&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 龙&nbsp;&nbsp; 07 , 19 , 31 , 43&lt;BR&gt;&lt;/TD&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD width=20&gt;&lt;/TD&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;&lt;p&gt;蛇&nbsp;&nbsp; 06 , 18 , 30 , 42&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 马&nbsp;&nbsp; 05 , 17 , 29 , 41&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 羊&nbsp;&nbsp; 04 , 16 , 28 , 40&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 猴&nbsp;&nbsp; 03 , 15 , 27 , 39&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 鸡&nbsp;&nbsp; 02 , 14 , 26 , 38&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 猪&nbsp;&nbsp; 12 , 24 , 36 , 48&lt;/p&gt;&lt;/TD&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/TBODY&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/TABLE&gt;<br/>&nbsp;&nbsp; &lt;B&gt;&lt;FONT color=blue&gt;尾数投注&lt;/FONT&gt;(请在“一肖尾数七色波”页面中投注)&lt;/B&gt;&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; 指开奖&lt;FONT color=red&gt;&lt;B&gt;7个号码中&lt;/B&gt;&lt;/FONT&gt;含有所属尾数的一个或多个号码，但派彩只派一次，即不论同尾数号码出现一个或多个号码都只派彩一次。&lt;BR&gt;<br/>&nbsp;&nbsp;&nbsp; &lt;TABLE cellPadding=2 border=0&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TBODY&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;0 尾&nbsp;&nbsp; 10 , 20 , 30 , 40 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD width=20&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;1 尾&nbsp;&nbsp; 01 , 11 , 21 , 31 , 41 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD width=20&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;2 尾&nbsp;&nbsp; 02 , 12 , 22 , 32 , 42 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;3 尾&nbsp;&nbsp; 03 , 13 , 23 , 33 , 43 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD width=20&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;4 尾&nbsp;&nbsp; 04 , 14 , 24 , 34 , 44 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD width=20&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;5 尾&nbsp;&nbsp; 05 , 15 , 25 , 35 , 45 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;6 尾&nbsp;&nbsp; 06 , 16 , 26 , 36 , 46 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD width=20&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;7 尾&nbsp;&nbsp; 07 , 17 , 27 , 37 , 47 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD width=20&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;8 尾&nbsp;&nbsp; 08 , 18 , 28 , 38 , 48 <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;TD&gt;9 尾&nbsp;&nbsp; 09 , 19 , 29 , 39 , 49 &lt;/TD&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/TR&gt;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/TBODY&gt;<br/>&nbsp;&nbsp;&nbsp; &lt;/TABLE&gt;<br/>&nbsp;&nbsp;&nbsp; 例如∶开奖结果正码是 11、31、42、44、35、32 特别号码是 21，则 1 尾 2 尾 4 尾 5 尾都为中奖，其他尾数都不中奖。&lt;FONT color=red&gt;&lt;B&gt;（此玩法49亦算输赢，不为和）&lt;/B&gt;&lt;/FONT&gt;。&lt;/LI&gt;&lt;BR&gt;<br/><br/>&lt;B&gt;&lt;FONT color=blue&gt;七色波&lt;/FONT&gt;(请在“一肖尾数七色波”页面中投注)&nbsp; &lt;/b&gt;&lt;br&gt;<br/>&nbsp;指开出的&lt;FONT color=red&gt;&lt;B&gt;7个彩球中&lt;/B&gt;&lt;/FONT&gt;，那种颜色最多为中奖。开出的6个正码各以1个色波计，特别号以1.5个色波计。而以下3种结果视为和局：&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;(1)6个正码开出3蓝3绿，而特码是1.5红&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;(2)6个正码开出3蓝3红，而特码是1.5绿&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;(3)6个正码开出3绿3红，而特码是1.5蓝&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;如果出现和局，所有投注红、绿、蓝七色波的金额将全数退回，会员也可以投注和局。&lt;/LI&gt;<br/>&nbsp;&nbsp;&nbsp; &nbsp;&lt;li&gt;&lt;b&gt;全不中&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;&lt;/b&gt;指所选择的所有号码都不出现在开奖的7个号码当中视为中奖，其余情况一律视为不中奖。&lt;FONT color=red&gt;&lt;B&gt;（此玩法49亦算输赢，不为和）&lt;/B&gt;&lt;/FONT&gt;&lt;/li&gt;<br/>&nbsp;&nbsp; &nbsp;&lt;li&gt;&lt;b&gt;多中一&lt;/b&gt;&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;所选择的号码在正码1-正码6里只出现一次且不能出现在特码中。&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;例如:开奖号码为01,02,03,04,05,06 + 07&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;投注01,02,03(三中一),为不中奖.&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;投注01,10,07(三中一),为不中奖.&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;投注01,10,20(三中一),为中奖.&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;投注02,22,32(三中一),为中奖.&lt;/li&gt;<br/>&nbsp;&nbsp; &nbsp;&lt;li&gt;&lt;b&gt;尾数连&lt;br&gt;&lt;/b&gt;<br/>&nbsp;&nbsp; &nbsp;（尾数所对应的号码和尾数项目的一样；一个尾数对应多个号码，不论同尾数的号码出现一个或多个，派彩只派一次。每个尾数都有自己的赔率，下注组合的总赔率，取该组合尾数的最低赔率為总赔率。） <br/>&nbsp;&nbsp; &nbsp;二尾连（ 中 <br/>&nbsp;&nbsp; &nbsp;）：选择二个尾数為一投注组合进行下注。该注的二个尾数必须在当期开出的7个开奖号码相对应的尾数中，视為中奖。二尾连（不中）：选择二个尾数為一投注组合进行下注。该注的二个尾数必须没在当期开出的7个开奖号码相对应的尾数中，视為中奖。三尾连,四尾连同样道理.&lt;/li&gt;<br/>&nbsp;&nbsp; &nbsp;&lt;li&gt;&lt;b&gt;七码&lt;/b&gt;&lt;br&gt;<br/>&nbsp;&nbsp; &nbsp;挑选1行投注，估猜七个开奖号码中“大、小、单、双”各有多少个。例如：投注“0”个“单”，若该期开出的七个号码中一个单数号码都没出现即为中奖，若七个号码中有一个或多个单数出现都不中奖。&lt;FONT color=red&gt;&lt;B&gt;（若7个号码中有49则号码此和，故去掉此号码余六个号码判别输赢)&lt;/B&gt;&lt;/FONT&gt;。&lt;/li&gt;<br/>&nbsp;&lt;/OL&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/></p>', null, '0', '0', '1', null, '1544603777', '1544603777', null);

-- ----------------------------
-- Table structure for `article_class`
-- ----------------------------
DROP TABLE IF EXISTS `article_class`;
CREATE TABLE `article_class` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(32) DEFAULT NULL COMMENT '编码',
  `cname` varchar(32) NOT NULL COMMENT '名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `state` tinyint(2) DEFAULT '1',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文章分类';

-- ----------------------------
-- Records of article_class
-- ----------------------------
INSERT INTO `article_class` VALUES ('1', '0', 'notice', '系统公告', '1', '1', '1514282181', '1544602970', null);
INSERT INTO `article_class` VALUES ('2', '0', 'question', '常见问题', '2', '1', '1533278774', '1544520264', null);
INSERT INTO `article_class` VALUES ('3', '2', null, '资金安全', '0', '1', '1536646138', '1536646138', null);
INSERT INTO `article_class` VALUES ('4', '2', null, '任务过程', '0', '1', '1536646364', '1536646364', null);
INSERT INTO `article_class` VALUES ('5', '2', null, '邀请好友', '0', '1', '1536646375', '1536646375', null);
INSERT INTO `article_class` VALUES ('6', '2', null, '其他', '0', '1', '1536646384', '1536646384', null);
INSERT INTO `article_class` VALUES ('7', '0', null, '系统消息', '1', '1', '1543916818', '1544520262', null);
INSERT INTO `article_class` VALUES ('8', '0', null, '系统文章', '0', '1', '1544602960', '1544602960', null);

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL DEFAULT '0',
  `webname` varchar(50) DEFAULT NULL COMMENT '网站名称',
  `websname` varchar(128) DEFAULT NULL COMMENT '网站简称',
  `webemail` varchar(50) DEFAULT NULL COMMENT '网站email',
  `gonggao` longtext,
  `dizhi` varchar(100) DEFAULT NULL COMMENT '地址',
  `youbian` varchar(10) DEFAULT NULL COMMENT '邮编',
  `dianhua` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `copyright` varchar(100) DEFAULT NULL COMMENT '版权信息',
  `weburl` varchar(100) DEFAULT NULL,
  `zhang` varchar(250) DEFAULT NULL,
  `weblogin` varchar(50) DEFAULT NULL,
  `tom1` varchar(50) DEFAULT NULL,
  `tomurl` varchar(50) DEFAULT NULL,
  `flash` varchar(50) DEFAULT NULL,
  `cegg` varchar(50) DEFAULT NULL,
  `ceggurl` varchar(50) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `about` longtext,
  `mail` longtext,
  `help` longtext,
  `copy` longtext,
  `tl1` varchar(50) DEFAULT NULL,
  `tl2` varchar(50) DEFAULT NULL,
  `tl3` varchar(50) DEFAULT NULL,
  `tl1url` varchar(50) DEFAULT NULL,
  `tl2url` varchar(50) DEFAULT NULL,
  `tl3url` varchar(50) DEFAULT NULL,
  `tycom` int(11) DEFAULT NULL,
  `recruit` longtext,
  `brand` longtext,
  `jifei` int(11) DEFAULT NULL,
  `jifei2` int(11) DEFAULT NULL,
  `dtime` varchar(50) DEFAULT NULL,
  `dtime2` varchar(50) DEFAULT NULL,
  `dtime3` varchar(50) DEFAULT NULL,
  `tl4` varchar(50) DEFAULT NULL,
  `tl4url` varchar(50) DEFAULT NULL,
  `tl5` varchar(50) DEFAULT NULL,
  `tl5url` varchar(50) DEFAULT NULL,
  `lmg` longtext,
  `msg` longtext,
  `hits` int(11) DEFAULT NULL,
  `map` longtext,
  `zhwl` longtext,
  `xt` longtext,
  `a1` longtext,
  `a2` longtext,
  `a3` longtext COMMENT '用户规则说明',
  `a4` longtext,
  `a5` longtext,
  `a6` longtext,
  `a7` longtext,
  `a8` longtext,
  `a9` longtext,
  `a10` longtext,
  `a11` longtext,
  `tm` double DEFAULT NULL,
  `tmdx` double DEFAULT NULL,
  `tmps` double DEFAULT NULL,
  `zm` double DEFAULT NULL,
  `zmdx` double DEFAULT NULL,
  `ggpz` double DEFAULT NULL,
  `sanimal` int(11) DEFAULT NULL,
  `affice` longtext,
  `fenb` int(11) DEFAULT NULL,
  `haffice2` longtext,
  `atm` double DEFAULT NULL,
  `btm` double DEFAULT NULL,
  `ctm` double DEFAULT NULL,
  `dtm` double DEFAULT NULL,
  `atmdx` double DEFAULT NULL,
  `btmdx` double DEFAULT NULL,
  `ctmdx` double DEFAULT NULL,
  `dtmdx` double DEFAULT NULL,
  `azt` double DEFAULT NULL,
  `bzt` double DEFAULT NULL,
  `czt` double DEFAULT NULL,
  `dzt` double DEFAULT NULL,
  `aztdx` double DEFAULT NULL,
  `bztdx` double DEFAULT NULL,
  `cztdx` double DEFAULT NULL,
  `dztdx` double DEFAULT NULL,
  `azm` double DEFAULT NULL,
  `bzm` double DEFAULT NULL,
  `czm` double DEFAULT NULL,
  `dzm` double DEFAULT NULL,
  `azmdx` double DEFAULT NULL,
  `bzmdx` double DEFAULT NULL,
  `czmdx` double DEFAULT NULL,
  `dzmdx` double DEFAULT NULL,
  `azm6` double DEFAULT NULL,
  `bzm6` double DEFAULT NULL,
  `czm6` double DEFAULT NULL,
  `dzm6` double DEFAULT NULL,
  `abb` double DEFAULT NULL,
  `bbb` double DEFAULT NULL,
  `cbb` double DEFAULT NULL,
  `dbb` double DEFAULT NULL,
  `asx` double DEFAULT NULL,
  `bsx` double DEFAULT NULL,
  `csx` double DEFAULT NULL,
  `dsx` double DEFAULT NULL,
  `asx6` double DEFAULT NULL,
  `bsx6` double DEFAULT NULL,
  `csx6` double DEFAULT NULL,
  `dsx6` double DEFAULT NULL,
  `asxp` double DEFAULT NULL,
  `bsxp` double DEFAULT NULL,
  `csxp` double DEFAULT NULL,
  `dsxp` double DEFAULT NULL,
  `ath` double DEFAULT NULL,
  `bth` double DEFAULT NULL,
  `cth` double DEFAULT NULL,
  `dth` double DEFAULT NULL,
  `athdx` double DEFAULT NULL,
  `bthdx` double DEFAULT NULL,
  `cthdx` double DEFAULT NULL,
  `dthdx` double DEFAULT NULL,
  `opwww` int(11) DEFAULT '0' COMMENT '系统状态判断 1正在维护中  0正常',
  `bzx` double DEFAULT NULL,
  `czx` double DEFAULT NULL,
  `dzx` double DEFAULT NULL,
  `blx` double DEFAULT NULL,
  `clx` double DEFAULT NULL,
  `dlx` double DEFAULT NULL,
  `iszhudan` int(11) DEFAULT NULL,
  `byszh` double DEFAULT '0',
  `cyszh` double DEFAULT '0',
  `dyszh` double DEFAULT '0',
  `bysdw` double DEFAULT '0',
  `cysdw` double DEFAULT '0',
  `dysdw` double DEFAULT '0',
  `bysdd` double DEFAULT '0',
  `cysdd` double DEFAULT '0',
  `dysdd` double DEFAULT '0',
  `besdw` double DEFAULT '0',
  `cesdw` double DEFAULT '0',
  `desdw` double DEFAULT '0',
  `beszh` double DEFAULT '0',
  `ceszh` double DEFAULT '0',
  `deszh` double DEFAULT '0',
  `beshs` double DEFAULT '0',
  `ceshs` double DEFAULT '0',
  `deshs` double DEFAULT '0',
  `bssdw` double DEFAULT '0',
  `cssdw` double DEFAULT '0',
  `dssdw` double DEFAULT '0',
  `bsszh` double DEFAULT '0',
  `csszh` double DEFAULT '0',
  `dsszh` double DEFAULT '0',
  `bsshs` double DEFAULT '0',
  `csshs` double DEFAULT '0',
  `dsshs` double DEFAULT '0',
  `bgd` double DEFAULT '0',
  `cgd` double DEFAULT '0',
  `dgd` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '我的六合彩', '六合彩', 'tianyu572821@21cn.com', null, '深圳电子科技大厦', '518000', '15016610973', '鑫安网络技术', '', '4b363c025359e921f081644cf172bd09', '', 'img/2004921144751.gif', 'index.asp', '', 'img/00252.jpg', 'index.asp', '', '<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 厦门位于我国东南沿海，与台湾、彭湖列岛隔海相望，它是福建省第二大城市，也是中国最早的四个经济特区之一，由湖里区、开元区、思明区、鼓浪屿区、杏林区、集美区及同安区组成，面积为1516平方公里，是闽南、赣南、湘南的东向出海口，日后将会发展成为环太平洋的国际性海港。 <BR><BR>　　厦门别称“鹭城”，风景秀丽，气候宜人，又有“海上花园”、“海上明珠”的称誉，是我国著名的旅游城市；近代以来，这里曾有过中西文化碰撞及交融的历史，形成了厦门独特的人文景观，在建筑方面体现得尤其突出。 <BR><BR>　　厦门也是一个著名的侨乡，在海外的厦门籍华侨、华人有35万人。 <BR><BR>　　当您一踏足厦门这座城市，就会被旖旎的风光和怡人的景致所陶醉。投入绚丽多姿、魅力无尽的港口风景之都，高楼大厦、山光水色、繁华市井、人间美食、新潮商品、斑澜夜色，到处尽是一派歌舞升平的景象，向您展示其婀娜妩媚、温柔多情的千姿百态。 <BR><BR>　　厦门是一座海港风景城市，位于东经118°04\'04\'，北纬24°26\'46\'，地处福建省东南部九龙江入海处.厦门属亚热带海洋性气候，温和多雨，夏无酷署，冬无严寒，年平均气温为21℃，年平均降雨量在1100毫米左右，常向主导风力为东北风。由于太平洋温差气流关系，厦门每年平均受台风影响5-6次，且多集中在7-9月。1998年末厦门市总人口有126.59万人，其中非农业人口约占46.87%。全市民族以汉族居多，占总人口的99.9%，此外还有回、满、壮、畲、苗、高山等20多个少数民族。 <BR><BR>　　人类生活在厦门岛上，可以追朔到距今三四千年的新石器时代晚期。而有文字记载的历史，则始自唐朝中期，至今已有1140多年了。唐朝天宝年间，汉族人薛姓和陈姓从闽东的福安和闽南的漳州移民入岛，分别在洪济山下的南北麓聚族而居。厦门市的行政建制始于宋朝，属泉州府同安县。明初洪武二十年(1387年)，朝廷开始在岛上筑城寨，置卫所，城名“厦门”，意寓“祖国大厦之门”。厦门的地名，从此确立。此后数百年间，厦门也曾改名为“思明州”“思明县”等。1933年厦门正式设市，成为福建省设立的第一个市。<BR>　　厦门属亚热带气候，温和多雨，年平均气温在21°C左右。夏无酷暑，冬无严寒。年平均降水量在1200毫米左右，5～8月份雨量多，风力一般3至4级，常向主导风力为东北风。由于太平洋温差气流的关系，每年平均受4－5次台风的影响，且多集中在7－9月份。&nbsp;<BR><BR>　　行政区域&nbsp;<BR><BR>　　厦门市现辖有思明、开元、鼓浪屿、湖里、集美、杏林、同安七个区。其中厦门本岛内的思明、开元、鼓浪屿、湖里四个区为经济特区。思明区以商业闹市区为主；开元区以工厂区和新市区为主；鼓浪屿区是著名的风景旅游区；湖里区则是新兴的工业投资区。岛外的集美区以农业为主，包括以旅游、教育为主的著名侨乡集美镇；杏林区是已具一定规模的工业区和台商投资区。同安区则是全市的农副产品基地和轻工、食品行业的原料基地。&nbsp;<BR><BR>　　历史沿革&nbsp;<BR><BR>　　相传遥远的古代，常有成群的白鹭&nbsp;息在厦门岛上，因此，厦门又称为鹭岛、鹭洲、鹭屿、鹭城、鹭津、鹭门，厦鼓海峡称为鹭江。&nbsp;<BR><BR>　　人类生活在厦门岛上，可以追溯到距今三四千年的新石器时代晚期。而有文字记载的历史，则始自唐朝中时，至今已有１１４０多年了。&nbsp;<BR><BR>　　唐朝天宝年间，汉族人薛姓和陈姓从闽东的福安和闽南的漳洲移民入岛，分别在洪济山下的南北面聚族而居，并出现“新城”的地名，旋改名“嘉禾里”，隶属于情源郡南安县大同场。五代闽承隆元年（９３９年），大同场升格建同安县，嘉禾里归同安县管辖。明初洪武二十七年（１３９４年），朝廷在岛上筑城寨，置卫所，城名“厦门”，卫所称“巾左所”。厦门的地名，从此确立。此后数百年间，厦门也曾改名为“思明州”“思明县”等。１９３５年厦门正式设市。</P>', null, '服务项目设置', '站点申明：拥护中华人民共和国法律，本站不做一切国家法律禁止的内容，如发现不良图片内容请\n告知站长，站长会在第一时间删除！ <br />\n        Copyright &copy; 2006 All Rights Reserved 版权所有 鑫安科技 ', null, null, null, null, null, null, '1336', '<TABLE cellSpacing=0 cellPadding=0 width=\"95%\" align=center border=0>\n<TBODY>\n<TR>\n<TD class=font1 background=img/point_line_h.gif colSpan=2 height=1></TD></TR>\n<TR>\n<TD colSpan=2 height=10></TD></TR>\n<TR>\n<TD class=font2 colSpan=2 height=36><B><FONT color=#cc6600>市场人员</FONT></B></TD></TR>\n<TR>\n<TD class=font1 vAlign=top width=250 height=10>岗位名称：市场人员<BR>招聘部门：市场部<BR>工作地点：厦门<BR>有效时限：</TD>\n<TD class=font1 vAlign=top height=10>岗位要求：<BR>相关专业毕业，20-35岁之间，两年以上市场营销经验，五官端正，反应灵活，工作塌实，能吃苦耐劳。</TD></TR>\n<TR>\n<TD class=font1 colSpan=2 height=36><A href=\"jobz.asp?id=市场人员\"><IMG height=18 src=\"img/bt_wantjob.gif\" width=40 border=0></A></TD></TR>\n<TR bgColor=#dddddd>\n<TD class=font1 colSpan=2 height=1></TD></TR>\n<TR>\n<TD class=font1 colSpan=2 height=15></TD></TR></TBODY></TABLE>\n<TABLE cellSpacing=0 cellPadding=0 width=\"95%\" align=center border=0>\n<TBODY>\n<TR>\n<TD class=font1 background=img/point_line_h.gif colSpan=2 height=1></TD></TR>\n<TR>\n<TD colSpan=2 height=10></TD></TR>\n<TR>\n<TD class=font2 colSpan=2 height=36><B><FONT color=#cc6600>网络管理员</FONT></B></TD></TR>\n<TR>\n<TD class=font1 vAlign=top width=250 height=10>岗位名称：网络管理员<BR>招聘部门：网络部<BR>工作地点：厦门<BR>有效时限：2个月<BR>联系信箱：<A class=nav href=\"mailto:web@xx.cn\">web@xx.cn</A></TD>\n<TD class=font1 vAlign=top height=10>岗位要求：<BR>1) 熟悉互联网信息技术应用<BR>2）敬业精神与学习能力<BR></TD></TR>\n<TR>\n<TD class=font1 colSpan=2 height=36><A href=\"jobz.asp?id=网络管理员\"><IMG height=18 src=\"img/bt_wantjob.gif\" width=40 border=0></A></TD></TR>\n<TR bgColor=#dddddd>\n<TD class=font1 colSpan=2 height=1></TD></TR>\n<TR>\n<TD class=font1 colSpan=2 height=15></TD></TR></TBODY></TABLE>\n<TABLE cellSpacing=0 cellPadding=0 width=\"95%\" align=center border=0>\n<TBODY>\n<TR>\n<TD class=font1 background=img/point_line_h.gif colSpan=2 height=1></TD></TR>\n<TR>\n<TD colSpan=2 height=10></TD></TR>\n<TR>\n<TD class=font2 colSpan=2 height=36><B><FONT color=#cc6600>总经理助理</FONT></B></TD></TR>\n<TR>\n<TD class=font1 vAlign=top width=250 height=10>岗位名称：总经理助理<BR>招聘部门：办公室<BR>工作地点：厦门<BR>有效时限：长期<BR>联系信箱：<A class=nav href=\"mailto:web@xx.cn\">web@xx.cn</A></TD>\n<TD class=font1 vAlign=top height=10>岗位要求：<BR>相关专业本科以上学历，有5年以上管理工作经验，刻苦钻研，有奉献的精神。一经录用，待遇从优。</TD></TR>\n<TR>\n<TD class=font1 colSpan=2 height=36><A href=\"jobz.asp?id=总经理助理\"><IMG height=18 src=\"img/bt_wantjob.gif\" width=40 border=0></A></TD></TR>\n<TR bgColor=#dddddd>\n<TD class=font1 colSpan=2 height=1></TD></TR>\n<TR>\n<TD class=font1 colSpan=2 height=15></TD></TR></TBODY></TABLE>', '<P>会员俱乐部设置</P>\r\n', '100', null, null, null, null, null, null, null, null, '<UL>\r\n<LI>\r\n<DIV align=left><FONT color=#666666>厦门是一个美丽的海滨城市，风景秀丽，是一个极富吃、喝、玩、乐的小岛。</FONT></DIV></LI>\r\n<LI>\r\n<DIV align=left><FONT color=#666666>你工作累了吗？心情不好吗？想换个环境度过周末吗？想认识一些厦门的大学生朋友吗？来吧，带上行囊登上旅程吧!</FONT></DIV></LI>\r\n<LI>\r\n<DIV align=left><FONT color=#666666>我们有很多大部分由厦门各大学院的学生为您带路，咨询、接送。</FONT></DIV></LI>\r\n<LI>\r\n<DIV align=left><FONT color=#666666>你再也不用为大笔的旅游基金烦恼，不用担心旅行社的单一选择。我们是旅行的“沃尔玛”。您可以在我们下方的旅游自助中选取你想要的旅行点，不只有风景哦，还有吃的、喝的、玩的地方，你只要象超市购物一样，放进行李筐，我们会帮你根据时间长短来进行路线安排。（完全免费哦）<BR>&nbsp;&nbsp; </FONT></DIV></LI></UL>', '<P>商务秘书设置</P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本站为了方便各类商务人士，特聘请各类专业人才为所有来厦门投资、观光、会展等人士提供各国专业翻译人才、市场调查、伴游、礼仪等各类服务。</P>\r\n<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;详情请咨询钱小姐</P>', '2732', null, null, null, '   <BR>\r\n                    <CENTER>\r\n                      <H3><FONT color=red>用户协议与游戏规则</FONT></H3>\r\n                    </CENTER>\r\n                  <TABLE cellSpacing=0 width=\"90%\" align=center border=0 cellpading=\"0\">\r\n                      <TBODY>\r\n                        <TR class=normal>\r\n                          <TD width=\"2%\" height=\"25\" align=\"center\" valign=\"middle\"> </TD>\r\n                                                 <TR class=normal>\r\n                          <TD height=\"25\" align=\"center\" valign=\"middle\"> </TD>\r\n                          <TD align=\"left\" valign=\"middle\" style=\"LINE-HEIGHT: 23px\"> </TD>\r\n\r\n     <style type=\"text/css\">\r\n<!--\r\n.STYLE1 {color: #FF0000}\r\n-->\r\n</style>\r\n<TABLE cellSpacing=\"1\" cellPadding=\"2\" width=\"100%\" align=\"center\" border=\"0\">\r\n                            <TBODY>\r\n                              <TR>\r\n                                <TD vAlign=\"top\" width=\"100%\" colSpan=\"2\" style=\"LINE-HEIGHT: 23px\"><UL>\r\n                                    <LI>如果客户怀疑自己的资料被盗用，应立即通知本公司，及时更改资料，以前的使用者名称及密码全部无效。   \r\n                                    <LI>客户有责任确保自己的帐户及登入资料的保密性。以使用者名称及密码进行的任何网上投注都被视为有效。   \r\n                                    <LI>客户一经在本公司开户或投注，即被认为已接受这些规则。   \r\n                                    <LI>如本公司察觉会员投注状况异常，得即时中止会员投注，在本公司中止下注前，会员之所有投注仍属有效，不得要求取消或延期交收，以及不得有任何异议。   \r\n                                    <LI>如本公司主机房遇天灾、停电或不可抗力之因素，致无法运作时，得中止所有未开奖之投注，在本公司中止下注前，会员之所有投注仍属有效，不得要求取消或延期交收，以及不得有任何异议。     \r\n                                    <LI>如因本网站触犯当地法律，本公司概不负责。<BR>\r\n\r\n\r\n                                    <LI>以下所有投注皆含本金。   \r\n                                    <LI>特码逢双为特双，特码逢单为特单，49号为和局。   \r\n                                    <LI>特码(01~24)为小；特码(25~48)为大。49号为和局.   \r\n                                    <LI>两面（指大、小、单、双、合双合单、家禽、野兽）。49号为和局.  \r\n                                    <LI>六合彩开奖七粒总和(包括特码)。   \r\n                                    <LI><span class=\"STYLE2\"> 特别号码： </span>香港六合彩公司当期开出的最後一码为特码；特码大小：开出之特码大於或等於25为特码大，小於或等於24为特码小；   特码单双：特码为双数叫特双，如2、18；特码为单数叫特单，如17、33。   \r\n                                    <LI><span class=\"STYLE2\">正码：</span>六合彩公司当期开出之前6个号码叫正码。第一时间出来的叫正码1，依次叫正码2、正码3……正码6，不以大小排序。     \r\n                                    <LI><span class=\"STYLE2\">总分大小：</span>所有七个开奖号码的分数总和大於或等於175为总分大；分数总和小於或等於174为总分小。如开奖号码为01、07、15、29、38、46、24，分数总和是160，为总分小。     \r\n                                    <LI><span class=\"STYLE2\">总分单双：</span>所有七个开奖号码的分数总和是单数叫总分单(总单)，如分数总和是103、193；分数总和是双数叫总分双(总双)，如分数总和是108、160。     \r\n                                    <LI><span class=\"STYLE2\">正特：</span>正1特、正2特、正3特、正4特、正5特、正6特:指下注的正码特与现场滚波开出之正码其开奖顺序及开奖号码相同，视为中奖，例如：现场开奖第三个正码为29号，下注第三个正码特为29则视为中奖，其它号码视为不中奖，其他正特项目依此类推。     \r\n                                    <LI>正码1、正码2、正码3、正码4、正码5、正码6的大小单双和特别号码的大小单双规则相同，如正码1为25，则正码1为大，为单；正码2为4，则正码2为小，为双；号码49，则为和。     \r\n                                    <LI><span class=\"STYLE2\">特码合数单双：</span>指开出的特码的个位数加上十位数之和为奇数称合数单，之和为偶称合数双，其中号码49为和。例如：合数单，01为0+1=1，23为2+3=5；合数双，28为2+8=10，39为3+9=12；49为和。     \r\n                                    <LI><span class=\"STYLE2\">波色：</span>指开出特码所属的颜色。<BR>\r\n                                      <span class=\"STYLE3\">红色</span>号码包括：<span class=\"STYLE3\"><FONT style=\"BACKGROUND-COLOR: #FF0000\">01，02，07，08，12，13，18，19，23，24，29，30，34，35，40，45，46</FONT> </span>；<BR>\r\n                                      <span class=\"STYLE4\">兰色</span>号码包括：<span class=\"STYLE4\"><FONT style=\"BACKGROUND-COLOR:#46A3FF\">03，04，09，10，14，15，20，25，26，31，36，37，41，42，47，48</FONT></span>；<BR>\r\n                                      <span class=\"STYLE5\">绿色</span>号码包括：<span class=\"STYLE5\"><FONT style=\"BACKGROUND-COLOR:#53FF53\">05，06，11，16，17，21，22，27，28，32，33，38，39，43，44，49</FONT> </span>。   \r\n                                    <LI><span class=\"STYLE2\">特码生肖：</span>指开奖的第7个号码（特别号码）是所属生肖的号码，就算中奖。<BR>\r\n                                      虎包括：   02 14 26 38 ；兔包括： 01 13 25 37 49；龙包括： 12 24 36  48；蛇包括：11 23 35 47；<BR>\r\n                                      马包括： 10 22 34 46；羊包括： 09 21 33  45；猴包括： 08 20 32 44；鸡包括： 07 19 31 43；<BR>\r\n                                      狗包括： 06 18 30 42；猪包括：  05 17 29 41；鼠包括： 04 16 28 40；牛包括： 03 15 27 39。<BR>\r\n                                                                    <LI><span class=\"STYLE2\">尾数(平特尾)：</span>指开出的正码和特别号码中含有所属尾数的号码，就算中奖号码重复开出来的也只计算一次中奖！<BR>\r\n                                      “1”尾：01.11.21.31.41；“2”尾：02.12.22.32.42；“3”尾：03.13.23.33.43；“4”尾：04.14.24.34.44；<BR>\r\n                                      “5”尾：05.15.25.35.45；“6”尾：06.16.26.36.46；“7”尾：07.17.27.37.47；“8”尾：08.18.28.38.48；<BR>\r\n                                      “9”尾：09.19.29.39.49；“0”尾：10.20.30.40<BR>\r\n                                      例如：开奖结果正码是01、02、03、04、05、06特别号码是07   则1，2，3, 4，5, 6，7尾就中奖，其它尾数都不中奖。   \r\n                                    <LI><span class=\"STYLE2\">连码：</span>\r\n                                        <TABLE borderColor=\"#ffffff\" cellSpacing=\"1\" cellPadding=\"2\" width=\"94%\" align=\"center\" bgColor=\"#999999\" border=\"1\">\r\n                                          <TBODY>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD align=\"center\" width=\"8%\" bgColor=\"#cccccc\"><span class=\"STYLE3\">三中二</span></TD>\r\n                                              <TD width=\"90%\"><span class=\"STYLE6\">所投注的每三个号码为一组合，若其中2个是开奖号码中的正码，视为中奖，叫三中二；若3个都是开奖号码中的正码，叫三中二之中三，其余情形视为不中奖，如03、04、05为一组合，开奖结果中有03、04两个正码，没有05，叫三中二，按三中二赔付；如开奖中有03、04、05三个正码，叫三中二之中三，按中二赔付；如出现1个或没有，视为不中奖。</span></TD>\r\n                                            </TR>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"center\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">三全中</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">每三号码为一组合，若三个号码都是开奖号码之正码，视为中奖，其余情形视为不中奖。如03、04、05三个都是开奖号码之正码，视为中奖，如两个正码加上一个特别号码，视为不中奖。</span></TD>\r\n                                            </TR>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">二全中</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">每二个号码为一组合，二个号码都是开奖号码之正码，视为中奖，其余情形视为不中奖（含一个正码加一个特别号码之情形）。</span></TD>\r\n                                            </TR>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"center\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">二中特</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">二中特.中二就是中了两个正码视为中.中特:一个中特一个正码.算为中.</span></TD>\r\n                                            </TR>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">特 串</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">每二个号码为一组合，其中一个是正码，一个是特别号码，视为中奖，其余情形视为不中奖（含二个号码都是正码之情形）。</span></TD>\r\n                                            </TR>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"center\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">拖   头</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">拖头是多组连码的简化叫法。 如二中二之8拖18、28、13、25，即是4组：8-18、8-28、8-13、8-25；   如三中二之8、18拖19、20、21，即是三组：8-18-19、8-18-20、8-18-21。</span></TD>\r\n                                            </TR>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"center\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">复   式</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">复式是多个号码的不完全重复组合。</span></TD>\r\n                                            </TR>\r\n                                          </TBODY>\r\n                                        </TABLE>\r\n            \r\n                             <LI><span class=\"STYLE2\">合肖：</span>挑选2-11生肖(排列如同生肖)为一个组合，并选择开奖号码的特码是否在此组合内(49号除外)，若开奖号码的特码亦在此组合内 ，即视为中奖；若当期特码开出49号，则所有组合皆视为和局。\r\n                                    <LI><span class=\"STYLE2\">半波：</span>以特码色波和特单，特双，特大，特小为一个投注组合，当期特码开出符合投注组合，即视为中奖。   \r\n              <LI><span class=\"STYLE2\">一肖（特平肖）：</span>挑选1个生肖(排列如同生肖)投注，并选择开奖出来的正码和特码是否在此生肖内，若开奖号码的正码和特码亦在此组合内 ，即视为中奖；重复开出来的也只计算一次中奖！\r\n                    <LI><span\r\nclass=\"STYLE2\">生肖连：</span>（生肖的所对应的号码和特码生肖项目的一样，一个生肖的对应多个号码，无论同生肖的号码出现一个或多个，派彩只一次。每个生肖都有自己的赔率，下注组合的总赔率。取该组合生肖的最低赔率为总赔率。\r\n   <TABLE borderColor=\"#ffffff\" cellSpacing=\"1\" cellPadding=\"2\" width=\"94%\" align=\"center\" bgColor=\"#999999\" border=\"1\">\r\n                                          <TBODY>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD align=\"center\" width=\"8%\" bgColor=\"#cccccc\"><span class=\"STYLE3\">二肖连[ 中 ]</span></TD>\r\n                                              <TD width=\"90%\"><span class=\"STYLE6\">选择两个生肖为一投注组合进行投注。该投注的两个生肖必须在当期开出的7个开奖号码相对应的生肖中，视为中奖。</span></TD>\r\n                                            </TR>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">三肖连[ 中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择三个生肖为一投注组合进行投注。该投注的三个生肖必须在当期开出的7个开奖号码相对应的生肖中，视为中奖。</span></TD>\r\n                                            </TR>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">四肖连[ 中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择四个生肖为一投注组合进行投注。该投注的四个生肖必须在当期开出的7个开奖号码相对应的生肖中，视为中奖。</span></TD>\r\n                                            </TR>\r\n<TR bgColor=\"#ffffdd\"> <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">五肖连[ 中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择五个生肖为一投注组合进行投注。该投注的五个生肖必须在当期开出的7个开奖号码相对应的生肖中，视为中奖。</span></TD>  </TR>\r\n<TR bgColor=\"#ffffdd\"> <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">二肖连[ 不中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择二个生肖为一投注组合进行投注。该投注的二个生肖必须都不在当期开出的7个开奖号码相对应的生肖中，视为中奖。</span></TD>  </TR>   \r\n<TR bgColor=\"#ffffdd\"> <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">三肖连[ 不中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择三个生肖为一投注组合进行投注。该投注的三个生肖必须都不在当期开出的7个开奖号码相对应的生肖中，视为中奖。</span></TD>  </TR> \r\n<TR bgColor=\"#ffffdd\"> <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">四肖连[ 不中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择四个生肖为一投注组合进行投注。该投注的四个生肖必须都不在当期开出的7个开奖号码相对应的生肖中，视为中奖。</span></TD>  </TR>                                                             </TR>\r\n                                          </TBODY>\r\n                                        </TABLE> <LI><span\r\nclass=\"STYLE2\">尾数连：</span>（尾数的所对应的号码和特码尾数项目的一样，一个尾数的对应多个号码，无论同尾数的号码出现一个或多个，派彩只一次。每个尾数都有自己的赔率，下注组合的总赔率。取改组合尾数的最低赔率为总赔率。\r\n   <TABLE borderColor=\"#ffffff\" cellSpacing=\"1\" cellPadding=\"2\" width=\"94%\" align=\"center\" bgColor=\"#999999\" border=\"1\">\r\n                                          <TBODY>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD align=\"center\" width=\"8%\" bgColor=\"#cccccc\"><span class=\"STYLE3\">二尾连[ 中 ]</span></TD>\r\n                                              <TD width=\"90%\"><span class=\"STYLE6\">选择两个尾数为一投注组合进行投注。该投注的两个尾数必须在当期开出的7个开奖号码相对应的尾数中，视为中奖。</span></TD>\r\n                                            </TR>\r\n                                                                                       <TR bgColor=\"#ffffdd\">\r\n                                              <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">三尾连[ 中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择三个尾数为一投注组合进行投注。该投注的三个尾数必须在当期开出的7个开奖号码相对应的尾数中，视为中奖。</span></TD>\r\n                                            </TR>\r\n                                                                                        <TR bgColor=\"#ffffdd\"> <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">四尾连[ 中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择四个尾数为一投注组合进行投注。该投注的四个尾数必须在当期开出的7个开奖号码相对应的尾数中，视为中奖。</span></TD>  </TR>\r\n <TR bgColor=\"#ffffdd\"> <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">二尾连[ 不中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择二个尾数为一投注组合进行投注。该投注的二个尾数必须都不在当期开出的7个开奖号码相对应的尾数中，视为中奖。</span></TD>  </TR> <TR bgColor=\"#ffffdd\"> <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">三尾连[ 不中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择三个尾数为一投注组合进行投注。该投注的三个尾数必须都不在当期开出的7个开奖号码相对应的尾数中，视为中奖。</span></TD>  </TR> <TR bgColor=\"#ffffdd\"> <TD vAlign=\"top\" align=\"center\" bgColor=\"#cccccc\"><span class=\"STYLE3\">四尾连[ 不中 ]</span></TD>\r\n                                              <TD vAlign=\"top\"><span class=\"STYLE6\">选择四个尾数为一投注组合进行投注。该投注的四个尾数必须都不在当期开出的7个开奖号码相对应的尾数中，视为中奖。</span></TD>  </TR>                                                                                                                                 </TR>\r\n                                          </TBODY>\r\n                                        </TABLE>\r\n<LI><span class=\"STYLE1\">正肖</span> ：以开出的6个正码做游戏。 将生肖依序排列，例如今年是牛年，就以牛为开始，依顺序将49个号码分为12个生肖(如下)，再以生肖下注。若当期6个正码，只要有1个落在下注生肖范围内，视为中奖。如超过1个正码落在下注生肖范围内 ，派彩将倍增！若只有49号球落点生肖，则视为和局；若尚有其他号码，乃视为中奖。 <br>\r\n									   如：下注＄100.-正肖牛赔率1.88 <br>\r\n									   6个正码开出49，视为和局 <br>\r\n									   6个正码开出01，派彩为＄88.- <br>\r\n									   6个正码开出01，13，派彩为＄176.- <br>\r\n									   6个正码开出01，13，25，派彩为＄264.- <br>\r\n									   6个正码开出01，13，25，37，派彩为＄352.- <br>\r\n									   6个正码开出01，13，25，37，49，派彩为＄352.-\r\n									 <LI><span class=\"STYLE1\">七色波</span> ：以开出的7个色波，那种颜色最多为中奖。 开出的6个正码各以1个色波计，特别号以1.5个色波计。而以下3种结果视为和局。 <br>\r\n									   1/. 6个正码开出3蓝3绿，而特别码是1.5红 <br>\r\n									   2/. 6个正码开出3蓝3红，而特别码是1.5绿 <br>\r\n									   3/. 6个正码开出3绿3红，而特别码是1.5蓝 <br>\r\n								     如果出现和局，所有投注红，绿，蓝七色波的金额将全数退回，会员也可投注和局。\r\n \r\n<LI><span\r\nclass=\"STYLE2\">不中：</span>（挑选的号码，无论号码出现一个或多个，派彩只一次。每个号码都有自己的赔率，下注组合的总赔率。取改组合号码的最低赔率为总赔率。\r\n   <TABLE borderColor=\"#ffffff\" cellSpacing=\"1\" cellPadding=\"2\" width=\"94%\" align=\"center\" bgColor=\"#999999\" border=\"1\">\r\n                                          <TBODY>\r\n                                            <TR bgColor=\"#ffffdd\">\r\n                                              <TD align=\"center\" width=\"8%\" bgColor=\"#cccccc\"><span class=\"STYLE3\">不中 </span></TD>\r\n                                              <TD width=\"90%\"><span class=\"STYLE6\">挑选5-12个号码为一投注。当期开出的7个号码都没有在该下注组合中，即视为中奖。每个号码都有自己的赔率，下注组合的总赔率。取改组合号码的最低赔率为总赔率。</span></TD>\r\n                                            </TR>\r\n                                                                                                        </TR>\r\n                                          </TBODY>\r\n                                        </TABLE>\r\n\r\n   <LI><span class=\"STYLE2\">中一：</span>挑选4-6个号码为一投注，并选择开奖出来的正码和特码是否在此号码内，若开奖号码的正码和特码亦在此组合内 ，即视为中奖；重复开出来的也只计算一次中奖！               \r\n          <LI>本公司保留改正错误和按正确赔率结算的权利。　　　　　　　　　　　　　　　　　　　　　　　　　　　                                                                          \r\n          <LI>任何开奖后的投注都属无效，本公司并保留追究的权利！\r\n　　　　　　　　　　　　　　　　　　<LI><span class=\"STYLE2\">因会员众多赔率经常变动，派彩的赔率将以投注时确认的赔率为准！</LI>\r\n\r\n                                </UL></TD>\r\n                              </TR>\r\n                            </TBODY>\r\n                          </TABLE>         \r\n\r\n                                                                                                                                                      ', '\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n  \r\n \r\n \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n    ', '   <TABLE cellSpacing=0 width=\"90%\" align=center border=0 cellpading=\"0\">\n    <TBODY>\n    <TR class=normal>\n      <TD vAlign=center align=middle width=\"2%\" height=25></TD>\n      <TD width=\"98%\"><SPAN class=STYLE2><B><FONT \n        color=red>游戏规则</FONT></B></SPAN></TD></TR>\n    <TR class=normal>\n      <TD style=\"LINE-HEIGHT: 23px\" vAlign=center>\n        <P></P></TD>\n      <TD style=\"LINE-HEIGHT: 23px\" vAlign=center>1. \n        客户一经在本公司开户或投注，即被视为已接受这些规则。<BR>2. \n        如果客户怀疑自己的资料被盗用，应立即通知本公司，并更改个人详细资料，且之前所使用的使用者名称及密码将全部无效。<BR>3. \n        客户有责任确保自己的帐户及登入资料的保密性。在本网站上以个人的使用者名称及密码进行的任何网上投注将被视为有效。<BR>4. \n        任何更改占成数必须在当期开盘前更改。<BR>5. 为避免发生争议，下注後请检查“<B><FONT \n        color=red>下注成功</FONT></B>”及所下注之折扣及赔率。<BR>6. \n        所有投注产品所公布折扣及赔率当出现任何输入错误或非故意人为失误，公司得保留改正错误和 按正确赔率结算投注的权利。<BR>7. \n        任何的投诉必须在开奖之前提出，<B><FONT color=red>本站</FONT></B>不受理任何开奖之后的投诉。<BR>8. \n        开彩後的投注将视为<B><FONT \n        color=red>无效</FONT></B>，所有赔率及折扣将不时浮动，派彩及计算交收均以确认投注时之赔率及折扣为准。<BR>9. \n        敬告有意与本公司博彩之客户，应注意您所在的国家或居住地可能规定网络博彩不合法，若此情况属实，本公司将不接受任何客户因违反当地博彩或赌博法令所引起之任何责任。<BR>10. \n        本站：有权在任何时候更改或增加这里的任何条款，无须另行通知。</TD>\n    <TR class=normal>\n      <TD vAlign=center align=middle height=25></TD>\n      <TD class=STYLE2 style=\"LINE-HEIGHT: 23px\" vAlign=center \n        align=left><B><FONT color=red>致会员：</FONT></B></FONT> \n</TD></TR></TBODY></TABLE>\n  <TABLE class=ok-tab cellSpacing=0 cellPadding=0 width=\"90%\" align=center \n  border=0>\n    <TBODY>\n    <TR>\n      <TD style=\"LINE-HEIGHT: 23px\">\n        <OL>\n          <LI>当您在下注之后，请等待显示“<FONT color=#ff0000>下注成功</FONT>”信息。 </LI>\n          <LI>为了避免出现争论，您必须在下注之后检查“<FONT color=#ff0000>下注状况</FONT>”。 </LI>\n          <LI>任何的投诉必须在开彩之前提出，本公司不会受理任何开彩之后的投诉。 </LI>\n          <LI>所有投注项目，公布赔率时出现的任何打字错误或非故意人为失误，本公司保留改正错误和按正确赔率结算投注的权力。 </LI>\n          <LI>开彩後的投注，将被视为「<FONT \n          color=#ff0000>无效</FONT>」。所有赔率将不时浮动，派彩时的赔率将以确认投注时之赔率为准。</LI></OL></TD>\n      <OL></OL></TR>\n    <TR>\n      <TD style=\"LINE-HEIGHT: 23px\">\n        <DIV align=center>敬启<BR><FONT \n        color=#cc0000>我了解以及同意贵公司列明的协议和规则。</FONT></DIV></TD></TR></TBODY></TABLE>                                                                                                                                                                                                                                         ', '', '', '', '', '', '', '网站维护中........\n\n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', '', '4.9', '0', '0', '0.5', '0', '5000', '0', '香港六合彩晚上21:30开奖,如有改動一切以香港馬會爲准,本公司于開獎日下午16:00開盤,晚上21:32准時封盤,各會員下注後請即時核對下注狀況,本公司對開獎後所有投注均視爲無效                ', '1', '', null, '0.5', '1', '1.5', null, '0', '0', '0', null, '0.5', '1', '1.5', null, '0', '0', '0', null, '0', '0', '0', null, '0', '0', '0', null, '0', '0', '0', null, '0', '0', '0', null, '0', '0', '0', null, '0', '0', '0', null, '0', '0', '0', null, '0', '0', '0', null, '0.2', '0.4', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `finance`
-- ----------------------------
DROP TABLE IF EXISTS `finance`;
CREATE TABLE `finance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(32) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `coin` int(11) NOT NULL,
  `mode` tinyint(2) DEFAULT NULL COMMENT '模式 1系统赠送 2代理充值 3支付宝',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型 1充值 2消费',
  `state` tinyint(2) DEFAULT NULL COMMENT '状态 0取消 1提交 2确认',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(2) DEFAULT NULL,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of finance
-- ----------------------------

-- ----------------------------
-- Table structure for `ka_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ka_admin`;
CREATE TABLE `ka_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `username` varchar(50) DEFAULT NULL,
  `password` longtext,
  `flag` longtext,
  `LastLogin` datetime DEFAULT NULL,
  `LastLoginIP` varchar(50) DEFAULT NULL,
  `adduser` varchar(50) DEFAULT NULL,
  `look` int(11) DEFAULT NULL COMMENT '登录次数',
  `admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ka_admin
-- ----------------------------
INSERT INTO `ka_admin` VALUES ('91', '1', '212558', 'e10adc3949ba59abbe56e057f20f883e', ',01,02,03,04,05,06,07,08,09,10,11,12,13', '2019-01-25 14:37:43', '0.0.0.0', null, '111', null);

-- ----------------------------
-- Table structure for `ka_bl`
-- ----------------------------
DROP TABLE IF EXISTS `ka_bl`;
CREATE TABLE `ka_bl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class1` varchar(50) DEFAULT NULL COMMENT '下注类型  顶级类',
  `class2` varchar(50) DEFAULT NULL COMMENT '下注类型 二级类',
  `class3` varchar(50) DEFAULT NULL COMMENT '下注类型  三级类',
  `rate` double DEFAULT NULL COMMENT '赔率',
  `blrate` double DEFAULT NULL,
  `gold` double DEFAULT NULL,
  `xr` double DEFAULT NULL,
  `locked` int(11) DEFAULT '0' COMMENT '是否锁定  1锁定(即关闭)  0开启',
  `adddate` timestamp NULL DEFAULT NULL COMMENT '新增时间',
  `mrate` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `class1` (`class1`),
  KEY `class2` (`class2`),
  KEY `class3` (`class3`),
  KEY `rate` (`rate`),
  KEY `blrate` (`blrate`),
  KEY `gold` (`gold`),
  KEY `xr` (`xr`),
  KEY `locked` (`locked`),
  KEY `mrate` (`mrate`),
  KEY `adddate` (`adddate`)
) ENGINE=MyISAM AUTO_INCREMENT=2100 DEFAULT CHARSET=utf8 COMMENT='所有下注类型所对应的赔率';

-- ----------------------------
-- Records of ka_bl
-- ----------------------------
INSERT INTO `ka_bl` VALUES ('1', '特码', '特A', '1', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('2', '特码', '特A', '2', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('3', '特码', '特A', '3', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:41:10', '42.6');
INSERT INTO `ka_bl` VALUES ('4', '特码', '特A', '4', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:42:43', '42.6');
INSERT INTO `ka_bl` VALUES ('5', '特码', '特A', '5', '42.6', '42.6', '0', '100000', '0', '2016-07-02 11:54:21', '42.6');
INSERT INTO `ka_bl` VALUES ('6', '特码', '特A', '6', '42.6', '42.6', '0', '100000', '0', '2016-07-02 11:54:21', '42.6');
INSERT INTO `ka_bl` VALUES ('7', '特码', '特A', '7', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('8', '特码', '特A', '8', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('9', '特码', '特A', '9', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('10', '特码', '特A', '10', '42.6', '42.6', '0', '100000', '0', '2016-07-02 21:09:58', '42.6');
INSERT INTO `ka_bl` VALUES ('11', '特码', '特A', '11', '42.6', '42.6', '0', '100000', '0', '2016-07-02 11:54:21', '42.6');
INSERT INTO `ka_bl` VALUES ('12', '特码', '特A', '12', '42.6', '42.6', '0', '100000', '0', '2018-12-15 16:01:42', '42.6');
INSERT INTO `ka_bl` VALUES ('13', '特码', '特A', '13', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('14', '特码', '特A', '14', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:42:43', '42.6');
INSERT INTO `ka_bl` VALUES ('15', '特码', '特A', '15', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:42:43', '42.6');
INSERT INTO `ka_bl` VALUES ('16', '特码', '特A', '16', '42.6', '42.6', '0', '100000', '0', '2016-07-02 11:54:21', '42.6');
INSERT INTO `ka_bl` VALUES ('17', '特码', '特A', '17', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:42:44', '42.6');
INSERT INTO `ka_bl` VALUES ('18', '特码', '特A', '18', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('19', '特码', '特A', '19', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('20', '特码', '特A', '20', '42.6', '42.6', '0', '100000', '0', '2016-07-02 21:09:58', '42.6');
INSERT INTO `ka_bl` VALUES ('21', '特码', '特A', '21', '42.6', '42.6', '0', '100000', '0', '2018-12-08 17:50:32', '42.6');
INSERT INTO `ka_bl` VALUES ('22', '特码', '特A', '22', '42.6', '42.6', '0', '100000', '0', '2016-07-02 11:54:22', '42.6');
INSERT INTO `ka_bl` VALUES ('23', '特码', '特A', '23', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('24', '特码', '特A', '24', '42.6', '42.6', '0', '100000', '0', '2018-12-15 16:01:42', '42.6');
INSERT INTO `ka_bl` VALUES ('25', '特码', '特A', '25', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:41:10', '42.6');
INSERT INTO `ka_bl` VALUES ('26', '特码', '特A', '26', '42.6', '42.6', '0', '100000', '0', '2016-07-02 21:09:58', '42.6');
INSERT INTO `ka_bl` VALUES ('27', '特码', '特A', '27', '42.6', '42.6', '0', '100000', '0', '2016-07-02 11:54:22', '42.6');
INSERT INTO `ka_bl` VALUES ('28', '特码', '特A', '28', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('29', '特码', '特A', '29', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('30', '特码', '特A', '30', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('31', '特码', '特A', '31', '42.6', '42.6', '0', '100000', '0', '2018-12-15 15:53:34', '42.6');
INSERT INTO `ka_bl` VALUES ('32', '特码', '特A', '32', '42.6', '42.6', '0', '100000', '0', '2018-12-06 16:43:03', '42.6');
INSERT INTO `ka_bl` VALUES ('33', '特码', '特A', '33', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:42:44', '42.6');
INSERT INTO `ka_bl` VALUES ('34', '特码', '特A', '34', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('35', '特码', '特A', '35', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('36', '特码', '特A', '36', '42.6', '42.6', '0', '100000', '0', '2018-12-15 16:01:42', '42.6');
INSERT INTO `ka_bl` VALUES ('37', '特码', '特A', '37', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:41:10', '42.6');
INSERT INTO `ka_bl` VALUES ('38', '特码', '特A', '38', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('39', '特码', '特A', '39', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('40', '特码', '特A', '40', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('41', '特码', '特A', '41', '42.6', '42.6', '0', '100000', '0', '2018-12-15 15:53:34', '42.6');
INSERT INTO `ka_bl` VALUES ('42', '特码', '特A', '42', '42.6', '42.6', '0', '100000', '0', '2016-07-02 21:09:58', '42.6');
INSERT INTO `ka_bl` VALUES ('43', '特码', '特A', '43', '42.6', '42.6', '0', '100000', '0', '2016-07-04 21:42:44', '42.6');
INSERT INTO `ka_bl` VALUES ('44', '特码', '特A', '44', '42.6', '42.6', '0', '100000', '0', '2016-07-02 11:54:22', '42.6');
INSERT INTO `ka_bl` VALUES ('45', '特码', '特A', '45', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('46', '特码', '特A', '46', '42.6', '42.6', '0', '100000', '0', '2018-12-07 15:06:25', '42.6');
INSERT INTO `ka_bl` VALUES ('47', '特码', '特A', '47', '42.6', '42.6', '0', '100000', '0', '2016-07-02 21:09:59', '42.6');
INSERT INTO `ka_bl` VALUES ('48', '特码', '特A', '48', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('49', '特码', '特A', '49', '42.6', '42.6', '0', '100000', '0', '2018-12-15 17:34:16', '42.6');
INSERT INTO `ka_bl` VALUES ('50', '特码', '特A', '单', '1.93', '1.93', '0', '0', '0', '2011-07-03 09:44:32', '1.93');
INSERT INTO `ka_bl` VALUES ('51', '特码', '特A', '双', '1.93', '1.93', '0', '0', '0', '2011-07-03 09:26:30', '1.93');
INSERT INTO `ka_bl` VALUES ('52', '特码', '特A', '大', '1.93', '1.93', '0', '0', '0', '2011-07-03 01:31:27', '1.93');
INSERT INTO `ka_bl` VALUES ('53', '特码', '特A', '小', '1.93', '1.93', '0', '0', '0', '2011-07-03 01:40:49', '1.93');
INSERT INTO `ka_bl` VALUES ('54', '特码', '特A', '合单', '1.93', '1.93', '0', '0', '0', '2011-07-10 17:09:58', '1.93');
INSERT INTO `ka_bl` VALUES ('55', '特码', '特A', '合双', '1.93', '1.93', '0', '0', '0', '2011-07-10 17:09:58', '1.93');
INSERT INTO `ka_bl` VALUES ('56', '特码', '特A', '红波', '2.72', '2.72', '0', '0', '0', '2011-06-29 21:44:15', '2.72');
INSERT INTO `ka_bl` VALUES ('57', '特码', '特A', '绿波', '2.85', '2.85', '0', '0', '0', '2011-05-31 14:40:43', '2.85');
INSERT INTO `ka_bl` VALUES ('58', '特码', '特A', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-05-31 14:41:18', '2.85');
INSERT INTO `ka_bl` VALUES ('59', '特码', '特B', '1', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('60', '特码', '特B', '2', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('61', '特码', '特B', '3', '47.5', '47.5', '0', '100000', '0', '2016-07-04 21:41:10', '47.5');
INSERT INTO `ka_bl` VALUES ('62', '特码', '特B', '4', '47.5', '47.5', '0', '100000', '0', '2016-07-04 21:42:43', '47.5');
INSERT INTO `ka_bl` VALUES ('63', '特码', '特B', '5', '47.5', '47.5', '0', '100000', '0', '2016-07-02 11:54:21', '47.5');
INSERT INTO `ka_bl` VALUES ('64', '特码', '特B', '6', '47.5', '47.5', '0', '100000', '0', '2016-07-02 11:54:21', '47.5');
INSERT INTO `ka_bl` VALUES ('65', '特码', '特B', '7', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('66', '特码', '特B', '8', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('67', '特码', '特B', '9', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('68', '特码', '特B', '10', '47.5', '47.5', '0', '100000', '0', '2016-07-02 21:09:58', '47.5');
INSERT INTO `ka_bl` VALUES ('69', '特码', '特B', '11', '47.5', '47.5', '0', '100000', '0', '2016-07-02 11:54:21', '47.5');
INSERT INTO `ka_bl` VALUES ('70', '特码', '特B', '12', '47.5', '47.5', '0', '100000', '0', '2018-12-15 16:01:42', '47.5');
INSERT INTO `ka_bl` VALUES ('71', '特码', '特B', '13', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('72', '特码', '特B', '14', '47.5', '47.5', '0', '100000', '0', '2016-07-04 21:42:43', '47.5');
INSERT INTO `ka_bl` VALUES ('73', '特码', '特B', '15', '47.5', '47.5', '0', '100000', '0', '2016-07-04 21:42:43', '47.5');
INSERT INTO `ka_bl` VALUES ('74', '特码', '特B', '16', '47.5', '47.5', '0', '100000', '0', '2016-07-02 11:54:21', '47.5');
INSERT INTO `ka_bl` VALUES ('75', '特码', '特B', '17', '47.5', '47.5', '0', '100000', '0', '2016-07-04 21:42:44', '47.5');
INSERT INTO `ka_bl` VALUES ('76', '特码', '特B', '18', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('77', '特码', '特B', '19', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('78', '特码', '特B', '20', '47.5', '47.5', '0', '100000', '0', '2016-07-02 21:09:58', '47.5');
INSERT INTO `ka_bl` VALUES ('79', '特码', '特B', '21', '47.5', '47.5', '0', '100000', '0', '2018-12-08 17:50:32', '47.5');
INSERT INTO `ka_bl` VALUES ('80', '特码', '特B', '22', '47.5', '47.5', '0', '100000', '0', '2016-07-02 11:54:22', '47.5');
INSERT INTO `ka_bl` VALUES ('81', '特码', '特B', '23', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('82', '特码', '特B', '24', '47.5', '47.5', '0', '100000', '0', '2018-12-15 16:01:42', '47.5');
INSERT INTO `ka_bl` VALUES ('83', '特码', '特B', '25', '47.5', '37.7', '0', '100000', '0', '2016-07-04 21:41:10', '47.5');
INSERT INTO `ka_bl` VALUES ('84', '特码', '特B', '26', '47.5', '47.5', '0', '100000', '0', '2016-07-02 21:09:58', '47.5');
INSERT INTO `ka_bl` VALUES ('85', '特码', '特B', '27', '47.5', '47.5', '0', '100000', '0', '2016-07-02 11:54:22', '47.5');
INSERT INTO `ka_bl` VALUES ('86', '特码', '特B', '28', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('87', '特码', '特B', '29', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('88', '特码', '特B', '30', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('89', '特码', '特B', '31', '47.5', '47.5', '0', '100000', '0', '2018-12-15 15:53:34', '47.5');
INSERT INTO `ka_bl` VALUES ('90', '特码', '特B', '32', '47.5', '47.5', '0', '100000', '0', '2018-12-06 16:43:03', '47.5');
INSERT INTO `ka_bl` VALUES ('91', '特码', '特B', '33', '47.5', '47.5', '0', '100000', '0', '2016-07-04 21:42:44', '47.5');
INSERT INTO `ka_bl` VALUES ('92', '特码', '特B', '34', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('93', '特码', '特B', '35', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('94', '特码', '特B', '36', '47.5', '47.5', '0', '100000', '0', '2018-12-15 16:01:42', '47.5');
INSERT INTO `ka_bl` VALUES ('95', '特码', '特B', '37', '47.5', '47.5', '0', '100000', '0', '2016-07-04 21:41:10', '47.5');
INSERT INTO `ka_bl` VALUES ('96', '特码', '特B', '38', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('97', '特码', '特B', '39', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('98', '特码', '特B', '40', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('99', '特码', '特B', '41', '47.5', '47.5', '0', '100000', '0', '2018-12-15 15:53:34', '47.5');
INSERT INTO `ka_bl` VALUES ('100', '特码', '特B', '42', '47.5', '47.5', '0', '100000', '0', '2016-07-02 21:09:58', '47.5');
INSERT INTO `ka_bl` VALUES ('101', '特码', '特B', '43', '47.5', '47.5', '0', '100000', '0', '2016-07-04 21:42:44', '47.5');
INSERT INTO `ka_bl` VALUES ('102', '特码', '特B', '44', '47.5', '47.5', '0', '100000', '0', '2016-07-02 11:54:22', '47.5');
INSERT INTO `ka_bl` VALUES ('103', '特码', '特B', '45', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('104', '特码', '特B', '46', '47.5', '47.5', '0', '100000', '0', '2018-12-07 15:06:25', '47.5');
INSERT INTO `ka_bl` VALUES ('105', '特码', '特B', '47', '47.5', '47.5', '0', '100000', '0', '2016-07-02 21:09:59', '47.5');
INSERT INTO `ka_bl` VALUES ('106', '特码', '特B', '48', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('107', '特码', '特B', '49', '47.5', '47.5', '0', '100000', '0', '2018-12-15 17:34:16', '47.5');
INSERT INTO `ka_bl` VALUES ('108', '特码', '特B', '单', '1.93', '1.93', '0', '0', '0', '2011-07-03 09:44:32', '1.93');
INSERT INTO `ka_bl` VALUES ('109', '特码', '特B', '双', '1.93', '1.93', '0', '0', '0', '2011-07-03 09:26:30', '1.93');
INSERT INTO `ka_bl` VALUES ('110', '特码', '特B', '大', '1.93', '1.93', '0', '0', '0', '2011-07-03 01:31:27', '1.93');
INSERT INTO `ka_bl` VALUES ('111', '特码', '特B', '小', '1.93', '1.93', '0', '0', '0', '2011-07-03 01:40:49', '1.93');
INSERT INTO `ka_bl` VALUES ('112', '特码', '特B', '合单', '1.93', '1.93', '0', '0', '0', '2011-07-10 17:09:58', '1.93');
INSERT INTO `ka_bl` VALUES ('113', '特码', '特B', '合双', '1.93', '1.93', '0', '0', '0', '2011-07-10 17:09:58', '1.93');
INSERT INTO `ka_bl` VALUES ('114', '特码', '特B', '红波', '2.72', '2.72', '0', '0', '0', '2011-06-29 21:44:15', '2.72');
INSERT INTO `ka_bl` VALUES ('115', '特码', '特B', '绿波', '2.85', '2.85', '0', '0', '0', '2011-05-31 14:40:43', '2.85');
INSERT INTO `ka_bl` VALUES ('116', '特码', '特B', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-05-31 14:41:18', '2.85');
INSERT INTO `ka_bl` VALUES ('117', '正特', '正1特', '1', '42.2', '42.2', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('118', '正特', '正1特', '2', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('119', '正特', '正1特', '3', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('120', '正特', '正1特', '4', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('121', '正特', '正1特', '5', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('122', '正特', '正1特', '6', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('123', '正特', '正1特', '7', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('124', '正特', '正1特', '8', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('125', '正特', '正1特', '9', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('126', '正特', '正1特', '10', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('127', '正特', '正1特', '11', '42.5', '42.5', '0', '0', '0', '2016-06-24 16:53:45', '42.5');
INSERT INTO `ka_bl` VALUES ('128', '正特', '正1特', '12', '42.5', '42.5', '0', '0', '0', '2016-06-24 16:53:45', '42.5');
INSERT INTO `ka_bl` VALUES ('129', '正特', '正1特', '13', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('130', '正特', '正1特', '14', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('131', '正特', '正1特', '15', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('132', '正特', '正1特', '16', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('133', '正特', '正1特', '17', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('134', '正特', '正1特', '18', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('135', '正特', '正1特', '19', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('136', '正特', '正1特', '20', '42', '42', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('137', '正特', '正1特', '21', '42', '42', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('138', '正特', '正1特', '22', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('139', '正特', '正1特', '23', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('140', '正特', '正1特', '24', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('141', '正特', '正1特', '25', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('142', '正特', '正1特', '26', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('143', '正特', '正1特', '27', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('144', '正特', '正1特', '28', '42.5', '42.5', '0', '0', '0', '2018-12-15 15:59:07', '42.5');
INSERT INTO `ka_bl` VALUES ('145', '正特', '正1特', '29', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('146', '正特', '正1特', '30', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('147', '正特', '正1特', '31', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('148', '正特', '正1特', '32', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('149', '正特', '正1特', '33', '42', '42', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('150', '正特', '正1特', '34', '42', '42', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('151', '正特', '正1特', '35', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('152', '正特', '正1特', '36', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('153', '正特', '正1特', '37', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('154', '正特', '正1特', '38', '42.5', '42.5', '0', '0', '0', '2018-12-15 15:59:08', '42.5');
INSERT INTO `ka_bl` VALUES ('155', '正特', '正1特', '39', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('156', '正特', '正1特', '40', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('157', '正特', '正1特', '41', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('158', '正特', '正1特', '42', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('159', '正特', '正1特', '43', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('160', '正特', '正1特', '44', '42', '42', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('161', '正特', '正1特', '45', '42', '42', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('162', '正特', '正1特', '46', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('163', '正特', '正1特', '47', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('164', '正特', '正1特', '48', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('165', '正特', '正1特', '49', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:46:49', '42.5');
INSERT INTO `ka_bl` VALUES ('166', '正特', '正1特', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('167', '正特', '正1特', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('168', '正特', '正1特', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('169', '正特', '正1特', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('170', '正特', '正1特', '合单', '1.92', '1.92', '0', '0', '0', '2011-02-21 21:30:29', '1.92');
INSERT INTO `ka_bl` VALUES ('171', '正特', '正1特', '合双', '1.92', '1.92', '0', '0', '0', '2010-08-05 22:09:43', '1.92');
INSERT INTO `ka_bl` VALUES ('172', '正特', '正1特', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('173', '正特', '正1特', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('174', '正特', '正1特', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('175', '正特', '正2特', '1', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('176', '正特', '正2特', '2', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('177', '正特', '正2特', '3', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('178', '正特', '正2特', '4', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('179', '正特', '正2特', '5', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('180', '正特', '正2特', '6', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('181', '正特', '正2特', '7', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('182', '正特', '正2特', '8', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('183', '正特', '正2特', '9', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('184', '正特', '正2特', '10', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('185', '正特', '正2特', '11', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('186', '正特', '正2特', '12', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('187', '正特', '正2特', '13', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('188', '正特', '正2特', '14', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('189', '正特', '正2特', '15', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('190', '正特', '正2特', '16', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('191', '正特', '正2特', '17', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('192', '正特', '正2特', '18', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('193', '正特', '正2特', '19', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('194', '正特', '正2特', '20', '42', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('195', '正特', '正2特', '21', '42', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('196', '正特', '正2特', '22', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('197', '正特', '正2特', '23', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('198', '正特', '正2特', '24', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('199', '正特', '正2特', '25', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('200', '正特', '正2特', '26', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('201', '正特', '正2特', '27', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('202', '正特', '正2特', '28', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('203', '正特', '正2特', '29', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('204', '正特', '正2特', '30', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('205', '正特', '正2特', '31', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('206', '正特', '正2特', '32', '42', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('207', '正特', '正2特', '33', '42', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('208', '正特', '正2特', '34', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('209', '正特', '正2特', '35', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('210', '正特', '正2特', '36', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('211', '正特', '正2特', '37', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('212', '正特', '正2特', '38', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('213', '正特', '正2特', '39', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('214', '正特', '正2特', '40', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('215', '正特', '正2特', '41', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('216', '正特', '正2特', '42', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('217', '正特', '正2特', '43', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('218', '正特', '正2特', '44', '42', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('219', '正特', '正2特', '45', '42', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('220', '正特', '正2特', '46', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('221', '正特', '正2特', '47', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('222', '正特', '正2特', '48', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('223', '正特', '正2特', '49', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:47:49', '42.5');
INSERT INTO `ka_bl` VALUES ('224', '正特', '正2特', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('225', '正特', '正2特', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('226', '正特', '正2特', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('227', '正特', '正2特', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('228', '正特', '正2特', '合单', '1.92', '1.92', '0', '0', '0', '2010-07-22 12:11:21', '1.92');
INSERT INTO `ka_bl` VALUES ('229', '正特', '正2特', '合双', '1.92', '1.92', '0', '0', '0', '2010-07-22 12:11:41', '1.92');
INSERT INTO `ka_bl` VALUES ('230', '正特', '正2特', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('231', '正特', '正2特', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('232', '正特', '正2特', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('233', '正特', '正3特', '1', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('234', '正特', '正3特', '2', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('235', '正特', '正3特', '3', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('236', '正特', '正3特', '4', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('237', '正特', '正3特', '5', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('238', '正特', '正3特', '6', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('239', '正特', '正3特', '7', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('240', '正特', '正3特', '8', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('241', '正特', '正3特', '9', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('242', '正特', '正3特', '10', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('243', '正特', '正3特', '11', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('244', '正特', '正3特', '12', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('245', '正特', '正3特', '13', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('246', '正特', '正3特', '14', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('247', '正特', '正3特', '15', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('248', '正特', '正3特', '16', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('249', '正特', '正3特', '17', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('250', '正特', '正3特', '18', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('251', '正特', '正3特', '19', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('252', '正特', '正3特', '20', '42', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('253', '正特', '正3特', '21', '42', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('254', '正特', '正3特', '22', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('255', '正特', '正3特', '23', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('256', '正特', '正3特', '24', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('257', '正特', '正3特', '25', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('258', '正特', '正3特', '26', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('259', '正特', '正3特', '27', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('260', '正特', '正3特', '28', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('261', '正特', '正3特', '29', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('262', '正特', '正3特', '30', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('263', '正特', '正3特', '31', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('264', '正特', '正3特', '32', '42', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('265', '正特', '正3特', '33', '42', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('266', '正特', '正3特', '34', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('267', '正特', '正3特', '35', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('268', '正特', '正3特', '36', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('269', '正特', '正3特', '37', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('270', '正特', '正3特', '38', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('271', '正特', '正3特', '39', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('272', '正特', '正3特', '40', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('273', '正特', '正3特', '41', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('274', '正特', '正3特', '42', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('275', '正特', '正3特', '43', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('276', '正特', '正3特', '44', '42', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('277', '正特', '正3特', '45', '42', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('278', '正特', '正3特', '46', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('279', '正特', '正3特', '47', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('280', '正特', '正3特', '48', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('281', '正特', '正3特', '49', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:48:30', '42.5');
INSERT INTO `ka_bl` VALUES ('282', '正特', '正3特', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('283', '正特', '正3特', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('284', '正特', '正3特', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('285', '正特', '正3特', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('286', '正特', '正3特', '合单', '1.92', '1.92', '0', '0', '0', '2010-07-22 12:13:19', '1.92');
INSERT INTO `ka_bl` VALUES ('287', '正特', '正3特', '合双', '1.92', '1.92', '0', '0', '0', '2010-07-22 12:13:25', '1.92');
INSERT INTO `ka_bl` VALUES ('288', '正特', '正3特', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('289', '正特', '正3特', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('290', '正特', '正3特', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('291', '正特', '正4特', '1', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('292', '正特', '正4特', '2', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('293', '正特', '正4特', '3', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('294', '正特', '正4特', '4', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('295', '正特', '正4特', '5', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('296', '正特', '正4特', '6', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('297', '正特', '正4特', '7', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('298', '正特', '正4特', '8', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('299', '正特', '正4特', '9', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('300', '正特', '正4特', '10', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('301', '正特', '正4特', '11', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('302', '正特', '正4特', '12', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('303', '正特', '正4特', '13', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('304', '正特', '正4特', '14', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('305', '正特', '正4特', '15', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('306', '正特', '正4特', '16', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('307', '正特', '正4特', '17', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('308', '正特', '正4特', '18', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('309', '正特', '正4特', '19', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('310', '正特', '正4特', '20', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('311', '正特', '正4特', '21', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('312', '正特', '正4特', '22', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('313', '正特', '正4特', '23', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('314', '正特', '正4特', '24', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('315', '正特', '正4特', '25', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('316', '正特', '正4特', '26', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('317', '正特', '正4特', '27', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('318', '正特', '正4特', '28', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('319', '正特', '正4特', '29', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('320', '正特', '正4特', '30', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('321', '正特', '正4特', '31', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('322', '正特', '正4特', '32', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('323', '正特', '正4特', '33', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('324', '正特', '正4特', '34', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('325', '正特', '正4特', '35', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('326', '正特', '正4特', '36', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('327', '正特', '正4特', '37', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('328', '正特', '正4特', '38', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('329', '正特', '正4特', '39', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('330', '正特', '正4特', '40', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('331', '正特', '正4特', '41', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('332', '正特', '正4特', '42', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('333', '正特', '正4特', '43', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('334', '正特', '正4特', '44', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('335', '正特', '正4特', '45', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('336', '正特', '正4特', '46', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('337', '正特', '正4特', '47', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('338', '正特', '正4特', '48', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('339', '正特', '正4特', '49', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:25', '42.5');
INSERT INTO `ka_bl` VALUES ('340', '正特', '正4特', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('341', '正特', '正4特', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('342', '正特', '正4特', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('343', '正特', '正4特', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('344', '正特', '正4特', '合单', '1.92', '1.92', '0', '0', '0', '2010-10-19 19:21:14', '1.92');
INSERT INTO `ka_bl` VALUES ('345', '正特', '正4特', '合双', '1.92', '1.92', '0', '0', '0', '2010-07-22 12:14:58', '1.92');
INSERT INTO `ka_bl` VALUES ('346', '正特', '正4特', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('347', '正特', '正4特', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('348', '正特', '正4特', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('349', '正特', '正5特', '1', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('350', '正特', '正5特', '2', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('351', '正特', '正5特', '3', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('352', '正特', '正5特', '4', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('353', '正特', '正5特', '5', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('354', '正特', '正5特', '6', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('355', '正特', '正5特', '7', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('356', '正特', '正5特', '8', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('357', '正特', '正5特', '9', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('358', '正特', '正5特', '10', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('359', '正特', '正5特', '11', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('360', '正特', '正5特', '12', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('361', '正特', '正5特', '13', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('362', '正特', '正5特', '14', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('363', '正特', '正5特', '15', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('364', '正特', '正5特', '16', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('365', '正特', '正5特', '17', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('366', '正特', '正5特', '18', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('367', '正特', '正5特', '19', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('368', '正特', '正5特', '20', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('369', '正特', '正5特', '21', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('370', '正特', '正5特', '22', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('371', '正特', '正5特', '23', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('372', '正特', '正5特', '24', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('373', '正特', '正5特', '25', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('374', '正特', '正5特', '26', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('375', '正特', '正5特', '27', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('376', '正特', '正5特', '28', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('377', '正特', '正5特', '29', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('378', '正特', '正5特', '30', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('379', '正特', '正5特', '31', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('380', '正特', '正5特', '32', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('381', '正特', '正5特', '33', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('382', '正特', '正5特', '34', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('383', '正特', '正5特', '35', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('384', '正特', '正5特', '36', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('385', '正特', '正5特', '37', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('386', '正特', '正5特', '38', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('387', '正特', '正5特', '39', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('388', '正特', '正5特', '40', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('389', '正特', '正5特', '41', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('390', '正特', '正5特', '42', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('391', '正特', '正5特', '43', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('392', '正特', '正5特', '44', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('393', '正特', '正5特', '45', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('394', '正特', '正5特', '46', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('395', '正特', '正5特', '47', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('396', '正特', '正5特', '48', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('397', '正特', '正5特', '49', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:32', '42.5');
INSERT INTO `ka_bl` VALUES ('398', '正特', '正5特', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('399', '正特', '正5特', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('400', '正特', '正5特', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('401', '正特', '正5特', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('402', '正特', '正5特', '合单', '1.92', '1.92', '0', '0', '0', '2010-07-22 12:16:12', '1.92');
INSERT INTO `ka_bl` VALUES ('403', '正特', '正5特', '合双', '1.92', '1.92', '0', '0', '0', '2010-10-19 19:22:43', '1.92');
INSERT INTO `ka_bl` VALUES ('404', '正特', '正5特', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('405', '正特', '正5特', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('406', '正特', '正5特', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('407', '正特', '正6特', '1', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('408', '正特', '正6特', '2', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('409', '正特', '正6特', '3', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('410', '正特', '正6特', '4', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('411', '正特', '正6特', '5', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('412', '正特', '正6特', '6', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('413', '正特', '正6特', '7', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('414', '正特', '正6特', '8', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('415', '正特', '正6特', '9', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('416', '正特', '正6特', '10', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('417', '正特', '正6特', '11', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('418', '正特', '正6特', '12', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('419', '正特', '正6特', '13', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('420', '正特', '正6特', '14', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('421', '正特', '正6特', '15', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('422', '正特', '正6特', '16', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('423', '正特', '正6特', '17', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('424', '正特', '正6特', '18', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('425', '正特', '正6特', '19', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('426', '正特', '正6特', '20', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('427', '正特', '正6特', '21', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('428', '正特', '正6特', '22', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('429', '正特', '正6特', '23', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('430', '正特', '正6特', '24', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('431', '正特', '正6特', '25', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('432', '正特', '正6特', '26', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('433', '正特', '正6特', '27', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('434', '正特', '正6特', '28', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('435', '正特', '正6特', '29', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('436', '正特', '正6特', '30', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('437', '正特', '正6特', '31', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('438', '正特', '正6特', '32', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('439', '正特', '正6特', '33', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('440', '正特', '正6特', '34', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('441', '正特', '正6特', '35', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('442', '正特', '正6特', '36', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('443', '正特', '正6特', '37', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('444', '正特', '正6特', '38', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('445', '正特', '正6特', '39', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('446', '正特', '正6特', '40', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('447', '正特', '正6特', '41', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('448', '正特', '正6特', '42', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('449', '正特', '正6特', '43', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('450', '正特', '正6特', '44', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('451', '正特', '正6特', '45', '42', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('452', '正特', '正6特', '46', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('453', '正特', '正6特', '47', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('454', '正特', '正6特', '48', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('455', '正特', '正6特', '49', '42.5', '42.5', '0', '0', '0', '2012-03-30 17:49:40', '42.5');
INSERT INTO `ka_bl` VALUES ('456', '正特', '正6特', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('457', '正特', '正6特', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('458', '正特', '正6特', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('459', '正特', '正6特', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('460', '正特', '正6特', '合单', '1.92', '1.92', '0', '0', '0', '2010-07-22 12:17:21', '1.92');
INSERT INTO `ka_bl` VALUES ('461', '正特', '正6特', '合双', '1.92', '1.92', '0', '0', '0', '2010-07-22 12:17:28', '1.92');
INSERT INTO `ka_bl` VALUES ('462', '正特', '正6特', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('463', '正特', '正6特', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('464', '正特', '正6特', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('465', '正码', '正A', '1', '7.2', '7.2', '0', '0', '0', '2016-06-24 16:54:03', '7.2');
INSERT INTO `ka_bl` VALUES ('466', '正码', '正A', '2', '7.2', '7.2', '0', '0', '0', '2011-07-03 17:54:23', '7.2');
INSERT INTO `ka_bl` VALUES ('467', '正码', '正A', '3', '7.2', '7.2', '0', '0', '0', '2011-07-03 13:47:01', '7.2');
INSERT INTO `ka_bl` VALUES ('468', '正码', '正A', '4', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:51', '7.2');
INSERT INTO `ka_bl` VALUES ('469', '正码', '正A', '5', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:24', '7.2');
INSERT INTO `ka_bl` VALUES ('470', '正码', '正A', '6', '7.2', '7.2', '0', '0', '0', '2010-10-23 19:59:28', '7.2');
INSERT INTO `ka_bl` VALUES ('471', '正码', '正A', '7', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('472', '正码', '正A', '8', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('473', '正码', '正A', '9', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:51', '7.2');
INSERT INTO `ka_bl` VALUES ('474', '正码', '正A', '10', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:51', '7.2');
INSERT INTO `ka_bl` VALUES ('475', '正码', '正A', '11', '7.2', '7.2', '0', '0', '0', '2016-06-24 16:54:03', '7.2');
INSERT INTO `ka_bl` VALUES ('476', '正码', '正A', '12', '7.2', '7.2', '0', '0', '0', '2016-06-24 16:54:03', '7.2');
INSERT INTO `ka_bl` VALUES ('477', '正码', '正A', '13', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('478', '正码', '正A', '14', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:51', '7.2');
INSERT INTO `ka_bl` VALUES ('479', '正码', '正A', '15', '7.2', '7.2', '0', '0', '0', '2011-07-03 17:54:23', '7.2');
INSERT INTO `ka_bl` VALUES ('480', '正码', '正A', '16', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:24', '7.2');
INSERT INTO `ka_bl` VALUES ('481', '正码', '正A', '17', '7.2', '7.2', '0', '0', '0', '2011-07-03 17:54:23', '7.2');
INSERT INTO `ka_bl` VALUES ('482', '正码', '正A', '18', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('483', '正码', '正A', '19', '7.2', '7.2', '0', '0', '0', '2011-07-03 17:54:23', '7.2');
INSERT INTO `ka_bl` VALUES ('484', '正码', '正A', '20', '6.7', '7.2', '0', '0', '0', '2011-02-23 12:24:51', '7.2');
INSERT INTO `ka_bl` VALUES ('485', '正码', '正A', '21', '6.7', '7.2', '0', '0', '0', '2011-02-23 12:24:24', '7.2');
INSERT INTO `ka_bl` VALUES ('486', '正码', '正A', '22', '7.2', '7.2', '0', '0', '0', '2010-08-05 22:08:48', '7.2');
INSERT INTO `ka_bl` VALUES ('487', '正码', '正A', '23', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('488', '正码', '正A', '24', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('489', '正码', '正A', '25', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:51', '7.2');
INSERT INTO `ka_bl` VALUES ('490', '正码', '正A', '26', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:51', '7.2');
INSERT INTO `ka_bl` VALUES ('491', '正码', '正A', '27', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:24', '7.2');
INSERT INTO `ka_bl` VALUES ('492', '正码', '正A', '28', '7.2', '7.2', '0', '0', '0', '2010-10-23 20:22:57', '7.2');
INSERT INTO `ka_bl` VALUES ('493', '正码', '正A', '29', '7.2', '7.2', '0', '0', '0', '2018-12-08 16:26:10', '7.2');
INSERT INTO `ka_bl` VALUES ('494', '正码', '正A', '30', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('495', '正码', '正A', '31', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:51', '7.2');
INSERT INTO `ka_bl` VALUES ('496', '正码', '正A', '32', '6.7', '7.2', '0', '0', '0', '2011-02-23 12:24:24', '7.2');
INSERT INTO `ka_bl` VALUES ('497', '正码', '正A', '33', '6.7', '7.2', '0', '0', '0', '2010-10-23 20:46:16', '7.2');
INSERT INTO `ka_bl` VALUES ('498', '正码', '正A', '34', '7.2', '7.2', '0', '0', '0', '2011-07-03 17:54:23', '7.2');
INSERT INTO `ka_bl` VALUES ('499', '正码', '正A', '35', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('500', '正码', '正A', '36', '7.2', '7.2', '0', '0', '0', '2011-07-03 17:54:23', '7.2');
INSERT INTO `ka_bl` VALUES ('501', '正码', '正A', '37', '7.2', '7.2', '0', '0', '0', '2018-12-08 16:26:10', '7.2');
INSERT INTO `ka_bl` VALUES ('502', '正码', '正A', '38', '7.2', '7.2', '0', '0', '0', '2018-12-08 16:24:21', '7.2');
INSERT INTO `ka_bl` VALUES ('503', '正码', '正A', '39', '7.2', '7.2', '0', '0', '0', '2010-10-19 20:23:07', '7.2');
INSERT INTO `ka_bl` VALUES ('504', '正码', '正A', '40', '7.2', '7.2', '0', '0', '0', '2011-07-03 17:54:23', '7.2');
INSERT INTO `ka_bl` VALUES ('505', '正码', '正A', '41', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:52', '7.2');
INSERT INTO `ka_bl` VALUES ('506', '正码', '正A', '42', '7.2', '7.2', '0', '0', '0', '2011-07-03 17:54:23', '7.2');
INSERT INTO `ka_bl` VALUES ('507', '正码', '正A', '43', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:24', '7.2');
INSERT INTO `ka_bl` VALUES ('508', '正码', '正A', '44', '6.7', '7.2', '0', '0', '0', '2010-10-05 20:15:47', '7.2');
INSERT INTO `ka_bl` VALUES ('509', '正码', '正A', '45', '6.7', '7.2', '0', '0', '0', '2011-02-23 12:25:03', '7.2');
INSERT INTO `ka_bl` VALUES ('510', '正码', '正A', '46', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:25:04', '7.2');
INSERT INTO `ka_bl` VALUES ('511', '正码', '正A', '47', '7.2', '7.2', '0', '0', '0', '2011-02-23 12:24:52', '7.2');
INSERT INTO `ka_bl` VALUES ('512', '正码', '正A', '48', '7.2', '7.2', '0', '0', '0', '2018-12-08 16:24:22', '7.2');
INSERT INTO `ka_bl` VALUES ('513', '正码', '正A', '49', '7.2', '7.2', '0', '0', '0', '2018-12-08 16:26:10', '7.2');
INSERT INTO `ka_bl` VALUES ('514', '正码', '正A', '总单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:45:59', '1.92');
INSERT INTO `ka_bl` VALUES ('515', '正码', '正A', '总双', '1.92', '1.92', '0', '0', '0', '2011-02-22 17:20:57', '1.92');
INSERT INTO `ka_bl` VALUES ('516', '正码', '正A', '总大', '1.92', '1.92', '0', '0', '0', '2011-02-22 17:20:57', '1.92');
INSERT INTO `ka_bl` VALUES ('517', '正码', '正A', '总小', '1.92', '1.92', '0', '0', '0', '2011-02-22 17:20:14', '1.92');
INSERT INTO `ka_bl` VALUES ('518', '正码', '正B', '1', '7.25', '7.25', '0', '0', '0', '2016-06-24 16:54:03', '7.25');
INSERT INTO `ka_bl` VALUES ('519', '正码', '正B', '2', '7.25', '7.25', '0', '0', '0', '2011-07-03 17:54:23', '7.25');
INSERT INTO `ka_bl` VALUES ('520', '正码', '正B', '3', '7.25', '7.25', '0', '0', '0', '2011-07-03 13:47:01', '7.25');
INSERT INTO `ka_bl` VALUES ('521', '正码', '正B', '4', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:51', '7.25');
INSERT INTO `ka_bl` VALUES ('522', '正码', '正B', '5', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:24', '7.25');
INSERT INTO `ka_bl` VALUES ('523', '正码', '正B', '6', '7.25', '7.25', '0', '0', '0', '2010-10-23 19:59:28', '7.25');
INSERT INTO `ka_bl` VALUES ('524', '正码', '正B', '7', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('525', '正码', '正B', '8', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('526', '正码', '正B', '9', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:51', '7.25');
INSERT INTO `ka_bl` VALUES ('527', '正码', '正B', '10', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:51', '7.25');
INSERT INTO `ka_bl` VALUES ('528', '正码', '正B', '11', '7.25', '7.25', '0', '0', '0', '2016-06-24 16:54:03', '7.25');
INSERT INTO `ka_bl` VALUES ('529', '正码', '正B', '12', '7.25', '7.25', '0', '0', '0', '2016-06-24 16:54:03', '7.25');
INSERT INTO `ka_bl` VALUES ('530', '正码', '正B', '13', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('531', '正码', '正B', '14', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:51', '7.25');
INSERT INTO `ka_bl` VALUES ('532', '正码', '正B', '15', '7.25', '7.25', '0', '0', '0', '2011-07-03 17:54:23', '7.25');
INSERT INTO `ka_bl` VALUES ('533', '正码', '正B', '16', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:24', '7.25');
INSERT INTO `ka_bl` VALUES ('534', '正码', '正B', '17', '7.25', '7.25', '0', '0', '0', '2011-07-03 17:54:23', '7.25');
INSERT INTO `ka_bl` VALUES ('535', '正码', '正B', '18', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('536', '正码', '正B', '19', '7.25', '7.25', '0', '0', '0', '2011-07-03 17:54:23', '7.25');
INSERT INTO `ka_bl` VALUES ('537', '正码', '正B', '20', '6.75', '7.25', '0', '0', '0', '2011-02-23 12:24:51', '7.25');
INSERT INTO `ka_bl` VALUES ('538', '正码', '正B', '21', '6.75', '7.25', '0', '0', '0', '2011-02-23 12:24:24', '7.25');
INSERT INTO `ka_bl` VALUES ('539', '正码', '正B', '22', '7.25', '7.25', '0', '0', '0', '2010-08-05 22:08:48', '7.25');
INSERT INTO `ka_bl` VALUES ('540', '正码', '正B', '23', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('541', '正码', '正B', '24', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('542', '正码', '正B', '25', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:51', '7.25');
INSERT INTO `ka_bl` VALUES ('543', '正码', '正B', '26', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:51', '7.25');
INSERT INTO `ka_bl` VALUES ('544', '正码', '正B', '27', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:24', '7.25');
INSERT INTO `ka_bl` VALUES ('545', '正码', '正B', '28', '7.25', '7.25', '0', '0', '0', '2010-10-23 20:22:57', '7.25');
INSERT INTO `ka_bl` VALUES ('546', '正码', '正B', '29', '7.25', '7.25', '0', '0', '0', '2018-12-08 16:26:10', '7.25');
INSERT INTO `ka_bl` VALUES ('547', '正码', '正B', '30', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('548', '正码', '正B', '31', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:51', '7.25');
INSERT INTO `ka_bl` VALUES ('549', '正码', '正B', '32', '6.75', '7.25', '0', '0', '0', '2011-02-23 12:24:24', '7.25');
INSERT INTO `ka_bl` VALUES ('550', '正码', '正B', '33', '6.75', '7.25', '0', '0', '0', '2010-10-23 20:46:16', '7.25');
INSERT INTO `ka_bl` VALUES ('551', '正码', '正B', '34', '7.25', '7.25', '0', '0', '0', '2011-07-03 17:54:23', '7.25');
INSERT INTO `ka_bl` VALUES ('552', '正码', '正B', '35', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('553', '正码', '正B', '36', '7.25', '7.25', '0', '0', '0', '2011-07-03 17:54:23', '7.25');
INSERT INTO `ka_bl` VALUES ('554', '正码', '正B', '37', '7.25', '7.25', '0', '0', '0', '2018-12-08 16:26:10', '7.25');
INSERT INTO `ka_bl` VALUES ('555', '正码', '正B', '38', '7.25', '7.25', '0', '0', '0', '2018-12-08 16:24:21', '7.25');
INSERT INTO `ka_bl` VALUES ('556', '正码', '正B', '39', '7.25', '7.25', '0', '0', '0', '2010-10-19 20:23:07', '7.25');
INSERT INTO `ka_bl` VALUES ('557', '正码', '正B', '40', '7.25', '7.25', '0', '0', '0', '2011-07-03 17:54:23', '7.25');
INSERT INTO `ka_bl` VALUES ('558', '正码', '正B', '41', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:52', '7.25');
INSERT INTO `ka_bl` VALUES ('559', '正码', '正B', '42', '7.25', '7.25', '0', '0', '0', '2011-07-03 17:54:23', '7.25');
INSERT INTO `ka_bl` VALUES ('560', '正码', '正B', '43', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:24', '7.25');
INSERT INTO `ka_bl` VALUES ('561', '正码', '正B', '44', '6.75', '7.25', '0', '0', '0', '2010-10-05 20:15:47', '7.25');
INSERT INTO `ka_bl` VALUES ('562', '正码', '正B', '45', '6.75', '7.25', '0', '0', '0', '2011-02-23 12:25:03', '7.25');
INSERT INTO `ka_bl` VALUES ('563', '正码', '正B', '46', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:25:04', '7.25');
INSERT INTO `ka_bl` VALUES ('564', '正码', '正B', '47', '7.25', '7.25', '0', '0', '0', '2011-02-23 12:24:52', '7.25');
INSERT INTO `ka_bl` VALUES ('565', '正码', '正B', '48', '7.25', '7.25', '0', '0', '0', '2018-12-08 16:24:22', '7.25');
INSERT INTO `ka_bl` VALUES ('566', '正码', '正B', '49', '7.25', '7.25', '0', '0', '0', '2018-12-08 16:26:10', '7.25');
INSERT INTO `ka_bl` VALUES ('567', '正码', '正B', '总单', '1.96', '1.96', '0', '0', '0', '2011-02-21 20:45:59', '1.96');
INSERT INTO `ka_bl` VALUES ('568', '正码', '正B', '总双', '1.96', '1.96', '0', '0', '0', '2011-02-22 17:20:57', '1.96');
INSERT INTO `ka_bl` VALUES ('569', '正码', '正B', '总大', '1.96', '1.96', '0', '0', '0', '2011-02-22 17:20:57', '1.96');
INSERT INTO `ka_bl` VALUES ('570', '正码', '正B', '总小', '1.96', '1.96', '0', '0', '0', '2011-02-22 17:20:14', '1.96');
INSERT INTO `ka_bl` VALUES ('571', '正1-6', '正码1', '大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('572', '正1-6', '正码1', '小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('573', '正1-6', '正码1', '单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('574', '正1-6', '正码1', '双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('575', '正1-6', '正码1', '红波', '2.75', '2.75', '0', '0', '0', '2011-02-21 20:17:33', '2.75');
INSERT INTO `ka_bl` VALUES ('576', '正1-6', '正码1', '绿波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:33', '2.91');
INSERT INTO `ka_bl` VALUES ('577', '正1-6', '正码1', '蓝波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:33', '2.91');
INSERT INTO `ka_bl` VALUES ('578', '正1-6', '正码2', '大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('579', '正1-6', '正码2', '小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('580', '正1-6', '正码2', '单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('581', '正1-6', '正码2', '双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('582', '正1-6', '正码2', '红波', '2.75', '2.75', '0', '0', '0', '2011-02-21 20:17:33', '2.75');
INSERT INTO `ka_bl` VALUES ('583', '正1-6', '正码2', '绿波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:33', '2.91');
INSERT INTO `ka_bl` VALUES ('584', '正1-6', '正码2', '蓝波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:33', '2.91');
INSERT INTO `ka_bl` VALUES ('585', '正1-6', '正码3', '大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('586', '正1-6', '正码3', '小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('587', '正1-6', '正码3', '单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('588', '正1-6', '正码3', '双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('589', '正1-6', '正码3', '红波', '2.75', '2.75', '0', '0', '0', '2011-02-21 20:17:33', '2.75');
INSERT INTO `ka_bl` VALUES ('590', '正1-6', '正码3', '绿波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:33', '2.91');
INSERT INTO `ka_bl` VALUES ('591', '正1-6', '正码3', '蓝波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:33', '2.91');
INSERT INTO `ka_bl` VALUES ('592', '正1-6', '正码4', '大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('593', '正1-6', '正码4', '小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('594', '正1-6', '正码4', '单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('595', '正1-6', '正码4', '双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('596', '正1-6', '正码4', '红波', '2.75', '2.75', '0', '0', '0', '2011-02-21 20:17:34', '2.75');
INSERT INTO `ka_bl` VALUES ('597', '正1-6', '正码4', '绿波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:34', '2.91');
INSERT INTO `ka_bl` VALUES ('598', '正1-6', '正码4', '蓝波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:34', '2.91');
INSERT INTO `ka_bl` VALUES ('599', '正1-6', '正码5', '大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('600', '正1-6', '正码5', '小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('601', '正1-6', '正码5', '单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('602', '正1-6', '正码5', '双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('603', '正1-6', '正码5', '红波', '2.75', '2.75', '0', '0', '0', '2011-02-21 20:17:34', '2.75');
INSERT INTO `ka_bl` VALUES ('604', '正1-6', '正码5', '绿波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:34', '2.91');
INSERT INTO `ka_bl` VALUES ('605', '正1-6', '正码5', '蓝波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:34', '2.91');
INSERT INTO `ka_bl` VALUES ('606', '正1-6', '正码6', '大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('607', '正1-6', '正码6', '小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('608', '正1-6', '正码6', '单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('609', '正1-6', '正码6', '双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('610', '正1-6', '正码6', '红波', '2.75', '2.75', '0', '0', '0', '2011-02-21 20:17:34', '2.75');
INSERT INTO `ka_bl` VALUES ('611', '正1-6', '正码6', '绿波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:34', '2.91');
INSERT INTO `ka_bl` VALUES ('612', '正1-6', '正码6', '蓝波', '2.91', '2.91', '0', '0', '0', '2011-02-21 20:17:34', '2.91');
INSERT INTO `ka_bl` VALUES ('614', '连码', '其他', '中特', '35', '35', '0', '0', '0', '2012-03-31 19:05:58', '35');
INSERT INTO `ka_bl` VALUES ('1971', '连码', '二中特', '21', '29.5', '30', '0', '0', '0', '2010-12-02 16:40:47', '30');
INSERT INTO `ka_bl` VALUES ('1786', '中一', '五中一', '36', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:20:43', '1.8');
INSERT INTO `ka_bl` VALUES ('618', '连码', '其他', '中二', '20', '20', '0', '0', '0', '2012-03-31 19:05:58', '20');
INSERT INTO `ka_bl` VALUES ('1790', '中一', '五中一', '40', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:21:08', '1.8');
INSERT INTO `ka_bl` VALUES ('620', '过关', '正码1', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('621', '过关', '正码1', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('622', '过关', '正码1', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('623', '过关', '正码1', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('624', '过关', '正码1', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('625', '过关', '正码1', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('626', '过关', '正码1', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('627', '过关', '正码2', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('628', '过关', '正码2', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('629', '过关', '正码2', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('630', '过关', '正码2', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('631', '过关', '正码2', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('632', '过关', '正码2', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('633', '过关', '正码2', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('634', '过关', '正码3', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('635', '过关', '正码3', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('636', '过关', '正码3', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('637', '过关', '正码3', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('638', '过关', '正码3', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('639', '过关', '正码3', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('640', '过关', '正码3', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('641', '过关', '正码4', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('642', '过关', '正码4', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('643', '过关', '正码4', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('644', '过关', '正码4', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('645', '过关', '正码4', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('646', '过关', '正码4', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('647', '过关', '正码4', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('648', '过关', '正码5', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('649', '过关', '正码5', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('650', '过关', '正码5', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('651', '过关', '正码5', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('652', '过关', '正码5', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('653', '过关', '正码5', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('654', '过关', '正码5', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('655', '过关', '正码6', '单', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('656', '过关', '正码6', '双', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('657', '过关', '正码6', '大', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('658', '过关', '正码6', '小', '1.92', '1.92', '0', '0', '0', '2011-07-03 16:11:31', '1.92');
INSERT INTO `ka_bl` VALUES ('659', '过关', '正码6', '红波', '2.72', '2.72', '0', '0', '0', '2011-07-03 16:11:31', '2.72');
INSERT INTO `ka_bl` VALUES ('660', '过关', '正码6', '绿波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('661', '过关', '正码6', '蓝波', '2.85', '2.85', '0', '0', '0', '2011-07-03 16:11:31', '2.85');
INSERT INTO `ka_bl` VALUES ('662', '半波', '半波', '红单', '5.65', '5.65', '0', '0', '0', '2016-07-13 15:56:43', '5.65');
INSERT INTO `ka_bl` VALUES ('663', '半波', '半波', '红双', '5.05', '5.05', '0', '0', '0', '2016-07-13 15:56:43', '5.05');
INSERT INTO `ka_bl` VALUES ('664', '半波', '半波', '红大', '6.5', '6.5', '0', '0', '0', '2016-07-13 15:56:43', '6.5');
INSERT INTO `ka_bl` VALUES ('665', '半波', '半波', '红小', '4.55', '4.55', '0', '0', '0', '2016-07-13 15:56:43', '4.55');
INSERT INTO `ka_bl` VALUES ('666', '半波', '半波', '绿单', '5.05', '5.05', '0', '0', '0', '2016-07-13 15:56:43', '5.05');
INSERT INTO `ka_bl` VALUES ('667', '半波', '半波', '绿双', '6.5', '6.5', '0', '0', '0', '2016-07-13 15:56:43', '6.5');
INSERT INTO `ka_bl` VALUES ('668', '半波', '半波', '绿大', '5.05', '5.05', '0', '0', '0', '2016-07-13 15:56:43', '5.05');
INSERT INTO `ka_bl` VALUES ('669', '半波', '半波', '绿小', '6.5', '6.5', '0', '0', '0', '2016-07-13 15:56:43', '6.5');
INSERT INTO `ka_bl` VALUES ('670', '半波', '半波', '蓝单', '5.65', '5.65', '0', '0', '0', '2016-07-13 15:56:43', '5.65');
INSERT INTO `ka_bl` VALUES ('671', '半波', '半波', '蓝双', '5.65', '5.65', '0', '0', '0', '2016-07-13 15:56:43', '5.65');
INSERT INTO `ka_bl` VALUES ('672', '半波', '半波', '蓝大', '5.05', '5.05', '0', '0', '0', '2016-07-13 15:56:43', '5.05');
INSERT INTO `ka_bl` VALUES ('673', '半波', '半波', '蓝小', '6.5', '6.5', '0', '0', '1', '2016-07-13 15:56:43', '6.5');
INSERT INTO `ka_bl` VALUES ('674', '生肖', '特肖', '鼠', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('675', '生肖', '特肖', '虎', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('676', '生肖', '特肖', '龙', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('677', '生肖', '特肖', '马', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('678', '生肖', '特肖', '猴', '9.2', '9.2', '0', '0', '0', '2016-07-13 15:53:32', '9.2');
INSERT INTO `ka_bl` VALUES ('679', '生肖', '特肖', '狗', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('680', '生肖', '特肖', '牛', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('681', '生肖', '特肖', '兔', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('682', '生肖', '特肖', '蛇', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('683', '生肖', '特肖', '羊', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('684', '生肖', '特肖', '鸡', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('685', '生肖', '特肖', '猪', '11.2', '11.2', '0', '0', '0', '2016-07-13 15:53:32', '11.2');
INSERT INTO `ka_bl` VALUES ('712', '花会', '特花', '1', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('690', '尾数', '尾数', '0', '1.97', '1.97', '0', '0', '0', '2016-07-13 15:46:57', '1.97');
INSERT INTO `ka_bl` VALUES ('691', '尾数', '尾数', '1', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('692', '尾数', '尾数', '2', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('693', '尾数', '尾数', '3', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('694', '尾数', '尾数', '4', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('695', '尾数', '尾数', '5', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('696', '尾数', '尾数', '6', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('697', '尾数', '尾数', '7', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('698', '尾数', '尾数', '8', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('699', '尾数', '尾数', '9', '1.77', '1.77', '0', '0', '0', '2016-07-13 15:46:57', '1.77');
INSERT INTO `ka_bl` VALUES ('700', '生肖', '一肖', '鼠', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('701', '生肖', '一肖', '虎', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('702', '生肖', '一肖', '龙', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('703', '生肖', '一肖', '马', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('704', '生肖', '一肖', '猴', '1.76', '1.76', '0', '0', '0', '2016-07-13 17:36:02', '1.76');
INSERT INTO `ka_bl` VALUES ('705', '生肖', '一肖', '狗', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('706', '生肖', '一肖', '牛', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('707', '生肖', '一肖', '兔', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('708', '生肖', '一肖', '蛇', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('709', '生肖', '一肖', '羊', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('710', '生肖', '一肖', '鸡', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('711', '生肖', '一肖', '猪', '2.04', '2.04', '0', '0', '0', '2016-07-13 17:36:02', '2.04');
INSERT INTO `ka_bl` VALUES ('713', '五行', '五行', '金', '4.6', '4.6', '0', '0', '0', '2016-07-13 16:00:05', '4.6');
INSERT INTO `ka_bl` VALUES ('714', '五行', '五行', '木', '4.6', '4.6', '0', '0', '0', '2016-07-13 16:00:05', '4.6');
INSERT INTO `ka_bl` VALUES ('715', '五行', '五行', '水', '4.6', '4.6', '0', '0', '0', '2016-07-13 16:00:05', '4.6');
INSERT INTO `ka_bl` VALUES ('716', '五行', '五行', '火', '5.2', '5.2', '0', '0', '0', '2016-07-13 16:00:05', '5.2');
INSERT INTO `ka_bl` VALUES ('717', '五行', '五行', '土', '4.6', '4.6', '0', '0', '0', '2016-07-13 16:00:05', '4.6');
INSERT INTO `ka_bl` VALUES ('718', '半波', '半波', '红合单', '5.05', '5.05', '0', '0', '1', '2016-07-13 15:56:43', '5.05');
INSERT INTO `ka_bl` VALUES ('719', '半波', '半波', '红合双', '5.65', '5.65', '0', '0', '1', '2016-07-13 15:56:43', '5.65');
INSERT INTO `ka_bl` VALUES ('720', '半波', '半波', '绿合单', '5.65', '5.65', '0', '0', '1', '2016-07-13 15:56:43', '5.65');
INSERT INTO `ka_bl` VALUES ('721', '半波', '半波', '绿合双', '5.65', '5.65', '0', '0', '1', '2016-07-13 15:56:43', '5.65');
INSERT INTO `ka_bl` VALUES ('722', '半波', '半波', '蓝合单', '5.65', '5.65', '0', '0', '1', '2016-07-13 15:56:43', '5.65');
INSERT INTO `ka_bl` VALUES ('723', '半波', '半波', '蓝合双', '5.65', '5.65', '0', '0', '1', '2016-07-13 15:56:43', '5.65');
INSERT INTO `ka_bl` VALUES ('726', '花会', '特花', '15', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('727', '花会', '特花', '16', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('728', '花会', '特花', '17', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('729', '花会', '特花', '18', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('730', '花会', '特花', '19', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('731', '花会', '特花', '20', '29.5', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('732', '花会', '特花', '21', '29.5', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('733', '花会', '特花', '22', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('734', '花会', '特花', '23', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('735', '花会', '特花', '24', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('736', '花会', '特花', '25', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('737', '花会', '特花', '26', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('738', '花会', '特花', '27', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('739', '花会', '特花', '28', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('740', '花会', '特花', '29', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('741', '花会', '特花', '30', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('742', '花会', '特花', '31', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('743', '花会', '特花', '32', '29.5', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('744', '花会', '特花', '33', '29.5', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('745', '花会', '特花', '34', '30', '30', '0', '0', '0', '0000-00-00 00:00:00', '30');
INSERT INTO `ka_bl` VALUES ('746', '花会', '特花', '单', '1.88', '1.88', '0', '0', '0', '0000-00-00 00:00:00', '1.88');
INSERT INTO `ka_bl` VALUES ('747', '花会', '特花', '双', '1.88', '1.88', '0', '0', '0', '0000-00-00 00:00:00', '1.88');
INSERT INTO `ka_bl` VALUES ('748', '特码', '特A', '家禽', '1.93', '1.93', '0', '0', '0', '2011-07-03 01:18:06', '1.93');
INSERT INTO `ka_bl` VALUES ('749', '特码', '特A', '野兽', '1.93', '1.93', '0', '0', '0', '2011-06-03 03:22:11', '1.93');
INSERT INTO `ka_bl` VALUES ('750', '特码', '特B', '家禽', '1.93', '1.93', '0', '0', '0', '2011-07-03 01:18:06', '1.93');
INSERT INTO `ka_bl` VALUES ('751', '特码', '特B', '野兽', '1.93', '1.93', '0', '0', '0', '2011-06-03 03:22:11', '1.93');
INSERT INTO `ka_bl` VALUES ('767', '头数', '头数', '3', '4.5', '4.5', '0', '0', '0', '2012-03-31 18:05:39', '4.5');
INSERT INTO `ka_bl` VALUES ('766', '头数', '头数', '2', '4.5', '4.5', '0', '0', '0', '2012-03-31 18:05:39', '4.5');
INSERT INTO `ka_bl` VALUES ('768', '头数', '头数', '4', '4.5', '4.5', '0', '0', '0', '2012-03-31 18:05:39', '4.5');
INSERT INTO `ka_bl` VALUES ('765', '头数', '头数', '1', '4.5', '4.5', '0', '0', '0', '2016-06-24 16:55:05', '4.5');
INSERT INTO `ka_bl` VALUES ('764', '头数', '头数', '0', '5', '5', '0', '0', '0', '2016-06-24 16:55:05', '5');
INSERT INTO `ka_bl` VALUES ('763', '半半波', '半半波', '蓝小双', '11', '11', '0', '0', '0', '2016-06-29 15:58:55', '11');
INSERT INTO `ka_bl` VALUES ('752', '半半波', '半半波', '红大单', '14.6', '14.6', '0', '0', '0', '2016-06-29 15:58:55', '14.6');
INSERT INTO `ka_bl` VALUES ('753', '半半波', '半半波', '红大双', '11', '11', '0', '0', '0', '2016-06-29 15:58:55', '11');
INSERT INTO `ka_bl` VALUES ('754', '半半波', '半半波', '红小单', '8.8', '8.8', '0', '0', '0', '2016-06-29 15:58:55', '8.8');
INSERT INTO `ka_bl` VALUES ('755', '半半波', '半半波', '红小双', '8.8', '8.8', '0', '0', '0', '2016-06-29 15:58:55', '8.8');
INSERT INTO `ka_bl` VALUES ('756', '半半波', '半半波', '绿大单', '8.8', '8.8', '0', '0', '0', '2016-06-29 15:58:55', '8.8');
INSERT INTO `ka_bl` VALUES ('757', '半半波', '半半波', '绿大双', '11', '11', '0', '0', '0', '2016-06-29 15:58:55', '11');
INSERT INTO `ka_bl` VALUES ('758', '半半波', '半半波', '绿小单', '11', '11', '0', '0', '0', '2016-06-29 15:58:55', '11');
INSERT INTO `ka_bl` VALUES ('759', '半半波', '半半波', '绿小双', '14.6', '14.6', '0', '0', '0', '2016-06-29 15:58:55', '14.6');
INSERT INTO `ka_bl` VALUES ('760', '半半波', '半半波', '蓝大单', '8.8', '8.8', '0', '0', '0', '2016-06-29 15:58:55', '8.8');
INSERT INTO `ka_bl` VALUES ('761', '半半波', '半半波', '蓝大双', '11', '11', '0', '0', '0', '2016-06-29 15:58:55', '11');
INSERT INTO `ka_bl` VALUES ('762', '半半波', '半半波', '蓝小单', '14.6', '14.6', '0', '0', '0', '2016-06-29 15:58:55', '14.6');
INSERT INTO `ka_bl` VALUES ('769', '正特尾数', '正特尾数', '0', '1.97', '1.97', '0', '0', '0', '2016-07-13 17:36:02', '1.97');
INSERT INTO `ka_bl` VALUES ('770', '正特尾数', '正特尾数', '1', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('771', '正特尾数', '正特尾数', '2', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('772', '正特尾数', '正特尾数', '3', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('773', '正特尾数', '正特尾数', '4', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('774', '正特尾数', '正特尾数', '5', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('775', '正特尾数', '正特尾数', '6', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('776', '正特尾数', '正特尾数', '7', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('777', '正特尾数', '正特尾数', '8', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('778', '正特尾数', '正特尾数', '9', '1.77', '1.77', '0', '0', '0', '2016-07-13 17:36:02', '1.77');
INSERT INTO `ka_bl` VALUES ('780', '七色波', '七色波', '绿波', '2.75', '2.75', '0', '0', '0', '2016-06-29 15:59:39', '2.75');
INSERT INTO `ka_bl` VALUES ('779', '七色波', '七色波', '红波', '2.72', '2.72', '0', '0', '0', '2016-06-29 15:59:39', '2.72');
INSERT INTO `ka_bl` VALUES ('781', '七色波', '七色波', '蓝波', '2.75', '2.75', '0', '0', '0', '2016-06-29 15:59:39', '2.75');
INSERT INTO `ka_bl` VALUES ('782', '七色波', '七色波', '合局', '20', '20', '0', '0', '0', '2016-06-29 15:59:39', '20');
INSERT INTO `ka_bl` VALUES ('783', '正肖', '正肖', '鼠', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('784', '正肖', '正肖', '虎', '1.8', '1.8', '0', '1000', '0', '2016-06-29 15:59:39', '1.8');
INSERT INTO `ka_bl` VALUES ('785', '正肖', '正肖', '龙', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('786', '正肖', '正肖', '马', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('787', '正肖', '正肖', '猴', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('788', '正肖', '正肖', '狗', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('789', '正肖', '正肖', '牛', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('790', '正肖', '正肖', '兔', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('791', '正肖', '正肖', '蛇', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('792', '正肖', '正肖', '羊', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('793', '正肖', '正肖', '鸡', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('794', '正肖', '正肖', '猪', '1.9', '1.9', '0', '1000', '0', '2016-06-29 15:59:39', '1.9');
INSERT INTO `ka_bl` VALUES ('806', '特码', '特B', '小双', '3.4', '3.4', '0', '0', '0', '2011-06-17 22:54:46', '3.5');
INSERT INTO `ka_bl` VALUES ('805', '特码', '特B', '大双', '3.4', '3.4', '0', '0', '0', '2011-06-17 22:54:46', '3.5');
INSERT INTO `ka_bl` VALUES ('804', '特码', '特B', '小单', '3.4', '3.4', '0', '0', '0', '2011-06-17 22:54:46', '3.5');
INSERT INTO `ka_bl` VALUES ('803', '特码', '特B', '大单', '3.4', '3.4', '0', '0', '0', '2011-06-29 21:31:00', '3.75');
INSERT INTO `ka_bl` VALUES ('802', '特码', '特B', '尾小', '1.93', '1.93', '0', '0', '0', '2011-02-22 17:12:58', '1.93');
INSERT INTO `ka_bl` VALUES ('801', '特码', '特B', '尾大', '1.93', '1.93', '0', '1000', '0', '2011-06-29 21:44:15', '1.93');
INSERT INTO `ka_bl` VALUES ('800', '特码', '特A', '小双', '3.4', '3.4', '0', '1000', '0', '2011-06-17 22:54:46', '3.4');
INSERT INTO `ka_bl` VALUES ('799', '特码', '特A', '大双', '3.4', '3.4', '0', '1000', '0', '2011-06-17 22:54:46', '3.4');
INSERT INTO `ka_bl` VALUES ('798', '特码', '特A', '小单', '3.4', '3.4', '0', '1000', '0', '2011-06-17 22:54:46', '3.4');
INSERT INTO `ka_bl` VALUES ('797', '特码', '特A', '大单', '3.4', '3.4', '0', '1000', '0', '2011-06-29 21:31:00', '3.4');
INSERT INTO `ka_bl` VALUES ('796', '特码', '特A', '尾小', '1.93', '1.93', '0', '1000', '0', '2011-02-22 17:12:58', '1.93');
INSERT INTO `ka_bl` VALUES ('795', '特码', '特A', '尾大', '1.93', '1.93', '0', '1000', '0', '2011-06-29 21:44:15', '1.93');
INSERT INTO `ka_bl` VALUES ('1054', '正1-6', '正码2', '合小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1055', '正1-6', '正码2', '合单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1053', '正1-6', '正码2', '合大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1052', '正1-6', '正码1', '尾小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1051', '正1-6', '正码1', '尾大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1050', '正1-6', '正码1', '合双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1057', '正1-6', '正码2', '尾大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1056', '正1-6', '正码2', '合双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1049', '正1-6', '正码1', '合单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1083', '正特', '正2特', '合小', '1.91', '1.91', '0', '0', '1', '2010-10-31 23:21:14', '1.91');
INSERT INTO `ka_bl` VALUES ('1034', '正特', '正1特', '合大', '1.91', '1.91', '0', '0', '1', '2010-12-22 18:59:10', '1.91');
INSERT INTO `ka_bl` VALUES ('1035', '正特', '正1特', '合小', '1.91', '1.91', '0', '0', '1', '2010-12-22 18:59:23', '1.91');
INSERT INTO `ka_bl` VALUES ('1084', '正特', '正3特', '合小', '1.91', '1.91', '0', '0', '0', '2010-10-31 23:21:33', '1.91');
INSERT INTO `ka_bl` VALUES ('1085', '正特', '正4特', '合小', '1.91', '1.91', '0', '0', '0', '2010-10-31 23:21:47', '1.91');
INSERT INTO `ka_bl` VALUES ('1086', '正特', '正5特', '合小', '1.91', '1.91', '0', '0', '0', '2010-10-31 23:22:08', '1.91');
INSERT INTO `ka_bl` VALUES ('1087', '正特', '正6特', '合小', '1.91', '1.91', '0', '0', '0', '2010-10-31 23:22:46', '1.91');
INSERT INTO `ka_bl` VALUES ('1048', '正1-6', '正码1', '合小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1047', '正1-6', '正码1', '合大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1041', '正特', '正6特', '合大', '1.91', '1.91', '0', '0', '0', '2010-10-31 23:22:44', '1.91');
INSERT INTO `ka_bl` VALUES ('1042', '正特', '正5特', '合大', '1.91', '1.91', '0', '0', '0', '2010-10-31 23:22:01', '1.91');
INSERT INTO `ka_bl` VALUES ('1043', '正特', '正4特', '合大', '1.91', '1.91', '0', '0', '0', '2010-10-31 23:21:45', '1.91');
INSERT INTO `ka_bl` VALUES ('1044', '正特', '正3特', '合大', '1.91', '1.91', '0', '0', '0', '2010-10-31 23:21:31', '1.91');
INSERT INTO `ka_bl` VALUES ('1045', '正特', '正2特', '合大', '1.91', '1.91', '0', '0', '1', '2010-10-31 23:21:12', '1.91');
INSERT INTO `ka_bl` VALUES ('1058', '正1-6', '正码2', '尾小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1059', '正1-6', '正码3', '合大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1060', '正1-6', '正码3', '合小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1061', '正1-6', '正码3', '合单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1062', '正1-6', '正码3', '合双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1063', '正1-6', '正码3', '尾大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1064', '正1-6', '正码3', '尾小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1065', '正1-6', '正码4', '合大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1066', '正1-6', '正码4', '合小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1067', '正1-6', '正码4', '合单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1068', '正1-6', '正码4', '合双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1069', '正1-6', '正码4', '尾大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1070', '正1-6', '正码4', '尾小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1071', '正1-6', '正码5', '合大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1072', '正1-6', '正码5', '合小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1073', '正1-6', '正码5', '合单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1074', '正1-6', '正码5', '合双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1075', '正1-6', '正码5', '尾大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1076', '正1-6', '正码5', '尾小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1077', '正1-6', '正码6', '合大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1078', '正1-6', '正码6', '合小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1079', '正1-6', '正码6', '合单', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1080', '正1-6', '正码6', '合双', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1081', '正1-6', '正码6', '尾大', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('1082', '正1-6', '正码6', '尾小', '1.92', '1.92', '0', '0', '0', '2011-02-21 20:17:34', '1.92');
INSERT INTO `ka_bl` VALUES ('901', '生肖', '二肖', '鼠', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('918', '生肖', '三肖', '狗', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('1101', '不中', '五不中', '1', '2.02', '2.02', '0', '0', '0', '2011-02-21 21:41:50', '2.02');
INSERT INTO `ka_bl` VALUES ('911', '生肖', '二肖', '鸡', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('909', '生肖', '二肖', '蛇', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('910', '生肖', '二肖', '羊', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('919', '生肖', '三肖', '牛', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('913', '生肖', '三肖', '鼠', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('912', '生肖', '二肖', '猪', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('1102', '不中', '五不中', '2', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:30', '2.02');
INSERT INTO `ka_bl` VALUES ('1103', '不中', '五不中', '3', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:32', '2.02');
INSERT INTO `ka_bl` VALUES ('1104', '不中', '五不中', '4', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:33', '2.02');
INSERT INTO `ka_bl` VALUES ('1105', '不中', '五不中', '5', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:35', '2.02');
INSERT INTO `ka_bl` VALUES ('1106', '不中', '五不中', '6', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:38', '2.02');
INSERT INTO `ka_bl` VALUES ('1107', '不中', '五不中', '7', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:40', '2.02');
INSERT INTO `ka_bl` VALUES ('1108', '不中', '五不中', '8', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:42', '2.02');
INSERT INTO `ka_bl` VALUES ('1109', '不中', '五不中', '9', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:43', '2.02');
INSERT INTO `ka_bl` VALUES ('1110', '不中', '五不中', '10', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:45', '2.02');
INSERT INTO `ka_bl` VALUES ('1111', '不中', '五不中', '11', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:48', '2.02');
INSERT INTO `ka_bl` VALUES ('1112', '不中', '五不中', '12', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:49', '2.02');
INSERT INTO `ka_bl` VALUES ('1113', '不中', '五不中', '13', '2.02', '2.02', '0', '0', '0', '2010-11-03 02:20:51', '2.02');
INSERT INTO `ka_bl` VALUES ('1114', '不中', '五不中', '14', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:34:20', '2.02');
INSERT INTO `ka_bl` VALUES ('1115', '不中', '五不中', '15', '2.02', '2.02', '0', '0', '0', '2010-07-15 21:32:34', '2.02');
INSERT INTO `ka_bl` VALUES ('1116', '不中', '五不中', '16', '2.02', '2.02', '0', '0', '0', '2010-07-15 21:32:37', '2.02');
INSERT INTO `ka_bl` VALUES ('1117', '不中', '五不中', '17', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:34:42', '2.02');
INSERT INTO `ka_bl` VALUES ('1118', '不中', '五不中', '18', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:34:47', '2.02');
INSERT INTO `ka_bl` VALUES ('1119', '不中', '五不中', '19', '2.02', '2.02', '0', '0', '0', '2010-07-21 02:22:50', '2.02');
INSERT INTO `ka_bl` VALUES ('1120', '不中', '五不中', '20', '1.52', '2.02', '0', '0', '0', '2010-12-22 19:26:56', '2.02');
INSERT INTO `ka_bl` VALUES ('1121', '不中', '五不中', '21', '1.52', '2.02', '0', '0', '0', '2010-07-15 17:35:06', '2.02');
INSERT INTO `ka_bl` VALUES ('1122', '不中', '五不中', '22', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:35:12', '2.02');
INSERT INTO `ka_bl` VALUES ('1123', '不中', '五不中', '23', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:35:18', '2.02');
INSERT INTO `ka_bl` VALUES ('1124', '不中', '五不中', '24', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:35:24', '2.02');
INSERT INTO `ka_bl` VALUES ('1125', '不中', '五不中', '25', '2.02', '2.02', '0', '0', '0', '2010-11-02 17:28:18', '2.02');
INSERT INTO `ka_bl` VALUES ('1126', '不中', '五不中', '26', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:35:36', '2.02');
INSERT INTO `ka_bl` VALUES ('1127', '不中', '五不中', '27', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:35:40', '2.02');
INSERT INTO `ka_bl` VALUES ('1128', '不中', '五不中', '28', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:35:45', '2.02');
INSERT INTO `ka_bl` VALUES ('1129', '不中', '五不中', '29', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:35:50', '2.02');
INSERT INTO `ka_bl` VALUES ('1130', '不中', '五不中', '30', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:35:57', '2.02');
INSERT INTO `ka_bl` VALUES ('1131', '不中', '五不中', '31', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:36:02', '2.02');
INSERT INTO `ka_bl` VALUES ('1132', '不中', '五不中', '32', '1.52', '2.02', '0', '0', '0', '2010-10-28 14:08:48', '2.02');
INSERT INTO `ka_bl` VALUES ('1133', '不中', '五不中', '33', '1.52', '2.02', '0', '0', '0', '2010-10-28 14:09:00', '2.02');
INSERT INTO `ka_bl` VALUES ('1134', '不中', '五不中', '34', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:36:18', '2.02');
INSERT INTO `ka_bl` VALUES ('1135', '不中', '五不中', '35', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:36:24', '2.02');
INSERT INTO `ka_bl` VALUES ('1136', '不中', '五不中', '36', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:36:33', '2.02');
INSERT INTO `ka_bl` VALUES ('1137', '不中', '五不中', '37', '2.02', '2.02', '0', '0', '0', '2010-11-02 17:28:20', '2.02');
INSERT INTO `ka_bl` VALUES ('1138', '不中', '五不中', '38', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:36:44', '2.02');
INSERT INTO `ka_bl` VALUES ('1139', '不中', '五不中', '39', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:36:50', '2.02');
INSERT INTO `ka_bl` VALUES ('1140', '不中', '五不中', '40', '2.02', '2.02', '0', '0', '0', '2010-07-24 19:29:28', '2.02');
INSERT INTO `ka_bl` VALUES ('1141', '不中', '五不中', '41', '2.02', '2.02', '0', '0', '0', '2010-10-28 14:09:03', '2.02');
INSERT INTO `ka_bl` VALUES ('1142', '不中', '五不中', '42', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:37:31', '2.02');
INSERT INTO `ka_bl` VALUES ('1143', '不中', '五不中', '43', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:37:37', '2.02');
INSERT INTO `ka_bl` VALUES ('1144', '不中', '五不中', '44', '1.52', '2.02', '0', '0', '0', '2010-07-15 17:37:42', '2.02');
INSERT INTO `ka_bl` VALUES ('1145', '不中', '五不中', '45', '1.52', '2.02', '0', '0', '0', '2010-07-15 17:37:48', '2.02');
INSERT INTO `ka_bl` VALUES ('1146', '不中', '五不中', '46', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:37:54', '2.02');
INSERT INTO `ka_bl` VALUES ('1147', '不中', '五不中', '47', '2.02', '2.02', '0', '0', '0', '2010-07-15 17:38:00', '2.02');
INSERT INTO `ka_bl` VALUES ('1148', '不中', '五不中', '48', '2.02', '2.02', '0', '0', '0', '2010-07-22 02:24:43', '2.02');
INSERT INTO `ka_bl` VALUES ('1149', '不中', '五不中', '49', '2.02', '2.02', '0', '0', '0', '2010-11-02 17:28:42', '2.02');
INSERT INTO `ka_bl` VALUES ('1201', '不中', '七不中', '1', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:03', '3.07');
INSERT INTO `ka_bl` VALUES ('1202', '不中', '七不中', '2', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:04', '3.07');
INSERT INTO `ka_bl` VALUES ('1203', '不中', '七不中', '3', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:04', '3.07');
INSERT INTO `ka_bl` VALUES ('1204', '不中', '七不中', '4', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:05', '3.07');
INSERT INTO `ka_bl` VALUES ('1205', '不中', '七不中', '5', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:07', '3.07');
INSERT INTO `ka_bl` VALUES ('1206', '不中', '七不中', '6', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:08', '3.07');
INSERT INTO `ka_bl` VALUES ('1207', '不中', '七不中', '7', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:09', '3.07');
INSERT INTO `ka_bl` VALUES ('1208', '不中', '七不中', '8', '3.07', '3.07', '0', '0', '0', '2010-11-02 17:29:00', '3.07');
INSERT INTO `ka_bl` VALUES ('1209', '不中', '七不中', '9', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:10', '3.07');
INSERT INTO `ka_bl` VALUES ('1210', '不中', '七不中', '10', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:11', '3.07');
INSERT INTO `ka_bl` VALUES ('1211', '不中', '七不中', '11', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:12', '3.07');
INSERT INTO `ka_bl` VALUES ('1212', '不中', '七不中', '12', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:13', '3.07');
INSERT INTO `ka_bl` VALUES ('1213', '不中', '七不中', '13', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:13', '3.07');
INSERT INTO `ka_bl` VALUES ('1214', '不中', '七不中', '14', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:14', '3.07');
INSERT INTO `ka_bl` VALUES ('1215', '不中', '七不中', '15', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:15', '3.07');
INSERT INTO `ka_bl` VALUES ('1216', '不中', '七不中', '16', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:16', '3.07');
INSERT INTO `ka_bl` VALUES ('1217', '不中', '七不中', '17', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:16', '3.07');
INSERT INTO `ka_bl` VALUES ('1218', '不中', '七不中', '18', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:17', '3.07');
INSERT INTO `ka_bl` VALUES ('1219', '不中', '七不中', '19', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:18', '3.07');
INSERT INTO `ka_bl` VALUES ('1220', '不中', '七不中', '20', '2.57', '3.07', '0', '0', '0', '2010-11-02 19:42:19', '3.07');
INSERT INTO `ka_bl` VALUES ('1221', '不中', '七不中', '21', '2.57', '3.07', '0', '0', '0', '2010-11-02 19:42:20', '3.07');
INSERT INTO `ka_bl` VALUES ('1222', '不中', '七不中', '22', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:21', '3.07');
INSERT INTO `ka_bl` VALUES ('1223', '不中', '七不中', '23', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:21', '3.07');
INSERT INTO `ka_bl` VALUES ('1224', '不中', '七不中', '24', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:22', '3.07');
INSERT INTO `ka_bl` VALUES ('1225', '不中', '七不中', '25', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:23', '3.07');
INSERT INTO `ka_bl` VALUES ('1226', '不中', '七不中', '26', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:24', '3.07');
INSERT INTO `ka_bl` VALUES ('1227', '不中', '七不中', '27', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:25', '3.07');
INSERT INTO `ka_bl` VALUES ('1228', '不中', '七不中', '28', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:25', '3.07');
INSERT INTO `ka_bl` VALUES ('1229', '不中', '七不中', '29', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:26', '3.07');
INSERT INTO `ka_bl` VALUES ('1230', '不中', '七不中', '30', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:27', '3.07');
INSERT INTO `ka_bl` VALUES ('1231', '不中', '七不中', '31', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:28', '3.07');
INSERT INTO `ka_bl` VALUES ('1232', '不中', '七不中', '32', '2.57', '3.07', '0', '0', '0', '2010-11-02 19:42:28', '3.07');
INSERT INTO `ka_bl` VALUES ('1233', '不中', '七不中', '33', '2.57', '3.07', '0', '0', '0', '2010-11-02 19:42:29', '3.07');
INSERT INTO `ka_bl` VALUES ('1234', '不中', '七不中', '34', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:30', '3.07');
INSERT INTO `ka_bl` VALUES ('1235', '不中', '七不中', '35', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:30', '3.07');
INSERT INTO `ka_bl` VALUES ('1236', '不中', '七不中', '36', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:31', '3.07');
INSERT INTO `ka_bl` VALUES ('1237', '不中', '七不中', '37', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:33', '3.07');
INSERT INTO `ka_bl` VALUES ('1238', '不中', '七不中', '38', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:34', '3.07');
INSERT INTO `ka_bl` VALUES ('1239', '不中', '七不中', '39', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:34', '3.07');
INSERT INTO `ka_bl` VALUES ('1240', '不中', '七不中', '40', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:35', '3.07');
INSERT INTO `ka_bl` VALUES ('1241', '不中', '七不中', '41', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:36', '3.07');
INSERT INTO `ka_bl` VALUES ('1242', '不中', '七不中', '42', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:37', '3.07');
INSERT INTO `ka_bl` VALUES ('1243', '不中', '七不中', '43', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:38', '3.07');
INSERT INTO `ka_bl` VALUES ('1244', '不中', '七不中', '44', '2.57', '3.07', '0', '0', '0', '2010-11-02 19:42:38', '3.07');
INSERT INTO `ka_bl` VALUES ('1245', '不中', '七不中', '45', '2.57', '3.07', '0', '0', '0', '2010-11-02 19:42:39', '3.07');
INSERT INTO `ka_bl` VALUES ('1246', '不中', '七不中', '46', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:40', '3.07');
INSERT INTO `ka_bl` VALUES ('1247', '不中', '七不中', '47', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:41', '3.07');
INSERT INTO `ka_bl` VALUES ('1248', '不中', '七不中', '48', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:42', '3.07');
INSERT INTO `ka_bl` VALUES ('1249', '不中', '七不中', '49', '3.07', '3.07', '0', '0', '0', '2010-11-02 19:42:48', '3.07');
INSERT INTO `ka_bl` VALUES ('905', '生肖', '二肖', '猴', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('904', '生肖', '二肖', '马', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('902', '生肖', '二肖', '虎', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('903', '生肖', '二肖', '龙', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('917', '生肖', '三肖', '猴', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('914', '生肖', '三肖', '虎', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('915', '生肖', '三肖', '龙', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('916', '生肖', '三肖', '马', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('925', '生肖', '四肖', '鼠', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('920', '生肖', '三肖', '兔', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('908', '生肖', '二肖', '兔', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('924', '生肖', '三肖', '猪', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('921', '生肖', '三肖', '蛇', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('922', '生肖', '三肖', '羊', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('923', '生肖', '三肖', '鸡', '3.45', '3.45', '0', '3000', '0', '2016-07-13 15:53:33', '3.45');
INSERT INTO `ka_bl` VALUES ('906', '生肖', '二肖', '狗', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('907', '生肖', '二肖', '牛', '4.85', '4.85', '0', '3000', '0', '2016-07-13 15:53:33', '4.85');
INSERT INTO `ka_bl` VALUES ('926', '生肖', '四肖', '虎', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('927', '生肖', '四肖', '龙', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('928', '生肖', '四肖', '马', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('929', '生肖', '四肖', '猴', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('930', '生肖', '四肖', '狗', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('931', '生肖', '四肖', '牛', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('932', '生肖', '四肖', '兔', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('933', '生肖', '四肖', '蛇', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('934', '生肖', '四肖', '羊', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('935', '生肖', '四肖', '鸡', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('936', '生肖', '四肖', '猪', '2.72', '2.72', '0', '3000', '0', '2016-07-13 15:53:33', '2.72');
INSERT INTO `ka_bl` VALUES ('937', '生肖', '五肖', '鼠', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('938', '生肖', '五肖', '虎', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('939', '生肖', '五肖', '龙', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('940', '生肖', '五肖', '马', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('941', '生肖', '五肖', '猴', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('942', '生肖', '五肖', '狗', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('943', '生肖', '五肖', '牛', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('944', '生肖', '五肖', '兔', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('945', '生肖', '五肖', '蛇', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('946', '生肖', '五肖', '羊', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('947', '生肖', '五肖', '鸡', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('948', '生肖', '五肖', '猪', '2.12', '2.12', '0', '3000', '0', '2016-07-13 15:53:33', '2.12');
INSERT INTO `ka_bl` VALUES ('949', '生肖', '六肖', '鼠', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('950', '生肖', '六肖', '虎', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('951', '生肖', '六肖', '龙', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('952', '生肖', '六肖', '马', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('953', '生肖', '六肖', '猴', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('954', '生肖', '六肖', '狗', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('955', '生肖', '六肖', '牛', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('956', '生肖', '六肖', '兔', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('957', '生肖', '六肖', '蛇', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('958', '生肖', '六肖', '羊', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('959', '生肖', '六肖', '鸡', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('960', '生肖', '六肖', '猪', '1.92', '1.92', '0', '3000', '0', '2016-07-13 15:53:33', '1.92');
INSERT INTO `ka_bl` VALUES ('1301', '尾数连', '二尾连中', '1', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1302', '尾数连', '二尾连中', '2', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1303', '尾数连', '二尾连中', '3', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1304', '尾数连', '二尾连中', '4', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1305', '尾数连', '二尾连中', '5', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1306', '尾数连', '二尾连中', '6', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1307', '尾数连', '二尾连中', '7', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1308', '尾数连', '二尾连中', '8', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1309', '尾数连', '二尾连中', '9', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1310', '尾数连', '二尾连中', '0', '3.15', '3.15', '0', '0', '0', '2010-12-30 00:49:39', '3.15');
INSERT INTO `ka_bl` VALUES ('1311', '尾数连', '三尾连中', '1', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1312', '尾数连', '三尾连中', '2', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1313', '尾数连', '三尾连中', '3', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1314', '尾数连', '三尾连中', '4', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1315', '尾数连', '三尾连中', '5', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1316', '尾数连', '三尾连中', '6', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1317', '尾数连', '三尾连中', '7', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1318', '尾数连', '三尾连中', '8', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1319', '尾数连', '三尾连中', '9', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1320', '尾数连', '三尾连中', '0', '7.1', '7.1', '0', '0', '0', '2012-03-30 18:15:28', '7.1');
INSERT INTO `ka_bl` VALUES ('1321', '尾数连', '四尾连中', '1', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1322', '尾数连', '四尾连中', '2', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1323', '尾数连', '四尾连中', '3', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1324', '尾数连', '四尾连中', '4', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1325', '尾数连', '四尾连中', '5', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1326', '尾数连', '四尾连中', '6', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1327', '尾数连', '四尾连中', '7', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1328', '尾数连', '四尾连中', '8', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1329', '尾数连', '四尾连中', '9', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1330', '尾数连', '四尾连中', '0', '16.1', '16.1', '0', '0', '0', '2012-03-30 18:15:58', '16.1');
INSERT INTO `ka_bl` VALUES ('1331', '尾数连', '二尾连不中', '1', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1332', '尾数连', '二尾连不中', '2', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1333', '尾数连', '二尾连不中', '3', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1334', '尾数连', '二尾连不中', '4', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1335', '尾数连', '二尾连不中', '5', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1336', '尾数连', '二尾连不中', '6', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1337', '尾数连', '二尾连不中', '7', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1338', '尾数连', '二尾连不中', '8', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1339', '尾数连', '二尾连不中', '9', '4.75', '4.75', '0', '0', '0', '2010-10-07 22:45:02', '4.75');
INSERT INTO `ka_bl` VALUES ('1340', '尾数连', '二尾连不中', '0', '4.25', '4.25', '0', '0', '0', '2010-10-07 22:45:02', '4.25');
INSERT INTO `ka_bl` VALUES ('1341', '尾数连', '三尾连不中', '1', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1342', '尾数连', '三尾连不中', '2', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1343', '尾数连', '三尾连不中', '3', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1344', '尾数连', '三尾连不中', '4', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1345', '尾数连', '三尾连不中', '5', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1346', '尾数连', '三尾连不中', '6', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1347', '尾数连', '三尾连不中', '7', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1348', '尾数连', '三尾连不中', '8', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1349', '尾数连', '三尾连不中', '9', '13.72', '13.72', '0', '0', '0', '2010-10-07 22:45:02', '13.72');
INSERT INTO `ka_bl` VALUES ('1350', '尾数连', '三尾连不中', '0', '11.52', '11.52', '0', '0', '0', '2010-10-07 22:45:02', '11.52');
INSERT INTO `ka_bl` VALUES ('1351', '尾数连', '四尾连不中', '1', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1352', '尾数连', '四尾连不中', '2', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1353', '尾数连', '四尾连不中', '3', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1354', '尾数连', '四尾连不中', '4', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1355', '尾数连', '四尾连不中', '5', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1356', '尾数连', '四尾连不中', '6', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1357', '尾数连', '四尾连不中', '7', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1358', '尾数连', '四尾连不中', '8', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1359', '尾数连', '四尾连不中', '9', '45.02', '45.02', '0', '0', '0', '2010-10-07 22:45:02', '45.02');
INSERT INTO `ka_bl` VALUES ('1360', '尾数连', '四尾连不中', '0', '40.02', '40.02', '0', '0', '0', '2010-10-07 22:45:02', '40.02');
INSERT INTO `ka_bl` VALUES ('1401', '生肖连', '二肖连中', '鼠', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1402', '生肖连', '二肖连中', '虎', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1403', '生肖连', '二肖连中', '龙', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1404', '生肖连', '二肖连中', '马', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1405', '生肖连', '二肖连中', '猴', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1406', '生肖连', '二肖连中', '狗', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1407', '生肖连', '二肖连中', '牛', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1408', '生肖连', '二肖连中', '兔', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1409', '生肖连', '二肖连中', '蛇', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1410', '生肖连', '二肖连中', '羊', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1411', '生肖连', '二肖连中', '鸡', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1412', '生肖连', '二肖连中', '猪', '3.45', '3.45', '0', '0', '0', '2016-07-13 16:29:29', '3.45');
INSERT INTO `ka_bl` VALUES ('1413', '生肖连', '三肖连中', '鼠', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1414', '生肖连', '三肖连中', '虎', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1415', '生肖连', '三肖连中', '龙', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1416', '生肖连', '三肖连中', '马', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1417', '生肖连', '三肖连中', '猴', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1418', '生肖连', '三肖连中', '狗', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1419', '生肖连', '三肖连中', '牛', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1420', '生肖连', '三肖连中', '兔', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1421', '生肖连', '三肖连中', '蛇', '10', '10', '0', '0', '0', '2016-07-13 16:29:29', '10');
INSERT INTO `ka_bl` VALUES ('1422', '生肖连', '三肖连中', '羊', '10', '10', '0', '0', '0', '2016-07-13 16:29:30', '10');
INSERT INTO `ka_bl` VALUES ('1423', '生肖连', '三肖连中', '鸡', '10', '10', '0', '0', '0', '2016-07-13 16:29:30', '10');
INSERT INTO `ka_bl` VALUES ('1424', '生肖连', '三肖连中', '猪', '10', '10', '0', '0', '0', '2016-07-13 16:29:30', '10');
INSERT INTO `ka_bl` VALUES ('1425', '生肖连', '四肖连中', '鼠', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1426', '生肖连', '四肖连中', '虎', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1427', '生肖连', '四肖连中', '龙', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1428', '生肖连', '四肖连中', '马', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1429', '生肖连', '四肖连中', '猴', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1430', '生肖连', '四肖连中', '狗', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1431', '生肖连', '四肖连中', '牛', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1432', '生肖连', '四肖连中', '兔', '25', '25', '0', '0', '0', '2016-07-13 16:29:30', '25');
INSERT INTO `ka_bl` VALUES ('1433', '生肖连', '四肖连中', '蛇', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1434', '生肖连', '四肖连中', '羊', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1435', '生肖连', '四肖连中', '鸡', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1436', '生肖连', '四肖连中', '猪', '30', '30', '0', '0', '0', '2016-07-13 16:29:30', '30');
INSERT INTO `ka_bl` VALUES ('1437', '生肖连', '二肖连不中', '鼠', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1438', '生肖连', '二肖连不中', '虎', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1439', '生肖连', '二肖连不中', '龙', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1440', '生肖连', '二肖连不中', '马', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1441', '生肖连', '二肖连不中', '猴', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1442', '生肖连', '二肖连不中', '狗', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1443', '生肖连', '二肖连不中', '牛', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1444', '生肖连', '二肖连不中', '兔', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1445', '生肖连', '二肖连不中', '蛇', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1446', '生肖连', '二肖连不中', '羊', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1447', '生肖连', '二肖连不中', '鸡', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1448', '生肖连', '二肖连不中', '猪', '3.6', '3.6', '0', '0', '1', '2016-07-13 16:29:30', '3.6');
INSERT INTO `ka_bl` VALUES ('1449', '生肖连', '三肖连不中', '鼠', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1450', '生肖连', '三肖连不中', '虎', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1451', '生肖连', '三肖连不中', '龙', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1452', '生肖连', '三肖连不中', '马', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1453', '生肖连', '三肖连不中', '猴', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1454', '生肖连', '三肖连不中', '狗', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1455', '生肖连', '三肖连不中', '牛', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1456', '生肖连', '三肖连不中', '兔', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1457', '生肖连', '三肖连不中', '蛇', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1458', '生肖连', '三肖连不中', '羊', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1459', '生肖连', '三肖连不中', '鸡', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1460', '生肖连', '三肖连不中', '猪', '7.8', '7.8', '0', '0', '1', '2016-07-13 16:29:30', '7.8');
INSERT INTO `ka_bl` VALUES ('1461', '生肖连', '四肖连不中', '鼠', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1462', '生肖连', '四肖连不中', '虎', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1463', '生肖连', '四肖连不中', '龙', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1464', '生肖连', '四肖连不中', '马', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1465', '生肖连', '四肖连不中', '猴', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1466', '生肖连', '四肖连不中', '狗', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1467', '生肖连', '四肖连不中', '牛', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1468', '生肖连', '四肖连不中', '兔', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1469', '生肖连', '四肖连不中', '蛇', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1470', '生肖连', '四肖连不中', '羊', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1471', '生肖连', '四肖连不中', '鸡', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1472', '生肖连', '四肖连不中', '猪', '18', '18', '0', '0', '1', '2016-07-13 16:29:30', '18');
INSERT INTO `ka_bl` VALUES ('1151', '不中', '六不中', '1', '0.01', '0.01', '0', null, '0', '2010-09-21 11:47:59', '0.01');
INSERT INTO `ka_bl` VALUES ('1152', '不中', '六不中', '2', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:43:07', '0.01');
INSERT INTO `ka_bl` VALUES ('1153', '不中', '六不中', '3', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:43:15', '0.01');
INSERT INTO `ka_bl` VALUES ('1154', '不中', '六不中', '4', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:43:22', '0.01');
INSERT INTO `ka_bl` VALUES ('1155', '不中', '六不中', '5', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:43:29', '0.01');
INSERT INTO `ka_bl` VALUES ('1156', '不中', '六不中', '6', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:43:35', '0.01');
INSERT INTO `ka_bl` VALUES ('1157', '不中', '六不中', '7', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:43:43', '0.01');
INSERT INTO `ka_bl` VALUES ('1158', '不中', '六不中', '8', '0.01', '0.01', '0', '0', '0', '2010-11-02 17:28:52', '0.01');
INSERT INTO `ka_bl` VALUES ('1159', '不中', '六不中', '9', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:43:56', '0.01');
INSERT INTO `ka_bl` VALUES ('1160', '不中', '六不中', '10', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:09', '0.01');
INSERT INTO `ka_bl` VALUES ('1161', '不中', '六不中', '11', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:15', '0.01');
INSERT INTO `ka_bl` VALUES ('1162', '不中', '六不中', '12', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:21', '0.01');
INSERT INTO `ka_bl` VALUES ('1163', '不中', '六不中', '13', '0.01', '0.01', '0', '0', '0', '2010-07-28 02:47:29', '0.01');
INSERT INTO `ka_bl` VALUES ('1164', '不中', '六不中', '14', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:33', '0.01');
INSERT INTO `ka_bl` VALUES ('1165', '不中', '六不中', '15', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:39', '0.01');
INSERT INTO `ka_bl` VALUES ('1166', '不中', '六不中', '16', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:43', '0.01');
INSERT INTO `ka_bl` VALUES ('1167', '不中', '六不中', '17', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:48', '0.01');
INSERT INTO `ka_bl` VALUES ('1168', '不中', '六不中', '18', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:53', '0.01');
INSERT INTO `ka_bl` VALUES ('1169', '不中', '六不中', '19', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:44:59', '0.01');
INSERT INTO `ka_bl` VALUES ('1170', '不中', '六不中', '20', '-0.49', '0.01', '0', '0', '0', '2010-07-26 20:45:06', '0.01');
INSERT INTO `ka_bl` VALUES ('1171', '不中', '六不中', '21', '-0.49', '0.01', '0', '0', '0', '2010-07-26 20:45:12', '0.01');
INSERT INTO `ka_bl` VALUES ('1172', '不中', '六不中', '22', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:45:18', '0.01');
INSERT INTO `ka_bl` VALUES ('1173', '不中', '六不中', '23', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:45:23', '0.01');
INSERT INTO `ka_bl` VALUES ('1174', '不中', '六不中', '24', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:45:28', '0.01');
INSERT INTO `ka_bl` VALUES ('1175', '不中', '六不中', '25', '0.01', '0.01', '0', '0', '0', '2010-07-28 02:47:35', '0.01');
INSERT INTO `ka_bl` VALUES ('1176', '不中', '六不中', '26', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:45:40', '0.01');
INSERT INTO `ka_bl` VALUES ('1177', '不中', '六不中', '27', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:45:45', '0.01');
INSERT INTO `ka_bl` VALUES ('1178', '不中', '六不中', '28', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:45:57', '0.01');
INSERT INTO `ka_bl` VALUES ('1179', '不中', '六不中', '29', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:46:02', '0.01');
INSERT INTO `ka_bl` VALUES ('1180', '不中', '六不中', '30', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:46:08', '0.01');
INSERT INTO `ka_bl` VALUES ('1181', '不中', '六不中', '31', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:46:14', '0.01');
INSERT INTO `ka_bl` VALUES ('1182', '不中', '六不中', '32', '-0.49', '0.01', '0', '0', '0', '2010-10-30 09:43:06', '0.01');
INSERT INTO `ka_bl` VALUES ('1183', '不中', '六不中', '33', '-0.49', '0.01', '0', '0', '0', '2010-10-28 14:09:25', '0.01');
INSERT INTO `ka_bl` VALUES ('1184', '不中', '六不中', '34', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:46:32', '0.01');
INSERT INTO `ka_bl` VALUES ('1185', '不中', '六不中', '35', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:46:37', '0.01');
INSERT INTO `ka_bl` VALUES ('1186', '不中', '六不中', '36', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:46:41', '0.01');
INSERT INTO `ka_bl` VALUES ('1187', '不中', '六不中', '37', '0.01', '0.01', '0', '0', '0', '2010-07-28 02:47:44', '0.01');
INSERT INTO `ka_bl` VALUES ('1188', '不中', '六不中', '38', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:46:50', '0.01');
INSERT INTO `ka_bl` VALUES ('1189', '不中', '六不中', '39', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:46:54', '0.01');
INSERT INTO `ka_bl` VALUES ('1190', '不中', '六不中', '40', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:47:00', '0.01');
INSERT INTO `ka_bl` VALUES ('1191', '不中', '六不中', '41', '0.01', '0.01', '0', '0', '0', '2010-10-30 09:43:11', '0.01');
INSERT INTO `ka_bl` VALUES ('1192', '不中', '六不中', '42', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:47:10', '0.01');
INSERT INTO `ka_bl` VALUES ('1193', '不中', '六不中', '43', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:47:15', '0.01');
INSERT INTO `ka_bl` VALUES ('1194', '不中', '六不中', '44', '-0.49', '0.01', '0', '0', '0', '2010-07-26 20:47:20', '0.01');
INSERT INTO `ka_bl` VALUES ('1195', '不中', '六不中', '45', '-0.49', '0.01', '0', '0', '0', '2010-07-26 20:47:24', '0.01');
INSERT INTO `ka_bl` VALUES ('1196', '不中', '六不中', '46', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:47:29', '0.01');
INSERT INTO `ka_bl` VALUES ('1197', '不中', '六不中', '47', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:47:34', '0.01');
INSERT INTO `ka_bl` VALUES ('1198', '不中', '六不中', '48', '0.01', '0.01', '0', '0', '0', '2010-07-26 20:47:38', '0.01');
INSERT INTO `ka_bl` VALUES ('1199', '不中', '六不中', '49', '0.01', '0.01', '0', '0', '0', '2010-11-02 17:42:45', '0.01');
INSERT INTO `ka_bl` VALUES ('1251', '不中', '八不中', '1', '3.65', '3.65', '0', '0', '0', '2010-07-28 02:49:29', '3.65');
INSERT INTO `ka_bl` VALUES ('1252', '不中', '八不中', '2', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:49:15', '3.65');
INSERT INTO `ka_bl` VALUES ('1253', '不中', '八不中', '3', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:49:20', '3.65');
INSERT INTO `ka_bl` VALUES ('1254', '不中', '八不中', '4', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:49:25', '3.65');
INSERT INTO `ka_bl` VALUES ('1255', '不中', '八不中', '5', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:49:30', '3.65');
INSERT INTO `ka_bl` VALUES ('1256', '不中', '八不中', '6', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:49:43', '3.65');
INSERT INTO `ka_bl` VALUES ('1257', '不中', '八不中', '7', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:49:48', '3.65');
INSERT INTO `ka_bl` VALUES ('1258', '不中', '八不中', '8', '3.65', '3.65', '0', '0', '0', '2010-11-02 17:29:05', '3.65');
INSERT INTO `ka_bl` VALUES ('1259', '不中', '八不中', '9', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:49:58', '3.65');
INSERT INTO `ka_bl` VALUES ('1260', '不中', '八不中', '10', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:50:08', '3.65');
INSERT INTO `ka_bl` VALUES ('1261', '不中', '八不中', '11', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:50:17', '3.65');
INSERT INTO `ka_bl` VALUES ('1262', '不中', '八不中', '12', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:50:22', '3.65');
INSERT INTO `ka_bl` VALUES ('1263', '不中', '八不中', '13', '3.65', '3.65', '0', '0', '0', '2010-07-28 02:49:37', '3.65');
INSERT INTO `ka_bl` VALUES ('1264', '不中', '八不中', '14', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:50:36', '3.65');
INSERT INTO `ka_bl` VALUES ('1265', '不中', '八不中', '15', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:50:41', '3.65');
INSERT INTO `ka_bl` VALUES ('1266', '不中', '八不中', '16', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:50:46', '3.65');
INSERT INTO `ka_bl` VALUES ('1267', '不中', '八不中', '17', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:50:51', '3.65');
INSERT INTO `ka_bl` VALUES ('1268', '不中', '八不中', '18', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:50:57', '3.65');
INSERT INTO `ka_bl` VALUES ('1269', '不中', '八不中', '19', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:51:03', '3.65');
INSERT INTO `ka_bl` VALUES ('1270', '不中', '八不中', '20', '3.15', '3.65', '0', '0', '0', '2010-07-26 20:51:10', '3.65');
INSERT INTO `ka_bl` VALUES ('1271', '不中', '八不中', '21', '3.15', '3.65', '0', '0', '0', '2010-07-26 20:51:15', '3.65');
INSERT INTO `ka_bl` VALUES ('1272', '不中', '八不中', '22', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:51:20', '3.65');
INSERT INTO `ka_bl` VALUES ('1273', '不中', '八不中', '23', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:51:29', '3.65');
INSERT INTO `ka_bl` VALUES ('1274', '不中', '八不中', '24', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:51:34', '3.65');
INSERT INTO `ka_bl` VALUES ('1275', '不中', '八不中', '25', '3.65', '3.65', '0', '0', '0', '2010-07-28 02:49:43', '3.65');
INSERT INTO `ka_bl` VALUES ('1276', '不中', '八不中', '26', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:51:47', '3.65');
INSERT INTO `ka_bl` VALUES ('1277', '不中', '八不中', '27', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:51:52', '3.65');
INSERT INTO `ka_bl` VALUES ('1278', '不中', '八不中', '28', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:51:58', '3.65');
INSERT INTO `ka_bl` VALUES ('1279', '不中', '八不中', '29', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:52:09', '3.65');
INSERT INTO `ka_bl` VALUES ('1280', '不中', '八不中', '30', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:52:15', '3.65');
INSERT INTO `ka_bl` VALUES ('1281', '不中', '八不中', '31', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:52:20', '3.65');
INSERT INTO `ka_bl` VALUES ('1282', '不中', '八不中', '32', '3.15', '3.65', '0', '0', '0', '2010-07-26 20:52:29', '3.65');
INSERT INTO `ka_bl` VALUES ('1283', '不中', '八不中', '33', '3.15', '3.65', '0', '0', '0', '2010-07-26 20:52:34', '3.65');
INSERT INTO `ka_bl` VALUES ('1284', '不中', '八不中', '34', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:52:40', '3.65');
INSERT INTO `ka_bl` VALUES ('1285', '不中', '八不中', '35', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:52:47', '3.65');
INSERT INTO `ka_bl` VALUES ('1286', '不中', '八不中', '36', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:52:51', '3.65');
INSERT INTO `ka_bl` VALUES ('1287', '不中', '八不中', '37', '3.65', '3.65', '0', '0', '0', '2010-07-28 02:49:50', '3.65');
INSERT INTO `ka_bl` VALUES ('1288', '不中', '八不中', '38', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:02', '3.65');
INSERT INTO `ka_bl` VALUES ('1289', '不中', '八不中', '39', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:08', '3.65');
INSERT INTO `ka_bl` VALUES ('1290', '不中', '八不中', '40', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:15', '3.65');
INSERT INTO `ka_bl` VALUES ('1291', '不中', '八不中', '41', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:19', '3.65');
INSERT INTO `ka_bl` VALUES ('1292', '不中', '八不中', '42', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:25', '3.65');
INSERT INTO `ka_bl` VALUES ('1293', '不中', '八不中', '43', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:30', '3.65');
INSERT INTO `ka_bl` VALUES ('1294', '不中', '八不中', '44', '3.15', '3.65', '0', '0', '0', '2010-07-26 20:53:35', '3.65');
INSERT INTO `ka_bl` VALUES ('1295', '不中', '八不中', '45', '3.15', '3.65', '0', '0', '0', '2010-07-26 20:53:41', '3.65');
INSERT INTO `ka_bl` VALUES ('1296', '不中', '八不中', '46', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:46', '3.65');
INSERT INTO `ka_bl` VALUES ('1297', '不中', '八不中', '47', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:50', '3.65');
INSERT INTO `ka_bl` VALUES ('1298', '不中', '八不中', '48', '3.65', '3.65', '0', '0', '0', '2010-07-26 20:53:57', '3.65');
INSERT INTO `ka_bl` VALUES ('1299', '不中', '八不中', '49', '3.65', '3.65', '0', '0', '0', '2010-11-02 17:42:23', '3.65');
INSERT INTO `ka_bl` VALUES ('1501', '不中', '九不中', '1', '4.38', '4.38', '0', '0', '0', '2010-10-30 09:53:02', '4.38');
INSERT INTO `ka_bl` VALUES ('1502', '不中', '九不中', '2', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:54:56', '4.38');
INSERT INTO `ka_bl` VALUES ('1503', '不中', '九不中', '3', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:55:02', '4.38');
INSERT INTO `ka_bl` VALUES ('1504', '不中', '九不中', '4', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:55:07', '4.38');
INSERT INTO `ka_bl` VALUES ('1505', '不中', '九不中', '5', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:55:12', '4.38');
INSERT INTO `ka_bl` VALUES ('1506', '不中', '九不中', '6', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:55:16', '4.38');
INSERT INTO `ka_bl` VALUES ('1507', '不中', '九不中', '7', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:55:21', '4.38');
INSERT INTO `ka_bl` VALUES ('1508', '不中', '九不中', '8', '4.38', '4.38', '0', '0', '0', '2010-11-02 17:29:15', '4.38');
INSERT INTO `ka_bl` VALUES ('1509', '不中', '九不中', '9', '4.38', '4.38', '0', '0', '0', '2010-10-30 09:52:28', '4.38');
INSERT INTO `ka_bl` VALUES ('1510', '不中', '九不中', '10', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:55:42', '4.38');
INSERT INTO `ka_bl` VALUES ('1511', '不中', '九不中', '11', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:55:51', '4.38');
INSERT INTO `ka_bl` VALUES ('1512', '不中', '九不中', '12', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:55:57', '4.38');
INSERT INTO `ka_bl` VALUES ('1513', '不中', '九不中', '13', '4.38', '4.38', '0', '0', '0', '2010-07-28 02:50:21', '4.38');
INSERT INTO `ka_bl` VALUES ('1514', '不中', '九不中', '14', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:56:08', '4.38');
INSERT INTO `ka_bl` VALUES ('1515', '不中', '九不中', '15', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:56:17', '4.38');
INSERT INTO `ka_bl` VALUES ('1516', '不中', '九不中', '16', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:56:22', '4.38');
INSERT INTO `ka_bl` VALUES ('1517', '不中', '九不中', '17', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:56:27', '4.38');
INSERT INTO `ka_bl` VALUES ('1518', '不中', '九不中', '18', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:56:32', '4.38');
INSERT INTO `ka_bl` VALUES ('1519', '不中', '九不中', '19', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:56:37', '4.38');
INSERT INTO `ka_bl` VALUES ('1520', '不中', '九不中', '20', '3.88', '4.38', '0', '0', '0', '2010-07-26 20:56:43', '4.38');
INSERT INTO `ka_bl` VALUES ('1521', '不中', '九不中', '21', '3.88', '4.38', '0', '0', '0', '2010-07-26 20:56:48', '4.38');
INSERT INTO `ka_bl` VALUES ('1522', '不中', '九不中', '22', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:56:53', '4.38');
INSERT INTO `ka_bl` VALUES ('1523', '不中', '九不中', '23', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:57:43', '4.38');
INSERT INTO `ka_bl` VALUES ('1524', '不中', '九不中', '24', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:57:48', '4.38');
INSERT INTO `ka_bl` VALUES ('1525', '不中', '九不中', '25', '4.38', '4.38', '0', '0', '0', '2010-07-28 02:50:27', '4.38');
INSERT INTO `ka_bl` VALUES ('1526', '不中', '九不中', '26', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:57:57', '4.38');
INSERT INTO `ka_bl` VALUES ('1527', '不中', '九不中', '27', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:04', '4.38');
INSERT INTO `ka_bl` VALUES ('1528', '不中', '九不中', '28', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:09', '4.38');
INSERT INTO `ka_bl` VALUES ('1529', '不中', '九不中', '29', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:14', '4.38');
INSERT INTO `ka_bl` VALUES ('1530', '不中', '九不中', '30', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:21', '4.38');
INSERT INTO `ka_bl` VALUES ('1531', '不中', '九不中', '31', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:26', '4.38');
INSERT INTO `ka_bl` VALUES ('1532', '不中', '九不中', '32', '3.88', '4.38', '0', '0', '0', '2010-10-30 09:45:34', '4.38');
INSERT INTO `ka_bl` VALUES ('1533', '不中', '九不中', '33', '3.88', '4.38', '0', '0', '0', '2010-07-26 20:58:35', '4.38');
INSERT INTO `ka_bl` VALUES ('1534', '不中', '九不中', '34', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:40', '4.38');
INSERT INTO `ka_bl` VALUES ('1535', '不中', '九不中', '35', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:45', '4.38');
INSERT INTO `ka_bl` VALUES ('1536', '不中', '九不中', '36', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:49', '4.38');
INSERT INTO `ka_bl` VALUES ('1537', '不中', '九不中', '37', '4.38', '4.38', '0', '0', '0', '2010-07-28 02:50:38', '4.38');
INSERT INTO `ka_bl` VALUES ('1538', '不中', '九不中', '38', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:58:58', '4.38');
INSERT INTO `ka_bl` VALUES ('1539', '不中', '九不中', '39', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:59:02', '4.38');
INSERT INTO `ka_bl` VALUES ('1540', '不中', '九不中', '40', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:59:07', '4.38');
INSERT INTO `ka_bl` VALUES ('1541', '不中', '九不中', '41', '4.38', '4.38', '0', '0', '0', '2010-10-30 09:45:30', '4.38');
INSERT INTO `ka_bl` VALUES ('1542', '不中', '九不中', '42', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:59:16', '4.38');
INSERT INTO `ka_bl` VALUES ('1543', '不中', '九不中', '43', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:59:24', '4.38');
INSERT INTO `ka_bl` VALUES ('1544', '不中', '九不中', '44', '3.88', '4.38', '0', '0', '0', '2010-07-26 20:59:29', '4.38');
INSERT INTO `ka_bl` VALUES ('1545', '不中', '九不中', '45', '3.88', '4.38', '0', '0', '0', '2010-07-26 20:59:34', '4.38');
INSERT INTO `ka_bl` VALUES ('1546', '不中', '九不中', '46', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:59:39', '4.38');
INSERT INTO `ka_bl` VALUES ('1547', '不中', '九不中', '47', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:59:44', '4.38');
INSERT INTO `ka_bl` VALUES ('1548', '不中', '九不中', '48', '4.38', '4.38', '0', '0', '0', '2010-07-26 20:59:49', '4.38');
INSERT INTO `ka_bl` VALUES ('1549', '不中', '九不中', '49', '4.38', '4.38', '0', '0', '0', '2010-11-02 17:41:28', '4.38');
INSERT INTO `ka_bl` VALUES ('1551', '不中', '十不中', '1', '5.29', '5.29', '0', '0', '0', '2010-09-25 19:14:37', '5.29');
INSERT INTO `ka_bl` VALUES ('1552', '不中', '十不中', '2', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:00:30', '5.29');
INSERT INTO `ka_bl` VALUES ('1553', '不中', '十不中', '3', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:00:36', '5.29');
INSERT INTO `ka_bl` VALUES ('1554', '不中', '十不中', '4', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:00:40', '5.29');
INSERT INTO `ka_bl` VALUES ('1555', '不中', '十不中', '5', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:00:45', '5.29');
INSERT INTO `ka_bl` VALUES ('1556', '不中', '十不中', '6', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:00:50', '5.29');
INSERT INTO `ka_bl` VALUES ('1557', '不中', '十不中', '7', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:00:56', '5.29');
INSERT INTO `ka_bl` VALUES ('1558', '不中', '十不中', '8', '5.29', '5.29', '0', '0', '0', '2010-11-02 17:29:21', '5.29');
INSERT INTO `ka_bl` VALUES ('1559', '不中', '十不中', '9', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:01:07', '5.29');
INSERT INTO `ka_bl` VALUES ('1560', '不中', '十不中', '10', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:01:19', '5.29');
INSERT INTO `ka_bl` VALUES ('1561', '不中', '十不中', '11', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:01:26', '5.29');
INSERT INTO `ka_bl` VALUES ('1562', '不中', '十不中', '12', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:01:32', '5.29');
INSERT INTO `ka_bl` VALUES ('1563', '不中', '十不中', '13', '5.29', '5.29', '0', '0', '0', '2010-09-09 22:09:36', '5.29');
INSERT INTO `ka_bl` VALUES ('1564', '不中', '十不中', '14', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:01:42', '5.29');
INSERT INTO `ka_bl` VALUES ('1565', '不中', '十不中', '15', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:01:47', '5.29');
INSERT INTO `ka_bl` VALUES ('1566', '不中', '十不中', '16', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:01:52', '5.29');
INSERT INTO `ka_bl` VALUES ('1567', '不中', '十不中', '17', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:01:59', '5.29');
INSERT INTO `ka_bl` VALUES ('1568', '不中', '十不中', '18', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:02:04', '5.29');
INSERT INTO `ka_bl` VALUES ('1569', '不中', '十不中', '19', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:02:09', '5.29');
INSERT INTO `ka_bl` VALUES ('1570', '不中', '十不中', '20', '4.79', '5.29', '0', '0', '0', '2010-07-26 21:02:16', '5.29');
INSERT INTO `ka_bl` VALUES ('1571', '不中', '十不中', '21', '4.79', '5.29', '0', '0', '0', '2010-07-26 21:02:21', '5.29');
INSERT INTO `ka_bl` VALUES ('1572', '不中', '十不中', '22', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:02:26', '5.29');
INSERT INTO `ka_bl` VALUES ('1573', '不中', '十不中', '23', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:02:30', '5.29');
INSERT INTO `ka_bl` VALUES ('1574', '不中', '十不中', '24', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:02:35', '5.29');
INSERT INTO `ka_bl` VALUES ('1575', '不中', '十不中', '25', '5.29', '5.29', '0', '0', '0', '2010-09-09 22:09:44', '5.29');
INSERT INTO `ka_bl` VALUES ('1576', '不中', '十不中', '26', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:02:45', '5.29');
INSERT INTO `ka_bl` VALUES ('1577', '不中', '十不中', '27', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:02:50', '5.29');
INSERT INTO `ka_bl` VALUES ('1578', '不中', '十不中', '28', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:02:54', '5.29');
INSERT INTO `ka_bl` VALUES ('1579', '不中', '十不中', '29', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:03:00', '5.29');
INSERT INTO `ka_bl` VALUES ('1580', '不中', '十不中', '30', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:03:06', '5.29');
INSERT INTO `ka_bl` VALUES ('1581', '不中', '十不中', '31', '5.29', '5.29', '0', '0', '0', '2010-08-30 21:42:51', '5.29');
INSERT INTO `ka_bl` VALUES ('1582', '不中', '十不中', '32', '4.79', '5.29', '0', '0', '0', '2010-07-26 21:03:15', '5.29');
INSERT INTO `ka_bl` VALUES ('1583', '不中', '十不中', '33', '4.79', '5.29', '0', '0', '0', '2010-10-30 09:46:42', '5.29');
INSERT INTO `ka_bl` VALUES ('1584', '不中', '十不中', '34', '5.29', '5.29', '0', '0', '0', '2010-09-19 19:06:31', '5.29');
INSERT INTO `ka_bl` VALUES ('1585', '不中', '十不中', '35', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:03:33', '5.29');
INSERT INTO `ka_bl` VALUES ('1586', '不中', '十不中', '36', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:03:38', '5.29');
INSERT INTO `ka_bl` VALUES ('1587', '不中', '十不中', '37', '5.29', '5.29', '0', '0', '0', '2010-09-09 22:09:51', '5.29');
INSERT INTO `ka_bl` VALUES ('1588', '不中', '十不中', '38', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:03:47', '5.29');
INSERT INTO `ka_bl` VALUES ('1589', '不中', '十不中', '39', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:03:52', '5.29');
INSERT INTO `ka_bl` VALUES ('1590', '不中', '十不中', '40', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:04:18', '5.29');
INSERT INTO `ka_bl` VALUES ('1591', '不中', '十不中', '41', '5.29', '5.29', '0', '0', '0', '2010-10-30 09:46:37', '5.29');
INSERT INTO `ka_bl` VALUES ('1592', '不中', '十不中', '42', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:04:28', '5.29');
INSERT INTO `ka_bl` VALUES ('1593', '不中', '十不中', '43', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:04:33', '5.29');
INSERT INTO `ka_bl` VALUES ('1594', '不中', '十不中', '44', '4.79', '5.29', '0', '0', '0', '2010-07-26 21:04:38', '5.29');
INSERT INTO `ka_bl` VALUES ('1595', '不中', '十不中', '45', '4.79', '5.29', '0', '0', '0', '2010-07-26 21:04:44', '5.29');
INSERT INTO `ka_bl` VALUES ('1596', '不中', '十不中', '46', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:04:49', '5.29');
INSERT INTO `ka_bl` VALUES ('1597', '不中', '十不中', '47', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:04:54', '5.29');
INSERT INTO `ka_bl` VALUES ('1598', '不中', '十不中', '48', '5.29', '5.29', '0', '0', '0', '2010-07-26 21:04:58', '5.29');
INSERT INTO `ka_bl` VALUES ('1599', '不中', '十不中', '49', '5.29', '5.29', '0', '0', '0', '2010-11-02 17:40:42', '5.29');
INSERT INTO `ka_bl` VALUES ('993', '生肖', '九肖', '蛇', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('1473', '生肖连', '五肖连中', '鼠', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1474', '生肖连', '五肖连中', '虎', '75', '75', '0', '0', '1', '2016-07-13 16:29:30', '75');
INSERT INTO `ka_bl` VALUES ('1475', '生肖连', '五肖连中', '龙', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1476', '生肖连', '五肖连中', '马', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1477', '生肖连', '五肖连中', '猴', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1478', '生肖连', '五肖连中', '狗', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1479', '生肖连', '五肖连中', '牛', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1480', '生肖连', '五肖连中', '兔', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1481', '生肖连', '五肖连中', '蛇', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1482', '生肖连', '五肖连中', '羊', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1483', '生肖连', '五肖连中', '鸡', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1484', '生肖连', '五肖连中', '猪', '88', '88', '0', '0', '1', '2016-07-13 16:29:30', '88');
INSERT INTO `ka_bl` VALUES ('1602', '不中', '十一不中', '2', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:58:16', '6.33');
INSERT INTO `ka_bl` VALUES ('1603', '不中', '十一不中', '3', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:58:33', '6.33');
INSERT INTO `ka_bl` VALUES ('1601', '不中', '十一不中', '1', '6.33', '6.33', '0', '0', '0', '2010-07-28 02:52:00', '6.33');
INSERT INTO `ka_bl` VALUES ('992', '生肖', '九肖', '兔', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('990', '生肖', '九肖', '狗', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('991', '生肖', '九肖', '牛', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('1604', '不中', '十一不中', '4', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:58:40', '6.33');
INSERT INTO `ka_bl` VALUES ('1605', '不中', '十一不中', '5', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:58:45', '6.33');
INSERT INTO `ka_bl` VALUES ('1606', '不中', '十一不中', '6', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:58:50', '6.33');
INSERT INTO `ka_bl` VALUES ('1607', '不中', '十一不中', '7', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:58:55', '6.33');
INSERT INTO `ka_bl` VALUES ('1608', '不中', '十一不中', '8', '6.33', '6.33', '0', '0', '0', '2010-11-02 17:29:26', '6.33');
INSERT INTO `ka_bl` VALUES ('1609', '不中', '十一不中', '9', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:59:05', '6.33');
INSERT INTO `ka_bl` VALUES ('1610', '不中', '十一不中', '10', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:59:15', '6.33');
INSERT INTO `ka_bl` VALUES ('1611', '不中', '十一不中', '11', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:59:24', '6.33');
INSERT INTO `ka_bl` VALUES ('1612', '不中', '十一不中', '12', '6.33', '6.33', '0', '0', '0', '2010-07-27 09:59:30', '6.33');
INSERT INTO `ka_bl` VALUES ('1613', '不中', '十一不中', '13', '6.33', '6.33', '0', '0', '0', '2010-07-28 02:52:07', '6.33');
INSERT INTO `ka_bl` VALUES ('1614', '不中', '十一不中', '14', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:00:42', '6.33');
INSERT INTO `ka_bl` VALUES ('1615', '不中', '十一不中', '15', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:00:47', '6.33');
INSERT INTO `ka_bl` VALUES ('1616', '不中', '十一不中', '16', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:00:53', '6.33');
INSERT INTO `ka_bl` VALUES ('1617', '不中', '十一不中', '17', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:01:00', '6.33');
INSERT INTO `ka_bl` VALUES ('1618', '不中', '十一不中', '18', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:01:07', '6.33');
INSERT INTO `ka_bl` VALUES ('1619', '不中', '十一不中', '19', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:01:12', '6.33');
INSERT INTO `ka_bl` VALUES ('1620', '不中', '十一不中', '20', '5.83', '6.33', '0', '0', '0', '2010-07-27 10:01:19', '6.33');
INSERT INTO `ka_bl` VALUES ('1621', '不中', '十一不中', '21', '5.83', '6.33', '0', '0', '0', '2010-07-27 10:01:24', '6.33');
INSERT INTO `ka_bl` VALUES ('1622', '不中', '十一不中', '22', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:01:30', '6.33');
INSERT INTO `ka_bl` VALUES ('1623', '不中', '十一不中', '23', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:01:35', '6.33');
INSERT INTO `ka_bl` VALUES ('1624', '不中', '十一不中', '24', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:01:41', '6.33');
INSERT INTO `ka_bl` VALUES ('1625', '不中', '十一不中', '25', '6.33', '6.33', '0', '0', '0', '2010-07-28 02:52:14', '6.33');
INSERT INTO `ka_bl` VALUES ('1626', '不中', '十一不中', '26', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:01:52', '6.33');
INSERT INTO `ka_bl` VALUES ('1627', '不中', '十一不中', '27', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:01:57', '6.33');
INSERT INTO `ka_bl` VALUES ('1628', '不中', '十一不中', '28', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:02:01', '6.33');
INSERT INTO `ka_bl` VALUES ('1629', '不中', '十一不中', '29', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:02:06', '6.33');
INSERT INTO `ka_bl` VALUES ('1630', '不中', '十一不中', '30', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:02:16', '6.33');
INSERT INTO `ka_bl` VALUES ('1631', '不中', '十一不中', '31', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:02:37', '6.33');
INSERT INTO `ka_bl` VALUES ('1632', '不中', '十一不中', '32', '5.83', '6.33', '0', '0', '0', '2010-07-27 10:02:50', '6.33');
INSERT INTO `ka_bl` VALUES ('1633', '不中', '十一不中', '33', '5.83', '6.33', '0', '0', '0', '2010-10-28 14:21:14', '6.33');
INSERT INTO `ka_bl` VALUES ('1634', '不中', '十一不中', '34', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:03:01', '6.33');
INSERT INTO `ka_bl` VALUES ('1635', '不中', '十一不中', '35', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:03:06', '6.33');
INSERT INTO `ka_bl` VALUES ('1636', '不中', '十一不中', '36', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:03:11', '6.33');
INSERT INTO `ka_bl` VALUES ('1637', '不中', '十一不中', '37', '6.33', '6.33', '0', '0', '0', '2010-07-28 02:52:20', '6.33');
INSERT INTO `ka_bl` VALUES ('1638', '不中', '十一不中', '38', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:03:21', '6.33');
INSERT INTO `ka_bl` VALUES ('1639', '不中', '十一不中', '39', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:03:27', '6.33');
INSERT INTO `ka_bl` VALUES ('1640', '不中', '十一不中', '40', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:03:36', '6.33');
INSERT INTO `ka_bl` VALUES ('1641', '不中', '十一不中', '41', '6.33', '6.33', '0', '0', '0', '2010-10-28 14:20:58', '6.33');
INSERT INTO `ka_bl` VALUES ('1642', '不中', '十一不中', '42', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:03:50', '6.33');
INSERT INTO `ka_bl` VALUES ('1643', '不中', '十一不中', '43', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:03:55', '6.33');
INSERT INTO `ka_bl` VALUES ('1644', '不中', '十一不中', '44', '5.83', '6.33', '0', '0', '0', '2010-07-27 10:04:01', '6.33');
INSERT INTO `ka_bl` VALUES ('1645', '不中', '十一不中', '45', '5.83', '6.33', '0', '0', '0', '2010-07-27 10:04:06', '6.33');
INSERT INTO `ka_bl` VALUES ('1646', '不中', '十一不中', '46', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:04:12', '6.33');
INSERT INTO `ka_bl` VALUES ('1647', '不中', '十一不中', '47', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:04:18', '6.33');
INSERT INTO `ka_bl` VALUES ('1648', '不中', '十一不中', '48', '6.33', '6.33', '0', '0', '0', '2010-07-27 10:04:23', '6.33');
INSERT INTO `ka_bl` VALUES ('1649', '不中', '十一不中', '49', '6.33', '6.33', '0', '0', '0', '2010-11-02 17:41:37', '6.33');
INSERT INTO `ka_bl` VALUES ('1651', '不中', '十二不中', '1', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:47', '7.56');
INSERT INTO `ka_bl` VALUES ('1652', '不中', '十二不中', '2', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:48', '7.56');
INSERT INTO `ka_bl` VALUES ('1653', '不中', '十二不中', '3', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:48', '7.56');
INSERT INTO `ka_bl` VALUES ('1654', '不中', '十二不中', '4', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:49', '7.56');
INSERT INTO `ka_bl` VALUES ('1655', '不中', '十二不中', '5', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:50', '7.56');
INSERT INTO `ka_bl` VALUES ('1656', '不中', '十二不中', '6', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:51', '7.56');
INSERT INTO `ka_bl` VALUES ('1657', '不中', '十二不中', '7', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:52', '7.56');
INSERT INTO `ka_bl` VALUES ('1658', '不中', '十二不中', '8', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:31', '7.56');
INSERT INTO `ka_bl` VALUES ('1659', '不中', '十二不中', '9', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:54', '7.56');
INSERT INTO `ka_bl` VALUES ('1660', '不中', '十二不中', '10', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:54', '7.56');
INSERT INTO `ka_bl` VALUES ('1661', '不中', '十二不中', '11', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:56', '7.56');
INSERT INTO `ka_bl` VALUES ('1662', '不中', '十二不中', '12', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:56', '7.56');
INSERT INTO `ka_bl` VALUES ('1663', '不中', '十二不中', '13', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:57', '7.56');
INSERT INTO `ka_bl` VALUES ('1664', '不中', '十二不中', '14', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:57', '7.56');
INSERT INTO `ka_bl` VALUES ('1665', '不中', '十二不中', '15', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:58', '7.56');
INSERT INTO `ka_bl` VALUES ('1666', '不中', '十二不中', '16', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:59', '7.56');
INSERT INTO `ka_bl` VALUES ('1667', '不中', '十二不中', '17', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:29:59', '7.56');
INSERT INTO `ka_bl` VALUES ('1668', '不中', '十二不中', '18', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:00', '7.56');
INSERT INTO `ka_bl` VALUES ('1669', '不中', '十二不中', '19', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:01', '7.56');
INSERT INTO `ka_bl` VALUES ('1670', '不中', '十二不中', '20', '7.06', '7.56', '0', '0', '0', '2010-11-02 17:30:02', '7.56');
INSERT INTO `ka_bl` VALUES ('1671', '不中', '十二不中', '21', '7.06', '7.56', '0', '0', '0', '2010-11-02 17:30:03', '7.56');
INSERT INTO `ka_bl` VALUES ('1672', '不中', '十二不中', '22', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:03', '7.56');
INSERT INTO `ka_bl` VALUES ('1673', '不中', '十二不中', '23', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:04', '7.56');
INSERT INTO `ka_bl` VALUES ('1674', '不中', '十二不中', '24', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:05', '7.56');
INSERT INTO `ka_bl` VALUES ('1675', '不中', '十二不中', '25', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:06', '7.56');
INSERT INTO `ka_bl` VALUES ('1676', '不中', '十二不中', '26', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:06', '7.56');
INSERT INTO `ka_bl` VALUES ('1677', '不中', '十二不中', '27', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:07', '7.56');
INSERT INTO `ka_bl` VALUES ('1678', '不中', '十二不中', '28', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:08', '7.56');
INSERT INTO `ka_bl` VALUES ('1679', '不中', '十二不中', '29', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:08', '7.56');
INSERT INTO `ka_bl` VALUES ('1680', '不中', '十二不中', '30', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:09', '7.56');
INSERT INTO `ka_bl` VALUES ('1681', '不中', '十二不中', '31', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:10', '7.56');
INSERT INTO `ka_bl` VALUES ('1682', '不中', '十二不中', '32', '7.06', '7.56', '0', '0', '0', '2010-11-02 17:30:10', '7.56');
INSERT INTO `ka_bl` VALUES ('1683', '不中', '十二不中', '33', '7.06', '7.56', '0', '0', '0', '2010-11-02 17:30:11', '7.56');
INSERT INTO `ka_bl` VALUES ('1684', '不中', '十二不中', '34', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:12', '7.56');
INSERT INTO `ka_bl` VALUES ('1685', '不中', '十二不中', '35', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:12', '7.56');
INSERT INTO `ka_bl` VALUES ('1686', '不中', '十二不中', '36', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:13', '7.56');
INSERT INTO `ka_bl` VALUES ('1687', '不中', '十二不中', '37', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:14', '7.56');
INSERT INTO `ka_bl` VALUES ('1688', '不中', '十二不中', '38', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:15', '7.56');
INSERT INTO `ka_bl` VALUES ('1689', '不中', '十二不中', '39', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:16', '7.56');
INSERT INTO `ka_bl` VALUES ('1690', '不中', '十二不中', '40', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:16', '7.56');
INSERT INTO `ka_bl` VALUES ('1691', '不中', '十二不中', '41', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:17', '7.56');
INSERT INTO `ka_bl` VALUES ('1692', '不中', '十二不中', '42', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:18', '7.56');
INSERT INTO `ka_bl` VALUES ('1693', '不中', '十二不中', '43', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:19', '7.56');
INSERT INTO `ka_bl` VALUES ('1694', '不中', '十二不中', '44', '7.06', '7.56', '0', '0', '0', '2010-11-02 17:30:20', '7.56');
INSERT INTO `ka_bl` VALUES ('1695', '不中', '十二不中', '45', '7.06', '7.56', '0', '0', '0', '2010-11-02 17:30:20', '7.56');
INSERT INTO `ka_bl` VALUES ('1696', '不中', '十二不中', '46', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:21', '7.56');
INSERT INTO `ka_bl` VALUES ('1697', '不中', '十二不中', '47', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:22', '7.56');
INSERT INTO `ka_bl` VALUES ('1698', '不中', '十二不中', '48', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:30:22', '7.56');
INSERT INTO `ka_bl` VALUES ('1699', '不中', '十二不中', '49', '7.56', '7.56', '0', '0', '0', '2010-11-02 17:41:43', '7.56');
INSERT INTO `ka_bl` VALUES ('978', '生肖', '八肖', '狗', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('973', '生肖', '八肖', '鼠', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('974', '生肖', '八肖', '虎', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('1730', '中一', '四中一', '30', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:56:40', '2.05');
INSERT INTO `ka_bl` VALUES ('977', '生肖', '八肖', '猴', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('976', '生肖', '八肖', '马', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('975', '生肖', '八肖', '龙', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('1801', '连码', '三全中', '1', '550', '550', '0', '0', '0', '2011-07-03 02:11:01', '550');
INSERT INTO `ka_bl` VALUES ('972', '生肖', '七肖', '猪', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('1727', '中一', '四中一', '27', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:56:16', '2.05');
INSERT INTO `ka_bl` VALUES ('983', '生肖', '八肖', '鸡', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('982', '生肖', '八肖', '羊', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('981', '生肖', '八肖', '蛇', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('980', '生肖', '八肖', '兔', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('979', '生肖', '八肖', '牛', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('989', '生肖', '九肖', '猴', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('988', '生肖', '九肖', '马', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('987', '生肖', '九肖', '龙', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('986', '生肖', '九肖', '虎', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('985', '生肖', '九肖', '鼠', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('984', '生肖', '八肖', '猪', '1.43', '1.43', '0', '3000', '1', '2016-07-13 15:53:33', '1.43');
INSERT INTO `ka_bl` VALUES ('971', '生肖', '七肖', '鸡', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('969', '生肖', '七肖', '蛇', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('970', '生肖', '七肖', '羊', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('968', '生肖', '七肖', '兔', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('967', '生肖', '七肖', '牛', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('966', '生肖', '七肖', '狗', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('1729', '中一', '四中一', '29', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:56:33', '2.05');
INSERT INTO `ka_bl` VALUES ('961', '生肖', '七肖', '鼠', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('962', '生肖', '七肖', '虎', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('963', '生肖', '七肖', '龙', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('964', '生肖', '七肖', '马', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('965', '生肖', '七肖', '猴', '1.5', '1.5', '0', '3000', '1', '2016-07-13 15:53:33', '1.5');
INSERT INTO `ka_bl` VALUES ('1726', '中一', '四中一', '26', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:40:41', '2.05');
INSERT INTO `ka_bl` VALUES ('1725', '中一', '四中一', '25', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:37:39', '2.05');
INSERT INTO `ka_bl` VALUES ('1724', '中一', '四中一', '24', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:37:17', '2.05');
INSERT INTO `ka_bl` VALUES ('994', '生肖', '九肖', '羊', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('995', '生肖', '九肖', '鸡', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('996', '生肖', '九肖', '猪', '1.27', '1.27', '0', '3000', '1', '2016-07-13 15:53:34', '1.27');
INSERT INTO `ka_bl` VALUES ('997', '生肖', '十肖', '鼠', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('998', '生肖', '十肖', '虎', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('999', '生肖', '十肖', '龙', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1000', '生肖', '十肖', '马', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1001', '生肖', '十肖', '猴', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1002', '生肖', '十肖', '狗', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1003', '生肖', '十肖', '牛', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1004', '生肖', '十肖', '兔', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1005', '生肖', '十肖', '蛇', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1006', '生肖', '十肖', '羊', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1007', '生肖', '十肖', '鸡', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1008', '生肖', '十肖', '猪', '1.14', '1.14', '0', '3000', '1', '2016-07-13 15:53:34', '1.14');
INSERT INTO `ka_bl` VALUES ('1009', '生肖', '十一肖', '鼠', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1010', '生肖', '十一肖', '虎', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1011', '生肖', '十一肖', '龙', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1012', '生肖', '十一肖', '马', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1013', '生肖', '十一肖', '猴', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1014', '生肖', '十一肖', '狗', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1015', '生肖', '十一肖', '牛', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1016', '生肖', '十一肖', '兔', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1017', '生肖', '十一肖', '蛇', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1018', '生肖', '十一肖', '羊', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1019', '生肖', '十一肖', '鸡', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1020', '生肖', '十一肖', '猪', '1.05', '1.05', '0', '3000', '1', '2016-07-13 15:53:34', '1.05');
INSERT INTO `ka_bl` VALUES ('1728', '中一', '四中一', '28', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:35:08', '2.05');
INSERT INTO `ka_bl` VALUES ('1718', '中一', '四中一', '18', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:55:08', '2.05');
INSERT INTO `ka_bl` VALUES ('1719', '中一', '四中一', '19', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:55:17', '2.05');
INSERT INTO `ka_bl` VALUES ('1720', '中一', '四中一', '20', '1.5499999999999998', '2.05', '0', '0', '0', '2010-11-03 13:55:25', '2.05');
INSERT INTO `ka_bl` VALUES ('1721', '中一', '四中一', '21', '1.5499999999999998', '2.05', '0', '0', '0', '2010-11-03 13:55:31', '2.05');
INSERT INTO `ka_bl` VALUES ('1722', '中一', '四中一', '22', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:41:14', '2.05');
INSERT INTO `ka_bl` VALUES ('1723', '中一', '四中一', '23', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:55:48', '2.05');
INSERT INTO `ka_bl` VALUES ('1713', '中一', '四中一', '13', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:54:27', '2.05');
INSERT INTO `ka_bl` VALUES ('1712', '中一', '四中一', '12', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:54:16', '2.05');
INSERT INTO `ka_bl` VALUES ('1710', '中一', '四中一', '10', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:41:47', '2.05');
INSERT INTO `ka_bl` VALUES ('1714', '中一', '四中一', '14', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:40:39', '2.05');
INSERT INTO `ka_bl` VALUES ('1711', '中一', '四中一', '11', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:54:10', '2.05');
INSERT INTO `ka_bl` VALUES ('1701', '中一', '四中一', '1', '2.05', '2.05', '0', '0', '0', '2011-01-25 16:24:34', '2.05');
INSERT INTO `ka_bl` VALUES ('1702', '中一', '四中一', '2', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:41:46', '2.05');
INSERT INTO `ka_bl` VALUES ('1703', '中一', '四中一', '3', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:46:26', '2.05');
INSERT INTO `ka_bl` VALUES ('1704', '中一', '四中一', '4', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:35:01', '2.05');
INSERT INTO `ka_bl` VALUES ('1705', '中一', '四中一', '5', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:39:45', '2.05');
INSERT INTO `ka_bl` VALUES ('1706', '中一', '四中一', '6', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:46:49', '2.05');
INSERT INTO `ka_bl` VALUES ('1707', '中一', '四中一', '7', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:46:58', '2.05');
INSERT INTO `ka_bl` VALUES ('1708', '中一', '四中一', '8', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:47:07', '2.05');
INSERT INTO `ka_bl` VALUES ('1709', '中一', '四中一', '9', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:47:14', '2.05');
INSERT INTO `ka_bl` VALUES ('1717', '中一', '四中一', '17', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:39:34', '2.05');
INSERT INTO `ka_bl` VALUES ('1716', '中一', '四中一', '16', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:35:06', '2.05');
INSERT INTO `ka_bl` VALUES ('1715', '中一', '四中一', '15', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:39:49', '2.05');
INSERT INTO `ka_bl` VALUES ('1731', '中一', '四中一', '31', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:37:50', '2.05');
INSERT INTO `ka_bl` VALUES ('1732', '中一', '四中一', '32', '1.5499999999999998', '2.05', '0', '0', '0', '2010-11-03 13:56:54', '2.05');
INSERT INTO `ka_bl` VALUES ('1733', '中一', '四中一', '33', '1.5499999999999998', '2.05', '0', '0', '0', '2010-11-03 13:57:01', '2.05');
INSERT INTO `ka_bl` VALUES ('1734', '中一', '四中一', '34', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:41:17', '2.05');
INSERT INTO `ka_bl` VALUES ('1735', '中一', '四中一', '35', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:57:22', '2.05');
INSERT INTO `ka_bl` VALUES ('1736', '中一', '四中一', '36', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:37:52', '2.05');
INSERT INTO `ka_bl` VALUES ('1737', '中一', '四中一', '37', '2.05', '2.05', '0', '0', '0', '2010-11-03 13:59:45', '2.05');
INSERT INTO `ka_bl` VALUES ('1738', '中一', '四中一', '38', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:40:44', '2.05');
INSERT INTO `ka_bl` VALUES ('1739', '中一', '四中一', '39', '2.05', '2.05', '0', '0', '0', '2010-11-03 14:00:00', '2.05');
INSERT INTO `ka_bl` VALUES ('1740', '中一', '四中一', '40', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:35:18', '2.05');
INSERT INTO `ka_bl` VALUES ('1741', '中一', '四中一', '41', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:38:09', '2.05');
INSERT INTO `ka_bl` VALUES ('1742', '中一', '四中一', '42', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:38:21', '2.05');
INSERT INTO `ka_bl` VALUES ('1743', '中一', '四中一', '43', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:38:39', '2.05');
INSERT INTO `ka_bl` VALUES ('1744', '中一', '四中一', '44', '1.5499999999999998', '2.05', '0', '0', '0', '2010-11-03 22:38:57', '2.05');
INSERT INTO `ka_bl` VALUES ('1745', '中一', '四中一', '45', '1.5499999999999998', '2.05', '0', '0', '0', '2010-11-03 22:37:08', '2.05');
INSERT INTO `ka_bl` VALUES ('1746', '中一', '四中一', '46', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:41:21', '2.05');
INSERT INTO `ka_bl` VALUES ('1747', '中一', '四中一', '47', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:38:55', '2.05');
INSERT INTO `ka_bl` VALUES ('1748', '中一', '四中一', '48', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:36:36', '2.05');
INSERT INTO `ka_bl` VALUES ('1749', '中一', '四中一', '49', '2.05', '2.05', '0', '0', '0', '2010-11-03 22:37:30', '2.05');
INSERT INTO `ka_bl` VALUES ('1802', '连码', '三全中', '2', '550', '550', '0', '0', '0', '2010-11-18 09:01:51', '550');
INSERT INTO `ka_bl` VALUES ('1803', '连码', '三全中', '3', '550', '550', '0', '0', '0', '2010-11-18 09:01:58', '550');
INSERT INTO `ka_bl` VALUES ('1804', '连码', '三全中', '4', '550', '550', '0', '0', '0', '2010-12-01 00:52:43', '550');
INSERT INTO `ka_bl` VALUES ('1805', '连码', '三全中', '5', '550', '550', '0', '0', '0', '2010-11-18 09:02:43', '550');
INSERT INTO `ka_bl` VALUES ('1806', '连码', '三全中', '6', '550', '550', '0', '0', '0', '2010-11-18 09:02:52', '550');
INSERT INTO `ka_bl` VALUES ('1807', '连码', '三全中', '7', '550', '550', '0', '0', '0', '2010-11-18 09:03:02', '550');
INSERT INTO `ka_bl` VALUES ('1808', '连码', '三全中', '8', '550', '550', '0', '0', '0', '2010-11-18 09:03:10', '550');
INSERT INTO `ka_bl` VALUES ('1809', '连码', '三全中', '9', '550', '550', '0', '0', '0', '2010-11-18 09:03:18', '550');
INSERT INTO `ka_bl` VALUES ('1810', '连码', '三全中', '10', '550', '550', '0', '0', '0', '2010-11-18 09:03:36', '550');
INSERT INTO `ka_bl` VALUES ('1811', '连码', '三全中', '11', '550', '550', '0', '0', '0', '2011-06-16 14:54:12', '550');
INSERT INTO `ka_bl` VALUES ('1812', '连码', '三全中', '12', '550', '550', '0', '0', '0', '2010-11-18 09:03:52', '550');
INSERT INTO `ka_bl` VALUES ('1813', '连码', '三全中', '13', '550', '550', '0', '0', '0', '2010-12-01 10:59:22', '550');
INSERT INTO `ka_bl` VALUES ('1814', '连码', '三全中', '14', '550', '550', '0', '0', '0', '2010-11-18 09:04:08', '550');
INSERT INTO `ka_bl` VALUES ('1815', '连码', '三全中', '15', '550', '550', '0', '0', '0', '2010-11-18 09:04:17', '550');
INSERT INTO `ka_bl` VALUES ('1816', '连码', '三全中', '16', '550', '550', '0', '0', '0', '2010-11-18 09:04:25', '550');
INSERT INTO `ka_bl` VALUES ('1817', '连码', '三全中', '17', '550', '550', '0', '0', '0', '2010-11-18 09:04:33', '550');
INSERT INTO `ka_bl` VALUES ('1818', '连码', '三全中', '18', '550', '550', '0', '0', '0', '2010-11-18 09:04:40', '550');
INSERT INTO `ka_bl` VALUES ('1819', '连码', '三全中', '19', '550', '550', '0', '0', '0', '2010-11-18 09:04:49', '550');
INSERT INTO `ka_bl` VALUES ('1820', '连码', '三全中', '20', '549.5', '550', '0', '0', '0', '2010-11-18 09:04:58', '550');
INSERT INTO `ka_bl` VALUES ('1821', '连码', '三全中', '21', '549.5', '550', '0', '0', '0', '2010-11-18 09:05:07', '550');
INSERT INTO `ka_bl` VALUES ('1822', '连码', '三全中', '22', '550', '550', '0', '0', '0', '2010-12-05 00:34:39', '550');
INSERT INTO `ka_bl` VALUES ('1823', '连码', '三全中', '23', '550', '550', '0', '0', '0', '2010-11-18 09:05:27', '550');
INSERT INTO `ka_bl` VALUES ('1824', '连码', '三全中', '24', '550', '550', '0', '0', '0', '2010-11-18 09:05:35', '550');
INSERT INTO `ka_bl` VALUES ('1825', '连码', '三全中', '25', '550', '550', '0', '0', '0', '2010-11-18 09:05:42', '550');
INSERT INTO `ka_bl` VALUES ('1826', '连码', '三全中', '26', '550', '550', '0', '0', '0', '2010-11-18 09:05:50', '550');
INSERT INTO `ka_bl` VALUES ('1827', '连码', '三全中', '27', '550', '550', '0', '0', '0', '2010-11-18 09:05:57', '550');
INSERT INTO `ka_bl` VALUES ('1828', '连码', '三全中', '28', '550', '550', '0', '0', '0', '2010-11-18 09:06:06', '550');
INSERT INTO `ka_bl` VALUES ('1829', '连码', '三全中', '29', '550', '550', '0', '0', '0', '2010-11-18 09:06:13', '550');
INSERT INTO `ka_bl` VALUES ('1830', '连码', '三全中', '30', '550', '550', '0', '0', '0', '2010-11-18 09:06:21', '550');
INSERT INTO `ka_bl` VALUES ('1831', '连码', '三全中', '31', '550', '550', '0', '0', '0', '2010-11-18 09:06:28', '550');
INSERT INTO `ka_bl` VALUES ('1832', '连码', '三全中', '32', '549.5', '550', '0', '0', '0', '2010-11-18 09:06:36', '550');
INSERT INTO `ka_bl` VALUES ('1833', '连码', '三全中', '33', '549.5', '550', '0', '0', '0', '2010-11-18 09:06:44', '550');
INSERT INTO `ka_bl` VALUES ('1834', '连码', '三全中', '34', '550', '550', '0', '0', '0', '2010-11-18 09:06:54', '550');
INSERT INTO `ka_bl` VALUES ('1835', '连码', '三全中', '35', '550', '550', '0', '0', '0', '2010-11-18 09:07:04', '550');
INSERT INTO `ka_bl` VALUES ('1836', '连码', '三全中', '36', '550', '550', '0', '0', '0', '2010-11-18 09:07:15', '550');
INSERT INTO `ka_bl` VALUES ('1837', '连码', '三全中', '37', '550', '550', '0', '0', '0', '2010-11-18 09:07:22', '550');
INSERT INTO `ka_bl` VALUES ('1838', '连码', '三全中', '38', '550', '550', '0', '0', '0', '2010-11-18 09:07:29', '550');
INSERT INTO `ka_bl` VALUES ('1839', '连码', '三全中', '39', '550', '550', '0', '0', '0', '2010-11-18 09:07:37', '550');
INSERT INTO `ka_bl` VALUES ('1840', '连码', '三全中', '40', '550', '550', '0', '0', '0', '2010-11-18 09:07:46', '550');
INSERT INTO `ka_bl` VALUES ('1841', '连码', '三全中', '41', '550', '550', '0', '0', '0', '2010-11-18 09:07:54', '550');
INSERT INTO `ka_bl` VALUES ('1842', '连码', '三全中', '42', '550', '550', '0', '0', '0', '2010-11-18 09:08:03', '550');
INSERT INTO `ka_bl` VALUES ('1843', '连码', '三全中', '43', '550', '550', '0', '0', '0', '2010-11-18 09:08:10', '550');
INSERT INTO `ka_bl` VALUES ('1844', '连码', '三全中', '44', '549.5', '550', '0', '0', '0', '2010-11-18 09:08:17', '550');
INSERT INTO `ka_bl` VALUES ('1845', '连码', '三全中', '45', '549.5', '550', '0', '0', '0', '2010-11-18 09:08:24', '550');
INSERT INTO `ka_bl` VALUES ('1846', '连码', '三全中', '46', '550', '550', '0', '0', '0', '2010-11-18 09:08:31', '550');
INSERT INTO `ka_bl` VALUES ('1847', '连码', '三全中', '47', '550', '550', '0', '0', '0', '2010-11-18 09:08:40', '550');
INSERT INTO `ka_bl` VALUES ('1848', '连码', '三全中', '48', '550', '550', '0', '0', '0', '2010-11-18 09:08:51', '550');
INSERT INTO `ka_bl` VALUES ('1849', '连码', '三全中', '49', '550', '550', '0', '0', '0', '2010-11-18 09:08:58', '550');
INSERT INTO `ka_bl` VALUES ('1851', '连码', '三中二', '1', '21', '21', '0', '0', '0', '2010-12-01 11:28:17', '21');
INSERT INTO `ka_bl` VALUES ('1852', '连码', '三中二', '2', '21', '21', '0', '0', '0', '2010-11-18 09:10:03', '21');
INSERT INTO `ka_bl` VALUES ('1853', '连码', '三中二', '3', '21', '21', '0', '0', '0', '2010-11-18 09:10:11', '21');
INSERT INTO `ka_bl` VALUES ('1854', '连码', '三中二', '4', '21', '21', '0', '0', '0', '2010-11-18 09:10:20', '21');
INSERT INTO `ka_bl` VALUES ('1855', '连码', '三中二', '5', '21', '21', '0', '0', '0', '2010-11-18 09:10:28', '21');
INSERT INTO `ka_bl` VALUES ('1856', '连码', '三中二', '6', '21', '21', '0', '0', '0', '2010-11-18 09:10:36', '21');
INSERT INTO `ka_bl` VALUES ('1857', '连码', '三中二', '7', '21', '21', '0', '0', '0', '2010-11-18 09:10:44', '21');
INSERT INTO `ka_bl` VALUES ('1858', '连码', '三中二', '8', '21', '21', '0', '0', '0', '2010-11-18 09:11:34', '21');
INSERT INTO `ka_bl` VALUES ('1859', '连码', '三中二', '9', '21', '21', '0', '0', '0', '2010-11-18 09:11:42', '21');
INSERT INTO `ka_bl` VALUES ('1860', '连码', '三中二', '10', '21', '21', '0', '0', '0', '2010-11-18 09:11:51', '21');
INSERT INTO `ka_bl` VALUES ('1861', '连码', '三中二', '11', '21', '21', '0', '0', '0', '2010-11-18 09:11:59', '21');
INSERT INTO `ka_bl` VALUES ('1862', '连码', '三中二', '12', '21', '21', '0', '0', '0', '2010-11-18 09:12:06', '21');
INSERT INTO `ka_bl` VALUES ('1863', '连码', '三中二', '13', '21', '21', '0', '0', '0', '2010-11-18 09:12:14', '21');
INSERT INTO `ka_bl` VALUES ('1864', '连码', '三中二', '14', '21', '21', '0', '0', '0', '2010-11-18 09:13:13', '21');
INSERT INTO `ka_bl` VALUES ('1865', '连码', '三中二', '15', '21', '21', '0', '0', '0', '2010-11-18 09:13:21', '21');
INSERT INTO `ka_bl` VALUES ('1866', '连码', '三中二', '16', '21', '21', '0', '0', '0', '2010-11-18 09:13:28', '21');
INSERT INTO `ka_bl` VALUES ('1867', '连码', '三中二', '17', '21', '21', '0', '0', '0', '2010-11-18 09:13:36', '21');
INSERT INTO `ka_bl` VALUES ('1868', '连码', '三中二', '18', '21', '21', '0', '0', '0', '2010-11-18 09:13:46', '21');
INSERT INTO `ka_bl` VALUES ('1869', '连码', '三中二', '19', '21', '21', '0', '0', '0', '2010-11-18 09:13:55', '21');
INSERT INTO `ka_bl` VALUES ('1870', '连码', '三中二', '20', '20.5', '21', '0', '0', '0', '2010-11-18 09:14:09', '21');
INSERT INTO `ka_bl` VALUES ('1871', '连码', '三中二', '21', '20.5', '21', '0', '0', '0', '2010-11-18 09:14:19', '21');
INSERT INTO `ka_bl` VALUES ('1872', '连码', '三中二', '22', '21', '21', '0', '0', '0', '2010-11-18 09:14:27', '21');
INSERT INTO `ka_bl` VALUES ('1873', '连码', '三中二', '23', '21', '21', '0', '0', '0', '2010-11-18 09:14:37', '21');
INSERT INTO `ka_bl` VALUES ('1874', '连码', '三中二', '24', '21', '21', '0', '0', '0', '2010-11-18 09:14:44', '21');
INSERT INTO `ka_bl` VALUES ('1875', '连码', '三中二', '25', '21', '21', '0', '0', '0', '2010-11-18 09:14:54', '21');
INSERT INTO `ka_bl` VALUES ('1876', '连码', '三中二', '26', '21', '21', '0', '0', '0', '2010-11-18 09:15:02', '21');
INSERT INTO `ka_bl` VALUES ('1877', '连码', '三中二', '27', '21', '21', '0', '0', '0', '2010-11-18 09:15:10', '21');
INSERT INTO `ka_bl` VALUES ('1878', '连码', '三中二', '28', '21', '21', '0', '0', '0', '2010-11-18 09:15:18', '21');
INSERT INTO `ka_bl` VALUES ('1879', '连码', '三中二', '29', '21', '21', '0', '0', '0', '2010-11-18 09:15:25', '21');
INSERT INTO `ka_bl` VALUES ('1880', '连码', '三中二', '30', '21', '21', '0', '0', '0', '2010-11-18 09:15:34', '21');
INSERT INTO `ka_bl` VALUES ('1881', '连码', '三中二', '31', '21', '21', '0', '0', '0', '2010-11-18 09:15:42', '21');
INSERT INTO `ka_bl` VALUES ('1882', '连码', '三中二', '32', '20.5', '21', '0', '0', '0', '2010-11-18 09:15:49', '21');
INSERT INTO `ka_bl` VALUES ('1883', '连码', '三中二', '33', '20.5', '21', '0', '0', '0', '2010-11-18 09:15:57', '21');
INSERT INTO `ka_bl` VALUES ('1884', '连码', '三中二', '34', '21', '21', '0', '0', '0', '2010-11-18 09:16:06', '21');
INSERT INTO `ka_bl` VALUES ('1885', '连码', '三中二', '35', '21', '21', '0', '0', '0', '2010-11-18 09:16:15', '21');
INSERT INTO `ka_bl` VALUES ('1886', '连码', '三中二', '36', '21', '21', '0', '0', '0', '2010-11-18 09:16:22', '21');
INSERT INTO `ka_bl` VALUES ('1887', '连码', '三中二', '37', '21', '21', '0', '0', '0', '2010-11-18 09:16:29', '21');
INSERT INTO `ka_bl` VALUES ('1888', '连码', '三中二', '38', '21', '21', '0', '0', '0', '2010-11-18 09:16:37', '21');
INSERT INTO `ka_bl` VALUES ('1889', '连码', '三中二', '39', '21', '21', '0', '0', '0', '2010-11-18 09:16:44', '21');
INSERT INTO `ka_bl` VALUES ('1890', '连码', '三中二', '40', '21', '21', '0', '0', '0', '2010-11-18 09:16:59', '21');
INSERT INTO `ka_bl` VALUES ('1891', '连码', '三中二', '41', '21', '21', '0', '0', '0', '2010-11-18 09:17:10', '21');
INSERT INTO `ka_bl` VALUES ('1892', '连码', '三中二', '42', '21', '21', '0', '0', '0', '2010-11-18 09:17:17', '21');
INSERT INTO `ka_bl` VALUES ('1893', '连码', '三中二', '43', '21', '21', '0', '0', '0', '2010-11-18 09:17:24', '21');
INSERT INTO `ka_bl` VALUES ('1894', '连码', '三中二', '44', '20.5', '21', '0', '0', '0', '2010-11-18 09:17:32', '21');
INSERT INTO `ka_bl` VALUES ('1895', '连码', '三中二', '45', '20.5', '21', '0', '0', '0', '2010-11-18 09:17:41', '21');
INSERT INTO `ka_bl` VALUES ('1896', '连码', '三中二', '46', '21', '21', '0', '0', '0', '2010-11-18 09:17:49', '21');
INSERT INTO `ka_bl` VALUES ('1897', '连码', '三中二', '47', '21', '21', '0', '0', '0', '2010-11-18 09:17:56', '21');
INSERT INTO `ka_bl` VALUES ('1898', '连码', '三中二', '48', '21', '21', '0', '0', '0', '2010-11-18 09:18:03', '21');
INSERT INTO `ka_bl` VALUES ('1899', '连码', '三中二', '49', '21', '21', '0', '0', '0', '2010-11-18 09:18:12', '21');
INSERT INTO `ka_bl` VALUES ('1901', '连码', '二全中', '1', '52', '52', '0', '0', '0', '2010-11-18 09:18:38', '52');
INSERT INTO `ka_bl` VALUES ('1902', '连码', '二全中', '2', '52', '52', '0', '0', '0', '2010-11-18 09:18:48', '52');
INSERT INTO `ka_bl` VALUES ('1903', '连码', '二全中', '3', '52', '52', '0', '0', '0', '2010-12-01 00:57:29', '52');
INSERT INTO `ka_bl` VALUES ('1904', '连码', '二全中', '4', '52', '52', '0', '0', '0', '2010-11-18 09:19:02', '52');
INSERT INTO `ka_bl` VALUES ('1905', '连码', '二全中', '5', '52', '52', '0', '0', '0', '2010-11-18 09:19:10', '52');
INSERT INTO `ka_bl` VALUES ('1906', '连码', '二全中', '6', '52', '52', '0', '0', '0', '2010-11-18 09:19:18', '52');
INSERT INTO `ka_bl` VALUES ('1907', '连码', '二全中', '7', '52', '52', '0', '0', '0', '2010-11-18 09:19:25', '52');
INSERT INTO `ka_bl` VALUES ('1908', '连码', '二全中', '8', '52', '52', '0', '0', '0', '2010-11-18 09:19:33', '52');
INSERT INTO `ka_bl` VALUES ('1909', '连码', '二全中', '9', '52', '52', '0', '0', '0', '2010-11-18 09:19:41', '52');
INSERT INTO `ka_bl` VALUES ('1910', '连码', '二全中', '10', '52', '52', '0', '0', '0', '2010-11-18 09:19:49', '52');
INSERT INTO `ka_bl` VALUES ('1911', '连码', '二全中', '11', '52', '52', '0', '0', '0', '2010-11-18 09:19:56', '52');
INSERT INTO `ka_bl` VALUES ('1912', '连码', '二全中', '12', '52', '52', '0', '0', '0', '2010-11-18 09:20:04', '52');
INSERT INTO `ka_bl` VALUES ('1913', '连码', '二全中', '13', '52', '52', '0', '0', '0', '2010-11-18 09:20:13', '52');
INSERT INTO `ka_bl` VALUES ('1914', '连码', '二全中', '14', '52', '52', '0', '0', '0', '2010-11-18 09:20:20', '52');
INSERT INTO `ka_bl` VALUES ('1915', '连码', '二全中', '15', '52', '52', '0', '0', '0', '2010-11-18 09:20:27', '52');
INSERT INTO `ka_bl` VALUES ('1916', '连码', '二全中', '16', '52', '52', '0', '0', '0', '2010-11-18 09:20:37', '52');
INSERT INTO `ka_bl` VALUES ('1917', '连码', '二全中', '17', '52', '52', '0', '0', '0', '2010-11-18 09:20:47', '52');
INSERT INTO `ka_bl` VALUES ('1918', '连码', '二全中', '18', '52', '52', '0', '0', '0', '2010-11-18 09:20:57', '52');
INSERT INTO `ka_bl` VALUES ('1919', '连码', '二全中', '19', '52', '52', '0', '0', '0', '2010-11-18 09:21:14', '52');
INSERT INTO `ka_bl` VALUES ('1920', '连码', '二全中', '20', '51.5', '52', '0', '0', '0', '2010-11-18 09:21:29', '52');
INSERT INTO `ka_bl` VALUES ('1921', '连码', '二全中', '21', '51.5', '52', '0', '0', '0', '2010-11-18 09:21:37', '52');
INSERT INTO `ka_bl` VALUES ('1922', '连码', '二全中', '22', '52', '52', '0', '0', '0', '2010-12-05 00:34:53', '52');
INSERT INTO `ka_bl` VALUES ('1923', '连码', '二全中', '23', '52', '52', '0', '0', '0', '2010-11-18 09:21:54', '52');
INSERT INTO `ka_bl` VALUES ('1924', '连码', '二全中', '24', '52', '52', '0', '0', '0', '2010-11-18 09:22:02', '52');
INSERT INTO `ka_bl` VALUES ('1925', '连码', '二全中', '25', '52', '52', '0', '0', '0', '2010-11-18 09:22:10', '52');
INSERT INTO `ka_bl` VALUES ('1926', '连码', '二全中', '26', '52', '52', '0', '0', '0', '2010-11-18 09:22:16', '52');
INSERT INTO `ka_bl` VALUES ('1927', '连码', '二全中', '27', '52', '52', '0', '0', '0', '2010-11-18 09:22:24', '52');
INSERT INTO `ka_bl` VALUES ('1928', '连码', '二全中', '28', '52', '52', '0', '0', '0', '2010-11-18 09:22:31', '52');
INSERT INTO `ka_bl` VALUES ('1929', '连码', '二全中', '29', '52', '52', '0', '0', '0', '2010-11-18 09:22:39', '52');
INSERT INTO `ka_bl` VALUES ('1930', '连码', '二全中', '30', '52', '52', '0', '0', '0', '2010-11-18 09:22:47', '52');
INSERT INTO `ka_bl` VALUES ('1931', '连码', '二全中', '31', '52', '52', '0', '0', '0', '2010-11-18 09:22:54', '52');
INSERT INTO `ka_bl` VALUES ('1932', '连码', '二全中', '32', '51.5', '52', '0', '0', '0', '2010-11-18 09:23:01', '52');
INSERT INTO `ka_bl` VALUES ('1933', '连码', '二全中', '33', '51.5', '52', '0', '0', '0', '2010-11-18 09:23:09', '52');
INSERT INTO `ka_bl` VALUES ('1934', '连码', '二全中', '34', '52', '52', '0', '0', '0', '2010-11-18 09:23:17', '52');
INSERT INTO `ka_bl` VALUES ('1935', '连码', '二全中', '35', '52', '52', '0', '0', '0', '2010-11-18 09:23:24', '52');
INSERT INTO `ka_bl` VALUES ('1936', '连码', '二全中', '36', '52', '52', '0', '0', '0', '2010-11-18 09:23:31', '52');
INSERT INTO `ka_bl` VALUES ('1937', '连码', '二全中', '37', '52', '52', '0', '0', '0', '2010-11-18 09:23:38', '52');
INSERT INTO `ka_bl` VALUES ('1938', '连码', '二全中', '38', '52', '52', '0', '0', '0', '2010-11-18 09:23:46', '52');
INSERT INTO `ka_bl` VALUES ('1939', '连码', '二全中', '39', '52', '52', '0', '0', '0', '2010-11-18 09:23:53', '52');
INSERT INTO `ka_bl` VALUES ('1940', '连码', '二全中', '40', '52', '52', '0', '0', '0', '2010-11-18 09:24:01', '52');
INSERT INTO `ka_bl` VALUES ('1941', '连码', '二全中', '41', '52', '52', '0', '0', '0', '2010-11-18 09:24:08', '52');
INSERT INTO `ka_bl` VALUES ('1942', '连码', '二全中', '42', '52', '52', '0', '0', '0', '2010-11-18 09:24:15', '52');
INSERT INTO `ka_bl` VALUES ('1943', '连码', '二全中', '43', '52', '52', '0', '0', '0', '2010-11-18 09:24:22', '52');
INSERT INTO `ka_bl` VALUES ('1944', '连码', '二全中', '44', '51.5', '52', '0', '0', '0', '2010-11-18 09:24:33', '52');
INSERT INTO `ka_bl` VALUES ('1945', '连码', '二全中', '45', '51.5', '52', '0', '0', '0', '2010-11-18 09:24:41', '52');
INSERT INTO `ka_bl` VALUES ('1946', '连码', '二全中', '46', '52', '52', '0', '0', '0', '2010-11-18 09:24:49', '52');
INSERT INTO `ka_bl` VALUES ('1947', '连码', '二全中', '47', '52', '52', '0', '0', '0', '2010-11-18 09:24:57', '52');
INSERT INTO `ka_bl` VALUES ('1948', '连码', '二全中', '48', '52', '52', '0', '0', '0', '2010-11-18 09:25:03', '52');
INSERT INTO `ka_bl` VALUES ('1949', '连码', '二全中', '49', '52', '52', '0', '0', '0', '2010-11-18 09:25:13', '52');
INSERT INTO `ka_bl` VALUES ('1951', '连码', '二中特', '1', '30', '30', '0', '0', '0', '2010-11-18 09:26:01', '30');
INSERT INTO `ka_bl` VALUES ('1952', '连码', '二中特', '2', '30', '30', '0', '0', '0', '2010-11-18 09:26:12', '30');
INSERT INTO `ka_bl` VALUES ('1953', '连码', '二中特', '3', '30', '30', '0', '0', '0', '2010-11-18 09:26:21', '30');
INSERT INTO `ka_bl` VALUES ('1954', '连码', '二中特', '4', '30', '30', '0', '0', '0', '2010-11-18 09:26:30', '30');
INSERT INTO `ka_bl` VALUES ('1955', '连码', '二中特', '5', '30', '30', '0', '0', '0', '2010-11-18 09:26:38', '30');
INSERT INTO `ka_bl` VALUES ('1956', '连码', '二中特', '6', '30', '30', '0', '0', '0', '2010-11-18 09:26:47', '30');
INSERT INTO `ka_bl` VALUES ('1957', '连码', '二中特', '7', '30', '30', '0', '0', '0', '2010-11-18 09:26:54', '30');
INSERT INTO `ka_bl` VALUES ('1958', '连码', '二中特', '8', '30', '30', '0', '0', '0', '2010-11-18 09:27:01', '30');
INSERT INTO `ka_bl` VALUES ('1959', '连码', '二中特', '9', '30', '30', '0', '0', '0', '2010-11-18 09:27:08', '30');
INSERT INTO `ka_bl` VALUES ('1960', '连码', '二中特', '10', '30', '30', '0', '0', '0', '2010-11-18 09:27:18', '30');
INSERT INTO `ka_bl` VALUES ('1961', '连码', '二中特', '11', '30', '30', '0', '0', '0', '2010-11-18 09:27:24', '30');
INSERT INTO `ka_bl` VALUES ('1962', '连码', '二中特', '12', '30', '30', '0', '0', '0', '2010-11-18 09:27:35', '30');
INSERT INTO `ka_bl` VALUES ('1963', '连码', '二中特', '13', '30', '30', '0', '0', '0', '2010-11-18 09:27:42', '30');
INSERT INTO `ka_bl` VALUES ('1964', '连码', '二中特', '14', '30', '30', '0', '0', '0', '2010-11-18 09:27:49', '30');
INSERT INTO `ka_bl` VALUES ('1965', '连码', '二中特', '15', '30', '30', '0', '0', '0', '2010-11-18 09:27:57', '30');
INSERT INTO `ka_bl` VALUES ('1966', '连码', '二中特', '16', '30', '30', '0', '0', '0', '2010-11-18 09:28:06', '30');
INSERT INTO `ka_bl` VALUES ('1967', '连码', '二中特', '17', '30', '30', '0', '0', '0', '2010-11-18 09:28:14', '30');
INSERT INTO `ka_bl` VALUES ('1968', '连码', '二中特', '18', '30', '30', '0', '0', '0', '2010-11-18 09:28:22', '30');
INSERT INTO `ka_bl` VALUES ('1969', '连码', '二中特', '19', '30', '30', '0', '0', '0', '2010-11-18 09:28:30', '30');
INSERT INTO `ka_bl` VALUES ('1970', '连码', '二中特', '20', '29.5', '30', '0', '0', '0', '2010-11-18 09:28:49', '30');
INSERT INTO `ka_bl` VALUES ('1972', '连码', '二中特', '22', '30', '30', '0', '0', '0', '2010-11-18 09:29:05', '30');
INSERT INTO `ka_bl` VALUES ('1973', '连码', '二中特', '23', '30', '30', '0', '0', '0', '2010-11-18 09:29:12', '30');
INSERT INTO `ka_bl` VALUES ('1974', '连码', '二中特', '24', '30', '30', '0', '0', '0', '2010-11-18 09:29:21', '30');
INSERT INTO `ka_bl` VALUES ('1975', '连码', '二中特', '25', '30', '30', '0', '0', '0', '2010-11-18 09:29:29', '30');
INSERT INTO `ka_bl` VALUES ('1976', '连码', '二中特', '26', '30', '30', '0', '0', '0', '2010-11-18 09:29:37', '30');
INSERT INTO `ka_bl` VALUES ('1977', '连码', '二中特', '27', '30', '30', '0', '0', '0', '2010-11-18 09:29:48', '30');
INSERT INTO `ka_bl` VALUES ('1978', '连码', '二中特', '28', '30', '30', '0', '0', '0', '2010-11-18 09:30:00', '30');
INSERT INTO `ka_bl` VALUES ('1979', '连码', '二中特', '29', '30', '30', '0', '0', '0', '2010-11-18 09:30:09', '30');
INSERT INTO `ka_bl` VALUES ('1980', '连码', '二中特', '30', '30', '30', '0', '0', '0', '2010-11-18 09:32:05', '30');
INSERT INTO `ka_bl` VALUES ('1981', '连码', '二中特', '31', '30', '30', '0', '0', '0', '2010-11-18 09:32:15', '30');
INSERT INTO `ka_bl` VALUES ('1982', '连码', '二中特', '32', '29.5', '30', '0', '0', '0', '2010-11-18 09:32:24', '30');
INSERT INTO `ka_bl` VALUES ('1983', '连码', '二中特', '33', '29.5', '30', '0', '0', '0', '2010-11-18 09:32:31', '30');
INSERT INTO `ka_bl` VALUES ('1984', '连码', '二中特', '34', '30', '30', '0', '0', '0', '2010-11-18 09:40:48', '30');
INSERT INTO `ka_bl` VALUES ('1985', '连码', '二中特', '35', '30', '30', '0', '0', '0', '2010-11-18 09:40:56', '30');
INSERT INTO `ka_bl` VALUES ('1986', '连码', '二中特', '36', '30', '30', '0', '0', '0', '2010-11-18 09:41:05', '30');
INSERT INTO `ka_bl` VALUES ('1987', '连码', '二中特', '37', '30', '30', '0', '0', '0', '2010-11-18 09:41:14', '30');
INSERT INTO `ka_bl` VALUES ('1988', '连码', '二中特', '38', '30', '30', '0', '0', '0', '2010-11-18 09:41:22', '30');
INSERT INTO `ka_bl` VALUES ('1989', '连码', '二中特', '39', '30', '30', '0', '0', '0', '2010-11-18 09:41:36', '30');
INSERT INTO `ka_bl` VALUES ('1990', '连码', '二中特', '40', '30', '30', '0', '0', '0', '2010-11-18 09:41:44', '30');
INSERT INTO `ka_bl` VALUES ('1991', '连码', '二中特', '41', '30', '30', '0', '0', '0', '2010-11-18 09:41:51', '30');
INSERT INTO `ka_bl` VALUES ('1992', '连码', '二中特', '42', '30', '30', '0', '0', '0', '2010-11-18 09:42:24', '30');
INSERT INTO `ka_bl` VALUES ('1993', '连码', '二中特', '43', '30', '30', '0', '0', '0', '2010-11-18 09:42:34', '30');
INSERT INTO `ka_bl` VALUES ('1994', '连码', '二中特', '44', '29.5', '30', '0', '0', '0', '2010-11-18 09:42:41', '30');
INSERT INTO `ka_bl` VALUES ('1995', '连码', '二中特', '45', '29.5', '30', '0', '0', '0', '2010-11-18 09:43:00', '30');
INSERT INTO `ka_bl` VALUES ('1996', '连码', '二中特', '46', '30', '30', '0', '0', '0', '2010-11-18 09:43:07', '30');
INSERT INTO `ka_bl` VALUES ('1997', '连码', '二中特', '47', '30', '30', '0', '0', '0', '2010-11-18 09:43:14', '30');
INSERT INTO `ka_bl` VALUES ('1998', '连码', '二中特', '48', '30', '30', '0', '0', '0', '2010-11-18 09:43:20', '30');
INSERT INTO `ka_bl` VALUES ('1999', '连码', '二中特', '49', '30', '30', '0', '0', '0', '2010-11-18 09:43:27', '30');
INSERT INTO `ka_bl` VALUES ('2001', '连码', '特串', '1', '125', '125', '0', '0', '0', '2010-12-01 10:55:02', '125');
INSERT INTO `ka_bl` VALUES ('2002', '连码', '特串', '2', '125', '125', '0', '0', '0', '2010-11-18 09:44:31', '125');
INSERT INTO `ka_bl` VALUES ('2003', '连码', '特串', '3', '125', '125', '0', '0', '0', '2010-11-18 10:28:46', '125');
INSERT INTO `ka_bl` VALUES ('2004', '连码', '特串', '4', '125', '125', '0', '0', '0', '2010-11-18 10:28:56', '125');
INSERT INTO `ka_bl` VALUES ('2005', '连码', '特串', '5', '125', '125', '0', '0', '0', '2010-11-18 10:29:04', '125');
INSERT INTO `ka_bl` VALUES ('2006', '连码', '特串', '6', '125', '125', '0', '0', '0', '2010-11-18 10:29:12', '125');
INSERT INTO `ka_bl` VALUES ('2007', '连码', '特串', '7', '125', '125', '0', '0', '0', '2010-11-18 10:29:19', '125');
INSERT INTO `ka_bl` VALUES ('2008', '连码', '特串', '8', '125', '125', '0', '0', '0', '2010-11-18 10:29:27', '125');
INSERT INTO `ka_bl` VALUES ('2009', '连码', '特串', '9', '125', '125', '0', '0', '0', '2010-11-18 10:29:36', '125');
INSERT INTO `ka_bl` VALUES ('2010', '连码', '特串', '10', '125', '125', '0', '0', '0', '2010-11-18 10:30:01', '125');
INSERT INTO `ka_bl` VALUES ('2011', '连码', '特串', '11', '125', '125', '0', '0', '0', '2010-11-18 10:30:08', '125');
INSERT INTO `ka_bl` VALUES ('2012', '连码', '特串', '12', '125', '125', '0', '0', '0', '2010-11-18 10:30:17', '125');
INSERT INTO `ka_bl` VALUES ('2013', '连码', '特串', '13', '125', '125', '0', '0', '0', '2010-11-18 10:30:27', '125');
INSERT INTO `ka_bl` VALUES ('2014', '连码', '特串', '14', '125', '125', '0', '0', '0', '2010-11-18 10:30:34', '125');
INSERT INTO `ka_bl` VALUES ('2015', '连码', '特串', '15', '125', '125', '0', '0', '0', '2010-11-18 10:30:43', '125');
INSERT INTO `ka_bl` VALUES ('2016', '连码', '特串', '16', '125', '125', '0', '0', '0', '2010-11-18 10:32:14', '125');
INSERT INTO `ka_bl` VALUES ('2017', '连码', '特串', '17', '125', '125', '0', '0', '0', '2010-11-18 10:32:20', '125');
INSERT INTO `ka_bl` VALUES ('2018', '连码', '特串', '18', '125', '125', '0', '0', '0', '2010-11-18 10:32:27', '125');
INSERT INTO `ka_bl` VALUES ('2019', '连码', '特串', '19', '125', '125', '0', '0', '0', '2010-11-18 10:32:35', '125');
INSERT INTO `ka_bl` VALUES ('2020', '连码', '特串', '20', '124.5', '125', '0', '0', '0', '2010-11-18 10:34:10', '125');
INSERT INTO `ka_bl` VALUES ('2021', '连码', '特串', '21', '124.5', '125', '0', '0', '0', '2010-11-18 10:34:19', '125');
INSERT INTO `ka_bl` VALUES ('2022', '连码', '特串', '22', '125', '125', '0', '0', '0', '2010-11-18 10:34:48', '125');
INSERT INTO `ka_bl` VALUES ('2023', '连码', '特串', '23', '125', '125', '0', '0', '0', '2010-11-18 10:34:55', '125');
INSERT INTO `ka_bl` VALUES ('2024', '连码', '特串', '24', '125', '125', '0', '0', '0', '2010-11-18 10:35:02', '125');
INSERT INTO `ka_bl` VALUES ('2025', '连码', '特串', '25', '125', '125', '0', '0', '0', '2010-11-18 10:35:10', '125');
INSERT INTO `ka_bl` VALUES ('2026', '连码', '特串', '26', '125', '125', '0', '0', '0', '2010-11-18 10:35:17', '125');
INSERT INTO `ka_bl` VALUES ('2027', '连码', '特串', '27', '125', '125', '0', '0', '0', '2010-11-18 10:37:16', '125');
INSERT INTO `ka_bl` VALUES ('2028', '连码', '特串', '28', '125', '125', '0', '0', '0', '2010-11-18 10:46:14', '125');
INSERT INTO `ka_bl` VALUES ('2029', '连码', '特串', '29', '125', '125', '0', '0', '0', '2010-11-18 10:46:21', '125');
INSERT INTO `ka_bl` VALUES ('2030', '连码', '特串', '30', '125', '125', '0', '0', '0', '2010-11-18 10:46:33', '125');
INSERT INTO `ka_bl` VALUES ('2031', '连码', '特串', '31', '125', '125', '0', '0', '0', '2010-11-18 10:46:43', '125');
INSERT INTO `ka_bl` VALUES ('2032', '连码', '特串', '32', '124.5', '125', '0', '0', '0', '2010-11-18 10:46:52', '125');
INSERT INTO `ka_bl` VALUES ('2033', '连码', '特串', '33', '124.5', '125', '0', '0', '0', '2010-11-18 10:46:58', '125');
INSERT INTO `ka_bl` VALUES ('2034', '连码', '特串', '34', '125', '125', '0', '0', '0', '2010-11-18 10:47:05', '125');
INSERT INTO `ka_bl` VALUES ('2035', '连码', '特串', '35', '125', '125', '0', '0', '0', '2010-11-18 10:47:12', '125');
INSERT INTO `ka_bl` VALUES ('2036', '连码', '特串', '36', '125', '125', '0', '0', '0', '2010-11-18 10:47:19', '125');
INSERT INTO `ka_bl` VALUES ('2037', '连码', '特串', '37', '125', '125', '0', '0', '0', '2010-11-18 10:47:26', '125');
INSERT INTO `ka_bl` VALUES ('2038', '连码', '特串', '38', '125', '125', '0', '0', '0', '2010-11-18 10:47:33', '125');
INSERT INTO `ka_bl` VALUES ('2039', '连码', '特串', '39', '125', '125', '0', '0', '0', '2010-11-18 10:47:41', '125');
INSERT INTO `ka_bl` VALUES ('2040', '连码', '特串', '40', '125', '125', '0', '0', '0', '2010-11-18 10:47:49', '125');
INSERT INTO `ka_bl` VALUES ('2041', '连码', '特串', '41', '125', '125', '0', '0', '0', '2010-11-18 10:47:56', '125');
INSERT INTO `ka_bl` VALUES ('2042', '连码', '特串', '42', '125', '125', '0', '0', '0', '2010-11-18 10:48:03', '125');
INSERT INTO `ka_bl` VALUES ('2043', '连码', '特串', '43', '125', '125', '0', '0', '0', '2010-11-18 10:48:10', '125');
INSERT INTO `ka_bl` VALUES ('2044', '连码', '特串', '44', '124.5', '125', '0', '0', '0', '2010-11-18 10:48:16', '125');
INSERT INTO `ka_bl` VALUES ('2045', '连码', '特串', '45', '124.5', '125', '0', '0', '0', '2010-11-18 10:48:24', '125');
INSERT INTO `ka_bl` VALUES ('2046', '连码', '特串', '46', '125', '125', '0', '0', '0', '2010-11-18 10:48:30', '125');
INSERT INTO `ka_bl` VALUES ('2047', '连码', '特串', '47', '125', '125', '0', '0', '0', '2010-11-18 10:48:37', '125');
INSERT INTO `ka_bl` VALUES ('2048', '连码', '特串', '48', '125', '125', '0', '0', '0', '2010-11-18 10:48:43', '125');
INSERT INTO `ka_bl` VALUES ('2049', '连码', '特串', '49', '125', '125', '0', '0', '0', '2010-11-18 10:48:50', '125');
INSERT INTO `ka_bl` VALUES ('1791', '中一', '五中一', '41', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:21:16', '1.8');
INSERT INTO `ka_bl` VALUES ('1789', '中一', '五中一', '39', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:21:01', '1.8');
INSERT INTO `ka_bl` VALUES ('1788', '中一', '五中一', '38', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:20:56', '1.8');
INSERT INTO `ka_bl` VALUES ('1787', '中一', '五中一', '37', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:20:49', '1.8');
INSERT INTO `ka_bl` VALUES ('1780', '中一', '五中一', '30', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:20:07', '1.8');
INSERT INTO `ka_bl` VALUES ('1778', '中一', '五中一', '28', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:19:31', '1.8');
INSERT INTO `ka_bl` VALUES ('1773', '中一', '五中一', '23', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:18:57', '1.8');
INSERT INTO `ka_bl` VALUES ('1777', '中一', '五中一', '27', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:19:24', '1.8');
INSERT INTO `ka_bl` VALUES ('1776', '中一', '五中一', '26', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:19:15', '1.8');
INSERT INTO `ka_bl` VALUES ('1775', '中一', '五中一', '25', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:19:09', '1.8');
INSERT INTO `ka_bl` VALUES ('1779', '中一', '五中一', '29', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:19:37', '1.8');
INSERT INTO `ka_bl` VALUES ('1770', '中一', '五中一', '20', '1.3', '1.8', '0', '0', '0', '2011-01-21 11:18:39', '1.8');
INSERT INTO `ka_bl` VALUES ('1769', '中一', '五中一', '19', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:18:29', '1.8');
INSERT INTO `ka_bl` VALUES ('1768', '中一', '五中一', '18', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:18:22', '1.8');
INSERT INTO `ka_bl` VALUES ('1751', '中一', '五中一', '1', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:15:55', '1.8');
INSERT INTO `ka_bl` VALUES ('1752', '中一', '五中一', '2', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:16:09', '1.8');
INSERT INTO `ka_bl` VALUES ('1753', '中一', '五中一', '3', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:16:16', '1.8');
INSERT INTO `ka_bl` VALUES ('1754', '中一', '五中一', '4', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:16:25', '1.8');
INSERT INTO `ka_bl` VALUES ('1755', '中一', '五中一', '5', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:16:32', '1.8');
INSERT INTO `ka_bl` VALUES ('1756', '中一', '五中一', '6', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:16:40', '1.8');
INSERT INTO `ka_bl` VALUES ('1767', '中一', '五中一', '17', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:18:15', '1.8');
INSERT INTO `ka_bl` VALUES ('1766', '中一', '五中一', '16', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:18:08', '1.8');
INSERT INTO `ka_bl` VALUES ('1765', '中一', '五中一', '15', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:18:02', '1.8');
INSERT INTO `ka_bl` VALUES ('1764', '中一', '五中一', '14', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:17:48', '1.8');
INSERT INTO `ka_bl` VALUES ('1763', '中一', '五中一', '13', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:17:42', '1.8');
INSERT INTO `ka_bl` VALUES ('1762', '中一', '五中一', '12', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:17:35', '1.8');
INSERT INTO `ka_bl` VALUES ('1761', '中一', '五中一', '11', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:17:15', '1.8');
INSERT INTO `ka_bl` VALUES ('1760', '中一', '五中一', '10', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:17:09', '1.8');
INSERT INTO `ka_bl` VALUES ('1783', '中一', '五中一', '33', '1.3', '1.8', '0', '0', '0', '2011-01-21 11:20:26', '1.8');
INSERT INTO `ka_bl` VALUES ('1782', '中一', '五中一', '32', '1.3', '1.8', '0', '0', '0', '2011-01-21 11:20:19', '1.8');
INSERT INTO `ka_bl` VALUES ('1781', '中一', '五中一', '31', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:20:13', '1.8');
INSERT INTO `ka_bl` VALUES ('1774', '中一', '五中一', '24', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:19:04', '1.8');
INSERT INTO `ka_bl` VALUES ('1772', '中一', '五中一', '22', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:18:51', '1.8');
INSERT INTO `ka_bl` VALUES ('1771', '中一', '五中一', '21', '1.3', '1.8', '0', '0', '0', '2011-01-21 11:18:45', '1.8');
INSERT INTO `ka_bl` VALUES ('1757', '中一', '五中一', '7', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:16:48', '1.8');
INSERT INTO `ka_bl` VALUES ('1759', '中一', '五中一', '9', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:17:02', '1.8');
INSERT INTO `ka_bl` VALUES ('1758', '中一', '五中一', '8', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:16:55', '1.8');
INSERT INTO `ka_bl` VALUES ('1785', '中一', '五中一', '35', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:20:37', '1.8');
INSERT INTO `ka_bl` VALUES ('1784', '中一', '五中一', '34', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:20:31', '1.8');
INSERT INTO `ka_bl` VALUES ('1797', '中一', '五中一', '47', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:21:57', '1.8');
INSERT INTO `ka_bl` VALUES ('1796', '中一', '五中一', '46', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:21:50', '1.8');
INSERT INTO `ka_bl` VALUES ('1795', '中一', '五中一', '45', '1.3', '1.8', '0', '0', '0', '2011-01-21 11:21:43', '1.8');
INSERT INTO `ka_bl` VALUES ('1794', '中一', '五中一', '44', '1.3', '1.8', '0', '0', '0', '2011-01-21 11:21:36', '1.8');
INSERT INTO `ka_bl` VALUES ('1793', '中一', '五中一', '43', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:21:30', '1.8');
INSERT INTO `ka_bl` VALUES ('1792', '中一', '五中一', '42', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:21:23', '1.8');
INSERT INTO `ka_bl` VALUES ('1798', '中一', '五中一', '48', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:22:04', '1.8');
INSERT INTO `ka_bl` VALUES ('1799', '中一', '五中一', '49', '1.8', '1.8', '0', '0', '0', '2011-01-21 11:22:11', '1.8');
INSERT INTO `ka_bl` VALUES ('2051', '中一', '六中一', '1', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:23:21', '1.58');
INSERT INTO `ka_bl` VALUES ('2052', '中一', '六中一', '2', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:23:29', '1.58');
INSERT INTO `ka_bl` VALUES ('2053', '中一', '六中一', '3', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:23:35', '1.58');
INSERT INTO `ka_bl` VALUES ('2054', '中一', '六中一', '4', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:23:41', '1.58');
INSERT INTO `ka_bl` VALUES ('2055', '中一', '六中一', '5', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:23:47', '1.58');
INSERT INTO `ka_bl` VALUES ('2056', '中一', '六中一', '6', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:23:53', '1.58');
INSERT INTO `ka_bl` VALUES ('2057', '中一', '六中一', '7', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:23:59', '1.58');
INSERT INTO `ka_bl` VALUES ('2058', '中一', '六中一', '8', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:05', '1.58');
INSERT INTO `ka_bl` VALUES ('2059', '中一', '六中一', '9', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:11', '1.58');
INSERT INTO `ka_bl` VALUES ('2060', '中一', '六中一', '10', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:18', '1.58');
INSERT INTO `ka_bl` VALUES ('2061', '中一', '六中一', '11', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:23', '1.58');
INSERT INTO `ka_bl` VALUES ('2062', '中一', '六中一', '12', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:30', '1.58');
INSERT INTO `ka_bl` VALUES ('2063', '中一', '六中一', '13', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:36', '1.58');
INSERT INTO `ka_bl` VALUES ('2064', '中一', '六中一', '14', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:42', '1.58');
INSERT INTO `ka_bl` VALUES ('2065', '中一', '六中一', '15', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:49', '1.58');
INSERT INTO `ka_bl` VALUES ('2066', '中一', '六中一', '16', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:24:56', '1.58');
INSERT INTO `ka_bl` VALUES ('2067', '中一', '六中一', '17', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:25:04', '1.58');
INSERT INTO `ka_bl` VALUES ('2068', '中一', '六中一', '18', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:25:10', '1.58');
INSERT INTO `ka_bl` VALUES ('2069', '中一', '六中一', '19', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:25:16', '1.58');
INSERT INTO `ka_bl` VALUES ('2070', '中一', '六中一', '20', '1.08', '1.58', '0', '0', '0', '2011-01-21 11:25:22', '1.58');
INSERT INTO `ka_bl` VALUES ('2071', '中一', '六中一', '21', '1.08', '1.58', '0', '0', '0', '2011-01-21 11:25:28', '1.58');
INSERT INTO `ka_bl` VALUES ('2072', '中一', '六中一', '22', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:25:33', '1.58');
INSERT INTO `ka_bl` VALUES ('2073', '中一', '六中一', '23', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:25:42', '1.58');
INSERT INTO `ka_bl` VALUES ('2074', '中一', '六中一', '24', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:25:47', '1.58');
INSERT INTO `ka_bl` VALUES ('2075', '中一', '六中一', '25', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:25:52', '1.58');
INSERT INTO `ka_bl` VALUES ('2076', '中一', '六中一', '26', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:25:59', '1.58');
INSERT INTO `ka_bl` VALUES ('2077', '中一', '六中一', '27', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:26:05', '1.58');
INSERT INTO `ka_bl` VALUES ('2078', '中一', '六中一', '28', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:26:16', '1.58');
INSERT INTO `ka_bl` VALUES ('2079', '中一', '六中一', '29', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:26:24', '1.58');
INSERT INTO `ka_bl` VALUES ('2080', '中一', '六中一', '30', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:26:31', '1.58');
INSERT INTO `ka_bl` VALUES ('2081', '中一', '六中一', '31', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:26:41', '1.58');
INSERT INTO `ka_bl` VALUES ('2082', '中一', '六中一', '32', '1.08', '1.58', '0', '0', '0', '2011-01-21 11:26:47', '1.58');
INSERT INTO `ka_bl` VALUES ('2083', '中一', '六中一', '33', '1.08', '1.58', '0', '0', '0', '2011-01-21 11:26:53', '1.58');
INSERT INTO `ka_bl` VALUES ('2084', '中一', '六中一', '34', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:26:59', '1.58');
INSERT INTO `ka_bl` VALUES ('2085', '中一', '六中一', '35', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:27:05', '1.58');
INSERT INTO `ka_bl` VALUES ('2086', '中一', '六中一', '36', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:27:11', '1.58');
INSERT INTO `ka_bl` VALUES ('2087', '中一', '六中一', '37', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:27:19', '1.58');
INSERT INTO `ka_bl` VALUES ('2088', '中一', '六中一', '38', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:27:25', '1.58');
INSERT INTO `ka_bl` VALUES ('2089', '中一', '六中一', '39', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:27:31', '1.58');
INSERT INTO `ka_bl` VALUES ('2090', '中一', '六中一', '40', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:27:56', '1.58');
INSERT INTO `ka_bl` VALUES ('2091', '中一', '六中一', '41', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:28:02', '1.58');
INSERT INTO `ka_bl` VALUES ('2092', '中一', '六中一', '42', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:28:08', '1.58');
INSERT INTO `ka_bl` VALUES ('2093', '中一', '六中一', '43', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:28:13', '1.58');
INSERT INTO `ka_bl` VALUES ('2094', '中一', '六中一', '44', '1.08', '1.58', '0', '0', '0', '2011-01-21 11:28:20', '1.58');
INSERT INTO `ka_bl` VALUES ('2095', '中一', '六中一', '45', '1.08', '1.58', '0', '0', '0', '2011-01-21 11:28:25', '1.58');
INSERT INTO `ka_bl` VALUES ('2096', '中一', '六中一', '46', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:28:32', '1.58');
INSERT INTO `ka_bl` VALUES ('2097', '中一', '六中一', '47', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:28:38', '1.58');
INSERT INTO `ka_bl` VALUES ('2098', '中一', '六中一', '48', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:28:43', '1.58');
INSERT INTO `ka_bl` VALUES ('2099', '中一', '六中一', '49', '1.58', '1.58', '0', '0', '0', '2011-01-21 11:28:49', '1.58');

-- ----------------------------
-- Table structure for `ka_color`
-- ----------------------------
DROP TABLE IF EXISTS `ka_color`;
CREATE TABLE `ka_color` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `color` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id` (`ID`),
  KEY `color` (`color`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='开奖的球号对应的颜色';

-- ----------------------------
-- Records of ka_color
-- ----------------------------
INSERT INTO `ka_color` VALUES ('1', 'r');
INSERT INTO `ka_color` VALUES ('2', 'r');
INSERT INTO `ka_color` VALUES ('3', 'b');
INSERT INTO `ka_color` VALUES ('4', 'b');
INSERT INTO `ka_color` VALUES ('5', 'g');
INSERT INTO `ka_color` VALUES ('6', 'g');
INSERT INTO `ka_color` VALUES ('7', 'r');
INSERT INTO `ka_color` VALUES ('8', 'r');
INSERT INTO `ka_color` VALUES ('9', 'b');
INSERT INTO `ka_color` VALUES ('10', 'b');
INSERT INTO `ka_color` VALUES ('11', 'g');
INSERT INTO `ka_color` VALUES ('12', 'r');
INSERT INTO `ka_color` VALUES ('13', 'r');
INSERT INTO `ka_color` VALUES ('14', 'b');
INSERT INTO `ka_color` VALUES ('15', 'b');
INSERT INTO `ka_color` VALUES ('16', 'g');
INSERT INTO `ka_color` VALUES ('17', 'g');
INSERT INTO `ka_color` VALUES ('18', 'r');
INSERT INTO `ka_color` VALUES ('19', 'r');
INSERT INTO `ka_color` VALUES ('20', 'b');
INSERT INTO `ka_color` VALUES ('21', 'g');
INSERT INTO `ka_color` VALUES ('22', 'g');
INSERT INTO `ka_color` VALUES ('23', 'r');
INSERT INTO `ka_color` VALUES ('24', 'r');
INSERT INTO `ka_color` VALUES ('25', 'b');
INSERT INTO `ka_color` VALUES ('26', 'b');
INSERT INTO `ka_color` VALUES ('27', 'g');
INSERT INTO `ka_color` VALUES ('28', 'g');
INSERT INTO `ka_color` VALUES ('29', 'r');
INSERT INTO `ka_color` VALUES ('30', 'r');
INSERT INTO `ka_color` VALUES ('31', 'b');
INSERT INTO `ka_color` VALUES ('32', 'g');
INSERT INTO `ka_color` VALUES ('33', 'g');
INSERT INTO `ka_color` VALUES ('34', 'r');
INSERT INTO `ka_color` VALUES ('35', 'r');
INSERT INTO `ka_color` VALUES ('36', 'b');
INSERT INTO `ka_color` VALUES ('37', 'b');
INSERT INTO `ka_color` VALUES ('38', 'g');
INSERT INTO `ka_color` VALUES ('39', 'g');
INSERT INTO `ka_color` VALUES ('40', 'r');
INSERT INTO `ka_color` VALUES ('41', 'b');
INSERT INTO `ka_color` VALUES ('42', 'b');
INSERT INTO `ka_color` VALUES ('43', 'g');
INSERT INTO `ka_color` VALUES ('44', 'g');
INSERT INTO `ka_color` VALUES ('45', 'r');
INSERT INTO `ka_color` VALUES ('46', 'r');
INSERT INTO `ka_color` VALUES ('47', 'b');
INSERT INTO `ka_color` VALUES ('48', 'b');
INSERT INTO `ka_color` VALUES ('49', 'g');

-- ----------------------------
-- Table structure for `ka_drop`
-- ----------------------------
DROP TABLE IF EXISTS `ka_drop`;
CREATE TABLE `ka_drop` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `drop_sort` varchar(50) DEFAULT NULL,
  `drop_value` int(11) DEFAULT NULL,
  `drop_unit` double DEFAULT NULL,
  `low_drop` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id` (`ID`),
  KEY `drop_sort` (`drop_sort`),
  KEY `drop_value` (`drop_value`),
  KEY `drop_unit` (`drop_unit`),
  KEY `low_drop` (`low_drop`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ka_drop
-- ----------------------------
INSERT INTO `ka_drop` VALUES ('1', '特码', '50000', '0.5', '5');
INSERT INTO `ka_drop` VALUES ('2', '单双', '200000', '0.01', '1.5');
INSERT INTO `ka_drop` VALUES ('3', '大小', '200000', '0.01', '1.5');
INSERT INTO `ka_drop` VALUES ('4', '合数单双 ', '200000', '0.01', '1.5');
INSERT INTO `ka_drop` VALUES ('5', '波色', '100000', '0.02', '1.5');
INSERT INTO `ka_drop` VALUES ('6', '正特', '10000', '0.5', '5');
INSERT INTO `ka_drop` VALUES ('7', '正码', '10000', '0.5', '5');
INSERT INTO `ka_drop` VALUES ('8', '总数单双', '200000', '0.02', '1.5');
INSERT INTO `ka_drop` VALUES ('9', '总数大小', '200000', '0.02', '1.5');
INSERT INTO `ka_drop` VALUES ('10', '五行', '10000', '0.1', '1.5');
INSERT INTO `ka_drop` VALUES ('24', '二肖', '50000', '0.01', '1.5');
INSERT INTO `ka_drop` VALUES ('25', '三肖', '50000', '0.01', '1.5');
INSERT INTO `ka_drop` VALUES ('13', '半波', '20000', '0.1', '3');
INSERT INTO `ka_drop` VALUES ('14', '尾数', '200000', '0.01', '1.5');
INSERT INTO `ka_drop` VALUES ('15', '特肖', '20000', '0.5', '7');
INSERT INTO `ka_drop` VALUES ('16', '四肖', '50000', '0.02', '1.5');
INSERT INTO `ka_drop` VALUES ('17', '五肖', '100000', '0.02', '1.5');
INSERT INTO `ka_drop` VALUES ('18', '一肖', '200000', '0.02', '1.5');
INSERT INTO `ka_drop` VALUES ('20', '六肖', '200000', '0.01', '1.5');
INSERT INTO `ka_drop` VALUES ('23', '家禽野兽', '200000', '0.02', '1.5');
INSERT INTO `ka_drop` VALUES ('26', '半半波', '50000', '0.015', '1.55');
INSERT INTO `ka_drop` VALUES ('27', '头数', '10000', '0.015', '1.55');
INSERT INTO `ka_drop` VALUES ('28', '正特尾数', '30000', '0.015', '1.5');
INSERT INTO `ka_drop` VALUES ('29', '七色波', '30000', '0.015', '1.55');
INSERT INTO `ka_drop` VALUES ('30', '尾大尾小', '30000', '0.015', '1.55');
INSERT INTO `ka_drop` VALUES ('31', '大单小单', '30000', '0.015', '1.55');
INSERT INTO `ka_drop` VALUES ('32', '大双小双', '30000', '0.015', '1.55');
INSERT INTO `ka_drop` VALUES ('36', '生肖连', '1000', '0.015', '1.55');
INSERT INTO `ka_drop` VALUES ('37', '全不中', '2000', '0.015', '1.55');

-- ----------------------------
-- Table structure for `ka_guan`
-- ----------------------------
DROP TABLE IF EXISTS `ka_guan`;
CREATE TABLE `ka_guan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(128) DEFAULT NULL COMMENT '开放盘别',
  `kauser` varchar(250) DEFAULT NULL COMMENT '关联mem表的dan字段  代理用户名',
  `kapassword` varchar(250) DEFAULT NULL,
  `xm` varchar(250) DEFAULT NULL COMMENT '姓名',
  `slogin` varchar(250) DEFAULT NULL COMMENT '最初登录的时间（登录也不改变值）',
  `sip` varchar(250) DEFAULT NULL COMMENT '最初登录的Ip (登录也不改变值)',
  `zlogin` datetime DEFAULT NULL COMMENT '最新登录时间(登录后的最新时间)',
  `zip` varchar(250) DEFAULT NULL COMMENT '登陆后的最新Ip',
  `look` int(11) DEFAULT NULL COMMENT '登录次数',
  `lx` int(11) DEFAULT NULL COMMENT '1代表总代理  ',
  `guanid` int(11) DEFAULT NULL,
  `zongid` int(11) DEFAULT NULL,
  `guan1` varchar(250) DEFAULT NULL COMMENT '//大股东',
  `guan` varchar(250) DEFAULT NULL,
  `zong` varchar(250) DEFAULT NULL,
  `cs` double DEFAULT NULL COMMENT '总信用额',
  `ts` double DEFAULT NULL COMMENT '可用信用额度',
  `sj` double DEFAULT NULL COMMENT '总代占成',
  `sf` double DEFAULT NULL COMMENT '代理占成',
  `adddate` datetime DEFAULT NULL,
  `stat` tinyint(2) DEFAULT '1' COMMENT '代理状态  1禁止 0正常',
  `pz` tinyint(2) DEFAULT '1' COMMENT '走飞状态(走飞 也叫做 补仓功能)  0正常 1禁止',
  `tm` int(11) DEFAULT NULL COMMENT '预计亏损(预估风险值)',
  `zm` int(11) DEFAULT NULL,
  `zm6` int(11) DEFAULT NULL,
  `lm` int(11) DEFAULT NULL,
  `gg` int(11) DEFAULT NULL,
  `xx` int(11) DEFAULT NULL,
  `sx` int(11) DEFAULT NULL,
  `bb` int(11) DEFAULT NULL,
  `bbb` int(11) DEFAULT NULL,
  `qsb` int(11) DEFAULT NULL,
  `zt` int(11) DEFAULT NULL,
  `ws` int(11) DEFAULT NULL,
  `ztws` int(11) DEFAULT NULL,
  `abcd` varchar(50) DEFAULT NULL,
  `ptm` int(11) DEFAULT NULL,
  `pzm` int(11) DEFAULT NULL,
  `pzt` int(11) DEFAULT NULL,
  `pzm6` int(11) DEFAULT NULL,
  `psx` int(11) DEFAULT NULL,
  `pbb` int(11) DEFAULT NULL,
  `pws` int(11) DEFAULT NULL,
  `fbfb` int(11) DEFAULT '0',
  `fbdate` datetime DEFAULT NULL,
  `wx` int(11) DEFAULT '50000',
  `jifei` int(11) DEFAULT '100',
  `tmb` int(11) DEFAULT '0' COMMENT '是否允许特B  0允许  1不允许',
  `rs` int(11) DEFAULT '0' COMMENT '可添加的会员人数',
  `zhx` int(11) DEFAULT NULL,
  `pzyszh` int(11) DEFAULT '1000',
  `pzeszh` int(11) DEFAULT '1000',
  `pzsszh` int(11) DEFAULT '1000',
  `pzysgg` int(11) DEFAULT '1000',
  `pzgd` int(11) DEFAULT '1000',
  `pzz3` int(11) DEFAULT '1000',
  `pzz6` int(11) DEFAULT '1000',
  `best` int(11) DEFAULT '0' COMMENT '自动补状态  0关闭 1开启',
  `zm1` int(11) DEFAULT '1000' COMMENT '正码',
  `zm61` int(11) DEFAULT '1000',
  `lm1` int(11) DEFAULT '1000',
  `lm2` int(11) NOT NULL DEFAULT '1000',
  `lm3` int(11) NOT NULL DEFAULT '1000',
  `lm4` int(11) DEFAULT '0',
  `lm5` int(11) DEFAULT '0',
  `lx1` int(11) DEFAULT '0' COMMENT '二肖连中',
  `lx2` int(11) DEFAULT '0' COMMENT '三肖连中',
  `lx3` int(11) DEFAULT '0' COMMENT '四肖连中',
  `lx4` int(11) DEFAULT '0' COMMENT '五肖连中',
  `lx5` int(11) DEFAULT '0' COMMENT '二肖连不中',
  `lx6` int(11) DEFAULT '0' COMMENT '三肖连不中',
  `lx7` int(11) DEFAULT '0' COMMENT '四肖连不中',
  `qsb1` int(11) NOT NULL DEFAULT '1000' COMMENT '七色波',
  `gg1` int(11) DEFAULT '1000',
  `xx1` int(11) DEFAULT '1000' COMMENT '合肖',
  `sx1` int(11) DEFAULT '1000',
  `bb1` int(11) DEFAULT '1000',
  `zt1` int(11) DEFAULT '1000' COMMENT '正特',
  `ws1` int(11) DEFAULT '1000',
  `tm1` int(11) DEFAULT '1000' COMMENT '特码 (自动补仓)',
  `wx1` int(11) DEFAULT '1000',
  `yx1` int(11) DEFAULT '1000',
  `qbz1` int(11) DEFAULT '5000' COMMENT '五不中',
  `qbz2` int(11) NOT NULL DEFAULT '5000' COMMENT '六不中',
  `qbz3` int(11) NOT NULL DEFAULT '5000' COMMENT '七不中',
  `qbz4` int(11) NOT NULL DEFAULT '5000' COMMENT '八不中',
  `qbz5` int(11) DEFAULT '5000' COMMENT '九不中',
  `qbz6` int(11) NOT NULL DEFAULT '5000' COMMENT '十不中',
  `qbz7` int(11) DEFAULT '0' COMMENT '十一不中',
  `qbz8` int(11) DEFAULT '0' COMMENT '十二不中',
  `wsl1` int(11) DEFAULT '5000' COMMENT '二尾连中',
  `wsl2` int(11) DEFAULT '0' COMMENT '三尾连中',
  `wsl3` int(11) DEFAULT NULL COMMENT '四尾连中',
  `wsl4` int(11) DEFAULT NULL COMMENT '二尾连不中',
  `wsl5` int(11) DEFAULT NULL COMMENT '三尾连不中',
  `wsl6` int(11) DEFAULT NULL COMMENT '四尾连不中',
  `tms` int(11) DEFAULT '1000',
  `tms1` int(11) DEFAULT '1000',
  `3d` int(11) DEFAULT '1000',
  `hs` int(11) DEFAULT '0',
  `hs1` int(11) DEFAULT '0',
  `wb` int(11) DEFAULT '0',
  `wb1` int(11) DEFAULT '0',
  `odds` tinyint(2) NOT NULL DEFAULT '1' COMMENT '赔率控制',
  `rebate` tinyint(2) NOT NULL DEFAULT '1' COMMENT '退水状态',
  PRIMARY KEY (`id`),
  KEY `kauser` (`kauser`),
  KEY `guanid` (`guanid`),
  KEY `zongid` (`zongid`),
  KEY `guan` (`guan`),
  KEY `zong` (`zong`),
  KEY `lx` (`lx`),
  KEY `stat` (`stat`),
  KEY `pz` (`pz`)
) ENGINE=MyISAM AUTO_INCREMENT=309 DEFAULT CHARSET=utf8 COMMENT='代理账号管理';

-- ----------------------------
-- Records of ka_guan
-- ----------------------------
INSERT INTO `ka_guan` VALUES ('282', null, 'zd2', '670b14728ad9902aecba32e22fa4f6bd', '0', '2012-03-31 03:19:25', '58.63.28.99', '2018-12-27 09:56:54', '0.0.0.0', '20', '2', '279', '0', null, 'uc1', 'zd2', '2500000', '2500000', '80', '20', '2012-03-31 03:19:25', '0', '0', '50000', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '251', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('283', null, '4', '670b14728ad9902aecba32e22fa4f6bd', '12', '2012-03-31 03:20:40', '58.63.28.99', '2016-06-23 15:55:47', '127.0.0.1', '1', '3', '279', '282', null, 'uc1', 'zd2', '500000', '500000', '10', '10', '2012-03-31 03:20:40', '0', '0', '500000', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '0', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('280', null, 'zd', '670b14728ad9902aecba32e22fa4f6bd', 'f', '2012-03-30 19:41:20', '58.63.28.99', '2012-03-31 13:17:08', '58.63.28.99', '2', '2', '279', '0', null, 'uc1', 'zd', '2500000', '2500000', '80', '20', '2012-03-30 19:41:20', '0', '0', '500000', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '1125', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('281', null, 'ab', '670b14728ad9902aecba32e22fa4f6bd', '0', '2012-03-30 19:42:23', '58.63.28.99', '2016-06-23 17:17:52', '127.0.0.1', '7', '3', '279', '280', null, 'uc1', 'zd', '1000000', '1000000', '10', '10', '2012-03-30 19:42:23', '0', '0', '500', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '1000', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '0', '1000', '1000', '1000', '0', '1000', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', '0', '0', '0', '0', '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('279', null, 'uc1', '670b14728ad9902aecba32e22fa4f6bd', 'MR 王', '2012-03-30 19:40:44', '58.63.28.99', '2018-12-28 12:09:50', '192.168.1.107', '43', '1', '305', '0', null, 'uc1', 'uc1', '250000000', '250000000', '0', '100', '2012-03-30 19:40:44', '0', '0', '50000', '50000', '50000', '50000', '50000', '50000', '2000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '1400', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1', '5', '0', '7', '8', '9', '10', '11', '15', '16', '17', '18', '19', '20', '21', '22', '13', '2', '4', '6', '3', '37', '1', '13', '12', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('296', null, '123455', '00c66aaf5f2c3f49946f15c1ad2ea0d3', '123455', '2016-07-04 21:18:57', '127.0.0.1', '2016-07-04 21:18:57', '127.0.0.1', '0', '3', '294', '295', null, 'xq2', 'xq222', '100000', '100000', '10', '10', '2016-07-04 21:18:57', '0', '0', '500000', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '1000', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('294', null, 'xq2', 'e10adc3949ba59abbe56e057f20f883e', 'xuanqi2', '2016-07-04 21:17:36', '127.0.0.1', '2016-07-04 21:17:36', '127.0.0.1', '0', '1', '305', '0', null, 'xq2', 'xq2', '10000000', '10000000', '10', '90', '2016-07-04 21:17:36', '0', '0', '500000', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '1000', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('295', null, 'xq222', '96e79218965eb72c92a549dd5a330112', 'xq2222', '2016-07-04 21:18:25', '127.0.0.1', '2016-07-04 21:18:25', '127.0.0.1', '0', '2', '294', '0', null, 'xq2', 'xq222', '100000', '100000', '70', '20', '2016-07-04 21:18:25', '0', '0', '500000', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '1000', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('297', null, 'aaa', 'e10adc3949ba59abbe56e057f20f883e', 'aaa', '2016-07-04 21:22:59', '127.0.0.1', '2016-07-13 17:09:48', '127.0.0.1', '4', '1', '305', '0', null, 'aaa', 'aaa', '50000000', '50000000', '10', '90', '2016-07-04 21:22:59', '0', '0', '500000', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '1000', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('298', null, '123', 'e10adc3949ba59abbe56e057f20f883e', '123', '2016-07-04 21:25:28', '127.0.0.1', '2016-07-04 22:04:22', '127.0.0.1', '4', '2', '297', '0', null, 'aaa', '123', '200000', '200000', '10', '80', '2016-07-04 21:25:28', '0', '0', '5', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '200', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('299', null, '234', 'e10adc3949ba59abbe56e057f20f883e', '234', '2016-07-04 21:37:31', '127.0.0.1', '2016-07-04 22:33:45', '127.0.0.1', '4', '3', '297', '298', null, 'aaa', '123', '100000', '100000', '60', '20', '2016-07-04 21:37:31', '0', '0', '500', '50000', '50000', '50000', '50000', '50000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '200', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('300', null, 'test1', 'e10adc3949ba59abbe56e057f20f883e', 'really', '2018-12-15 09:26:37', '0.0.0.0', '2018-12-15 09:26:37', '0.0.0.0', '0', '3', '279', '282', null, 'uc1', 'zd2', '100000', '100000', '10', '10', '2018-12-15 09:26:37', '0', '0', '500000', '50000', '500000', '50000', '50000', '500000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '50', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('303', null, 'test2', 'e10adc3949ba59abbe56e057f20f883e', '小明', '2018-12-15 10:18:09', '0.0.0.0', '2018-12-15 15:30:04', '192.168.31.226', '1', '3', '279', '282', null, 'uc1', 'zd2', '100000', '100000', '10', '10', '2018-12-15 10:18:09', '0', '0', '500000', '50000', '500000', '50000', '50000', '500000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '26', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('304', null, 'zzd1', 'e10adc3949ba59abbe56e057f20f883e', 'zd2222', '2018-12-21 15:12:27', '0.0.0.0', '2018-12-21 15:12:27', '0.0.0.0', '0', '2', '279', '0', null, 'uc1', 'zzd1', '120000', '120000', '30', '50', '2018-12-21 15:12:27', '1', '1', '500000', '50000', '500000', '50000', '50000', '500000', '50000', '50000', null, null, '50000', '50000', '0', null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '10', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('305', '[\"A\",\"B\",\"C\",\"D\"]', 'gchen', 'e10adc3949ba59abbe56e057f20f883e', '陈志强', null, null, null, null, null, '4', '0', null, null, null, null, null, null, null, '50', null, '0', null, '100000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '0', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '1', '1');
INSERT INTO `ka_guan` VALUES ('306', '[\"A\",\"B\",\"C\",\"D\"]', 'g23234', 'e10adc3949ba59abbe56e057f20f883e', 'MR chen', null, null, null, null, null, '4', '0', null, null, null, null, '99999', '99999', null, '50', '2018-12-30 14:26:50', null, null, '1000', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '0', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '0', '1');
INSERT INTO `ka_guan` VALUES ('307', '[\"A\",\"B\",\"C\"]', 'gerew', 'e10adc3949ba59abbe56e057f20f883e', '陈志强', null, null, null, null, null, '4', '0', null, null, null, null, '9999999999', '99999999999', null, '50', '2018-12-30 14:37:45', '0', '1', '99999', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '0', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '0', '1');
INSERT INTO `ka_guan` VALUES ('308', '[\"A\"]', 'gerew', 'e10adc3949ba59abbe56e057f20f883e', 'wer', null, null, null, null, null, '4', '0', null, null, null, null, '99999999', '9999', null, '50', '2018-12-30 14:41:04', null, '1', '5555', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, '50000', '100', '0', '0', null, '1000', '1000', '1000', '1000', '1000', '1000', '1000', '0', '1000', '1000', '1000', '1000', '1000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '1000', '5000', '5000', '5000', '5000', '5000', '5000', '0', '0', '5000', '0', null, null, null, null, '1000', '1000', '1000', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `ka_guands`
-- ----------------------------
DROP TABLE IF EXISTS `ka_guands`;
CREATE TABLE `ka_guands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ds` varchar(50) DEFAULT NULL COMMENT '下注类型名称',
  `yg` double DEFAULT NULL COMMENT '佣金%A',
  `xx` double DEFAULT NULL COMMENT '单注限额',
  `xxx` double DEFAULT NULL COMMENT '单项(号)限额',
  `lx` int(11) DEFAULT NULL COMMENT '好像是对应不同用户等级的？',
  `ygb` double DEFAULT NULL COMMENT '佣金%B',
  `ygc` double DEFAULT NULL COMMENT '佣金%C',
  `ygd` double DEFAULT NULL COMMENT '佣金%D',
  `style` varchar(50) DEFAULT NULL COMMENT '彩种名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=189 DEFAULT CHARSET=utf8 COMMENT='股东 ka_guan的lx==1对应的用户 所添加代理时 各种下注类型对应数据';

-- ----------------------------
-- Records of ka_guands
-- ----------------------------
INSERT INTO `ka_guands` VALUES ('1', '特A ', '13', '20000', '30000', '0', '14', '15', '16', '六合彩');
INSERT INTO `ka_guands` VALUES ('2', '特B ', '3', '20000', '30000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('3', '单双', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('4', '大小', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('5', '合数单双 ', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('6', '正特', '13', '5000', '10000', '0', '14', '15', '16', '六合彩');
INSERT INTO `ka_guands` VALUES ('7', '正A', '11', '10000', '50000', '0', '12', '13', '14', '六合彩');
INSERT INTO `ka_guands` VALUES ('8', '正B', '3', '10000', '50000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('9', '总和单双', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('10', '总和大小', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('11', '色波', '3', '30000', '50000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('12', '半波 ', '3', '30000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('13', '正码过关', '3', '10000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('119', '五行', '3', '100000', '500000', '0', '4', '0', '0', '六合彩');
INSERT INTO `ka_guands` VALUES ('120', '二肖', '3', '20000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('121', '三肖', '3', '30000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('17', '二全中', '15', '10000', '50000', '0', '15', '15', '15', '六合彩');
INSERT INTO `ka_guands` VALUES ('18', '三全中', '15', '5000', '20000', '0', '15', '15', '15', '六合彩');
INSERT INTO `ka_guands` VALUES ('19', '三中二', '15', '10000', '50000', '0', '15', '15', '15', '六合彩');
INSERT INTO `ka_guands` VALUES ('20', '二中特', '15', '10000', '50000', '0', '15', '15', '15', '六合彩');
INSERT INTO `ka_guands` VALUES ('21', '特串', '15', '10000', '50000', '0', '15', '15', '15', '六合彩');
INSERT INTO `ka_guands` VALUES ('22', '特肖', '3', '10000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('23', '四肖', '3', '30000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('24', '五肖', '3', '40000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('25', '六肖', '3', '50000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('26', '一肖', '3', '50000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('27', '尾数', '3', '50000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('118', '家禽野兽', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('122', '半半波', '3', '5000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('123', '头数', '3', '10000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('124', '正特尾数', '3', '50000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('125', '七色波', '3', '5000', '10000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('126', '正肖', '3', '50000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('127', '尾大尾小', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('128', '大单小单', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('129', '大双小双', '3', '50000', '100000', '0', '4', '5', '6', '六合彩');
INSERT INTO `ka_guands` VALUES ('130', '连肖', '3', '5000', '30000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('131', '五不中', '3', '30000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('171', '正1-6', '3', '50000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('173', '二肖连中', '3', '5000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('174', '三肖连中', '3', '4000', '40000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('175', '四肖连中', '3', '3000', '30000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('177', '二肖连不中', '3', '5000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('132', '六不中', '3', '30000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('178', '三肖连不中', '3', '4000', '40000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('179', '四肖连不中', '3', '3000', '30000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('182', '二尾连中', '3', '5000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('183', '三尾连中', '3', '4000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('184', '四尾连中', '3', '3000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('186', '二尾连不中', '3', '5000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('187', '三尾连不中', '3', '4000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('188', '四尾连不中', '3', '3000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('176', '五肖连中', '3', '2000', '10000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('180', '五肖连不中', '3', '2000', '10000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('133', '七不中', '3', '20000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('134', '八不中', '3', '20000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('135', '九不中', '3', '20000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('136', '十不中', '3', '10000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('137', '十一不中', '3', '5000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('138', '十二不中', '3', '5000', '50000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('141', '四中一', '3', '20000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('142', '五中一', '3', '20000', '100000', '0', '3', '3', '3', '六合彩');
INSERT INTO `ka_guands` VALUES ('143', '六中一', '3', '1000', '1000', '0', '3', '3', '3', '六合彩');

-- ----------------------------
-- Table structure for `ka_kithe`
-- ----------------------------
DROP TABLE IF EXISTS `ka_kithe`;
CREATE TABLE `ka_kithe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nn` int(11) DEFAULT NULL COMMENT '期数',
  `nd` datetime DEFAULT NULL COMMENT '开奖时间',
  `na` int(11) NOT NULL DEFAULT '0' COMMENT '特码  (偶数为双，>=25为大)',
  `n1` int(11) NOT NULL DEFAULT '0' COMMENT '平1',
  `n2` int(11) NOT NULL DEFAULT '0' COMMENT '平2',
  `n3` int(11) NOT NULL DEFAULT '0' COMMENT '平3',
  `n4` int(11) NOT NULL DEFAULT '0' COMMENT '平4',
  `n5` int(11) NOT NULL DEFAULT '0' COMMENT '平5',
  `n6` int(11) NOT NULL DEFAULT '0' COMMENT '平6',
  `kitm` int(11) DEFAULT NULL,
  `kitm1` datetime DEFAULT NULL,
  `kizt` int(11) DEFAULT NULL,
  `kizt1` datetime DEFAULT NULL,
  `kizm` int(11) DEFAULT NULL,
  `kizm1` datetime DEFAULT NULL,
  `kizm6` int(11) DEFAULT NULL,
  `kizm61` datetime DEFAULT NULL,
  `kigg` int(11) DEFAULT NULL,
  `kigg1` datetime DEFAULT NULL,
  `kilm` int(11) DEFAULT NULL,
  `kilm1` datetime DEFAULT NULL,
  `kisx` int(11) DEFAULT NULL COMMENT '//代表 合肖 类 0表示当前类型关闭',
  `kisx1` datetime DEFAULT NULL,
  `kibb` int(11) DEFAULT NULL,
  `kibb1` datetime DEFAULT NULL,
  `zfb` int(11) DEFAULT NULL,
  `zfbdate` datetime DEFAULT NULL,
  `zfbdate1` datetime DEFAULT NULL,
  `best` int(11) DEFAULT NULL,
  `lx` int(11) DEFAULT NULL COMMENT '显示状态',
  `kiws` int(11) DEFAULT NULL,
  `kiws1` datetime DEFAULT NULL,
  `sx` varchar(50) DEFAULT NULL COMMENT '开奖生肖-最后一个特别的生肖 类似于特码na',
  `x1` varchar(10) DEFAULT NULL COMMENT '开奖生肖1',
  `x2` varchar(10) DEFAULT NULL COMMENT '开奖生肖2',
  `x3` varchar(10) DEFAULT NULL COMMENT '开奖生肖3',
  `x4` varchar(10) DEFAULT NULL COMMENT '开奖生肖4',
  `x5` varchar(10) DEFAULT NULL COMMENT '开奖生肖5',
  `x6` varchar(10) DEFAULT NULL COMMENT '开奖生肖6',
  `zckg` varchar(2) DEFAULT '0',
  `kplabel` varchar(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `nn` (`nn`),
  KEY `nd` (`nd`),
  KEY `na` (`na`),
  KEY `lx` (`lx`),
  KEY `sx` (`sx`),
  KEY `zfb` (`zfb`),
  KEY `zfbdate` (`zfbdate`),
  KEY `zfbdate1` (`zfbdate1`)
) ENGINE=MyISAM AUTO_INCREMENT=740 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ka_kithe
-- ----------------------------
INSERT INTO `ka_kithe` VALUES ('718', '2016071', '2016-06-23 21:30:00', '46', '1', '2', '3', '4', '5', '6', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '2016-06-23 20:30:00', '1', '1', '0', '2016-06-23 20:30:00', '羊', '龙', '兔', '虎', '牛', '鼠', '猪', '0', '1');
INSERT INTO `ka_kithe` VALUES ('719', '2016072', '2016-06-26 21:30:00', '8', '1', '2', '3', '4', '5', '6', '0', '2016-06-26 20:30:00', '0', '2016-06-26 20:30:00', '0', '2016-06-26 20:30:00', '0', '2016-06-26 20:30:00', '0', '2016-06-26 20:30:00', '0', '2016-06-26 20:30:00', '0', '2016-06-26 20:30:00', '0', '2016-06-26 20:30:00', '0', '2016-06-26 20:30:00', '2016-06-26 20:30:00', '0', '1', '0', '2016-06-26 20:30:00', '鸡', '龙', '兔', '虎', '牛', '鼠', '猪', '0', '1');
INSERT INTO `ka_kithe` VALUES ('717', '2016070', '2016-06-23 21:30:00', '49', '9', '30', '20', '21', '10', '38', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '0', '2016-06-23 20:30:00', '2016-06-23 20:30:00', '0', '1', '0', '2016-06-23 20:30:00', '龙', '猴', '猪', '鸡', '猴', '羊', '兔', '0', '1');
INSERT INTO `ka_kithe` VALUES ('720', '2016073', '2016-06-30 21:35:00', '15', '7', '8', '9', '11', '12', '13', '0', '2016-06-30 20:35:00', '0', '2016-06-30 20:35:00', '0', '2016-06-30 20:35:00', '0', '2016-06-30 20:35:00', '0', '2016-06-30 20:35:00', '0', '2016-06-30 20:35:00', '0', '2016-06-30 20:35:00', '0', '2016-06-30 20:35:00', '0', '2016-06-30 20:35:00', '2016-06-30 20:35:00', '0', '1', '0', '2016-06-30 20:35:00', '虎', '狗', '鸡', '猴', '马', '蛇', '龙', '0', '1');
INSERT INTO `ka_kithe` VALUES ('721', '2016074', '2016-07-03 21:30:00', '7', '1', '2', '3', '4', '5', '6', '0', '2016-07-03 20:30:00', '0', '2016-07-03 20:30:00', '0', '2016-07-03 20:30:00', '0', '2016-07-03 20:30:00', '0', '2016-07-03 20:30:00', '0', '2016-07-03 20:30:00', '0', '2016-07-03 20:30:00', '0', '2016-07-03 20:30:00', '0', '2016-07-03 20:30:00', '2016-07-03 20:30:00', '0', '1', '0', '2016-07-03 20:30:00', '狗', '龙', '兔', '虎', '牛', '鼠', '猪', '0', '1');
INSERT INTO `ka_kithe` VALUES ('722', '2016075', '2016-07-02 21:30:00', '7', '1', '2', '3', '4', '5', '6', '0', '2016-07-02 21:00:00', '0', '2016-07-02 21:00:00', '0', '2016-07-02 21:00:00', '0', '2016-07-02 21:00:00', '0', '2016-07-02 21:00:00', '0', '2016-07-02 21:00:00', '0', '2016-07-02 21:00:00', '0', '2016-07-02 21:00:00', '0', '2016-07-02 21:00:00', '2016-07-02 21:00:00', '0', '1', '0', '2016-07-02 21:00:00', '狗', '龙', '兔', '虎', '牛', '鼠', '猪', '0', '1');
INSERT INTO `ka_kithe` VALUES ('723', '2016076', '2016-07-05 21:30:00', '7', '1', '2', '3', '4', '5', '6', '0', '2016-07-05 20:30:00', '0', '2016-07-05 20:30:00', '0', '2016-07-05 20:30:00', '0', '2016-07-05 20:30:00', '0', '2016-07-05 20:30:00', '0', '2016-07-05 20:30:00', '0', '2016-07-05 20:30:00', '0', '2016-07-05 20:30:00', '0', '2016-07-05 20:30:00', '2016-07-05 20:30:00', '0', '1', '0', '2016-07-05 20:30:00', '狗', '龙', '兔', '虎', '牛', '鼠', '猪', '0', '1');
INSERT INTO `ka_kithe` VALUES ('724', '2016077', '2016-07-04 22:10:00', '0', '0', '0', '0', '0', '0', '0', '0', '2016-07-04 22:08:00', '0', '2016-07-04 22:08:00', '0', '2016-07-04 22:08:00', '0', '2016-07-04 22:08:00', '0', '2016-07-04 22:08:00', '0', '2016-07-04 22:08:00', '0', '2016-07-04 22:08:00', '0', '2016-07-04 22:08:00', '0', '2016-07-04 22:08:00', '2016-06-24 01:30:00', '0', '1', '0', '2016-07-04 22:08:00', '龙', '兔', '虎', '牛', '鼠', '猪', '狗', '0', '1');
INSERT INTO `ka_kithe` VALUES ('725', '2016078', '2016-07-06 23:40:00', '1', '2', '3', '4', '5', '6', '7', '0', '2016-07-06 23:40:00', '0', '2016-07-06 23:40:00', '0', '2016-07-06 23:40:00', '0', '2016-07-06 23:40:00', '0', '2016-07-06 23:40:00', '0', '2016-07-06 23:40:00', '0', '2016-07-06 23:40:00', '0', '2016-07-06 23:40:00', '0', '2016-07-06 23:40:00', '2016-06-28 01:30:00', '0', '1', '0', '2016-07-06 23:40:00', '龙', '兔', '虎', '牛', '鼠', '猪', '狗', '0', '1');
INSERT INTO `ka_kithe` VALUES ('726', '2016079', '2016-07-14 21:30:00', '7', '1', '2', '3', '4', '5', '6', '0', '2016-07-14 20:30:00', '0', '2016-07-14 20:30:00', '0', '2016-07-14 20:30:00', '0', '2016-07-14 20:30:00', '0', '2016-07-14 20:30:00', '0', '2016-07-14 20:30:00', '0', '2016-07-14 20:30:00', '0', '2016-07-14 20:30:00', '0', '2016-07-14 20:30:00', '2016-07-14 01:30:00', '0', '1', '0', '2016-07-14 20:30:00', '狗', '龙', '兔', '虎', '牛', '鼠', '猪', '0', '1');
INSERT INTO `ka_kithe` VALUES ('727', '2018082', '2018-12-08 08:30:00', '17', '1', '2', '20', '24', '28', '39', '0', '2018-12-07 20:30:00', '0', '2018-12-07 20:30:00', '0', '2018-12-07 20:30:00', '0', '2018-12-07 20:30:00', '0', '2018-12-07 20:30:00', '0', '2018-12-07 20:30:00', '0', '2018-12-07 20:30:00', '0', '2018-12-07 20:30:00', '0', '2018-12-07 20:30:00', '2018-12-04 01:30:00', '0', '1', '0', '2018-12-07 20:30:00', '龙', '猴', '羊', '牛', '鸡', '蛇', '马', '0', '1');
INSERT INTO `ka_kithe` VALUES ('728', '2018083', '2016-06-28 21:30:00', '26', '10', '14', '16', '18', '20', '17', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '2016-06-28 01:30:00', '0', '1', '0', '2016-06-28 20:30:00', '羊', '猪', '羊', '蛇', '兔', '牛', '龙', '0', '1');
INSERT INTO `ka_kithe` VALUES ('729', '2018084', '2016-06-30 21:30:00', '25', '10', '7', '1', '11', '8', '35', '0', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '2016-06-30 01:30:00', '0', '0', '0', '2016-06-30 20:30:00', '猴', '猪', '虎', '猴', '狗', '牛', '狗', '0', '1');
INSERT INTO `ka_kithe` VALUES ('730', '2018085', '2016-06-24 21:30:00', '8', '10', '7', '17', '27', '37', '47', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '2016-06-24 01:30:00', '0', '0', '0', '2016-06-24 20:30:00', '牛', '猪', '虎', '龙', '马', '猴', '狗', '0', '1');
INSERT INTO `ka_kithe` VALUES ('731', '2018086', '2016-06-28 21:30:00', '49', '24', '15', '13', '6', '38', '1', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '2016-06-28 01:30:00', '0', '0', '0', '2016-06-28 20:30:00', '猴', '鸡', '马', '猴', '兔', '羊', '猴', '0', '1');
INSERT INTO `ka_kithe` VALUES ('732', '2018088', '2018-12-10 21:30:00', '49', '25', '34', '2', '15', '18', '48', '0', '2018-12-10 20:30:00', '0', '2018-12-10 20:30:00', '0', '2018-12-10 20:30:00', '0', '2018-12-10 20:30:00', '0', '2018-12-10 20:30:00', '0', '2018-12-10 20:30:00', '0', '2018-12-10 20:30:00', '0', '2018-12-10 20:30:00', '0', '2018-12-11 20:30:00', '2018-12-08 01:30:00', '0', '1', '0', '2018-12-10 20:30:00', '猴', '猴', '猪', '羊', '马', '兔', '鸡', '0', '1');
INSERT INTO `ka_kithe` VALUES ('733', '2018089', '2018-12-16 21:30:00', '48', '15', '28', '33', '46', '19', '3', '0', '2018-12-15 20:30:00', '0', '2018-12-15 20:30:00', '0', '2018-12-15 20:30:00', '0', '2018-12-15 20:30:00', '0', '2018-12-15 20:30:00', '0', '2018-12-15 20:30:00', '0', '2018-12-15 20:30:00', '0', '2018-12-15 20:30:00', '0', '2018-12-15 20:30:00', '2018-12-10 20:30:00', '0', '1', '0', '2018-12-15 20:30:00', '鸡', '马', '蛇', '鼠', '猪', '虎', '马', '1', '1');
INSERT INTO `ka_kithe` VALUES ('734', '2018121', '2018-12-28 21:30:00', '7', '1', '2', '3', '4', '5', '6', '0', '2018-12-28 20:30:00', '0', '2018-12-28 20:30:00', '0', '2018-12-28 20:30:00', '0', '2018-12-28 20:30:00', '0', '2018-12-28 20:30:00', '0', '2018-12-28 20:30:00', '0', '2018-12-28 20:30:00', '0', '2018-12-28 20:30:00', '0', '2018-12-28 20:30:00', '2018-12-28 08:30:00', '1', '0', '0', '2018-12-28 20:30:00', '虎', '猴', '羊', '马', '蛇', '龙', '兔', '0', '1');
INSERT INTO `ka_kithe` VALUES ('737', '2018122', '2019-01-05 21:00:00', '7', '1', '2', '3', '4', '5', '6', '0', null, '0', null, '0', '2019-01-10 11:59:18', '0', null, '0', null, '0', null, '0', null, '0', null, null, '2019-01-05 00:00:00', '2019-01-05 00:00:00', '0', null, '0', null, '虎', '猴', '羊', '马', '蛇', '龙', '兔', '0', '0');
INSERT INTO `ka_kithe` VALUES ('738', '20180810', '2019-01-12 12:00:28', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2019-01-12 00:00:00', '2019-01-12 00:00:00', null, null, null, null, null, null, null, null, null, null, null, '0', '0');
INSERT INTO `ka_kithe` VALUES ('739', '2016080', '2016-07-14 15:13:09', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '0');

-- ----------------------------
-- Table structure for `ka_mem`
-- ----------------------------
DROP TABLE IF EXISTS `ka_mem`;
CREATE TABLE `ka_mem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '大股东ID',
  `kauser` varchar(250) DEFAULT NULL COMMENT '会员用户名',
  `kapassword` varchar(250) DEFAULT NULL COMMENT '密码',
  `xm` varchar(250) DEFAULT NULL COMMENT '姓名',
  `slogin` varchar(250) DEFAULT NULL COMMENT '最初登录的时间',
  `sip` varchar(250) DEFAULT NULL COMMENT '最初登录的ip',
  `zlogin` datetime DEFAULT NULL COMMENT '最新登录的时间',
  `zip` varchar(250) DEFAULT NULL COMMENT '最新登录的ip',
  `look` int(11) DEFAULT NULL COMMENT '登录次数',
  `guanid1` varchar(250) DEFAULT NULL,
  `guanid` int(11) DEFAULT NULL COMMENT '所属股东的Id',
  `zongid` int(11) DEFAULT NULL COMMENT '所属总代的id',
  `danid` int(11) DEFAULT NULL COMMENT '所属代理的id 关联guan表',
  `guan1` varchar(250) DEFAULT NULL COMMENT '大股东账号',
  `guan` varchar(250) DEFAULT NULL,
  `zong` varchar(250) DEFAULT NULL,
  `dan` varchar(250) DEFAULT NULL COMMENT '代理用户名',
  `guan1_zc` double DEFAULT NULL COMMENT '大股东占成',
  `guan_zc` double DEFAULT NULL,
  `zong_zc` double DEFAULT NULL,
  `dan_zc` double DEFAULT NULL,
  `dagu_zc` double DEFAULT NULL COMMENT '公司占成/大股东',
  `cs` double DEFAULT NULL COMMENT '总信用额',
  `ts` double DEFAULT NULL COMMENT '可用信用额度',
  `adddate` datetime DEFAULT NULL COMMENT '账号新增的时间',
  `stat` int(11) DEFAULT NULL COMMENT '状态  1禁止',
  `xy` int(11) DEFAULT NULL COMMENT '下注金额最低限度',
  `abcd` varchar(50) DEFAULT NULL COMMENT '会员类型 (和ma,mb,mc,md关联 分ABCD盘)',
  `tmb` int(11) DEFAULT '0',
  `ops` varchar(50) DEFAULT '0',
  `opd` varchar(50) DEFAULT '0',
  `opp` varchar(50) DEFAULT '0',
  `mb` varchar(50) DEFAULT NULL COMMENT '判断用户会员类型D的标准 ',
  `mc` varchar(50) DEFAULT NULL COMMENT '判断用户会员类型C的标准 ',
  `md` varchar(50) DEFAULT NULL COMMENT '判断用户会员类型D的标准 ',
  `ma` varchar(50) DEFAULT NULL COMMENT '判断用户会员类型A的标准 ',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `kauser` (`kauser`),
  KEY `guanid` (`guanid`),
  KEY `zongid` (`zongid`),
  KEY `danid` (`danid`),
  KEY `guan` (`guan`),
  KEY `zong` (`zong`),
  KEY `dan` (`dan`),
  KEY `abcd` (`abcd`),
  KEY `stat` (`stat`)
) ENGINE=MyISAM AUTO_INCREMENT=339 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of ka_mem
-- ----------------------------
INSERT INTO `ka_mem` VALUES ('322', '2', '670b14728ad9902aecba32e22fa4f6bd', '1', '2012-03-31 03:06:34', '58.63.28.99', '2018-12-28 17:30:32', '::1', '65', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '10000', '9640', '2012-03-31 03:06:34', '0', '2', 'A', '0', '', '', '', null, null, null, null);
INSERT INTO `ka_mem` VALUES ('323', '3', '670b14728ad9902aecba32e22fa4f6bd', '1', '2012-03-31 03:06:50', '58.63.28.99', '2018-12-13 16:48:57', '0.0.0.0', '52', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '50000', '44806.04', '2012-03-31 03:06:50', '0', '2', 'A', '0', '', '', '', null, null, null, null);
INSERT INTO `ka_mem` VALUES ('321', '1', '670b14728ad9902aecba32e22fa4f6bd', '0', '2012-03-30 19:43:20', '58.63.28.99', '2016-06-23 15:25:35', '127.0.0.1', '23', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '50000', '50000', '2012-03-30 19:43:20', '0', '2', 'A', '0', '', '', '', null, null, null, null);
INSERT INTO `ka_mem` VALUES ('324', 'abcd', '96e79218965eb72c92a549dd5a330112', 'z周', '2016-06-29 15:15:07', '127.0.0.1', '2016-06-29 15:15:26', '127.0.0.1', '1', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '50000', '50000', '2016-06-29 15:15:07', '0', '1', 'A', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `ka_mem` VALUES ('325', '56565', '670b14728ad9902aecba32e22fa4f6bd', '111111', '2016-06-29 15:27:16', '127.0.0.1', '2016-06-29 18:07:59', '127.0.0.1', '2', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '4100', '4100', '2016-06-29 15:27:16', '0', '1', 'D', '0', '0', '0', '0', null, null, null, null);
INSERT INTO `ka_mem` VALUES ('327', '121', '670b14728ad9902aecba32e22fa4f6bd', '121', '2016-07-01 22:27:57', '127.0.0.1', '2016-07-02 11:44:00', '127.0.0.1', '3', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '200', '200', '2016-07-01 22:27:57', '0', '1', 'D', '0', '', '', '', '', 'C', 'D', 'A');
INSERT INTO `ka_mem` VALUES ('328', 'xuan', 'e10adc3949ba59abbe56e057f20f883e', 'xuan', '2016-07-02 16:20:54', '127.0.0.1', '2018-11-29 17:47:26', '::1', '1', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '30000', '30000', '2016-07-02 16:20:54', '0', '10', 'A', '0', '', '', '', '', '', 'D', 'A');
INSERT INTO `ka_mem` VALUES ('329', '8989', '670b14728ad9902aecba32e22fa4f6bd', '8989', '2016-07-02 16:31:27', '127.0.0.1', '2016-07-02 16:31:27', '127.0.0.1', '0', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '1000', '1000', '2016-07-02 16:31:27', '0', '10', 'A', '0', '', '', '', '', '', '', 'A');
INSERT INTO `ka_mem` VALUES ('330', '111111', '670b14728ad9902aecba32e22fa4f6bd', '111', '2016-07-02 18:03:01', '127.0.0.1', '2016-07-02 20:39:56', '127.0.0.1', '3', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '1111', '1111', '2016-07-02 18:03:01', '0', '10', 'D', '0', '', '', '', 'B', 'C', 'D', 'A');
INSERT INTO `ka_mem` VALUES ('333', 'xuan123', '670b14728ad9902aecba32e22fa4f6bd', 'xuan123', '2016-07-02 21:08:36', '127.0.0.1', '2016-07-02 21:08:49', '127.0.0.1', '1', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '35890', '35890', '2016-07-02 21:08:36', '0', '10', 'B', '0', '', '', '', 'B', 'C', 'D', 'A');
INSERT INTO `ka_mem` VALUES ('334', '3789', '670b14728ad9902aecba32e22fa4f6bd', '3789', '2016-07-02 21:27:13', '127.0.0.1', '2016-07-04 20:40:25', '127.0.0.1', '2', null, '279', '280', '281', null, 'uc1', 'zd', 'ab', null, '8', '1', '1', '0', '1000', '1000', '2016-07-02 21:27:13', '0', '10', 'D', '0', '0', '0', '0', 'B', '', 'D', 'A');
INSERT INTO `ka_mem` VALUES ('335', '362660', '670b14728ad9902aecba32e22fa4f6bd', '362660', '2016-07-04 21:20:11', '127.0.0.1', '2016-07-04 21:20:26', '127.0.0.1', '1', null, '294', '295', '296', null, 'xq2', 'xq222', '123455', null, '7', '1', '1', '1', '10000', '10000', '2016-07-04 21:20:11', '0', '10', 'A', '0', '', '', '', 'B', '', '', 'A');
INSERT INTO `ka_mem` VALUES ('336', '345', '670b14728ad9902aecba32e22fa4f6bd', '234', '2016-07-04 21:38:23', '127.0.0.1', '2016-07-13 15:42:53', '127.0.0.1', '3', null, '297', null, null, null, 'aaa', '', '', null, '1', '6', '2', '1', '100000', '99800', '2016-07-04 21:38:23', '0', '1', 'A', '0', '', '', '', 'B', 'C', 'D', 'A');
INSERT INTO `ka_mem` VALUES ('337', 'huiyuan1', 'e10adc3949ba59abbe56e057f20f883e', '测试会员', '2018-12-15 15:31:34', '192.168.31.226', '2018-12-22 11:54:42', '0.0.0.0', '4', null, '279', '282', '303', null, 'uc1', 'zd2', 'test2', null, '8', '1', '1', '0', '50000', '49820', '2018-12-15 15:31:34', '0', '2', 'B', '0', '0', '0', '0', 'B', 'C', 'D', 'A');
INSERT INTO `ka_mem` VALUES ('338', 'huiyuan2', 'e10adc3949ba59abbe56e057f20f883e', 'czd', '2018-12-15 17:26:52', '0.0.0.0', '2018-12-15 17:28:37', '0.0.0.0', '1', null, '279', '282', '300', null, 'uc1', 'zd2', 'test1', null, '8', '1', '1', '0', '5000', null, '2018-12-15 17:26:52', '0', '20', 'C', '0', '0', '0', '0', null, 'C', null, 'A');

-- ----------------------------
-- Table structure for `ka_quota`
-- ----------------------------
DROP TABLE IF EXISTS `ka_quota`;
CREATE TABLE `ka_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT NULL COMMENT '代理名称  （ka_guan的kauser）',
  `userid` int(11) DEFAULT NULL COMMENT '即新增代理insertId对应的的ka_guan的 id字段',
  `ds` varchar(250) DEFAULT NULL COMMENT '下注类型 (例如:特A,单双等)',
  `yg` double DEFAULT NULL COMMENT '佣金%A',
  `xx` double DEFAULT NULL COMMENT '单注限额',
  `xxx` double DEFAULT NULL COMMENT '单项(号)限额',
  `lx` int(11) DEFAULT NULL COMMENT '似乎关联代理  默认=0',
  `flag` int(11) DEFAULT NULL COMMENT '新增代理时 默认为0，新增会员时为1',
  `guanid` int(11) DEFAULT NULL COMMENT '新增当前用户的总代对应的ka_guan表guanid字段',
  `zongid` int(11) DEFAULT NULL COMMENT '新增当前用户的总代对应的ka_guan 表id字段',
  `danid` int(11) DEFAULT NULL COMMENT '新增时默认为0',
  `memid` int(11) DEFAULT NULL COMMENT '新增时默认为0',
  `abcd` varchar(50) DEFAULT NULL COMMENT '对应mem表的abcd',
  `yga` double DEFAULT NULL COMMENT '无用字段',
  `ygb` double DEFAULT NULL COMMENT '佣金%B',
  `ygc` double DEFAULT NULL COMMENT '佣金%C',
  `ygd` double DEFAULT NULL COMMENT '佣金%D',
  `style` varchar(50) DEFAULT NULL,
  `ops` varchar(50) DEFAULT '0' COMMENT '六合彩',
  `opd` varchar(50) DEFAULT '0' COMMENT '福彩',
  `opp` varchar(50) DEFAULT '0' COMMENT '体彩',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `username` (`username`),
  KEY `userid` (`userid`),
  KEY `ds` (`ds`),
  KEY `yg` (`yg`),
  KEY `xx` (`xx`),
  KEY `xxx` (`xxx`),
  KEY `lx` (`lx`),
  KEY `flag` (`flag`),
  KEY `guanid` (`guanid`),
  KEY `zongid` (`zongid`),
  KEY `danid` (`danid`),
  KEY `abcd` (`abcd`),
  KEY `ygb` (`ygb`),
  KEY `ygc` (`ygc`),
  KEY `ygd` (`ygd`)
) ENGINE=MyISAM AUTO_INCREMENT=32830 DEFAULT CHARSET=utf8 COMMENT='代理/总代理下注类型对应的数据表  下注的条件判断的来源';

-- ----------------------------
-- Records of ka_quota
-- ----------------------------
INSERT INTO `ka_quota` VALUES ('31247', '4', '283', '四肖连不中', '3', '30000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31208', '4', '283', '二中特', '15', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31204', '4', '283', '正码过关', '3', '40000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31205', '4', '283', '二全中', '15', '30000', '50000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31206', '4', '283', '三全中', '15', '20000', '10000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31207', '4', '283', '三中二', '15', '50000', '40000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31122', '3', '323', '五肖连不中', '0', '2000', '10000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31123', '3', '323', '二尾连中', '0', '5000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31124', '3', '323', '三尾连中', '0', '4000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31125', '3', '323', '四尾连中', '0', '3000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31126', '3', '323', '二尾连不中', '0', '5000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31127', '3', '323', '三尾连不中', '0', '4000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31128', '3', '323', '四尾连不中', '0', '3000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31129', 'zd2', '282', '特A ', '13', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '14', '15', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31130', 'zd2', '282', '特B ', '3', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31131', 'zd2', '282', '单双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31132', 'zd2', '282', '大小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31133', 'zd2', '282', '合数单双 ', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31134', 'zd2', '282', '正特', '13', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '14', '15', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31135', 'zd2', '282', '正A', '11', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '12', '13', '14', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31136', 'zd2', '282', '正B', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31137', 'zd2', '282', '总和单双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31138', 'zd2', '282', '总和大小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31139', 'zd2', '282', '色波', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31140', 'zd2', '282', '半波 ', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31141', 'zd2', '282', '正码过关', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31142', 'zd2', '282', '二全中', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31143', 'zd2', '282', '三全中', '15', '5000', '20000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31144', 'zd2', '282', '三中二', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31145', 'zd2', '282', '二中特', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31146', 'zd2', '282', '特串', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31147', 'zd2', '282', '特肖', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31148', 'zd2', '282', '四肖', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31149', 'zd2', '282', '五肖', '3', '40000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31150', 'zd2', '282', '六肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31151', 'zd2', '282', '一肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31152', 'zd2', '282', '尾数', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31153', 'zd2', '282', '家禽野兽', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31154', 'zd2', '282', '五行', '3', '100000', '500000', '0', '0', '279', '0', '0', '0', null, null, '4', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31155', 'zd2', '282', '二肖', '3', '20000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31156', 'zd2', '282', '三肖', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31157', 'zd2', '282', '半半波', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31158', 'zd2', '282', '头数', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31159', 'zd2', '282', '正特尾数', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31160', 'zd2', '282', '七色波', '3', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31161', 'zd2', '282', '正肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31162', 'zd2', '282', '尾大尾小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31163', 'zd2', '282', '大单小单', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31164', 'zd2', '282', '大双小双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31165', 'zd2', '282', '连肖', '3', '5000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31166', 'zd2', '282', '五不中', '3', '30000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31167', 'zd2', '282', '六不中', '3', '30000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31168', 'zd2', '282', '七不中', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31169', 'zd2', '282', '八不中', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31170', 'zd2', '282', '九不中', '3', '20000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31171', 'zd2', '282', '十不中', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31172', 'zd2', '282', '十一不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31173', 'zd2', '282', '十二不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31174', 'zd2', '282', '四中一', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31175', 'zd2', '282', '五中一', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31176', 'zd2', '282', '六中一', '3', '1000', '1000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31177', 'zd2', '282', '正1-6', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31178', 'zd2', '282', '二肖连中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31179', 'zd2', '282', '三肖连中', '3', '4000', '40000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31180', 'zd2', '282', '四肖连中', '3', '3000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31181', 'zd2', '282', '五肖连中', '3', '2000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31182', 'zd2', '282', '二肖连不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31183', 'zd2', '282', '三肖连不中', '3', '4000', '40000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31184', 'zd2', '282', '四肖连不中', '3', '3000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31185', 'zd2', '282', '五肖连不中', '3', '2000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31186', 'zd2', '282', '二尾连中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31187', 'zd2', '282', '三尾连中', '3', '4000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31188', 'zd2', '282', '四尾连中', '3', '3000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31189', 'zd2', '282', '二尾连不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31190', 'zd2', '282', '三尾连不中', '3', '4000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31191', 'zd2', '282', '四尾连不中', '3', '3000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31192', '4', '283', '特A ', '13', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '14', '15', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31193', '4', '283', '特B ', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31194', '4', '283', '单双', '3', '40000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31195', '4', '283', '大小', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31196', '4', '283', '合数单双 ', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31197', '4', '283', '正特', '13', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '14', '15', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31198', '4', '283', '正A', '11', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '12', '13', '14', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31199', '4', '283', '正B', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31200', '4', '283', '总和单双', '3', '100000', '500000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31201', '4', '283', '总和大小', '3', '20000', '50000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31202', '4', '283', '色波', '3', '30000', '50000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31203', '4', '283', '半波 ', '3', '5000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31121', '3', '323', '四肖连不中', '0', '3000', '30000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31115', '3', '323', '二肖连中', '0', '5000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31116', '3', '323', '三肖连中', '0', '4000', '40000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31117', '3', '323', '四肖连中', '0', '3000', '30000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31118', '3', '323', '五肖连中', '0', '2000', '10000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31119', '3', '323', '二肖连不中', '0', '5000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31120', '3', '323', '三肖连不中', '0', '4000', '40000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31108', '3', '323', '十不中', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31109', '3', '323', '十一不中', '0', '5000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31110', '3', '323', '十二不中', '0', '5000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31111', '3', '323', '四中一', '0', '20000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31112', '3', '323', '五中一', '0', '20000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31113', '3', '323', '六中一', '0', '1000', '1000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31114', '3', '323', '正1-6', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31106', '3', '323', '八不中', '0', '20000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31107', '3', '323', '九不中', '0', '20000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31105', '3', '323', '七不中', '0', '20000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31104', '3', '323', '六不中', '0', '30000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31103', '3', '323', '五不中', '0', '30000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31101', '3', '323', '大双小双', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31102', '3', '323', '连肖', '0', '5000', '30000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31099', '3', '323', '尾大尾小', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31100', '3', '323', '大单小单', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31098', '3', '323', '正肖', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31097', '3', '323', '七色波', '0', '5000', '10000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31096', '3', '323', '正特尾数', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31093', '3', '323', '三肖', '0', '30000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31094', '3', '323', '半半波', '0', '5000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31095', '3', '323', '头数', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31091', '3', '323', '五行', '0', '100000', '500000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31092', '3', '323', '二肖', '0', '20000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31089', '3', '323', '尾数', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31090', '3', '323', '家禽野兽', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31088', '3', '323', '一肖', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31087', '3', '323', '六肖', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31085', '3', '323', '四肖', '0', '30000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31086', '3', '323', '五肖', '0', '40000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31084', '3', '323', '特肖', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31083', '3', '323', '特串', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31081', '3', '323', '三中二', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31082', '3', '323', '二中特', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31080', '3', '323', '三全中', '0', '5000', '20000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31079', '3', '323', '二全中', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31078', '3', '323', '正码过关', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31077', '3', '323', '半波 ', '0', '30000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31076', '3', '323', '色波', '0', '30000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31075', '3', '323', '总和大小', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31074', '3', '323', '总和单双', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31073', '3', '323', '正B', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31072', '3', '323', '正A', '0', '10000', '50000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31071', '3', '323', '正特', '0', '5000', '10000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31070', '3', '323', '合数单双 ', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31069', '3', '323', '大小', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31068', '3', '323', '单双', '0', '50000', '100000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31067', '3', '323', '特B ', '0', '5000', '10000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31066', '3', '323', '特A ', '0', '5000', '10000', '0', '1', '279', '280', '281', '323', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31065', '2', '322', '四尾连不中', '0', '3000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31064', '2', '322', '三尾连不中', '0', '4000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31063', '2', '322', '二尾连不中', '0', '5000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31062', '2', '322', '四尾连中', '0', '3000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31061', '2', '322', '三尾连中', '0', '4000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31060', '2', '322', '二尾连中', '0', '5000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31059', '2', '322', '五肖连不中', '0', '2000', '10000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31058', '2', '322', '四肖连不中', '0', '3000', '30000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31057', '2', '322', '三肖连不中', '0', '4000', '40000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31056', '2', '322', '二肖连不中', '0', '5000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31055', '2', '322', '五肖连中', '0', '2000', '10000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31054', '2', '322', '四肖连中', '0', '3000', '30000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31053', '2', '322', '三肖连中', '0', '4000', '40000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31052', '2', '322', '二肖连中', '0', '5000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31051', '2', '322', '正1-6', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31050', '2', '322', '六中一', '0', '1000', '1000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31049', '2', '322', '五中一', '0', '20000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31048', '2', '322', '四中一', '0', '20000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31047', '2', '322', '十二不中', '0', '5000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31046', '2', '322', '十一不中', '0', '5000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31045', '2', '322', '十不中', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31044', '2', '322', '九不中', '0', '20000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31043', '2', '322', '八不中', '0', '20000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31042', '2', '322', '七不中', '0', '20000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31041', '2', '322', '六不中', '0', '30000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31040', '2', '322', '五不中', '0', '30000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31039', '2', '322', '连肖', '0', '5000', '30000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31038', '2', '322', '大双小双', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31037', '2', '322', '大单小单', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31036', '2', '322', '尾大尾小', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31035', '2', '322', '正肖', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31034', '2', '322', '七色波', '0', '5000', '10000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31033', '2', '322', '正特尾数', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31032', '2', '322', '头数', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31031', '2', '322', '半半波', '0', '5000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31030', '2', '322', '三肖', '0', '30000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31029', '2', '322', '二肖', '0', '20000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31028', '2', '322', '五行', '0', '100000', '500000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31027', '2', '322', '家禽野兽', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31026', '2', '322', '尾数', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31025', '2', '322', '一肖', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31024', '2', '322', '六肖', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31023', '2', '322', '五肖', '0', '40000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31022', '2', '322', '四肖', '0', '30000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31021', '2', '322', '特肖', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31020', '2', '322', '特串', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31006', '2', '322', '大小', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31007', '2', '322', '合数单双 ', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31008', '2', '322', '正特', '0', '5000', '10000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31009', '2', '322', '正A', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31010', '2', '322', '正B', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31011', '2', '322', '总和单双', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31012', '2', '322', '总和大小', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31013', '2', '322', '色波', '0', '30000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31014', '2', '322', '半波 ', '0', '30000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31015', '2', '322', '正码过关', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31016', '2', '322', '二全中', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31017', '2', '322', '三全中', '0', '5000', '20000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31018', '2', '322', '三中二', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31019', '2', '322', '二中特', '0', '10000', '50000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31005', '2', '322', '单双', '0', '50000', '100000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31004', '2', '322', '特B ', '0', '5000', '10000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31003', '2', '322', '特A ', '0', '5000', '10000', '0', '1', '279', '280', '281', '322', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31002', '1', '321', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31001', '1', '321', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31000', '1', '321', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30999', '1', '321', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30998', '1', '321', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30997', '1', '321', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30996', '1', '321', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30995', '1', '321', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30994', '1', '321', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30993', '1', '321', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30992', '1', '321', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30991', '1', '321', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30990', '1', '321', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30989', '1', '321', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30988', '1', '321', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30987', '1', '321', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30986', '1', '321', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30985', '1', '321', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30984', '1', '321', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30983', '1', '321', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30981', '1', '321', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30982', '1', '321', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30980', '1', '321', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30979', '1', '321', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30978', '1', '321', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30977', '1', '321', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30976', '1', '321', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30975', '1', '321', '大双小双', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30974', '1', '321', '大单小单', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30973', '1', '321', '尾大尾小', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30972', '1', '321', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30971', '1', '321', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30970', '1', '321', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30969', '1', '321', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30968', '1', '321', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30967', '1', '321', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30966', '1', '321', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30965', '1', '321', '五行', '3', '100000', '500000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30964', '1', '321', '家禽野兽', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30963', '1', '321', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30962', '1', '321', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30961', '1', '321', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30960', '1', '321', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30959', '1', '321', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30958', '1', '321', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30957', '1', '321', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30956', '1', '321', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30955', '1', '321', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30954', '1', '321', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30953', '1', '321', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30941', '1', '321', '特B ', '3', '5000', '10000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30942', '1', '321', '单双', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30943', '1', '321', '大小', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30944', '1', '321', '合数单双 ', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30945', '1', '321', '正特', '13', '5000', '10000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30946', '1', '321', '正A', '11', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30947', '1', '321', '正B', '3', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30948', '1', '321', '总和单双', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30949', '1', '321', '总和大小', '3', '50000', '100000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30950', '1', '321', '色波', '3', '30000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30951', '1', '321', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30952', '1', '321', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30940', '1', '321', '特A ', '13', '5000', '10000', '0', '1', '279', '280', '281', '321', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30939', 'ab', '281', '四尾连不中', '3', '3000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30938', 'ab', '281', '三尾连不中', '3', '4000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30937', 'ab', '281', '二尾连不中', '3', '5000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30936', 'ab', '281', '四尾连中', '3', '3000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30935', 'ab', '281', '三尾连中', '3', '4000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30934', 'ab', '281', '二尾连中', '3', '5000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30933', 'ab', '281', '五肖连不中', '3', '2000', '10000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30932', 'ab', '281', '四肖连不中', '3', '3000', '30000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30931', 'ab', '281', '三肖连不中', '3', '4000', '40000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30930', 'ab', '281', '二肖连不中', '3', '5000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30929', 'ab', '281', '五肖连中', '3', '2000', '10000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30928', 'ab', '281', '四肖连中', '3', '3000', '30000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30927', 'ab', '281', '三肖连中', '3', '4000', '40000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30926', 'ab', '281', '二肖连中', '3', '5000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30925', 'ab', '281', '正1-6', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30924', 'ab', '281', '六中一', '3', '1000', '1000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30923', 'ab', '281', '五中一', '3', '20000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30922', 'ab', '281', '四中一', '3', '20000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30921', 'ab', '281', '十二不中', '3', '5000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30920', 'ab', '281', '十一不中', '3', '5000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30919', 'ab', '281', '十不中', '3', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30918', 'ab', '281', '九不中', '3', '20000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30917', 'ab', '281', '八不中', '3', '20000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30916', 'ab', '281', '七不中', '3', '20000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30915', 'ab', '281', '六不中', '3', '30000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30914', 'ab', '281', '五不中', '3', '30000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30913', 'ab', '281', '连肖', '3', '5000', '30000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30908', 'ab', '281', '七色波', '3', '5000', '10000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30909', 'ab', '281', '正肖', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30910', 'ab', '281', '尾大尾小', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30911', 'ab', '281', '大单小单', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30912', 'ab', '281', '大双小双', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30907', 'ab', '281', '正特尾数', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30905', 'ab', '281', '半半波', '3', '5000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30906', 'ab', '281', '头数', '3', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30904', 'ab', '281', '三肖', '3', '30000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30903', 'ab', '281', '二肖', '3', '20000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30902', 'ab', '281', '五行', '3', '100000', '500000', '0', '0', '279', '280', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30901', 'ab', '281', '家禽野兽', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30900', 'ab', '281', '尾数', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30899', 'ab', '281', '一肖', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30898', 'ab', '281', '六肖', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30897', 'ab', '281', '五肖', '3', '40000', '100000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30896', 'ab', '281', '四肖', '3', '30000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30895', 'ab', '281', '特肖', '3', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30894', 'ab', '281', '特串', '15', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30893', 'ab', '281', '二中特', '15', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30892', 'ab', '281', '三中二', '15', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30891', 'ab', '281', '三全中', '15', '5000', '20000', '0', '0', '279', '280', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30890', 'ab', '281', '二全中', '15', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30889', 'ab', '281', '正码过关', '3', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30888', 'ab', '281', '半波 ', '3', '30000', '50000', '0', '0', '279', '280', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30887', 'ab', '281', '色波', '3', '30000', '50000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30886', 'ab', '281', '总和大小', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30885', 'ab', '281', '总和单双', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30884', 'ab', '281', '正B', '3', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30883', 'ab', '281', '正A', '11', '10000', '50000', '0', '0', '279', '280', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30882', 'ab', '281', '正特', '13', '5000', '10000', '0', '0', '279', '280', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30881', 'ab', '281', '合数单双 ', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30880', 'ab', '281', '大小', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30879', 'ab', '281', '单双', '3', '50000', '100000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30878', 'ab', '281', '特B ', '3', '5000', '10000', '0', '0', '279', '280', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30877', 'ab', '281', '特A ', '13', '5000', '10000', '0', '0', '279', '280', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30876', 'zd', '280', '四尾连不中', '3', '3000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30874', 'zd', '280', '二尾连不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30875', 'zd', '280', '三尾连不中', '3', '4000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30873', 'zd', '280', '四尾连中', '3', '3000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30870', 'zd', '280', '五肖连不中', '3', '2000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30871', 'zd', '280', '二尾连中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30872', 'zd', '280', '三尾连中', '3', '4000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30869', 'zd', '280', '四肖连不中', '3', '3000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30833', 'zd', '280', '四肖', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30834', 'zd', '280', '五肖', '3', '40000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30835', 'zd', '280', '六肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30836', 'zd', '280', '一肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30837', 'zd', '280', '尾数', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30838', 'zd', '280', '家禽野兽', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30839', 'zd', '280', '五行', '3', '100000', '500000', '0', '0', '279', '0', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30840', 'zd', '280', '二肖', '3', '20000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30841', 'zd', '280', '三肖', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30842', 'zd', '280', '半半波', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30843', 'zd', '280', '头数', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30844', 'zd', '280', '正特尾数', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30845', 'zd', '280', '七色波', '3', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30846', 'zd', '280', '正肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30847', 'zd', '280', '尾大尾小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30848', 'zd', '280', '大单小单', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30849', 'zd', '280', '大双小双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30850', 'zd', '280', '连肖', '3', '5000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30851', 'zd', '280', '五不中', '3', '30000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30852', 'zd', '280', '六不中', '3', '30000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30853', 'zd', '280', '七不中', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30854', 'zd', '280', '八不中', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30855', 'zd', '280', '九不中', '3', '20000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30856', 'zd', '280', '十不中', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30857', 'zd', '280', '十一不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30858', 'zd', '280', '十二不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30859', 'zd', '280', '四中一', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30860', 'zd', '280', '五中一', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30861', 'zd', '280', '六中一', '3', '1000', '1000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30862', 'zd', '280', '正1-6', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30863', 'zd', '280', '二肖连中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30864', 'zd', '280', '三肖连中', '3', '4000', '40000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30865', 'zd', '280', '四肖连中', '3', '3000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30866', 'zd', '280', '五肖连中', '3', '2000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30867', 'zd', '280', '二肖连不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30868', 'zd', '280', '三肖连不中', '3', '4000', '40000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31246', '4', '283', '三肖连不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31245', '4', '283', '二肖连不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31244', '4', '283', '五肖连中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31243', '4', '283', '四肖连中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31242', '4', '283', '三肖连中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31241', '4', '283', '二肖连中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31240', '4', '283', '正1-6', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31239', '4', '283', '六中一', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31238', '4', '283', '五中一', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31237', '4', '283', '四中一', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31236', '4', '283', '十二不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31235', '4', '283', '十一不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31234', '4', '283', '十不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31233', '4', '283', '九不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31232', '4', '283', '八不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31231', '4', '283', '七不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31230', '4', '283', '六不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31229', '4', '283', '五不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31228', '4', '283', '连肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31227', '4', '283', '大双小双', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31226', '4', '283', '大单小单', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31225', '4', '283', '尾大尾小', '3', '50000', '5050000000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31224', '4', '283', '正肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31223', '4', '283', '七色波', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31209', '4', '283', '特串', '15', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31210', '4', '283', '特肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31211', '4', '283', '四肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31212', '4', '283', '五肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31213', '4', '283', '六肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31214', '4', '283', '一肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31215', '4', '283', '尾数', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31216', '4', '283', '家禽野兽', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31217', '4', '283', '五行', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '4', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31218', '4', '283', '二肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31219', '4', '283', '三肖', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31220', '4', '283', '半半波', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31221', '4', '283', '头数', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31222', '4', '283', '正特尾数', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31254', '4', '283', '四尾连不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31253', '4', '283', '三尾连不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31252', '4', '283', '二尾连不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31251', '4', '283', '四尾连中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31250', '4', '283', '三尾连中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31249', '4', '283', '二尾连中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31248', '4', '283', '五肖连不中', '3', '50000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30832', 'zd', '280', '特肖', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30831', 'zd', '280', '特串', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30830', 'zd', '280', '二中特', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30829', 'zd', '280', '三中二', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30828', 'zd', '280', '三全中', '15', '5000', '20000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30827', 'zd', '280', '二全中', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30826', 'zd', '280', '正码过关', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30825', 'zd', '280', '半波 ', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30824', 'zd', '280', '色波', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30823', 'zd', '280', '总和大小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30822', 'zd', '280', '总和单双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30821', 'zd', '280', '正B', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30820', 'zd', '280', '正A', '11', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30819', 'zd', '280', '正特', '13', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30818', 'zd', '280', '合数单双 ', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30817', 'zd', '280', '大小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30816', 'zd', '280', '单双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30815', 'zd', '280', '特B ', '3', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30814', 'zd', '280', '特A ', '13', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30813', 'uc1', '279', '四尾连不中', '3', '3000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30811', 'uc1', '279', '二尾连不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30812', 'uc1', '279', '三尾连不中', '3', '4000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30810', 'uc1', '279', '四尾连中', '3', '3000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30809', 'uc1', '279', '三尾连中', '3', '4000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30808', 'uc1', '279', '二尾连中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30807', 'uc1', '279', '五肖连不中', '3', '2000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30806', 'uc1', '279', '四肖连不中', '3', '3000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30805', 'uc1', '279', '三肖连不中', '3', '4000', '40000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30804', 'uc1', '279', '二肖连不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30803', 'uc1', '279', '五肖连中', '3', '2000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30801', 'uc1', '279', '三肖连中', '3', '4000', '40000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30802', 'uc1', '279', '四肖连中', '3', '3000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30800', 'uc1', '279', '二肖连中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30799', 'uc1', '279', '正1-6', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30798', 'uc1', '279', '六中一', '3', '1000', '1000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30797', 'uc1', '279', '五中一', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30796', 'uc1', '279', '四中一', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30795', 'uc1', '279', '十二不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30794', 'uc1', '279', '十一不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30793', 'uc1', '279', '十不中', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30792', 'uc1', '279', '九不中', '3', '20000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30791', 'uc1', '279', '八不中', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30790', 'uc1', '279', '七不中', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30789', 'uc1', '279', '六不中', '3', '30000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30788', 'uc1', '279', '五不中', '3', '30000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30787', 'uc1', '279', '连肖', '3', '5000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30786', 'uc1', '279', '大双小双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30785', 'uc1', '279', '大单小单', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30784', 'uc1', '279', '尾大尾小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30772', 'uc1', '279', '六肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30773', 'uc1', '279', '一肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30774', 'uc1', '279', '尾数', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30775', 'uc1', '279', '家禽野兽', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30776', 'uc1', '279', '五行', '3', '100000', '500000', '0', '0', '0', '0', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30777', 'uc1', '279', '二肖', '3', '20000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30778', 'uc1', '279', '三肖', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30779', 'uc1', '279', '半半波', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30780', 'uc1', '279', '头数', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30781', 'uc1', '279', '正特尾数', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30782', 'uc1', '279', '七色波', '3', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30783', 'uc1', '279', '正肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30771', 'uc1', '279', '五肖', '3', '40000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30770', 'uc1', '279', '四肖', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30769', 'uc1', '279', '特肖', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30768', 'uc1', '279', '特串', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30767', 'uc1', '279', '二中特', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30766', 'uc1', '279', '三中二', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30765', 'uc1', '279', '三全中', '15', '5000', '20000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30764', 'uc1', '279', '二全中', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30763', 'uc1', '279', '正码过关', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30762', 'uc1', '279', '半波 ', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30761', 'uc1', '279', '色波', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30760', 'uc1', '279', '总和大小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30759', 'uc1', '279', '总和单双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30758', 'uc1', '279', '正B', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30757', 'uc1', '279', '正A', '11', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30756', 'uc1', '279', '正特', '13', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30755', 'uc1', '279', '合数单双 ', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30754', 'uc1', '279', '大小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30753', 'uc1', '279', '单双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30752', 'uc1', '279', '特B ', '3', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('30751', 'uc1', '279', '特A ', '13', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31255', 'abcd', '324', '特A ', '13', '5000', '10000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31256', 'abcd', '324', '特B ', '3', '5000', '10000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31257', 'abcd', '324', '单双', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31258', 'abcd', '324', '大小', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31259', 'abcd', '324', '合数单双 ', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31260', 'abcd', '324', '正特', '13', '5000', '10000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31261', 'abcd', '324', '正A', '11', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31262', 'abcd', '324', '正B', '3', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31263', 'abcd', '324', '总和单双', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31264', 'abcd', '324', '总和大小', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31265', 'abcd', '324', '色波', '3', '30000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31266', 'abcd', '324', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31267', 'abcd', '324', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31268', 'abcd', '324', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31269', 'abcd', '324', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31270', 'abcd', '324', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31271', 'abcd', '324', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31272', 'abcd', '324', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31273', 'abcd', '324', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31274', 'abcd', '324', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31275', 'abcd', '324', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31276', 'abcd', '324', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31277', 'abcd', '324', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31278', 'abcd', '324', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31279', 'abcd', '324', '家禽野兽', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31280', 'abcd', '324', '五行', '3', '100000', '500000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31281', 'abcd', '324', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31282', 'abcd', '324', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31283', 'abcd', '324', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31284', 'abcd', '324', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31285', 'abcd', '324', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31286', 'abcd', '324', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31287', 'abcd', '324', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31288', 'abcd', '324', '尾大尾小', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31289', 'abcd', '324', '大单小单', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31290', 'abcd', '324', '大双小双', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31291', 'abcd', '324', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31292', 'abcd', '324', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31293', 'abcd', '324', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31294', 'abcd', '324', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31295', 'abcd', '324', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31296', 'abcd', '324', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31297', 'abcd', '324', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31298', 'abcd', '324', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31299', 'abcd', '324', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31300', 'abcd', '324', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31301', 'abcd', '324', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31302', 'abcd', '324', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31303', 'abcd', '324', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31304', 'abcd', '324', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31305', 'abcd', '324', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31306', 'abcd', '324', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31307', 'abcd', '324', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31308', 'abcd', '324', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31309', 'abcd', '324', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31310', 'abcd', '324', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31311', 'abcd', '324', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31312', 'abcd', '324', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31313', 'abcd', '324', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31314', 'abcd', '324', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31315', 'abcd', '324', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31316', 'abcd', '324', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31317', 'abcd', '324', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '324', 'A', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31318', '56565', '325', '特A ', '16', '5000', '10000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31319', '56565', '325', '特B ', '6', '5000', '10000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31320', '56565', '325', '单双', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31321', '56565', '325', '大小', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31322', '56565', '325', '合数单双 ', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31323', '56565', '325', '正特', '16', '5000', '10000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31324', '56565', '325', '正A', '14', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31325', '56565', '325', '正B', '6', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31326', '56565', '325', '总和单双', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31327', '56565', '325', '总和大小', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31328', '56565', '325', '色波', '6', '30000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31329', '56565', '325', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31330', '56565', '325', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31331', '56565', '325', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31332', '56565', '325', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31333', '56565', '325', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31334', '56565', '325', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31335', '56565', '325', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31336', '56565', '325', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31337', '56565', '325', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31338', '56565', '325', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31339', '56565', '325', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31340', '56565', '325', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31341', '56565', '325', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31342', '56565', '325', '家禽野兽', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31343', '56565', '325', '五行', '0', '100000', '500000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31344', '56565', '325', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31345', '56565', '325', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31346', '56565', '325', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31347', '56565', '325', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31348', '56565', '325', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31349', '56565', '325', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31350', '56565', '325', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31351', '56565', '325', '尾大尾小', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31352', '56565', '325', '大单小单', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31353', '56565', '325', '大双小双', '6', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31354', '56565', '325', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31355', '56565', '325', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31356', '56565', '325', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31357', '56565', '325', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31358', '56565', '325', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31359', '56565', '325', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31360', '56565', '325', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31361', '56565', '325', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31362', '56565', '325', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31363', '56565', '325', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31364', '56565', '325', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31365', '56565', '325', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31366', '56565', '325', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31367', '56565', '325', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31368', '56565', '325', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31369', '56565', '325', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31370', '56565', '325', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31371', '56565', '325', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31372', '56565', '325', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31373', '56565', '325', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31374', '56565', '325', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31375', '56565', '325', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31376', '56565', '325', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31377', '56565', '325', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31378', '56565', '325', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31379', '56565', '325', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31380', '56565', '325', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '325', 'D', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31381', '121', '327', '特A ', '16', '5000', '10000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31382', '121', '327', '特B ', '6', '5000', '10000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31383', '121', '327', '单双', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31384', '121', '327', '大小', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31385', '121', '327', '合数单双 ', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31386', '121', '327', '正特', '16', '5000', '10000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31387', '121', '327', '正A', '14', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31388', '121', '327', '正B', '6', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31389', '121', '327', '总和单双', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31390', '121', '327', '总和大小', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31391', '121', '327', '色波', '6', '30000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31392', '121', '327', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31393', '121', '327', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31394', '121', '327', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31395', '121', '327', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31396', '121', '327', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31397', '121', '327', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31398', '121', '327', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31399', '121', '327', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31400', '121', '327', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31401', '121', '327', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31402', '121', '327', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31403', '121', '327', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31404', '121', '327', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31405', '121', '327', '家禽野兽', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31406', '121', '327', '五行', '0', '100000', '500000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31407', '121', '327', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31408', '121', '327', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31409', '121', '327', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31410', '121', '327', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31411', '121', '327', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31412', '121', '327', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31413', '121', '327', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31414', '121', '327', '尾大尾小', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31415', '121', '327', '大单小单', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31416', '121', '327', '大双小双', '6', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31417', '121', '327', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31418', '121', '327', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31419', '121', '327', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31420', '121', '327', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31421', '121', '327', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31422', '121', '327', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31423', '121', '327', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31424', '121', '327', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31425', '121', '327', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31426', '121', '327', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31427', '121', '327', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31428', '121', '327', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31429', '121', '327', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31430', '121', '327', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31431', '121', '327', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31432', '121', '327', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31433', '121', '327', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31434', '121', '327', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31435', '121', '327', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31436', '121', '327', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31437', '121', '327', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31438', '121', '327', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31439', '121', '327', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31440', '121', '327', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31441', '121', '327', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31442', '121', '327', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31443', '121', '327', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '327', 'D', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31444', 'xuan', '328', '特A ', '13', '5000', '10000', '0', '1', '279', '280', '281', '328', 'A', null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31445', 'xuan', '328', '特B ', '3', '5000', '10000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31446', 'xuan', '328', '单双', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31447', 'xuan', '328', '大小', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31448', 'xuan', '328', '合数单双 ', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31449', 'xuan', '328', '正特', '13', '5000', '10000', '0', '1', '279', '280', '281', '328', 'A', null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31450', 'xuan', '328', '正A', '11', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31451', 'xuan', '328', '正B', '3', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31452', 'xuan', '328', '总和单双', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31453', 'xuan', '328', '总和大小', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31454', 'xuan', '328', '色波', '3', '30000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31455', 'xuan', '328', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31456', 'xuan', '328', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31457', 'xuan', '328', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31458', 'xuan', '328', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '328', 'A', null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31459', 'xuan', '328', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31460', 'xuan', '328', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31461', 'xuan', '328', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31462', 'xuan', '328', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31463', 'xuan', '328', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31464', 'xuan', '328', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31465', 'xuan', '328', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31466', 'xuan', '328', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31467', 'xuan', '328', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31468', 'xuan', '328', '家禽野兽', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31469', 'xuan', '328', '五行', '3', '100000', '500000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31470', 'xuan', '328', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31471', 'xuan', '328', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31472', 'xuan', '328', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31473', 'xuan', '328', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31474', 'xuan', '328', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31475', 'xuan', '328', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31476', 'xuan', '328', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31477', 'xuan', '328', '尾大尾小', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31478', 'xuan', '328', '大单小单', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31479', 'xuan', '328', '大双小双', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31480', 'xuan', '328', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31481', 'xuan', '328', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31482', 'xuan', '328', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31483', 'xuan', '328', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31484', 'xuan', '328', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31485', 'xuan', '328', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31486', 'xuan', '328', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31487', 'xuan', '328', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31488', 'xuan', '328', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31489', 'xuan', '328', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31490', 'xuan', '328', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31491', 'xuan', '328', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31492', 'xuan', '328', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31493', 'xuan', '328', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31494', 'xuan', '328', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31495', 'xuan', '328', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31496', 'xuan', '328', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31497', 'xuan', '328', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31498', 'xuan', '328', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31499', 'xuan', '328', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31500', 'xuan', '328', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31501', 'xuan', '328', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31502', 'xuan', '328', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31503', 'xuan', '328', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31504', 'xuan', '328', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31505', 'xuan', '328', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31506', 'xuan', '328', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '328', 'A', null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31507', '8989', '329', '特A ', '13', '5000', '10000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31508', '8989', '329', '特B ', '3', '5000', '10000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31509', '8989', '329', '单双', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31510', '8989', '329', '大小', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31511', '8989', '329', '合数单双 ', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31512', '8989', '329', '正特', '13', '5000', '10000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31513', '8989', '329', '正A', '11', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31514', '8989', '329', '正B', '3', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31515', '8989', '329', '总和单双', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31516', '8989', '329', '总和大小', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31517', '8989', '329', '色波', '3', '30000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31518', '8989', '329', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31519', '8989', '329', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31520', '8989', '329', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31521', '8989', '329', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31522', '8989', '329', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31523', '8989', '329', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31524', '8989', '329', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31525', '8989', '329', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31526', '8989', '329', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31527', '8989', '329', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31528', '8989', '329', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31529', '8989', '329', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31530', '8989', '329', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31531', '8989', '329', '家禽野兽', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31532', '8989', '329', '五行', '3', '100000', '500000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31533', '8989', '329', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31534', '8989', '329', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31535', '8989', '329', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31536', '8989', '329', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31537', '8989', '329', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31538', '8989', '329', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31539', '8989', '329', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31540', '8989', '329', '尾大尾小', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31541', '8989', '329', '大单小单', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31542', '8989', '329', '大双小双', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31543', '8989', '329', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31544', '8989', '329', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31545', '8989', '329', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31546', '8989', '329', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31547', '8989', '329', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31548', '8989', '329', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31549', '8989', '329', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31550', '8989', '329', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31551', '8989', '329', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31552', '8989', '329', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31553', '8989', '329', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31554', '8989', '329', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31555', '8989', '329', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31556', '8989', '329', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31557', '8989', '329', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31558', '8989', '329', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31559', '8989', '329', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31560', '8989', '329', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31561', '8989', '329', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31562', '8989', '329', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31563', '8989', '329', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31564', '8989', '329', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31565', '8989', '329', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31566', '8989', '329', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31567', '8989', '329', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31568', '8989', '329', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31569', '8989', '329', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '329', 'A', null, '0', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31800', 'xuan123', '333', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31799', 'xuan123', '333', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31579', '111111', '330', '总和大小', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31798', 'xuan123', '333', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31576', '111111', '330', '正A', '14', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '11', '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31575', '111111', '330', '正特', '16', '5000', '10000', '0', '1', '279', '280', '281', '330', 'D', '13', '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31574', '111111', '330', '合数单双 ', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31573', '111111', '330', '大小', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31582', '111111', '330', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31581', '111111', '330', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31580', '111111', '330', '色波', '6', '30000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31578', '111111', '330', '总和单双', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31577', '111111', '330', '正B', '6', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31797', 'xuan123', '333', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31796', 'xuan123', '333', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31572', '111111', '330', '单双', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31571', '111111', '330', '特B ', '6', '5000', '10000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31570', '111111', '330', '特A ', '16', '5000', '10000', '0', '1', '279', '280', '281', '330', 'D', '13', '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31583', '111111', '330', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31584', '111111', '330', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '330', 'D', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31585', '111111', '330', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31586', '111111', '330', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31587', '111111', '330', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31588', '111111', '330', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31589', '111111', '330', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31590', '111111', '330', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31591', '111111', '330', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31592', '111111', '330', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31593', '111111', '330', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31594', '111111', '330', '家禽野兽', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31595', '111111', '330', '五行', '0', '100000', '500000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31596', '111111', '330', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31597', '111111', '330', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31598', '111111', '330', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31599', '111111', '330', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31600', '111111', '330', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31601', '111111', '330', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31602', '111111', '330', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31603', '111111', '330', '尾大尾小', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31604', '111111', '330', '大单小单', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31605', '111111', '330', '大双小双', '6', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31606', '111111', '330', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31607', '111111', '330', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31608', '111111', '330', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31609', '111111', '330', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31610', '111111', '330', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31611', '111111', '330', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31612', '111111', '330', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31613', '111111', '330', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31614', '111111', '330', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31615', '111111', '330', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31616', '111111', '330', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31617', '111111', '330', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31618', '111111', '330', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31619', '111111', '330', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31620', '111111', '330', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31621', '111111', '330', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31622', '111111', '330', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31623', '111111', '330', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31624', '111111', '330', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31625', '111111', '330', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31626', '111111', '330', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31627', '111111', '330', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31628', '111111', '330', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31629', '111111', '330', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31630', '111111', '330', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31631', '111111', '330', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31632', '111111', '330', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '330', 'D', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31795', 'xuan123', '333', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31794', 'xuan123', '333', '大双小双', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31793', 'xuan123', '333', '大单小单', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31792', 'xuan123', '333', '尾大尾小', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31791', 'xuan123', '333', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31790', 'xuan123', '333', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31789', 'xuan123', '333', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31788', 'xuan123', '333', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31787', 'xuan123', '333', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31786', 'xuan123', '333', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31785', 'xuan123', '333', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31784', 'xuan123', '333', '五行', '4', '100000', '500000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31783', 'xuan123', '333', '家禽野兽', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31782', 'xuan123', '333', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31781', 'xuan123', '333', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31780', 'xuan123', '333', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31779', 'xuan123', '333', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31778', 'xuan123', '333', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31777', 'xuan123', '333', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31776', 'xuan123', '333', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31775', 'xuan123', '333', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31774', 'xuan123', '333', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31773', 'xuan123', '333', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '333', 'B', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31772', 'xuan123', '333', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31771', 'xuan123', '333', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31770', 'xuan123', '333', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31769', 'xuan123', '333', '色波', '4', '30000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31768', 'xuan123', '333', '总和大小', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31767', 'xuan123', '333', '总和单双', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31766', 'xuan123', '333', '正B', '4', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31765', 'xuan123', '333', '正A', '12', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '11', '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31764', 'xuan123', '333', '正特', '14', '5000', '10000', '0', '1', '279', '280', '281', '333', 'B', '13', '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31763', 'xuan123', '333', '合数单双 ', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31762', 'xuan123', '333', '大小', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31761', 'xuan123', '333', '单双', '4', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31760', 'xuan123', '333', '特B ', '4', '5000', '10000', '0', '1', '279', '280', '281', '333', 'B', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31759', 'xuan123', '333', '特A ', '14', '5000', '10000', '0', '1', '279', '280', '281', '333', 'B', '13', '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31801', 'xuan123', '333', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31802', 'xuan123', '333', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31803', 'xuan123', '333', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31804', 'xuan123', '333', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31805', 'xuan123', '333', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31806', 'xuan123', '333', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31807', 'xuan123', '333', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31808', 'xuan123', '333', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31809', 'xuan123', '333', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31810', 'xuan123', '333', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31811', 'xuan123', '333', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31812', 'xuan123', '333', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31813', 'xuan123', '333', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31814', 'xuan123', '333', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31815', 'xuan123', '333', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31816', 'xuan123', '333', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31817', 'xuan123', '333', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31818', 'xuan123', '333', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31819', 'xuan123', '333', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31820', 'xuan123', '333', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31821', 'xuan123', '333', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '333', 'B', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31822', '3789', '334', '特A ', '16', '5000', '10000', '0', '1', '279', '280', '281', '334', 'D', '13', '14', '0', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31823', '3789', '334', '特B ', '6', '5000', '10000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31824', '3789', '334', '单双', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31825', '3789', '334', '大小', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31826', '3789', '334', '合数单双 ', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31827', '3789', '334', '正特', '16', '5000', '10000', '0', '1', '279', '280', '281', '334', 'D', '13', '14', '0', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31828', '3789', '334', '正A', '14', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '11', '12', '0', '14', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31829', '3789', '334', '正B', '6', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31830', '3789', '334', '总和单双', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31831', '3789', '334', '总和大小', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31832', '3789', '334', '色波', '6', '30000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31833', '3789', '334', '半波 ', '3', '30000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31834', '3789', '334', '正码过关', '3', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31835', '3789', '334', '二全中', '15', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '15', '15', '0', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31836', '3789', '334', '三全中', '15', '5000', '20000', '0', '1', '279', '280', '281', '334', 'D', '15', '15', '0', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31837', '3789', '334', '三中二', '15', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '15', '15', '0', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31838', '3789', '334', '二中特', '15', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '15', '15', '0', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31839', '3789', '334', '特串', '15', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '15', '15', '0', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31840', '3789', '334', '特肖', '3', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31841', '3789', '334', '四肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31842', '3789', '334', '五肖', '3', '40000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31843', '3789', '334', '六肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31844', '3789', '334', '一肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31845', '3789', '334', '尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31846', '3789', '334', '家禽野兽', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31847', '3789', '334', '五行', '0', '100000', '500000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31848', '3789', '334', '二肖', '3', '20000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31849', '3789', '334', '三肖', '3', '30000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31850', '3789', '334', '半半波', '3', '5000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31851', '3789', '334', '头数', '3', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31852', '3789', '334', '正特尾数', '3', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31853', '3789', '334', '七色波', '3', '5000', '10000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31854', '3789', '334', '正肖', '3', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31855', '3789', '334', '尾大尾小', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31856', '3789', '334', '大单小单', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31857', '3789', '334', '大双小双', '6', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '4', '0', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31858', '3789', '334', '连肖', '3', '5000', '30000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31859', '3789', '334', '五不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31860', '3789', '334', '六不中', '3', '30000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31861', '3789', '334', '七不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31862', '3789', '334', '八不中', '3', '20000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31863', '3789', '334', '九不中', '3', '20000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31864', '3789', '334', '十不中', '3', '10000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31865', '3789', '334', '十一不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31866', '3789', '334', '十二不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31867', '3789', '334', '四中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31868', '3789', '334', '五中一', '3', '20000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31869', '3789', '334', '六中一', '3', '1000', '1000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31870', '3789', '334', '正1-6', '3', '50000', '100000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31871', '3789', '334', '二肖连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31872', '3789', '334', '三肖连中', '3', '4000', '40000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31873', '3789', '334', '四肖连中', '3', '3000', '30000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31874', '3789', '334', '五肖连中', '3', '2000', '10000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31875', '3789', '334', '二肖连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31876', '3789', '334', '三肖连不中', '3', '4000', '40000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31877', '3789', '334', '四肖连不中', '3', '3000', '30000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31878', '3789', '334', '五肖连不中', '3', '2000', '10000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31879', '3789', '334', '二尾连中', '3', '5000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31880', '3789', '334', '三尾连中', '3', '4000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31881', '3789', '334', '四尾连中', '3', '3000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31882', '3789', '334', '二尾连不中', '3', '5000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31883', '3789', '334', '三尾连不中', '3', '4000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31884', '3789', '334', '四尾连不中', '3', '3000', '50000', '0', '1', '279', '280', '281', '334', 'D', '3', '3', '0', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31885', 'xq2', '294', '特A ', '13', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31886', 'xq2', '294', '特B ', '3', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31887', 'xq2', '294', '单双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31888', 'xq2', '294', '大小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31889', 'xq2', '294', '合数单双 ', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31890', 'xq2', '294', '正特', '13', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31891', 'xq2', '294', '正A', '11', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31892', 'xq2', '294', '正B', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31893', 'xq2', '294', '总和单双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31894', 'xq2', '294', '总和大小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31895', 'xq2', '294', '色波', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31896', 'xq2', '294', '半波 ', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31897', 'xq2', '294', '正码过关', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31898', 'xq2', '294', '二全中', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31899', 'xq2', '294', '三全中', '15', '5000', '20000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31900', 'xq2', '294', '三中二', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31901', 'xq2', '294', '二中特', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31902', 'xq2', '294', '特串', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31903', 'xq2', '294', '特肖', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31904', 'xq2', '294', '四肖', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31905', 'xq2', '294', '五肖', '3', '40000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31906', 'xq2', '294', '六肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31907', 'xq2', '294', '一肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31908', 'xq2', '294', '尾数', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31909', 'xq2', '294', '家禽野兽', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31910', 'xq2', '294', '五行', '3', '100000', '500000', '0', '0', '0', '0', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31911', 'xq2', '294', '二肖', '3', '20000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31912', 'xq2', '294', '三肖', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31913', 'xq2', '294', '半半波', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31914', 'xq2', '294', '头数', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31915', 'xq2', '294', '正特尾数', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31916', 'xq2', '294', '七色波', '3', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31917', 'xq2', '294', '正肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31918', 'xq2', '294', '尾大尾小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31919', 'xq2', '294', '大单小单', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31920', 'xq2', '294', '大双小双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31921', 'xq2', '294', '连肖', '3', '5000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31922', 'xq2', '294', '五不中', '3', '30000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31923', 'xq2', '294', '六不中', '3', '30000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31924', 'xq2', '294', '七不中', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31925', 'xq2', '294', '八不中', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31926', 'xq2', '294', '九不中', '3', '20000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31927', 'xq2', '294', '十不中', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31928', 'xq2', '294', '十一不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31929', 'xq2', '294', '十二不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31930', 'xq2', '294', '四中一', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31931', 'xq2', '294', '五中一', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31932', 'xq2', '294', '六中一', '3', '1000', '1000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31933', 'xq2', '294', '正1-6', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31934', 'xq2', '294', '二肖连中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31935', 'xq2', '294', '三肖连中', '3', '4000', '40000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31936', 'xq2', '294', '四肖连中', '3', '3000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31937', 'xq2', '294', '五肖连中', '3', '2000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31938', 'xq2', '294', '二肖连不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31939', 'xq2', '294', '三肖连不中', '3', '4000', '40000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31940', 'xq2', '294', '四肖连不中', '3', '3000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31941', 'xq2', '294', '五肖连不中', '3', '2000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31942', 'xq2', '294', '二尾连中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31943', 'xq2', '294', '三尾连中', '3', '4000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31944', 'xq2', '294', '四尾连中', '3', '3000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31945', 'xq2', '294', '二尾连不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31946', 'xq2', '294', '三尾连不中', '3', '4000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31947', 'xq2', '294', '四尾连不中', '3', '3000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31948', 'xq222', '295', '特A ', '13', '5000', '10000', '0', '0', '294', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31949', 'xq222', '295', '特B ', '3', '5000', '10000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31950', 'xq222', '295', '单双', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31951', 'xq222', '295', '大小', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31952', 'xq222', '295', '合数单双 ', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31953', 'xq222', '295', '正特', '13', '5000', '10000', '0', '0', '294', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31954', 'xq222', '295', '正A', '11', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31955', 'xq222', '295', '正B', '3', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31956', 'xq222', '295', '总和单双', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31957', 'xq222', '295', '总和大小', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31958', 'xq222', '295', '色波', '3', '30000', '50000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31959', 'xq222', '295', '半波 ', '3', '30000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31960', 'xq222', '295', '正码过关', '3', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31961', 'xq222', '295', '二全中', '15', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31962', 'xq222', '295', '三全中', '15', '5000', '20000', '0', '0', '294', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31963', 'xq222', '295', '三中二', '15', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31964', 'xq222', '295', '二中特', '15', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31965', 'xq222', '295', '特串', '15', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31966', 'xq222', '295', '特肖', '3', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31967', 'xq222', '295', '四肖', '3', '30000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31968', 'xq222', '295', '五肖', '3', '40000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31969', 'xq222', '295', '六肖', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31970', 'xq222', '295', '一肖', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31971', 'xq222', '295', '尾数', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31972', 'xq222', '295', '家禽野兽', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31973', 'xq222', '295', '五行', '3', '100000', '500000', '0', '0', '294', '0', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31974', 'xq222', '295', '二肖', '3', '20000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31975', 'xq222', '295', '三肖', '3', '30000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31976', 'xq222', '295', '半半波', '3', '5000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31977', 'xq222', '295', '头数', '3', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31978', 'xq222', '295', '正特尾数', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31979', 'xq222', '295', '七色波', '3', '5000', '10000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31980', 'xq222', '295', '正肖', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31981', 'xq222', '295', '尾大尾小', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31982', 'xq222', '295', '大单小单', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31983', 'xq222', '295', '大双小双', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31984', 'xq222', '295', '连肖', '3', '5000', '30000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31985', 'xq222', '295', '五不中', '3', '30000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31986', 'xq222', '295', '六不中', '3', '30000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31987', 'xq222', '295', '七不中', '3', '20000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31988', 'xq222', '295', '八不中', '3', '20000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31989', 'xq222', '295', '九不中', '3', '20000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31990', 'xq222', '295', '十不中', '3', '10000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31991', 'xq222', '295', '十一不中', '3', '5000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31992', 'xq222', '295', '十二不中', '3', '5000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31993', 'xq222', '295', '四中一', '3', '20000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31994', 'xq222', '295', '五中一', '3', '20000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31995', 'xq222', '295', '六中一', '3', '1000', '1000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31996', 'xq222', '295', '正1-6', '3', '50000', '100000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31997', 'xq222', '295', '二肖连中', '3', '5000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31998', 'xq222', '295', '三肖连中', '3', '4000', '40000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('31999', 'xq222', '295', '四肖连中', '3', '3000', '30000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32000', 'xq222', '295', '五肖连中', '3', '2000', '10000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32001', 'xq222', '295', '二肖连不中', '3', '5000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32002', 'xq222', '295', '三肖连不中', '3', '4000', '40000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32003', 'xq222', '295', '四肖连不中', '3', '3000', '30000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32004', 'xq222', '295', '五肖连不中', '3', '2000', '10000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32005', 'xq222', '295', '二尾连中', '3', '5000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32006', 'xq222', '295', '三尾连中', '3', '4000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32007', 'xq222', '295', '四尾连中', '3', '3000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32008', 'xq222', '295', '二尾连不中', '3', '5000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32009', 'xq222', '295', '三尾连不中', '3', '4000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32010', 'xq222', '295', '四尾连不中', '3', '3000', '50000', '0', '0', '294', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32011', '123455', '296', '特A ', '13', '5000', '10000', '0', '0', '294', '295', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32012', '123455', '296', '特B ', '3', '5000', '10000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32013', '123455', '296', '单双', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32014', '123455', '296', '大小', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32015', '123455', '296', '合数单双 ', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32016', '123455', '296', '正特', '13', '5000', '10000', '0', '0', '294', '295', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32017', '123455', '296', '正A', '11', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32018', '123455', '296', '正B', '3', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32019', '123455', '296', '总和单双', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32020', '123455', '296', '总和大小', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32021', '123455', '296', '色波', '3', '30000', '50000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32022', '123455', '296', '半波 ', '3', '30000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32023', '123455', '296', '正码过关', '3', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32024', '123455', '296', '二全中', '15', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32025', '123455', '296', '三全中', '15', '5000', '20000', '0', '0', '294', '295', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32026', '123455', '296', '三中二', '15', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32027', '123455', '296', '二中特', '15', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32028', '123455', '296', '特串', '15', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32029', '123455', '296', '特肖', '3', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32030', '123455', '296', '四肖', '3', '30000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32031', '123455', '296', '五肖', '3', '40000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32032', '123455', '296', '六肖', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32033', '123455', '296', '一肖', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32034', '123455', '296', '尾数', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32035', '123455', '296', '家禽野兽', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32036', '123455', '296', '五行', '3', '100000', '500000', '0', '0', '294', '295', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32037', '123455', '296', '二肖', '3', '20000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32038', '123455', '296', '三肖', '3', '30000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32039', '123455', '296', '半半波', '3', '5000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32040', '123455', '296', '头数', '3', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32041', '123455', '296', '正特尾数', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32042', '123455', '296', '七色波', '3', '5000', '10000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32043', '123455', '296', '正肖', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32044', '123455', '296', '尾大尾小', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32045', '123455', '296', '大单小单', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32046', '123455', '296', '大双小双', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32047', '123455', '296', '连肖', '3', '5000', '30000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32048', '123455', '296', '五不中', '3', '30000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32049', '123455', '296', '六不中', '3', '30000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32050', '123455', '296', '七不中', '3', '20000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32051', '123455', '296', '八不中', '3', '20000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32052', '123455', '296', '九不中', '3', '20000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32053', '123455', '296', '十不中', '3', '10000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32054', '123455', '296', '十一不中', '3', '5000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32055', '123455', '296', '十二不中', '3', '5000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32056', '123455', '296', '四中一', '3', '20000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32057', '123455', '296', '五中一', '3', '20000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32058', '123455', '296', '六中一', '3', '1000', '1000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32059', '123455', '296', '正1-6', '3', '50000', '100000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32060', '123455', '296', '二肖连中', '3', '5000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32061', '123455', '296', '三肖连中', '3', '4000', '40000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32062', '123455', '296', '四肖连中', '3', '3000', '30000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32063', '123455', '296', '五肖连中', '3', '2000', '10000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32064', '123455', '296', '二肖连不中', '3', '5000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32065', '123455', '296', '三肖连不中', '3', '4000', '40000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32066', '123455', '296', '四肖连不中', '3', '3000', '30000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32067', '123455', '296', '五肖连不中', '3', '2000', '10000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32068', '123455', '296', '二尾连中', '3', '5000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32069', '123455', '296', '三尾连中', '3', '4000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32070', '123455', '296', '四尾连中', '3', '3000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32071', '123455', '296', '二尾连不中', '3', '5000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32072', '123455', '296', '三尾连不中', '3', '4000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32073', '123455', '296', '四尾连不中', '3', '3000', '50000', '0', '0', '294', '295', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32074', '362660', '335', '特A ', '13', '5000', '10000', '0', '1', '294', '295', '296', '335', 'A', '13', '14', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32075', '362660', '335', '特B ', '3', '5000', '10000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32076', '362660', '335', '单双', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32077', '362660', '335', '大小', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32078', '362660', '335', '合数单双 ', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32079', '362660', '335', '正特', '13', '5000', '10000', '0', '1', '294', '295', '296', '335', 'A', '13', '14', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32080', '362660', '335', '正A', '11', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '11', '12', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32081', '362660', '335', '正B', '3', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32082', '362660', '335', '总和单双', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32083', '362660', '335', '总和大小', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32084', '362660', '335', '色波', '3', '30000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32085', '362660', '335', '半波 ', '3', '30000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32086', '362660', '335', '正码过关', '3', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32087', '362660', '335', '二全中', '15', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '15', '15', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32088', '362660', '335', '三全中', '15', '5000', '20000', '0', '1', '294', '295', '296', '335', 'A', '15', '15', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32089', '362660', '335', '三中二', '15', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '15', '15', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32090', '362660', '335', '二中特', '15', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '15', '15', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32091', '362660', '335', '特串', '15', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '15', '15', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32092', '362660', '335', '特肖', '3', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32093', '362660', '335', '四肖', '3', '30000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32094', '362660', '335', '五肖', '3', '40000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32095', '362660', '335', '六肖', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32096', '362660', '335', '一肖', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32097', '362660', '335', '尾数', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32098', '362660', '335', '家禽野兽', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32099', '362660', '335', '五行', '3', '100000', '500000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32100', '362660', '335', '二肖', '3', '20000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32101', '362660', '335', '三肖', '3', '30000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32102', '362660', '335', '半半波', '3', '5000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32103', '362660', '335', '头数', '3', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32104', '362660', '335', '正特尾数', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32105', '362660', '335', '七色波', '3', '5000', '10000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32106', '362660', '335', '正肖', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32107', '362660', '335', '尾大尾小', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32108', '362660', '335', '大单小单', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32109', '362660', '335', '大双小双', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32110', '362660', '335', '连肖', '3', '5000', '30000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32111', '362660', '335', '五不中', '3', '30000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32112', '362660', '335', '六不中', '3', '30000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32113', '362660', '335', '七不中', '3', '20000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32114', '362660', '335', '八不中', '3', '20000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32115', '362660', '335', '九不中', '3', '20000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32116', '362660', '335', '十不中', '3', '10000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32117', '362660', '335', '十一不中', '3', '5000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32118', '362660', '335', '十二不中', '3', '5000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32119', '362660', '335', '四中一', '3', '20000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32120', '362660', '335', '五中一', '3', '20000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32121', '362660', '335', '六中一', '3', '1000', '1000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32122', '362660', '335', '正1-6', '3', '50000', '100000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32123', '362660', '335', '二肖连中', '3', '5000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32124', '362660', '335', '三肖连中', '3', '4000', '40000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32125', '362660', '335', '四肖连中', '3', '3000', '30000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32126', '362660', '335', '五肖连中', '3', '2000', '10000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32127', '362660', '335', '二肖连不中', '3', '5000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32128', '362660', '335', '三肖连不中', '3', '4000', '40000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32129', '362660', '335', '四肖连不中', '3', '3000', '30000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32130', '362660', '335', '五肖连不中', '3', '2000', '10000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32131', '362660', '335', '二尾连中', '3', '5000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32132', '362660', '335', '三尾连中', '3', '4000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32133', '362660', '335', '四尾连中', '3', '3000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32134', '362660', '335', '二尾连不中', '3', '5000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32135', '362660', '335', '三尾连不中', '3', '4000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32136', '362660', '335', '四尾连不中', '3', '3000', '50000', '0', '1', '294', '295', '296', '335', 'A', '3', '3', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32137', 'aaa', '297', '特A ', '13', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32138', 'aaa', '297', '特B ', '3', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32139', 'aaa', '297', '单双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32140', 'aaa', '297', '大小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32141', 'aaa', '297', '合数单双 ', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32142', 'aaa', '297', '正特', '13', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32143', 'aaa', '297', '正A', '11', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32144', 'aaa', '297', '正B', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32145', 'aaa', '297', '总和单双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32146', 'aaa', '297', '总和大小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32147', 'aaa', '297', '色波', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32148', 'aaa', '297', '半波 ', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32149', 'aaa', '297', '正码过关', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32150', 'aaa', '297', '二全中', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32151', 'aaa', '297', '三全中', '15', '5000', '20000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32152', 'aaa', '297', '三中二', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32153', 'aaa', '297', '二中特', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32154', 'aaa', '297', '特串', '15', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32155', 'aaa', '297', '特肖', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32156', 'aaa', '297', '四肖', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32157', 'aaa', '297', '五肖', '3', '40000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32158', 'aaa', '297', '六肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32159', 'aaa', '297', '一肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32160', 'aaa', '297', '尾数', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32161', 'aaa', '297', '家禽野兽', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32162', 'aaa', '297', '五行', '3', '100000', '500000', '0', '0', '0', '0', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32163', 'aaa', '297', '二肖', '3', '20000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32164', 'aaa', '297', '三肖', '3', '30000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32165', 'aaa', '297', '半半波', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32166', 'aaa', '297', '头数', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32167', 'aaa', '297', '正特尾数', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32168', 'aaa', '297', '七色波', '3', '5000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32169', 'aaa', '297', '正肖', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32170', 'aaa', '297', '尾大尾小', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32171', 'aaa', '297', '大单小单', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32172', 'aaa', '297', '大双小双', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32173', 'aaa', '297', '连肖', '3', '5000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32174', 'aaa', '297', '五不中', '3', '30000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32175', 'aaa', '297', '六不中', '3', '30000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32176', 'aaa', '297', '七不中', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32177', 'aaa', '297', '八不中', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32178', 'aaa', '297', '九不中', '3', '20000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32179', 'aaa', '297', '十不中', '3', '10000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32180', 'aaa', '297', '十一不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32181', 'aaa', '297', '十二不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32182', 'aaa', '297', '四中一', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32183', 'aaa', '297', '五中一', '3', '20000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32184', 'aaa', '297', '六中一', '3', '1000', '1000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32185', 'aaa', '297', '正1-6', '3', '50000', '100000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32186', 'aaa', '297', '二肖连中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32187', 'aaa', '297', '三肖连中', '3', '4000', '40000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32188', 'aaa', '297', '四肖连中', '3', '3000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32189', 'aaa', '297', '五肖连中', '3', '2000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32190', 'aaa', '297', '二肖连不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32191', 'aaa', '297', '三肖连不中', '3', '4000', '40000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32192', 'aaa', '297', '四肖连不中', '3', '3000', '30000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32193', 'aaa', '297', '五肖连不中', '3', '2000', '10000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32194', 'aaa', '297', '二尾连中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32195', 'aaa', '297', '三尾连中', '3', '4000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32196', 'aaa', '297', '四尾连中', '3', '3000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32197', 'aaa', '297', '二尾连不中', '3', '5000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32198', 'aaa', '297', '三尾连不中', '3', '4000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32199', 'aaa', '297', '四尾连不中', '3', '3000', '50000', '0', '0', '0', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32200', '123', '298', '特A ', '13', '5000', '10000', '0', '0', '297', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32201', '123', '298', '特B ', '3', '5000', '10000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32202', '123', '298', '单双', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32203', '123', '298', '大小', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32204', '123', '298', '合数单双 ', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32205', '123', '298', '正特', '13', '5000', '10000', '0', '0', '297', '0', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32206', '123', '298', '正A', '11', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32207', '123', '298', '正B', '3', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32208', '123', '298', '总和单双', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32209', '123', '298', '总和大小', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32210', '123', '298', '色波', '3', '30000', '50000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32211', '123', '298', '半波 ', '3', '30000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32212', '123', '298', '正码过关', '3', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32213', '123', '298', '二全中', '15', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32214', '123', '298', '三全中', '15', '5000', '20000', '0', '0', '297', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32215', '123', '298', '三中二', '15', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32216', '123', '298', '二中特', '15', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32217', '123', '298', '特串', '15', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32218', '123', '298', '特肖', '3', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32219', '123', '298', '四肖', '3', '30000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32220', '123', '298', '五肖', '3', '40000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32221', '123', '298', '六肖', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32222', '123', '298', '一肖', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32223', '123', '298', '尾数', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32224', '123', '298', '家禽野兽', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32225', '123', '298', '五行', '3', '100000', '500000', '0', '0', '297', '0', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32226', '123', '298', '二肖', '3', '20000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32227', '123', '298', '三肖', '3', '30000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32228', '123', '298', '半半波', '3', '5000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32229', '123', '298', '头数', '3', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32230', '123', '298', '正特尾数', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32231', '123', '298', '七色波', '3', '5000', '10000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32232', '123', '298', '正肖', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32233', '123', '298', '尾大尾小', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32234', '123', '298', '大单小单', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32235', '123', '298', '大双小双', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32236', '123', '298', '连肖', '3', '5000', '30000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32237', '123', '298', '五不中', '3', '30000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32238', '123', '298', '六不中', '3', '30000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32239', '123', '298', '七不中', '3', '20000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32240', '123', '298', '八不中', '3', '20000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32241', '123', '298', '九不中', '3', '20000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32242', '123', '298', '十不中', '3', '10000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32243', '123', '298', '十一不中', '3', '5000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32244', '123', '298', '十二不中', '3', '5000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32245', '123', '298', '四中一', '3', '20000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32246', '123', '298', '五中一', '3', '20000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32247', '123', '298', '六中一', '3', '1000', '1000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32248', '123', '298', '正1-6', '3', '50000', '100000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32249', '123', '298', '二肖连中', '3', '5000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32250', '123', '298', '三肖连中', '3', '4000', '40000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32251', '123', '298', '四肖连中', '3', '3000', '30000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32252', '123', '298', '五肖连中', '3', '2000', '10000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32253', '123', '298', '二肖连不中', '3', '5000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32254', '123', '298', '三肖连不中', '3', '4000', '40000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32255', '123', '298', '四肖连不中', '3', '3000', '30000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32256', '123', '298', '五肖连不中', '3', '2000', '10000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32257', '123', '298', '二尾连中', '3', '5000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32258', '123', '298', '三尾连中', '3', '4000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32259', '123', '298', '四尾连中', '3', '3000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32260', '123', '298', '二尾连不中', '3', '5000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32261', '123', '298', '三尾连不中', '3', '4000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32262', '123', '298', '四尾连不中', '3', '3000', '50000', '0', '0', '297', '0', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32263', '234', '299', '特A ', '13', '5000', '10000', '0', '0', '297', '298', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32264', '234', '299', '特B ', '3', '5000', '10000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32265', '234', '299', '单双', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32266', '234', '299', '大小', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32267', '234', '299', '合数单双 ', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32268', '234', '299', '正特', '13', '5000', '10000', '0', '0', '297', '298', '0', '0', null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32269', '234', '299', '正A', '11', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32270', '234', '299', '正B', '3', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32271', '234', '299', '总和单双', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32272', '234', '299', '总和大小', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32273', '234', '299', '色波', '3', '30000', '50000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32274', '234', '299', '半波 ', '3', '30000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32275', '234', '299', '正码过关', '3', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32276', '234', '299', '二全中', '15', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32277', '234', '299', '三全中', '15', '5000', '20000', '0', '0', '297', '298', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32278', '234', '299', '三中二', '15', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32279', '234', '299', '二中特', '15', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32280', '234', '299', '特串', '15', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32281', '234', '299', '特肖', '3', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32282', '234', '299', '四肖', '3', '30000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32283', '234', '299', '五肖', '3', '40000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32284', '234', '299', '六肖', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32285', '234', '299', '一肖', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32286', '234', '299', '尾数', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32287', '234', '299', '家禽野兽', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32288', '234', '299', '五行', '3', '100000', '500000', '0', '0', '297', '298', '0', '0', null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32289', '234', '299', '二肖', '3', '20000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32290', '234', '299', '三肖', '3', '30000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32291', '234', '299', '半半波', '3', '5000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32292', '234', '299', '头数', '3', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32293', '234', '299', '正特尾数', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32294', '234', '299', '七色波', '3', '5000', '10000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32295', '234', '299', '正肖', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32296', '234', '299', '尾大尾小', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32297', '234', '299', '大单小单', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32298', '234', '299', '大双小双', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32299', '234', '299', '连肖', '3', '5000', '30000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32300', '234', '299', '五不中', '3', '30000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32301', '234', '299', '六不中', '3', '30000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32302', '234', '299', '七不中', '3', '20000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32303', '234', '299', '八不中', '3', '20000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32304', '234', '299', '九不中', '3', '20000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32305', '234', '299', '十不中', '3', '10000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32306', '234', '299', '十一不中', '3', '5000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32307', '234', '299', '十二不中', '3', '5000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32308', '234', '299', '四中一', '3', '20000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32309', '234', '299', '五中一', '3', '20000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32310', '234', '299', '六中一', '3', '1000', '1000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32311', '234', '299', '正1-6', '3', '50000', '100000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32312', '234', '299', '二肖连中', '3', '5000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32313', '234', '299', '三肖连中', '3', '4000', '40000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32314', '234', '299', '四肖连中', '3', '3000', '30000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32315', '234', '299', '五肖连中', '3', '2000', '10000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32316', '234', '299', '二肖连不中', '3', '5000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32317', '234', '299', '三肖连不中', '3', '4000', '40000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32318', '234', '299', '四肖连不中', '3', '3000', '30000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32319', '234', '299', '五肖连不中', '3', '2000', '10000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32320', '234', '299', '二尾连中', '3', '5000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32321', '234', '299', '三尾连中', '3', '4000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32322', '234', '299', '四尾连中', '3', '3000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32323', '234', '299', '二尾连不中', '3', '5000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32324', '234', '299', '三尾连不中', '3', '4000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32325', '234', '299', '四尾连不中', '3', '3000', '50000', '0', '0', '297', '298', '0', '0', null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32326', '345', '336', '特A ', '13', '5000', '10000', '0', '1', '297', '298', '299', '336', 'A', '13', '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32327', '345', '336', '特B ', '3', '5000', '10000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32328', '345', '336', '单双', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32329', '345', '336', '大小', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32330', '345', '336', '合数单双 ', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32331', '345', '336', '正特', '13', '5000', '10000', '0', '1', '297', '298', '299', '336', 'A', '13', '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32332', '345', '336', '正A', '11', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '11', '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32333', '345', '336', '正B', '3', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32334', '345', '336', '总和单双', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32335', '345', '336', '总和大小', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32336', '345', '336', '色波', '3', '30000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32337', '345', '336', '半波 ', '3', '30000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32338', '345', '336', '正码过关', '3', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32339', '345', '336', '二全中', '15', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32340', '345', '336', '三全中', '15', '5000', '20000', '0', '1', '297', '298', '299', '336', 'A', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32341', '345', '336', '三中二', '15', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32342', '345', '336', '二中特', '15', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32343', '345', '336', '特串', '15', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '15', '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32344', '345', '336', '特肖', '3', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32345', '345', '336', '四肖', '3', '30000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32346', '345', '336', '五肖', '3', '40000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32347', '345', '336', '六肖', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32348', '345', '336', '一肖', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32349', '345', '336', '尾数', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32350', '345', '336', '家禽野兽', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32351', '345', '336', '五行', '3', '100000', '500000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32352', '345', '336', '二肖', '3', '20000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32353', '345', '336', '三肖', '3', '30000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32354', '345', '336', '半半波', '3', '5000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32355', '345', '336', '头数', '3', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32356', '345', '336', '正特尾数', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32357', '345', '336', '七色波', '3', '5000', '10000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32358', '345', '336', '正肖', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32359', '345', '336', '尾大尾小', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32360', '345', '336', '大单小单', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32361', '345', '336', '大双小双', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32362', '345', '336', '连肖', '3', '5000', '30000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32363', '345', '336', '五不中', '3', '30000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32364', '345', '336', '六不中', '3', '30000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32365', '345', '336', '七不中', '3', '20000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32366', '345', '336', '八不中', '3', '20000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32367', '345', '336', '九不中', '3', '20000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32368', '345', '336', '十不中', '3', '10000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32369', '345', '336', '十一不中', '3', '5000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32370', '345', '336', '十二不中', '3', '5000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32371', '345', '336', '四中一', '3', '20000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32372', '345', '336', '五中一', '3', '20000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32373', '345', '336', '六中一', '3', '1000', '1000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32374', '345', '336', '正1-6', '3', '50000', '100000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32375', '345', '336', '二肖连中', '3', '5000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32376', '345', '336', '三肖连中', '3', '4000', '40000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32377', '345', '336', '四肖连中', '3', '3000', '30000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32378', '345', '336', '五肖连中', '3', '2000', '10000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32379', '345', '336', '二肖连不中', '3', '5000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32380', '345', '336', '三肖连不中', '3', '4000', '40000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32381', '345', '336', '四肖连不中', '3', '3000', '30000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32382', '345', '336', '五肖连不中', '3', '2000', '10000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32383', '345', '336', '二尾连中', '3', '5000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32384', '345', '336', '三尾连中', '3', '4000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32385', '345', '336', '四尾连中', '3', '3000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32386', '345', '336', '二尾连不中', '3', '5000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32387', '345', '336', '三尾连不中', '3', '4000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32388', '345', '336', '四尾连不中', '3', '3000', '50000', '0', '1', '297', '298', '299', '336', 'A', '3', '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32452', 'test2', '303', '四尾连不中', '3', '3000', '50000', '0', '0', '279', '282', '0', '0', null, null, '15', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32453', 'test2', '303', '二尾连不中', '3', '5000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32454', 'test2', '303', '三尾连不中', '3', '4000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32455', 'test2', '303', '四尾连中', '3', '3000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32456', 'test2', '303', '五肖连不中', '3', '2000', '10000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32457', 'test2', '303', '二尾连中', '3', '5000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32458', 'test2', '303', '三尾连中', '3', '4000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32459', 'test2', '303', '四肖连不中', '3', '3000', '30000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32460', 'test2', '303', '四肖', '3', '30000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32461', 'test2', '303', '五肖', '3', '40000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32462', 'test2', '303', '六肖', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32463', 'test2', '303', '一肖', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32464', 'test2', '303', '尾数', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32465', 'test2', '303', '家禽野兽', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32466', 'test2', '303', '五行', '3', '100000', '500000', '0', '0', '279', '282', '0', '0', null, null, '4', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32467', 'test2', '303', '二肖', '3', '20000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32468', 'test2', '303', '三肖', '3', '30000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32469', 'test2', '303', '半半波', '3', '5000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32470', 'test2', '303', '头数', '3', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32471', 'test2', '303', '正特尾数', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32472', 'test2', '303', '七色波', '3', '5000', '10000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32473', 'test2', '303', '正肖', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32474', 'test2', '303', '尾大尾小', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32475', 'test2', '303', '大单小单', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32476', 'test2', '303', '大双小双', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32477', 'test2', '303', '连肖', '3', '5000', '30000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32478', 'test2', '303', '五不中', '3', '30000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32479', 'test2', '303', '六不中', '3', '30000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32480', 'test2', '303', '七不中', '3', '20000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32481', 'test2', '303', '八不中', '3', '20000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32482', 'test2', '303', '九不中', '3', '20000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32483', 'test2', '303', '十不中', '3', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32484', 'test2', '303', '十一不中', '3', '5000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32485', 'test2', '303', '十二不中', '3', '5000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32486', 'test2', '303', '四中一', '3', '20000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32487', 'test2', '303', '五中一', '3', '20000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32488', 'test2', '303', '六中一', '3', '1000', '1000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32489', 'test2', '303', '正1-6', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32490', 'test2', '303', '二肖连中', '3', '5000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32491', 'test2', '303', '三肖连中', '3', '4000', '40000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32492', 'test2', '303', '四肖连中', '3', '3000', '30000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32493', 'test2', '303', '五肖连中', '3', '2000', '10000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32494', 'test2', '303', '二肖连不中', '3', '5000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32495', 'test2', '303', '三肖连不中', '3', '4000', '40000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32496', 'test2', '303', '特肖', '3', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32497', 'test2', '303', '特串', '15', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32498', 'test2', '303', '二中特', '15', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32499', 'test2', '303', '三中二', '15', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32500', 'test2', '303', '三全中', '15', '5000', '20000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32501', 'test2', '303', '二全中', '15', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32502', 'test2', '303', '正码过关', '3', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32503', 'test2', '303', '半波 ', '3', '30000', '50000', '0', '0', '279', '282', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32504', 'test2', '303', '色波', '3', '30000', '50000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32505', 'test2', '303', '总和大小', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32506', 'test2', '303', '总和单双', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32507', 'test2', '303', '正B', '3', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32508', 'test2', '303', '正A', '11', '10000', '50000', '0', '0', '279', '282', '0', '0', null, null, '12', '13', '14', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32509', 'test2', '303', '正特', '13', '5000', '10000', '0', '0', '279', '282', '0', '0', null, null, '14', '15', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32510', 'test2', '303', '合数单双 ', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32511', 'test2', '303', '大小', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32512', 'test2', '303', '单双', '3', '50000', '100000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32513', 'test2', '303', '特B ', '3', '5000', '10000', '0', '0', '279', '282', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32514', 'test2', '303', '特A ', '13', '5000', '10000', '0', '0', '279', '282', '0', '0', null, null, '14', '15', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32515', 'huiyuan1', '337', '四尾连不中', '0', '3000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32516', 'huiyuan1', '337', '二尾连不中', '0', '5000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32517', 'huiyuan1', '337', '三尾连不中', '0', '4000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32518', 'huiyuan1', '337', '四尾连中', '0', '3000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32519', 'huiyuan1', '337', '五肖连不中', '0', '2000', '10000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32520', 'huiyuan1', '337', '二尾连中', '0', '5000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32521', 'huiyuan1', '337', '三尾连中', '0', '4000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32522', 'huiyuan1', '337', '四肖连不中', '0', '3000', '30000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32523', 'huiyuan1', '337', '四肖', '0', '30000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32524', 'huiyuan1', '337', '五肖', '0', '40000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32525', 'huiyuan1', '337', '六肖', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32526', 'huiyuan1', '337', '一肖', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32527', 'huiyuan1', '337', '尾数', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32528', 'huiyuan1', '337', '家禽野兽', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32529', 'huiyuan1', '337', '五行', '0', '100000', '500000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32530', 'huiyuan1', '337', '二肖', '0', '20000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32531', 'huiyuan1', '337', '三肖', '0', '30000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32532', 'huiyuan1', '337', '半半波', '0', '5000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32533', 'huiyuan1', '337', '头数', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32534', 'huiyuan1', '337', '正特尾数', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32535', 'huiyuan1', '337', '七色波', '0', '5000', '10000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32536', 'huiyuan1', '337', '正肖', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32537', 'huiyuan1', '337', '尾大尾小', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32538', 'huiyuan1', '337', '大单小单', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32539', 'huiyuan1', '337', '大双小双', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32540', 'huiyuan1', '337', '连肖', '0', '5000', '30000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32541', 'huiyuan1', '337', '五不中', '0', '30000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32542', 'huiyuan1', '337', '六不中', '0', '30000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32543', 'huiyuan1', '337', '七不中', '0', '20000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32544', 'huiyuan1', '337', '八不中', '0', '20000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32545', 'huiyuan1', '337', '九不中', '0', '20000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32546', 'huiyuan1', '337', '十不中', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32547', 'huiyuan1', '337', '十一不中', '0', '5000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32548', 'huiyuan1', '337', '十二不中', '0', '5000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32549', 'huiyuan1', '337', '四中一', '0', '20000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32550', 'huiyuan1', '337', '五中一', '0', '20000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32551', 'huiyuan1', '337', '六中一', '0', '1000', '1000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32552', 'huiyuan1', '337', '正1-6', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32553', 'huiyuan1', '337', '二肖连中', '0', '5000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32554', 'huiyuan1', '337', '三肖连中', '0', '4000', '40000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32555', 'huiyuan1', '337', '四肖连中', '0', '3000', '30000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32556', 'huiyuan1', '337', '五肖连中', '0', '2000', '10000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32557', 'huiyuan1', '337', '二肖连不中', '0', '5000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32558', 'huiyuan1', '337', '三肖连不中', '0', '4000', '40000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32559', 'huiyuan1', '337', '特肖', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32560', 'huiyuan1', '337', '特串', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32561', 'huiyuan1', '337', '二中特', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32562', 'huiyuan1', '337', '三中二', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32563', 'huiyuan1', '337', '三全中', '0', '5000', '20000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32564', 'huiyuan1', '337', '二全中', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32565', 'huiyuan1', '337', '正码过关', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32566', 'huiyuan1', '337', '半波 ', '0', '30000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32567', 'huiyuan1', '337', '色波', '0', '30000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32568', 'huiyuan1', '337', '总和大小', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32569', 'huiyuan1', '337', '总和单双', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32570', 'huiyuan1', '337', '正B', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32571', 'huiyuan1', '337', '正A', '0', '10000', '50000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32572', 'huiyuan1', '337', '正特', '0', '5000', '10000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32573', 'huiyuan1', '337', '合数单双 ', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32574', 'huiyuan1', '337', '大小', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32575', 'huiyuan1', '337', '单双', '0', '50000', '100000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32576', 'huiyuan1', '337', '特B ', '0', '5000', '10000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32577', 'huiyuan1', '337', '特A ', '0', '5000', '10000', '0', '1', '279', '282', '303', '337', 'B', null, '0', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32578', 'zzd1', '304', '四尾连不中', '3', '3000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32579', 'zzd1', '304', '二尾连不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32580', 'zzd1', '304', '三尾连不中', '3', '4000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32581', 'zzd1', '304', '四尾连中', '3', '3000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32582', 'zzd1', '304', '三尾连中', '3', '4000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32583', 'zzd1', '304', '二尾连中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32584', 'zzd1', '304', '五肖连不中', '3', '2000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32585', 'zzd1', '304', '四肖连不中', '3', '3000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32586', 'zzd1', '304', '三肖连不中', '3', '4000', '40000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32587', 'zzd1', '304', '二肖连不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32588', 'zzd1', '304', '五肖连中', '3', '2000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32589', 'zzd1', '304', '三肖连中', '3', '4000', '40000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32590', 'zzd1', '304', '四肖连中', '3', '3000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32591', 'zzd1', '304', '二肖连中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32592', 'zzd1', '304', '正1-6', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32593', 'zzd1', '304', '六中一', '3', '1000', '1000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32594', 'zzd1', '304', '五中一', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32595', 'zzd1', '304', '四中一', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32596', 'zzd1', '304', '十二不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32597', 'zzd1', '304', '十一不中', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32598', 'zzd1', '304', '十不中', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32599', 'zzd1', '304', '九不中', '3', '20000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32600', 'zzd1', '304', '八不中', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32601', 'zzd1', '304', '七不中', '3', '20000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32602', 'zzd1', '304', '六不中', '3', '30000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32603', 'zzd1', '304', '五不中', '3', '30000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32604', 'zzd1', '304', '连肖', '3', '5000', '30000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32605', 'zzd1', '304', '大双小双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32606', 'zzd1', '304', '大单小单', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32607', 'zzd1', '304', '尾大尾小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32608', 'zzd1', '304', '六肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32609', 'zzd1', '304', '一肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32610', 'zzd1', '304', '尾数', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32611', 'zzd1', '304', '家禽野兽', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32612', 'zzd1', '304', '五行', '3', '100000', '500000', '0', '0', '279', '0', '0', '0', null, null, '4', '0', '0', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32613', 'zzd1', '304', '二肖', '3', '20000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32614', 'zzd1', '304', '三肖', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32615', 'zzd1', '304', '半半波', '3', '5000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32616', 'zzd1', '304', '头数', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32617', 'zzd1', '304', '正特尾数', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32618', 'zzd1', '304', '七色波', '3', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32619', 'zzd1', '304', '正肖', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32620', 'zzd1', '304', '五肖', '3', '40000', '100000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32621', 'zzd1', '304', '四肖', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32622', 'zzd1', '304', '特肖', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32623', 'zzd1', '304', '特串', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32624', 'zzd1', '304', '二中特', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32625', 'zzd1', '304', '三中二', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32626', 'zzd1', '304', '三全中', '15', '5000', '20000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32627', 'zzd1', '304', '二全中', '15', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '15', '15', '15', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32628', 'zzd1', '304', '正码过关', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32629', 'zzd1', '304', '半波 ', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '3', '3', '3', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32630', 'zzd1', '304', '色波', '3', '30000', '50000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32631', 'zzd1', '304', '总和大小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32632', 'zzd1', '304', '总和单双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32633', 'zzd1', '304', '正B', '3', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32634', 'zzd1', '304', '正A', '11', '10000', '50000', '0', '0', '279', '0', '0', '0', null, null, '12', '13', '14', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32635', 'zzd1', '304', '正特', '13', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '14', '15', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32636', 'zzd1', '304', '合数单双 ', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32637', 'zzd1', '304', '大小', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32638', 'zzd1', '304', '单双', '3', '50000', '100000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32639', 'zzd1', '304', '特B ', '3', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '4', '5', '6', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32640', 'zzd1', '304', '特A ', '13', '5000', '10000', '0', '0', '279', '0', '0', '0', null, null, '14', '15', '16', null, '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32767', 'gchen', '305', '特A ', '13', '20000', '30000', '4', null, null, null, null, null, null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32768', 'gchen', '305', '特B ', '3', '20000', '30000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32769', 'gchen', '305', '单双', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32770', 'gchen', '305', '大小', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32771', 'gchen', '305', '合数单双 ', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32772', 'gchen', '305', '正特', '13', '5000', '10000', '4', null, null, null, null, null, null, null, '14', '15', '16', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32773', 'gchen', '305', '正A', '11', '10000', '50000', '4', null, null, null, null, null, null, null, '12', '13', '14', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32774', 'gchen', '305', '正B', '3', '10000', '50000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32775', 'gchen', '305', '总和单双', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32776', 'gchen', '305', '总和大小', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32777', 'gchen', '305', '色波', '3', '30000', '50000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32778', 'gchen', '305', '半波 ', '3', '30000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32779', 'gchen', '305', '正码过关', '3', '10000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32780', 'gchen', '305', '五行', '3', '100000', '500000', '4', null, null, null, null, null, null, null, '4', '0', '0', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32781', 'gchen', '305', '二肖', '3', '20000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32782', 'gchen', '305', '三肖', '3', '30000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32783', 'gchen', '305', '二全中', '15', '10000', '50000', '4', null, null, null, null, null, null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32784', 'gchen', '305', '三全中', '15', '5000', '20000', '4', null, null, null, null, null, null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32785', 'gchen', '305', '三中二', '15', '10000', '50000', '4', null, null, null, null, null, null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32786', 'gchen', '305', '二中特', '15', '10000', '50000', '4', null, null, null, null, null, null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32787', 'gchen', '305', '特串', '15', '10000', '50000', '4', null, null, null, null, null, null, null, '15', '15', '15', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32788', 'gchen', '305', '特肖', '3', '10000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32789', 'gchen', '305', '四肖', '3', '30000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32790', 'gchen', '305', '五肖', '3', '40000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32791', 'gchen', '305', '六肖', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32792', 'gchen', '305', '一肖', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32793', 'gchen', '305', '尾数', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32794', 'gchen', '305', '家禽野兽', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32795', 'gchen', '305', '半半波', '3', '5000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32796', 'gchen', '305', '头数', '3', '10000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32797', 'gchen', '305', '正特尾数', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32798', 'gchen', '305', '七色波', '3', '5000', '10000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32799', 'gchen', '305', '正肖', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32800', 'gchen', '305', '尾大尾小', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32801', 'gchen', '305', '大单小单', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32802', 'gchen', '305', '大双小双', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '4', '5', '6', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32803', 'gchen', '305', '连肖', '3', '5000', '30000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32804', 'gchen', '305', '五不中', '3', '30000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32805', 'gchen', '305', '正1-6', '3', '50000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32806', 'gchen', '305', '二肖连中', '3', '5000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32807', 'gchen', '305', '三肖连中', '3', '4000', '40000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32808', 'gchen', '305', '四肖连中', '3', '3000', '30000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32809', 'gchen', '305', '二肖连不中', '3', '5000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32810', 'gchen', '305', '六不中', '3', '30000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32811', 'gchen', '305', '三肖连不中', '3', '4000', '40000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32812', 'gchen', '305', '四肖连不中', '3', '3000', '30000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32813', 'gchen', '305', '二尾连中', '3', '5000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32814', 'gchen', '305', '三尾连中', '3', '4000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32815', 'gchen', '305', '四尾连中', '3', '3000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32816', 'gchen', '305', '二尾连不中', '3', '5000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32817', 'gchen', '305', '三尾连不中', '3', '4000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32818', 'gchen', '305', '四尾连不中', '3', '3000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32819', 'gchen', '305', '五肖连中', '3', '2000', '10000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32820', 'gchen', '305', '五肖连不中', '3', '2000', '10000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32821', 'gchen', '305', '七不中', '3', '20000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32822', 'gchen', '305', '八不中', '3', '20000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32823', 'gchen', '305', '九不中', '3', '20000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32824', 'gchen', '305', '十不中', '3', '10000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32825', 'gchen', '305', '十一不中', '3', '5000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32826', 'gchen', '305', '十二不中', '3', '5000', '50000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32827', 'gchen', '305', '四中一', '3', '20000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32828', 'gchen', '305', '五中一', '3', '20000', '100000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');
INSERT INTO `ka_quota` VALUES ('32829', 'gchen', '305', '六中一', '3', '1000', '1000', '4', null, null, null, null, null, null, null, '3', '3', '3', '六合彩', '0', '0', '0');

-- ----------------------------
-- Table structure for `ka_sxnumber`
-- ----------------------------
DROP TABLE IF EXISTS `ka_sxnumber`;
CREATE TABLE `ka_sxnumber` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `m_number` varchar(250) DEFAULT NULL,
  `sx` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id` (`ID`),
  KEY `sx` (`sx`),
  KEY `m_number` (`m_number`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ka_sxnumber
-- ----------------------------
INSERT INTO `ka_sxnumber` VALUES ('1', '09,21,33,45', '鼠');
INSERT INTO `ka_sxnumber` VALUES ('2', '07,19,31,43', '虎');
INSERT INTO `ka_sxnumber` VALUES ('3', '05,17,29,41', '龙');
INSERT INTO `ka_sxnumber` VALUES ('4', '03,15,27,39', '马');
INSERT INTO `ka_sxnumber` VALUES ('5', '01,13,25,37,49', '猴');
INSERT INTO `ka_sxnumber` VALUES ('6', '11,23,35,47', '狗');
INSERT INTO `ka_sxnumber` VALUES ('7', '08,20,32,44', '牛');
INSERT INTO `ka_sxnumber` VALUES ('8', '06,18,30,42', '兔');
INSERT INTO `ka_sxnumber` VALUES ('9', '04,16,28,40', '蛇');
INSERT INTO `ka_sxnumber` VALUES ('10', '02,14,26,38', '羊');
INSERT INTO `ka_sxnumber` VALUES ('11', '12,24,36,48', '鸡');
INSERT INTO `ka_sxnumber` VALUES ('12', '10,22,34,46', '猪');
INSERT INTO `ka_sxnumber` VALUES ('13', '1,7,13,19,23,29,35,45', '红单');
INSERT INTO `ka_sxnumber` VALUES ('14', '2,8,12,18,24,30,34,40,46', '红双');
INSERT INTO `ka_sxnumber` VALUES ('15', '29,30,34,35,40,45,46', '红大');
INSERT INTO `ka_sxnumber` VALUES ('16', '1,2,7,8,12,13,18,19,23,24', '红小');
INSERT INTO `ka_sxnumber` VALUES ('17', '5,11,17,21,27,33,39,43,49', '绿单');
INSERT INTO `ka_sxnumber` VALUES ('18', '6,16,22,28,32,38,44', '绿双');
INSERT INTO `ka_sxnumber` VALUES ('19', '27,28,32,33,38,39,43,44,49', '绿大');
INSERT INTO `ka_sxnumber` VALUES ('20', '5,6,11,16,17,21,22', '绿小');
INSERT INTO `ka_sxnumber` VALUES ('21', '3,9,15,25,31,37,41,47', '蓝单');
INSERT INTO `ka_sxnumber` VALUES ('22', '4,10,14,20,26,36,42,48', '蓝双');
INSERT INTO `ka_sxnumber` VALUES ('23', '25,26,31,36,37,41,42,47,48', '蓝大');
INSERT INTO `ka_sxnumber` VALUES ('24', '3,4,9,10,14,15,20', '蓝小');
INSERT INTO `ka_sxnumber` VALUES ('25', '02,03,16,17,24,25,32,33,46,47', '金');
INSERT INTO `ka_sxnumber` VALUES ('26', '06,07,14,15,28,29,36,37,44,45', '木');
INSERT INTO `ka_sxnumber` VALUES ('27', '04,05,12,13,20,21,34,35,42,43', '水');
INSERT INTO `ka_sxnumber` VALUES ('28', '01,08,09,22,23,30,31,38,39', '火');
INSERT INTO `ka_sxnumber` VALUES ('29', '10,11,18,19,26,27,40,41,48,49', '土');
INSERT INTO `ka_sxnumber` VALUES ('30', '1,7,23,29,45,12,18,30,34', '红合单');
INSERT INTO `ka_sxnumber` VALUES ('31', '13,19,35,2,8,24,40,46', '红合双');
INSERT INTO `ka_sxnumber` VALUES ('32', '5,16,21,27,32,38,43,49', '绿合单');
INSERT INTO `ka_sxnumber` VALUES ('33', '6,11,17,22,28,33,39,44', '绿合双');
INSERT INTO `ka_sxnumber` VALUES ('34', '3,9,25,41,47,10,14,36', '蓝合单');
INSERT INTO `ka_sxnumber` VALUES ('35', '15,31,37,4,20,26,42,48', '蓝合双');
INSERT INTO `ka_sxnumber` VALUES ('36', '29,35,45', '红大单');
INSERT INTO `ka_sxnumber` VALUES ('37', '30,34,40,46', '红大双');
INSERT INTO `ka_sxnumber` VALUES ('38', '01,07,13,19,23', '红小单');
INSERT INTO `ka_sxnumber` VALUES ('39', '02,08,12,18,24', '红小双');
INSERT INTO `ka_sxnumber` VALUES ('40', '27,33,39,43,49', '绿大单');
INSERT INTO `ka_sxnumber` VALUES ('41', '28,32,38,44', '绿大双');
INSERT INTO `ka_sxnumber` VALUES ('42', '05,11,17,21', '绿小单');
INSERT INTO `ka_sxnumber` VALUES ('43', '06,16,22', '绿小双');
INSERT INTO `ka_sxnumber` VALUES ('44', '25,31,37,41,47', '蓝大单');
INSERT INTO `ka_sxnumber` VALUES ('45', '26,36,42,48', '蓝大双');
INSERT INTO `ka_sxnumber` VALUES ('46', '03,09,15', '蓝小单');
INSERT INTO `ka_sxnumber` VALUES ('47', '04,10,14,20', '蓝小双');
INSERT INTO `ka_sxnumber` VALUES ('48', '1,3,5,7,9,11,13,15,17,19,21,23', '小单');
INSERT INTO `ka_sxnumber` VALUES ('64', '25,27,29,31,33,35,37,39,41,43,45,47,49', '大单');
INSERT INTO `ka_sxnumber` VALUES ('66', '26,28,30,32,34,36,38,40,42,44,46,48', '大双');
INSERT INTO `ka_sxnumber` VALUES ('67', '2,4,6,8,10,12,14,16,18,20,22', '小双');
INSERT INTO `ka_sxnumber` VALUES ('71', '01,11,21,31,41', '1');
INSERT INTO `ka_sxnumber` VALUES ('72', '02,12,22,32,42', '2');
INSERT INTO `ka_sxnumber` VALUES ('73', '03,13,23,33,43', '3');
INSERT INTO `ka_sxnumber` VALUES ('74', '04,14,24,34,44', '4');
INSERT INTO `ka_sxnumber` VALUES ('75', '05,15,25,35,45', '5');
INSERT INTO `ka_sxnumber` VALUES ('76', '06,16,26,36,46', '6');
INSERT INTO `ka_sxnumber` VALUES ('77', '07,17,27,37,47', '7');
INSERT INTO `ka_sxnumber` VALUES ('78', '08,18,28,38,48', '8');
INSERT INTO `ka_sxnumber` VALUES ('79', '09,19,29,39,49', '9');
INSERT INTO `ka_sxnumber` VALUES ('80', '10,20,30,40', '0');

-- ----------------------------
-- Table structure for `ka_tan`
-- ----------------------------
DROP TABLE IF EXISTS `ka_tan`;
CREATE TABLE `ka_tan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) DEFAULT NULL COMMENT '下注之后的订单号(由randStr函数生成)',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `kithe` varchar(50) DEFAULT NULL COMMENT '期数',
  `adddate` datetime DEFAULT NULL COMMENT '新增时间',
  `class1` varchar(50) DEFAULT NULL COMMENT '顶级下注类型',
  `class2` varchar(50) DEFAULT NULL COMMENT '二级下注类型',
  `class3` varchar(50) DEFAULT NULL COMMENT '三级下注类型',
  `rate` double DEFAULT NULL COMMENT '赔率',
  `sum_m` double DEFAULT NULL COMMENT '下注金额',
  `user_ds` double DEFAULT NULL COMMENT '对应ka_quota 表下的yg/ygb/ybc/ygd(和会员等级有关)字段  username等于mem表的kauser',
  `dai_ds` double DEFAULT '0',
  `zong_ds` double DEFAULT NULL COMMENT '总代 佣金',
  `guan_ds` double DEFAULT NULL COMMENT '股东佣金',
  `guan1_ds` double DEFAULT NULL,
  `dai_zc` double DEFAULT NULL COMMENT '关联 mem表的dan_zc  代理占成',
  `zong_zc` double DEFAULT NULL COMMENT '关联 mem表的zong_zc 总代理占成',
  `guan_zc` double DEFAULT NULL COMMENT '关联 mem表的guan_zc',
  `guan1_zc` double DEFAULT NULL,
  `dagu_zc` double DEFAULT NULL COMMENT '关联 mem表的dagu_zc',
  `bm` int(11) DEFAULT NULL,
  `dai` varchar(50) DEFAULT NULL COMMENT '关联 mem表的dan',
  `zong` varchar(50) DEFAULT NULL COMMENT '关联 mem表的zong',
  `guan` varchar(50) DEFAULT NULL COMMENT '关联 mem表的guan',
  `guan1` varchar(50) DEFAULT NULL,
  `lx` int(11) DEFAULT '0' COMMENT '0会员下单 1补货',
  `memid` int(11) DEFAULT '0' COMMENT '关联 mem表的id',
  `danid` int(11) DEFAULT '0' COMMENT '关联 mem表的danid',
  `zongid` int(11) DEFAULT '0' COMMENT '关联 mem表的zongid',
  `guanid` int(11) DEFAULT '0' COMMENT '关联 mem表的guanid',
  `guanid1` int(11) DEFAULT NULL,
  `ly` int(11) DEFAULT '0',
  `rate2` double DEFAULT '0',
  `abcd` varchar(50) DEFAULT 'A' COMMENT '直接写死A?',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `num` (`num`),
  KEY `username` (`username`),
  KEY `kithe` (`kithe`),
  KEY `adddate` (`adddate`),
  KEY `class1` (`class1`),
  KEY `class2` (`class2`),
  KEY `class3` (`class3`),
  KEY `rate` (`rate`),
  KEY `sum_m` (`sum_m`),
  KEY `user_ds` (`user_ds`),
  KEY `zong_ds` (`zong_ds`),
  KEY `guan_ds` (`guan_ds`),
  KEY `dai_zc` (`dai_zc`),
  KEY `zong_zc` (`zong_zc`),
  KEY `guan_zc` (`guan_zc`),
  KEY `dagu_zc` (`dagu_zc`),
  KEY `bm` (`bm`),
  KEY `dai` (`dai`),
  KEY `zong` (`zong`),
  KEY `guan` (`guan`),
  KEY `lx` (`lx`),
  KEY `dai_ds` (`dai_ds`),
  KEY `danid` (`danid`),
  KEY `zongid` (`zongid`),
  KEY `guanid` (`guanid`),
  KEY `ly` (`ly`),
  KEY `rate2` (`rate2`),
  KEY `abcd` (`abcd`)
) ENGINE=MyISAM AUTO_INCREMENT=2836 DEFAULT CHARSET=utf8 COMMENT='用户下注记录表';

-- ----------------------------
-- Records of ka_tan
-- ----------------------------
INSERT INTO `ka_tan` VALUES ('2178', '438692690170', '3', '2016070', '2016-06-23 16:34:25', '特码', '特B', '22', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2179', '719338845532', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '27', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2180', '788026855395', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '28', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2181', '359003880832', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '32', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2182', '470764033688', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '33', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2183', '521341291087', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '38', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2184', '346257122493', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '39', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2185', '517850116206', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '43', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2186', '007425820051', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '44', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2187', '950854560187', '3', '2016070', '2016-06-23 16:34:26', '特码', '特B', '49', '46', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2188', '858486285901', '3', '2016070', '2016-06-23 16:53:02', '生肖', '特肖', '鼠', '10.2', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2189', '291758565361', '3', '2016070', '2016-06-23 16:53:02', '生肖', '特肖', '虎', '10.2', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2190', '048620888667', '3', '2016070', '2016-06-23 16:53:02', '生肖', '特肖', '龙', '10.2', '6', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2191', '432004801858', '3', '2016070', '2016-06-23 16:55:14', '特码', '特A', '26', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2192', '420816345333', '3', '2016070', '2016-06-23 16:55:14', '特码', '特A', '28', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2193', '221672262054', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '30', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2194', '339094787123', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '32', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2195', '565319355154', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '34', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2196', '793769818101', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '36', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2197', '596970419767', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '38', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2198', '033909100314', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '40', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2199', '119326081103', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '42', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2200', '458977454654', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '44', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2201', '145589645610', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '46', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2202', '219285735397', '3', '2016070', '2016-06-23 16:55:15', '特码', '特A', '48', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2203', '870032783339', '3', '2016070', '2016-06-23 17:05:05', '特码', '特A', '1', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2204', '494874794781', '3', '2016070', '2016-06-23 17:05:05', '特码', '特A', '2', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2205', '162200774099', '3', '2016070', '2016-06-23 17:05:05', '特码', '特A', '7', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2206', '905052200869', '3', '2016070', '2016-06-23 17:05:05', '特码', '特A', '8', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2207', '744500154673', '3', '2016070', '2016-06-23 17:05:05', '特码', '特A', '12', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2208', '999153936497', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '13', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2209', '933902850246', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '18', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2210', '839126152304', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '19', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2211', '456939696575', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '23', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2212', '195152338485', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '24', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2213', '034372280840', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '29', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2214', '197565597785', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '30', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2215', '639258634141', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '34', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2216', '395571158097', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '35', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2217', '833460138480', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '40', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2218', '632590743640', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '45', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2219', '897587356404', '3', '2016070', '2016-06-23 17:05:06', '特码', '特A', '46', '41', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2220', '995963227413', '3', '2016070', '2016-06-23 17:12:50', '特码', '特A', '1', '41', '3300', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2221', '569387266061', '3', '2016070', '2016-06-23 17:24:10', '特码', '特A', '2', '41', '50', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2222', '551450445495', '3', '2016070', '2016-06-23 17:24:10', '特码', '特A', '3', '41', '50', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2223', '937418357188', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '4', '41', '40', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2224', '034520900135', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '5', '41', '300', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2225', '930445168968', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '6', '41', '200', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2226', '469447386424', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '7', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2227', '880869944871', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '8', '41', '88', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2228', '475277018728', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '9', '41', '77', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2229', '874830246005', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '10', '41', '66', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2230', '189953128568', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '11', '41', '2', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2231', '515935188767', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '12', '41', '3', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2232', '516824314497', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '13', '41', '4', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2233', '381146378713', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '15', '41', '5', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2234', '754951897110', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '17', '41', '55', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2235', '207904497449', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '18', '41', '22', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2236', '149128817628', '3', '2016070', '2016-06-23 17:24:11', '特码', '特A', '19', '41', '33', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2237', '482392272169', '3', '2016070', '2016-06-23 17:24:12', '特码', '特A', '20', '41', '2', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2238', '602841423646', '3', '2016070', '2016-06-23 17:24:12', '特码', '特A', '23', '41', '25', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2239', '306189502243', '3', '2016070', '2016-06-23 17:24:39', '特码', '特B', '13', '46', '3878', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2240', '452694749982', '3', '2016071', '2016-06-23 18:15:01', '特码', '特A', '1', '40.645', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2241', '509778042326', '3', '2016071', '2016-06-23 18:15:01', '特码', '特A', '2', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2242', '107568370003', '3', '2016071', '2016-06-23 18:15:01', '特码', '特A', '7', '40.885', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2243', '880098251081', '3', '2016071', '2016-06-23 18:15:01', '特码', '特A', '8', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2244', '516543161492', '3', '2016071', '2016-06-23 18:15:01', '特码', '特A', '12', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2245', '333864043843', '3', '2016071', '2016-06-23 18:15:01', '特码', '特A', '13', '40.615', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2246', '706239975608', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '18', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2247', '340857346487', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '19', '40.9', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2248', '502547654489', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '23', '40.9', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2249', '108026822869', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '24', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2250', '157730982808', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '29', '40.9', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2251', '403627500610', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '30', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2252', '474317601700', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '34', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2253', '087096062080', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '35', '40.9', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2254', '916831097442', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '40', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2255', '439128946826', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '45', '40.9', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2256', '694167920171', '3', '2016071', '2016-06-23 18:15:02', '特码', '特A', '46', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2257', '082756425724', '3', '2016072', '2016-06-23 23:53:47', '特码', '特A', '3', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2258', '013331240008', '3', '2016072', '2016-06-23 23:53:47', '特码', '特A', '4', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2259', '898740135901', '3', '2016072', '2016-06-23 23:53:47', '特码', '特A', '9', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2260', '680293549344', '3', '2016072', '2016-06-23 23:53:47', '特码', '特A', '10', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2261', '386443884409', '3', '2016072', '2016-06-23 23:53:47', '特码', '特A', '14', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2262', '841848620434', '3', '2016072', '2016-06-23 23:53:47', '特码', '特A', '15', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2263', '528039332523', '3', '2016072', '2016-06-23 23:53:47', '特码', '特A', '20', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2264', '218212027916', '3', '2016072', '2016-06-23 23:53:47', '特码', '特A', '25', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2265', '348176455802', '3', '2016072', '2016-06-23 23:53:48', '特码', '特A', '26', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2266', '401607768827', '3', '2016072', '2016-06-23 23:53:48', '特码', '特A', '31', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2267', '820602114147', '3', '2016072', '2016-06-23 23:53:48', '特码', '特A', '36', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2268', '334241816367', '3', '2016072', '2016-06-23 23:53:48', '特码', '特A', '37', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2269', '545755758693', '3', '2016072', '2016-06-23 23:53:48', '特码', '特A', '41', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2270', '793783994257', '3', '2016072', '2016-06-23 23:53:48', '特码', '特A', '42', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2271', '436470433269', '3', '2016072', '2016-06-23 23:53:48', '特码', '特A', '47', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2272', '609771003184', '3', '2016072', '2016-06-23 23:53:48', '特码', '特A', '48', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2273', '083032253240', '3', '2016072', '2016-06-23 23:56:54', '过关', '正码1,正码1,正码2,正码2,正码3,正码3,', '单,1.93,红波,2.65,单,1.93,红波,2.65,单,1.93,红波,2.65,', '133.78', '30', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2274', '314814176454', '3', '2016072', '2016-06-24 16:51:22', '不中', '五不中', '1,3,5,6,8', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2275', '220638972395', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,6,9', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2276', '673661093485', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,6,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2277', '416575506658', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,6,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2278', '824225590064', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,6,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2279', '766686643716', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,6,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2280', '241256514583', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,8,9', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2281', '999998829171', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,8,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2282', '734750026591', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,8,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2283', '828911818482', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,8,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2284', '310485827926', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,8,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2285', '654241592559', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2286', '211651028694', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2287', '335384568507', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2288', '568978307063', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2289', '371530290279', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2290', '114323003146', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2291', '348503012251', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2292', '682826135533', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2293', '065270998532', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2294', '805050252935', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,5,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2295', '551870223258', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,6,8,9', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2296', '463277468305', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,6,8,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2297', '269698025956', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,6,8,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2298', '361000646583', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,6,8,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2299', '449192725559', '3', '2016072', '2016-06-24 16:51:23', '不中', '五不中', '1,3,6,8,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2300', '894909763857', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2301', '575217466539', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2302', '712413450174', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2303', '600439562292', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2304', '434736140075', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2305', '469490970986', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2306', '168377144582', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2307', '087938044434', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2308', '779175109251', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2309', '560199570863', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,6,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2310', '020246376893', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2311', '256732453096', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2312', '794271796882', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2313', '900518540561', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2314', '940470619862', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2315', '320867317851', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2316', '559077580916', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2317', '628228999680', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2318', '693369844855', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2319', '208326447978', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,8,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2320', '817891262550', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2321', '995140169910', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2322', '701915841994', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2323', '465761012155', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2324', '504165985070', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2325', '821098687600', '3', '2016072', '2016-06-24 16:51:24', '不中', '五不中', '1,3,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2326', '446234626644', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,3,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2327', '012482963638', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,3,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2328', '610277968284', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,3,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2329', '316250736170', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,3,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2330', '225222669427', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,8,9', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2331', '616586150935', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,8,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2332', '323858206407', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,8,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2333', '985603364988', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,8,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2334', '333095012558', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,8,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2335', '258211631684', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2336', '525017346875', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2337', '301539113784', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2338', '142165550207', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2339', '945211929765', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2340', '344748922677', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2341', '330581587763', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2342', '997583310468', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2343', '091202058824', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2344', '338639667493', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,6,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2345', '284872064107', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,8,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2346', '155249159580', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,8,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2347', '390207009112', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,8,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2348', '018030152019', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,8,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2349', '715707006383', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,8,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2350', '806653774777', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,8,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2351', '849007347738', '3', '2016072', '2016-06-24 16:51:25', '不中', '五不中', '1,5,8,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2352', '098184757281', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,8,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2353', '181161017050', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,8,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2354', '095979393461', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,8,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2355', '302516805931', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2356', '653650339017', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2357', '957007480879', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2358', '645678158852', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2359', '604029353351', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2360', '225234515330', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2361', '068167844281', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2362', '582452277019', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2363', '997366293156', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2364', '901341125063', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,5,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2365', '042057305738', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2366', '433151601795', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2367', '720994597550', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2368', '498609411152', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2369', '930782022019', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2370', '302971016127', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2371', '024820128423', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2372', '818984136528', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2373', '946416364760', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2374', '654803665814', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,8,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2375', '578326005036', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2376', '083785059284', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2377', '475138399384', '3', '2016072', '2016-06-24 16:51:26', '不中', '五不中', '1,6,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2378', '465355087663', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,6,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2379', '297245746417', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,6,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2380', '728499014084', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,6,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2381', '478561513916', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,6,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2382', '689552481592', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,6,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2383', '028499945791', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,6,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2384', '660287836263', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,6,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2385', '315877285461', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2386', '086547456249', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2387', '097618682594', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2388', '548052924481', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2389', '582729777898', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2390', '643354838506', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2391', '060888521032', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2392', '499956070936', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2393', '950444465809', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2394', '705691498275', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,8,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2395', '972666410854', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,9,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2396', '013934467405', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,9,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2397', '696805409638', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,9,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2398', '406355384225', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,9,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2399', '523647906229', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '1,10,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2400', '608299680823', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '3,5,6,8,9', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2401', '572883546640', '3', '2016072', '2016-06-24 16:51:27', '不中', '五不中', '3,5,6,8,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2402', '531663559291', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,8,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2403', '890824509315', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,8,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2404', '108732336838', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,8,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2405', '430211170377', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2406', '752892175270', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2407', '958900921418', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2408', '989617084979', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2409', '005487715110', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2410', '601249091039', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2411', '731579628626', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2412', '198292705958', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2413', '296457529576', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2414', '871783264680', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,6,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2415', '617125180118', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2416', '639226774681', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2417', '668056335622', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2418', '711707014612', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2419', '931053356978', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2420', '799162967834', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2421', '589915353598', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2422', '419372967568', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2423', '074051910257', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2424', '723091480786', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,8,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2425', '465082432593', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2426', '827074635220', '3', '2016072', '2016-06-24 16:51:28', '不中', '五不中', '3,5,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2427', '540805001830', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,5,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2428', '951152462125', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,5,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2429', '078972491389', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,5,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2430', '020857357764', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,5,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2431', '033094941135', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,5,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2432', '585901459882', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,5,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2433', '730469442993', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,5,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2434', '528654859747', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,5,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2435', '910618394714', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2436', '086374810633', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2437', '417645973527', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2438', '674054334523', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2439', '780115201977', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2440', '234937317999', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2441', '107491763778', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2442', '444460297115', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2443', '094239033796', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2444', '201824829656', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,8,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2445', '527922620518', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2446', '690801052522', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2447', '866037818538', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2448', '720352845579', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2449', '903018676387', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2450', '116721092408', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2451', '126218772787', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2452', '874745003508', '3', '2016072', '2016-06-24 16:51:29', '不中', '五不中', '3,6,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2453', '258683344154', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,6,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2454', '396857142328', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,6,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2455', '720313692354', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2456', '486020398719', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2457', '334625159785', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2458', '191864927879', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2459', '330987342963', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2460', '867447217172', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2461', '057873028836', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2462', '661030915751', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2463', '015627882547', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2464', '536607558463', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,8,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2465', '273839464731', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,9,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2466', '614511509977', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,9,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2467', '328475734750', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,9,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2468', '715858471654', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,9,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2469', '502194062229', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '3,10,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2470', '268946894679', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,9,10', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2471', '170502709876', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,9,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2472', '592041702330', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,9,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2473', '952441213310', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,9,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2474', '593099747364', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2475', '300817007134', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2476', '042426079333', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2477', '858839745070', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2478', '881134139384', '3', '2016072', '2016-06-24 16:51:30', '不中', '五不中', '5,6,8,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2479', '498148560038', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,8,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2480', '327770707499', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2481', '658638691758', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2482', '962249624110', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2483', '683007821823', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2484', '509523755801', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2485', '605631733781', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2486', '142184645617', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2487', '697312351696', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2488', '430955133348', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2489', '267118974875', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,6,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2490', '341356060343', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2491', '318889472979', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2492', '688250042653', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2493', '634599564533', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2494', '558574926590', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2495', '523452569450', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2496', '262980142993', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2497', '077340575756', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2498', '304360837444', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2499', '295771832868', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,8,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2500', '928627601662', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,9,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2501', '298453397938', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,9,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2502', '965128267863', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,9,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2503', '194619398329', '3', '2016072', '2016-06-24 16:51:31', '不中', '五不中', '5,9,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2504', '258340796900', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '5,10,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2505', '651390638461', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,9,10,17', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2506', '167631385596', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,9,10,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2507', '600708725349', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,9,10,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2508', '418140054046', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,9,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2509', '102964277651', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,9,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2510', '356194393351', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,9,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2511', '024384186014', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2512', '263984625996', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2513', '696959574480', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2514', '754588771859', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,8,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2515', '232598542680', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,9,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2516', '524022226433', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,9,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2517', '212548756430', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,9,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2518', '742433110774', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,9,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2519', '723994613479', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '6,10,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2520', '397426977620', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '8,9,10,17,19', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2521', '040904211898', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '8,9,10,17,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2522', '773623138898', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '8,9,10,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2523', '922212346694', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '8,9,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2524', '425703014600', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '8,10,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2525', '619377596172', '3', '2016072', '2016-06-24 16:51:32', '不中', '五不中', '9,10,17,19,20', '1.9', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2526', '714576088096', '3', '2016072', '2016-06-24 16:52:24', '连码', '二中特', '31,32', '30', '10', '0', '15', '15', '15', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '35', 'A');
INSERT INTO `ka_tan` VALUES ('2527', '275158331068', '3', '2016072', '2016-06-24 16:52:24', '连码', '二中特', '31,33', '30', '10', '0', '15', '15', '15', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '35', 'A');
INSERT INTO `ka_tan` VALUES ('2528', '879062720515', '3', '2016072', '2016-06-24 16:52:24', '连码', '二中特', '32,33', '30', '10', '0', '15', '15', '15', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '35', 'A');
INSERT INTO `ka_tan` VALUES ('2529', '091159260881', '3', '2016072', '2016-06-24 16:52:37', '尾数连', '二尾连中', '1,2', '3.15', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2530', '529917424755', '3', '2016072', '2016-06-24 16:52:37', '尾数连', '二尾连中', '1,6', '3.15', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2531', '930096978926', '3', '2016072', '2016-06-24 16:52:37', '尾数连', '二尾连中', '1,7', '3.15', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2532', '608627311862', '3', '2016072', '2016-06-24 16:52:37', '尾数连', '二尾连中', '2,6', '3.15', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2533', '378963779532', '3', '2016072', '2016-06-24 16:52:37', '尾数连', '二尾连中', '2,7', '3.15', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2534', '964012776160', '3', '2016072', '2016-06-24 16:52:37', '尾数连', '二尾连中', '6,7', '3.15', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2535', '055183448958', '3', '2016072', '2016-06-24 16:52:49', '生肖连', '二肖连中', '鼠,虎', '3.4', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2536', '599034601855', '3', '2016072', '2016-06-24 16:53:09', '生肖', '一肖', '鼠', '1.9', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2537', '393873754393', '3', '2016072', '2016-06-24 16:53:09', '生肖', '一肖', '虎', '1.9', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2538', '613408079188', '3', '2016072', '2016-06-24 16:53:09', '生肖', '一肖', '龙', '1.9', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2539', '386522948022', '3', '2016072', '2016-06-24 16:53:25', '过关', '正码1,正码1,', '双,1.93,绿波,2.75,', '5.3', '5', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2540', '379906089463', '3', '2016072', '2016-06-24 16:53:34', '正1-6', '正码1', '大', '1.92', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2541', '337713392552', '3', '2016072', '2016-06-24 16:53:35', '正1-6', '正码1', '小', '1.92', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2542', '113046756900', '3', '2016072', '2016-06-24 16:53:35', '正1-6', '正码1', '单', '1.92', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2543', '933482577153', '3', '2016072', '2016-06-24 16:53:45', '正特', '正1特', '11', '42', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2544', '192654782428', '3', '2016072', '2016-06-24 16:53:45', '正特', '正1特', '12', '42', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2545', '134607194131', '3', '2016072', '2016-06-24 16:54:03', '正码', '正A', '1', '7', '10', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2546', '906436617187', '3', '2016072', '2016-06-24 16:54:03', '正码', '正A', '11', '7', '10', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2547', '136645280015', '3', '2016072', '2016-06-24 16:54:03', '正码', '正A', '12', '7', '10', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2548', '095436247132', '3', '2016072', '2016-06-24 16:54:16', '五行', '五行', '金', '4.3', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2549', '098268358927', '3', '2016072', '2016-06-24 16:54:16', '五行', '五行', '木', '4.7', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2550', '817614375431', '3', '2016072', '2016-06-24 16:54:40', '半波', '半波', '红双', '5.1', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2551', '512121264877', '3', '2016072', '2016-06-24 16:54:40', '半波', '半波', '红大', '6.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2552', '399822921058', '3', '2016072', '2016-06-24 16:54:56', '生肖', '六肖', '鼠,虎,龙,马,猴,狗,', '1.8', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2553', '568237214178', '3', '2016072', '2016-06-24 16:55:05', '尾数', '尾数', '0', '1.85', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2554', '020370028590', '3', '2016072', '2016-06-24 16:55:05', '头数', '头数', '0', '5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2555', '794436426330', '3', '2016072', '2016-06-24 16:55:05', '头数', '头数', '1', '4.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2556', '573285333510', '3', '2016072', '2016-06-24 16:55:14', '生肖', '特肖', '鼠', '10.2', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2557', '046981497118', '3', '2016072', '2016-06-24 16:55:14', '生肖', '特肖', '虎', '10.2', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2558', '384645646745', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '5', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2559', '182002943885', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '6', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2560', '194357972039', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '11', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2561', '756604738848', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '16', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2562', '034269583742', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '17', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2563', '617491106459', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '21', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2564', '281996408682', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '22', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2565', '557531571639', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '27', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2566', '320996039497', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '28', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2567', '080620265592', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '32', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2568', '925766915038', '3', '2016072', '2016-06-24 16:55:33', '特码', '特A', '33', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2569', '281802989376', '3', '2016072', '2016-06-24 16:55:34', '特码', '特A', '38', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2570', '863864719318', '3', '2016072', '2016-06-24 16:55:34', '特码', '特A', '39', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2571', '371752391940', '3', '2016072', '2016-06-24 16:55:34', '特码', '特A', '43', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2572', '570412580703', '3', '2016072', '2016-06-24 16:55:34', '特码', '特A', '44', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2573', '660394192435', '3', '2016072', '2016-06-24 16:55:34', '特码', '特A', '49', '41', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2574', '501458936108', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '3', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2575', '732514763849', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '4', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2576', '489639824028', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '9', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2577', '091666866459', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '10', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2578', '984637201585', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '14', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2579', '090424213899', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '15', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2580', '879548878606', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '20', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2581', '149405226714', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '25', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2582', '532984762849', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '26', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2583', '066467924842', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '31', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2584', '774173184200', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '36', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2585', '116001898507', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '37', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2586', '546807450566', '3', '2016072', '2016-06-24 16:55:52', '特码', '特B', '41', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2587', '670156043266', '3', '2016072', '2016-06-24 16:55:53', '特码', '特B', '42', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2588', '100205532825', '3', '2016072', '2016-06-24 16:55:53', '特码', '特B', '47', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2589', '256303563164', '3', '2016072', '2016-06-24 16:55:53', '特码', '特B', '48', '45.5', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2605', '054559202308', '3', '2016073', '2016-06-29 15:07:18', '特码', '特A', '47', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2604', '065881622136', '3', '2016073', '2016-06-29 15:07:18', '特码', '特A', '42', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2603', '036449145365', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '41', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2602', '950931655410', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '37', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2601', '754670645077', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '36', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2600', '183576694204', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '31', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2599', '818739889342', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '26', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2598', '100006810293', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '25', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2597', '023699671586', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '20', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2596', '000440240200', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '15', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2595', '802483199387', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '14', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2594', '097134685517', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '10', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2593', '448435757112', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '9', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2592', '959909659891', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '4', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2591', '490958041892', '3', '2016073', '2016-06-29 15:07:17', '特码', '特A', '3', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2590', '143151800610', '3', '2016073', '2016-06-24 22:14:04', '中一', '四中一', '11,12,13,14', '2.05', '2', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2606', '175467793631', '3', '2016073', '2016-06-29 15:07:18', '特码', '特A', '48', '41', '100', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2619', '871000548130', '121', '2016074', '2016-07-02 11:54:21', '特码', '特A', '5', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2614', '208104800290', 'uc1', '2016073', '2016-06-29 16:44:17', '特码', '特A', '3', '41', '430', '13', '13', '13', '13', null, '0', '0', '0', null, '10', '0', 'uc1', 'uc1', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2620', '235688104998', '121', '2016074', '2016-07-02 11:54:21', '特码', '特A', '6', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2621', '672319661484', '121', '2016074', '2016-07-02 11:54:21', '特码', '特A', '11', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2622', '464880898485', '121', '2016074', '2016-07-02 11:54:21', '特码', '特A', '16', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2623', '215055872613', '121', '2016074', '2016-07-02 11:54:21', '特码', '特A', '17', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2624', '120482105746', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '21', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2625', '014321140349', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '22', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2626', '552381293785', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '27', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2627', '390963526270', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '28', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2628', '819038039006', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '32', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2629', '436360677175', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '33', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2630', '621296543213', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '38', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2631', '044865608426', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '39', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2632', '379312557062', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '43', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2633', '822321172641', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '44', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2634', '462044880542', '121', '2016074', '2016-07-02 11:54:22', '特码', '特A', '49', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2635', '719783677658', '121', '2016074', '2016-07-02 11:55:10', '特码', '特B', '1', '46.5', '10', '4', '5', '5', '5', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2636', '573772283466', '121', '2016074', '2016-07-02 11:55:10', '特码', '特B', '2', '44.5', '10', '4', '5', '5', '5', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2637', '262625328175', '121', '2016074', '2016-07-02 11:55:11', '特码', '特B', '3', '44.5', '10', '4', '5', '5', '5', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2638', '672982013020', '121', '2016074', '2016-07-02 11:55:11', '特码', '特B', '4', '44.5', '10', '4', '5', '5', '5', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2639', '693168753308', '121', '2016075', '2016-07-02 15:58:46', '特码', '特A', '1', '43', '100', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2640', '875945857149', '121', '2016075', '2016-07-02 15:59:01', '特码', '特A', '1', '42', '100', '13', '15', '15', '15', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2641', '363362200305', '111111', '2016076', '2016-07-02 18:06:27', '特码', '特A', '1', '42.485', '100', '0', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2642', '269726199818', '111111', '2016076', '2016-07-02 18:06:44', '特码', '特A', '2', '39.4', '100', '0', '16', '16', '16', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2643', '789354092734', '111111', '2016076', '2016-07-02 18:30:03', '特码', '特A', '1', '41.385', '100', '14', '16', '16', '16', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2644', '577668710777', '111111', '2016076', '2016-07-02 18:31:05', '半波', '半波', '红单', '5.7', '100', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2645', '292641663124', '111111', '2016076', '2016-07-02 18:33:13', '特码', '特A', '1', '41.37', '10', '14', '16', '16', '16', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2646', '324533371836', '111111', '2016076', '2016-07-02 18:53:45', '生肖', '六肖', '鼠,虎,龙,马,猴,狗,', '1.8', '12', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '1', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2647', '556348480483', '111111', '2016076', '2016-07-02 18:55:03', '生肖', '六肖', '牛,兔,蛇,羊,鸡,猪,', '1.75', '10', '3', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2648', '655977967165', '111111', '2016076', '2016-07-02 19:47:12', '特码', '特A', '1', '41.37', '10', '14', '16', '16', '16', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'D');
INSERT INTO `ka_tan` VALUES ('2649', '716335334197', '111111', '2016076', '2016-07-02 19:58:33', '特码', '特A', '1', '42.47', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2650', '356827242817', '111111', '2016076', '2016-07-02 20:53:58', '特码', '特A', '1', '41.37', '100', '16', '16', '16', '16', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'D');
INSERT INTO `ka_tan` VALUES ('2651', '973710402388', '111111', '2016076', '2016-07-02 20:54:08', '特码', '特A', '1', '42.47', '100', '0', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2652', '556243126299', '111111', '2016076', '2016-07-02 20:57:44', '特码', '特A', '1', '42.955', '100', '16', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2653', '815497472622', '111111', '2016076', '2016-07-02 20:57:53', '特码', '特A', '1', '41.355', '100', '16', '16', '16', '16', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'D');
INSERT INTO `ka_tan` VALUES ('2654', '176188305753', '111111', '2016076', '2016-07-02 20:58:17', '特码', '特A', '2', '39.4', '100', '16', '16', '16', '16', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'D');
INSERT INTO `ka_tan` VALUES ('2655', '697302710930', '111111', '2016076', '2016-07-02 20:59:51', '特码', '特A', '1', '41.94', '100', '15', '15', '15', '15', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'C');
INSERT INTO `ka_tan` VALUES ('2656', '832133783306', '111111', '2016076', '2016-07-02 21:06:19', '特码', '特A', '1', '42.94', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2657', '467592375906', '111111', '2016076', '2016-07-02 21:06:29', '特码', '特A', '1', '42.44', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2658', '065112701332', '111111', '2016076', '2016-07-02 21:06:42', '特码', '特A', '1', '41.94', '10', '15', '15', '15', '15', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'C');
INSERT INTO `ka_tan` VALUES ('2659', '804037137596', '111111', '2016076', '2016-07-02 21:06:51', '特码', '特A', '1', '41.34', '10', '16', '16', '16', '16', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'D');
INSERT INTO `ka_tan` VALUES ('2660', '609528261254', 'xuan123', '2016076', '2016-07-02 21:09:26', '特码', '特A', '3', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2661', '837545483140', 'xuan123', '2016076', '2016-07-02 21:09:26', '特码', '特A', '9', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2662', '712558448758', 'xuan123', '2016076', '2016-07-02 21:09:26', '特码', '特A', '15', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2663', '235023058789', 'xuan123', '2016076', '2016-07-02 21:09:26', '特码', '特A', '25', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2664', '096509078362', 'xuan123', '2016076', '2016-07-02 21:09:26', '特码', '特A', '31', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2665', '292752995851', 'xuan123', '2016076', '2016-07-02 21:09:26', '特码', '特A', '37', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2666', '419212546557', 'xuan123', '2016076', '2016-07-02 21:09:26', '特码', '特A', '41', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2667', '573009654752', 'xuan123', '2016076', '2016-07-02 21:09:26', '特码', '特A', '47', '41', '10', '13', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2668', '692915412336', 'xuan123', '2016076', '2016-07-02 21:09:57', '特码', '特A', '3', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2669', '512834223495', 'xuan123', '2016076', '2016-07-02 21:09:57', '特码', '特A', '4', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2670', '122524638544', 'xuan123', '2016076', '2016-07-02 21:09:57', '特码', '特A', '9', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2671', '647176193539', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '10', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2672', '809072827242', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '14', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2673', '342425975448', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '15', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2674', '955571815376', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '20', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2675', '924927412707', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '25', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2676', '105681160486', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '26', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2677', '185660159426', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '31', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2678', '426578037159', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '36', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2679', '125604697614', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '37', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2680', '203913295574', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '41', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2681', '523450648396', 'xuan123', '2016076', '2016-07-02 21:09:58', '特码', '特A', '42', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2682', '620186854115', 'xuan123', '2016076', '2016-07-02 21:09:59', '特码', '特A', '47', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2683', '754009919393', 'xuan123', '2016076', '2016-07-02 21:09:59', '特码', '特A', '48', '40.5', '10', '14', '14', '14', '14', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2684', '716059320682', 'uc1', '2016076', '2016-07-02 23:04:41', '特码', '特A', '1', '42.94', '540', '13', '13', '13', '13', null, '0', '0', '0', null, '10', '0', 'uc1', 'uc1', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2686', '503188077349', '345', '2016076', '2016-07-04 21:41:09', '特码', '特A', '1', '41', '100', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2687', '269126772898', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '2', '41', '100', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2688', '797388014176', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '3', '41', '100', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2689', '083807408318', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '15', '41', '56', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2690', '384443487349', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '19', '41', '44', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2691', '532024896600', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '23', '41', '55', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2692', '970606343405', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '25', '41', '77', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2693', '114624385607', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '31', '41', '79', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2694', '553963205983', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '36', '41', '90', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2695', '577432138705', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '37', '41', '88', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2696', '254850103188', '345', '2016076', '2016-07-04 21:41:10', '特码', '特A', '41', '41', '32', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2697', '060097580615', '345', '2016076', '2016-07-04 21:42:43', '特码', '特A', '1', '40.985', '800', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2698', '028346621903', '345', '2016076', '2016-07-04 21:42:43', '特码', '特A', '4', '41', '99', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2699', '666069371845', '345', '2016076', '2016-07-04 21:42:43', '特码', '特A', '14', '41', '99', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2700', '983277470756', '345', '2016076', '2016-07-04 21:42:43', '特码', '特A', '15', '41', '99', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2701', '039114632904', '345', '2016076', '2016-07-04 21:42:44', '特码', '特A', '17', '41', '67', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2702', '813452413602', '345', '2016076', '2016-07-04 21:42:44', '特码', '特A', '19', '41', '200', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2703', '658212755007', '345', '2016076', '2016-07-04 21:42:44', '特码', '特A', '23', '41', '67', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2704', '765081002928', '345', '2016076', '2016-07-04 21:42:44', '特码', '特A', '30', '41', '20', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2705', '630897665101', '345', '2016076', '2016-07-04 21:42:44', '特码', '特A', '33', '41', '56', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2706', '609844186535', '345', '2016076', '2016-07-04 21:42:44', '特码', '特A', '43', '41', '56', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2707', '429338949619', '345', '2016076', '2016-07-04 21:42:44', '特码', '特A', '48', '41', '77', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2708', '042442117749', '234', '2016076', '2016-07-04 21:46:30', '特码', '特A', '1', '40.925', '161', '13', '13', '13', '13', null, '0', '6', '1', null, '3', '0', '234', '123', 'aaa', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2709', '806941647649', '345', '2016077', '2016-07-04 21:59:01', '特码', '特A', '1', '41', '100', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '1', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2710', '887641793014', '345', '2016077', '2016-07-04 21:59:02', '特码', '特A', '2', '41', '100', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '0', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2711', '831118786394', '234', '2016077', '2016-07-04 22:01:15', '特码', '特A', '1', '41', '7', '13', '13', '13', '13', null, '0', '6', '1', null, '3', '1', '234', '123', 'aaa', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2712', '707351354531', '234', '2016077', '2016-07-04 22:01:19', '特码', '特A', '2', '41', '7', '13', '13', '13', '13', null, '0', '6', '1', null, '3', '0', '234', '123', 'aaa', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2713', '875915886059', '123', '2016077', '2016-07-04 22:04:44', '特码', '特A', '1', '41', '63', '13', '13', '13', '13', null, '0', '0', '1', null, '9', '1', '123', '123', 'aaa', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2714', '843296383881', '123', '2016077', '2016-07-04 22:04:49', '特码', '特A', '2', '41', '63', '13', '13', '13', '13', null, '0', '0', '1', null, '9', '0', '123', '123', 'aaa', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2715', '284290972023', '345', '2016078', '2016-07-06 17:10:16', '特码', '特A', '1', '41', '100', '13', '13', '13', '13', null, '2', '6', '1', null, '1', '1', '234', '123', 'aaa', null, '0', '0', '299', '298', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2716', '368283086469', '345', '2016080', '2016-07-13 16:53:46', '特码', '特A', '1', '43', '100', '13', '0', '0', '13', null, '2', '6', '1', null, '1', '0', '', '', 'aaa', null, '0', '0', '0', '0', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2717', '137365968876', '345', '2016080', '2016-07-13 16:53:47', '特码', '特A', '2', '43', '100', '13', '0', '0', '13', null, '2', '6', '1', null, '1', '0', '', '', 'aaa', null, '0', '0', '0', '0', '297', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2719', '633372128621', '2', '2018082', '2018-12-04 17:03:34', '不中', '五不中', '11,24,35,38,46', '2.02', '100', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2720', '067605168917', '2', '2018082', '2018-12-05 15:06:00', '不中', '五不中', '31,33,36,38,39', '2.02', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2721', '079519459083', '2', '2018082', '2018-12-05 15:06:00', '不中', '五不中', '31,33,36,38,40', '2.02', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2722', '601380737061', '2', '2018082', '2018-12-05 15:06:01', '不中', '五不中', '31,33,36,39,40', '2.02', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2723', '728089935897', '2', '2018082', '2018-12-05 15:06:01', '不中', '五不中', '31,33,38,39,40', '2.02', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2724', '362505686697', '2', '2018082', '2018-12-05 15:06:01', '不中', '五不中', '31,36,38,39,40', '2.02', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2725', '030949798471', '2', '2018082', '2018-12-05 15:06:01', '不中', '五不中', '33,36,38,39,40', '2.02', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2726', '723542179040', 'zd2', '2018082', '2018-12-06 14:16:02', '', '', '', '0', '0', '13', '13', '13', '13', null, '0', '0', '8', null, '2', '0', 'zd2', 'zd2', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2727', '961678607286', '3', '2018082', '2018-12-06 16:43:03', '特码', '特A', '1', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2728', '739368044007', '3', '2018082', '2018-12-06 16:43:03', '特码', '特A', '2', '42.6', '20', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2729', '678179243554', '3', '2018082', '2018-12-06 16:43:03', '特码', '特A', '21', '42.6', '30', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2730', '544468367545', '3', '2018082', '2018-12-06 16:43:03', '特码', '特A', '32', '42.6', '32', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2731', '759044253595', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '1', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2732', '638893358540', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '2', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2733', '521686622355', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '7', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2734', '018709560601', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '8', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2735', '444676115842', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '12', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2736', '086053557254', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '13', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2737', '407926562901', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '18', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2738', '814766585293', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '19', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2739', '664986799667', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '23', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2740', '252654794743', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '24', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2741', '704062052429', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '29', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2742', '179130154944', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '30', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2743', '432963105973', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '34', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2744', '903943482311', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '35', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2745', '170060379570', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '40', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2746', '455663913296', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '45', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2747', '110963497493', '3', '2018082', '2018-12-07 15:06:25', '特码', '特A', '46', '42.6', '10', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2748', '591888143546', '2', '2018082', '2018-12-07 15:32:05', '生肖', '六肖', '鼠,虎,龙,猴,兔,蛇', '1.92', '153', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2749', '357527516903', '2', '2018082', '2018-12-07 16:08:34', '生肖', '三肖', '牛,猴,羊', '3.45', '150', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2750', '892769127633', '2', '2018082', '2018-12-07 16:09:09', '生肖', '三肖', '牛,猴,羊', '3.45', '150', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2751', '232937295307', '2', '2018082', '2018-12-07 16:11:08', '生肖', '三肖', '猴,兔,蛇', '3.45', '305', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2752', '129613072209', '2', '2018086', '2018-12-07 18:13:58', '生肖', '六肖', '马,牛,兔,羊,鸡,猪', '1.92', '120', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2753', '183493341681', '3', '2018088', '2018-12-08 09:55:52', '生肖', '三肖', '狗,鼠,虎', '3.45', '150', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2754', '325116322365', '3', '2018088', '2018-12-08 09:58:00', '生肖', '五肖', '虎,马,狗,兔,羊', '2.12', '124', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2755', '817068856672', '2', '2018088', '2018-12-08 16:24:21', '正码', '正A', '38', '7.2', '10', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2756', '049018557670', '2', '2018088', '2018-12-08 16:24:21', '正码', '正A', '48', '7.2', '10', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2757', '199682564178', '2', '2018088', '2018-12-08 16:26:10', '正码', '正A', '29', '7.2', '10', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2758', '946345658502', '2', '2018088', '2018-12-08 16:26:10', '正码', '正A', '37', '7.2', '10', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2759', '821344751873', '2', '2018088', '2018-12-08 16:26:10', '正码', '正A', '49', '7.2', '10', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2760', '434224716998', '3', '2018088', '2018-12-08 17:50:32', '特码', '特A', '21', '42.6', '12.58', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2761', '548084439740', '3', '2018088', '2018-12-10 20:21:38', '半波', '半波', '红单', '5.65', '25', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2762', '367991205360', '3', '2018088', '2018-12-10 20:21:39', '半波', '半波', '红双', '5.05', '35', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2763', '748627281952', '3', '2018088', '2018-12-10 20:21:39', '半波', '半波', '红大', '6.5', '24', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2764', '680289589850', '3', '2018088', '2018-12-10 20:21:39', '半波', '半波', '红小', '4.55', '12', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2765', '878652121780', '3', '2018088', '2018-12-10 20:21:39', '半波', '半波', '绿单', '5.05', '102', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2766', '426157488273', '3', '2018088', '2018-12-10 20:22:38', '半波', '半波', '红单', '5.65', '25', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2767', '036713346490', '3', '2018088', '2018-12-10 20:22:38', '半波', '半波', '红双', '5.05', '35', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2768', '502168991977', '3', '2018088', '2018-12-10 20:22:38', '半波', '半波', '红大', '6.5', '24', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2769', '767122120095', '3', '2018088', '2018-12-10 20:22:38', '半波', '半波', '红小', '4.55', '12', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2770', '385722356200', '3', '2018088', '2018-12-10 20:22:38', '半波', '半波', '绿单', '5.05', '102', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2771', '400420826317', '3', '20180810', '2018-12-10 20:56:42', '半波', '半波', '红单', '5.65', '15', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2772', '862199109570', '3', '20180810', '2018-12-10 20:58:17', '半波', '半波', '红单', '5.65', '25', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2773', '280702422539', '3', '20180810', '2018-12-10 20:58:17', '半波', '半波', '红双', '5.05', '34', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2774', '307040471332', '3', '20180810', '2018-12-10 20:58:17', '半波', '半波', '红大', '6.5', '322', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2775', '993972580116', '3', '20180810', '2018-12-11 10:39:29', '五行', '五行', '金', '4.6', '200', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2776', '071195778259', '3', '20180810', '2018-12-11 10:39:29', '五行', '五行', '木', '4.6', '152', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2777', '070569148710', '3', '20180810', '2018-12-11 10:39:29', '五行', '五行', '水', '4.6', '350', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2778', '144793987958', '3', '20180810', '2018-12-11 10:39:29', '五行', '五行', '火', '5.2', '145', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2779', '091118768205', '3', '20180810', '2018-12-11 10:39:29', '五行', '五行', '土', '4.6', '12.25', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2780', '923440700487', '3', '20180810', '2018-12-11 11:35:03', '生肖', '特肖', '鼠', '11.2', '150', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2781', '403981195826', '3', '20180810', '2018-12-11 11:35:03', '生肖', '特肖', '龙', '11.2', '170', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2782', '924220979040', '3', '20180810', '2018-12-11 11:35:04', '生肖', '特肖', '猴', '9.2', '251', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2783', '162935526742', '3', '20180810', '2018-12-11 11:35:04', '生肖', '特肖', '兔', '11.2', '300', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2784', '240383656477', '3', '20180810', '2018-12-11 11:35:04', '生肖', '特肖', '猪', '11.2', '325', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2785', '325412706112', '3', '20180810', '2018-12-11 14:13:19', '正码', '正A', '1', '7.2', '15', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2786', '234384019152', '3', '20180810', '2018-12-11 14:13:19', '正码', '正A', '12', '7.2', '20', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2787', '025122348187', '3', '20180810', '2018-12-11 14:13:19', '正码', '正A', '44', '7.2', '15', '0', '11', '11', '11', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2788', '146525258989', '3', '20180810', '2018-12-11 14:13:19', '正码', '正A', '总单', '1.92', '150', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2789', '703872939245', '3', '20180810', '2018-12-11 14:13:19', '正码', '正A', '总小', '1.92', '325', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2790', '905979155908', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '1', '42.5', '150', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2791', '393540547417', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '8', '42.5', '187', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2792', '576817930730', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '13', '42.5', '162', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2793', '933425200619', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '16', '42.5', '145', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2794', '843740778502', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '25', '42.5', '187', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2795', '571057427890', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '38', '42.5', '175', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2796', '693444709564', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '49', '42.5', '199', '0', '13', '13', '13', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2797', '188486885725', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '合单', '1.92', '28', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2798', '229854362377', '3', '20180810', '2018-12-11 15:25:02', '正特', '正3特', '红波', '2.72', '125', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2799', '119811519392', '3', '20180810', '2018-12-12 10:20:08', '生肖', '一肖', '鼠', '2.04', '15.52', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2800', '958729307752', '3', '20180810', '2018-12-12 10:20:08', '生肖', '一肖', '蛇', '2.04', '85.36', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2801', '436526591416', '3', '20180810', '2018-12-12 10:20:08', '生肖', '一肖', '羊', '2.04', '15.25', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2802', '965048107580', '3', '20180810', '2018-12-12 10:41:11', '正特尾数', '正特尾数', '2', '1.77', '35', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2803', '060992861918', '3', '20180810', '2018-12-12 10:41:11', '正特尾数', '正特尾数', '8', '1.77', '38', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2804', '115981324516', '2', '20180810', '2018-12-12 18:11:20', '半波', '半波', '蓝大', '5.05', '10', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2805', '088247716433', '2', '20180810', '2018-12-12 18:13:17', '生肖', '六肖', '牛,兔,蛇,羊,鸡,猪', '1.92', '20', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2806', '985753673050', '2', '20180810', '2018-12-12 18:13:54', '五行', '五行', '金', '4.6', '20', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2807', '459063452303', '2', '20180810', '2018-12-12 18:13:54', '五行', '五行', '水', '4.6', '30', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2808', '424415903553', 'huiyuan1', '20180810', '2018-12-15 15:53:34', '特码', '特A', '31', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2809', '656133451381', 'huiyuan1', '20180810', '2018-12-15 15:53:34', '特码', '特A', '41', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2810', '380444342708', 'huiyuan1', '20180810', '2018-12-15 15:59:07', '正特', '正1特', '28', '42', '10', '0', '3', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2811', '870814238251', 'huiyuan1', '20180810', '2018-12-15 15:59:07', '正特', '正1特', '38', '42', '10', '0', '3', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2812', '030676258309', 'test2', '20180810', '2018-12-15 15:59:41', '', '', '', '0', '0', '3', '3', '13', '13', null, '0', '1', '9', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2813', '940714371978', 'test2', '20180810', '2018-12-15 15:59:52', '', '', '', '0', '0', '3', '3', '13', '13', null, '0', '1', '9', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2814', '544102877442', 'huiyuan1', '20180810', '2018-12-15 16:01:42', '特码', '特A', '12', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2815', '624544060647', 'huiyuan1', '20180810', '2018-12-15 16:01:42', '特码', '特A', '24', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2816', '427151727926', 'huiyuan1', '20180810', '2018-12-15 16:01:42', '特码', '特A', '36', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2817', '672975262731', 'huiyuan1', '20180810', '2018-12-15 16:01:42', '特码', '特A', '48', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2818', '139936002321', 'huiyuan1', '20180810', '2018-12-15 17:34:15', '特码', '特A', '8', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2819', '140633966408', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '9', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2820', '181054061431', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '18', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2821', '532244134804', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '19', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2822', '527282455903', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '28', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2823', '216526752616', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '29', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2824', '284269962307', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '38', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2825', '478081949511', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '39', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2826', '325816408440', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '48', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2827', '906042041843', 'huiyuan1', '20180810', '2018-12-15 17:34:16', '特码', '特A', '49', '42.1', '10', '0', '15', '14', '14', null, '1', '1', '8', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '303', '282', '279', null, '0', '0', 'B');
INSERT INTO `ka_tan` VALUES ('2828', '131661781769', 'test2', '20180810', '2018-12-15 17:35:16', '', '', '', '0', '0', '3', '3', '13', '13', null, '0', '1', '9', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2829', '477987454896', 'test2', '20180810', '2018-12-15 17:36:00', '', '', '', '0', '0', '3', '3', '13', '13', null, '0', '1', '9', null, '0', '0', 'test2', 'zd2', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2830', '057799245739', 'zd2', '20180810', '2018-12-15 18:03:46', '', '', '', '0', '0', '13', '13', '13', '13', null, '0', '0', '8', null, '2', '0', 'zd2', 'zd2', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2831', '289164827632', 'uc1', '20180810', '2018-12-15 18:10:29', '', '', '', '0', '0', '13', '13', '13', '13', null, '0', '0', '0', null, '10', '0', 'uc1', 'uc1', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2832', '228911989360', 'uc1', '20180810', '2018-12-15 18:10:41', '', '', '', '0', '0', '13', '13', '13', '13', null, '0', '0', '0', null, '10', '0', 'uc1', 'uc1', 'uc1', null, '0', '0', '0', '0', '0', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2833', '577506366503', '2', '2018121', '2018-12-26 17:41:28', '五行', '五行', '金', '4.6', '45', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2834', '858684467731', '2', '2018121', '2018-12-26 17:41:28', '五行', '五行', '木', '4.6', '45', '0', '3', '3', '3', null, '1', '1', '8', null, '0', '0', 'ab', 'zd', 'uc1', null, '0', '0', '281', '280', '279', null, '0', '0', 'A');
INSERT INTO `ka_tan` VALUES ('2835', '086848302242', '外调', '2016077', '2019-01-23 15:41:48', '特码', '特A', '1', '42.6', '-1', '-11', '-11', '-11', '-11', '-11', '0', '0', '0', '0', '10', '0', '外调', '外调', '外调', '外调', '1', '0', '0', '0', '0', null, '0', '0', 'A');

-- ----------------------------
-- Table structure for `ka_tong`
-- ----------------------------
DROP TABLE IF EXISTS `ka_tong`;
CREATE TABLE `ka_tong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `kithe` varchar(50) DEFAULT NULL,
  `adddate` datetime DEFAULT NULL,
  `class1` varchar(50) DEFAULT NULL,
  `class2` varchar(50) DEFAULT NULL,
  `class3` varchar(50) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `sum_m` double DEFAULT NULL,
  `user_ds` double DEFAULT NULL,
  `zong_ds` double DEFAULT NULL,
  `guan_ds` double DEFAULT NULL,
  `dai_zc` double DEFAULT NULL,
  `zong_zc` double DEFAULT NULL,
  `guan_zc` double DEFAULT NULL,
  `dagu_zc` double DEFAULT NULL,
  `bm` int(11) DEFAULT NULL,
  `dai` varchar(50) DEFAULT NULL,
  `zong` varchar(50) DEFAULT NULL,
  `guan` varchar(50) DEFAULT NULL,
  `lx` int(11) DEFAULT '0',
  `dai_ds` double DEFAULT '0',
  `memid` int(11) DEFAULT '0',
  `danid` int(11) DEFAULT '0',
  `zongid` int(11) DEFAULT '0',
  `guanid` int(11) DEFAULT '0',
  `ly` int(11) DEFAULT '0',
  `rate2` double DEFAULT '0',
  `abcd` varchar(50) DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `num` (`num`),
  KEY `username` (`username`),
  KEY `kithe` (`kithe`),
  KEY `adddate` (`adddate`),
  KEY `class1` (`class1`),
  KEY `class2` (`class2`),
  KEY `class3` (`class3`),
  KEY `rate` (`rate`),
  KEY `sum_m` (`sum_m`),
  KEY `user_ds` (`user_ds`),
  KEY `zong_ds` (`zong_ds`),
  KEY `guan_ds` (`guan_ds`),
  KEY `dai_zc` (`dai_zc`),
  KEY `zong_zc` (`zong_zc`),
  KEY `guan_zc` (`guan_zc`),
  KEY `dagu_zc` (`dagu_zc`),
  KEY `bm` (`bm`),
  KEY `dai` (`dai`),
  KEY `zong` (`zong`),
  KEY `guan` (`guan`),
  KEY `lx` (`lx`),
  KEY `dai_ds` (`dai_ds`),
  KEY `danid` (`danid`),
  KEY `zongid` (`zongid`),
  KEY `guanid` (`guanid`),
  KEY `ly` (`ly`),
  KEY `rate2` (`rate2`),
  KEY `abcd` (`abcd`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ka_tong
-- ----------------------------
INSERT INTO `ka_tong` VALUES ('100', '879062720515', '3', '2016072', '2016-06-24 16:52:24', '连码', '二中特', '--31,32,33,', '30', '10', '0', '15', '15', '1', '1', '8', '0', '0', 'ab', 'zd', 'uc1', '0', '15', '0', '279', '280', '279', '0', '35', 'A');
INSERT INTO `ka_tong` VALUES ('101', '055183448958', '3', '2016072', '2016-06-24 16:52:49', '生肖连', '二肖连中', '鼠,虎,', '3.4', '10', '0', '3', '3', '1', '1', '8', '0', '0', 'ab', 'zd', 'uc1', '0', '3', '0', '279', '280', '279', '0', '0', 'A');

-- ----------------------------
-- Table structure for `ka_zi`
-- ----------------------------
DROP TABLE IF EXISTS `ka_zi`;
CREATE TABLE `ka_zi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kauser` varchar(50) DEFAULT NULL,
  `kapassword` varchar(50) DEFAULT NULL,
  `guan` varchar(50) DEFAULT NULL,
  `guanid` int(11) DEFAULT NULL,
  `adddate` datetime DEFAULT NULL,
  `lx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `kauser` (`kauser`),
  KEY `guan` (`guan`),
  KEY `guanid` (`guanid`),
  KEY `lx` (`lx`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='vip代理账号信息表';

-- ----------------------------
-- Records of ka_zi
-- ----------------------------
INSERT INTO `ka_zi` VALUES ('52', 'z2', '4297f44b13955235245b2497399d7a93', 'uc1', '279', '2018-12-17 14:22:46', '1');
INSERT INTO `ka_zi` VALUES ('49', 'zi1', 'e10adc3949ba59abbe56e057f20f883e', 'uc1', '279', '2018-12-17 13:56:04', '1');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(32) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('37', '1', null, '127.0.0.1', '1544519821', '1544519821', null);
INSERT INTO `login` VALUES ('38', '1', null, '127.0.0.1', '1544593739', '1544593739', null);
INSERT INTO `login` VALUES ('39', '1', null, '127.0.0.1', '1544606884', '1544606884', null);
INSERT INTO `login` VALUES ('40', '1', null, '127.0.0.1', '1544669348', '1544669348', null);
INSERT INTO `login` VALUES ('41', '1', null, '127.0.0.1', '1545018527', '1545018527', null);

-- ----------------------------
-- Table structure for `mdrop`
-- ----------------------------
DROP TABLE IF EXISTS `mdrop`;
CREATE TABLE `mdrop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class1` varchar(255) NOT NULL,
  `class2` varchar(255) NOT NULL,
  `class3` varchar(255) NOT NULL,
  `rate` double NOT NULL,
  `blrate` double NOT NULL,
  `gold` double NOT NULL,
  `xr` double NOT NULL,
  `locked` int(11) NOT NULL,
  `adddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mrate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mdrop
-- ----------------------------
INSERT INTO `mdrop` VALUES ('1', '生肖', '二肖', '鼠', '3.26', '5.62', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('2', '生肖', '二肖', '虎', '3.57', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('3', '生肖', '二肖', '龙', '4.96', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('4', '生肖', '二肖', '马', '4.98', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('5', '生肖', '二肖', '猴', '5', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('6', '生肖', '二肖', '狗', '5', '5.6', '0', '0', '1', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('7', '生肖', '二肖', '牛', '5', '4.99', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('8', '生肖', '二肖', '兔', '5', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('9', '生肖', '二肖', '蛇', '5', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('10', '生肖', '二肖', '羊', '5', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('11', '生肖', '二肖', '鸡', '5', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('12', '生肖', '二肖', '猪', '5', '5.6', '0', '0', '0', '2010-07-20 04:15:29', '0');
INSERT INTO `mdrop` VALUES ('13', '生肖', '三肖', '鼠', '3.44', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('14', '生肖', '三肖', '虎', '2.8', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('15', '生肖', '三肖', '龙', '3.48', '3.5', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('16', '生肖', '三肖', '马', '3.41', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('17', '生肖', '三肖', '猴', '3.46', '3.6', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('18', '生肖', '三肖', '狗', '3.45', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('19', '生肖', '三肖', '牛', '3.44', '3.37', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('20', '生肖', '三肖', '兔', '3.5', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('21', '生肖', '三肖', '蛇', '3.5', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('22', '生肖', '三肖', '羊', '3.5', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('23', '生肖', '三肖', '鸡', '3.5', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('24', '生肖', '三肖', '猪', '3.5', '3.7', '0', '0', '0', '2010-07-20 04:05:10', '0');
INSERT INTO `mdrop` VALUES ('25', '生肖', '四肖', '鼠', '2.48', '2.7', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('26', '生肖', '四肖', '虎', '2.1', '2.7', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('27', '生肖', '四肖', '龙', '2.5', '2.7', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('28', '生肖', '四肖', '马', '2.46', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('29', '生肖', '四肖', '猴', '2.52', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('30', '生肖', '四肖', '狗', '2.46', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('31', '生肖', '四肖', '牛', '2.5', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('32', '生肖', '四肖', '兔', '2.44', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('33', '生肖', '四肖', '蛇', '2.41', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('34', '生肖', '四肖', '羊', '2.5', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('35', '生肖', '四肖', '鸡', '2.5', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('36', '生肖', '四肖', '猪', '2.5', '2.5', '0', '0', '0', '2010-07-20 03:50:13', '0');
INSERT INTO `mdrop` VALUES ('37', '生肖', '五肖', '鼠', '2.1', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('38', '生肖', '五肖', '虎', '1.91', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('39', '生肖', '五肖', '龙', '2.1', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('40', '生肖', '五肖', '马', '2.08', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('41', '生肖', '五肖', '猴', '2.06', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('42', '生肖', '五肖', '狗', '2.05', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('43', '生肖', '五肖', '牛', '2.03', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('44', '生肖', '五肖', '兔', '2.1', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('45', '生肖', '五肖', '蛇', '2.1', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('46', '生肖', '五肖', '羊', '2.1', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('47', '生肖', '五肖', '鸡', '2.1', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('48', '生肖', '五肖', '猪', '2.1', '2.5', '0', '0', '0', '2010-07-20 04:10:02', '0');
INSERT INTO `mdrop` VALUES ('49', '生肖', '六肖', '鼠', '1.91', '1.9', '0', '0', '1', '2010-07-20 04:22:06', '0');
INSERT INTO `mdrop` VALUES ('50', '生肖', '六肖', '虎', '1.91', '1.9', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('51', '生肖', '六肖', '龙', '1.91', '1.9', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('52', '生肖', '六肖', '马', '1.91', '1.9', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('53', '生肖', '六肖', '猴', '1.91', '1.5', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('54', '生肖', '六肖', '狗', '1.91', '1.9', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('55', '生肖', '六肖', '牛', '1.91', '1.85', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('56', '生肖', '六肖', '兔', '1.91', '1.9', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('57', '生肖', '六肖', '蛇', '1.91', '1.9', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('58', '生肖', '六肖', '羊', '1.91', '1.9', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('59', '生肖', '六肖', '鸡', '1.91', '1.5', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('60', '生肖', '六肖', '猪', '1.91', '1.95', '0', '0', '0', '2010-07-20 03:50:23', '0');
INSERT INTO `mdrop` VALUES ('61', '连肖', '二肖碰', '鼠', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('62', '连肖', '二肖碰', '虎', '3.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('63', '连肖', '二肖碰', '龙', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('64', '连肖', '二肖碰', '马', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('65', '连肖', '二肖碰', '猴', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('66', '连肖', '二肖碰', '狗', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('67', '连肖', '二肖碰', '牛', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('68', '连肖', '二肖碰', '兔', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('69', '连肖', '二肖碰', '蛇', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('70', '连肖', '二肖碰', '羊', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('71', '连肖', '二肖碰', '鸡', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('72', '连肖', '二肖碰', '猪', '4.3', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('74', '连肖', '三肖碰', '鼠', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('75', '连肖', '三肖碰', '虎', '9.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('76', '连肖', '三肖碰', '龙', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('77', '连肖', '三肖碰', '马', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('78', '连肖', '三肖碰', '猴', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('79', '连肖', '三肖碰', '狗', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('80', '连肖', '三肖碰', '牛', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('81', '连肖', '三肖碰', '兔', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('82', '连肖', '三肖碰', '蛇', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('83', '连肖', '三肖碰', '羊', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('84', '连肖', '三肖碰', '鸡', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('85', '连肖', '三肖碰', '猪', '10.7', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('86', '连肖', '四肖碰', '鼠', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('87', '连肖', '四肖碰', '虎', '29', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('88', '连肖', '四肖碰', '龙', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('89', '连肖', '四肖碰', '马', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('90', '连肖', '四肖碰', '猴', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('91', '连肖', '四肖碰', '狗', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('92', '连肖', '四肖碰', '牛', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('93', '连肖', '四肖碰', '兔', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('94', '连肖', '四肖碰', '蛇', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('95', '连肖', '四肖碰', '羊', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('96', '连肖', '四肖碰', '鸡', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('97', '连肖', '四肖碰', '猪', '33', '5.62', '0', '0', '0', '2010-07-23 23:33:21', '0');
INSERT INTO `mdrop` VALUES ('98', '连肖', '五肖碰', '鼠', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('99', '连肖', '五肖碰', '虎', '70', '5.62', '0', '0', '0', '2010-07-22 02:22:23', '0');
INSERT INTO `mdrop` VALUES ('100', '连肖', '五肖碰', '龙', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('101', '连肖', '五肖碰', '马', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('102', '连肖', '五肖碰', '猴', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('103', '连肖', '五肖碰', '狗', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('104', '连肖', '五肖碰', '牛', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('105', '连肖', '五肖碰', '兔', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('106', '连肖', '五肖碰', '蛇', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('107', '连肖', '五肖碰', '羊', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('108', '连肖', '五肖碰', '鸡', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');
INSERT INTO `mdrop` VALUES ('109', '连肖', '五肖碰', '猪', '73', '5.62', '0', '0', '0', '2010-07-23 23:34:15', '0');

-- ----------------------------
-- Table structure for `m_color`
-- ----------------------------
DROP TABLE IF EXISTS `m_color`;
CREATE TABLE `m_color` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `id` (`ID`),
  KEY `color` (`color`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_color
-- ----------------------------
INSERT INTO `m_color` VALUES ('1', 'r');
INSERT INTO `m_color` VALUES ('2', 'r');
INSERT INTO `m_color` VALUES ('3', 'b');
INSERT INTO `m_color` VALUES ('4', 'b');
INSERT INTO `m_color` VALUES ('5', 'g');
INSERT INTO `m_color` VALUES ('6', 'g');
INSERT INTO `m_color` VALUES ('7', 'r');
INSERT INTO `m_color` VALUES ('8', 'r');
INSERT INTO `m_color` VALUES ('9', 'b');
INSERT INTO `m_color` VALUES ('10', 'b');
INSERT INTO `m_color` VALUES ('11', 'g');
INSERT INTO `m_color` VALUES ('12', 'r');
INSERT INTO `m_color` VALUES ('13', 'r');
INSERT INTO `m_color` VALUES ('14', 'b');
INSERT INTO `m_color` VALUES ('15', 'b');
INSERT INTO `m_color` VALUES ('16', 'g');
INSERT INTO `m_color` VALUES ('17', 'g');
INSERT INTO `m_color` VALUES ('18', 'r');
INSERT INTO `m_color` VALUES ('19', 'r');
INSERT INTO `m_color` VALUES ('20', 'b');
INSERT INTO `m_color` VALUES ('21', 'g');
INSERT INTO `m_color` VALUES ('22', 'g');
INSERT INTO `m_color` VALUES ('23', 'r');
INSERT INTO `m_color` VALUES ('24', 'r');
INSERT INTO `m_color` VALUES ('25', 'b');
INSERT INTO `m_color` VALUES ('26', 'b');
INSERT INTO `m_color` VALUES ('27', 'g');
INSERT INTO `m_color` VALUES ('28', 'g');
INSERT INTO `m_color` VALUES ('29', 'r');
INSERT INTO `m_color` VALUES ('30', 'r');
INSERT INTO `m_color` VALUES ('31', 'b');
INSERT INTO `m_color` VALUES ('32', 'g');
INSERT INTO `m_color` VALUES ('33', 'g');
INSERT INTO `m_color` VALUES ('34', 'r');
INSERT INTO `m_color` VALUES ('35', 'r');
INSERT INTO `m_color` VALUES ('36', 'b');
INSERT INTO `m_color` VALUES ('37', 'b');
INSERT INTO `m_color` VALUES ('38', 'g');
INSERT INTO `m_color` VALUES ('39', 'g');
INSERT INTO `m_color` VALUES ('40', 'r');
INSERT INTO `m_color` VALUES ('41', 'b');
INSERT INTO `m_color` VALUES ('42', 'b');
INSERT INTO `m_color` VALUES ('43', 'g');
INSERT INTO `m_color` VALUES ('44', 'g');
INSERT INTO `m_color` VALUES ('45', 'r');
INSERT INTO `m_color` VALUES ('46', 'r');
INSERT INTO `m_color` VALUES ('47', 'b');
INSERT INTO `m_color` VALUES ('48', 'b');
INSERT INTO `m_color` VALUES ('49', 'g');

-- ----------------------------
-- Table structure for `navi`
-- ----------------------------
DROP TABLE IF EXISTS `navi`;
CREATE TABLE `navi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) DEFAULT NULL,
  `cname` varchar(32) NOT NULL COMMENT '中文名称',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `position` varchar(32) NOT NULL COMMENT '位置：admin管理菜单 index前端菜单',
  `target` varchar(32) DEFAULT NULL COMMENT '在何处打开 action URL，_blank：在新窗口/选项卡中打开。_self： 	在同一框架中打开。（默认）',
  `action` text COMMENT '动作',
  `params` varchar(128) DEFAULT NULL COMMENT '参数',
  `type` tinyint(2) DEFAULT '1' COMMENT '1菜单 2权限 3菜单+权限',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='导航';

-- ----------------------------
-- Records of navi
-- ----------------------------
INSERT INTO `navi` VALUES ('29', '0', null, '基本设置', 'set', 'admin', '_blank', '', null, '3', '0', null, '1543178751', null);
INSERT INTO `navi` VALUES ('30', '29', null, '网站设置', '', 'admin', '_self', 'admin/setting/site', null, '3', '0', null, '1529917839', null);
INSERT INTO `navi` VALUES ('34', '75', null, '用户列表', '', 'admin', null, 'admin/user/index', '', '3', '1', '1529998205', '1529998205', null);
INSERT INTO `navi` VALUES ('35', '0', null, '代理管理', 'auz', 'admin', '_self', '', null, '3', '2', '1530002089', '1530003373', null);
INSERT INTO `navi` VALUES ('36', '35', null, '代理列表', '', 'admin', '_self', 'admin/agent/index', null, '3', '1', '1530003291', '1530003291', null);
INSERT INTO `navi` VALUES ('69', '0', null, '文章管理', 'read', 'admin', null, null, null, '3', '8', null, null, null);
INSERT INTO `navi` VALUES ('70', '69', null, '文章分类', null, 'admin', null, 'admin/article/classify', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('71', '69', null, '文章列表', null, 'admin', null, 'admin/article/index', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('73', '0', '', '资金管理', 'rmb', 'admin', null, '', null, '3', '5', null, null, '1');
INSERT INTO `navi` VALUES ('75', '0', '', '用户管理', 'user', 'admin', null, null, null, '3', '6', null, null, null);
INSERT INTO `navi` VALUES ('80', '29', null, '客服设置', null, 'admin', null, 'admin/setting/kefu', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('84', '73', null, '充值管理', null, 'admin', null, 'admin/finance/charge', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('100', '0', null, '用户管理', 'user', 'agent', null, null, null, '1', '0', null, null, null);
INSERT INTO `navi` VALUES ('101', '100', null, '用户列表', null, 'agent', null, 'agent/user/index', null, '1', '0', null, null, null);
INSERT INTO `navi` VALUES ('102', '0', null, '财务管理', 'rmb', 'agent', null, '', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('103', '102', null, '充值列表', '', 'agent', null, 'agent/finance/charge', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('104', '102', null, '消费列表', null, 'agent', null, 'agent/finance/consume', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('105', '73', null, '消费管理', null, 'admin', null, 'admin/finance/consume', null, '1', '0', null, null, null);
INSERT INTO `navi` VALUES ('107', '35', null, '代理级别', null, 'admin', null, 'admin/agent/level', null, '3', '0', null, null, '1');
INSERT INTO `navi` VALUES ('108', '29', null, '号码设置', null, 'admin', null, 'admin/setting/number', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('109', '0', null, '员工管理', 'username', 'admin', null, '', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('110', '109', null, '角色设置', null, 'admin', null, 'admin/role/index', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('111', '109', null, '员工列表', null, 'admin', null, 'admin/staff/index', null, '1', '0', null, null, null);
INSERT INTO `navi` VALUES ('112', '0', null, '盘口管理', 'template-1', 'admin', null, null, null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('113', '112', null, '预收盘口', null, 'admin', null, 'admin/kithe/index', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('114', '112', null, '历史开盘', null, 'admin', null, 'admin/kithe/history', null, '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('115', '0', null, '赔率设置', 'notice', 'admin', null, 'admin/rake/tm', '', '3', '0', null, null, null);
INSERT INTO `navi` VALUES ('116', '0', null, '即时注单', 'edit', 'admin', null, 'admin/pz/tm', null, '1', '0', null, null, null);
INSERT INTO `navi` VALUES ('117', '0', null, '注单查询', 'search', 'admin', null, 'admin/tan/index', null, '1', '0', null, null, null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID自增长',
  `pid` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `cname` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(128) DEFAULT NULL COMMENT '描述',
  `navis` text COMMENT '导航权限',
  `handles` text COMMENT '操作权限',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `operator` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', null, 'admin', '超级管理员', '拥有至高无上的权力', null, null, '1', null, '1481271281', '1529984373', null);
INSERT INTO `role` VALUES ('2', '1', 'staff', '普通管理员', '总后台管理员，超级管理员创建授权', '29,30,80,108,109,110,35,36,107,75,34,69,70,71', null, '1', null, '1529999856', '1544688610', null);
INSERT INTO `role` VALUES ('3', null, 'agent', '代理商', '由后台管理员创建，可登录代理商后台', '', null, '1', null, '1481271281', '1529997074', null);
INSERT INTO `role` VALUES ('4', null, 'user', '用户', '注册用户', null, null, '1', null, '1529990872', '1529990872', null);

-- ----------------------------
-- Table structure for `setting`
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增ID',
  `key` varchar(32) NOT NULL COMMENT '键值',
  `value` text NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `create_time` int(11) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) unsigned DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='系统设置';

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES ('1', 'site', '{\"logo\":\"\\\\public\\\\uploads\\\\20181206\\\\6aa20f853a23d70765136a711b67e2f8.jpg\",\"sname\":\"兴利\",\"cname\":\"兴利\",\"keywords\":\"\",\"description\":\"\",\"copyright\":\"\",\"beian\":\"\",\"open\":\"on\"}', '站点', null, '1544604087', null);
INSERT INTO `setting` VALUES ('7', 'kefu', '{\"wxno\":\"xiaomakefuhao\",\"wxqrcode\":\"\\\\public\\\\uploads\\\\20181206\\\\eabfd90f6576ab949f85c920984bf516.jpg\",\"qq\":\"721854504\"}', null, null, '1544066045', null);
INSERT INTO `setting` VALUES ('17', 'number', '{\"rat\":\"11,23,35,47\",\"cow\":\"10,22,34,46\",\"tiger\":\"09,21,33,45\",\"rabbit\":\"08,20,32,44\",\"dragon\":\"07,19,31,43\",\"snake\":\"06,18,30,42\",\"horse\":\"05,17,29,41\",\"sheep\":\"04,16,28,40\",\"monkey\":\"03,15,27,39\",\"chicken\":\"02,14,26,38\",\"dog\":\"01,13,25,37,49\",\"pig\":\"12,24,36,48\",\"red\":\"01,02,07,08,12,13,18,19,23,24,29,30,34,35,40,45,46\",\"red_single\":\"01,07,13,19,23,29,35,45\",\"red_double\":\"02,08,12,18,24,30,34,40,46\",\"red_big\":\"29,30,34,35,40,45,46\",\"red_small\":\"01,02,07,08,12,13,18,19,23,24\",\"red_whole_single\":\"01,07,23,29,45,12,18,30,34\",\"red_whole_double\":\"13,19,35,2,8,24,40,46\",\"red_big_single\":\"29,35,45\",\"red_big_double\":\"30,34,40,46\",\"red_small_single\":\"01,07,13,19,23\",\"red_small_double\":\"02,08,12,18,24\",\"blue\":\"03,04,09,10,14,15,20,25,26,31,36,37,41,42,47,48\",\"blue_single\":\"03,09,15,25,31,37,41,47\",\"blue_double\":\"04,10,14,20,26,36,42,48\",\"blue_big\":\"25,26,31,36,37,41,42,47,48\",\"blue_small\":\"03,04,09,10,14,15,20\",\"blue_whole_single\":\"03,09,25,41,47,10,14,36\",\"blue_whole_double\":\"15,31,37,4,20,26,42,48\",\"blue_big_single\":\"25,31,37,41,47\",\"blue_big_double\":\"26,36,42,48\",\"blue_small_single\":\"03,09,15\",\"blue_small_double\":\"04,10,14,20\",\"green\":\"05,06,11,16,17,21,22,27,28,32,33,38,39,43,44,49\",\"green_single\":\"05,11,17,21,27,33,39,43,49\",\"green_double\":\"06,16,22,28,32,38,44\",\"green_big\":\"27,28,32,33,38,39,43,44,49\",\"green_small\":\"05,06,11,16,17,21,22\",\"green_whole_single\":\"05,16,21,27,32,38,43,49\",\"green_whole_double\":\"06,11,17,22,28,33,39,44\",\"green_big_single\":\"27,33,39,43,49\",\"green_big_double\":\"28,32,38,44\",\"green_small_single\":\"05,11,17,21\",\"green_small_double\":\"06,16,22\",\"metal\":\"02,03,16,17,24,25,32,33,46,47\",\"wood\":\"06,07,14,15,28,29,36,37,44,45\",\"water\":\"04,05,12,13,20,21,34,35,42,43\",\"fire\":\"01,08,09,22,23,30,31,38,39\",\"earth\":\"10,11,18,19,26,27,40,41,48,49\",\"1\":\"01,11,21,31,41\",\"6\":\"06,16,26,36,46\",\"2\":\"02,12,22,32,42\",\"7\":\"07,17,27,37,47\",\"3\":\"03,13,23,33,43\",\"8\":\"08,18,28,38,48\",\"4\":\"04,14,24,34,44\",\"9\":\"09,19,29,39,49\",\"5\":\"05,15,25,35,45\",\"0\":\"10,20,30,40\",\"big_single\":\"25,27,29,31,33,35,37,39,41,43,45,47,49\",\"big_double\":\"26,28,30,32,34,36,38,40,42,44,46,48\",\"small_single\":\"01,03,05,07,09,11,13,15,17,19,21,23\",\"small_double\":\"02,04,06,08,10,12,14,16,18,20,22\"}', null, null, '1544687721', null);
INSERT INTO `setting` VALUES ('18', 'account', '{}', null, null, null, null);

-- ----------------------------
-- Table structure for `tj`
-- ----------------------------
DROP TABLE IF EXISTS `tj`;
CREATE TABLE `tj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tjid` varchar(250) DEFAULT NULL,
  `username` varchar(250) DEFAULT NULL,
  `adddate` datetime DEFAULT NULL,
  `addate` datetime DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `zt` int(11) DEFAULT NULL,
  `tr` int(11) DEFAULT '0',
  `ipname` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `username` (`username`),
  KEY `adddate` (`adddate`),
  KEY `addate` (`addate`),
  KEY `ip` (`ip`),
  KEY `zt` (`zt`),
  KEY `rt` (`tr`)
) ENGINE=MyISAM AUTO_INCREMENT=37830 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tj
-- ----------------------------
INSERT INTO `tj` VALUES ('37829', null, '212558', '2019-01-07 15:20:58', '2019-01-07 15:20:58', '127.0.0.1', '3', '0', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `openid` varchar(32) DEFAULT '' COMMENT '微信OPENID',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL,
  `truename` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(32) DEFAULT '' COMMENT '昵称',
  `idcard` varchar(256) DEFAULT NULL COMMENT '身份证',
  `birthday` varchar(32) DEFAULT NULL COMMENT '生日',
  `age` int(11) DEFAULT '0' COMMENT '年龄',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别 1男 2女',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `qq` varchar(32) DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(32) DEFAULT NULL COMMENT '微信号',
  `sign` varchar(128) DEFAULT NULL COMMENT '签名',
  `headimgurl` varchar(256) DEFAULT NULL COMMENT '头像',
  `language` varchar(32) DEFAULT NULL COMMENT '语言',
  `city` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `latitude` varchar(32) DEFAULT NULL,
  `longitude` varchar(32) DEFAULT NULL,
  `precision` varchar(11) DEFAULT NULL,
  `balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `coin` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商家使用 发布点',
  `commission` decimal(10,2) DEFAULT '0.00' COMMENT '佣金',
  `login_times` int(11) DEFAULT '0' COMMENT '登录次数',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(32) DEFAULT NULL COMMENT '最后登录IP',
  `online` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1在线 0下线',
  `state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '是否在线 1是 0否',
  `from` varchar(32) DEFAULT NULL COMMENT 'wx xl',
  `agent_id` int(11) DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `failcount` int(11) NOT NULL DEFAULT '0' COMMENT '输',
  `wincount` int(11) NOT NULL DEFAULT '0' COMMENT '赢',
  `tiecount` int(11) NOT NULL DEFAULT '0' COMMENT '平局',
  `isagent` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '', 'admin', 'b316df1d65ee42ff51a5393df1f86105', null, '超级管理员', '', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0.00', '0.00', '0.00', '33', '1545018526', '127.0.0.1', '0', '1', '0', '1545018527', null, null, null, null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `ya_kithe`
-- ----------------------------
DROP TABLE IF EXISTS `ya_kithe`;
CREATE TABLE `ya_kithe` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nn` int(11) DEFAULT NULL,
  `nd` datetime DEFAULT NULL,
  `na` int(11) DEFAULT NULL,
  `n1` int(11) DEFAULT NULL,
  `n2` int(11) DEFAULT NULL,
  `n3` int(11) DEFAULT NULL,
  `n4` int(11) DEFAULT NULL,
  `n5` int(11) DEFAULT NULL,
  `n6` int(11) DEFAULT NULL,
  `kitm` int(11) DEFAULT NULL,
  `kitm1` datetime DEFAULT NULL,
  `kizt` int(11) DEFAULT NULL,
  `kizt1` datetime DEFAULT NULL,
  `kizm` int(11) DEFAULT NULL,
  `kizm1` datetime DEFAULT NULL,
  `kizm6` int(11) DEFAULT NULL,
  `kizm61` datetime DEFAULT NULL,
  `kigg` int(11) DEFAULT NULL,
  `kigg1` datetime DEFAULT NULL,
  `kilm` int(11) DEFAULT NULL,
  `kilm1` datetime DEFAULT NULL,
  `kisx` int(11) DEFAULT NULL,
  `kisx1` datetime DEFAULT NULL,
  `kibb` int(11) DEFAULT NULL,
  `kibb1` datetime DEFAULT NULL,
  `zfb` int(11) DEFAULT NULL,
  `zfbdate` datetime DEFAULT NULL,
  `zfbdate1` datetime DEFAULT NULL,
  `best` int(11) DEFAULT NULL,
  `lx` int(11) DEFAULT NULL,
  `kiws` int(11) DEFAULT NULL,
  `kiws1` datetime DEFAULT NULL,
  `sx` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ya_kithe
-- ----------------------------
INSERT INTO `ya_kithe` VALUES ('1', '2018122', '2016-06-30 21:30:00', '0', '0', '0', '0', '0', '0', '0', '1', '2016-06-30 20:30:00', '1', '2016-06-30 20:30:00', '1', '2016-06-30 20:30:00', '1', '2016-06-30 20:30:00', '1', '2016-06-30 20:30:00', '1', '2016-06-30 20:30:00', '1', '2016-06-30 20:30:00', '1', '2016-06-30 20:30:00', '0', '2016-06-30 20:30:00', '2016-06-30 01:30:00', '1', '0', '1', '2016-06-30 20:30:00', '');
INSERT INTO `ya_kithe` VALUES ('2', '2018123', '2016-06-24 21:30:00', '0', '0', '0', '0', '0', '0', '0', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '0', '2016-06-24 20:30:00', '2016-06-24 01:30:00', '1', '0', '0', '2016-06-24 20:30:00', '');
INSERT INTO `ya_kithe` VALUES ('3', '2018124', '2016-06-28 21:30:00', '0', '0', '0', '0', '0', '0', '0', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '0', '2016-06-28 20:30:00', '2016-06-28 01:30:00', '1', '0', '0', '2016-06-28 20:30:00', '');
