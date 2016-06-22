-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-06-22 18:36:06
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `his`
--
CREATE DATABASE IF NOT EXISTS `his` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `his`;

-- --------------------------------------------------------

--
-- 表的结构 `anaesthesia`
--

DROP TABLE IF EXISTS `anaesthesia`;
CREATE TABLE IF NOT EXISTS `anaesthesia` (
  `code` int(11) NOT NULL AUTO_INCREMENT COMMENT '麻醉号',
  `sur_code` int(11) NOT NULL COMMENT '手术_手术号',
  `doctor_id` int(11) DEFAULT NULL COMMENT '工号',
  `consultation` varchar(60) DEFAULT NULL COMMENT '会诊意见',
  `method` varchar(20) DEFAULT NULL,
  `log` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK83j6qishc12s3ext60r2yelfi` (`sur_code`),
  KEY `FK83p8ckc5eeleudqbei9wjpic9` (`doctor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='麻醉' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `anaesthesia`
--

INSERT INTO `anaesthesia` (`code`, `sur_code`, `doctor_id`, `consultation`, `method`, `log`, `remark`, `state`) VALUES
(2, 2, 1, 'asdasdasdasdd', 'asdasddd', '这是一个不错的麻醉记录2', '这真是一个不错的麻醉记录啊', 1),
(5, 4, 1, 'asdfagdfhdfggggggggggggggggggggggggggggggggggg asdfffasfg', 'asdasddf', 'Anesthesia record: Anesthesia record Anesthesia record: Anesthesia record', 'Anesthesia record: Anesthesia record Anesthesia record: Anesthesia record', 1),
(7, 5, 4, '迪迦打击一定可以麻醉', '迪迦打击', '迪迦打击一定可以麻醉迪迦打击一定可以麻醉', '迪迦打击一定可以麻醉', 1),
(8, 8, 2, '周董周董周董周董', '周董周董', NULL, NULL, 0),
(9, 18, 4, '死死死死死死死', '算是', '死了', '死死死死死死死死', 1);

-- --------------------------------------------------------

--
-- 表的结构 `anaesthetist`
--

DROP TABLE IF EXISTS `anaesthetist`;
CREATE TABLE IF NOT EXISTS `anaesthetist` (
  `doctor_id` int(11) NOT NULL COMMENT '工号',
  `doctor_name` varchar(8) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='麻醉师';

-- --------------------------------------------------------

--
-- 表的结构 `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `id` int(11) NOT NULL COMMENT '工号',
  `name` varchar(8) NOT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生';

--
-- 转存表中的数据 `doctor`
--

INSERT INTO `doctor` (`id`, `name`) VALUES
(1, '周杰伦'),
(2, '周董'),
(3, '一拳超人'),
(4, '迪迦');

-- --------------------------------------------------------

--
-- 表的结构 `drugs`
--

DROP TABLE IF EXISTS `drugs`;
CREATE TABLE IF NOT EXISTS `drugs` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品';

-- --------------------------------------------------------

--
-- 表的结构 `nurse`
--

DROP TABLE IF EXISTS `nurse`;
CREATE TABLE IF NOT EXISTS `nurse` (
  `nurse_id` int(11) NOT NULL COMMENT '工号',
  `nurse_name` varchar(8) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`nurse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='护士';

--
-- 转存表中的数据 `nurse`
--

INSERT INTO `nurse` (`nurse_id`, `nurse_name`) VALUES
(1, '护士1'),
(2, '护士2'),
(3, '护士3'),
(4, '护士4');

-- --------------------------------------------------------

--
-- 表的结构 `operationroom`
--

DROP TABLE IF EXISTS `operationroom`;
CREATE TABLE IF NOT EXISTS `operationroom` (
  `num` int(11) NOT NULL COMMENT '室号',
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手术室';

--
-- 转存表中的数据 `operationroom`
--

INSERT INTO `operationroom` (`num`, `name`) VALUES
(1, '1号手术室'),
(2, '2号手术室'),
(3, '3号手术室'),
(4, '4号手术室');

-- --------------------------------------------------------

--
-- 表的结构 `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL COMMENT '编号',
  `name` varchar(8) NOT NULL COMMENT '姓名',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(20) DEFAULT NULL COMMENT '邮件地址',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `address` varchar(40) DEFAULT NULL COMMENT '地址',
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='病人';

--
-- 转存表中的数据 `patient`
--

INSERT INTO `patient` (`id`, `name`, `phone`, `email`, `birthday`, `sex`, `address`, `age`) VALUES
(1, '李超人', '12345678', '514221956@qq.com', '2016-06-16 00:00:00', 1, '广东省中山市a镇b区', 50);

-- --------------------------------------------------------

--
-- 表的结构 `surgery`
--

DROP TABLE IF EXISTS `surgery`;
CREATE TABLE IF NOT EXISTS `surgery` (
  `code` int(11) NOT NULL AUTO_INCREMENT COMMENT '手术号',
  `patient_id` int(11) NOT NULL COMMENT '病人id',
  `num` int(11) DEFAULT NULL COMMENT '室号',
  `doctor_id` int(11) DEFAULT NULL COMMENT '工号',
  `name` varchar(20) DEFAULT NULL COMMENT '手术名称',
  `disease` varchar(100) DEFAULT NULL COMMENT '疾病诊断',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `description` varchar(200) DEFAULT NULL COMMENT '手术要求',
  `notation` varchar(20) DEFAULT NULL COMMENT '注意事项',
  PRIMARY KEY (`code`),
  KEY `FK_having_surgery` (`patient_id`),
  KEY `FKo2m4u6e35a5san80j6e13ft17` (`doctor_id`),
  KEY `FK_have_room` (`num`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='手术' AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `surgery`
--

INSERT INTO `surgery` (`code`, `patient_id`, `num`, `doctor_id`, `name`, `disease`, `apply_time`, `state`, `description`, `notation`) VALUES
(2, 1, 2, 3, '手术大法', '撒', '2016-06-30 08:14:32', 1, '这是', NULL),
(4, 1, 2, 1, '这是一个手术', '中而不', '2016-06-19 12:09:40', 2, NULL, NULL),
(5, 1, 4, 2, '超级手术', '疾病1', '2016-06-22 01:00:31', 1, NULL, NULL),
(8, 1, 1, 2, ' 手术讯息 手术名称：', ' 手术讯息 手术名称：', '2016-06-22 20:02:35', 1, NULL, NULL),
(9, 1, NULL, 2, '广东省中山市', '广东省中山市', '2016-06-22 21:25:47', 0, NULL, NULL),
(10, 1, NULL, 2, '名称：名称：', '名称：名称：名称：', '2016-06-22 21:31:20', 0, NULL, NULL),
(11, 1, NULL, 4, '2222', '3333', '2016-06-22 21:31:48', 0, NULL, NULL),
(12, 1, NULL, 2, '222233', '3333455', '2016-06-22 21:32:18', 0, NULL, NULL),
(13, 1, NULL, 3, '323453245', '123124245', '2016-06-22 21:33:50', 0, NULL, NULL),
(14, 1, NULL, 3, '323453245', '123124245', '2016-06-22 21:33:50', 0, NULL, NULL),
(15, 1, NULL, 3, '323453245', '123124245', '2016-06-22 21:33:50', 0, NULL, NULL),
(16, 1, NULL, 4, '234123', '1354567567', '2016-06-26 13:00:30', 0, NULL, NULL),
(18, 1, 1, 1, '搜索', '嗖嗖嗖', '2016-06-23 00:21:45', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `surgery_assistants`
--

DROP TABLE IF EXISTS `surgery_assistants`;
CREATE TABLE IF NOT EXISTS `surgery_assistants` (
  `doctor_id` int(11) NOT NULL COMMENT '工号',
  `code` int(11) NOT NULL COMMENT '手术号',
  PRIMARY KEY (`doctor_id`,`code`),
  KEY `FKg7exbiti1e8mlcpwkxq5di1fr` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参与手术的助手';

--
-- 转存表中的数据 `surgery_assistants`
--

INSERT INTO `surgery_assistants` (`doctor_id`, `code`) VALUES
(1, 2),
(4, 2),
(1, 5),
(2, 5),
(1, 8),
(1, 18),
(2, 18);

-- --------------------------------------------------------

--
-- 表的结构 `surgery_log`
--

DROP TABLE IF EXISTS `surgery_log`;
CREATE TABLE IF NOT EXISTS `surgery_log` (
  `code` int(11) NOT NULL COMMENT '手术号',
  `first_diagnosis` varchar(20) DEFAULT NULL COMMENT '术前诊断',
  `end_diagnosis` varchar(20) DEFAULT NULL COMMENT '术后诊断',
  `process` varchar(1024) DEFAULT NULL COMMENT '手术过程',
  `log` varchar(200) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手术记录';

--
-- 转存表中的数据 `surgery_log`
--

INSERT INTO `surgery_log` (`code`, `first_diagnosis`, `end_diagnosis`, `process`, `log`) VALUES
(4, '呵呵呵呵', '哈哈哈', '嗷嗷嗷 ', '多对多'),
(18, '轻轻巧巧', '死死死死死死死', ' 笑嘻嘻笑嘻嘻 死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死  笑嘻嘻笑嘻嘻 死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死  笑嘻嘻笑嘻嘻 死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死  笑嘻嘻笑嘻嘻 死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死死', '烦烦烦烦烦');

-- --------------------------------------------------------

--
-- 表的结构 `surgery_nurse`
--

DROP TABLE IF EXISTS `surgery_nurse`;
CREATE TABLE IF NOT EXISTS `surgery_nurse` (
  `nurse_id` int(11) NOT NULL COMMENT '工号',
  `code` int(11) NOT NULL COMMENT '手术号',
  PRIMARY KEY (`nurse_id`,`code`),
  KEY `FKhs9bqfmsfvdvl3h2qjm7m18eg` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='护士参与';

--
-- 转存表中的数据 `surgery_nurse`
--

INSERT INTO `surgery_nurse` (`nurse_id`, `code`) VALUES
(2, 2),
(1, 5),
(4, 5),
(1, 8),
(1, 18),
(4, 18);

-- --------------------------------------------------------

--
-- 表的结构 `surgery_operation`
--

DROP TABLE IF EXISTS `surgery_operation`;
CREATE TABLE IF NOT EXISTS `surgery_operation` (
  `id` int(11) NOT NULL COMMENT '编号',
  `position` varchar(20) DEFAULT NULL COMMENT '操作部位',
  `method` varchar(20) DEFAULT NULL COMMENT '操作方法',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手术操作';

-- --------------------------------------------------------

--
-- 表的结构 `test1`
--

DROP TABLE IF EXISTS `test1`;
CREATE TABLE IF NOT EXISTS `test1` (
  `id` int(11) NOT NULL,
  `str1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `test1`
--

INSERT INTO `test1` (`id`, `str1`) VALUES
(1, 'v2:i am from test2!');

-- --------------------------------------------------------

--
-- 表的结构 `test2`
--

DROP TABLE IF EXISTS `test2`;
CREATE TABLE IF NOT EXISTS `test2` (
  `id` int(11) NOT NULL,
  `str1` varchar(255) DEFAULT NULL,
  `fktest1` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_71kqj0m3gbg5ykj8i77itc0yy` (`fktest1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 限制导出的表
--

--
-- 限制表 `anaesthesia`
--
ALTER TABLE `anaesthesia`
  ADD CONSTRAINT `FK83j6qishc12s3ext60r2yelfi` FOREIGN KEY (`sur_code`) REFERENCES `surgery` (`code`),
  ADD CONSTRAINT `FK83p8ckc5eeleudqbei9wjpic9` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `FK_match` FOREIGN KEY (`sur_code`) REFERENCES `surgery` (`code`);

--
-- 限制表 `surgery`
--
ALTER TABLE `surgery`
  ADD CONSTRAINT `FK_have_room` FOREIGN KEY (`num`) REFERENCES `operationroom` (`num`),
  ADD CONSTRAINT `FK_having_surgery` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `FK_macin_actor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);

--
-- 限制表 `surgery_assistants`
--
ALTER TABLE `surgery_assistants`
  ADD CONSTRAINT `FKg7exbiti1e8mlcpwkxq5di1fr` FOREIGN KEY (`code`) REFERENCES `surgery` (`code`),
  ADD CONSTRAINT `FKtkip1qebrti1iuen9ddim6n92` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `FK_a1` FOREIGN KEY (`code`) REFERENCES `surgery` (`code`),
  ADD CONSTRAINT `FK_b1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);

--
-- 限制表 `surgery_log`
--
ALTER TABLE `surgery_log`
  ADD CONSTRAINT `FK_have_log` FOREIGN KEY (`code`) REFERENCES `surgery` (`code`);

--
-- 限制表 `surgery_nurse`
--
ALTER TABLE `surgery_nurse`
  ADD CONSTRAINT `FKan24imheqi73qf9wmlq34nbgy` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`nurse_id`),
  ADD CONSTRAINT `FKhs9bqfmsfvdvl3h2qjm7m18eg` FOREIGN KEY (`code`) REFERENCES `surgery` (`code`),
  ADD CONSTRAINT `FK_a2` FOREIGN KEY (`code`) REFERENCES `surgery` (`code`),
  ADD CONSTRAINT `FK_b2` FOREIGN KEY (`nurse_id`) REFERENCES `nurse` (`nurse_id`);

--
-- 限制表 `test2`
--
ALTER TABLE `test2`
  ADD CONSTRAINT `FK5kn2mwjnwmya3v1ogbor8cjvb` FOREIGN KEY (`fktest1`) REFERENCES `test1` (`id`),
  ADD CONSTRAINT `FK_71kqj0m3gbg5ykj8i77itc0yy` FOREIGN KEY (`fktest1`) REFERENCES `test1` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
