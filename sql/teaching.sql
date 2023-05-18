/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : 127.0.0.1:3306
 Source Schema         : teaching

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 25/04/2023 13:14:02
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_article
-- ----------------------------
DROP TABLE IF EXISTS `sys_article`;
CREATE TABLE `sys_article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户主键',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `audit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核 00 审核中 01通过 02驳回',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教研论文' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_article
-- ----------------------------
INSERT INTO `sys_article` VALUES (1, '测试数据', '测试数据', '2023-04-23 00:00:00', '/profile/upload/2023/04/23/396c5cfe-3ed9-4f3a-8a01-2b2a4d158012.xlsx', 1, '若依', '01');
INSERT INTO `sys_article` VALUES (2, '老师02的关于springboot的论文的设计与实现', '老师02的关于springboot的论文的设计与实现老师02的关于springboot的论文的设计与实现', '2023-04-25 00:00:00', '/profile/upload/2023/04/25/89eed89d-e553-4ecc-bfda-8c6e2d5d6cf3.doc', 103, '老师02', '01');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '立项', '00', 'proStatus', NULL, 'primary', 'N', '0', 'admin', '2023-04-15 16:25:42', 'admin', '2023-04-15 16:26:00', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '结项', '01', 'proStatus', NULL, 'success', 'N', '0', 'admin', '2023-04-15 16:25:54', 'admin', '2023-04-15 16:26:05', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '审核中', '00', 'auditStatus', NULL, 'primary', 'N', '0', 'admin', '2023-04-15 16:26:43', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '通过', '01', 'auditStatus', NULL, 'success', 'N', '0', 'admin', '2023-04-15 16:26:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '驳回', '02', 'auditStatus', NULL, 'danger', 'N', '0', 'admin', '2023-04-15 16:27:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '教研', '00', 'teacherType', NULL, 'primary', 'N', '0', 'admin', '2023-04-15 16:28:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 1, '教材', '01', 'teacherType', NULL, 'success', 'N', '0', 'admin', '2023-04-15 16:28:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '个人', '00', 'rewardType', NULL, 'default', 'N', '0', 'admin', '2023-04-15 16:29:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 1, '教研/教材', '01', 'rewardType', NULL, 'default', 'N', '0', 'admin', '2023-04-15 16:29:45', 'admin', '2023-04-24 10:01:02', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-11-16 17:39:21', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '项目状态', 'proStatus', '0', 'admin', '2023-04-15 16:25:12', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '审核状态', 'auditStatus', '0', 'admin', '2023-04-15 16:26:27', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '教研类型', 'teacherType', '0', 'admin', '2023-04-15 16:27:41', 'admin', '2023-04-15 16:27:53', NULL);
INSERT INTO `sys_dict_type` VALUES (103, '获奖成果类型', 'rewardType', '0', 'admin', '2023-04-15 16:29:19', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_info`;
CREATE TABLE `sys_file_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `traching_id` int(0) NULL DEFAULT NULL COMMENT '项目',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资料' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
INSERT INTO `sys_file_info` VALUES (1, '文档', '/profile/upload/2023/04/23/9e3d094e-31fc-4293-8ec2-0df15c067f38.doc', 1, '文档文档文档');
INSERT INTO `sys_file_info` VALUES (2, 'word', '/profile/upload/2023/04/25/2b026280-c35e-47a2-832b-89036c2cedac.doc', 3, 'word');
INSERT INTO `sys_file_info` VALUES (4, 'doc', '/profile/upload/2023/04/25/63ef7d71-c8bc-45a5-8e28-bdef1dbcffeb.doc', 4, '教研课题资料');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2030 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-11-16 17:39:19', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2022-11-16 17:39:19', 'admin', '2023-04-15 15:48:07', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-11-16 17:39:19', 'admin', '2023-04-24 10:31:10', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-11-16 17:39:19', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-11-16 17:39:19', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-11-16 17:39:19', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-11-16 17:39:19', 'admin', '2023-04-24 17:13:30', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-11-16 17:39:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '项目管理', 0, 2, 'proMan', NULL, NULL, 1, 0, 'M', '0', '0', '', 'table', 'admin', '2023-04-15 16:21:39', 'admin', '2023-04-15 16:23:29', '');
INSERT INTO `sys_menu` VALUES (2002, '教研论文', 2001, 2, 'article', 'system/article/index', NULL, 1, 0, 'C', '0', '0', 'system:article:list', 'excel', 'admin', '2023-04-15 16:38:11', 'admin', '2023-04-24 10:32:23', '教研论文菜单');
INSERT INTO `sys_menu` VALUES (2003, '教研论文查询', 2002, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:article:query', '#', 'admin', '2023-04-15 16:38:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '教研论文新增', 2002, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:article:add', '#', 'admin', '2023-04-15 16:38:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '教研论文修改', 2002, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:article:edit', '#', 'admin', '2023-04-15 16:38:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '教研论文删除', 2002, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:article:remove', '#', 'admin', '2023-04-15 16:38:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '教研论文导出', 2002, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:article:export', '#', 'admin', '2023-04-15 16:38:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '资料', 2001, 4, 'fileInfo', 'system/fileInfo/index', NULL, 1, 0, 'C', '1', '0', 'system:fileInfo:list', '#', 'admin', '2023-04-15 16:38:17', 'admin', '2023-04-24 10:31:34', '资料菜单');
INSERT INTO `sys_menu` VALUES (2009, '资料查询', 2008, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:fileInfo:query', '#', 'admin', '2023-04-15 16:38:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '资料新增', 2008, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:fileInfo:add', '#', 'admin', '2023-04-15 16:38:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '资料修改', 2008, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:fileInfo:edit', '#', 'admin', '2023-04-15 16:38:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '资料删除', 2008, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:fileInfo:remove', '#', 'admin', '2023-04-15 16:38:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '资料导出', 2008, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:fileInfo:export', '#', 'admin', '2023-04-15 16:38:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '获奖成果', 2001, 3, 'reward', 'system/reward/index', NULL, 1, 0, 'C', '0', '0', 'system:reward:list', 'star', 'admin', '2023-04-15 16:38:21', 'admin', '2023-04-24 10:32:15', '获奖成果菜单');
INSERT INTO `sys_menu` VALUES (2015, '获奖成果查询', 2014, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:reward:query', '#', 'admin', '2023-04-15 16:38:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '获奖成果新增', 2014, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:reward:add', '#', 'admin', '2023-04-15 16:38:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '获奖成果修改', 2014, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:reward:edit', '#', 'admin', '2023-04-15 16:38:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '获奖成果删除', 2014, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:reward:remove', '#', 'admin', '2023-04-15 16:38:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '获奖成果导出', 2014, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:reward:export', '#', 'admin', '2023-04-15 16:38:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '教研教材', 2001, 1, 'teaching', 'system/teaching/index', NULL, 1, 0, 'C', '0', '0', 'system:teaching:list', 'clipboard', 'admin', '2023-04-15 16:38:26', 'admin', '2023-04-24 10:31:46', '教研科目菜单');
INSERT INTO `sys_menu` VALUES (2021, '教研科目查询', 2020, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:teaching:query', '#', 'admin', '2023-04-15 16:38:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '教研科目新增', 2020, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:teaching:add', '#', 'admin', '2023-04-15 16:38:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '教研科目修改', 2020, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:teaching:edit', '#', 'admin', '2023-04-15 16:38:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '教研科目删除', 2020, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:teaching:remove', '#', 'admin', '2023-04-15 16:38:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '教研科目导出', 2020, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:teaching:export', '#', 'admin', '2023-04-15 16:38:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '审核', 2020, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:teaching:audit', '#', 'admin', '2023-04-24 10:33:34', 'admin', '2023-04-24 14:02:41', '');
INSERT INTO `sys_menu` VALUES (2027, '审核', 2002, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:article:audit', '#', 'admin', '2023-04-24 10:33:34', 'admin', '2023-04-25 13:07:09', '');
INSERT INTO `sys_menu` VALUES (2029, '审核', 2014, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:reward:audit', '#', 'admin', '2023-04-24 10:33:34', '', NULL, '');

-- ----------------------------
-- Table structure for sys_reward
-- ----------------------------
DROP TABLE IF EXISTS `sys_reward`;
CREATE TABLE `sys_reward`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型：00个人  01教研项目  02教材项目',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核  00审核中 01通过 02驳回',
  `file_id` int(0) NULL DEFAULT NULL COMMENT '项目',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '创建人Id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '获奖成果' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_reward
-- ----------------------------
INSERT INTO `sys_reward` VALUES (1, '系统教研成果', '01', '2023-04-24 00:00:00', '/profile/upload/2023/04/24/b9152424-65df-43b8-996c-aa1ed0f720ad.jpg', '01', 1, '教研测试数据', NULL, NULL);
INSERT INTO `sys_reward` VALUES (2, '教材获奖省级优秀奖', '01', '2023-04-25 00:00:00', '/profile/upload/2023/04/25/e50e1078-88bc-4cb2-8476-23e2be95c741.jpg', '01', 5, '老师02的教材课题', 103, '老师02');
INSERT INTO `sys_reward` VALUES (3, '个人项目获奖', '00', '2023-04-25 00:00:00', '/profile/upload/2023/04/25/60cc8ae1-7429-4056-96f7-2f86bbe1b3ae.jpg', '02', NULL, '个人项目获奖', 103, '老师02');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-11-16 17:39:18', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '教师', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-11-16 17:39:18', 'admin', '2023-04-24 17:04:34', '普通角色');
INSERT INTO `sys_role` VALUES (100, '科员', 'member', 0, '1', 1, 1, '0', '0', 'admin', '2023-04-24 13:59:29', 'admin', '2023-04-25 13:09:29', NULL);
INSERT INTO `sys_role` VALUES (101, '审核员', 'auditor', 3, '1', 1, 1, '0', '0', 'admin', '2023-05-16 13:59:29', 'admin', '2023-05-17 13:09:29', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2029);

-- ----------------------------
-- Table structure for sys_taeching_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_taeching_info`;
CREATE TABLE `sys_taeching_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `add_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '工号',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态：00立项  01结项',
  `audit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核：00 审核中  01通过  02驳回',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教研类型 00教研 01教材',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教研科目' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_taeching_info
-- ----------------------------
INSERT INTO `sys_taeching_info` VALUES (1, '教研测试数据', '教研测试数据', '<p>教研测试数据</p>', '2023-04-23 00:00:00', 1, '若依', '00', '01', '00', NULL);
INSERT INTO `sys_taeching_info` VALUES (2, '教材测试数据', '教材测试数据教材测试数据教材测试数据', '<p>教材测试数据教材测试数据</p><p>教材测试数据</p><p>教材测试数据</p><p>教材测试数据</p><p><br></p><p>教材测试数据</p><p>教材测试数据教材测试数据</p><p><br></p><p>教材测试数据教材测试数据</p><p><br></p><p><br></p><p>教材测试数据</p><p><br></p><p>教材测试数据</p><p><br></p><p><img src=\"/dev-api/profile/upload/2023/04/23/9179e6e0-4576-4ab9-a379-4ed55ee72ff2.jpg\"></p>', '2023-04-23 00:00:00', 1, '若依', '00', '01', '01', NULL);
INSERT INTO `sys_taeching_info` VALUES (3, '老师01的教研项目测试数据', '老师01的教研项目测试数据', '<p>老师01的教研项目测试数据老师01的教研项目测试数据</p><p>老师01的教研项目测试数据老师01的教研项目测试数据</p><p>老师01的教研项目测试数据</p><p>老师01的教研项目测试数据<img src=\"/dev-api/profile/upload/2023/04/25/b5040aaa-b459-4cfe-9e60-11d93cf8beb8.jpg\"></p>', '2023-04-25 00:00:00', 102, '老师01', '00', '02', '00', NULL);
INSERT INTO `sys_taeching_info` VALUES (4, '老师02的教研课题', '老师02的教研课题', '<p>老师02的教研课题老师02的教研课题</p><p>老师02的教研课题</p><p>老师02的教研课题</p><p><img src=\"/dev-api/profile/upload/2023/04/25/5ef8942a-9a84-489d-bd64-08659d279149.jpg\"></p>', '2023-04-25 00:00:00', 103, '老师02', '00', '01', '00', NULL);
INSERT INTO `sys_taeching_info` VALUES (5, '老师02的教材课题', '老师02的教材课题', '<p>老师02的教材课题</p><p><img src=\"/dev-api/profile/upload/2023/04/25/e9444a87-153c-4199-b8a2-7db40eaa3615.jpg\"></p>', '2023-04-25 00:00:00', 103, '老师02', '01', '01', '01', '2023-04-25 00:00:00');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-04-25 13:09:21', 'admin', '2022-11-16 17:39:18', '', '2023-04-25 13:09:20', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '老师01', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-11-16 17:39:18', 'admin', '2022-11-16 17:39:18', 'admin', '2023-04-24 17:02:09', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, '2022', '2022', '00', '', '', '0', '', '$2a$10$TwIWdDeDSEcu5j1NJOZE3.cNBcrWwfxlu7QM0/n.sswQLgYzcpIRW', '0', '2', '', NULL, 'admin', '2022-11-17 08:59:00', 'admin', '2022-11-17 09:11:26', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, '科员01', '科员01', '00', '162@qq.com', '15036144556', '0', '', '$2a$10$eMNyMyS1sXqbOG15NFqYmupo8E4LZvp2HAr1Fpas6G.oeEgSXZSHm', '0', '0', '127.0.0.1', '2023-04-25 13:09:37', 'admin', '2023-04-24 17:03:17', '', '2023-04-25 13:09:37', '科员01');
INSERT INTO `sys_user` VALUES (102, NULL, '老师01', '老师01', '00', '', '', '0', '', '$2a$10$DZovRqILBxHJwlTNJlm8JOBB1PDAJFc/TicuTA5lQkR1l0veOyhJK', '0', '0', '127.0.0.1', '2023-04-25 12:41:20', 'admin', '2023-04-25 12:09:44', '', '2023-04-25 12:41:19', NULL);
INSERT INTO `sys_user` VALUES (103, NULL, '老师02', '老师02', '00', '2@qq.com', '15039177662', '0', '', '$2a$10$MR.eLBr0L8rRtpixLTDwOOTz4LBCmlQZEzK3q9GqraNZeDX8w4Wa6', '0', '0', '127.0.0.1', '2023-04-25 13:04:33', 'admin', '2023-04-25 12:56:24', '', '2023-04-25 13:04:33', NULL);
INSERT INTO `sys_user` VALUES (104, NULL, 'auditor', '审核员', '00', '2132@qq.com', '15039477662', '0', '', '$2a$10$MR.eLBr0L8rRtpixLTDwOOTz4LBCmlQZEzK3q9GqraNZeDX8w4Wa6', '0', '0', '127.0.0.1', '2023-05-18 13:04:33', 'admin', '2023-05-18 12:56:24', '', '2023-05-18 13:04:33', NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (104, 101);

SET FOREIGN_KEY_CHECKS = 1;
