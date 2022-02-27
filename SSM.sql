/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50737
Source Host           : localhost:3306
Source Database       : ssm_demo

Target Server Type    : MYSQL
Target Server Version : 50737
File Encoding         : 65001

Date: 2022-02-27 20:25:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
                        `department` varchar(20) NOT NULL,
                        `baseSalary` float DEFAULT NULL,
                        `baseBonus` float DEFAULT NULL,
                        `baseSubsidy` float DEFAULT NULL,
                        `baseAnnual` float DEFAULT NULL,
                        PRIMARY KEY (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('实习部', '800', '300', '150', '12');
INSERT INTO `dept` VALUES ('研发部', '4500', '750', '500', '14');
INSERT INTO `dept` VALUES ('管理部', '6500', '1000', '1500', '16');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
                        `fileId` int(4) NOT NULL AUTO_INCREMENT,
                        `fileName` varchar(260) NOT NULL,
                        `fileDescription` varchar(300) DEFAULT NULL,
                        `user_id` int(4) NOT NULL,
                        `uploadTime` datetime DEFAULT NULL,
                        `downloadAmount` int(10) DEFAULT NULL,
                        `path` varchar(100) NOT NULL,
                        PRIMARY KEY (`fileId`),
                        KEY `fk_f_u` (`user_id`),
                        CONSTRAINT `fk_f_u` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('36', '12212400004刘津豪.pdf', '面向对象程序设计', '1', '2021-12-23 21:35:33', '1', 'E:/FileFactory');
INSERT INTO `file` VALUES ('37', '单项选择题-计算机网络（39e00214）(1).xlsx', '测试', '1', '2021-12-23 21:38:28', '0', 'E:/FileFactory');
INSERT INTO `file` VALUES ('38', '计科19-1BJ+刘津豪_员工管理系统的设计.docx', '面向对象程序设计', '1', '2021-12-23 22:14:37', '0', 'E:/FileFactory');
INSERT INTO `file` VALUES ('39', '面向对象程序设计.txt', '测试', '1', '2021-12-23 22:16:29', '0', 'E:/FileFactory');
INSERT INTO `file` VALUES ('42', '简历-刘津豪.pdf', '测试', '1', '2021-12-26 23:53:52', '0', 'E:/FileFactory');

-- ----------------------------
-- Table structure for log_login
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_login
-- ----------------------------
INSERT INTO `log_login` VALUES ('4', '1', 'FF1811B06AF3D31A6BADACBD1DD32313', '2022-02-27 19:50:03', '127.0.0.1', '湖南省岳阳市', 'CHROME9');
INSERT INTO `log_login` VALUES ('5', '1', '947EDFEBD25B74D80DB0F990F294CD66', '2022-02-27 19:52:28', '127.0.0.1', '湖南省岳阳市', 'CHROME9');
INSERT INTO `log_login` VALUES ('6', '1', '48FDA8FA173A3E767CEC1F6F5140FE8E', '2022-02-27 19:59:35', '127.0.0.1', '湖南省岳阳市', 'CHROME9');
INSERT INTO `log_login` VALUES ('7', '1', 'CF7C6577CA8FF18E6785E372FDDF8B6F', '2022-02-27 20:01:17', '127.0.0.1', '湖南省岳阳市', 'CHROME9');
INSERT INTO `log_login` VALUES ('8', '1', '0332DF5151A6260EBBC714064AF56A52', '2022-02-27 20:16:47', '127.0.0.1', '湖南省岳阳市', 'CHROME9');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
                          `id` int(8) NOT NULL AUTO_INCREMENT,
                          `title` varchar(150) NOT NULL,
                          `content` varchar(21500) NOT NULL,
                          `beginTime` date DEFAULT NULL,
                          `endTime` date DEFAULT NULL,
                          `user_id` int(4) NOT NULL,
                          `publishTime` date DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `fk_u_n` (`user_id`),
                          CONSTRAINT `fk_u_n` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('27', '测试', '1.&nbsp;从ResultSet读取时间<br><br>执行完SQL命令后返回一个ResultSet，当ResultSet里有时间字段的时候，<br><br>例：createTime：2014-11-11&nbsp;19:50:10，如何将时间取出来呢？<br><br><br>ResultSet.getDate&nbsp;方法，取出来的只有日期，2014-11-11<br>ResultSet.getTime&nbsp;方法，取出来的只有时间，19:50:10<br>ResultSet.getTimestamp方法，可以将日期和时间都出来，但是你会发现取出来的是&nbsp;:yyyy-mm-dd&nbsp;hh:mi:ss,z精确到毫秒。<br>如果取出来放到一个Date类型的字段，可以直接用ResultSet.getTimestamp取出来直接设置，毫秒会被过滤掉。<br><br>如果取出来的值被放到String类型的字段里，你要注意毫秒需不需要带，如果不需要的话，可以先用Date类型接收在转为String。<br><br>2.&nbsp;在SQL语句里设置时间<br><br>往数据库传字段的时候，怎么设值<br><br>new&nbsp;java.sql.Timestamp(new&nbsp;Date（）.getTime())<br><br>好像直接new&nbsp;Date（）&nbsp;也可以，还没搞明白区别，高手赐教<br><br><br>————————————————<br>版权声明：本文为CSDN博主「bingqilin_」的原创文章，遵循CC&nbsp;4.0&nbsp;BY-SA版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/bingqilin_/article/details/41016441', '2021-12-04', '2021-12-23', '1', '2021-12-23');
INSERT INTO `notice` VALUES ('31', '公示', '关于审批刘津豪同志为中共正式党员的请示<br><br>中共湖南理工学院信息科学与工程学院委员会：<br>根据发展党员工作有关规定，经支部大会讨论通过，同意刘津豪同志转为中共正式党员。<br>刘津豪，男，汉族，大专文化，湖南省衡阳市人，该同志于2020年12月01日被接收为中共预备党员，预备期一年，到2021年12月01日预备期满。入党介绍人：王勤、陶海兰。刘津豪同志在预备期间表现良好，在思想上坚持学习党的理论知识，坚定地拥护党的政策方针，积极向党组织靠拢。在学习上，他努力学习专业知识，于课外时间坚持阅读，注重自己拓宽自己的知识面，并积极思考，努力提升自己的文化素养。在工作上，他积极主动，责任心强，能够按时保质地完成上级安排的任务。在生活中，该同志作风良好，热爱生活，尊敬师长，友爱同学，能够积极主动地帮助有困难的同学，在同学中有一定威信，2021年12月01日，支部大会讨论了刘津豪同志的转正问题。支部有表决权的党员7名，实际到会7名。经与会党员讨论并采取无记名投票的方式进行表决，7票赞成，0票反对，0票弃权。根据表决结果，同意刘津豪同志按期转为中共正式党员。<br>现将刘津豪同志有关情况及相关材料上报，请审批。<br><br><br><br>中共湖南理工学院<br>信息科学与工程学院学生第三支部委员会<br>2021年12月02日<br>', '2021-12-27', '2021-12-27', '1', '2021-12-27');
INSERT INTO `notice` VALUES ('33', '关于举办湖南理工学院2021年田径运动会的通知', '关于举办湖南理工学院2021年田径运动会的通知校属各单位：为全面贯彻党的教育方针，落实立德树人根本任务，促进学生德智体美劳全面发展，充分展示学校体育教学、运动训练、课余竞赛成果，构建“团结、奋进、文明、育人”的校园体育文化，经学校研究决定举行湖南理工学院2021年田径运动会，现将有关事项通知如下：一、时间安排2021年12月2-3日（周四、周五），其中12月2日上午8:00举行开幕式，请全体在家校领导和二级单位负责人准时参加。二、地点安排东院田径场<br>-2-三、注意事项1.各单位要严格落实常态化疫情防控的有关要求，认真做好相关工作。2.各单位要高度重视，认组织师生积极参与，确保运动会气氛热烈、安全有序。3.运动会期间，校车正常运行，行政管理人员照常上班，辅导员、班主任要认真做好学生各方面的管理工作。4.学生停课，但不放假，各学院要组织好不参加比赛的学生观看比赛或自习。5.如遇不宜天气，学校将即时下达延期通知，师生按周四、周五课表上课。中共湖南理工学院委员会办公室湖南理工学院校长办公室2021年11月30日', '2021-12-28', '2021-12-28', '2', '2021-12-28');

-- ----------------------------
-- Table structure for role
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
INSERT INTO `role` VALUES ('0', '超级管理员', '全部权限');
INSERT INTO `role` VALUES ('1', '普通管理员', '大部分权限');
INSERT INTO `role` VALUES ('2', '临时管理员', '部分权限');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
                          `payrollId` int(4) NOT NULL AUTO_INCREMENT,
                          `staffId` int(4) NOT NULL,
                          `department` varchar(20) NOT NULL,
                          `rank` int(4) NOT NULL,
                          `salary` float DEFAULT NULL,
                          `subsidy` float DEFAULT NULL,
                          `bonus` float DEFAULT NULL,
                          `annual` float DEFAULT NULL,
                          PRIMARY KEY (`payrollId`),
                          KEY `FK_s_m` (`staffId`),
                          KEY `FK_s_d` (`department`),
                          CONSTRAINT `FK_s_d` FOREIGN KEY (`department`) REFERENCES `dept` (`department`) ON DELETE CASCADE ON UPDATE CASCADE,
                          CONSTRAINT `FK_s_m` FOREIGN KEY (`staffId`) REFERENCES `staff` (`staffid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('13', '1000', '管理部', '9', '58500', '13500', '9000', '1296000');
INSERT INTO `salary` VALUES ('14', '1001', '研发部', '8', '36000', '4000', '6000', '644000');
INSERT INTO `salary` VALUES ('15', '1002', '研发部', '8', '36000', '4000', '6000', '644000');
INSERT INTO `salary` VALUES ('16', '1103', '实习部', '5', '4000', '750', '1500', '75000');
INSERT INTO `salary` VALUES ('17', '1888', '管理部', '7', '45500', '10500', '7000', '1008000');
INSERT INTO `salary` VALUES ('18', '1123', '研发部', '5', '22500', '2500', '3750', '402500');
INSERT INTO `salary` VALUES ('19', '1021', '实习部', '5', '4000', '750', '1500', '75000');
INSERT INTO `salary` VALUES ('20', '1003', '管理部', '10', '65000', '15000', '10000', '1440000');
INSERT INTO `salary` VALUES ('21', '2004', '研发部', '4', '18000', '2000', '3000', '322000');
INSERT INTO `salary` VALUES ('22', '1326', '实习部', '4', '3200', '600', '1200', '60000');
INSERT INTO `salary` VALUES ('23', '1968', '管理部', '8', '52000', '12000', '8000', '1152000');
INSERT INTO `salary` VALUES ('24', '1234', '研发部', '6', '27000', '3000', '4500', '483000');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
                         `staffid` int(4) NOT NULL AUTO_INCREMENT,
                         `name` varchar(20) NOT NULL,
                         `sex` char(2) NOT NULL,
                         `department` varchar(20) NOT NULL,
                         `rank` int(4) NOT NULL,
                         PRIMARY KEY (`staffid`),
                         KEY `FK_m_s` (`department`),
                         CONSTRAINT `FK_m_s` FOREIGN KEY (`department`) REFERENCES `dept` (`department`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2005 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1000', '张三', '男', '管理部', '9');
INSERT INTO `staff` VALUES ('1001', '李八', '女', '研发部', '8');
INSERT INTO `staff` VALUES ('1002', '克里斯', '男', '研发部', '8');
INSERT INTO `staff` VALUES ('1003', '芬格茨', '男', '管理部', '10');
INSERT INTO `staff` VALUES ('1021', '罗米尔', '女', '实习部', '5');
INSERT INTO `staff` VALUES ('1103', '科比', '男', '实习部', '5');
INSERT INTO `staff` VALUES ('1123', '马克', '男', '研发部', '5');
INSERT INTO `staff` VALUES ('1234', 'cx', '女', '研发部', '6');
INSERT INTO `staff` VALUES ('1326', '卡希尔', '女', '实习部', '4');
INSERT INTO `staff` VALUES ('1888', '张国荣', '男', '管理部', '7');
INSERT INTO `staff` VALUES ('1968', '刘佩琪', '女', '管理部', '8');
INSERT INTO `staff` VALUES ('2004', '李小可', '女', '研发部', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `user_id` int(8) NOT NULL AUTO_INCREMENT,
                        `username` varchar(12) NOT NULL,
                        `password` varchar(12) NOT NULL,
                        `email` varchar(50) NOT NULL,
                        `register_time` datetime NOT NULL,
                        `role_id` int(4) NOT NULL,
                        `status` varchar(8) NOT NULL,
                        `online_status` varchar(255) DEFAULT '离线',
                        PRIMARY KEY (`user_id`),
                        KEY `fk_u_role` (`role_id`),
                        CONSTRAINT `fk_u_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Admin', '123456', '567@', '2021-10-01 10:00:00', '0', 'on', '在线');
INSERT INTO `user` VALUES ('2', 'super', '2222222', '123@', '2021-11-27 19:49:48', '2', 'on', '离线');
INSERT INTO `user` VALUES ('4', 'hnist12', '123456', '123123', '2021-12-01 16:25:29', '1', 'on', '离线');
INSERT INTO `user` VALUES ('5', '132356', '123456', '123@qq.com', '2021-12-05 16:20:08', '1', 'off', '离线');
INSERT INTO `user` VALUES ('6', 'csft', '123456', '1659', '2021-12-05 16:25:15', '1', 'off', '离线');
INSERT INTO `user` VALUES ('7', 'woskfo', '123456', '16569', '2021-12-05 16:27:35', '1', 'on', '离线');
INSERT INTO `user` VALUES ('8', '9999', '123456', '58521', '2021-12-05 16:30:32', '1', 'on', '离线');
INSERT INTO `user` VALUES ('9', '123123', '1231234', '321', '2021-12-05 16:33:24', '2', 'on', '离线');
INSERT INTO `user` VALUES ('10', 'Admin3', '123123', '13332', '2021-12-05 16:40:14', '2', 'on', '离线');
INSERT INTO `user` VALUES ('12', '1789', '123456', '1356', '2021-12-05 19:29:39', '2', 'off', '离线');
INSERT INTO `user` VALUES ('13', '天王盖地虎', '123123', '1983', '2021-12-27 01:04:12', '2', 'on', '离线');
INSERT INTO `user` VALUES ('15', 'code', '123123', '16594@', '2021-12-27 01:10:51', '2', 'on', '离线');
