/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : ssm_demo

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2022-03-05 01:50:55
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department` varchar(20) NOT NULL,
  `base_salary` float DEFAULT NULL,
  `base_bonus` float DEFAULT NULL,
  `base_subsidy` float DEFAULT NULL,
  `base_annual` float DEFAULT NULL,
  PRIMARY KEY (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO department VALUES ('实习部', '500', '300', '100', '12');
INSERT INTO department VALUES ('研发部', '4500', '800', '300', '14');
INSERT INTO department VALUES ('管理部', '6000', '1000', '500', '16');

-- ----------------------------
-- Table structure for `file_operation`
-- ----------------------------
DROP TABLE IF EXISTS `file_operation`;
CREATE TABLE `file_operation` (
  `file_id` int(4) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(260) NOT NULL,
  `file_description` varchar(300) DEFAULT NULL,
  `user_id` int(4) NOT NULL,
  `upload_time` datetime NOT NULL,
  `download_amount` int(10) NOT NULL DEFAULT '0',
  `path` varchar(100) NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `fk_f_u` (`user_id`),
  CONSTRAINT `fk_f_u` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_operation
-- ----------------------------
INSERT INTO file_operation VALUES ('44', '员工管理系统的设计与实现.pdf', null, '2', '2022-03-02 20:20:01', '1', 'E:\\IDEA\\workplace\\SSM\\target\\SSM-1.0-SNAPSHOT\\upload');

-- ----------------------------
-- Table structure for `log_login`
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(20) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `login_time` datetime NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `login_address` varchar(255) NOT NULL,
  `browser_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_login
