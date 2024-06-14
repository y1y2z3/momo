/*
 Navicat Premium Data Transfer

 Source Server         : test1
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : localhost:3306
 Source Schema         : hm-cart

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 11/06/2024 01:09:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Create database hm-cart
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `hm-cart`;
USE `hm-cart`;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '购物车条目id ',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `item_id` bigint NOT NULL COMMENT 'sku商品id',
  `num` int NOT NULL DEFAULT '1' COMMENT '购买数量',
  `name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品标题',
  `spec` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品动态属性键值集',
  `price` int NOT NULL COMMENT '价格,单位：分',
  `image` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '商品图片',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `key_user_item_id` (`user_id`,`item_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='订单详情表';

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` (`id`, `user_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (29, 1, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-06-09 18:46:16', '2024-06-09 18:46:16');
INSERT INTO `cart` (`id`, `user_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (30, 1, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-06-09 18:46:19', '2024-06-09 18:46:19');
INSERT INTO `cart` (`id`, `user_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (31, 1, 100001905417, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-09 18:46:22', '2024-06-09 18:46:22');
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
