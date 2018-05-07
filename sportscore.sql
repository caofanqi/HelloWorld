/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : sportscore

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2018-05-03 23:02:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sports_record
-- ----------------------------
DROP TABLE IF EXISTS `sports_record`;
CREATE TABLE `sports_record` (
  `sr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目成绩表id 主键自增',
  `sport_id` int(11) DEFAULT NULL COMMENT '项目id',
  `student_id` int(11) DEFAULT NULL COMMENT '学生id',
  `score` int(11) DEFAULT NULL COMMENT '项目成绩',
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sports_record
-- ----------------------------
INSERT INTO `sports_record` VALUES ('1', '1', '1', '80');
INSERT INTO `sports_record` VALUES ('2', '2', '1', '85');
INSERT INTO `sports_record` VALUES ('3', '3', '1', '90');

-- ----------------------------
-- Table structure for sports_score_grade
-- ----------------------------
DROP TABLE IF EXISTS `sports_score_grade`;
CREATE TABLE `sports_score_grade` (
  `ssg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '等分等级id 主键自增',
  `ssg_name` varchar(5) DEFAULT NULL COMMENT '优秀 良好 中 合格 不合格',
  `ssg_start_score` int(3) DEFAULT NULL COMMENT '分数区间 起始',
  `ssg_end_score` int(3) DEFAULT NULL COMMENT '分数区间 结束',
  `ssg_start_mark` int(1) DEFAULT NULL COMMENT '分数区间 起始 运算符',
  `ssg_end_mark` int(1) DEFAULT NULL COMMENT '分数区间 结束 运算符',
  `is_use` int(1) DEFAULT '1' COMMENT '是否启用 1启用 0不启用 默认启用',
  PRIMARY KEY (`ssg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sports_score_grade
-- ----------------------------
INSERT INTO `sports_score_grade` VALUES ('1', '优秀', '90', '100', '4', '2', '1');
INSERT INTO `sports_score_grade` VALUES ('2', '良好', '80', '90', '4', '1', '1');
INSERT INTO `sports_score_grade` VALUES ('3', '中', '75', '80', '4', '1', '1');
INSERT INTO `sports_score_grade` VALUES ('4', '合格', '60', '75', '4', '1', '1');
INSERT INTO `sports_score_grade` VALUES ('5', '不合格', '0', '60', '4', '1', '1');

-- ----------------------------
-- Table structure for sports_score_grade_mark_mapping
-- ----------------------------
DROP TABLE IF EXISTS `sports_score_grade_mark_mapping`;
CREATE TABLE `sports_score_grade_mark_mapping` (
  `ssgm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '得分等级关联 运算符 id 主键自增',
  `ssg_id` int(11) DEFAULT NULL COMMENT '得分等级id',
  `mark_id` int(11) DEFAULT NULL COMMENT '运算符id',
  PRIMARY KEY (`ssgm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sports_score_grade_mark_mapping
-- ----------------------------
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('1', '1', '3');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('2', '1', '4');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('3', '2', '1');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('4', '2', '2');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('5', '2', '3');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('6', '2', '4');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('7', '3', '1');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('8', '3', '2');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('9', '3', '3');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('10', '3', '4');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('11', '4', '1');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('12', '4', '2');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('13', '4', '3');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('14', '4', '4');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('15', '5', '1');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('16', '5', '2');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('17', '5', '3');
INSERT INTO `sports_score_grade_mark_mapping` VALUES ('18', '5', '4');

-- ----------------------------
-- Table structure for sports_score_rule
-- ----------------------------
DROP TABLE IF EXISTS `sports_score_rule`;
CREATE TABLE `sports_score_rule` (
  `ssr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目标准id 主键自增',
  `student_sex` int(1) DEFAULT NULL COMMENT '性别 1男生 0女生',
  `grade_id` int(11) DEFAULT NULL COMMENT '年级id',
  `ssr_single_score` int(3) DEFAULT NULL COMMENT '单项得分',
  `ssr_vital_capacity` int(5) DEFAULT NULL COMMENT '肺活量标准',
  `ssr_body_forward` int(3) DEFAULT NULL COMMENT '座位体前屈标准',
  `ssr_upwards` int(3) DEFAULT NULL COMMENT '引体向上标准',
  PRIMARY KEY (`ssr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sports_score_rule
-- ----------------------------
INSERT INTO `sports_score_rule` VALUES ('1', '1', '1', '70', '2002', '23', '12');
INSERT INTO `sports_score_rule` VALUES ('2', '1', '1', '60', '2001', '22', '11');

-- ----------------------------
-- Table structure for student_grade_class_mapping
-- ----------------------------
DROP TABLE IF EXISTS `student_grade_class_mapping`;
CREATE TABLE `student_grade_class_mapping` (
  `sgc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '年纪 班级 学生关联映射 id 主键自增',
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL COMMENT '班级id',
  `grade_id` int(11) DEFAULT NULL COMMENT '年级id',
  PRIMARY KEY (`sgc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student_grade_class_mapping
-- ----------------------------
INSERT INTO `student_grade_class_mapping` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for s_class
-- ----------------------------
DROP TABLE IF EXISTS `s_class`;
CREATE TABLE `s_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id 主键自增',
  `class_name` varchar(20) DEFAULT NULL COMMENT '班级名',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_class
-- ----------------------------
INSERT INTO `s_class` VALUES ('1', '一班');
INSERT INTO `s_class` VALUES ('2', '二班');
INSERT INTO `s_class` VALUES ('3', '三班');

-- ----------------------------
-- Table structure for s_grade
-- ----------------------------
DROP TABLE IF EXISTS `s_grade`;
CREATE TABLE `s_grade` (
  `grade_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '年级表id 主键自增',
  `grade _name` varchar(20) DEFAULT NULL COMMENT '年级名',
  PRIMARY KEY (`grade_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_grade
-- ----------------------------
INSERT INTO `s_grade` VALUES ('1', '一年级');
INSERT INTO `s_grade` VALUES ('2', '二年级');
INSERT INTO `s_grade` VALUES ('3', '三年级');

-- ----------------------------
-- Table structure for s_mark
-- ----------------------------
DROP TABLE IF EXISTS `s_mark`;
CREATE TABLE `s_mark` (
  `mark_id` int(11) NOT NULL COMMENT '运算符id 主键自增',
  `mark_mode` varchar(10) DEFAULT NULL COMMENT '运算符类型  大于 大于等于 小于 小于等于',
  PRIMARY KEY (`mark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_mark
-- ----------------------------
INSERT INTO `s_mark` VALUES ('1', '<');
INSERT INTO `s_mark` VALUES ('2', '<=');
INSERT INTO `s_mark` VALUES ('3', '>');
INSERT INTO `s_mark` VALUES ('4', '>=');

-- ----------------------------
-- Table structure for s_sport
-- ----------------------------
DROP TABLE IF EXISTS `s_sport`;
CREATE TABLE `s_sport` (
  `sport_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id 主键自增',
  `sport_name` varchar(30) DEFAULT NULL COMMENT '项目名称',
  PRIMARY KEY (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_sport
-- ----------------------------
INSERT INTO `s_sport` VALUES ('1', '肺活量(毫升)');
INSERT INTO `s_sport` VALUES ('2', '座位体前屈(厘米)');
INSERT INTO `s_sport` VALUES ('3', '引体向上(次)');

-- ----------------------------
-- Table structure for s_student
-- ----------------------------
DROP TABLE IF EXISTS `s_student`;
CREATE TABLE `s_student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生信息表 id 主键自增',
  `student_name` varchar(10) DEFAULT NULL COMMENT '学生姓名',
  `student_sex` int(1) DEFAULT NULL COMMENT '学生性别 1男生 0女生 ',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_student
-- ----------------------------
INSERT INTO `s_student` VALUES ('1', '倪鹏飞', '1');