-- ----------------------------
INSERT INTO log_login VALUES ('29', '1', 'D02260B0E2E846406F154F836B14AF7B', '2022-02-28 19:36:48', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('30', '2', '66261B5F4BBFA8BE1359054EA02325A6', '2022-02-28 19:37:09', '127.0.0.1', '湖南省岳阳市', 'Internet Explorer 11');
INSERT INTO log_login VALUES ('31', '2', '66261B5F4BBFA8BE1359054EA02325A6', '2022-02-28 19:37:09', '127.0.0.1', '湖南省岳阳市', 'Internet Explorer 11');
INSERT INTO log_login VALUES ('32', '2', 'D16B50191E417317246C23DC5A58DC35', '2022-02-28 22:03:03', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('33', '1', '75CB829532599775F697CFC3E3967F77', '2022-02-28 22:03:41', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('34', '1', 'A5B87DC36DC39CF12A2BECD073FEFC3A', '2022-02-28 22:46:06', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('35', '1', '4F296A7837B26626B0CDF3F5C16F2D31', '2022-02-28 23:57:42', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('36', '1', '7D7F56E35A58E16CA8D069AA812FB865', '2022-03-01 00:04:13', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('37', '1', 'AC2E2771673F90C1550EE8106A369FFD', '2022-03-01 19:39:12', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('38', '1', 'F991D242ED22D33555744E33B973D62F', '2022-03-01 19:41:35', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('39', '8', '8EC22080874CB560901F5D67486111FE', '2022-03-01 20:27:37', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('40', '1', '48A7133FEBB8CEB2A47A3BB8C289D5B5', '2022-03-01 20:56:52', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('41', '1', '21C3D19EA4102E90555D7B6AF1FE4E1D', '2022-03-01 21:13:08', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('42', '1', '539BBF3133A9FB3E6A27D58A5C2B9774', '2022-03-01 21:15:54', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('43', '16', '6CC851561662FEA9CFBE8498235DCE29', '2022-03-01 21:27:17', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('44', '1', '6CC851561662FEA9CFBE8498235DCE29', '2022-03-01 22:12:33', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('45', '1', 'FFA2960DBE323FD8DD88B92EBFB52D56', '2022-03-01 22:15:39', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('46', '1', 'D3F36300D542145151EBDACE9D0627E8', '2022-03-01 22:23:26', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('47', '1', '6208F9198471BA7D1BCF0076B29EC190', '2022-03-01 22:34:39', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('48', '1', '06F4E8ABE4CB8B288F82F239705C1D02', '2022-03-01 22:39:42', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('49', '1', '93507310C8F9C3DFE7F9BDEEFDDDEC59', '2022-03-01 22:45:14', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('50', '1', '3C2B43D41938715AD71A2D4A7EE52397', '2022-03-01 22:47:40', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('51', '1', 'F6190B2821F32C140D1E77E21E94E670', '2022-03-01 22:49:36', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('52', '1', '192E0F57845BD4310AEC1DE250075D74', '2022-03-02 00:15:02', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('53', '1', '1E19C8811310D0D73386E310E182D6AC', '2022-03-02 00:18:20', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('54', '1', 'DA48104BF261273BCDABDEE720CFF3A0', '2022-03-02 00:20:32', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('55', '1', '8DC368349FD18E1B493FD3CB59961576', '2022-03-02 00:23:47', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('56', '1', '80292B0652BAB1D7CA8DCAE98577C70A', '2022-03-02 12:59:09', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('57', '1', '386DBB6EE2517061018E58B6B35FF5B4', '2022-03-02 13:02:09', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('58', '1', '2E3908FDC3A09220C54C793359A949A8', '2022-03-02 13:03:37', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('59', '1', '0F107AC9A3DFB299406D97CFD99B6A42', '2022-03-02 13:08:55', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('60', '1', 'B4B2451AA35C2FB965512296FF0BA54A', '2022-03-02 18:08:07', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('61', '1', '7175D97C7BBDF18B4806A6C947E0F8D2', '2022-03-02 18:54:05', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('62', '1', 'F0079A64236062D699E82B87B33BCFCB', '2022-03-02 19:00:36', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('63', '1', 'B9F1B2A655158534F8BB1A6E232090FE', '2022-03-02 19:54:50', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('64', '1', 'C105B772ED9C0C84C44D41F46E7DBA1E', '2022-03-02 20:05:30', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('65', '1', '63D23414F9B7E197747B86B0034EBF53', '2022-03-02 20:10:04', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('66', '1', '90A09B113CC7FABDA8253BB88D425AF2', '2022-03-02 20:12:18', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('67', '1', '8CE6A815A89486950354F0703809BBEF', '2022-03-02 20:18:58', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('68', '2', '3EB71C057C1065C2F15C069382964467', '2022-03-02 20:19:38', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('69', '1', '76505EA2ECD3EF8E9E513929A0D02D97', '2022-03-02 20:40:31', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('70', '1', 'E29B1EC747DD00659F5A06E4B4F15BF9', '2022-03-02 20:53:46', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('71', '1', 'F267766A87FBC182C58FA1536BF2D715', '2022-03-02 20:55:48', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('72', '1', '1D943D71D50D21BFDF8AD0CFA6A68C68', '2022-03-02 21:01:26', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('73', '1', '11532948D094EB8FC21D3679A5939F7D', '2022-03-02 21:03:00', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('74', '1', '85D4540B21EA9333250126E9B091D3E6', '2022-03-02 21:05:54', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('75', '1', '914FA5D97615C2B54915EB102D142CCE', '2022-03-02 21:07:30', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('76', '1', '06ABD25C604A8E1594DA8D2FF193DDF2', '2022-03-02 21:09:45', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('77', '1', '0F771801F4F113A84EC68538CAC41CC6', '2022-03-02 21:11:57', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('78', '1', '7D962D63CED956192E535085CC7D2A52', '2022-03-02 22:08:49', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('79', '1', '983B0AD4F39E76317E8EB0D04CCFDF7A', '2022-03-02 22:28:48', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('80', '1', 'CAEE6F22C5D954686E6ACF2A4E46D948', '2022-03-02 23:01:42', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('81', '1', 'E54EB552A8B0E2FAFC9365E61F5F71D9', '2022-03-02 23:03:52', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('82', '1', '3BB2894BF1430F726CEE511B81571DC2', '2022-03-02 23:07:30', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('83', '1', '3BB2894BF1430F726CEE511B81571DC2', '2022-03-02 23:07:30', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('84', '2', '45658272904839D54213C02010014264', '2022-03-02 23:11:30', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('85', '1', '486809A4D11D15781755D61E71B7249D', '2022-03-02 23:15:01', '127.0.0.1', '湖南省岳阳市', 'Chrome 9');
INSERT INTO log_login VALUES ('86', '1', 'F31E9EE7B00B577C17725A6BF3467A92', '2022-03-04 15:01:00', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('87', '1', '1DDBB8070E63F7D5D4B181774323C400', '2022-03-04 15:12:11', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('88', '1', '498928F1463AD76CAD6DF2B785FEE94A', '2022-03-04 15:25:18', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('89', '1', '0ED29E5B15414D70247AFACBC6F2DD43', '2022-03-04 15:26:39', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('90', '1', 'D75668F8313C9158F22F79BB4B04976F', '2022-03-04 15:37:56', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('91', '1', '8DA37DA4ACBE8B8CB320599C9914CA31', '2022-03-04 15:49:41', '127.0.0.1', '湖南省长沙市', 'MSEdge');
INSERT INTO log_login VALUES ('92', '1', '9FD9CE0EB58D93C6610B30DE7F8F6B32', '2022-03-04 15:54:51', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('93', '1', 'DD5C7B543580AB29E9B4A95C5A7A34E5', '2022-03-04 16:00:48', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('94', '1', '1D80F26591D9EB010F52665728C523C5', '2022-03-04 16:04:34', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('95', '1', '8FC994B91C4403F63F414B8776C25EA9', '2022-03-04 16:10:13', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('96', '1', '1C882EFC71B901AF5DF91356562D3E4A', '2022-03-04 16:12:20', '127.0.0.1', '湖南省长沙市', 'Chrome 9');
INSERT INTO log_login VALUES ('97', '1', '3DE00C234843B03E99F72257687E8CA6', '2022-03-05 00:24:12', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('98', '1', '924C65B13D56FE301B078EAF7F902C60', '2022-03-05 00:30:59', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('99', '1', '45991C4FFCBC8F844B7F23F3C6C9D735', '2022-03-05 00:33:04', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('100', '1', 'E9FB6394ACC2FD899E481297751B93E5', '2022-03-05 00:38:23', '127.0.0.1', '湖南省岳阳市', 'MSEdge');
INSERT INTO log_login VALUES ('101', '1', 'FC27B9B44B83AE72458FEC59237CE00B', '2022-03-05 01:00:50', '127.0.0.1', '湖南省岳阳市', 'MSEdge');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` varchar(21500) NOT NULL,
  `begin_time` date NOT NULL,
  `end_time` date NOT NULL,
  `user_id` int(4) NOT NULL,
  `publish_time` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_u_n` (`user_id`),
  CONSTRAINT `fk_u_n` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO notice VALUES ('27', '测试', '1.&nbsp;从ResultSet读取时间<br><br>执行完SQL命令后返回一个ResultSet，当ResultSet里有时间字段的时候，<br><br>例：createTime：2014-11-11&nbsp;19:50:10，如何将时间取出来呢？<br><br><br>ResultSet.getDate&nbsp;方法，取出来的只有日期，2014-11-11<br>ResultSet.getTime&nbsp;方法，取出来的只有时间，19:50:10<br>ResultSet.getTimestamp方法，可以将日期和时间都出来，但是你会发现取出来的是&nbsp;:yyyy-mm-dd&nbsp;hh:mi:ss,z精确到毫秒。<br>如果取出来放到一个Date类型的字段，可以直接用ResultSet.getTimestamp取出来直接设置，毫秒会被过滤掉。<br><br>如果取出来的值被放到String类型的字段里，你要注意毫秒需不需要带，如果不需要的话，可以先用Date类型接收在转为String。<br><br>2.&nbsp;在SQL语句里设置时间<br><br>往数据库传字段的时候，怎么设值<br><br>new&nbsp;java.sql.Timestamp(new&nbsp;Date（）.getTime())<br><br>好像直接new&nbsp;Date（）&nbsp;也可以，还没搞明白区别，高手赐教<br><br><br>————————————————<br>版权声明：本文为CSDN博主「bingqilin_」的原创文章，遵循CC&nbsp;4.0&nbsp;BY-SA版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/bingqilin_/article/details/41016441', '2021-12-04', '2021-12-23', '1', '2021-12-23');
INSERT INTO notice VALUES ('31', '公示', '关于审批刘津豪同志为中共正式党员的请示<br><br>中共湖南理工学院信息科学与工程学院委员会：<br>根据发展党员工作有关规定，经支部大会讨论通过，同意刘津豪同志转为中共正式党员。<br>刘津豪，男，汉族，大专文化，湖南省衡阳市人，该同志于2020年12月01日被接收为中共预备党员，预备期一年，到2021年12月01日预备期满。入党介绍人：王勤、陶海兰。刘津豪同志在预备期间表现良好，在思想上坚持学习党的理论知识，坚定地拥护党的政策方针，积极向党组织靠拢。在学习上，他努力学习专业知识，于课外时间坚持阅读，注重自己拓宽自己的知识面，并积极思考，努力提升自己的文化素养。在工作上，他积极主动，责任心强，能够按时保质地完成上级安排的任务。在生活中，该同志作风良好，热爱生活，尊敬师长，友爱同学，能够积极主动地帮助有困难的同学，在同学中有一定威信，2021年12月01日，支部大会讨论了刘津豪同志的转正问题。支部有表决权的党员7名，实际到会7名。经与会党员讨论并采取无记名投票的方式进行表决，7票赞成，0票反对，0票弃权。根据表决结果，同意刘津豪同志按期转为中共正式党员。<br>现将刘津豪同志有关情况及相关材料上报，请审批。<br><br><br><br>中共湖南理工学院<br>信息科学与工程学院学生第三支部委员会<br>2021年12月02日<br>', '2021-12-27', '2021-12-27', '1', '2021-12-27');
INSERT INTO notice VALUES ('33', '关于举办湖南理工学院2021年田径运动会的通知', '关于举办湖南理工学院2021年田径运动会的通知校属各单位：为全面贯彻党的教育方针，落实立德树人根本任务，促进学生德智体美劳全面发展，充分展示学校体育教学、运动训练、课余竞赛成果，构建“团结、奋进、文明、育人”的校园体育文化，经学校研究决定举行湖南理工学院2021年田径运动会，现将有关事项通知如下：一、时间安排2021年12月2-3日（周四、周五），其中12月2日上午8:00举行开幕式，请全体在家校领导和二级单位负责人准时参加。二、地点安排东院田径场<br>-2-三、注意事项1.各单位要严格落实常态化疫情防控的有关要求，认真做好相关工作。2.各单位要高度重视，认组织师生积极参与，确保运动会气氛热烈、安全有序。3.运动会期间，校车正常运行，行政管理人员照常上班，辅导员、班主任要认真做好学生各方面的管理工作。4.学生停课，但不放假，各学院要组织好不参加比赛的学生观看比赛或自习。5.如遇不宜天气，学校将即时下达延期通知，师生按周四、周五课表上课。中共湖南理工学院委员会办公室湖南理工学院校长办公室2021年11月30日', '2021-12-28', '2021-12-28', '2', '2021-12-28');
INSERT INTO notice VALUES ('34', '测试参数', '123', '2022-03-01', '2022-03-01', '1', '2022-03-01');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(4) NOT NULL,
  `role_name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO role VALUES ('0', '超级管理员', '全部权限');
INSERT INTO role VALUES ('1', '普通管理员', '大部分权限');
INSERT INTO role VALUES ('2', '临时管理员', '部分权限');

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `staff_id` int(6) NOT NULL,
  `salary` float NOT NULL,
  `subsidy` float NOT NULL,
  `bonus` float NOT NULL,
  `annual` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s_m` (`staff_id`),
  CONSTRAINT `fk_s_s` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO salary VALUES ('34', '105000', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('35', '155379', '18000', '1200', '3200', '313600');
INSERT INTO salary VALUES ('36', '167753', '27000', '1800', '4800', '470400');
INSERT INTO salary VALUES ('37', '155516', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('38', '185858', '54000', '3600', '9600', '940800');
INSERT INTO salary VALUES ('39', '134015', '18000', '1500', '3000', '360000');
INSERT INTO salary VALUES ('40', '164369', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('41', '102467', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('42', '144135', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('43', '160507', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('44', '142594', '72000', '6000', '12000', '1440000');
INSERT INTO salary VALUES ('45', '116513', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('46', '184747', '45000', '3000', '8000', '784000');
INSERT INTO salary VALUES ('47', '111571', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('48', '135557', '30000', '2500', '5000', '600000');
INSERT INTO salary VALUES ('49', '142708', '31500', '2100', '5600', '548800');
INSERT INTO salary VALUES ('50', '116898', '13500', '900', '2400', '235200');
INSERT INTO salary VALUES ('51', '185894', '54000', '4500', '9000', '1080000');
INSERT INTO salary VALUES ('52', '178388', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('53', '191595', '49500', '3300', '8800', '862400');
INSERT INTO salary VALUES ('54', '165806', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('55', '161475', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('56', '122982', '27000', '1800', '4800', '470400');
INSERT INTO salary VALUES ('57', '194018', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('58', '198219', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('59', '129625', '12000', '1000', '2000', '240000');
INSERT INTO salary VALUES ('60', '108576', '54000', '4500', '9000', '1080000');
INSERT INTO salary VALUES ('61', '153860', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('62', '125813', '72000', '6000', '12000', '1440000');
INSERT INTO salary VALUES ('63', '114742', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('64', '137823', '49500', '3300', '8800', '862400');
INSERT INTO salary VALUES ('65', '163634', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('66', '169391', '22500', '1500', '4000', '392000');
INSERT INTO salary VALUES ('67', '161477', '54000', '3600', '9600', '940800');
INSERT INTO salary VALUES ('68', '143724', '54000', '3600', '9600', '940800');
INSERT INTO salary VALUES ('69', '141686', '36000', '3000', '6000', '720000');
INSERT INTO salary VALUES ('70', '171549', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('71', '174501', '18000', '1200', '3200', '313600');
INSERT INTO salary VALUES ('72', '139769', '54000', '4500', '9000', '1080000');
INSERT INTO salary VALUES ('73', '140613', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('74', '111152', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('75', '142212', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('76', '193868', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('77', '131940', '12000', '1000', '2000', '240000');
INSERT INTO salary VALUES ('78', '176173', '31500', '2100', '5600', '548800');
INSERT INTO salary VALUES ('79', '103072', '58500', '3900', '10400', '1019200');
INSERT INTO salary VALUES ('80', '197702', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('81', '106291', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('82', '145728', '22500', '1500', '4000', '392000');
INSERT INTO salary VALUES ('83', '147206', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('84', '177729', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('85', '101566', '58500', '3900', '10400', '1019200');
INSERT INTO salary VALUES ('86', '148250', '6500', '1300', '3900', '140400');
INSERT INTO salary VALUES ('87', '182293', '12000', '1000', '2000', '240000');
INSERT INTO salary VALUES ('88', '129042', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('89', '173430', '63000', '4200', '11200', '1097600');
INSERT INTO salary VALUES ('90', '162894', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('91', '109220', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('92', '103547', '48000', '4000', '8000', '960000');
INSERT INTO salary VALUES ('93', '193346', '31500', '2100', '5600', '548800');
INSERT INTO salary VALUES ('94', '103892', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('95', '147194', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('96', '163672', '18000', '1500', '3000', '360000');
INSERT INTO salary VALUES ('97', '150308', '5500', '1100', '3300', '118800');
INSERT INTO salary VALUES ('98', '150046', '30000', '2500', '5000', '600000');
INSERT INTO salary VALUES ('99', '121752', '2500', '500', '1500', '54000');
INSERT INTO salary VALUES ('100', '126460', '84000', '7000', '14000', '1680000');
INSERT INTO salary VALUES ('101', '105440', '72000', '6000', '12000', '1440000');
INSERT INTO salary VALUES ('102', '182151', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('103', '103747', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('104', '175380', '36000', '3000', '6000', '720000');
INSERT INTO salary VALUES ('105', '123721', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('106', '193909', '2500', '500', '1500', '54000');
INSERT INTO salary VALUES ('107', '154744', '1000', '200', '600', '21600');
INSERT INTO salary VALUES ('108', '148685', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('109', '111486', '18000', '1200', '3200', '313600');
INSERT INTO salary VALUES ('110', '132307', '4000', '800', '2400', '86400');
INSERT INTO salary VALUES ('111', '117349', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('112', '157031', '22500', '1500', '4000', '392000');
INSERT INTO salary VALUES ('113', '152757', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('114', '184945', '12000', '1000', '2000', '240000');
INSERT INTO salary VALUES ('115', '129786', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('116', '150658', '6000', '500', '1000', '120000');
INSERT INTO salary VALUES ('117', '160835', '36000', '3000', '6000', '720000');
INSERT INTO salary VALUES ('118', '158049', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('119', '147558', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('120', '132428', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('121', '151098', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('122', '146775', '5000', '1000', '3000', '108000');
INSERT INTO salary VALUES ('123', '118789', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('124', '157260', '13500', '900', '2400', '235200');
INSERT INTO salary VALUES ('125', '100505', '45000', '3000', '8000', '784000');
INSERT INTO salary VALUES ('126', '156070', '5000', '1000', '3000', '108000');
INSERT INTO salary VALUES ('127', '151711', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('128', '126294', '27000', '1800', '4800', '470400');
INSERT INTO salary VALUES ('129', '193611', '3000', '600', '1800', '64800');
INSERT INTO salary VALUES ('130', '128731', '49500', '3300', '8800', '862400');
INSERT INTO salary VALUES ('131', '199156', '36000', '3000', '6000', '720000');
INSERT INTO salary VALUES ('132', '136723', '3000', '600', '1800', '64800');
INSERT INTO salary VALUES ('133', '137742', '84000', '7000', '14000', '1680000');
INSERT INTO salary VALUES ('134', '168767', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('135', '110875', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('136', '168788', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('137', '180668', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('138', '107733', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('139', '193009', '1000', '200', '600', '21600');
INSERT INTO salary VALUES ('140', '111963', '27000', '1800', '4800', '470400');
INSERT INTO salary VALUES ('141', '119054', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('142', '157397', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('143', '120534', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('144', '136142', '1500', '300', '900', '32400');
INSERT INTO salary VALUES ('145', '183109', '84000', '7000', '14000', '1680000');
INSERT INTO salary VALUES ('146', '171724', '3000', '600', '1800', '64800');
INSERT INTO salary VALUES ('147', '135643', '84000', '7000', '14000', '1680000');
INSERT INTO salary VALUES ('148', '106082', '54000', '3600', '9600', '940800');
INSERT INTO salary VALUES ('149', '197899', '54000', '3600', '9600', '940800');
INSERT INTO salary VALUES ('150', '128634', '6000', '500', '1000', '120000');
INSERT INTO salary VALUES ('151', '192319', '13500', '900', '2400', '235200');
INSERT INTO salary VALUES ('152', '156520', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('153', '154591', '54000', '4500', '9000', '1080000');
INSERT INTO salary VALUES ('154', '144878', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('155', '196001', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('156', '124798', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('157', '108854', '1500', '300', '900', '32400');
INSERT INTO salary VALUES ('158', '126408', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('159', '102071', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('160', '132573', '22500', '1500', '4000', '392000');
INSERT INTO salary VALUES ('161', '135525', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('162', '198324', '1000', '200', '600', '21600');
INSERT INTO salary VALUES ('163', '124997', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('164', '198819', '42000', '3500', '7000', '840000');
INSERT INTO salary VALUES ('165', '108388', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('166', '183080', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('167', '182289', '1000', '200', '600', '21600');
INSERT INTO salary VALUES ('168', '196676', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('169', '184469', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('170', '104129', '42000', '3500', '7000', '840000');
INSERT INTO salary VALUES ('171', '199963', '22500', '1500', '4000', '392000');
INSERT INTO salary VALUES ('172', '107001', '22500', '1500', '4000', '392000');
INSERT INTO salary VALUES ('173', '148427', '5500', '1100', '3300', '118800');
INSERT INTO salary VALUES ('174', '182951', '500', '100', '300', '10800');
INSERT INTO salary VALUES ('175', '184721', '22500', '1500', '4000', '392000');
INSERT INTO salary VALUES ('176', '150285', '2500', '500', '1500', '54000');
INSERT INTO salary VALUES ('177', '121646', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('178', '192194', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('179', '196296', '31500', '2100', '5600', '548800');
INSERT INTO salary VALUES ('180', '130761', '1000', '200', '600', '21600');
INSERT INTO salary VALUES ('181', '140898', '84000', '7000', '14000', '1680000');
INSERT INTO salary VALUES ('182', '199328', '3000', '600', '1800', '64800');
INSERT INTO salary VALUES ('183', '145358', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('184', '160483', '45000', '3000', '8000', '784000');
INSERT INTO salary VALUES ('185', '121222', '1500', '300', '900', '32400');
INSERT INTO salary VALUES ('186', '108438', '84000', '7000', '14000', '1680000');
INSERT INTO salary VALUES ('187', '129733', '3000', '600', '1800', '64800');
INSERT INTO salary VALUES ('188', '146075', '36000', '3000', '6000', '720000');
INSERT INTO salary VALUES ('189', '126861', '2500', '500', '1500', '54000');
INSERT INTO salary VALUES ('190', '138397', '12000', '1000', '2000', '240000');
INSERT INTO salary VALUES ('191', '179750', '13500', '900', '2400', '235200');
INSERT INTO salary VALUES ('192', '178710', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('193', '156907', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('194', '162586', '31500', '2100', '5600', '548800');
INSERT INTO salary VALUES ('195', '179523', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('196', '187295', '45000', '3000', '8000', '784000');
INSERT INTO salary VALUES ('197', '196631', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('198', '184332', '60000', '5000', '10000', '1200000');
INSERT INTO salary VALUES ('199', '180490', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('200', '185566', '42000', '3500', '7000', '840000');
INSERT INTO salary VALUES ('201', '136227', '6500', '1300', '3900', '140400');
INSERT INTO salary VALUES ('202', '186351', '36000', '3000', '6000', '720000');
INSERT INTO salary VALUES ('203', '142002', '3500', '700', '2100', '75600');
INSERT INTO salary VALUES ('204', '120751', '500', '100', '300', '10800');
INSERT INTO salary VALUES ('205', '186016', '4500', '300', '800', '78400');
INSERT INTO salary VALUES ('206', '118930', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('207', '123248', '1000', '200', '600', '21600');
INSERT INTO salary VALUES ('208', '150893', '2500', '500', '1500', '54000');
INSERT INTO salary VALUES ('209', '131909', '5000', '1000', '3000', '108000');
INSERT INTO salary VALUES ('210', '109050', '12000', '1000', '2000', '240000');
INSERT INTO salary VALUES ('211', '127279', '72000', '6000', '12000', '1440000');
INSERT INTO salary VALUES ('212', '139846', '5000', '1000', '3000', '108000');
INSERT INTO salary VALUES ('213', '164598', '18000', '1200', '3200', '313600');
INSERT INTO salary VALUES ('214', '106751', '3500', '700', '2100', '75600');
INSERT INTO salary VALUES ('215', '156293', '3000', '600', '1800', '64800');
INSERT INTO salary VALUES ('216', '157349', '4500', '900', '2700', '97200');
INSERT INTO salary VALUES ('217', '161770', '54000', '4500', '9000', '1080000');
INSERT INTO salary VALUES ('218', '146986', '36000', '2400', '6400', '627200');
INSERT INTO salary VALUES ('219', '170506', '6500', '1300', '3900', '140400');
INSERT INTO salary VALUES ('220', '189982', '31500', '2100', '5600', '548800');
INSERT INTO salary VALUES ('221', '132749', '22500', '1500', '4000', '392000');
INSERT INTO salary VALUES ('222', '171378', '54000', '4500', '9000', '1080000');
INSERT INTO salary VALUES ('223', '148108', '6500', '1300', '3900', '140400');
INSERT INTO salary VALUES ('224', '161153', '18000', '1200', '3200', '313600');
INSERT INTO salary VALUES ('225', '195821', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('226', '118361', '48000', '4000', '8000', '960000');
INSERT INTO salary VALUES ('227', '120485', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('228', '152999', '18000', '1200', '3200', '313600');
INSERT INTO salary VALUES ('229', '195993', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('230', '185390', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('231', '173141', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('232', '199226', '54000', '4500', '9000', '1080000');
INSERT INTO salary VALUES ('233', '151339', '5000', '1000', '3000', '108000');
INSERT INTO salary VALUES ('234', '116360', '36000', '3000', '6000', '720000');
INSERT INTO salary VALUES ('235', '182580', '84000', '7000', '14000', '1680000');
INSERT INTO salary VALUES ('236', '124397', '6000', '500', '1000', '120000');
INSERT INTO salary VALUES ('237', '171215', '78000', '6500', '13000', '1560000');
INSERT INTO salary VALUES ('238', '185157', '58500', '3900', '10400', '1019200');
INSERT INTO salary VALUES ('239', '149256', '72000', '6000', '12000', '1440000');
INSERT INTO salary VALUES ('240', '139871', '5500', '1100', '3300', '118800');
INSERT INTO salary VALUES ('241', '134340', '45000', '3000', '8000', '784000');
INSERT INTO salary VALUES ('242', '123910', '45000', '3000', '8000', '784000');
INSERT INTO salary VALUES ('243', '199228', '4500', '900', '2700', '97200');
INSERT INTO salary VALUES ('244', '179445', '4000', '800', '2400', '86400');
INSERT INTO salary VALUES ('245', '111688', '45000', '3000', '8000', '784000');
INSERT INTO salary VALUES ('246', '180656', '4000', '800', '2400', '86400');
INSERT INTO salary VALUES ('247', '151256', '72000', '6000', '12000', '1440000');
INSERT INTO salary VALUES ('248', '148283', '6500', '1300', '3900', '140400');
INSERT INTO salary VALUES ('249', '196346', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('250', '131976', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('251', '181909', '18000', '1500', '3000', '360000');
INSERT INTO salary VALUES ('252', '126462', '54000', '3600', '9600', '940800');
INSERT INTO salary VALUES ('253', '179871', '4000', '800', '2400', '86400');
INSERT INTO salary VALUES ('254', '150771', '40500', '2700', '7200', '705600');
INSERT INTO salary VALUES ('255', '125969', '30000', '2500', '5000', '600000');
INSERT INTO salary VALUES ('256', '110610', '5000', '1000', '3000', '108000');
INSERT INTO salary VALUES ('257', '133614', '6500', '1300', '3900', '140400');
INSERT INTO salary VALUES ('258', '180112', '49500', '3300', '8800', '862400');
INSERT INTO salary VALUES ('259', '109929', '500', '100', '300', '10800');
INSERT INTO salary VALUES ('260', '120899', '500', '100', '300', '10800');
INSERT INTO salary VALUES ('261', '133615', '2000', '400', '1200', '43200');
INSERT INTO salary VALUES ('262', '109628', '54000', '4500', '9000', '1080000');
INSERT INTO salary VALUES ('263', '110316', '66000', '5500', '11000', '1320000');
INSERT INTO salary VALUES ('264', '179907', '58500', '3900', '10400', '1019200');
INSERT INTO salary VALUES ('265', '164614', '13500', '900', '2400', '235200');
INSERT INTO salary VALUES ('266', '120297', '72000', '6000', '12000', '1440000');
INSERT INTO salary VALUES ('267', '134131', '27000', '1800', '4800', '470400');
INSERT INTO salary VALUES ('268', '114615', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('269', '121495', '24000', '2000', '4000', '480000');
INSERT INTO salary VALUES ('270', '173827', '3500', '700', '2100', '75600');
INSERT INTO salary VALUES ('271', '142678', '36000', '2400', '6400', '627200');
INSERT INTO salary VALUES ('272', '187846', '3500', '700', '2100', '75600');
INSERT INTO salary VALUES ('273', '144618', '9000', '600', '1600', '156800');
INSERT INTO salary VALUES ('274', '151432', '1500', '300', '900', '32400');
INSERT INTO salary VALUES ('275', '121089', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('276', '139686', '6000', '1200', '3600', '129600');
INSERT INTO salary VALUES ('277', '194518', '31500', '2100', '5600', '548800');
INSERT INTO salary VALUES ('278', '181546', '30000', '2500', '5000', '600000');
INSERT INTO salary VALUES ('279', '127277', '48000', '4000', '8000', '960000');
INSERT INTO salary VALUES ('280', '169805', '54000', '3600', '9600', '940800');
INSERT INTO salary VALUES ('281', '150338', '30000', '2500', '5000', '600000');
INSERT INTO salary VALUES ('282', '189643', '13500', '900', '2400', '235200');
INSERT INTO salary VALUES ('283', '140467', '13500', '900', '2400', '235200');
INSERT INTO salary VALUES ('284', '194649', '2000', '400', '1200', '43200');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` char(2) NOT NULL,
  `department` varchar(20) NOT NULL,
  `rank` int(4) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `FK_m_s` (`department`),
  CONSTRAINT `FK_m_s` FOREIGN KEY (`department`) REFERENCES `department` (`department`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO staff VALUES ('100505', '宇文月良', '男', '研发部', '10');
INSERT INTO staff VALUES ('101566', '蒯兰珍', '女', '研发部', '13');
INSERT INTO staff VALUES ('102071', '慕容雄冠', '女', '管理部', '10');
INSERT INTO staff VALUES ('102467', '苗依启', '男', '研发部', '2');
INSERT INTO staff VALUES ('103072', '涂枝', '女', '研发部', '13');
INSERT INTO staff VALUES ('103547', '干雪倩', '男', '管理部', '8');
INSERT INTO staff VALUES ('103747', '司空雪', '女', '实习部', '4');
INSERT INTO staff VALUES ('103892', '乜行利', '男', '管理部', '4');
INSERT INTO staff VALUES ('104129', '晁龙聪', '女', '管理部', '7');
INSERT INTO staff VALUES ('105000', '张智霖', '男', '管理部', '10');
INSERT INTO staff VALUES ('105440', '仲孙筠梦', '男', '管理部', '12');
INSERT INTO staff VALUES ('106082', '潘晓', '女', '研发部', '12');
INSERT INTO staff VALUES ('106291', '全楠', '男', '研发部', '2');
INSERT INTO staff VALUES ('106751', '百乔君', '女', '实习部', '7');
INSERT INTO staff VALUES ('107001', '滕全旭', '女', '研发部', '5');
INSERT INTO staff VALUES ('107733', '苏昕淇', '男', '实习部', '4');
INSERT INTO staff VALUES ('108388', '巫媛', '女', '研发部', '9');
INSERT INTO staff VALUES ('108438', '全强一', '男', '管理部', '14');
INSERT INTO staff VALUES ('108576', '姜惠浩', '女', '管理部', '9');
INSERT INTO staff VALUES ('108854', '丘可', '男', '实习部', '3');
INSERT INTO staff VALUES ('109050', '冷刚国', '男', '管理部', '2');
INSERT INTO staff VALUES ('109220', '田钧', '女', '管理部', '13');
INSERT INTO staff VALUES ('109628', '阎明', '女', '管理部', '9');
INSERT INTO staff VALUES ('109929', '鄂伦薇', '女', '实习部', '1');
INSERT INTO staff VALUES ('110316', '年英璐', '女', '管理部', '11');
INSERT INTO staff VALUES ('110610', '仰乔', '男', '实习部', '10');
INSERT INTO staff VALUES ('110875', '离环涵', '男', '管理部', '11');
INSERT INTO staff VALUES ('111152', '从珍', '男', '管理部', '10');
INSERT INTO staff VALUES ('111486', '支美宜', '男', '研发部', '4');
INSERT INTO staff VALUES ('111571', '许发', '女', '管理部', '11');
INSERT INTO staff VALUES ('111688', '禹伊尧', '女', '研发部', '10');
INSERT INTO staff VALUES ('111963', '云沅', '男', '研发部', '6');
INSERT INTO staff VALUES ('114615', '朱静晋', '男', '实习部', '12');
INSERT INTO staff VALUES ('114742', '农欢丞', '女', '管理部', '4');
INSERT INTO staff VALUES ('116360', '周健媛', '女', '管理部', '6');
INSERT INTO staff VALUES ('116513', '夹秀', '女', '管理部', '13');
INSERT INTO staff VALUES ('116898', '充华', '女', '研发部', '3');
INSERT INTO staff VALUES ('117349', '俞欣依', '男', '管理部', '13');
INSERT INTO staff VALUES ('118361', '房艳宣', '男', '管理部', '8');
INSERT INTO staff VALUES ('118789', '宗君', '男', '管理部', '11');
INSERT INTO staff VALUES ('118930', '明奕芬', '女', '实习部', '12');
INSERT INTO staff VALUES ('119054', '柳仁雨', '男', '研发部', '9');
INSERT INTO staff VALUES ('120297', '百里建', '女', '管理部', '12');
INSERT INTO staff VALUES ('120485', '盖芝亚', '男', '管理部', '13');
INSERT INTO staff VALUES ('120534', '璩尧元', '男', '实习部', '12');
INSERT INTO staff VALUES ('120751', '林先钧', '女', '实习部', '1');
INSERT INTO staff VALUES ('120899', '龙华', '男', '实习部', '1');
INSERT INTO staff VALUES ('121089', '柴勤伦', '男', '实习部', '12');
INSERT INTO staff VALUES ('121222', '危兴', '女', '实习部', '3');
INSERT INTO staff VALUES ('121495', '公佑', '男', '管理部', '4');
INSERT INTO staff VALUES ('121646', '印福', '男', '管理部', '11');
INSERT INTO staff VALUES ('121752', '盛卿滢', '男', '实习部', '5');
INSERT INTO staff VALUES ('122982', '戎媛', '女', '研发部', '6');
INSERT INTO staff VALUES ('123248', '归飞卿', '女', '实习部', '2');
INSERT INTO staff VALUES ('123721', '陆宁柔', '男', '管理部', '10');
INSERT INTO staff VALUES ('123910', '钮伊丞', '女', '研发部', '10');
INSERT INTO staff VALUES ('124397', '乜泽瑶', '男', '管理部', '1');
INSERT INTO staff VALUES ('124798', '吴静', '女', '管理部', '12');
INSERT INTO staff VALUES ('124997', '都博灵', '男', '管理部', '4');
INSERT INTO staff VALUES ('125813', '隗信', '男', '管理部', '12');
INSERT INTO staff VALUES ('125969', '郭先琳', '男', '管理部', '5');
INSERT INTO staff VALUES ('126294', '东郭憧寒', '男', '研发部', '6');
INSERT INTO staff VALUES ('126408', '樊瑶', '女', '管理部', '13');
INSERT INTO staff VALUES ('126460', '郦瑶保', '女', '管理部', '14');
INSERT INTO staff VALUES ('126462', '百里璐', '女', '研发部', '12');
INSERT INTO staff VALUES ('126861', '木沂武', '男', '实习部', '5');
INSERT INTO staff VALUES ('127277', '单可', '男', '管理部', '8');
INSERT INTO staff VALUES ('127279', '钱咏', '女', '管理部', '12');
INSERT INTO staff VALUES ('128634', '申旭姬', '男', '管理部', '1');
INSERT INTO staff VALUES ('128731', '伯惠艳', '女', '研发部', '11');
INSERT INTO staff VALUES ('129042', '令狐翔娟', '男', '管理部', '13');
INSERT INTO staff VALUES ('129625', '墨玉', '男', '管理部', '2');
INSERT INTO staff VALUES ('129733', '管信', '女', '实习部', '6');
INSERT INTO staff VALUES ('129786', '籍昊', '男', '实习部', '12');
INSERT INTO staff VALUES ('130761', '扶晴强', '男', '实习部', '2');
INSERT INTO staff VALUES ('131909', '封妤', '女', '实习部', '10');
INSERT INTO staff VALUES ('131940', '欧阳岚淑', '女', '管理部', '2');
INSERT INTO staff VALUES ('131976', '缪雅', '男', '研发部', '9');
INSERT INTO staff VALUES ('132307', '人弘晴', '男', '实习部', '8');
INSERT INTO staff VALUES ('132428', '门明滢', '女', '管理部', '4');
INSERT INTO staff VALUES ('132573', '岳卿淇', '女', '研发部', '5');
INSERT INTO staff VALUES ('132749', '缑中明', '男', '研发部', '5');
INSERT INTO staff VALUES ('133614', '延璐', '女', '实习部', '13');
INSERT INTO staff VALUES ('133615', '孙策宇', '女', '实习部', '4');
INSERT INTO staff VALUES ('134015', '干亦', '女', '管理部', '3');
INSERT INTO staff VALUES ('134131', '阙欣翔', '女', '研发部', '6');
INSERT INTO staff VALUES ('134340', '居顺夕', '女', '研发部', '10');
INSERT INTO staff VALUES ('135525', '木真铭', '男', '实习部', '4');
INSERT INTO staff VALUES ('135557', '生山惠', '男', '管理部', '5');
INSERT INTO staff VALUES ('135643', '孙毅', '女', '管理部', '14');
INSERT INTO staff VALUES ('136142', '邰文奕', '女', '实习部', '3');
INSERT INTO staff VALUES ('136227', '拓渊', '女', '实习部', '13');
INSERT INTO staff VALUES ('136723', '桓憧', '女', '实习部', '6');
INSERT INTO staff VALUES ('137742', '钱峰枫', '男', '管理部', '14');
INSERT INTO staff VALUES ('137823', '蓟莉园', '男', '研发部', '11');
INSERT INTO staff VALUES ('138397', '沙丽', '男', '管理部', '2');
INSERT INTO staff VALUES ('139686', '衡福', '男', '实习部', '12');
INSERT INTO staff VALUES ('139769', '季龙策', '男', '管理部', '9');
INSERT INTO staff VALUES ('139846', '台乔姬', '女', '实习部', '10');
INSERT INTO staff VALUES ('139871', '乐冠苑', '女', '实习部', '11');
INSERT INTO staff VALUES ('140467', '余勇', '男', '研发部', '3');
INSERT INTO staff VALUES ('140613', '文义风', '男', '管理部', '10');
INSERT INTO staff VALUES ('140898', '马颖良', '女', '管理部', '14');
INSERT INTO staff VALUES ('141686', '皇英', '男', '管理部', '6');
INSERT INTO staff VALUES ('142002', '百里美达', '女', '实习部', '7');
INSERT INTO staff VALUES ('142212', '桓伦英', '女', '研发部', '9');
INSERT INTO staff VALUES ('142594', '扶楠保', '女', '管理部', '12');
INSERT INTO staff VALUES ('142678', '乌梦', '女', '研发部', '8');
INSERT INTO staff VALUES ('142708', '山眉', '男', '研发部', '7');
INSERT INTO staff VALUES ('143724', '茹勤', '女', '研发部', '12');
INSERT INTO staff VALUES ('144135', '郑文', '女', '研发部', '2');
INSERT INTO staff VALUES ('144618', '虞宜仪', '男', '研发部', '2');
INSERT INTO staff VALUES ('144878', '丘天雅', '男', '管理部', '4');
INSERT INTO staff VALUES ('145358', '呼风', '男', '管理部', '13');
INSERT INTO staff VALUES ('145728', '公淑海', '女', '研发部', '5');
INSERT INTO staff VALUES ('146075', '公孙芬元', '男', '管理部', '6');
INSERT INTO staff VALUES ('146775', '完颜雁宜', '男', '实习部', '10');
INSERT INTO staff VALUES ('146986', '禹皑璧', '女', '研发部', '8');
INSERT INTO staff VALUES ('147194', '平怡', '男', '管理部', '13');
INSERT INTO staff VALUES ('147206', '南菁琰', '女', '管理部', '10');
INSERT INTO staff VALUES ('147558', '郭彤', '女', '研发部', '2');
INSERT INTO staff VALUES ('148108', '司保', '女', '实习部', '13');
INSERT INTO staff VALUES ('148250', '翟亚', '男', '实习部', '13');
INSERT INTO staff VALUES ('148283', '元学珠', '男', '实习部', '13');
INSERT INTO staff VALUES ('148427', '师诗', '女', '实习部', '11');
INSERT INTO staff VALUES ('148685', '谷姬', '男', '实习部', '12');
INSERT INTO staff VALUES ('149256', '乐雅', '女', '管理部', '12');
INSERT INTO staff VALUES ('150046', '拓岚飞', '女', '管理部', '5');
INSERT INTO staff VALUES ('150285', '许丞山', '男', '实习部', '5');
INSERT INTO staff VALUES ('150308', '扈榕文', '男', '实习部', '11');
INSERT INTO staff VALUES ('150338', '司翠', '女', '管理部', '5');
INSERT INTO staff VALUES ('150658', '贾志先', '女', '管理部', '1');
INSERT INTO staff VALUES ('150771', '屠钊', '女', '研发部', '9');
INSERT INTO staff VALUES ('150893', '公孙冰丽', '女', '实习部', '5');
INSERT INTO staff VALUES ('151098', '卜铭', '男', '管理部', '10');
INSERT INTO staff VALUES ('151256', '宇文成宜', '女', '管理部', '12');
INSERT INTO staff VALUES ('151339', '隆康静', '女', '实习部', '10');
INSERT INTO staff VALUES ('151432', '经海珠', '女', '实习部', '3');
INSERT INTO staff VALUES ('151711', '冶悦素', '男', '研发部', '9');
INSERT INTO staff VALUES ('152757', '阳海明', '女', '实习部', '12');
INSERT INTO staff VALUES ('152999', '皮荣', '女', '研发部', '4');
INSERT INTO staff VALUES ('153860', '叔芳', '男', '管理部', '4');
INSERT INTO staff VALUES ('154591', '宋维', '女', '管理部', '9');
INSERT INTO staff VALUES ('154744', '孙乾憧', '女', '实习部', '2');
INSERT INTO staff VALUES ('155379', '上岩行', '男', '研发部', '4');
INSERT INTO staff VALUES ('155516', '俟英凡', '女', '管理部', '4');
INSERT INTO staff VALUES ('156070', '公伯弘婉', '男', '实习部', '10');
INSERT INTO staff VALUES ('156293', '丘慧', '女', '实习部', '6');
INSERT INTO staff VALUES ('156520', '舌哲', '女', '管理部', '13');
INSERT INTO staff VALUES ('156907', '解凯英', '女', '研发部', '9');
INSERT INTO staff VALUES ('157031', '池维', '女', '研发部', '5');
INSERT INTO staff VALUES ('157260', '包琛沫', '女', '研发部', '3');
INSERT INTO staff VALUES ('157349', '完颜学国', '男', '实习部', '9');
INSERT INTO staff VALUES ('157397', '厍雅勇', '男', '研发部', '2');
INSERT INTO staff VALUES ('158049', '舒华克', '女', '实习部', '4');
INSERT INTO staff VALUES ('160483', '于娴', '女', '研发部', '10');
INSERT INTO staff VALUES ('160507', '颛珍', '女', '管理部', '4');
INSERT INTO staff VALUES ('160835', '夏侯军妍', '男', '管理部', '6');
INSERT INTO staff VALUES ('161153', '轩辕影', '女', '研发部', '4');
INSERT INTO staff VALUES ('161475', '欧龙', '男', '研发部', '2');
INSERT INTO staff VALUES ('161477', '和芝', '男', '研发部', '12');
INSERT INTO staff VALUES ('161770', '司马中保', '女', '管理部', '9');
INSERT INTO staff VALUES ('162586', '昌茗融', '女', '研发部', '7');
INSERT INTO staff VALUES ('162894', '爱芝士', '女', '管理部', '13');
INSERT INTO staff VALUES ('163634', '于涵莉', '男', '研发部', '9');
INSERT INTO staff VALUES ('163672', '冶奕', '男', '管理部', '3');
INSERT INTO staff VALUES ('164369', '章韵贵', '男', '研发部', '9');
INSERT INTO staff VALUES ('164598', '爱佳', '男', '研发部', '4');
INSERT INTO staff VALUES ('164614', '丘璐', '女', '研发部', '3');
INSERT INTO staff VALUES ('165806', '鄂士力', '男', '管理部', '13');
INSERT INTO staff VALUES ('167753', '于逸勤', '女', '研发部', '6');
INSERT INTO staff VALUES ('168767', '西泰韵', '女', '管理部', '11');
INSERT INTO staff VALUES ('168788', '宗婕航', '女', '管理部', '11');
INSERT INTO staff VALUES ('169391', '寇伊达', '男', '研发部', '5');
INSERT INTO staff VALUES ('169805', '福安', '女', '研发部', '12');
INSERT INTO staff VALUES ('170506', '羿洋钧', '男', '实习部', '13');
INSERT INTO staff VALUES ('171215', '夏侯荷莉', '女', '管理部', '13');
INSERT INTO staff VALUES ('171378', '东波', '女', '管理部', '9');
INSERT INTO staff VALUES ('171549', '宰姣', '男', '研发部', '2');
INSERT INTO staff VALUES ('171724', '况璧泰', '男', '实习部', '6');
INSERT INTO staff VALUES ('173141', '於丹吉', '男', '管理部', '11');
INSERT INTO staff VALUES ('173430', '公瑞', '女', '研发部', '14');
INSERT INTO staff VALUES ('173827', '公孙珠洋', '男', '实习部', '7');
INSERT INTO staff VALUES ('174501', '欧颖坤', '男', '研发部', '4');
INSERT INTO staff VALUES ('175380', '那盛', '女', '管理部', '6');
INSERT INTO staff VALUES ('176173', '慕容栋华', '男', '研发部', '7');
INSERT INTO staff VALUES ('177729', '耿乐荣', '男', '研发部', '9');
INSERT INTO staff VALUES ('178388', '方娟夕', '男', '研发部', '9');
INSERT INTO staff VALUES ('178710', '危达', '女', '研发部', '9');
INSERT INTO staff VALUES ('179445', '亢泉', '女', '实习部', '8');
INSERT INTO staff VALUES ('179523', '茹珍铭', '女', '研发部', '2');
INSERT INTO staff VALUES ('179750', '云强', '女', '研发部', '3');
INSERT INTO staff VALUES ('179871', '鬱飞', '男', '实习部', '8');
INSERT INTO staff VALUES ('179907', '孙涛雪', '男', '研发部', '13');
INSERT INTO staff VALUES ('180112', '朱茜芝', '女', '研发部', '11');
INSERT INTO staff VALUES ('180490', '赫蓉泰', '男', '管理部', '13');
INSERT INTO staff VALUES ('180656', '闾清', '男', '实习部', '8');
INSERT INTO staff VALUES ('180668', '家华', '男', '管理部', '4');
INSERT INTO staff VALUES ('181546', '禹静', '男', '管理部', '5');
INSERT INTO staff VALUES ('181909', '任芝', '女', '管理部', '3');
INSERT INTO staff VALUES ('182151', '哈舒', '女', '实习部', '4');
INSERT INTO staff VALUES ('182289', '陶钧倩', '男', '实习部', '2');
INSERT INTO staff VALUES ('182293', '佴亮娟', '男', '管理部', '2');
INSERT INTO staff VALUES ('182580', '南炎', '男', '管理部', '14');
INSERT INTO staff VALUES ('182951', '司马乔毅', '女', '实习部', '1');
INSERT INTO staff VALUES ('183080', '徐羽良', '男', '管理部', '11');
INSERT INTO staff VALUES ('183109', '闵美', '男', '管理部', '14');
INSERT INTO staff VALUES ('184332', '成泽晨', '女', '管理部', '10');
INSERT INTO staff VALUES ('184469', '田亦天', '男', '实习部', '4');
INSERT INTO staff VALUES ('184721', '屠铭璧', '男', '研发部', '5');
INSERT INTO staff VALUES ('184747', '富灵', '男', '研发部', '10');
INSERT INTO staff VALUES ('184945', '佴蕊', '男', '管理部', '2');
INSERT INTO staff VALUES ('185157', '巩瑗', '男', '研发部', '13');
INSERT INTO staff VALUES ('185390', '禹琴', '男', '研发部', '9');
INSERT INTO staff VALUES ('185566', '容香钊', '男', '管理部', '7');
INSERT INTO staff VALUES ('185858', '周雅茜', '男', '研发部', '12');
INSERT INTO staff VALUES ('185894', '完颜洁吉', '男', '管理部', '9');
INSERT INTO staff VALUES ('186016', '宁福云', '女', '研发部', '1');
INSERT INTO staff VALUES ('186351', '万芳', '男', '管理部', '6');
INSERT INTO staff VALUES ('187295', '方羽龙', '女', '研发部', '10');
INSERT INTO staff VALUES ('187846', '蒋星弘', '女', '实习部', '7');
INSERT INTO staff VALUES ('189643', '容亮沫', '女', '研发部', '3');
INSERT INTO staff VALUES ('189982', '岑静', '男', '研发部', '7');
INSERT INTO staff VALUES ('191595', '连勇', '女', '研发部', '11');
INSERT INTO staff VALUES ('192194', '缪卿', '男', '实习部', '4');
INSERT INTO staff VALUES ('192319', '淳霞娴', '男', '研发部', '3');
INSERT INTO staff VALUES ('193009', '郝凡', '男', '实习部', '2');
INSERT INTO staff VALUES ('193346', '狐强', '男', '研发部', '7');
INSERT INTO staff VALUES ('193611', '孙婵', '男', '实习部', '6');
INSERT INTO staff VALUES ('193868', '端维', '男', '管理部', '11');
INSERT INTO staff VALUES ('193909', '完颜宁泽', '女', '实习部', '5');
INSERT INTO staff VALUES ('194018', '嵇一杰', '男', '研发部', '2');
INSERT INTO staff VALUES ('194518', '丘维清', '男', '研发部', '7');
INSERT INTO staff VALUES ('194649', '桂以', '男', '实习部', '4');
INSERT INTO staff VALUES ('195821', '欧筠', '男', '实习部', '12');
INSERT INTO staff VALUES ('195993', '谷珍琳', '女', '实习部', '4');
INSERT INTO staff VALUES ('196001', '孙洋', '男', '研发部', '2');
INSERT INTO staff VALUES ('196296', '萧瑞漩', '女', '研发部', '7');
INSERT INTO staff VALUES ('196346', '夏时', '男', '实习部', '12');
INSERT INTO staff VALUES ('196631', '晋晋婵', '男', '实习部', '12');
INSERT INTO staff VALUES ('196676', '夹克', '女', '管理部', '10');
INSERT INTO staff VALUES ('197702', '司空允逸', '女', '管理部', '10');
INSERT INTO staff VALUES ('197899', '第钧聪', '女', '研发部', '12');
INSERT INTO staff VALUES ('198219', '南芝柏', '男', '研发部', '2');
INSERT INTO staff VALUES ('198324', '薛学', '男', '实习部', '2');
INSERT INTO staff VALUES ('198819', '何惠莎', '男', '管理部', '7');
INSERT INTO staff VALUES ('199156', '师力萱', '男', '管理部', '6');
INSERT INTO staff VALUES ('199226', '宰文', '女', '管理部', '9');
INSERT INTO staff VALUES ('199228', '南宫影', '女', '实习部', '9');
INSERT INTO staff VALUES ('199328', '漆爱', '男', '实习部', '6');
INSERT INTO staff VALUES ('199963', '邹辰晋', '女', '研发部', '5');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `register_time` datetime NOT NULL,
  `role_id` int(4) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'on',
  `online_status` varchar(255) NOT NULL DEFAULT '离线',
  PRIMARY KEY (`user_id`),
  KEY `fk_u_role` (`role_id`),
  CONSTRAINT `fk_u_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'Admin', '123456', '567@', '2021-10-01 10:00:00', '0', 'on', '离线');
INSERT INTO user VALUES ('2', 'super', '2222222', '123@', '2021-11-27 19:49:48', '2', 'on', '在线');
INSERT INTO user VALUES ('4', 'hnist12', '123456', '123123', '2021-12-01 16:25:29', '1', 'on', '离线');
INSERT INTO user VALUES ('5', '132356', '123456', '123@qq.com', '2021-12-05 16:20:08', '1', 'on', '离线');
INSERT INTO user VALUES ('6', 'csft', '123456', '1659', '2021-12-05 16:25:15', '1', 'off', '离线');
INSERT INTO user VALUES ('7', 'woskfo', '123456', '16569', '2021-12-05 16:27:35', '1', 'on', '离线');
INSERT INTO user VALUES ('8', '9999', '123456', '58521', '2021-12-05 16:30:32', '1', 'on', '在线');
INSERT INTO user VALUES ('9', '123123', '1231234', '321', '2021-12-05 16:33:24', '2', 'on', '离线');
INSERT INTO user VALUES ('10', 'Admin3', '123123', '13332', '2021-12-05 16:40:14', '2', 'on', '离线');
INSERT INTO user VALUES ('12', '1789', '123456', '1356', '2021-12-05 19:29:39', '2', 'off', '离线');
INSERT INTO user VALUES ('13', '天王盖地虎', '123123', '1983', '2021-12-27 01:04:12', '2', 'on', '离线');
INSERT INTO user VALUES ('15', 'code', '123123', '16594@', '2021-12-27 01:10:51', '2', 'on', '离线');
