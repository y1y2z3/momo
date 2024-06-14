/*
 Navicat Premium Data Transfer

 Source Server         : test1
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : localhost:3306
 Source Schema         : hm-trade

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 11/06/2024 01:09:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Create database hm-trade
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `hm-trade`;
USE `hm-trade`;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` bigint NOT NULL COMMENT '订单id',
  `total_fee` int NOT NULL DEFAULT '0' COMMENT '总金额，单位为分',
  `payment_type` tinyint(1) unsigned zerofill NOT NULL COMMENT '支付类型，1、支付宝，2、微信，3、扣减余额',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `status` tinyint(1) DEFAULT NULL COMMENT '订单的状态，1、未付款 2、已付款,未发货 3、已发货,未确认 4、确认收货，交易成功 5、交易取消，订单关闭 6、交易结束，已评价',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `consign_time` timestamp NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` timestamp NULL DEFAULT NULL COMMENT '交易关闭时间',
  `comment_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `multi_key_status_time` (`status`,`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (123865420, 327900, 3, 2, 1, '2021-07-28 19:01:41', NULL, NULL, NULL, NULL, NULL, '2021-07-28 19:01:47');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1654779387523936258, 135800, 3, 1, 1, '2023-05-06 17:25:24', NULL, NULL, NULL, NULL, NULL, '2023-05-06 17:25:24');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1654782927348740097, 135800, 3, 1, 1, '2023-05-06 17:39:28', NULL, NULL, NULL, NULL, NULL, '2023-05-06 17:39:28');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1658434251768471554, 120000, 3, 1, 1, '2023-05-16 19:28:32', NULL, NULL, NULL, NULL, NULL, '2023-05-16 19:28:32');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1658453559437434882, 55400, 3, 1, 2, '2023-05-16 20:45:15', '2024-06-05 19:59:38', NULL, NULL, NULL, NULL, '2024-06-05 19:59:37');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1659160216593354754, 156000, 3, 1, 1, '2023-05-18 19:33:16', NULL, NULL, NULL, NULL, NULL, '2023-05-18 19:33:16');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1798026124717256705, 28900, 0, 2, 1, '2024-06-05 00:16:48', NULL, NULL, NULL, NULL, NULL, '2024-06-05 00:16:48');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1798046082968907778, 28900, 0, 2, 1, '2024-06-05 01:36:06', NULL, NULL, NULL, NULL, NULL, '2024-06-05 01:36:06');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1798372979783249922, 476700, 3, 1, 2, '2024-06-05 23:15:05', '2024-06-05 23:15:10', NULL, NULL, NULL, NULL, '2024-06-05 23:15:10');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1798731754981609473, 144600, 3, 1, 2, '2024-06-06 23:00:43', '2024-06-06 23:00:48', NULL, NULL, NULL, NULL, '2024-06-06 23:00:48');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1799455607429066754, 899600, 3, 1, 1, '2024-06-08 22:57:03', NULL, NULL, NULL, NULL, NULL, '2024-06-08 22:57:03');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1799455686592360450, 899600, 3, 1, 1, '2024-06-08 22:57:22', NULL, NULL, NULL, NULL, NULL, '2024-06-08 22:57:22');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1799479449627176961, 224900, 3, 1, 1, '2024-06-09 00:31:48', NULL, NULL, NULL, NULL, NULL, '2024-06-09 00:31:48');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1799479701314777090, 224900, 3, 1, 1, '2024-06-09 00:32:48', NULL, NULL, NULL, NULL, NULL, '2024-06-09 00:32:48');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1799479914590941185, 224900, 3, 1, 1, '2024-06-09 00:33:39', NULL, NULL, NULL, NULL, NULL, '2024-06-09 00:33:39');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1799481611035914241, 224900, 3, 1, 1, '2024-06-09 00:40:23', NULL, NULL, NULL, NULL, NULL, '2024-06-09 00:40:23');
INSERT INTO `order` (`id`, `total_fee`, `payment_type`, `user_id`, `status`, `create_time`, `pay_time`, `consign_time`, `end_time`, `close_time`, `comment_time`, `update_time`) VALUES (1799483613014962178, 224900, 3, 1, 1, '2024-06-09 00:48:20', NULL, NULL, NULL, NULL, NULL, '2024-06-09 00:48:20');
COMMIT;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单详情id ',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `item_id` bigint NOT NULL COMMENT 'sku商品id',
  `num` int NOT NULL COMMENT '购买数量',
  `name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品标题',
  `spec` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '商品动态属性键值集',
  `price` int NOT NULL COMMENT '价格,单位：分',
  `image` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '商品图片',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `key_order_id` (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
BEGIN;
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (1, 123865420, 100000003145, 2, 'vivo X23 8GB+128GB 幻夜蓝 水滴屏全面屏 游戏手机 移动联通电信全网通4G手机', '{\"颜色\": \"红色\", \"版本\": \"8GB+128GB\"}', 95900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/4612/28/6223/298257/5ba22d66Ef665222f/d97ed0b25cbe8c6e.jpg!q70.jpg.webp', '2021-07-28 19:05:21', '2021-07-28 19:05:21');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (8, 1654779387523936258, 100002672274, 2, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-06 17:25:24', '2023-05-06 17:25:24');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (9, 1654779387523936258, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-06 17:25:24', '2023-05-06 17:25:24');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (10, 1654782927348740097, 100002672274, 2, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-06 17:39:28', '2023-05-06 17:39:28');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (11, 1654782927348740097, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-06 17:39:28', '2023-05-06 17:39:28');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (12, 1658434251768471554, 100002672272, 1, '荣耀V20胡歌同款手机全网通 标配版 6GB+128GB 魅丽红 游戏手机 移动联通电信4G全面屏手机 双卡双待', '{\"颜色\": \"红色\"}', 95000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/8112/20/10485/366920/5c2336deEab272fe3/12b58de5020ca1a1.jpg!q70.jpg.webp', '2023-05-16 19:28:32', '2023-05-16 19:28:32');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (13, 1658434251768471554, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-16 19:28:32', '2023-05-16 19:28:32');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (14, 1658453559437434882, 100002672274, 1, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-16 20:45:15', '2023-05-16 20:45:15');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (15, 1659160216593354754, 100001964366, 1, 'OPPO A7 全面屏拍照手机 4GB+64GB 清新粉 全网通 移动联通电信4G 双卡双待手机', '{\"颜色\": \"粉色\"}', 65400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t25564/327/2615611632/135559/d3c69840/5bebd32eN3bf6f987.jpg!q70.jpg.webp', '2023-05-18 19:33:16', '2023-05-18 19:33:16');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (16, 1659160216593354754, 100002624512, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 90600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2023-05-18 19:33:16', '2023-05-18 19:33:16');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (20, 1798026124717256705, 317578, 1, 'RIMOWA 21寸托运箱拉杆箱 SALSA AIR系列果绿色 820.70.36.4', '{\"颜色\": \"红色\", \"尺码\": \"21寸\"}', 28900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t6934/364/1195375010/84676/e9f2c55f/597ece38N0ddcbc77.jpg!q70.jpg.webp', '2024-06-05 00:16:48', '2024-06-05 00:16:48');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (21, 1798046082968907778, 317578, 1, 'RIMOWA 21寸托运箱拉杆箱 SALSA AIR系列果绿色 820.70.36.4', '{\"颜色\": \"红色\", \"尺码\": \"21寸\"}', 28900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t6934/364/1195375010/84676/e9f2c55f/597ece38N0ddcbc77.jpg!q70.jpg.webp', '2024-06-05 01:36:06', '2024-06-05 01:36:06');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (22, 1798372979783249922, 2120808, 1, '姬龙雪 guy laroche女包 GL经典手提包女牛皮大容量单肩包女欧美时尚包包女包GS1210001-06杏色', '{}', 71800, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t30694/267/398774087/90954/6fc143cf/5bf25358N14dadbf7.jpg!q70.jpg.webp', '2024-06-05 23:15:05', '2024-06-05 23:15:05');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (23, 1798372979783249922, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-06-05 23:15:05', '2024-06-05 23:15:05');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (24, 1798372979783249922, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-06-05 23:15:05', '2024-06-05 23:15:05');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (25, 1798372979783249922, 100001905417, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-05 23:15:05', '2024-06-05 23:15:05');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (26, 1798731754981609473, 14741770661, 1, '康佳（KONKA） LED49UC3 49英寸超薄曲面36核4K HDR人工智能电视', '{}', 144600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t16477/84/2032772431/400946/2887be91/5a912776N7e343ec3.jpg!q70.jpg.webp', '2024-06-06 23:00:43', '2024-06-06 23:00:43');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (27, 1799455607429066754, 100001905417, 4, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-08 22:57:03', '2024-06-08 22:57:03');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (28, 1799455686592360450, 100001905417, 4, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-08 22:57:22', '2024-06-08 22:57:22');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (33, 1799479449627176961, 100001905417, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-09 00:31:48', '2024-06-09 00:31:48');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (34, 1799479701314777090, 100001905417, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-09 00:32:48', '2024-06-09 00:32:48');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (35, 1799479914590941185, 100001905417, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-09 00:33:39', '2024-06-09 00:33:39');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (36, 1799481611035914241, 100001905417, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-09 00:40:23', '2024-06-09 00:40:23');
INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `num`, `name`, `spec`, `price`, `image`, `create_time`, `update_time`) VALUES (38, 1799483613014962178, 100001905417, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 224900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2024-06-09 00:48:20', '2024-06-09 00:48:20');
COMMIT;

-- ----------------------------
-- Table structure for order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `order_logistics`;
CREATE TABLE `order_logistics` (
  `order_id` bigint NOT NULL COMMENT '订单id，与订单表一对一',
  `logistics_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '物流单号',
  `logistics_company` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '物流公司名称',
  `contact` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人',
  `mobile` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人手机号码',
  `province` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '省',
  `city` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '市',
  `town` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '区',
  `street` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '街道',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of order_logistics
-- ----------------------------
BEGIN;
INSERT INTO `order_logistics` (`order_id`, `logistics_number`, `logistics_company`, `contact`, `mobile`, `province`, `city`, `town`, `street`, `create_time`, `update_time`) VALUES (123865420, '', '', '李四', '13838411438', '上海', '上海', '浦东新区', '航头镇', '2021-07-28 19:07:01', '2021-07-28 19:07:01');
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
INSERT INTO `undo_log` (`branch_id`, `xid`, `context`, `rollback_info`, `log_status`, `log_created`, `log_modified`) VALUES (27551996752454019, '192.168.124.10:8099:27551996752454016', 'serializer=jackson&compressorType=NONE', 0x7B7D, 1, '2024-06-09 19:01:17.906884', '2024-06-09 19:01:17.906884');
INSERT INTO `undo_log` (`branch_id`, `xid`, `context`, `rollback_info`, `log_status`, `log_created`, `log_modified`) VALUES (27551996752454021, '192.168.124.10:8099:27551996752454016', 'serializer=jackson&compressorType=NONE', 0x7B7D, 1, '2024-06-09 19:00:47.789322', '2024-06-09 19:00:47.789322');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
