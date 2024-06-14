/*
 Navicat Premium Data Transfer

 Source Server         : docker_hmall
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : localhost:3307
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 11/06/2024 14:02:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (1, 'shared-jdbc.yaml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    url: jdbc:mysql://${hm.db.host:192.168.124.5}:${hm.db.port:3306}/${hm.db.database}?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: ${hm.db.pw}\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto', '5fc3ac7f10ef8408f9c5e092b2cecec2', '2024-06-05 21:11:20', '2024-06-05 21:11:20', NULL, '192.168.65.1', '', '', '共享的jdbc、mybatis配置', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (2, 'shared-log.yaml', 'DEFAULT_GROUP', 'logging:\n  level:\n    com.heima: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: logs/${spring.application.name}', '474b5e7a1af5477c917ad5a842ca2d45', '2024-06-05 21:13:11', '2024-06-05 22:50:56', 'nacos', '192.168.65.1', '', '', '日志统一配置', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (3, 'shared-swagger.yaml', 'DEFAULT_GROUP', 'knife4j:\n  enable: true\n  openapi:\n    title: 黑马商城${spring.application.name}接口文档\n    description: \"黑马商城${spring.application.name}接口文档\"\n    concat: yyz\n    version: v1.0.0\n    group:\n      default:\n        group-name: default\n        api-rule: package\n        api-rule-resources:\n          - ${hm.swagger.package}', '788de9f6de74e317eefe5e98b7ff2081', '2024-06-05 21:32:28', '2024-06-05 21:32:28', NULL, '192.168.65.1', '', '', 'swagger统一配置', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (4, 'shared-feign.yaml', 'DEFAULT_GROUP', 'feign:\n  # 开启feign对okhttp的支持\n  okhttp:\n    enabled: true\n  # 开启feign对sentinel的支持\n  sentinel:\n    enabled: true', '7be85a5c76610a8ab9b91dad9e09a797', '2024-06-05 21:33:22', '2024-06-06 21:37:12', 'nacos', '192.168.65.1', '', '', 'feign统一配置', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (6, 'cart-service.yaml', 'DEFAULT_GROUP', 'hm:\n  cart:\n    maxAmount: 10 # 购物车商品数量上限', 'dce414e6fa79c485ec828c2efe92f96f', '2024-06-05 22:35:04', '2024-06-05 23:02:48', 'nacos', '192.168.65.1', '', '', '购物车服务的热更新配置', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (12, 'gateway-routes.json', 'DEFAULT_GROUP', '[\n    {\n        \"id\": \"item\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/items/**\", \"_genkey_1\":\"/search/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://item-service\"\n    },\n    {\n        \"id\": \"cart\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://cart-service\"\n    },\n    {\n        \"id\": \"user\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://user-service\"\n    },\n    {\n        \"id\": \"trade\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://trade-service\"\n    },\n    {\n        \"id\": \"pay\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://pay-service\"\n    }\n]', '4c5449fa0da9c9a44048ff89ce8026f4', '2024-06-06 00:03:13', '2024-06-06 01:21:26', 'nacos', '192.168.65.1', '', '', '网关路由动态配置', '', '', 'json', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (20, 'shared-sentinel.yaml', 'DEFAULT_GROUP', 'spring:\n  cloud: \n    sentinel:\n      transport:\n        dashboard: 172.20.10.8:8089\n      # 开启请求方式前缀\n      http-method-specify: true', '51bffc813267e0a325bcfc9284348fa9', '2024-06-06 20:27:50', '2024-06-11 10:17:45', 'nacos', '192.168.65.1', '', '', 'sentinel共享配置', '', '', 'yaml', '', '');
INSERT INTO `config_info` (`id`, `data_id`, `group_id`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `app_name`, `tenant_id`, `c_desc`, `c_use`, `effect`, `type`, `c_schema`, `encrypted_data_key`) VALUES (26, 'shared-seata.yaml', 'DEFAULT_GROUP', 'seata:\n  registry:\n    type: nacos\n    nacos:\n      server-addr: nacos:8848\n      group: DEFAULT_GROUP\n      application: seata-server\n      username: nacos\n      password: nacos\n      namespace: \"\"\n  tx-service-group: hmall\n  service:\n    vgroup-mapping:\n      hmall: default', '9c8dd084117970644c50994c5ff9c9eb', '2024-06-09 18:07:03', '2024-06-11 10:17:07', 'nacos', '192.168.65.1', '', '', 'seata-client的共享配置', '', '', 'yaml', '', '');
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='增加租户字段';

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_beta';

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_tag';

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Records of group_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin,
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 1, 'shared-jdbc.yaml', 'DEFAULT_GROUP', '', 'spring:\n  datasource:\n    url: jdbc:mysql://${hm.db.host:192.168.124.5}:${hm.db.port:3306}/${hm.db.database}?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n    username: root\n    password: ${hm.db.pw}\nmybatis-plus:\n  configuration:\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\n  global-config:\n    db-config:\n      update-strategy: not_null\n      id-type: auto', '5fc3ac7f10ef8408f9c5e092b2cecec2', '2024-06-05 21:11:19', '2024-06-05 21:11:20', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 2, 'shared-log.yaml', 'DEFAULT_GROUP', '', 'logging:\n  level:\n    com.heima: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"', 'ee375f4be0b7600c2e617c18a7d51152', '2024-06-05 21:13:11', '2024-06-05 21:13:11', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 3, 'shared-swagger.yaml', 'DEFAULT_GROUP', '', 'knife4j:\n  enable: true\n  openapi:\n    title: 黑马商城${spring.application.name}接口文档\n    description: \"黑马商城${spring.application.name}接口文档\"\n    concat: yyz\n    version: v1.0.0\n    group:\n      default:\n        group-name: default\n        api-rule: package\n        api-rule-resources:\n          - ${hm.swagger.package}', '788de9f6de74e317eefe5e98b7ff2081', '2024-06-05 21:32:27', '2024-06-05 21:32:28', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 4, 'shared-feign.yaml', 'DEFAULT_GROUP', '', 'feign:\n  okhttp:\n    enabled: true', 'ccff2b7d02720b3e716288df3770fdce', '2024-06-05 21:33:21', '2024-06-05 21:33:22', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (2, 5, 'shared-log.yaml', 'DEFAULT_GROUP', '', 'logging:\n  level:\n    com.heima: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"', 'ee375f4be0b7600c2e617c18a7d51152', '2024-06-05 22:15:38', '2024-06-05 22:15:38', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 6, 'cart-service.yaml', 'DEFAULT_GROUP', '', 'hm:\n  cart:\n    maxAmount: 1 # 购物车商品数量上限', 'd7eea2d8ec292371cb1a388e13ce6f17', '2024-06-05 22:35:03', '2024-06-05 22:35:04', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (6, 7, 'cart-service.yaml', 'DEFAULT_GROUP', '', 'hm:\n  cart:\n    maxAmount: 1 # 购物车商品数量上限', 'd7eea2d8ec292371cb1a388e13ce6f17', '2024-06-05 22:45:03', '2024-06-05 22:45:04', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (2, 8, 'shared-log.yaml', 'DEFAULT_GROUP', '', 'logging:\n  level:\n    com.heima: debug\n  pattern:\n    dateformat: HH:mm:ss:SSS\n  file:\n    path: \"logs/${spring.application.name}\"', 'ee375f4be0b7600c2e617c18a7d51152', '2024-06-05 22:50:56', '2024-06-05 22:50:56', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (6, 9, 'cart-service.yaml', 'DEFAULT_GROUP', '', 'hm:\n  cart:\n    maxAmount: 3 # 购物车商品数量上限', '2d634db6869b308858924a0516d3808e', '2024-06-05 22:52:12', '2024-06-05 22:52:12', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (6, 10, 'cart-service.yaml', 'DEFAULT_GROUP', '', 'hm:\n  cart:\n    maxAmount: 5 # 购物车商品数量上限', '6c8753fd4a4bcb2c7fa4daf247b13a41', '2024-06-05 23:01:37', '2024-06-05 23:01:37', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (6, 11, 'cart-service.yaml', 'DEFAULT_GROUP', '', 'hm:\n  cart:\n    maxAmount: 4 # 购物车商品数量上限', '6bbbda1c4479d40b019a69c5f23f29d2', '2024-06-05 23:02:48', '2024-06-05 23:02:48', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 12, 'gateway-routes.json', 'DEFAULT_GROUP', '', '[\n    {\n        \"id\": \"item\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/items/**\", \"_genkey_1\":\"/search/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://item-service\"\n    },\n    {\n        \"id\": \"cart\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://cart-service\"\n    },\n    {\n        \"id\": \"user\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://user-service\"\n    },\n    {\n        \"id\": \"trade\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://trade-service\"\n    },\n    {\n        \"id\": \"pay\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://pay-service\"\n    }\n]', '4c5449fa0da9c9a44048ff89ce8026f4', '2024-06-06 00:03:12', '2024-06-06 00:03:13', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 13, 'gateway-routes.json', 'DEFAULT_GROUP', '', '[\n    {\n        \"id\": \"item\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/items/**\", \"_genkey_1\":\"/search/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://item-service\"\n    },\n    {\n        \"id\": \"cart\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://cart-service\"\n    },\n    {\n        \"id\": \"user\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://user-service\"\n    },\n    {\n        \"id\": \"trade\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://trade-service\"\n    },\n    {\n        \"id\": \"pay\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://pay-service\"\n    }\n]', '4c5449fa0da9c9a44048ff89ce8026f4', '2024-06-06 00:05:30', '2024-06-06 00:05:30', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 14, 'gateway-routes.json', 'DEFAULT_GROUP', '', '[\n    // {\n    //     \"id\": \"item\",\n    //     \"predicates\": [{\n    //         \"name\": \"Path\",\n    //         \"args\": {\"_genkey_0\":\"/items/**\", \"_genkey_1\":\"/search/**\"}\n    //     }],\n    //     \"filters\": [],\n    //     \"uri\": \"lb://item-service\"\n    // },\n    {\n        \"id\": \"cart\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://cart-service\"\n    },\n    {\n        \"id\": \"user\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://user-service\"\n    },\n    {\n        \"id\": \"trade\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://trade-service\"\n    },\n    {\n        \"id\": \"pay\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://pay-service\"\n    }\n]', '9c551c09bb253b69063baaeff21d5985', '2024-06-06 00:10:26', '2024-06-06 00:10:27', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 15, 'gateway-routes.json', 'DEFAULT_GROUP', '', '[\n    // {\n    //     \"id\": \"item\",\n    //     \"predicates\": [{\n    //         \"name\": \"Path\",\n    //         \"args\": {\"_genkey_0\":\"/items/**\", \"_genkey_1\":\"/search/**\"}\n    //     }],\n    //     \"filters\": [],\n    //     \"uri\": \"lb://item-service\"\n    // },\n    {\n        \"id\": \"cart\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://cart-service\"\n    },\n    {\n        \"id\": \"user\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://user-service\"\n    },\n    {\n        \"id\": \"trade\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://trade-service\"\n    },\n    {\n        \"id\": \"pay\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://pay-service\"\n    }\n]', '9c551c09bb253b69063baaeff21d5985', '2024-06-06 00:11:05', '2024-06-06 00:11:06', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 16, 'gateway-routes.json', 'DEFAULT_GROUP', '', '[\n    {\n        \"id\": \"cart\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://cart-service\"\n    },\n    {\n        \"id\": \"user\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://user-service\"\n    },\n    {\n        \"id\": \"trade\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://trade-service\"\n    },\n    {\n        \"id\": \"pay\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://pay-service\"\n    }\n]', '1de10c6378fb562be42aee3f21461c9c', '2024-06-06 00:12:12', '2024-06-06 00:12:12', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 17, 'gateway-routes.json', 'DEFAULT_GROUP', '', '[\n    {\n        \"id\": \"item\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/items/**\", \"_genkey_1\":\"/search/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://item-service\"\n    },\n    {\n        \"id\": \"cart\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://cart-service\"\n    },\n    {\n        \"id\": \"user\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://user-service\"\n    },\n    {\n        \"id\": \"trade\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://trade-service\"\n    },\n    {\n        \"id\": \"pay\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://pay-service\"\n    }\n]', '4c5449fa0da9c9a44048ff89ce8026f4', '2024-06-06 01:21:08', '2024-06-06 01:21:08', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (12, 18, 'gateway-routes.json', 'DEFAULT_GROUP', '', '[\n    \n    {\n        \"id\": \"user\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://user-service\"\n    },\n    {\n        \"id\": \"trade\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://trade-service\"\n    },\n    {\n        \"id\": \"pay\",\n        \"predicates\": [{\n            \"name\": \"Path\",\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\n        }],\n        \"filters\": [],\n        \"uri\": \"lb://pay-service\"\n    }\n]', 'cfa6f38c7bff93cf5cec582d523ee91d', '2024-06-06 01:21:26', '2024-06-06 01:21:26', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 19, 'shared-sentinel', 'DEFAULT_GROUP', '', 'spring:\n  cloud: \n    sentinel:\n      transport:\n        dashboard: 127.0.0.1：8089', '41177812c763f14964cc51f78e252bba', '2024-06-06 20:25:19', '2024-06-06 20:25:20', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (19, 20, 'shared-sentinel', 'DEFAULT_GROUP', '', 'spring:\n  cloud: \n    sentinel:\n      transport:\n        dashboard: 127.0.0.1：8089', '41177812c763f14964cc51f78e252bba', '2024-06-06 20:27:15', '2024-06-06 20:27:16', NULL, '192.168.65.1', 'D', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 21, 'shared-sentinel.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud: \n    sentinel:\n      transport:\n        dashboard: 127.0.0.1：8089', '41177812c763f14964cc51f78e252bba', '2024-06-06 20:27:49', '2024-06-06 20:27:50', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (4, 22, 'shared-feign.yaml', 'DEFAULT_GROUP', '', 'feign:\n  okhttp:\n    enabled: true', 'ccff2b7d02720b3e716288df3770fdce', '2024-06-06 21:29:41', '2024-06-06 21:29:41', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (4, 23, 'shared-feign.yaml', 'DEFAULT_GROUP', '', 'feign:\n  # 开启feign对okhttp的支持\n  okhttp:\n    enabled: true\n  # 开启feign对sentinel的支持\n  sentinel:\n    enabled: true', '7be85a5c76610a8ab9b91dad9e09a797', '2024-06-06 21:37:12', '2024-06-06 21:37:12', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (20, 24, 'shared-sentinel.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud: \n    sentinel:\n      transport:\n        dashboard: 127.0.0.1：8089', '41177812c763f14964cc51f78e252bba', '2024-06-06 21:40:31', '2024-06-06 21:40:31', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (20, 25, 'shared-sentinel.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud: \n    sentinel:\n      transport:\n        dashboard: 127.0.0.1:8089', '15f4f05b68d90158429ba05bb43b030b', '2024-06-06 22:48:50', '2024-06-06 22:48:51', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (20, 26, 'shared-sentinel.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud: \n    sentinel:\n      transport:\n        dashboard: 127.0.0.1:\n      # 开启请求方式前缀\n      http-method-specify: true', '08c1cef0f38237347ab5f3a0aa245797', '2024-06-06 22:51:21', '2024-06-06 22:51:21', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (0, 27, 'shared-seata.yaml', 'DEFAULT_GROUP', '', 'seata:\n  registry:\n    type: nacos\n    nacos:\n      server-addr: localhost:8848\n      group: DEFAULT_GROUP\n      application: seata-server\n      username: nacos\n      password: nacos\n      namespace: \"\"\n  tx-service-group: hmall\n  service:\n    vgroup-mapping:\n      hmall: default', '8d8d1a89c03b169cb1785c044340909c', '2024-06-09 18:07:03', '2024-06-09 18:07:03', NULL, '192.168.65.1', 'I', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (26, 28, 'shared-seata.yaml', 'DEFAULT_GROUP', '', 'seata:\n  registry:\n    type: nacos\n    nacos:\n      server-addr: localhost:8848\n      group: DEFAULT_GROUP\n      application: seata-server\n      username: nacos\n      password: nacos\n      namespace: \"\"\n  tx-service-group: hmall\n  service:\n    vgroup-mapping:\n      hmall: default', '8d8d1a89c03b169cb1785c044340909c', '2024-06-11 10:17:06', '2024-06-11 10:17:07', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `his_config_info` (`id`, `nid`, `data_id`, `group_id`, `app_name`, `content`, `md5`, `gmt_create`, `gmt_modified`, `src_user`, `src_ip`, `op_type`, `tenant_id`, `encrypted_data_key`) VALUES (20, 29, 'shared-sentinel.yaml', 'DEFAULT_GROUP', '', 'spring:\n  cloud: \n    sentinel:\n      transport:\n        dashboard: 127.0.0.1:8089\n      # 开启请求方式前缀\n      http-method-specify: true', 'cb90de356daa78a2a5d1838600ba1975', '2024-06-11 10:17:44', '2024-06-11 10:17:45', 'nacos', '192.168.65.1', 'U', '', '');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`username`, `role`) VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
