-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.16 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.1.0.4898
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 activiti 的数据库结构
CREATE DATABASE IF NOT EXISTS `activiti` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `activiti`;


-- 导出  表 activiti.accessory 结构
DROP TABLE IF EXISTS `accessory`;
CREATE TABLE IF NOT EXISTS `accessory` (
  `accessory_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) DEFAULT NULL,
  `suggestion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`accessory_id`),
  UNIQUE KEY `accessory_id` (`accessory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.accessory 的数据：~22 rows (大约)
DELETE FROM `accessory`;
/*!40000 ALTER TABLE `accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessory` ENABLE KEYS */;


-- 导出  表 activiti.account 结构
DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_level` int(11) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_id` (`account_id`),
  UNIQUE KEY `student_id` (`student_id`),
  UNIQUE KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.account 的数据：~98 rows (大约)
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`account_id`, `account_level`, `account_name`, `account_password`, `student_id`, `teacher_id`) VALUES
	(1, 1, 'jwy', 'jwy', NULL, 1),
	(7, 3, 'MF1132001', 'MF1132001', 1, NULL),
	(8, 3, 'MF1132002', 'MF1132002', 2, NULL),
	(9, 3, 'MF1132003', 'MF1132003', 3, NULL),
	(10, 3, 'MF1132004', 'MF1132004', 4, NULL),
	(11, 3, 'MF1132005', 'MF1132005', 5, NULL),
	(12, 3, 'MF1132006', 'MF1132006', 6, NULL),
	(13, 3, 'MF1132007', 'MF1132007', 7, NULL),
	(14, 3, 'MF1132008', 'MF1132008', 8, NULL),
	(15, 3, 'MF1132009', 'MF1132009', 9, NULL),
	(16, 3, 'MF1132011', 'MF1132011', 10, NULL),
	(17, 3, 'MF1132012', 'MF1132012', 11, NULL),
	(18, 3, 'MF1132013', 'MF1132013', 12, NULL),
	(19, 3, 'MF1132014', 'MF1132014', 13, NULL),
	(20, 3, 'MF1132016', 'MF1132016', 14, NULL),
	(21, 3, 'MF1132017', 'MF1132017', 15, NULL),
	(22, 3, 'MF1132019', 'MF1132019', 16, NULL),
	(23, 3, 'MF1132020', 'MF1132020', 17, NULL),
	(24, 3, 'MF1132022', 'MF1132022', 18, NULL),
	(25, 3, 'MF1132023', 'MF1132023', 19, NULL),
	(26, 3, 'MF1132025', 'MF1132025', 20, NULL),
	(27, 3, 'MF1132026', 'MF1132026', 21, NULL),
	(28, 3, 'MF1132028', 'MF1132028', 22, NULL),
	(29, 3, 'MF1132029', 'MF1132029', 23, NULL),
	(30, 3, 'MF1132031', 'MF1132031', 24, NULL),
	(31, 3, 'MF1132032', 'MF1132032', 25, NULL),
	(32, 3, 'MF1132034', 'MF1132034', 26, NULL),
	(33, 3, 'MF1132035', 'MF1132035', 27, NULL),
	(34, 3, 'MF1132037', 'MF1132037', 28, NULL),
	(35, 3, 'MF1132038', 'MF1132038', 29, NULL),
	(36, 3, 'MF1132040', 'MF1132040', 30, NULL),
	(37, 3, 'MF1132041', 'MF1132041', 31, NULL),
	(38, 3, 'MF1132043', 'MF1132043', 32, NULL),
	(39, 3, 'MF1132044', 'MF1132044', 33, NULL),
	(40, 3, 'MF1132045', 'MF1132045', 34, NULL),
	(41, 3, 'MF1132046', 'MF1132046', 35, NULL),
	(42, 3, 'MF1132047', 'MF1132047', 36, NULL),
	(43, 3, 'MF1132049', 'MF1132049', 37, NULL),
	(44, 3, 'MF1132050', 'MF1132050', 38, NULL),
	(45, 3, 'MF1132052', 'MF1132052', 39, NULL),
	(46, 3, 'MF1132053', 'MF1132053', 40, NULL),
	(47, 3, 'MF1132055', 'MF1132055', 41, NULL),
	(48, 3, 'MF1132056', 'MF1132056', 42, NULL),
	(49, 3, 'MF1132058', 'MF1132058', 43, NULL),
	(50, 3, 'MF1132059', 'MF1132059', 44, NULL),
	(51, 3, 'MF1132061', 'MF1132061', 45, NULL),
	(52, 3, 'MF1132062', 'MF1132062', 46, NULL),
	(53, 3, 'MF1132064', 'MF1132064', 47, NULL),
	(54, 3, 'MF1132065', 'MF1132065', 48, NULL),
	(55, 3, 'MF1132068', 'MF1132068', 49, NULL),
	(56, 3, 'MF1132069', 'MF1132069', 50, NULL),
	(57, 3, 'MF1132071', 'MF1132071', 51, NULL),
	(58, 3, 'MF1132072', 'MF1132072', 52, NULL),
	(59, 3, 'MF1132074', 'MF1132074', 53, NULL),
	(60, 3, 'MF1132075', 'MF1132075', 54, NULL),
	(61, 3, 'MF1132077', 'MF1132077', 55, NULL),
	(62, 3, 'MF1132078', 'MF1132078', 56, NULL),
	(63, 3, 'MF1132080', 'MF1132080', 57, NULL),
	(64, 3, 'MF1132082', 'MF1132082', 58, NULL),
	(65, 3, 'MF1132084', 'MF1132084', 59, NULL),
	(66, 3, 'MF1132085', 'MF1132085', 60, NULL),
	(67, 3, 'MF1132087', 'MF1132087', 61, NULL),
	(68, 3, 'MF1132088', 'MF1132088', 62, NULL),
	(69, 3, 'MF1132090', 'MF1132090', 63, NULL),
	(70, 3, 'MF1132091', 'MF1132091', 64, NULL),
	(71, 3, 'MF1132093', 'MF1132093', 65, NULL),
	(72, 3, 'MF1132094', 'MF1132094', 66, NULL),
	(73, 3, 'MF1132096', 'MF1132096', 67, NULL),
	(74, 3, 'MF1132097', 'MF1132097', 68, NULL),
	(75, 3, 'MF1132099', 'MF1132099', 69, NULL),
	(76, 3, 'MF1132100', 'MF1132100', 70, NULL),
	(77, 3, 'MF1132103', 'MF1132103', 71, NULL),
	(78, 3, 'MF1132105', 'MF1132105', 72, NULL),
	(79, 3, 'MF1132106', 'MF1132106', 73, NULL),
	(104, 2, '1004', '1004', NULL, 27),
	(105, 2, '1006', '1006', NULL, 28),
	(106, 2, '1018', '1018', NULL, 29),
	(107, 2, '1003', '1003', NULL, 30),
	(108, 2, '1002', '1002', NULL, 31),
	(109, 2, '1005', '1005', NULL, 32),
	(110, 2, '1007', '1007', NULL, 33),
	(111, 2, '1008', '1008', NULL, 34),
	(112, 2, '1010', '1010', NULL, 35),
	(113, 2, '1011', '1011', NULL, 36),
	(114, 2, '1012', '1012', NULL, 37),
	(115, 2, '1013', '1013', NULL, 38),
	(116, 2, '1014', '1014', NULL, 39),
	(117, 2, '1015', '1015', NULL, 40),
	(118, 2, '1016', '1016', NULL, 41),
	(119, 2, '1017', '1017', NULL, 42),
	(120, 2, '1001', '1001', NULL, 43),
	(121, 2, '1009', '1009', NULL, 44),
	(122, 2, '1019', '1019', NULL, 45),
	(123, 2, '2001', '2001', NULL, 46),
	(124, 2, '2002', '2002', NULL, 47),
	(125, 2, '2003', '2003', NULL, 48),
	(126, 2, '2004', '2004', NULL, 49),
	(127, 2, '2005', '2005', NULL, 50);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- 导出  表 activiti.act_evt_log 结构
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE IF NOT EXISTS `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_evt_log 的数据：~0 rows (大约)
DELETE FROM `act_evt_log`;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;


-- 导出  表 activiti.act_ge_bytearray 结构
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE IF NOT EXISTS `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_ge_bytearray 的数据：~8 rows (大约)
DELETE FROM `act_ge_bytearray`;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;


-- 导出  表 activiti.act_ge_property 结构
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE IF NOT EXISTS `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_ge_property 的数据：~3 rows (大约)
DELETE FROM `act_ge_property`;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` (`NAME_`, `VALUE_`, `REV_`) VALUES
	('next.dbid', '40001', 17),
	('schema.history', 'create(5.17.0.2)', 1),
	('schema.version', '5.17.0.2', 1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;


-- 导出  表 activiti.act_hi_actinst 结构
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE IF NOT EXISTS `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_hi_actinst 的数据：~55 rows (大约)
DELETE FROM `act_hi_actinst`;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;


-- 导出  表 activiti.act_hi_attachment 结构
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE IF NOT EXISTS `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_hi_attachment 的数据：~0 rows (大约)
DELETE FROM `act_hi_attachment`;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;


-- 导出  表 activiti.act_hi_comment 结构
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE IF NOT EXISTS `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_hi_comment 的数据：~0 rows (大约)
DELETE FROM `act_hi_comment`;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;


-- 导出  表 activiti.act_hi_detail 结构
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE IF NOT EXISTS `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_hi_detail 的数据：~0 rows (大约)
DELETE FROM `act_hi_detail`;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;


-- 导出  表 activiti.act_hi_identitylink 结构
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE IF NOT EXISTS `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_hi_identitylink 的数据：~21 rows (大约)
DELETE FROM `act_hi_identitylink`;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;


-- 导出  表 activiti.act_hi_procinst 结构
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE IF NOT EXISTS `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_hi_procinst 的数据：~3 rows (大约)
DELETE FROM `act_hi_procinst`;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;


-- 导出  表 activiti.act_hi_taskinst 结构
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE IF NOT EXISTS `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_hi_taskinst 的数据：~33 rows (大约)
DELETE FROM `act_hi_taskinst`;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;


-- 导出  表 activiti.act_hi_varinst 结构
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE IF NOT EXISTS `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_hi_varinst 的数据：~41 rows (大约)
DELETE FROM `act_hi_varinst`;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;


-- 导出  表 activiti.act_id_group 结构
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE IF NOT EXISTS `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_id_group 的数据：~3 rows (大约)
DELETE FROM `act_id_group`;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
INSERT INTO `act_id_group` (`ID_`, `REV_`, `NAME_`, `TYPE_`) VALUES
	('dean', 1, '教务员', NULL),
	('student', 1, '学生', NULL),
	('teacher', 1, '教师', NULL);
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;


-- 导出  表 activiti.act_id_info 结构
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE IF NOT EXISTS `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_id_info 的数据：~0 rows (大约)
DELETE FROM `act_id_info`;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;


-- 导出  表 activiti.act_id_membership 结构
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE IF NOT EXISTS `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_id_membership 的数据：~98 rows (大约)
DELETE FROM `act_id_membership`;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
INSERT INTO `act_id_membership` (`USER_ID_`, `GROUP_ID_`) VALUES
	('jwy', 'dean'),
	('MF1132001', 'student'),
	('MF1132002', 'student'),
	('MF1132003', 'student'),
	('MF1132004', 'student'),
	('MF1132005', 'student'),
	('MF1132006', 'student'),
	('MF1132007', 'student'),
	('MF1132008', 'student'),
	('MF1132009', 'student'),
	('MF1132011', 'student'),
	('MF1132012', 'student'),
	('MF1132013', 'student'),
	('MF1132014', 'student'),
	('MF1132016', 'student'),
	('MF1132017', 'student'),
	('MF1132019', 'student'),
	('MF1132020', 'student'),
	('MF1132022', 'student'),
	('MF1132023', 'student'),
	('MF1132025', 'student'),
	('MF1132026', 'student'),
	('MF1132028', 'student'),
	('MF1132029', 'student'),
	('MF1132031', 'student'),
	('MF1132032', 'student'),
	('MF1132034', 'student'),
	('MF1132035', 'student'),
	('MF1132037', 'student'),
	('MF1132038', 'student'),
	('MF1132040', 'student'),
	('MF1132041', 'student'),
	('MF1132043', 'student'),
	('MF1132044', 'student'),
	('MF1132045', 'student'),
	('MF1132046', 'student'),
	('MF1132047', 'student'),
	('MF1132049', 'student'),
	('MF1132050', 'student'),
	('MF1132052', 'student'),
	('MF1132053', 'student'),
	('MF1132055', 'student'),
	('MF1132056', 'student'),
	('MF1132058', 'student'),
	('MF1132059', 'student'),
	('MF1132061', 'student'),
	('MF1132062', 'student'),
	('MF1132064', 'student'),
	('MF1132065', 'student'),
	('MF1132068', 'student'),
	('MF1132069', 'student'),
	('MF1132071', 'student'),
	('MF1132072', 'student'),
	('MF1132074', 'student'),
	('MF1132075', 'student'),
	('MF1132077', 'student'),
	('MF1132078', 'student'),
	('MF1132080', 'student'),
	('MF1132082', 'student'),
	('MF1132084', 'student'),
	('MF1132085', 'student'),
	('MF1132087', 'student'),
	('MF1132088', 'student'),
	('MF1132090', 'student'),
	('MF1132091', 'student'),
	('MF1132093', 'student'),
	('MF1132094', 'student'),
	('MF1132096', 'student'),
	('MF1132097', 'student'),
	('MF1132099', 'student'),
	('MF1132100', 'student'),
	('MF1132103', 'student'),
	('MF1132105', 'student'),
	('MF1132106', 'student'),
	('1001', 'teacher'),
	('1002', 'teacher'),
	('1003', 'teacher'),
	('1004', 'teacher'),
	('1005', 'teacher'),
	('1006', 'teacher'),
	('1007', 'teacher'),
	('1008', 'teacher'),
	('1009', 'teacher'),
	('1010', 'teacher'),
	('1011', 'teacher'),
	('1012', 'teacher'),
	('1013', 'teacher'),
	('1014', 'teacher'),
	('1015', 'teacher'),
	('1016', 'teacher'),
	('1017', 'teacher'),
	('1018', 'teacher'),
	('1019', 'teacher'),
	('2001', 'teacher'),
	('2002', 'teacher'),
	('2003', 'teacher'),
	('2004', 'teacher'),
	('2005', 'teacher');
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;


-- 导出  表 activiti.act_id_user 结构
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE IF NOT EXISTS `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_id_user 的数据：~98 rows (大约)
DELETE FROM `act_id_user`;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
INSERT INTO `act_id_user` (`ID_`, `REV_`, `FIRST_`, `LAST_`, `EMAIL_`, `PWD_`, `PICTURE_ID_`) VALUES
	('1001', 1, NULL, '郑滔', 'zhengtao@software.nju.edu.cn', '1001', NULL),
	('1002', 1, NULL, '张瑾玉', 'zhangjinyu@software.nju.edu.cn', '1002', NULL),
	('1003', 1, NULL, '王金庆', 'wangjinqing@software.nju.edu.cn', '1003', NULL),
	('1004', 1, NULL, '王浩然', 'haoranwang@software.nju.edu.cn', '1004', NULL),
	('1005', 1, NULL, '宋健建', 'jjsong@software.nju.edu.cn', '1005', NULL),
	('1006', 1, NULL, '邵栋', 'dongshao@software.nju.edu.cn', '1006', NULL),
	('1007', 1, NULL, '荣国平', 'rongguoping@software.nju.edu.cn', '1007', NULL),
	('1008', 1, NULL, '任桐炜', 'rentongwei@software.nju.edu.cn', '1008', NULL),
	('1009', 1, NULL, '骆斌', 'luobin@software.nju.edu.cn', '1009', NULL),
	('1010', 1, NULL, '刘钦', 'liuqin@software.nju.edu.cn', '1010', NULL),
	('1011', 1, NULL, '刘嘉', 'liujia@software.nju.edu.cn', '1011', NULL),
	('1012', 1, NULL, '刘海涛', 'liuhaitao@software.nju.edu.cn', '1012', NULL),
	('1013', 1, NULL, '刘峰', 'liufeng@software.nju.edu.cn', '1013', NULL),
	('1014', 1, NULL, '葛季栋', 'gejidong@software.nju.edu.cn', '1014', NULL),
	('1015', 1, NULL, '伏晓', 'fuxiao@software.nju.edu.cn', '1015', NULL),
	('1016', 1, NULL, '冯桂焕', 'fengguihuan@software.nju.edu.cn', '1016', NULL),
	('1017', 1, NULL, '丁二玉', 'eryuding@software.nju.edu.cn', '1017', NULL),
	('1018', 1, NULL, '陈振宇', 'zychen@software.nju.edu.cn', '1018', NULL),
	('1019', 1, NULL, '贝佳', 'beijia@software.nju.edu.cn', '1019', NULL),
	('2001', 1, NULL, '外校教师1', 'wxj1@software.nju.edu.cn', '2001', NULL),
	('2002', 1, NULL, '外校教师2', 'wxj1@software.nju.edu.cn', '2002', NULL),
	('2003', 1, NULL, '外校教师3', 'wxj1@software.nju.edu.cn', '2003', NULL),
	('2004', 1, NULL, '外校教师4', 'wxj1@software.nju.edu.cn', '2004', NULL),
	('2005', 1, NULL, '外校教师5', 'wxj1@software.nju.edu.cn', '2005', NULL),
	('MF1132001', 1, NULL, '白天', 'MF1132001@software.nju.edu.cn', 'MF1132001', NULL),
	('MF1132002', 1, NULL, '白智敏', 'MF1132002@software.nju.edu.cn', 'MF1132002', NULL),
	('MF1132003', 1, NULL, '曹骏', 'MF1132003@software.nju.edu.cn', 'MF1132003', NULL),
	('MF1132004', 1, NULL, '曹云翔', 'MF1132004@software.nju.edu.cn', 'MF1132004', NULL),
	('MF1132005', 1, NULL, '陈家敏', 'MF1132005@software.nju.edu.cn', 'MF1132005', NULL),
	('MF1132006', 1, NULL, '陈健', 'MF1132006@software.nju.edu.cn', 'MF1132006', NULL),
	('MF1132007', 1, NULL, '陈志龙', 'MF1132007@software.nju.edu.cn', 'MF1132007', NULL),
	('MF1132008', 1, NULL, '堵彬', 'MF1132008@software.nju.edu.cn', 'MF1132008', NULL),
	('MF1132009', 1, NULL, '方沛', 'MF1132009@software.nju.edu.cn', 'MF1132009', NULL),
	('MF1132011', 1, NULL, '冯洋', 'MF1132011@software.nju.edu.cn', 'MF1132011', NULL),
	('MF1132012', 1, NULL, '顾惟祎', 'MF1132012@software.nju.edu.cn', 'MF1132012', NULL),
	('MF1132013', 1, NULL, '桂婷婷', 'MF1132013@software.nju.edu.cn', 'MF1132013', NULL),
	('MF1132014', 1, NULL, '韩韬略', 'MF1132014@software.nju.edu.cn', 'MF1132014', NULL),
	('MF1132016', 1, NULL, '何源海', 'MF1132016@software.nju.edu.cn', 'MF1132016', NULL),
	('MF1132017', 1, NULL, '洪璐', 'MF1132017@software.nju.edu.cn', 'MF1132017', NULL),
	('MF1132019', 1, NULL, '胡俊鹏', 'MF1132019@software.nju.edu.cn', 'MF1132019', NULL),
	('MF1132020', 1, NULL, '胡馨匀', 'MF1132020@software.nju.edu.cn', 'MF1132020', NULL),
	('MF1132022', 1, NULL, '黄凌婧', 'MF1132022@software.nju.edu.cn', 'MF1132022', NULL),
	('MF1132023', 1, NULL, '黄雪源', 'MF1132023@software.nju.edu.cn', 'MF1132023', NULL),
	('MF1132025', 1, NULL, '蒋亦奇', 'MF1132025@software.nju.edu.cn', 'MF1132025', NULL),
	('MF1132026', 1, NULL, '鞠剑勋', 'MF1132026@software.nju.edu.cn', 'MF1132026', NULL),
	('MF1132028', 1, NULL, '冷永照', 'MF1132028@software.nju.edu.cn', 'MF1132028', NULL),
	('MF1132029', 1, NULL, '李丹', 'MF1132029@software.nju.edu.cn', 'MF1132029', NULL),
	('MF1132031', 1, NULL, '李龙', 'MF1132031@software.nju.edu.cn', 'MF1132031', NULL),
	('MF1132032', 1, NULL, '李永洁', 'MF1132032@software.nju.edu.cn', 'MF1132032', NULL),
	('MF1132034', 1, NULL, '林智灵', 'MF1132034@software.nju.edu.cn', 'MF1132034', NULL),
	('MF1132035', 1, NULL, '刘蓓', 'MF1132035@software.nju.edu.cn', 'MF1132035', NULL),
	('MF1132037', 1, NULL, '刘佳', 'MF1132037@software.nju.edu.cn', 'MF1132037', NULL),
	('MF1132038', 1, NULL, '刘蛟龙', 'MF1132038@software.nju.edu.cn', 'MF1132038', NULL),
	('MF1132040', 1, NULL, '刘世君', 'MF1132040@software.nju.edu.cn', 'MF1132040', NULL),
	('MF1132041', 1, NULL, '刘松', 'MF1132041@software.nju.edu.cn', 'MF1132041', NULL),
	('MF1132043', 1, NULL, '刘雁', 'MF1132043@software.nju.edu.cn', 'MF1132043', NULL),
	('MF1132044', 1, NULL, '陆永伟', 'MF1132044@software.nju.edu.cn', 'MF1132044', NULL),
	('MF1132045', 1, NULL, '路辉', 'MF1132045@software.nju.edu.cn', 'MF1132045', NULL),
	('MF1132046', 1, NULL, '吕金', 'MF1132046@software.nju.edu.cn', 'MF1132046', NULL),
	('MF1132047', 1, NULL, '马亮', 'MF1132047@software.nju.edu.cn', 'MF1132047', NULL),
	('MF1132049', 1, NULL, '潘自丹', 'MF1132049@software.nju.edu.cn', 'MF1132049', NULL),
	('MF1132050', 1, NULL, '乔正', 'MF1132050@software.nju.edu.cn', 'MF1132050', NULL),
	('MF1132052', 1, NULL, '沈毅', 'MF1132052@software.nju.edu.cn', 'MF1132052', NULL),
	('MF1132053', 1, NULL, '盛兴', 'MF1132053@software.nju.edu.cn', 'MF1132053', NULL),
	('MF1132055', 1, NULL, '宋正轩', 'MF1132055@software.nju.edu.cn', 'MF1132055', NULL),
	('MF1132056', 1, NULL, '孙晨蛟', 'MF1132056@software.nju.edu.cn', 'MF1132056', NULL),
	('MF1132058', 1, NULL, '谈琪', 'MF1132058@software.nju.edu.cn', 'MF1132058', NULL),
	('MF1132059', 1, NULL, '唐敏', 'MF1132059@software.nju.edu.cn', 'MF1132059', NULL),
	('MF1132061', 1, NULL, '王诚', 'MF1132061@software.nju.edu.cn', 'MF1132061', NULL),
	('MF1132062', 1, NULL, '王军', 'MF1132062@software.nju.edu.cn', 'MF1132062', NULL),
	('MF1132064', 1, NULL, '王龑', 'MF1132064@software.nju.edu.cn', 'MF1132064', NULL),
	('MF1132065', 1, NULL, '韦泽', 'MF1132065@software.nju.edu.cn', 'MF1132065', NULL),
	('MF1132068', 1, NULL, '项阳阳', 'MF1132068@software.nju.edu.cn', 'MF1132068', NULL),
	('MF1132069', 1, NULL, '谢飞', 'MF1132069@software.nju.edu.cn', 'MF1132069', NULL),
	('MF1132071', 1, NULL, '熊军', 'MF1132071@software.nju.edu.cn', 'MF1132071', NULL),
	('MF1132072', 1, NULL, '徐铖', 'MF1132072@software.nju.edu.cn', 'MF1132072', NULL),
	('MF1132074', 1, NULL, '徐思豪', 'MF1132074@software.nju.edu.cn', 'MF1132074', NULL),
	('MF1132075', 1, NULL, '许旭', 'MF1132075@software.nju.edu.cn', 'MF1132075', NULL),
	('MF1132077', 1, NULL, '闫志法', 'MF1132077@software.nju.edu.cn', 'MF1132077', NULL),
	('MF1132078', 1, NULL, '杨龙', 'MF1132078@software.nju.edu.cn', 'MF1132078', NULL),
	('MF1132080', 1, NULL, '尤磊', 'MF1132080@software.nju.edu.cn', 'MF1132080', NULL),
	('MF1132082', 1, NULL, '袁宾奇', 'MF1132082@software.nju.edu.cn', 'MF1132082', NULL),
	('MF1132084', 1, NULL, '张海龙', 'MF1132084@software.nju.edu.cn', 'MF1132084', NULL),
	('MF1132085', 1, NULL, '张恒', 'MF1132085@software.nju.edu.cn', 'MF1132085', NULL),
	('MF1132087', 1, NULL, '张杰', 'MF1132087@software.nju.edu.cn', 'MF1132087', NULL),
	('MF1132088', 1, NULL, '张俊鹏', 'MF1132088@software.nju.edu.cn', 'MF1132088', NULL),
	('MF1132090', 1, NULL, '张淼', 'MF1132090@software.nju.edu.cn', 'MF1132090', NULL),
	('MF1132091', 1, NULL, '张啸宇', 'MF1132091@software.nju.edu.cn', 'MF1132091', NULL),
	('MF1132093', 1, NULL, '张亿', 'MF1132093@software.nju.edu.cn', 'MF1132093', NULL),
	('MF1132094', 1, NULL, '张之硕', 'MF1132094@software.nju.edu.cn', 'MF1132094', NULL),
	('MF1132096', 1, NULL, '赵斌', 'MF1132096@software.nju.edu.cn', 'MF1132096', NULL),
	('MF1132097', 1, NULL, '赵奕龙', 'MF1132097@software.nju.edu.cn', 'MF1132097', NULL),
	('MF1132099', 1, NULL, '郑欣', 'MF1132099@software.nju.edu.cn', 'MF1132099', NULL),
	('MF1132100', 1, NULL, '周里吉', 'MF1132100@software.nju.edu.cn', 'MF1132100', NULL),
	('MF1132103', 1, NULL, '朱世杰', 'MF1132103@software.nju.edu.cn', 'MF1132103', NULL),
	('MF1132105', 1, NULL, '朱瀛', 'MF1132105@software.nju.edu.cn', 'MF1132105', NULL),
	('MF1132106', 1, NULL, '邹建斌', 'MF1132106@software.nju.edu.cn', 'MF1132106', NULL),
	('jwy', 1, NULL, '教务员', 'jwy@software.nju.edu.cn', 'jwy', NULL);
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;


-- 导出  表 activiti.act_re_deployment 结构
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE IF NOT EXISTS `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_re_deployment 的数据：~1 rows (大约)
DELETE FROM `act_re_deployment`;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;


-- 导出  表 activiti.act_re_model 结构
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE IF NOT EXISTS `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_re_model 的数据：~0 rows (大约)
DELETE FROM `act_re_model`;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;


-- 导出  表 activiti.act_re_procdef 结构
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE IF NOT EXISTS `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_re_procdef 的数据：~1 rows (大约)
DELETE FROM `act_re_procdef`;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;


-- 导出  表 activiti.act_ru_event_subscr 结构
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE IF NOT EXISTS `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_ru_event_subscr 的数据：~0 rows (大约)
DELETE FROM `act_ru_event_subscr`;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;


-- 导出  表 activiti.act_ru_execution 结构
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE IF NOT EXISTS `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_ru_execution 的数据：~4 rows (大约)
DELETE FROM `act_ru_execution`;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;


-- 导出  表 activiti.act_ru_identitylink 结构
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE IF NOT EXISTS `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_ru_identitylink 的数据：~16 rows (大约)
DELETE FROM `act_ru_identitylink`;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;


-- 导出  表 activiti.act_ru_job 结构
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE IF NOT EXISTS `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_ru_job 的数据：~0 rows (大约)
DELETE FROM `act_ru_job`;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;


-- 导出  表 activiti.act_ru_task 结构
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE IF NOT EXISTS `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_ru_task 的数据：~4 rows (大约)
DELETE FROM `act_ru_task`;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;


-- 导出  表 activiti.act_ru_variable 结构
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE IF NOT EXISTS `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  activiti.act_ru_variable 的数据：~36 rows (大约)
DELETE FROM `act_ru_variable`;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;


-- 导出  表 activiti.classes 结构
DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `graduate_num` int(11) DEFAULT NULL,
  `head_teacher` varchar(225) DEFAULT NULL,
  `head_teacher_name` varchar(225) DEFAULT NULL,
  `head_teacher_no` varchar(225) DEFAULT NULL,
  `monitor` varchar(225) DEFAULT NULL,
  `monitor_name` varchar(225) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  `no` varchar(225) DEFAULT NULL,
  `open_date` datetime DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `teaching_point_name` varchar(225) DEFAULT NULL,
  `teaching_point_no` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.classes 的数据：~0 rows (大约)
DELETE FROM `classes`;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;


-- 导出  表 activiti.content 结构
DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.content 的数据：~0 rows (大约)
DELETE FROM `content`;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;


-- 导出  表 activiti.course 结构
DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `course_no` varchar(255) NOT NULL,
  `date` int(11) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  `teacher_name` varchar(255) DEFAULT NULL,
  `teacher_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `course_no` (`course_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.course 的数据：~0 rows (大约)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- 导出  表 activiti.defence 结构
DROP TABLE IF EXISTS `defence`;
CREATE TABLE IF NOT EXISTS `defence` (
  `defence_id` int(11) NOT NULL AUTO_INCREMENT,
  `defence_affix` varchar(225) DEFAULT NULL,
  `defence_content` varchar(255) DEFAULT NULL,
  `defence_count` int(11) DEFAULT NULL,
  `defence_result` varchar(255) DEFAULT NULL,
  `defence_time` datetime DEFAULT NULL,
  `defence_address` varchar(255) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_type` int(11) DEFAULT NULL,
  `three_one` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`defence_id`),
  UNIQUE KEY `defence_id` (`defence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.defence 的数据：~8 rows (大约)
DELETE FROM `defence`;
/*!40000 ALTER TABLE `defence` DISABLE KEYS */;
/*!40000 ALTER TABLE `defence` ENABLE KEYS */;


-- 导出  表 activiti.director 结构
DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `UK_kv29dk1kxeam3wp6bcn624xot` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.director 的数据：~0 rows (大约)
DELETE FROM `director`;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;


-- 导出  表 activiti.email_header 结构
DROP TABLE IF EXISTS `email_header`;
CREATE TABLE IF NOT EXISTS `email_header` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` text,
  `fromAddress` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `replyToAddress` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.email_header 的数据：~0 rows (大约)
DELETE FROM `email_header`;
/*!40000 ALTER TABLE `email_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_header` ENABLE KEYS */;


-- 导出  表 activiti.fee 结构
DROP TABLE IF EXISTS `fee`;
CREATE TABLE IF NOT EXISTS `fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float NOT NULL,
  `fee_type` int(11) NOT NULL,
  `grant_time` datetime DEFAULT NULL,
  `grant_type` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.fee 的数据：~0 rows (大约)
DELETE FROM `fee`;
/*!40000 ALTER TABLE `fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee` ENABLE KEYS */;


-- 导出  表 activiti.head_teacher 结构
DROP TABLE IF EXISTS `head_teacher`;
CREATE TABLE IF NOT EXISTS `head_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.head_teacher 的数据：~0 rows (大约)
DELETE FROM `head_teacher`;
/*!40000 ALTER TABLE `head_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_teacher` ENABLE KEYS */;


-- 导出  表 activiti.interim_report 结构
DROP TABLE IF EXISTS `interim_report`;
CREATE TABLE IF NOT EXISTS `interim_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.interim_report 的数据：~2 rows (大约)
DELETE FROM `interim_report`;
/*!40000 ALTER TABLE `interim_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `interim_report` ENABLE KEYS */;


-- 导出  表 activiti.judge 结构
DROP TABLE IF EXISTS `judge`;
CREATE TABLE IF NOT EXISTS `judge` (
  `judge_id` int(11) NOT NULL AUTO_INCREMENT,
  `judge_affix` varchar(225) DEFAULT NULL,
  `judge_content_student` varchar(225) DEFAULT NULL,
  `judge_content_teacher` varchar(255) DEFAULT NULL,
  `judge_deadline` datetime DEFAULT NULL,
  `judge_result` varchar(255) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`judge_id`),
  UNIQUE KEY `judge_id` (`judge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.judge 的数据：~4 rows (大约)
DELETE FROM `judge`;
/*!40000 ALTER TABLE `judge` DISABLE KEYS */;
/*!40000 ALTER TABLE `judge` ENABLE KEYS */;


-- 导出  表 activiti.notice 结构
DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_content` varchar(255) DEFAULT NULL,
  `notice_level` int(11) DEFAULT NULL,
  `notice_publisher_id` int(11) DEFAULT NULL,
  `notice_publisher_name` varchar(45) DEFAULT NULL,
  `notice_theme` varchar(100) DEFAULT NULL,
  `notice_time` datetime DEFAULT NULL,
  PRIMARY KEY (`notice_id`),
  UNIQUE KEY `notice_id` (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.notice 的数据：~0 rows (大约)
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`notice_id`, `notice_content`, `notice_level`, `notice_publisher_id`, `notice_publisher_name`, `notice_theme`, `notice_time`) VALUES
	(1, '你妈炸了', 1, 1, 'abc', 'THEME', '2015-03-08 19:30:28');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;


-- 导出  表 activiti.paper 结构
DROP TABLE IF EXISTS `paper`;
CREATE TABLE IF NOT EXISTS `paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_address` varchar(255) DEFAULT NULL,
  `paper_affix1` varchar(255) DEFAULT NULL,
  `paper_affix2` varchar(255) DEFAULT NULL,
  `paper_guide_address` varchar(255) DEFAULT NULL,
  `paper_repetition_rate` int(11) DEFAULT NULL,
  `paper_state` varchar(255) DEFAULT NULL,
  `paper_title` varchar(255) DEFAULT NULL,
  `paper_version` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`paper_id`),
  UNIQUE KEY `paper_id` (`paper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.paper 的数据：~2 rows (大约)
DELETE FROM `paper`;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;


-- 导出  表 activiti.proposal 结构
DROP TABLE IF EXISTS `proposal`;
CREATE TABLE IF NOT EXISTS `proposal` (
  `proposal_id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_address` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`proposal_id`),
  UNIQUE KEY `proposal_id` (`proposal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.proposal 的数据：~2 rows (大约)
DELETE FROM `proposal`;
/*!40000 ALTER TABLE `proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `proposal` ENABLE KEYS */;


-- 导出  表 activiti.student 结构
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `absence` int(11) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `class_no` varchar(255) DEFAULT NULL,
  `degree_type` int(11) DEFAULT NULL,
  `nominal_teacher_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `student_grade` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_number` varchar(11) DEFAULT NULL,
  `student_phone` varchar(255) DEFAULT NULL,
  `student_phone_x` varchar(255) DEFAULT NULL,
  `study_time` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teaching_point_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `student_id` (`student_id`),
  UNIQUE KEY `student_number` (`student_number`),
  UNIQUE KEY `student_number_2` (`student_number`),
  UNIQUE KEY `UK_17gskajnuiawdedks0b3lp8rx` (`student_number`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.student 的数据：~73 rows (大约)
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_id`, `absence`, `class_name`, `class_no`, `degree_type`, `nominal_teacher_id`, `score`, `student_email`, `student_grade`, `student_name`, `student_number`, `student_phone`, `student_phone_x`, `study_time`, `teacher_id`, `teaching_point_no`) VALUES
	(1, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132001@software.nju.edu.cn', '2', '白天', 'MF1132001', '15212345678', '15200000000', 1, NULL, NULL),
	(2, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132002@software.nju.edu.cn', '2', '白智敏', 'MF1132002', '15212345679', '15200000001', 1, NULL, NULL),
	(3, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132003@software.nju.edu.cn', '2', '曹骏', 'MF1132003', '15212345680', '15200000002', 1, NULL, NULL),
	(4, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132004@software.nju.edu.cn', '2', '曹云翔', 'MF1132004', '15212345681', '15200000003', 1, NULL, NULL),
	(5, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132005@software.nju.edu.cn', '2', '陈家敏', 'MF1132005', '15212345682', '15200000004', 1, NULL, NULL),
	(6, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132006@software.nju.edu.cn', '2', '陈健', 'MF1132006', '15212345683', '15200000005', 1, NULL, NULL),
	(7, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132007@software.nju.edu.cn', '2', '陈志龙', 'MF1132007', '15212345684', '15200000006', 1, NULL, NULL),
	(8, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132008@software.nju.edu.cn', '2', '堵彬', 'MF1132008', '15212345685', '15200000007', 1, NULL, NULL),
	(9, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132009@software.nju.edu.cn', '2', '方沛', 'MF1132009', '15212345686', '15200000008', 1, NULL, NULL),
	(10, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132011@software.nju.edu.cn', '2', '冯洋', 'MF1132011', '15212345687', '15200000009', 1, NULL, NULL),
	(11, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132012@software.nju.edu.cn', '2', '顾惟祎', 'MF1132012', '15212345688', '15200000010', 1, NULL, NULL),
	(12, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132013@software.nju.edu.cn', '2', '桂婷婷', 'MF1132013', '15212345689', '15200000011', 1, NULL, NULL),
	(13, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132014@software.nju.edu.cn', '2', '韩韬略', 'MF1132014', '15212345690', '15200000012', 1, NULL, NULL),
	(14, NULL, '2011届全日制工程硕士一班', NULL, 1, NULL, NULL, 'MF1132016@software.nju.edu.cn', '2', '何源海', 'MF1132016', '15212345691', '15200000013', 1, NULL, NULL),
	(15, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132017@software.nju.edu.cn', '2', '洪璐', 'MF1132017', '15212345692', '15200000014', 1, NULL, NULL),
	(16, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132019@software.nju.edu.cn', '2', '胡俊鹏', 'MF1132019', '15212345693', '15200000015', 1, NULL, NULL),
	(17, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132020@software.nju.edu.cn', '2', '胡馨匀', 'MF1132020', '15212345694', '15200000016', 1, NULL, NULL),
	(18, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132022@software.nju.edu.cn', '2', '黄凌婧', 'MF1132022', '15212345695', '15200000017', 1, NULL, NULL),
	(19, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132023@software.nju.edu.cn', '2', '黄雪源', 'MF1132023', '15212345696', '15200000018', 1, NULL, NULL),
	(20, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132025@software.nju.edu.cn', '2', '蒋亦奇', 'MF1132025', '15212345697', '15200000019', 1, NULL, NULL),
	(21, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132026@software.nju.edu.cn', '2', '鞠剑勋', 'MF1132026', '15212345698', '15200000020', 1, NULL, NULL),
	(22, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132028@software.nju.edu.cn', '2', '冷永照', 'MF1132028', '15212345699', '15200000021', 1, NULL, NULL),
	(23, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132029@software.nju.edu.cn', '2', '李丹', 'MF1132029', '15212345700', '15200000022', 1, NULL, NULL),
	(24, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132031@software.nju.edu.cn', '2', '李龙', 'MF1132031', '15212345701', '15200000023', 1, NULL, NULL),
	(25, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132032@software.nju.edu.cn', '2', '李永洁', 'MF1132032', '15212345702', '15200000024', 1, NULL, NULL),
	(26, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132034@software.nju.edu.cn', '2', '林智灵', 'MF1132034', '15212345703', '15200000025', 1, NULL, NULL),
	(27, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132035@software.nju.edu.cn', '2', '刘蓓', 'MF1132035', '15212345704', '15200000026', 1, NULL, NULL),
	(28, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132037@software.nju.edu.cn', '2', '刘佳', 'MF1132037', '15212345705', '15200000027', 1, NULL, NULL),
	(29, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132038@software.nju.edu.cn', '2', '刘蛟龙', 'MF1132038', '15212345706', '15200000028', 1, NULL, NULL),
	(30, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132040@software.nju.edu.cn', '2', '刘世君', 'MF1132040', '15212345707', '15200000029', 1, NULL, NULL),
	(31, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132041@software.nju.edu.cn', '2', '刘松', 'MF1132041', '15212345708', '15200000030', 1, NULL, NULL),
	(32, NULL, '2011届全日制工程硕士二班', NULL, 1, NULL, NULL, 'MF1132043@software.nju.edu.cn', '2', '刘雁', 'MF1132043', '15212345709', '15200000031', 1, NULL, NULL),
	(33, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132044@software.nju.edu.cn', '2', '陆永伟', 'MF1132044', '15212345710', '15200000032', 1, NULL, NULL),
	(34, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132045@software.nju.edu.cn', '2', '路辉', 'MF1132045', '15212345711', '15200000033', 1, NULL, NULL),
	(35, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132046@software.nju.edu.cn', '2', '吕金', 'MF1132046', '15212345712', '15200000034', 1, NULL, NULL),
	(36, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132047@software.nju.edu.cn', '2', '马亮', 'MF1132047', '15212345713', '15200000035', 1, NULL, NULL),
	(37, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132049@software.nju.edu.cn', '2', '潘自丹', 'MF1132049', '15212345714', '15200000036', 1, NULL, NULL),
	(38, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132050@software.nju.edu.cn', '2', '乔正', 'MF1132050', '15212345715', '15200000037', 1, NULL, NULL),
	(39, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132052@software.nju.edu.cn', '2', '沈毅', 'MF1132052', '15212345716', '15200000038', 1, NULL, NULL),
	(40, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132053@software.nju.edu.cn', '2', '盛兴', 'MF1132053', '15212345717', '15200000039', 1, NULL, NULL),
	(41, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132055@software.nju.edu.cn', '2', '宋正轩', 'MF1132055', '15212345718', '15200000040', 1, NULL, NULL),
	(42, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132056@software.nju.edu.cn', '2', '孙晨蛟', 'MF1132056', '15212345719', '15200000041', 1, NULL, NULL),
	(43, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132058@software.nju.edu.cn', '2', '谈琪', 'MF1132058', '15212345720', '15200000042', 1, NULL, NULL),
	(44, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132059@software.nju.edu.cn', '2', '唐敏', 'MF1132059', '15212345721', '15200000043', 1, NULL, NULL),
	(45, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132061@software.nju.edu.cn', '2', '王诚', 'MF1132061', '15212345722', '15200000044', 1, NULL, NULL),
	(46, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132062@software.nju.edu.cn', '2', '王军', 'MF1132062', '15212345723', '15200000045', 1, NULL, NULL),
	(47, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132064@software.nju.edu.cn', '2', '王龑', 'MF1132064', '15212345724', '15200000046', 1, NULL, NULL),
	(48, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132065@software.nju.edu.cn', '2', '韦泽', 'MF1132065', '15212345725', '15200000047', 1, NULL, NULL),
	(49, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132068@software.nju.edu.cn', '2', '项阳阳', 'MF1132068', '15212345726', '15200000048', 1, NULL, NULL),
	(50, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132069@software.nju.edu.cn', '2', '谢飞', 'MF1132069', '15212345727', '15200000049', 1, NULL, NULL),
	(51, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132071@software.nju.edu.cn', '2', '熊军', 'MF1132071', '15212345728', '15200000050', 1, NULL, NULL),
	(52, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132072@software.nju.edu.cn', '2', '徐铖', 'MF1132072', '15212345729', '15200000051', 1, NULL, NULL),
	(53, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132074@software.nju.edu.cn', '2', '徐思豪', 'MF1132074', '15212345730', '15200000052', 1, NULL, NULL),
	(54, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132075@software.nju.edu.cn', '2', '许旭', 'MF1132075', '15212345731', '15200000053', 1, NULL, NULL),
	(55, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132077@software.nju.edu.cn', '2', '闫志法', 'MF1132077', '15212345732', '15200000054', 1, NULL, NULL),
	(56, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132078@software.nju.edu.cn', '2', '杨龙', 'MF1132078', '15212345733', '15200000055', 1, NULL, NULL),
	(57, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132080@software.nju.edu.cn', '2', '尤磊', 'MF1132080', '15212345734', '15200000056', 1, NULL, NULL),
	(58, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132082@software.nju.edu.cn', '2', '袁宾奇', 'MF1132082', '15212345735', '15200000057', 1, NULL, NULL),
	(59, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132084@software.nju.edu.cn', '2', '张海龙', 'MF1132084', '15212345736', '15200000058', 1, NULL, NULL),
	(60, NULL, '2011届全日制工程硕士三班', NULL, 1, NULL, NULL, 'MF1132085@software.nju.edu.cn', '2', '张恒', 'MF1132085', '15212345737', '15200000059', 1, NULL, NULL),
	(61, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132087@software.nju.edu.cn', '2', '张杰', 'MF1132087', '15212345738', '15200000060', 1, NULL, NULL),
	(62, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132088@software.nju.edu.cn', '2', '张俊鹏', 'MF1132088', '15212345739', '15200000061', 1, NULL, NULL),
	(63, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132090@software.nju.edu.cn', '2', '张淼', 'MF1132090', '15212345740', '15200000062', 1, NULL, NULL),
	(64, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132091@software.nju.edu.cn', '2', '张啸宇', 'MF1132091', '15212345741', '15200000063', 1, NULL, NULL),
	(65, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132093@software.nju.edu.cn', '2', '张亿', 'MF1132093', '15212345742', '15200000064', 1, NULL, NULL),
	(66, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132094@software.nju.edu.cn', '2', '张之硕', 'MF1132094', '15212345743', '15200000065', 1, NULL, NULL),
	(67, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132096@software.nju.edu.cn', '2', '赵斌', 'MF1132096', '15212345744', '15200000066', 1, NULL, NULL),
	(68, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132097@software.nju.edu.cn', '2', '赵奕龙', 'MF1132097', '15212345745', '15200000067', 1, NULL, NULL),
	(69, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132099@software.nju.edu.cn', '2', '郑欣', 'MF1132099', '15212345746', '15200000068', 1, NULL, NULL),
	(70, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132100@software.nju.edu.cn', '2', '周里吉', 'MF1132100', '15212345747', '15200000069', 1, NULL, NULL),
	(71, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132103@software.nju.edu.cn', '2', '朱世杰', 'MF1132103', '15212345748', '15200000070', 1, NULL, NULL),
	(72, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132105@software.nju.edu.cn', '2', '朱瀛', 'MF1132105', '15212345749', '15200000071', 1, NULL, NULL),
	(73, NULL, '2011届全日制工程硕士四班', NULL, 1, NULL, NULL, 'MF1132106@software.nju.edu.cn', '2', '邹建斌', 'MF1132106', '15212345750', '15200000072', 1, NULL, NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 导出  表 activiti.student_course_info 结构
DROP TABLE IF EXISTS `student_course_info`;
CREATE TABLE IF NOT EXISTS `student_course_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `course_no` varchar(255) NOT NULL,
  `date` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_no` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.student_course_info 的数据：~0 rows (大约)
DELETE FROM `student_course_info`;
/*!40000 ALTER TABLE `student_course_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_course_info` ENABLE KEYS */;


-- 导出  表 activiti.student_score 结构
DROP TABLE IF EXISTS `student_score`;
CREATE TABLE IF NOT EXISTS `student_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `excellent` int(11) DEFAULT NULL,
  `good` int(11) DEFAULT NULL,
  `medium` int(11) DEFAULT NULL,
  `pass` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.student_score 的数据：~0 rows (大约)
DELETE FROM `student_score`;
/*!40000 ALTER TABLE `student_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_score` ENABLE KEYS */;


-- 导出  表 activiti.suggestion 结构
DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE IF NOT EXISTS `suggestion` (
  `suggestion_id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_name` varchar(45) DEFAULT NULL,
  `suggest_content` varchar(255) DEFAULT NULL,
  `suggest_time` datetime DEFAULT NULL,
  `suggest_title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_read` bit(1) DEFAULT b'0',
  PRIMARY KEY (`suggestion_id`),
  UNIQUE KEY `suggestion_id` (`suggestion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.suggestion 的数据：~44 rows (大约)
DELETE FROM `suggestion`;
/*!40000 ALTER TABLE `suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestion` ENABLE KEYS */;


-- 导出  表 activiti.suggestion_reply 结构
DROP TABLE IF EXISTS `suggestion_reply`;
CREATE TABLE IF NOT EXISTS `suggestion_reply` (
  `suggestion_reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_suggestion_id` int(11) DEFAULT NULL,
  `suggestion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`suggestion_reply_id`),
  UNIQUE KEY `suggestion_reply_id` (`suggestion_reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.suggestion_reply 的数据：~0 rows (大约)
DELETE FROM `suggestion_reply`;
/*!40000 ALTER TABLE `suggestion_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestion_reply` ENABLE KEYS */;


-- 导出  表 activiti.teacher 结构
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_classes` int(11) DEFAULT NULL,
  `teacher_education` int(11) DEFAULT NULL,
  `teacher_email` varchar(255) DEFAULT NULL,
  `teacher_job_title` int(11) DEFAULT NULL,
  `teacher_name` varchar(255) DEFAULT NULL,
  `teacher_number` varchar(255) DEFAULT NULL,
  `teacher_phone` varchar(255) DEFAULT NULL,
  `teacher_qualification` int(11) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `teacher_id` (`teacher_id`),
  UNIQUE KEY `teacher_number` (`teacher_number`),
  UNIQUE KEY `teacher_number_2` (`teacher_number`),
  UNIQUE KEY `UK_t10ptwk1wjb50yxm7eqbwqbej` (`teacher_number`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.teacher 的数据：~25 rows (大约)
DELETE FROM `teacher`;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacher_id`, `teacher_classes`, `teacher_education`, `teacher_email`, `teacher_job_title`, `teacher_name`, `teacher_number`, `teacher_phone`, `teacher_qualification`) VALUES
	(1, 1, 3, 'jwy@software.nju.edu.cn', 1, '教务员', 'jwy', '15292387443', 1),
	(27, 0, 2, 'haoranwang@software.nju.edu.cn', 2, '王浩然', '1004', '15200000000', 1),
	(28, 0, 2, 'dongshao@software.nju.edu.cn', 2, '邵栋', '1006', '15200000002', 0),
	(29, 0, 2, 'zychen@software.nju.edu.cn', 2, '陈振宇', '1018', '15200000008', 1),
	(30, 0, 2, 'wangjinqing@software.nju.edu.cn', 1, '王金庆', '1003', '15200000016', 0),
	(31, 0, 2, 'zhangjinyu@software.nju.edu.cn', 0, '张瑾玉', '1002', '15200000055', 0),
	(32, 0, 2, 'jjsong@software.nju.edu.cn', 0, '宋健建', '1005', '15200000031', 0),
	(33, 0, 2, 'rongguoping@software.nju.edu.cn', 0, '荣国平', '1007', '15200000068', 0),
	(34, 0, 2, 'rentongwei@software.nju.edu.cn', 2, '任桐炜', '1008', '15200000071', 0),
	(35, 0, 2, 'liuqin@software.nju.edu.cn', 0, '刘钦', '1010', '15200000009', 0),
	(36, 0, 2, 'liujia@software.nju.edu.cn', 0, '刘嘉', '1011', '15200000022', 0),
	(37, 0, 2, 'liuhaitao@software.nju.edu.cn', 0, '刘海涛', '1012', '15200000028', 0),
	(38, 0, 2, 'liufeng@software.nju.edu.cn', 0, '刘峰', '1013', '15200000012', 0),
	(39, 0, 2, 'gejidong@software.nju.edu.cn', 2, '葛季栋', '1014', '15200000047', 0),
	(40, 0, 2, 'fuxiao@software.nju.edu.cn', 0, '伏晓', '1015', '15200000067', 0),
	(41, 0, 2, 'fengguihuan@software.nju.edu.cn', 0, '冯桂焕', '1016', '15200000062', 0),
	(42, 0, 2, 'eryuding@software.nju.edu.cn', 0, '丁二玉', '1017', '15200000048', 0),
	(43, 0, 2, 'zhengtao@software.nju.edu.cn', 3, '郑滔', '1001', '15200000011', 2),
	(44, 0, 2, 'luobin@software.nju.edu.cn', 3, '骆斌', '1009', '15200000004', 2),
	(45, 0, 2, 'beijia@software.nju.edu.cn', 2, '贝佳', '1019', '15200000041', 1),
	(46, 1, 2, 'wxj1@software.nju.edu.cn', 0, '外校教师1', '2001', '15200000041', 1),
	(47, 1, 2, 'wxj1@software.nju.edu.cn', 0, '外校教师2', '2002', '15200000041', 1),
	(48, 1, 2, 'wxj1@software.nju.edu.cn', 0, '外校教师3', '2003', '15200000041', 1),
	(49, 1, 2, 'wxj1@software.nju.edu.cn', 0, '外校教师4', '2004', '15200000041', 1),
	(50, 1, 2, 'wxj1@software.nju.edu.cn', 0, '外校教师5', '2005', '15200000041', 1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


-- 导出  表 activiti.teaching_point 结构
DROP TABLE IF EXISTS `teaching_point`;
CREATE TABLE IF NOT EXISTS `teaching_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director_name` varchar(255) DEFAULT NULL,
  `director_no` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  activiti.teaching_point 的数据：~0 rows (大约)
DELETE FROM `teaching_point`;
/*!40000 ALTER TABLE `teaching_point` DISABLE KEYS */;
/*!40000 ALTER TABLE `teaching_point` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;