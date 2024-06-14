/*
 Navicat Premium Data Transfer

 Source Server         : test1
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : localhost:3306
 Source Schema         : hm-pay

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 11/06/2024 01:09:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Create database hm-pay
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `hm-pay`;
USE `hm-pay`;

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `biz_order_no` bigint NOT NULL COMMENT '业务订单号',
  `pay_order_no` bigint NOT NULL DEFAULT '0' COMMENT '支付单号',
  `biz_user_id` bigint NOT NULL COMMENT '支付用户id',
  `pay_channel_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '支付渠道编码',
  `amount` int NOT NULL COMMENT '支付金额，单位分',
  `pay_type` tinyint NOT NULL DEFAULT '5' COMMENT '支付类型，1：h5,2:小程序，3：公众号，4：扫码，5：余额支付',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '支付状态，0：待提交，1:待支付，2：支付超时或取消，3：支付成功',
  `expand_json` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '拓展字段，用于传递不同渠道单独处理的字段',
  `result_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '第三方返回业务码',
  `result_msg` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '第三方返回提示信息',
  `pay_success_time` datetime DEFAULT NULL COMMENT '支付成功时间',
  `pay_over_time` datetime NOT NULL COMMENT '支付超时时间',
  `qr_code_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '支付二维码链接',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creater` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `updater` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `is_delete` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `biz_order_no` (`biz_order_no`) USING BTREE,
  UNIQUE KEY `pay_order_no` (`pay_order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1799481613053378563 DEFAULT CHARSET=utf8mb3 COMMENT='支付订单';

-- ----------------------------
-- Records of pay_order
-- ----------------------------
BEGIN;
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1658455441987891201, 1658453559437434882, 1658455441975308289, 1, 'balance', 55400, 5, 3, '', '', '', '2024-06-05 19:59:38', '2023-05-16 22:52:45', NULL, '2023-05-16 20:52:44', '2024-06-05 19:59:37', 0, 0, b'0');
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1659160218174607363, 1659160216593354754, 1659160218174607362, 1, 'balance', 156000, 5, 3, '', '', '', '2023-05-18 19:34:48', '2023-05-18 21:33:16', NULL, '2023-05-18 19:33:16', '2023-05-18 19:37:54', 0, 0, b'0');
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1798372983625330689, 1798372979783249922, 1798372983621136385, 1, 'balance', 476700, 5, 3, '', '', '', '2024-06-05 23:15:10', '2024-06-06 01:15:06', NULL, '2024-06-05 23:15:06', '2024-06-05 23:15:10', 0, 0, b'0');
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1798731759234625538, 1798731754981609473, 1798731759230431233, 1, 'balance', 144600, 5, 3, '', '', '', '2024-06-06 23:00:48', '2024-06-07 01:00:45', NULL, '2024-06-06 23:00:44', '2024-06-06 23:00:48', 0, 0, b'0');
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1799455695429726210, 1799455686592360450, 1799455695421337602, 1, 'balance', 899600, 5, 1, '', '', '', NULL, '2024-06-09 00:57:25', NULL, '2024-06-08 22:57:24', '2024-06-08 22:57:24', 0, 0, b'0');
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1799479457218871297, 1799479449627176961, 1799479457197899777, 1, 'balance', 224900, 5, 1, '', '', '', NULL, '2024-06-09 02:31:50', NULL, '2024-06-09 00:31:49', '2024-06-09 00:31:49', 0, 0, b'0');
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1799479703235772417, 1799479701314777090, 1799479703214800898, 1, 'balance', 224900, 5, 1, '', '', '', NULL, '2024-06-09 02:32:49', NULL, '2024-06-09 00:32:48', '2024-06-09 00:32:48', 0, 0, b'0');
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1799479917791199233, 1799479914590941185, 1799479917787004930, 1, 'balance', 224900, 5, 1, '', '', '', NULL, '2024-06-09 02:33:40', NULL, '2024-06-09 00:33:39', '2024-06-09 00:33:39', 0, 0, b'0');
INSERT INTO `pay_order` (`id`, `biz_order_no`, `pay_order_no`, `biz_user_id`, `pay_channel_code`, `amount`, `pay_type`, `status`, `expand_json`, `result_code`, `result_msg`, `pay_success_time`, `pay_over_time`, `qr_code_url`, `create_time`, `update_time`, `creater`, `updater`, `is_delete`) VALUES (1799481613053378562, 1799481611035914241, 1799481613053378561, 1, 'balance', 224900, 5, 1, '', '', '', NULL, '2024-06-09 02:40:24', NULL, '2024-06-09 00:40:23', '2024-06-09 00:40:23', 0, 0, b'0');
COMMIT;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log` (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(128) NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`),
  KEY `ix_log_created` (`log_created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='AT transaction mode undo table';

-- ----------------------------
-- Records of undo_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
