/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50704
Source Host           : localhost:3306
Source Database       : bluefire

Target Server Type    : MYSQL
Target Server Version : 50704
File Encoding         : 65001

Date: 2016-10-12 23:41:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `tb_password_resets`;
CREATE TABLE `tb_password_resets` (
  `email` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `token` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT 'token',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `deleted_at` timestamp NULL COMMENT '删除时间',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='密码重置存储表';

-- ----------------------------
-- Records of tb_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for tb_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tb_permissions`;
CREATE TABLE `tb_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `display_name` varchar(100) COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `description` varchar(255) COLLATE utf8_general_ci NOT NULL COMMENT '说明',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='系统权限表';

-- ----------------------------
-- Records of tb_permissions
-- ----------------------------
INSERT INTO `tb_permissions` VALUES ('1', '@member', '会员', '', '2016-04-08 12:28:17', '2016-04-08 12:28:17', NULL);
INSERT INTO `tb_permissions` VALUES ('2', 'member-show', '会员查看', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('3', 'member-block', '会员冻结', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('4', 'member-search', '会员搜索', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('5', '@article', '文章', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('6', 'article-show', '文章查看', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('7', 'article-write', '文章写入', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('8', 'article-search', '文章搜索', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('9', '@category', '分类', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('10', 'category-show', '分类查看', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('11', 'category-write', '分类写入', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('12', '@me', '个人资料', '', '2016-04-08 12:28:18', '2016-04-08 12:28:18', NULL);
INSERT INTO `tb_permissions` VALUES ('13', 'me-write', '个人资料写入', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('14', '@user', '用户', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('15', 'user-write', '用户写入', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('16', 'user-search', '用户搜索', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('17', '@role', '角色', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('18', 'role-write', '角色写入', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('19', '@permission', '权限', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('20', '@option', '系统配置', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('21', 'option-write', '系统配置写入', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('22', '@log', '系统日志', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('23', 'log-show', '系统日志查看', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);
INSERT INTO `tb_permissions` VALUES ('24', 'log-search', '系统日志搜索', '', '2016-04-08 12:28:19', '2016-04-08 12:28:19', NULL);

-- ----------------------------
-- Table structure for tb_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_permission_role`;
CREATE TABLE `tb_permission_role` (
  `permission_id` int(10) unsigned NOT NULL COMMENT '主键ID',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  `deleted_at` timestamp NULL COMMENT '删除时间',
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='系统角色权限关系表';

-- ----------------------------
-- Records of tb_permission_role
-- ----------------------------
INSERT INTO `tb_permission_role` VALUES ('1', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('2', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('3', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('4', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('5', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('6', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('9', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('10', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('12', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('13', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('14', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('17', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('19', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('20', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('22', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('23', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('24', '1', NULL);
INSERT INTO `tb_permission_role` VALUES ('12', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('13', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('14', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('15', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('16', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('17', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('18', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('19', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('20', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('21', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('22', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('23', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('24', '2', NULL);
INSERT INTO `tb_permission_role` VALUES ('1', '3', NULL);
INSERT INTO `tb_permission_role` VALUES ('2', '3', NULL);
INSERT INTO `tb_permission_role` VALUES ('3', '3', NULL);
INSERT INTO `tb_permission_role` VALUES ('5', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('6', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('7', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('8', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('9', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('10', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('11', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('12', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('13', '4', NULL);
INSERT INTO `tb_permission_role` VALUES ('1', '5', NULL);
INSERT INTO `tb_permission_role` VALUES ('5', '5', NULL);
INSERT INTO `tb_permission_role` VALUES ('9', '5', NULL);
INSERT INTO `tb_permission_role` VALUES ('12', '5', NULL);
INSERT INTO `tb_permission_role` VALUES ('14', '5', NULL);
INSERT INTO `tb_permission_role` VALUES ('17', '5', NULL);
INSERT INTO `tb_permission_role` VALUES ('19', '5', NULL);
INSERT INTO `tb_permission_role` VALUES ('20', '5', NULL);
INSERT INTO `tb_permission_role` VALUES ('22', '5', NULL);

-- ----------------------------
-- Table structure for tb_roles
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE `tb_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(40) COLLATE utf8_general_ci NOT NULL COMMENT '角色',
  `display_name` varchar(80) COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `description` varchar(160) COLLATE utf8_general_ci NOT NULL COMMENT '说明',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='系统角色表';

-- ----------------------------
-- Records of tb_roles
-- ----------------------------
INSERT INTO `tb_roles` VALUES ('1', 'Admin', '管理员', '', '2016-03-03 17:05:04', '2016-03-11 11:51:31', NULL);
INSERT INTO `tb_roles` VALUES ('2', 'Founder', '创始人', '', '2016-03-08 17:05:52', '2016-03-10 11:26:44', NULL);
INSERT INTO `tb_roles` VALUES ('3', 'Tester', '测试员', '', '2016-03-08 17:05:52', '2016-03-10 11:26:44', NULL);
INSERT INTO `tb_roles` VALUES ('4', 'Editor', '编辑员', '', '2016-03-08 17:14:33', '2016-03-11 11:49:02', NULL);
INSERT INTO `tb_roles` VALUES ('5', 'Demo', '只读演示', '', '2016-03-08 17:38:11', '2016-03-11 11:54:23', NULL);

-- ----------------------------
-- Table structure for tb_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_user`;
CREATE TABLE `tb_role_user` (
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色ID',
  `deleted_at` timestamp NULL COMMENT '删除时间',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='用户系统角色关系表';

-- ----------------------------
-- Records of tb_role_user
-- ----------------------------
INSERT INTO `tb_role_user` VALUES ('1', '2', NULL);
INSERT INTO `tb_role_user` VALUES ('2', '5', NULL);

-- ----------------------------
-- Table structure for tb_system_logs
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_logs`;
CREATE TABLE `tb_system_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(12) NOT NULL DEFAULT '0' COMMENT '用户id（为0表示系统级操作，其它一般为管理型用户操作）',
  `type` varchar(255) COLLATE utf8_general_ci NOT NULL DEFAULT 'system' COMMENT '操作类型',
  `url` varchar(200) COLLATE utf8_general_ci NOT NULL DEFAULT '-' COMMENT '操作发起的url',
  `content` varchar(255) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作内容',
  `operator_ip` varchar(50) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作者ip',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL COMMENT '修改时间',
  `deleted_at` timestamp NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='系统日志表';

-- ----------------------------
-- Records of tb_system_logs
-- ----------------------------
INSERT INTO `tb_system_logs` VALUES ('1', '1', 'session', '/localhost/admin/auth/login', '管理员：bruce[admin@example.com] 登录系统。', '127.0.0.1', '2016-06-08 10:56:13', '2016-06-08 10:56:13', NULL);

-- ----------------------------
-- Table structure for tb_system_options
-- ----------------------------
DROP TABLE IF EXISTS `tb_system_options`;
CREATE TABLE `tb_system_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) COLLATE utf8_general_ci NOT NULL COMMENT '配置选项名',
  `value` text COLLATE utf8_general_ci NOT NULL COMMENT '配置选项值',
  `deleted_at` timestamp NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_option_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='系统配置选项表';

-- ----------------------------
-- Records of tb_system_options
-- ----------------------------
INSERT INTO `tb_system_options` VALUES ('1', 'website_keywords', '蓝焰内容管理系统', NULL);
INSERT INTO `tb_system_options` VALUES ('2', 'company_address', '', NULL);
INSERT INTO `tb_system_options` VALUES ('3', 'website_title', '蓝焰内容管理系统 (BlueFireCMS)', NULL);
INSERT INTO `tb_system_options` VALUES ('4', 'company_telephone', '010-88888888', NULL);
INSERT INTO `tb_system_options` VALUES ('5', 'company_full_name', '', NULL);
INSERT INTO `tb_system_options` VALUES ('6', 'website_icp', '京ICP备00000000号', NULL);
INSERT INTO `tb_system_options` VALUES ('7', 'system_version', '5.2', NULL);
INSERT INTO `tb_system_options` VALUES ('8', 'page_size', '15', NULL);
INSERT INTO `tb_system_options` VALUES ('9', 'system_logo', '/assets/img/yas_logo.png', NULL);
INSERT INTO `tb_system_options` VALUES ('10', 'picture_watermark', '/assets/img/yas_logo.png', NULL);
INSERT INTO `tb_system_options` VALUES ('11', 'company_short_name', '蓝焰', NULL);
INSERT INTO `tb_system_options` VALUES ('12', 'system_author', 'BruceSong', NULL);
INSERT INTO `tb_system_options` VALUES ('13', 'system_author_website', 'http://www.songk.cn', NULL);
INSERT INTO `tb_system_options` VALUES ('14', 'is_watermark', '0', NULL);

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(20) COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(120) COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `password` varchar(60) COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `remember_token` varchar(60) COLLATE utf8_general_ci NULL COMMENT '记住密码Session令牌',
  `nickname` varchar(20) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `phone` varchar(20) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `realname` varchar(20) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1锁定,0正常' COMMENT '是否锁定',
  `created_at` timestamp NOT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('1', 'admin', 'admin@example.com', '$2y$10$J7LHukU1OvdKS0HjHyP67OckaKXwci9vV6iqOCpN65x8X7MDgMNlu', 'cxqI09Ez58Y9iV4Ovo5ZcnxnUMMBN1Cn3potR23dEy0ibZDPsf48HSjDgWA4', 'bruce', '18612208888', '布鲁斯', '0', '2016-03-03 17:05:45', '2016-04-08 12:29:02', NULL);
INSERT INTO `tb_users` VALUES ('2', 'demo', 'demo@example.com', '$2y$10$lZLHABzllmB8.X8bflFHl./amaH1n2nqaYDlC52BIQCuTMLXowdyC', 'pOSVzUBYf4KDB0YtXPBKimEHUe8JcPnv2C55xnCtbJKh9L6bkcR2MbSnhW7T', 'demo', '18612206666', '演示', '0', '2016-03-10 16:37:01', '2016-04-08 12:33:21', NULL);
