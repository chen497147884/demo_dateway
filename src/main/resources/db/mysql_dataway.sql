/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80018
Source Host           : 127.0.0.1:3306
Source Database       : db_ttshop

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-06-18 18:13:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for interface_release
-- ----------------------------
DROP TABLE IF EXISTS `interface_release`;
CREATE TABLE `interface_release` (
  `pub_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Publish ID',
  `pub_api_id` int(11) NOT NULL COMMENT '所属API ID',
  `pub_method` varchar(12) NOT NULL COMMENT 'HttpMethod：GET、PUT、POST',
  `pub_path` varchar(512) NOT NULL COMMENT '拦截路径',
  `pub_status` int(2) NOT NULL COMMENT '状态：0有效，1无效（可能被下线）',
  `pub_type` varchar(24) NOT NULL COMMENT '脚本类型：SQL、DataQL',
  `pub_script` mediumtext NOT NULL COMMENT '查询脚本：xxxxxxx',
  `pub_script_ori` mediumtext NOT NULL COMMENT '原始查询脚本，仅当类型为SQL时不同',
  `pub_schema` mediumtext COMMENT '接口的请求/响应数据结构',
  `pub_sample` mediumtext COMMENT '请求/响应/请求头样本数据',
  `pub_release_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间（下线不更新）',
  PRIMARY KEY (`pub_id`),
  KEY `idx_interface_release` (`pub_api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dataway API 发布历史。';

-- ----------------------------
-- Records of interface_release
-- ----------------------------
INSERT INTO `interface_release` VALUES ('1', '2', 'GET', '/api/getInterfaceInfo', '0', 'SQL', 'var tempCall = @@sql(`message`)<%select * from interface_info\n%>;\nreturn tempCall(${message});', 'select * from interface_info\n', '{}', '{\"requestBody\":\"{\\n  \\\"message\\\": \\\"Hello DataQL.\\\"\\n}\",\"headerData\":[]}', '2020-06-18 18:10:20');
INSERT INTO `interface_release` VALUES ('2', '3', 'GET', '/api/getInterfaceInfo2', '0', 'DataQL', 'var query = @@sql()<%\n    select * from interface_info\n%>\nreturn query()', 'var query = @@sql()<%\n    select * from interface_info\n%>\nreturn query()', '{}', '{\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"headerData\":[]}', '2020-06-18 18:10:27');

-- ----------------------------
-- Table structure for interface_info
-- ----------------------------
DROP TABLE IF EXISTS `interface_info`;
CREATE TABLE `interface_info` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `api_method` varchar(12) NOT NULL COMMENT 'HttpMethod：GET、PUT、POST',
  `api_path` varchar(512) NOT NULL COMMENT '拦截路径',
  `api_status` int(2) NOT NULL COMMENT '状态：0草稿，1发布，2有变更，3禁用',
  `api_comment` varchar(255) DEFAULT NULL COMMENT '注释',
  `api_type` varchar(24) NOT NULL COMMENT '脚本类型：SQL、DataQL',
  `api_script` mediumtext NOT NULL COMMENT '查询脚本：xxxxxxx',
  `api_schema` mediumtext COMMENT '接口的请求/响应数据结构',
  `api_sample` mediumtext COMMENT '请求/响应/请求头样本数据',
  `api_create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `api_gmt_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Dataway 中的API';

-- ----------------------------
-- Records of interface_info
-- ----------------------------
INSERT INTO `interface_info` VALUES ('2', 'GET', '/api/getInterfaceInfo', '1', '', 'SQL', 'select * from interface_info\n', '{}', '{\"requestBody\":\"{\\n  \\\"message\\\": \\\"Hello DataQL.\\\"\\n}\",\"headerData\":[]}', '2020-06-18 18:07:11', '2020-06-18 18:10:21');
INSERT INTO `interface_info` VALUES ('3', 'GET', '/api/getInterfaceInfo2', '1', '', 'DataQL', 'var query = @@sql()<%\n    select * from interface_info\n%>\nreturn query()', '{}', '{\"requestBody\":\"{\\\"message\\\":\\\"Hello DataQL.\\\"}\",\"headerData\":[]}', '2020-06-18 18:08:06', '2020-06-18 18:10:28');
