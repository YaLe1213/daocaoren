/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : daocaoren

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 15/09/2020 13:56:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tplay_admin
-- ----------------------------
DROP TABLE IF EXISTS `tplay_admin`;
CREATE TABLE `tplay_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `thumb` int(11) NOT NULL DEFAULT 1 COMMENT '管理员头像',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `login_time` int(11) NULL DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `admin_cate_id` int(2) NOT NULL DEFAULT 1 COMMENT '管理员分组',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `admin_cate_id`(`admin_cate_id`) USING BTREE,
  INDEX `nickname`(`nickname`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_admin
-- ----------------------------
INSERT INTO `tplay_admin` VALUES (1, 'Tplay', 'admin', '972262e4efe2e00f364d979a7c6ae7ee', 1, 1510885948, 1517622948, 1598006566, '127.0.0.1', 1);

-- ----------------------------
-- Table structure for tplay_admin_cate
-- ----------------------------
DROP TABLE IF EXISTS `tplay_admin_cate`;
CREATE TABLE `tplay_admin_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permissions` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_admin_cate
-- ----------------------------
INSERT INTO `tplay_admin_cate` VALUES (1, '超级管理员', '4,5,6,7,8,11,13,14,16,17,19,20,21,25,26,28,29,52,56,57,54,58,59,55,60,61,62,63,64,31,34,35,37,38,39,40,42,43,44,45,47,48,70,72,73,71,74,75,66,67,68,69,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111', 0, 1599806728, '超级管理员，拥有最高权限！');

-- ----------------------------
-- Table structure for tplay_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `tplay_admin_log`;
CREATE TABLE `tplay_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_menu_id` int(11) NOT NULL COMMENT '操作菜单id',
  `admin_id` int(11) NOT NULL COMMENT '操作者id',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作ip',
  `operation_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作关联id',
  `create_time` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_admin_log
-- ----------------------------
INSERT INTO `tplay_admin_log` VALUES (1, 50, 1, '127.0.0.1', '', 1597995495);
INSERT INTO `tplay_admin_log` VALUES (2, 8, 1, '127.0.0.1', '', 1597995512);
INSERT INTO `tplay_admin_log` VALUES (3, 11, 1, '127.0.0.1', '', 1597995593);
INSERT INTO `tplay_admin_log` VALUES (4, 11, 1, '127.0.0.1', '', 1597995613);
INSERT INTO `tplay_admin_log` VALUES (5, 11, 1, '127.0.0.1', '', 1597996514);
INSERT INTO `tplay_admin_log` VALUES (6, 50, 1, '127.0.0.1', '', 1598006566);
INSERT INTO `tplay_admin_log` VALUES (7, 4, 1, '127.0.0.1', '52', 1598079525);
INSERT INTO `tplay_admin_log` VALUES (8, 4, 1, '127.0.0.1', '53', 1598079617);
INSERT INTO `tplay_admin_log` VALUES (9, 4, 1, '127.0.0.1', '53', 1598079635);
INSERT INTO `tplay_admin_log` VALUES (10, 4, 1, '127.0.0.1', '54', 1598079709);
INSERT INTO `tplay_admin_log` VALUES (11, 4, 1, '127.0.0.1', '55', 1598079750);
INSERT INTO `tplay_admin_log` VALUES (12, 4, 1, '127.0.0.1', '56', 1598079838);
INSERT INTO `tplay_admin_log` VALUES (13, 4, 1, '127.0.0.1', '57', 1598079893);
INSERT INTO `tplay_admin_log` VALUES (14, 4, 1, '127.0.0.1', '58', 1598079985);
INSERT INTO `tplay_admin_log` VALUES (15, 4, 1, '127.0.0.1', '59', 1598080028);
INSERT INTO `tplay_admin_log` VALUES (16, 4, 1, '127.0.0.1', '60', 1598080092);
INSERT INTO `tplay_admin_log` VALUES (17, 4, 1, '127.0.0.1', '61', 1598080174);
INSERT INTO `tplay_admin_log` VALUES (18, 4, 1, '127.0.0.1', '62', 1598080455);
INSERT INTO `tplay_admin_log` VALUES (19, 4, 1, '127.0.0.1', '63', 1598080597);
INSERT INTO `tplay_admin_log` VALUES (20, 4, 1, '127.0.0.1', '64', 1598080798);
INSERT INTO `tplay_admin_log` VALUES (21, 4, 1, '127.0.0.1', '63', 1598080923);
INSERT INTO `tplay_admin_log` VALUES (22, 28, 1, '127.0.0.1', '1', 1598081798);
INSERT INTO `tplay_admin_log` VALUES (23, 4, 1, '127.0.0.1', '53', 1598081855);
INSERT INTO `tplay_admin_log` VALUES (24, 4, 1, '127.0.0.1', '65', 1598342426);
INSERT INTO `tplay_admin_log` VALUES (25, 4, 1, '127.0.0.1', '66', 1598342529);
INSERT INTO `tplay_admin_log` VALUES (26, 4, 1, '127.0.0.1', '67', 1598342581);
INSERT INTO `tplay_admin_log` VALUES (27, 4, 1, '127.0.0.1', '68', 1598342667);
INSERT INTO `tplay_admin_log` VALUES (28, 4, 1, '127.0.0.1', '69', 1598342747);
INSERT INTO `tplay_admin_log` VALUES (29, 28, 1, '127.0.0.1', '1', 1598342784);
INSERT INTO `tplay_admin_log` VALUES (30, 4, 1, '127.0.0.1', '66', 1598342848);
INSERT INTO `tplay_admin_log` VALUES (31, 49, 1, '127.0.0.1', '2', 1598423209);
INSERT INTO `tplay_admin_log` VALUES (32, 49, 1, '127.0.0.1', '3', 1598423917);
INSERT INTO `tplay_admin_log` VALUES (33, 49, 1, '127.0.0.1', '4', 1598424802);
INSERT INTO `tplay_admin_log` VALUES (34, 49, 1, '127.0.0.1', '5', 1598425070);
INSERT INTO `tplay_admin_log` VALUES (35, 49, 1, '127.0.0.1', '6', 1598425266);
INSERT INTO `tplay_admin_log` VALUES (36, 49, 1, '127.0.0.1', '7', 1598425386);
INSERT INTO `tplay_admin_log` VALUES (37, 4, 1, '127.0.0.1', '70', 1598607699);
INSERT INTO `tplay_admin_log` VALUES (38, 4, 1, '127.0.0.1', '71', 1598607785);
INSERT INTO `tplay_admin_log` VALUES (39, 4, 1, '127.0.0.1', '72', 1598607866);
INSERT INTO `tplay_admin_log` VALUES (40, 4, 1, '127.0.0.1', '73', 1598607912);
INSERT INTO `tplay_admin_log` VALUES (41, 4, 1, '127.0.0.1', '74', 1598608073);
INSERT INTO `tplay_admin_log` VALUES (42, 4, 1, '127.0.0.1', '75', 1598608114);
INSERT INTO `tplay_admin_log` VALUES (43, 28, 1, '127.0.0.1', '1', 1598608794);
INSERT INTO `tplay_admin_log` VALUES (44, 4, 1, '127.0.0.1', '74', 1598608835);
INSERT INTO `tplay_admin_log` VALUES (45, 4, 1, '127.0.0.1', '75', 1598608869);
INSERT INTO `tplay_admin_log` VALUES (46, 4, 1, '127.0.0.1', '72', 1598608885);
INSERT INTO `tplay_admin_log` VALUES (47, 4, 1, '127.0.0.1', '73', 1598608901);
INSERT INTO `tplay_admin_log` VALUES (48, 49, 1, '127.0.0.1', '8', 1599546236);
INSERT INTO `tplay_admin_log` VALUES (49, 49, 1, '127.0.0.1', '9', 1599546461);
INSERT INTO `tplay_admin_log` VALUES (50, 49, 1, '127.0.0.1', '10', 1599547512);
INSERT INTO `tplay_admin_log` VALUES (51, 49, 1, '127.0.0.1', '11', 1599547564);
INSERT INTO `tplay_admin_log` VALUES (52, 49, 1, '127.0.0.1', '12', 1599559026);
INSERT INTO `tplay_admin_log` VALUES (53, 49, 1, '127.0.0.1', '13', 1599559915);
INSERT INTO `tplay_admin_log` VALUES (54, 49, 1, '127.0.0.1', '14', 1599559947);
INSERT INTO `tplay_admin_log` VALUES (55, 49, 1, '127.0.0.1', '15', 1599559968);
INSERT INTO `tplay_admin_log` VALUES (56, 49, 1, '127.0.0.1', '16', 1599559987);
INSERT INTO `tplay_admin_log` VALUES (57, 4, 1, '127.0.0.1', '76', 1599631479);
INSERT INTO `tplay_admin_log` VALUES (58, 4, 1, '127.0.0.1', '77', 1599631539);
INSERT INTO `tplay_admin_log` VALUES (59, 4, 1, '127.0.0.1', '78', 1599631619);
INSERT INTO `tplay_admin_log` VALUES (60, 28, 1, '127.0.0.1', '1', 1599631659);
INSERT INTO `tplay_admin_log` VALUES (61, 4, 1, '127.0.0.1', '79', 1599643404);
INSERT INTO `tplay_admin_log` VALUES (62, 4, 1, '127.0.0.1', '80', 1599643465);
INSERT INTO `tplay_admin_log` VALUES (63, 4, 1, '127.0.0.1', '81', 1599643560);
INSERT INTO `tplay_admin_log` VALUES (64, 4, 1, '127.0.0.1', '80', 1599643580);
INSERT INTO `tplay_admin_log` VALUES (65, 4, 1, '127.0.0.1', '82', 1599643678);
INSERT INTO `tplay_admin_log` VALUES (66, 4, 1, '127.0.0.1', '83', 1599643716);
INSERT INTO `tplay_admin_log` VALUES (67, 4, 1, '127.0.0.1', '84', 1599643767);
INSERT INTO `tplay_admin_log` VALUES (68, 4, 1, '127.0.0.1', '83', 1599643782);
INSERT INTO `tplay_admin_log` VALUES (69, 4, 1, '127.0.0.1', '85', 1599643839);
INSERT INTO `tplay_admin_log` VALUES (70, 4, 1, '127.0.0.1', '86', 1599643893);
INSERT INTO `tplay_admin_log` VALUES (71, 4, 1, '127.0.0.1', '87', 1599643956);
INSERT INTO `tplay_admin_log` VALUES (72, 4, 1, '127.0.0.1', '88', 1599644023);
INSERT INTO `tplay_admin_log` VALUES (73, 4, 1, '127.0.0.1', '89', 1599644050);
INSERT INTO `tplay_admin_log` VALUES (74, 4, 1, '127.0.0.1', '90', 1599644095);
INSERT INTO `tplay_admin_log` VALUES (75, 4, 1, '127.0.0.1', '91', 1599644167);
INSERT INTO `tplay_admin_log` VALUES (76, 4, 1, '127.0.0.1', '92', 1599644199);
INSERT INTO `tplay_admin_log` VALUES (77, 4, 1, '127.0.0.1', '93', 1599644237);
INSERT INTO `tplay_admin_log` VALUES (78, 4, 1, '127.0.0.1', '94', 1599644405);
INSERT INTO `tplay_admin_log` VALUES (79, 28, 1, '127.0.0.1', '1', 1599644425);
INSERT INTO `tplay_admin_log` VALUES (80, 28, 1, '127.0.0.1', '1', 1599644446);
INSERT INTO `tplay_admin_log` VALUES (81, 4, 1, '127.0.0.1', '1', 1599644478);
INSERT INTO `tplay_admin_log` VALUES (82, 4, 1, '127.0.0.1', '31', 1599644523);
INSERT INTO `tplay_admin_log` VALUES (83, 28, 1, '127.0.0.1', '1', 1599644543);
INSERT INTO `tplay_admin_log` VALUES (84, 4, 1, '127.0.0.1', '85', 1599646896);
INSERT INTO `tplay_admin_log` VALUES (85, 49, 1, '127.0.0.1', '17', 1599706096);
INSERT INTO `tplay_admin_log` VALUES (86, 49, 1, '127.0.0.1', '18', 1599789027);
INSERT INTO `tplay_admin_log` VALUES (87, 49, 1, '127.0.0.1', '19', 1599789035);
INSERT INTO `tplay_admin_log` VALUES (88, 49, 1, '127.0.0.1', '20', 1599790139);
INSERT INTO `tplay_admin_log` VALUES (89, 49, 1, '127.0.0.1', '21', 1599790152);
INSERT INTO `tplay_admin_log` VALUES (90, 49, 1, '127.0.0.1', '22', 1599790227);
INSERT INTO `tplay_admin_log` VALUES (91, 49, 1, '127.0.0.1', '23', 1599790257);
INSERT INTO `tplay_admin_log` VALUES (92, 49, 1, '127.0.0.1', '24', 1599790297);
INSERT INTO `tplay_admin_log` VALUES (93, 49, 1, '127.0.0.1', '25', 1599790310);
INSERT INTO `tplay_admin_log` VALUES (94, 49, 1, '127.0.0.1', '26', 1599790387);
INSERT INTO `tplay_admin_log` VALUES (95, 49, 1, '127.0.0.1', '27', 1599790697);
INSERT INTO `tplay_admin_log` VALUES (96, 11, 1, '127.0.0.1', '', 1599790744);
INSERT INTO `tplay_admin_log` VALUES (97, 49, 1, '127.0.0.1', '28', 1599793731);
INSERT INTO `tplay_admin_log` VALUES (98, 49, 1, '127.0.0.1', '29', 1599793737);
INSERT INTO `tplay_admin_log` VALUES (99, 49, 1, '127.0.0.1', '30', 1599794693);
INSERT INTO `tplay_admin_log` VALUES (100, 11, 1, '127.0.0.1', '', 1599794849);
INSERT INTO `tplay_admin_log` VALUES (101, 49, 1, '127.0.0.1', '31', 1599794862);
INSERT INTO `tplay_admin_log` VALUES (102, 49, 1, '127.0.0.1', '32', 1599795959);
INSERT INTO `tplay_admin_log` VALUES (103, 49, 1, '127.0.0.1', '33', 1599795967);
INSERT INTO `tplay_admin_log` VALUES (104, 49, 1, '127.0.0.1', '34', 1599795979);
INSERT INTO `tplay_admin_log` VALUES (105, 49, 1, '127.0.0.1', '35', 1599795987);
INSERT INTO `tplay_admin_log` VALUES (106, 49, 1, '127.0.0.1', '36', 1599795996);
INSERT INTO `tplay_admin_log` VALUES (107, 49, 1, '127.0.0.1', '37', 1599796004);
INSERT INTO `tplay_admin_log` VALUES (108, 49, 1, '127.0.0.1', '38', 1599796011);
INSERT INTO `tplay_admin_log` VALUES (109, 49, 1, '127.0.0.1', '39', 1599796018);
INSERT INTO `tplay_admin_log` VALUES (110, 49, 1, '127.0.0.1', '40', 1599796089);
INSERT INTO `tplay_admin_log` VALUES (111, 49, 1, '127.0.0.1', '41', 1599796165);
INSERT INTO `tplay_admin_log` VALUES (112, 49, 1, '127.0.0.1', '42', 1599796238);
INSERT INTO `tplay_admin_log` VALUES (113, 49, 1, '127.0.0.1', '43', 1599796293);
INSERT INTO `tplay_admin_log` VALUES (114, 49, 1, '127.0.0.1', '44', 1599796733);
INSERT INTO `tplay_admin_log` VALUES (115, 49, 1, '127.0.0.1', '45', 1599796903);
INSERT INTO `tplay_admin_log` VALUES (116, 49, 1, '127.0.0.1', '46', 1599797140);
INSERT INTO `tplay_admin_log` VALUES (117, 4, 1, '127.0.0.1', '95', 1599803273);
INSERT INTO `tplay_admin_log` VALUES (118, 4, 1, '127.0.0.1', '96', 1599803306);
INSERT INTO `tplay_admin_log` VALUES (119, 4, 1, '127.0.0.1', '97', 1599803430);
INSERT INTO `tplay_admin_log` VALUES (120, 4, 1, '127.0.0.1', '96', 1599803452);
INSERT INTO `tplay_admin_log` VALUES (121, 4, 1, '127.0.0.1', '96', 1599803554);
INSERT INTO `tplay_admin_log` VALUES (122, 4, 1, '127.0.0.1', '97', 1599803636);
INSERT INTO `tplay_admin_log` VALUES (123, 4, 1, '127.0.0.1', '98', 1599803722);
INSERT INTO `tplay_admin_log` VALUES (124, 4, 1, '127.0.0.1', '99', 1599803767);
INSERT INTO `tplay_admin_log` VALUES (125, 4, 1, '127.0.0.1', '100', 1599803799);
INSERT INTO `tplay_admin_log` VALUES (126, 4, 1, '127.0.0.1', '101', 1599803846);
INSERT INTO `tplay_admin_log` VALUES (127, 4, 1, '127.0.0.1', '102', 1599803895);
INSERT INTO `tplay_admin_log` VALUES (128, 4, 1, '127.0.0.1', '103', 1599804050);
INSERT INTO `tplay_admin_log` VALUES (129, 4, 1, '127.0.0.1', '104', 1599804177);
INSERT INTO `tplay_admin_log` VALUES (130, 4, 1, '127.0.0.1', '105', 1599804223);
INSERT INTO `tplay_admin_log` VALUES (131, 4, 1, '127.0.0.1', '105', 1599804274);
INSERT INTO `tplay_admin_log` VALUES (132, 4, 1, '127.0.0.1', '106', 1599804320);
INSERT INTO `tplay_admin_log` VALUES (133, 4, 1, '127.0.0.1', '107', 1599804448);
INSERT INTO `tplay_admin_log` VALUES (134, 4, 1, '127.0.0.1', '108', 1599804504);
INSERT INTO `tplay_admin_log` VALUES (135, 4, 1, '127.0.0.1', '109', 1599804563);
INSERT INTO `tplay_admin_log` VALUES (136, 4, 1, '127.0.0.1', '109', 1599804601);
INSERT INTO `tplay_admin_log` VALUES (137, 4, 1, '127.0.0.1', '110', 1599804645);
INSERT INTO `tplay_admin_log` VALUES (138, 4, 1, '127.0.0.1', '111', 1599804714);
INSERT INTO `tplay_admin_log` VALUES (139, 28, 1, '127.0.0.1', '1', 1599806728);
INSERT INTO `tplay_admin_log` VALUES (140, 49, 1, '127.0.0.1', '47', 1599880053);
INSERT INTO `tplay_admin_log` VALUES (141, 49, 1, '127.0.0.1', '48', 1600064673);

-- ----------------------------
-- Table structure for tplay_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `tplay_admin_menu`;
CREATE TABLE `tplay_admin_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块',
  `controller` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '控制器',
  `function` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法',
  `parameter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_display` int(1) NOT NULL DEFAULT 1 COMMENT '1显示在左侧菜单2只作为节点',
  `type` int(1) NOT NULL DEFAULT 1 COMMENT '1权限节点2普通节点',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级菜单0为顶级菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `is_open` int(1) NOT NULL DEFAULT 0 COMMENT '0默认闭合1默认展开',
  `orders` int(11) NOT NULL DEFAULT 0 COMMENT '排序值，越小越靠前',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `controller`(`controller`) USING BTREE,
  INDEX `function`(`function`) USING BTREE,
  INDEX `is_display`(`is_display`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_admin_menu
-- ----------------------------
INSERT INTO `tplay_admin_menu` VALUES (1, '系统', '', '', '', '', '系统设置。', 1, 2, 0, 0, 1599644478, 'fa-cog', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (2, '菜单', '', '', '', '', '菜单管理。', 1, 2, 1, 0, 1517015764, 'fa-paw', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (51, '系统菜单排序', 'admin', 'menu', 'orders', '', '系统菜单排序。', 2, 1, 3, 1517562047, 1517562047, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (3, '系统菜单', 'admin', 'menu', 'index', NULL, '系统菜单管理', 1, 2, 2, 0, 0, 'fa-share-alt', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (4, '新增/修改系统菜单', 'admin', 'menu', 'publish', '', '新增/修改系统菜单.', 2, 1, 3, 1516948769, 1516948769, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (5, '删除系统菜单', 'admin', 'menu', 'delete', '', '删除系统菜单。', 2, 1, 3, 1516948857, 1516948857, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (6, '个人', '', '', '', '', '个人信息管理。', 1, 1, 1, 1516949308, 1517021986, 'fa-user', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (7, '个人信息', 'admin', 'admin', 'personal', '', '个人信息修改。', 1, 1, 6, 1516949435, 1516949435, 'fa-user', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (8, '修改密码', 'admin', 'admin', 'editpassword', '', '管理员修改个人密码。', 1, 1, 6, 1516949702, 1517619887, 'fa-unlock-alt', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (9, '设置', '', '', '', '', '系统相关设置。', 1, 2, 1, 1516949853, 1517015878, 'fa-cog', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (10, '网站设置', 'admin', 'webconfig', 'index', '', '网站相关设置首页。', 1, 2, 9, 1516949994, 1516949994, 'fa-bullseye', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (11, '修改网站设置', 'admin', 'webconfig', 'publish', '', '修改网站设置。', 2, 1, 10, 1516950047, 1516950047, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (12, '邮件设置', 'admin', 'emailconfig', 'index', '', '邮件配置首页。', 1, 2, 9, 1516950129, 1516950129, 'fa-envelope', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (13, '修改邮件设置', 'admin', 'emailconfig', 'publish', '', '修改邮件设置。', 2, 1, 12, 1516950215, 1516950215, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (14, '发送测试邮件', 'admin', 'emailconfig', 'mailto', '', '发送测试邮件。', 2, 1, 12, 1516950295, 1516950295, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (15, '短信设置', 'admin', 'smsconfig', 'index', '', '短信设置首页。', 1, 2, 9, 1516950394, 1516950394, 'fa-comments', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (16, '修改短信设置', 'admin', 'smsconfig', 'publish', '', '修改短信设置。', 2, 1, 15, 1516950447, 1516950447, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (17, '发送测试短信', 'admin', 'smsconfig', 'smsto', '', '发送测试短信。', 2, 1, 15, 1516950483, 1516950483, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (18, 'URL 设置', 'admin', 'urlsconfig', 'index', '', 'url 设置。', 1, 2, 9, 1516950738, 1516950804, 'fa-code-fork', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (19, '新增/修改url设置', 'admin', 'urlsconfig', 'publish', '', '新增/修改url设置。', 2, 1, 18, 1516950850, 1516950850, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (20, '启用/禁用url美化', 'admin', 'urlsconfig', 'status', '', '启用/禁用url美化。', 2, 1, 18, 1516950909, 1516950909, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (21, ' 删除url美化规则', 'admin', 'urlsconfig', 'delete', '', ' 删除url美化规则。', 2, 1, 18, 1516950941, 1516950941, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (22, '会员', '', '', '', '', '会员管理。', 1, 2, 0, 1516950991, 1517015810, 'fa-users', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (23, '管理员', '', '', '', '', '系统管理员管理。', 1, 2, 22, 1516951071, 1517015819, 'fa-user', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (24, '管理员', 'admin', 'admin', 'index', '', '系统管理员列表。', 1, 2, 23, 1516951163, 1516951163, 'fa-user', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (25, '新增/修改管理员', 'admin', 'admin', 'publish', '', '新增/修改系统管理员。', 2, 1, 24, 1516951224, 1516951224, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (26, '删除管理员', 'admin', 'admin', 'delete', '', '删除管理员。', 2, 1, 24, 1516951253, 1516951253, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (27, '权限组', 'admin', 'admin', 'admincate', '', '权限分组。', 1, 2, 23, 1516951353, 1517018168, 'fa-dot-circle-o', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (28, '新增/修改权限组', 'admin', 'admin', 'admincatepublish', '', '新增/修改权限组。', 2, 1, 27, 1516951483, 1516951483, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (29, '删除权限组', 'admin', 'admin', 'admincatedelete', '', '删除权限组。', 2, 1, 27, 1516951515, 1516951515, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (30, '操作日志', 'admin', 'admin', 'log', '', '系统管理员操作日志。', 1, 2, 23, 1516951754, 1517018196, 'fa-pencil', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (31, '内容管理', '', '', '', '', '内容管理。', 1, 1, 0, 1516952262, 1599644523, 'fa-th-large', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (32, '文章', '', '', '', '', '文章相关管理。', 1, 2, 31, 1516952698, 1517015846, 'fa-bookmark', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (33, '分类', 'admin', 'articlecate', 'index', '', '文章分类管理。', 1, 2, 32, 1516952856, 1516952856, 'fa-tag', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (34, '新增/修改文章分类', 'admin', 'articlecate', 'publish', '', '新增/修改文章分类。', 2, 1, 33, 1516952896, 1516952896, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (35, '删除文章分类', 'admin', 'articlecate', 'delete', '', '删除文章分类。', 2, 1, 33, 1516952942, 1516952942, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (36, '文章', 'admin', 'article', 'index', '', '文章管理。', 1, 2, 32, 1516953011, 1516953028, 'fa-bookmark', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (37, '新增/修改文章', 'admin', 'article', 'publish', '', '新增/修改文章。', 2, 1, 36, 1516953056, 1516953056, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (38, '审核/拒绝文章', 'admin', 'article', 'status', '', '审核/拒绝文章。', 2, 1, 36, 1516953113, 1516953113, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (39, '置顶/取消置顶文章', 'admin', 'article', 'is_top', '', '置顶/取消置顶文章。', 2, 1, 36, 1516953162, 1516953162, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (40, '删除文章', 'admin', 'article', 'delete', '', '删除文章。', 2, 1, 36, 1516953183, 1516953183, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (41, '附件', 'admin', 'attachment', 'index', '', '附件管理。', 1, 2, 31, 1516953306, 1516953306, 'fa-cube', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (42, '附件审核', 'admin', 'attachment', 'audit', '', '附件审核。', 2, 1, 41, 1516953359, 1516953440, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (43, '附件上传', 'admin', 'attachment', 'upload', '', '附件上传。', 2, 1, 41, 1516953392, 1516953392, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (44, '附件下载', 'admin', 'attachment', 'download', '', '附件下载。', 2, 1, 41, 1516953430, 1516953430, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (45, '附件删除', 'admin', 'attachment', 'delete', '', '附件删除。', 2, 1, 41, 1516953477, 1516953477, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (46, '留言', 'admin', 'tomessages', 'index', '', '留言管理。', 1, 2, 31, 1516953526, 1516953526, 'fa-comments', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (47, '留言处理', 'admin', 'tomessages', 'mark', '', '留言处理。', 2, 1, 46, 1516953605, 1516953605, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (48, '留言删除', 'admin', 'tomessages', 'delete', '', '留言删除。', 2, 1, 46, 1516953648, 1516953648, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (49, '图片上传', 'admin', 'common', 'upload', '', '图片上传。', 2, 2, 0, 1516954491, 1516954491, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (50, '管理员登录', 'admin', 'common', 'login', '', '管理员登录。', 2, 2, 0, 1516954517, 1516954517, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (52, '会员', '', '', '', '', '', 1, 1, 22, 1598079525, 1598079525, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (53, '会员等级', 'admin', 'usersgrade', 'index', '', '', 1, 2, 52, 1598079617, 1598081855, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (54, '会员级别', 'admin', 'userslevel', 'index', '', '', 1, 1, 52, 1598079709, 1598079709, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (55, '会员列表', 'admin', 'users', 'index', '', '', 1, 1, 52, 1598079749, 1598079749, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (56, '添加/修改会员等级', 'admin', 'usersgrade', 'publish', '', '', 2, 1, 53, 1598079838, 1598079838, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (57, '删除会员等级', 'admin', 'usersgrade', 'delete', '', '', 2, 1, 53, 1598079893, 1598079893, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (58, '添加/修改级别', 'admin', 'userslevel', 'publish', '', '', 2, 1, 54, 1598079985, 1598079985, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (59, '删除级别', 'admin', 'userslevel', 'delete', '', '', 2, 1, 54, 1598080028, 1598080028, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (60, '添加/修改会员', 'admin', 'users', 'publish', '', '', 2, 1, 55, 1598080092, 1598080092, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (61, '关系', 'admin', 'users', 'relation', '', '', 2, 1, 55, 1598080174, 1598080174, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (62, '调整', 'admin', 'users', 'adjust', '', '', 2, 1, 55, 1598080455, 1598080455, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (63, '收款认证', 'admin', 'users', 'realpay', '', '', 2, 1, 55, 1598080597, 1598080923, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (64, '实名认证', 'admin', 'usrs', 'realidcard', '', '', 2, 1, 55, 1598080798, 1598080798, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (65, '牧场管理', '', '', '', '', '', 1, 2, 0, 1598342426, 1598342426, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (66, '动物商店', 'admin', 'zoon', 'index', '', '动物商店', 1, 1, 65, 1598342529, 1598342848, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (67, '道具商店', 'admin', 'itemshop', 'index', '', '', 1, 1, 65, 1598342581, 1598342581, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (68, '卷码管理', 'admin', 'coupon', 'index', '', '', 1, 1, 65, 1598342667, 1598342667, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (69, '奖品管理', 'admin', 'prize', 'index', '', '', 1, 1, 65, 1598342747, 1598342747, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (70, '系统公告', 'admin', 'notice', 'index', '', '', 1, 1, 31, 1598607699, 1598607699, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (71, '新手攻略', 'admin', 'novice', 'index', '', '', 1, 1, 31, 1598607785, 1598607785, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (72, '修改/发布公告', 'admin', 'notice', 'publish', '', '', 2, 1, 70, 1598607866, 1598608885, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (73, '删除公告', 'admin', 'notice', 'delete', '', '', 2, 1, 70, 1598607912, 1598608901, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (74, '发布/修改攻略', 'admin', 'novice', 'publish', '', '', 2, 1, 71, 1598608073, 1598608835, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (75, '删除攻略', 'admin', 'novice', 'delete', '', '', 2, 1, 71, 1598608114, 1598608869, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (76, '交易管理', '', '', '', '', '', 1, 1, 0, 1599631479, 1599631479, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (77, '交易参照', 'admin', 'deal', 'index', '', '', 1, 1, 76, 1599631539, 1599631539, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (78, '价格走势', 'admin', 'deal', 'pricetrend', '', '', 1, 1, 76, 1599631619, 1599631619, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (79, '系统设置', '', '', '', '', '', 1, 1, 0, 1599643404, 1599643404, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (80, '系统参数', 'admin', 'system', 'sys', '', '', 1, 1, 79, 1599643465, 1599643580, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (81, '转让参数', 'admin', 'system', 'transfer', '', '', 1, 1, 79, 1599643560, 1599643560, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (82, '置换参数', 'admin', 'system', 'zhihuan', '', '', 1, 1, 79, 1599643678, 1599643678, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (83, '分红参数', 'admin', 'system', 'fenhong', '', '', 1, 1, 79, 1599643716, 1599643781, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (84, '奖励参数', 'admin', 'system', 'reward', '', '', 1, 1, 79, 1599643767, 1599643767, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (85, '冻结参数', 'admin', 'system', 'frozen', '', '', 1, 1, 79, 1599643839, 1599646896, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (86, '虚拟会员', 'admin', 'system', 'xuni', '', '', 1, 1, 79, 1599643893, 1599643893, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (87, '短信接口', 'admin', 'system', 'note', '', '', 1, 1, 79, 1599643956, 1599643956, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (88, '验证接口', 'admin', 'system', 'check', '', '', 1, 1, 79, 1599644023, 1599644023, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (89, 'APP设置', '', '', '', '', '', 1, 1, 0, 1599644050, 1599644050, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (90, '注册协议', 'admin', 'app', 'register', '', '', 1, 1, 89, 1599644095, 1599644095, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (91, '隐私策略', 'admin', 'app', 'private', '', '', 1, 1, 89, 1599644167, 1599644167, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (92, 'APP参数', 'admin', 'app', 'app', '', '', 1, 1, 89, 1599644199, 1599644199, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (93, '关于我们', 'admin', 'app', 'about', '', '', 1, 1, 89, 1599644237, 1599644237, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (94, '系统日志', '', '', '', '', '', 1, 1, 0, 1599644405, 1599644405, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (95, '实名认证', 'admin', 'log', 'realname', '', '', 1, 1, 94, 1599803273, 1599803273, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (96, '收款认证', 'admin', 'log', 'realpay', '', '', 1, 1, 94, 1599803306, 1599803554, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (97, '直推奖励', 'admin', 'log', 'zhitui', '', '', 1, 1, 94, 1599803430, 1599803636, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (98, '注册奖励', 'admin', 'log', 'register', '', '', 1, 1, 94, 1599803722, 1599803722, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (99, '领导奖励', 'admin', 'log', 'leader', '', '', 1, 1, 94, 1599803767, 1599803767, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (100, '养殖奖励', 'admin', 'log', 'feed', '', '', 1, 1, 94, 1599803799, 1599803799, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (101, '互动奖励', 'admin', 'log', 'interact', '', '', 1, 1, 94, 1599803846, 1599803846, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (102, '转让记录', 'admin', 'log', 'transfer', '', '', 1, 1, 94, 1599803895, 1599803895, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (103, '置换记录', 'admin', 'log', 'zhihuan', '', '', 1, 1, 94, 1599804050, 1599804050, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (104, '商店记录', 'admin', 'log', 'shop', '', '', 1, 1, 94, 1599804177, 1599804177, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (105, '分红收入', 'admin', 'log', 'fenhongincome', '', '', 1, 1, 94, 1599804223, 1599804274, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (106, '分红发放', 'admin', 'log', 'fenhonggrant', '', '', 1, 1, 94, 1599804320, 1599804320, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (107, '道具记录', 'admin', 'log', 'prop', '', '', 1, 1, 94, 1599804448, 1599804448, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (108, '抽奖记录', 'admin', 'log', 'luckdraw', '', '', 1, 1, 94, 1599804504, 1599804504, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (109, '交易信誉', 'admin', 'log', 'transaction', '', '', 1, 1, 94, 1599804563, 1599804601, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (110, '价格记录', 'admin', 'log', 'price', '', '', 1, 1, 94, 1599804645, 1599804645, '', 0, 0);
INSERT INTO `tplay_admin_menu` VALUES (111, '交易列表', 'admin', 'log', 'transactionlist', '', '', 1, 1, 94, 1599804714, 1599804714, '', 0, 0);

-- ----------------------------
-- Table structure for tplay_app
-- ----------------------------
DROP TABLE IF EXISTS `tplay_app`;
CREATE TABLE `tplay_app`  (
  `start_up` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启动图片',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认会员头像',
  `background_music` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景音乐',
  `background_sound` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '背景音效',
  `feed_sound` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '养殖音效',
  `harvest_sound` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收获音效',
  `steal_sound` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '偷取音效',
  `dog_sound` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '看门狗声音',
  `id` int(11) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_app
-- ----------------------------
INSERT INTO `tplay_app` VALUES ('\\uploads\\admin\\admin_thumb\\20200914\\2431e733bd8a86f7ce20a3f3d47472b3.jpg', '\\uploads\\admin\\admin_thumb\\20200912\\0d09070e8fb2af46927563e4b7563379.jpg', '\\uploads\\admin\\admin_thumb\\20200911\\0c2acb237dad3331da892165dbdc0325.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\2b22f5b58739fa39823ca54421cff928.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\af1a4d0da22ac56e8e13557ea1c77e8c.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\c216138e181b4c9bdf271cb1c8c74982.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\ccb782b56103a7389cac7465735d61fc.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\d1ae199c0fbc06e951da4db562a6d4ba.mp3', 1);

-- ----------------------------
-- Table structure for tplay_article
-- ----------------------------
DROP TABLE IF EXISTS `tplay_article`;
CREATE TABLE `tplay_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `article_cate_id` int(11) NOT NULL,
  `thumb` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `admin_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `edit_admin_id` int(11) NOT NULL COMMENT '最后修改人',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0待审核1已审核',
  `is_top` int(1) NOT NULL DEFAULT 0 COMMENT '1置顶0普通',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_top`(`is_top`) USING BTREE,
  INDEX `article_cate_id`(`article_cate_id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `tplay_article_cate`;
CREATE TABLE `tplay_article_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tplay_attachment`;
CREATE TABLE `tplay_attachment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `module` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `filename` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `filepath` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径+文件名',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `fileext` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `uploadip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '上传IP',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未审核1已审核-1不通过',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL COMMENT '审核者id',
  `audit_time` int(11) NOT NULL COMMENT '审核时间',
  `use` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用处',
  `download` int(11) NOT NULL DEFAULT 0 COMMENT '下载量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `filename`(`filename`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_attachment
-- ----------------------------
INSERT INTO `tplay_attachment` VALUES (1, 'admin', '79811855a6c06de53047471c4ff82a36.jpg', '\\uploads\\admin\\admin_thumb\\20180104\\79811855a6c06de53047471c4ff82a36.jpg', 13781, 'jpg', 1, '127.0.0.1', 1, 1515046060, 1, 1515046060, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (2, 'admin', '63e5eae0c2e1119f190726ca22ce7c5d.jpg', '\\uploads\\admin\\info_thumb\\20200826\\63e5eae0c2e1119f190726ca22ce7c5d.jpg', 12330, 'jpg', 1, '127.0.0.1', 1, 1598423208, 1, 1598423208, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (3, 'admin', 'f81fcf4e1a47a8dd56f3cdea851dcdf3.jpg', '\\uploads\\admin\\info_thumb\\20200826\\f81fcf4e1a47a8dd56f3cdea851dcdf3.jpg', 12330, 'jpg', 1, '127.0.0.1', 1, 1598423917, 1, 1598423917, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (4, 'admin', 'b85394a49d38928caf68a9bbceefb45e.jpg', '\\uploads\\admin\\info_thumb\\20200826\\b85394a49d38928caf68a9bbceefb45e.jpg', 37501, 'jpg', 1, '127.0.0.1', 1, 1598424802, 1, 1598424802, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (5, 'admin', 'e8d7e09052e93112fed665bf6b9bbe33.jpg', '\\uploads\\admin\\info_thumb\\20200826\\e8d7e09052e93112fed665bf6b9bbe33.jpg', 8258, 'jpg', 1, '127.0.0.1', 1, 1598425070, 1, 1598425070, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (6, 'admin', 'f84ded7f602dc7d57096e1d0a13865cb.jpg', '\\uploads\\admin\\info_thumb\\20200826\\f84ded7f602dc7d57096e1d0a13865cb.jpg', 60827, 'jpg', 1, '127.0.0.1', 1, 1598425266, 1, 1598425266, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (7, 'admin', '90b51b966b6105ad79fd8c54562b3e44.jpg', '\\uploads\\admin\\info_thumb\\20200826\\90b51b966b6105ad79fd8c54562b3e44.jpg', 9680, 'jpg', 1, '127.0.0.1', 1, 1598425386, 1, 1598425386, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (8, 'admin', '85ff8d7465ef74badcc844fbb6a96cdd.png', '\\uploads\\admin\\info_thumb\\20200908\\85ff8d7465ef74badcc844fbb6a96cdd.png', 983, 'png', 1, '127.0.0.1', 1, 1599546235, 1, 1599546235, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (9, 'admin', '8c03a0d6ffb2c6963f1040536979a289.png', '\\uploads\\admin\\info_thumb\\20200908\\8c03a0d6ffb2c6963f1040536979a289.png', 3659, 'png', 1, '127.0.0.1', 1, 1599546461, 1, 1599546461, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (10, 'admin', 'd6ea693b1afb19ea255ffe2b40ba4a48.png', '\\uploads\\admin\\info_thumb\\20200908\\d6ea693b1afb19ea255ffe2b40ba4a48.png', 983, 'png', 1, '127.0.0.1', 1, 1599547512, 1, 1599547512, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (11, 'admin', '033740a259a29ed82a82eafc96ce9f1c.png', '\\uploads\\admin\\info_thumb\\20200908\\033740a259a29ed82a82eafc96ce9f1c.png', 983, 'png', 1, '127.0.0.1', 1, 1599547564, 1, 1599547564, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (12, 'admin', '0d94a069f8ed3f39ff234e78412c3a39.png', '\\uploads\\admin\\info_thumb\\20200908\\0d94a069f8ed3f39ff234e78412c3a39.png', 983, 'png', 1, '127.0.0.1', 1, 1599559026, 1, 1599559026, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (13, 'admin', 'cda6aca7706b11c19be70ad22fe98877.png', '\\uploads\\admin\\info_thumb\\20200908\\cda6aca7706b11c19be70ad22fe98877.png', 983, 'png', 1, '127.0.0.1', 1, 1599559915, 1, 1599559915, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (14, 'admin', 'c772fda8640af930ea142477bcd5f12f.png', '\\uploads\\admin\\info_thumb\\20200908\\c772fda8640af930ea142477bcd5f12f.png', 983, 'png', 1, '127.0.0.1', 1, 1599559947, 1, 1599559947, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (15, 'admin', 'c114aa00409ac40dacd7b069d5694a9c.png', '\\uploads\\admin\\info_thumb\\20200908\\c114aa00409ac40dacd7b069d5694a9c.png', 983, 'png', 1, '127.0.0.1', 1, 1599559967, 1, 1599559967, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (16, 'admin', '8e79f3ee6fec3bd2e6e3db43160c1da2.png', '\\uploads\\admin\\info_thumb\\20200908\\8e79f3ee6fec3bd2e6e3db43160c1da2.png', 983, 'png', 1, '127.0.0.1', 1, 1599559987, 1, 1599559987, 'info_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (17, 'admin', 'a21c962bc6714b0daf95e2be2b9af625.png', '\\uploads\\admin\\start_thumb\\20200910\\a21c962bc6714b0daf95e2be2b9af625.png', 65317, 'png', 1, '127.0.0.1', 1, 1599706096, 1, 1599706096, 'start_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (18, 'admin', '6c4cdb19658259e70c6b2ff879101ae6.png', '\\uploads\\admin\\article_thumb\\20200911\\6c4cdb19658259e70c6b2ff879101ae6.png', 135695, 'png', 1, '127.0.0.1', 1, 1599789027, 1, 1599789027, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (19, 'admin', 'd91822b1753b7d7d03a15e605ce7c7e5.png', '\\uploads\\admin\\article_thumb\\20200911\\d91822b1753b7d7d03a15e605ce7c7e5.png', 3659, 'png', 1, '127.0.0.1', 1, 1599789035, 1, 1599789035, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (20, 'admin', '8be8bfa1fe8eca3da0648c42ce549599.png', '\\uploads\\admin\\article_thumb\\20200911\\8be8bfa1fe8eca3da0648c42ce549599.png', 983, 'png', 1, '127.0.0.1', 1, 1599790139, 1, 1599790139, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (21, 'admin', '96db2d8b68e6d1afed8a51f66292fa01.png', '\\uploads\\admin\\article_thumb\\20200911\\96db2d8b68e6d1afed8a51f66292fa01.png', 983, 'png', 1, '127.0.0.1', 1, 1599790152, 1, 1599790152, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (22, 'admin', '92bd8a5477b4da26544d996731ffcaf1.png', '\\uploads\\admin\\article_thumb\\20200911\\92bd8a5477b4da26544d996731ffcaf1.png', 131698, 'png', 1, '127.0.0.1', 1, 1599790227, 1, 1599790227, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (23, 'admin', '482d83eb4342b3a5d9a448ce4a3a88e2.png', '\\uploads\\admin\\article_thumb\\20200911\\482d83eb4342b3a5d9a448ce4a3a88e2.png', 131698, 'png', 1, '127.0.0.1', 1, 1599790257, 1, 1599790257, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (24, 'admin', 'a818c7f46a450157406bb9f5bc6d11c7.png', '\\uploads\\admin\\article_thumb\\20200911\\a818c7f46a450157406bb9f5bc6d11c7.png', 131698, 'png', 1, '127.0.0.1', 1, 1599790297, 1, 1599790297, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (25, 'admin', '545f0229cb9dc17571e196e46db1f464.png', '\\uploads\\admin\\article_thumb\\20200911\\545f0229cb9dc17571e196e46db1f464.png', 131698, 'png', 1, '127.0.0.1', 1, 1599790310, 1, 1599790310, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (26, 'admin', '1102144cbb27b5a1ac84ff21d14b4dc5.png', '\\uploads\\admin\\article_thumb\\20200911\\1102144cbb27b5a1ac84ff21d14b4dc5.png', 131698, 'png', 1, '127.0.0.1', 1, 1599790387, 1, 1599790387, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (27, 'admin', 'a2f7ce747c6a17d304d0563e8be6555d.png', '\\uploads\\admin\\article_thumb\\20200911\\a2f7ce747c6a17d304d0563e8be6555d.png', 131698, 'png', 1, '127.0.0.1', 1, 1599790697, 1, 1599790697, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (28, 'admin', 'b9204c5fca448d1b461430033bce734e.png', '\\uploads\\admin\\article_thumb\\20200911\\b9204c5fca448d1b461430033bce734e.png', 983, 'png', 1, '127.0.0.1', 1, 1599793731, 1, 1599793731, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (29, 'admin', 'c7fd6f7f3e212965408ff10c40c304df.png', '\\uploads\\admin\\article_thumb\\20200911\\c7fd6f7f3e212965408ff10c40c304df.png', 983, 'png', 1, '127.0.0.1', 1, 1599793737, 1, 1599793737, 'article_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (30, 'admin', '27d2556cab9d176317066da93950ad1e.png', '\\uploads\\admin\\admin_thumb\\20200911\\27d2556cab9d176317066da93950ad1e.png', 131698, 'png', 1, '127.0.0.1', 1, 1599794693, 1, 1599794693, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (31, 'admin', '146a64f2e7f24edecc3f94e508251217.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\146a64f2e7f24edecc3f94e508251217.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599794862, 1, 1599794862, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (32, 'admin', '76a024a624b01465d5171827ef7b1c81.png', '\\uploads\\admin\\admin_thumb\\20200911\\76a024a624b01465d5171827ef7b1c81.png', 131698, 'png', 1, '127.0.0.1', 1, 1599795959, 1, 1599795959, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (33, 'admin', '67788758f5ebbbc7aa4edc4f80adefb8.png', '\\uploads\\admin\\admin_thumb\\20200911\\67788758f5ebbbc7aa4edc4f80adefb8.png', 983, 'png', 1, '127.0.0.1', 1, 1599795967, 1, 1599795967, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (34, 'admin', '0c2acb237dad3331da892165dbdc0325.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\0c2acb237dad3331da892165dbdc0325.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599795979, 1, 1599795979, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (35, 'admin', '2b22f5b58739fa39823ca54421cff928.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\2b22f5b58739fa39823ca54421cff928.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599795987, 1, 1599795987, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (36, 'admin', '18a9444634b10fd84d19c7bfa9c9c8fe.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\18a9444634b10fd84d19c7bfa9c9c8fe.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599795996, 1, 1599795996, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (37, 'admin', '19b226e909361005cd093617f9ad9f46.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\19b226e909361005cd093617f9ad9f46.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599796004, 1, 1599796004, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (38, 'admin', 'c216138e181b4c9bdf271cb1c8c74982.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\c216138e181b4c9bdf271cb1c8c74982.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599796011, 1, 1599796011, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (39, 'admin', 'ccb782b56103a7389cac7465735d61fc.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\ccb782b56103a7389cac7465735d61fc.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599796018, 1, 1599796018, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (40, 'admin', '49a579cf17334563224a2e4f5b9fe629.png', '\\uploads\\admin\\admin_thumb\\20200911\\49a579cf17334563224a2e4f5b9fe629.png', 983, 'png', 1, '127.0.0.1', 1, 1599796089, 1, 1599796089, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (41, 'admin', '063e38f975eec614fa8dec8dedc76fa4.png', '\\uploads\\admin\\admin_thumb\\20200911\\063e38f975eec614fa8dec8dedc76fa4.png', 983, 'png', 1, '127.0.0.1', 1, 1599796165, 1, 1599796165, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (42, 'admin', 'c660a130cc5c3f886883d490f1a7fc62.png', '\\uploads\\admin\\admin_thumb\\20200911\\c660a130cc5c3f886883d490f1a7fc62.png', 983, 'png', 1, '127.0.0.1', 1, 1599796238, 1, 1599796238, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (43, 'admin', 'a3695aa452f276153e28c4dcb60b517f.png', '\\uploads\\admin\\admin_thumb\\20200911\\a3695aa452f276153e28c4dcb60b517f.png', 3320, 'png', 1, '127.0.0.1', 1, 1599796293, 1, 1599796293, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (44, 'admin', '20f44b878ec0f2c7048164cb19d8f8f7.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\20f44b878ec0f2c7048164cb19d8f8f7.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599796733, 1, 1599796733, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (45, 'admin', 'd1ae199c0fbc06e951da4db562a6d4ba.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\d1ae199c0fbc06e951da4db562a6d4ba.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599796902, 1, 1599796902, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (46, 'admin', 'af1a4d0da22ac56e8e13557ea1c77e8c.mp3', '\\uploads\\admin\\admin_thumb\\20200911\\af1a4d0da22ac56e8e13557ea1c77e8c.mp3', 5013626, 'mp3', 1, '127.0.0.1', 1, 1599797140, 1, 1599797140, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (47, 'admin', '0d09070e8fb2af46927563e4b7563379.jpg', '\\uploads\\admin\\admin_thumb\\20200912\\0d09070e8fb2af46927563e4b7563379.jpg', 13781, 'jpg', 1, '127.0.0.1', 1, 1599880053, 1, 1599880053, 'admin_thumb', 0);
INSERT INTO `tplay_attachment` VALUES (48, 'admin', '2431e733bd8a86f7ce20a3f3d47472b3.jpg', '\\uploads\\admin\\admin_thumb\\20200914\\2431e733bd8a86f7ce20a3f3d47472b3.jpg', 30234, 'jpg', 1, '127.0.0.1', 1, 1600064673, 1, 1600064673, 'admin_thumb', 0);

-- ----------------------------
-- Table structure for tplay_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tplay_coupon`;
CREATE TABLE `tplay_coupon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卷码名称',
  `use_shop` enum('动物商店','道具商店') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用商店',
  `deduct_yield` int(11) NULL DEFAULT NULL COMMENT '抵扣产量',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能说明',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '静态图标',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_coupon
-- ----------------------------
INSERT INTO `tplay_coupon` VALUES (1, '代金券50', '动物商店', 50, NULL, '\\uploads\\admin\\info_thumb\\20200908\\cda6aca7706b11c19be70ad22fe98877.png', '1599559917');
INSERT INTO `tplay_coupon` VALUES (2, '代金券200', '动物商店', 200, NULL, '\\uploads\\admin\\info_thumb\\20200908\\c772fda8640af930ea142477bcd5f12f.png', '1599559948');
INSERT INTO `tplay_coupon` VALUES (3, '代金券600', '动物商店', 600, NULL, '\\uploads\\admin\\info_thumb\\20200908\\c114aa00409ac40dacd7b069d5694a9c.png', '1599559968');
INSERT INTO `tplay_coupon` VALUES (4, '代金券800', '动物商店', 800, NULL, '\\uploads\\admin\\info_thumb\\20200908\\8e79f3ee6fec3bd2e6e3db43160c1da2.png', '1599559988');

-- ----------------------------
-- Table structure for tplay_deal
-- ----------------------------
DROP TABLE IF EXISTS `tplay_deal`;
CREATE TABLE `tplay_deal`  (
  `start_time` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易功能开启时间',
  `end_time` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易功能结束时间',
  `first_credit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '初始信誉分',
  `credit_top` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信誉分上限',
  `credit_bot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信誉分低于10/20/30/40/50分时',
  `users_limit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '给予会员账号操作限制/登录限制限制',
  `limit_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自动限制时间为年月日',
  `limit_cause` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自动显示原因为_____________',
  `want_buying` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买方发布交易订单，此时订单状态为[求购中]，有效时长为',
  `no_cancel_buying` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '如买方手动取消求购订单，自动扣除买方信誉分___分',
  `buyed_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖方确认交易订单，此时订单状态为[打款中]，有效时长为___分钟',
  `no_buyed` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '如买方超过有效时长未打款订单，自动扣除买方信誉分____分',
  `no_confirm_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买方提交支付之后，此时订单状态为[待确认]，有效时长为___分钟',
  `no_confirm_pay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '如卖方超过有效时长未确认收款，自动扣除卖方信誉分__分',
  `confirm_pay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '，如卖方在有效时长内确认收款，自动增加卖方信誉分___分',
  `inc_buy_credit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '，并且自动增加买方信誉分___分'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_deal
-- ----------------------------
INSERT INTO `tplay_deal` VALUES ('09:00:00', '21:00:00', '100', '0', '10', 'login_limit', '2020-09-17', '由于您的信誉分属于最低，平台已限制您的正常登录，如有疑问点击在线客服咨询！', '7', '0', '30', '20', '20', '20', NULL, '20');

-- ----------------------------
-- Table structure for tplay_emailconfig
-- ----------------------------
DROP TABLE IF EXISTS `tplay_emailconfig`;
CREATE TABLE `tplay_emailconfig`  (
  `email` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱配置标识',
  `from_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件来源也就是邮件地址',
  `from_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smtp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱smtp服务器',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱密码',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件模板',
  INDEX `email`(`email`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_emailconfig
-- ----------------------------
INSERT INTO `tplay_emailconfig` VALUES ('email', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for tplay_feed
-- ----------------------------
DROP TABLE IF EXISTS `tplay_feed`;
CREATE TABLE `tplay_feed`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `zoon_id` int(11) NULL DEFAULT NULL COMMENT '动物id',
  `num` int(111) NULL DEFAULT 0 COMMENT '数量',
  `method` enum('购买','赠送') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '购买' COMMENT '获取方式',
  `create_time` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_feed
-- ----------------------------
INSERT INTO `tplay_feed` VALUES (1, 1, 1, 3, '购买', '1');
INSERT INTO `tplay_feed` VALUES (2, 1, 2, 2, '购买', '1');

-- ----------------------------
-- Table structure for tplay_itemshop
-- ----------------------------
DROP TABLE IF EXISTS `tplay_itemshop`;
CREATE TABLE `tplay_itemshop`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '道具名称',
  `buy_yield` decimal(11, 4) NULL DEFAULT NULL COMMENT '购买所需产量',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能参数',
  `app_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端app显示说明1--喂养后截取产量倒计时自动结束2--偷取所有可偷好友列表的产量3--保护牧场24小时内不被好友偷取',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sort`(`sort`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_itemshop
-- ----------------------------
INSERT INTO `tplay_itemshop` VALUES (1, 1, '饲料', 1.0000, '1', '可将动物的喂养中的状态直接变更为可摘取状态', '\\uploads\\admin\\info_thumb\\20200908\\8c03a0d6ffb2c6963f1040536979a289.png', '1599546461');
INSERT INTO `tplay_itemshop` VALUES (2, 2, '一键偷取', 1.0001, '2', '可一键偷取可偷好友列表中当前时间点内的所有好友产量', '\\uploads\\admin\\info_thumb\\20200908\\d6ea693b1afb19ea255ffe2b40ba4a48.png', '1599547512');
INSERT INTO `tplay_itemshop` VALUES (3, 3, '看门狗', 1.0000, '3', '防好友偷取产量守护24小时(从使用开始时间倒计时24小时)', '\\uploads\\admin\\info_thumb\\20200908\\033740a259a29ed82a82eafc96ce9f1c.png', '1599547565');

-- ----------------------------
-- Table structure for tplay_messages
-- ----------------------------
DROP TABLE IF EXISTS `tplay_messages`;
CREATE TABLE `tplay_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_look` int(1) NOT NULL DEFAULT 0 COMMENT '0未读1已读',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `is_look`(`is_look`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_notice
-- ----------------------------
DROP TABLE IF EXISTS `tplay_notice`;
CREATE TABLE `tplay_notice`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_notice
-- ----------------------------
INSERT INTO `tplay_notice` VALUES (2, '测试公告', '测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告测试公告', '1600077572');

-- ----------------------------
-- Table structure for tplay_notice_role
-- ----------------------------
DROP TABLE IF EXISTS `tplay_notice_role`;
CREATE TABLE `tplay_notice_role`  (
  `notice_id` int(11) UNSIGNED NOT NULL COMMENT '公告id',
  `users_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tplay_notice_role
-- ----------------------------
INSERT INTO `tplay_notice_role` VALUES (2, 1);

-- ----------------------------
-- Table structure for tplay_novice
-- ----------------------------
DROP TABLE IF EXISTS `tplay_novice`;
CREATE TABLE `tplay_novice`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sort`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_novice
-- ----------------------------
INSERT INTO `tplay_novice` VALUES (1, 1, '1', '1<img src=\"http://www.daocaoren.com/static/public/kindeditor/attached/image/20200829/20200829093919_67208.jpg\" width=\"100%\" alt=\"\" />', '1598664892');
INSERT INTO `tplay_novice` VALUES (2, 2, '2', '2', '1598665404');

-- ----------------------------
-- Table structure for tplay_prize
-- ----------------------------
DROP TABLE IF EXISTS `tplay_prize`;
CREATE TABLE `tplay_prize`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cate` int(11) NULL DEFAULT NULL COMMENT '奖品类型\r\n\r\n1道具商店\r\n\r\n2动物商店\r\n\r\n3自定义',
  `zoon_id` int(11) NULL DEFAULT NULL COMMENT '动物id',
  `itemshop_id` int(11) NULL DEFAULT NULL COMMENT '道具id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `chance1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中奖概率1',
  `chance2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中奖概率2',
  `custom` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_prize
-- ----------------------------
INSERT INTO `tplay_prize` VALUES (1, 1, 0, 1, '饲料', 1, '1', '10000', '');
INSERT INTO `tplay_prize` VALUES (2, 1, 0, 2, '一键偷取', 1, '1', '10000', '');
INSERT INTO `tplay_prize` VALUES (3, 1, 0, 3, '看门狗', 1, '1', '10000', '');
INSERT INTO `tplay_prize` VALUES (4, 2, 1, 0, '柴火鸡', 1, '1', '10000', '');
INSERT INTO `tplay_prize` VALUES (5, 2, 2, 0, '原野鸡', 1, '1', '10000', '');
INSERT INTO `tplay_prize` VALUES (6, 2, 3, 0, '乌骨鸡', 1, '1', '10000', '');
INSERT INTO `tplay_prize` VALUES (7, 2, 4, 0, '珍珠鸡', 1, '1', '10000', '');
INSERT INTO `tplay_prize` VALUES (8, 2, 5, 0, '孔雀鸡', 1, '1', '10000', '');
INSERT INTO `tplay_prize` VALUES (9, 3, 0, 0, '代金券50', 1, '1', '10000', '代金券50');
INSERT INTO `tplay_prize` VALUES (10, 3, 0, 0, '代金券200', 1, '1', '10000', '代金券200');
INSERT INTO `tplay_prize` VALUES (11, 3, 0, 0, '代金券600', 1, '1', '10000', '代金券600');
INSERT INTO `tplay_prize` VALUES (12, 3, 0, 0, '代金券800', 1, '1', '10000', '代金券800');

-- ----------------------------
-- Table structure for tplay_real_alipay
-- ----------------------------
DROP TABLE IF EXISTS `tplay_real_alipay`;
CREATE TABLE `tplay_real_alipay`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL COMMENT '会员id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实名姓名',
  `alinum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付宝账号',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '认证时间',
  PRIMARY KEY (`id`, `users_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_real_alipay
-- ----------------------------
INSERT INTO `tplay_real_alipay` VALUES (1, 3, 'yale', '1509739257', '1599812166');
INSERT INTO `tplay_real_alipay` VALUES (15, 2, '11212', '11111', '1599813349');
INSERT INTO `tplay_real_alipay` VALUES (13, 3, 'yale', '1509739257', '1599812843');

-- ----------------------------
-- Table structure for tplay_real_bank
-- ----------------------------
DROP TABLE IF EXISTS `tplay_real_bank`;
CREATE TABLE `tplay_real_bank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实名姓名',
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户银行',
  `bank_card` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '银行卡号',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '认证时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_real_bank
-- ----------------------------
INSERT INTO `tplay_real_bank` VALUES (7, 2, '11', '1111', '1111111111111111', '1599813349');
INSERT INTO `tplay_real_bank` VALUES (4, 3, '12', '12111', '121212121212121212', '1599812843');

-- ----------------------------
-- Table structure for tplay_real_idcard
-- ----------------------------
DROP TABLE IF EXISTS `tplay_real_idcard`;
CREATE TABLE `tplay_real_idcard`  (
  `id` int(111) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL COMMENT '用户id',
  `mode` enum('自主认证','客服认证') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证方式',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '认证时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idcard`(`idcard`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_real_idcard
-- ----------------------------
INSERT INTO `tplay_real_idcard` VALUES (2, 2, '客服认证', '1', '11234567898765', '1598521839');
INSERT INTO `tplay_real_idcard` VALUES (3, 3, '客服认证', '实名', '1234567891223456', '1598522327');
INSERT INTO `tplay_real_idcard` VALUES (1, 1, '客服认证', '第一', '12345678901234567', '1598523609');

-- ----------------------------
-- Table structure for tplay_register
-- ----------------------------
DROP TABLE IF EXISTS `tplay_register`;
CREATE TABLE `tplay_register`  (
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册协议标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '协议内容',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_register
-- ----------------------------
INSERT INTO `tplay_register` VALUES ('1', '1', 'register');
INSERT INTO `tplay_register` VALUES ('1', '1', 'about');
INSERT INTO `tplay_register` VALUES ('1', '1', 'private');

-- ----------------------------
-- Table structure for tplay_smsconfig
-- ----------------------------
DROP TABLE IF EXISTS `tplay_smsconfig`;
CREATE TABLE `tplay_smsconfig`  (
  `sms` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sms' COMMENT '标识',
  `appkey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secretkey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'normal' COMMENT '短信类型',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信签名',
  `register_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '注册验证码模板ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信默认模板',
  `eidt_pass_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改登录密码模板id',
  `retrieve_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找回登录密码模板id',
  `edit_safe_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改安全密码模板id',
  `release_buy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易市场买家发布求购订单通知',
  `cancel_buy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易市场买家取消求购订单通知',
  `sub_buy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\r\n交易市场卖家提交求购订单通知',
  `confirm_payment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\r\n交易市场买家确认打款订单通知',
  `confirm_buy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易市场卖家确认求购订单通知',
  `complaint_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '\r\n交易大厅买卖双方订单发起投诉通知',
  INDEX `sms`(`sms`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_smsconfig
-- ----------------------------
INSERT INTO `tplay_smsconfig` VALUES ('sms', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tplay_sys
-- ----------------------------
DROP TABLE IF EXISTS `tplay_sys`;
CREATE TABLE `tplay_sys`  (
  `id` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `limit_register` int(11) NULL DEFAULT NULL COMMENT '每日限制会员注册总人数',
  `limit_tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '如果超出限制则APP注册提示框显示：',
  `regist_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日开放会员注册 开始 时间',
  `regist_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日开放会员注册 结束 时间',
  `over_time_tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '如果超出时间段则APP注册提示框显示：',
  `service_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '在线客服跳转地址',
  `zoon_feed` int(11) NULL DEFAULT NULL COMMENT '一只动物每天可喂养',
  `feed_time` int(11) NULL DEFAULT NULL COMMENT '喂养倒计时多久可以收获产量   小时',
  `show_level` int(11) NULL DEFAULT NULL COMMENT '偷取产量的前端好友层级显示   不限 10级-50级',
  `show_prev` int(11) NULL DEFAULT NULL COMMENT '显示上级推荐人好友   向上一级--向上三级1,2,3',
  `steal_height` int(11) NULL DEFAULT NULL COMMENT '每天每只动物最高被偷取操作次数为',
  `status` int(11) NULL DEFAULT NULL COMMENT '当前系统状态 1 开启 0 关闭',
  `closs_tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关闭系统提示',
  `transfer_status` int(11) NULL DEFAULT NULL COMMENT '转让功能----转让参数   1开启0关闭',
  `charge_status` int(11) NULL DEFAULT NULL COMMENT '手续费功能--------转让参数  1开启0关闭',
  `one_line` int(11) NULL DEFAULT NULL COMMENT '单次最低转让产量-------转让参数',
  `one_hight` int(11) NULL DEFAULT NULL COMMENT '单次最高转让产量  ------转让参数\r\n',
  `day_total` int(11) NULL DEFAULT NULL COMMENT '每日累计最高转让产量------转让参数',
  `day_num` int(11) NULL DEFAULT NULL COMMENT '每日累计转让次数限制-------转让参数',
  `zh_status` int(11) NULL DEFAULT NULL COMMENT '置换功能---置换参数  1开启0关闭',
  `zh_charge_status` int(11) NULL DEFAULT NULL COMMENT '手续费功能-----置换参数  1开启0关闭',
  `yield_hos1` int(11) NULL DEFAULT NULL COMMENT '产量置换HOS比例：1------置换参数',
  `yield_hos2` int(11) NULL DEFAULT NULL COMMENT '产量置换HOS比例：2------置换参数',
  `hos_yield1` int(11) NULL DEFAULT NULL COMMENT 'HOS置换产量比例：1------置换参数',
  `hos_yield2` int(11) NULL DEFAULT NULL COMMENT 'HOS置换产量比例：2------置换参数',
  `fh_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日发放分红时间------分红参数',
  `fh_transfer` int(11) NULL DEFAULT 1 COMMENT '转让手续费参与分红----分红参数 1 开启 0 关闭',
  `fh_zh` int(11) NULL DEFAULT 1 COMMENT '置换手续费参与分红----分红参数 1开启 0 关闭',
  `no_series_feed` int(11) NULL DEFAULT NULL COMMENT '认证会员存在连续未喂养----冻结参数',
  `operation_limit` int(11) NULL DEFAULT NULL COMMENT '自动限制账号操作限制-----冻结参数',
  `frozen_status` int(11) NULL DEFAULT NULL COMMENT '自动解除操作限制---冻结参数   0 关闭 1开启',
  `regist_user_reward` int(11) NULL DEFAULT NULL COMMENT '注册成为认证会员奖励动物----奖励参数  1开启 0 关闭',
  `zoon_id` int(11) NULL DEFAULT NULL COMMENT '奖励动物---奖励参数',
  `zoon_num` int(11) NULL DEFAULT NULL COMMENT '奖励动物数量----奖励参数',
  `zhi_hos` int(11) NULL DEFAULT NULL COMMENT '直推认证会员奖励推荐人共识度-----奖励参数',
  `zhi_yield` int(11) NULL DEFAULT NULL COMMENT '直推认证会员奖励推荐人产量----奖励参数',
  `yield_day` int(11) NULL DEFAULT NULL COMMENT '产量--分天发放为__天----奖励参数',
  `yield_day_num` decimal(11, 0) NULL DEFAULT NULL COMMENT '产量--每天奖励__个-----奖励参数',
  `must_series_feed` int(11) NULL DEFAULT NULL COMMENT '产量--所推荐的认证会员是否每天必须坚持喂养才给奖励----奖励参数  0无需满足  1必须满足',
  `regist_prev_consensus` int(11) NULL DEFAULT NULL COMMENT '新注册认证会员都要奖励所有上级被推荐人共识度---奖励参数',
  `prev_limit` int(11) NULL DEFAULT NULL COMMENT '上级推荐人层级限制---奖励参数  不限制  10 - 30级',
  `zhi_buy_yield` int(11) NULL DEFAULT NULL COMMENT '直推认证会员购买动物-所购买动物所需产量----奖励参数',
  `feed_zoon_reward` int(11) NULL DEFAULT NULL COMMENT '按照当前自己农场中最高动物等级养殖所需的产量给予奖励---奖励参数',
  `steal_egg` int(11) NULL DEFAULT NULL COMMENT '偷取鸡蛋条件---奖励参数  1当前养殖数量大于等于被偷好友 0 不限',
  `zoon_day_yield1` int(11) NULL DEFAULT NULL COMMENT '偷取养殖周期内的产量数量为当前被偷动物日产量的---奖励参数',
  `zoon_day_yield2` int(11) NULL DEFAULT NULL COMMENT '被偷的动物等级大于当前自己养殖的动物级别，此时数量为被偷动物日产量的----奖励参数',
  `xuni_show` int(11) NULL DEFAULT NULL COMMENT '虚拟会员数据是否开启前端显示---虚拟会员  1开启 0 关闭',
  `auto_xuni_start` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日自动生成虚拟会员的开始时间----虚拟会员',
  `auto_xuni_end` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日自动生成虚拟会员的结束时间----虚拟会员',
  `auto_create_num1` int(11) NULL DEFAULT NULL COMMENT '每分钟自动生成虚拟会员数量随机  开始---虚拟会员',
  `auto_create_num2` int(11) NULL DEFAULT NULL COMMENT '每分钟自动生成虚拟会员数量随机  结束---虚拟会员'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_sys
-- ----------------------------
INSERT INTO `tplay_sys` VALUES (1, 1000, '今日注册人数已满，请明日再来注册！', '11:00:00', '21:00:00', '请到开放注册时间来注册！', 'https://www.baidu.com', 10, 0, 30, 3, 10, 1, '系统注册人数已满，暂时无法注册新会员，感谢您的理解与支持！', 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, '09:00:00', 1, 1, 10, 10, 1, 1, 2, 1, 1, 1, 10, 0, 0, 0, 30, 5, 5, 1, 5, 3, 1, '09:00:00', '21:00:00', 0, 0);

-- ----------------------------
-- Table structure for tplay_trend
-- ----------------------------
DROP TABLE IF EXISTS `tplay_trend`;
CREATE TABLE `tplay_trend`  (
  `time1` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '9:00:00-10:00:00',
  `time2` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '10:00:00-11:00:00',
  `time3` decimal(11, 2) NULL DEFAULT NULL COMMENT '11:00:00-12:00:00',
  `time4` decimal(11, 2) NULL DEFAULT NULL COMMENT '12:00:00-13:00:00',
  `time5` decimal(11, 2) NULL DEFAULT NULL COMMENT '13:00:00-14:00:00',
  `time6` decimal(11, 2) NULL DEFAULT NULL COMMENT '14:00:00-15:00:00',
  `time7` decimal(11, 2) NULL DEFAULT NULL COMMENT '15:00:00-16:00:00',
  `time8` decimal(11, 2) NULL DEFAULT NULL COMMENT '16:00:00-17:00:00',
  `time9` decimal(11, 2) NULL DEFAULT NULL COMMENT '17:00:00-18:00:00',
  `time10` decimal(11, 2) NULL DEFAULT NULL COMMENT '18:00:00-19:00:00',
  `time11` decimal(11, 2) NULL DEFAULT NULL COMMENT '19:00:00-20:00:00',
  `time12` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '20:00:00-21:00:00\r\n',
  `update_time` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_trend
-- ----------------------------
INSERT INTO `tplay_trend` VALUES (1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, 1.00, '1599643317', '1599643317');

-- ----------------------------
-- Table structure for tplay_urlconfig
-- ----------------------------
DROP TABLE IF EXISTS `tplay_urlconfig`;
CREATE TABLE `tplay_urlconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aliases` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '想要设置的别名',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原url结构',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0禁用1使用',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_urlconfig
-- ----------------------------
INSERT INTO `tplay_urlconfig` VALUES (1, 'admin_login', 'admin/common/login', '后台登录地址。', 0, 1517621629, 1517621629);

-- ----------------------------
-- Table structure for tplay_users
-- ----------------------------
DROP TABLE IF EXISTS `tplay_users`;
CREATE TABLE `tplay_users`  (
  `id` int(111) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_grade_id` int(11) NULL DEFAULT 1 COMMENT '会员等级',
  `users_level_id` int(11) NULL DEFAULT 1 COMMENT '会员级别',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '会员头像',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册手机号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录密码',
  `paypass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付密码',
  `operation_limit` enum('正常','限制') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常' COMMENT '操作限制',
  `operation_limit_duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '限制时长',
  `operation_limit_reasons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '限制原因',
  `login_limit` enum('正常','限制') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常' COMMENT '登录限制',
  `login_limit_duration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '限制时长',
  `login_limit_reasons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '限制原因',
  `shed_num` int(255) NULL DEFAULT 0 COMMENT '棚圈总数',
  `consensus` int(255) NULL DEFAULT 0 COMMENT '共识度',
  `credit` int(255) NULL DEFAULT 100 COMMENT '信誉分',
  `eggs` decimal(60, 4) NULL DEFAULT 0.0000 COMMENT '产量  鸡蛋数量',
  `use_hos` decimal(60, 4) NULL DEFAULT 0.0000 COMMENT '可用HOS',
  `frozen_hos` decimal(60, 4) NULL DEFAULT 0.0000 COMMENT '冻结HOS',
  `feed` int(255) NULL DEFAULT 0 COMMENT '饲料',
  `onekey_steal` int(255) NULL DEFAULT 0 COMMENT '一键偷取',
  `dogs` int(255) NULL DEFAULT 0 COMMENT '看门狗',
  `coupon_50` int(255) NULL DEFAULT 0 COMMENT '代金券50产量',
  `coupon_200` int(255) NULL DEFAULT 0 COMMENT '代金券200产量',
  `coupon_600` int(255) NULL DEFAULT 0 COMMENT '代金券600产量',
  `recommended` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '被推荐',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册时间',
  `register_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册ip',
  `num` int(11) NULL DEFAULT NULL COMMENT '层数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `nickname`(`nickname`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_users
-- ----------------------------
INSERT INTO `tplay_users` VALUES (1, 1, 1, '\\uploads\\admin\\admin_thumb\\20180104\\79811855a6c06de53047471c4ff82a36.jpg', 'yale', '15098981213', '123456', '123456', '正常', '', '', '正常', '', '', 0, 0, 0, 99998.0000, 0.0000, 0.0000, 0, 0, 1, 0, 0, 0, '', '1600054560', '', NULL);
INSERT INTO `tplay_users` VALUES (2, 1, 1, '\\20180104\\79811855a6c06de53047471c4ff82a36.jpg', 'yale1', '15098971232', '123456', '123456', '限制', '2020-08-28', '', '限制', '2020-08-28', '', 0, 0, 0, 0.0000, 0.0000, 0.0000, 0, 0, 1, 0, 0, 0, '15098981213', '1600054560', '127.0.0.1', NULL);
INSERT INTO `tplay_users` VALUES (3, 1, 1, '\\uploads\\admin\\admin_thumb\\20180104\\79811855a6c06de53047471c4ff82a36.jpg', 'hoaodifa', '18812033333', '123456', '123456', '正常', '', '', '正常', '', '', 0, 0, 0, 0.0000, 0.0000, 0.0000, 0, 0, 1, 0, 0, 0, '15098981213', '1600054560', '127.0.0.1', NULL);
INSERT INTO `tplay_users` VALUES (4, 1, 1, '/uploads/admin/admin_thumb/20200912/0d09070e8fb2af46927563e4b7563379.jpg', '1111', '15098971213', '111111', '111111', '正常', '', '', '正常', '', '', 0, 0, 0, 0.0000, 0.0000, 0.0000, 0, 0, 1, 0, 0, 0, '18812033333', '1600063959', '', NULL);

-- ----------------------------
-- Table structure for tplay_users_grade
-- ----------------------------
DROP TABLE IF EXISTS `tplay_users_grade`;
CREATE TABLE `tplay_users_grade`  (
  `id` int(111) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `real_name` enum('未实名','已实名','无需求') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实名认证',
  `alipay` enum('未认证','已认证','无需求') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付认证',
  `bank_card` enum('未认证','已认证','无需求') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行认证',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_users_grade
-- ----------------------------
INSERT INTO `tplay_users_grade` VALUES (1, '普通会员', '未实名', '无需求', '无需求');
INSERT INTO `tplay_users_grade` VALUES (2, '认证会员', '已实名', '无需求', '无需求');

-- ----------------------------
-- Table structure for tplay_users_level
-- ----------------------------
DROP TABLE IF EXISTS `tplay_users_level`;
CREATE TABLE `tplay_users_level`  (
  `id` int(111) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `consensus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '共识度',
  `bonus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全网分红',
  `change_service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '置换手续费',
  `transfer_service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转让手续费',
  `upgrade_give` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '升级赠送动物',
  `relieve_operation_yield` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解除操作产量',
  `limit_wantbuy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每天限制求购',
  `wantbuy_yield` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每次求购产量',
  `limit_sell_out` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每天限制卖出',
  `cumulative_sell_out` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每天累计卖出',
  `push` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '直推总人数,并且满足直推,会员级别',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `1`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_users_level
-- ----------------------------
INSERT INTO `tplay_users_level` VALUES (1, 'H0', '', '', '40', '1', '0,,', '1', '1', '1,1', '1', '1', ',,0');
INSERT INTO `tplay_users_level` VALUES (3, 'H1', '200', '15', '30', '30', '1,柴火鸡,1', '5', '1', '1,100', '2', '1000', '4,0,1');
INSERT INTO `tplay_users_level` VALUES (4, 'H2', '2000', '12', '28', '28', '2,原野鸡,1', '10', '1', '1,1000', '3', '1000', '9,3,3');
INSERT INTO `tplay_users_level` VALUES (5, 'H3', '10000', '10', '25', '25', '3,乌骨鸡,1', '50', '1', '1,1000', '4', '1000', '12,3,4');
INSERT INTO `tplay_users_level` VALUES (6, 'H4', '50000', '8', '23', '23', '4,珍珠鸡,1', '100', '1', '1,1000', '5', '1000', '30,3,5');
INSERT INTO `tplay_users_level` VALUES (7, 'H5', '200000', '5', '20', '20', '5,孔雀鸡,1', '500', '1', '1,1000', '6', '1000', '50,3,6');

-- ----------------------------
-- Table structure for tplay_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `tplay_warehouse`;
CREATE TABLE `tplay_warehouse`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `zoon_id` int(11) NULL DEFAULT NULL COMMENT '动物id',
  `num` int(11) NULL DEFAULT NULL COMMENT '动物数量',
  `method` enum('购买','赠送') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获取方式,购买,赠送',
  `create_time` varchar(111) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tplay_webconfig
-- ----------------------------
DROP TABLE IF EXISTS `tplay_webconfig`;
CREATE TABLE `tplay_webconfig`  (
  `web` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站配置标识',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '关键词',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `is_log` int(1) NOT NULL DEFAULT 1 COMMENT '1开启日志0关闭',
  `file_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '允许上传的类型',
  `file_size` bigint(20) NULL DEFAULT NULL COMMENT '允许上传的最大值',
  `statistics` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '统计代码',
  `black_ip` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ip黑名单',
  `url_suffix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url伪静态后缀',
  INDEX `web`(`web`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_webconfig
-- ----------------------------
INSERT INTO `tplay_webconfig` VALUES ('web', '和谐农场', 'Tplay,后台管理,thinkphp5,layui', 'Tplay是一款基于ThinkPHP5.0.12 + layui2.2.45 + ECharts + Mysql开发的后台管理框架，集成了一般应用所必须的基础性功能，为开发者节省大量的时间。', 1, 'jpg,png,gif,mp4,zip,jpeg,mp3', 500000, '', '', NULL);

-- ----------------------------
-- Table structure for tplay_zhuanrang
-- ----------------------------
DROP TABLE IF EXISTS `tplay_zhuanrang`;
CREATE TABLE `tplay_zhuanrang`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NULL DEFAULT NULL COMMENT '转让人ID',
  `eggs` decimal(65, 4) NULL DEFAULT NULL COMMENT '转让鸡蛋数量',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转让人的手机号',
  `create_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转让时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_zhuanrang
-- ----------------------------
INSERT INTO `tplay_zhuanrang` VALUES (1, 1, 1.0000, '18812033333', '1600138281');
INSERT INTO `tplay_zhuanrang` VALUES (2, 1, 1.0000, '18812033333', '1600138334');

-- ----------------------------
-- Table structure for tplay_zoon
-- ----------------------------
DROP TABLE IF EXISTS `tplay_zoon`;
CREATE TABLE `tplay_zoon`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sort` int(111) NULL DEFAULT NULL COMMENT '排序',
  `zoonlevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物级别',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动物名称',
  `buyoutput` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买所需产量',
  `breed_cycle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '养殖周期',
  `day_yield` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '每日产量',
  `inc_consensus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买增加奖励共识度',
  `dec_consensus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '养殖结束减少共识度',
  `max_breed_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最大养殖数量',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '静态图标',
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `排序`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tplay_zoon
-- ----------------------------
INSERT INTO `tplay_zoon` VALUES (1, 0, '一', '柴火鸡', '10', '30', '0.50', '1', '1', '6', '\\uploads\\admin\\info_thumb\\20200826\\63e5eae0c2e1119f190726ca22ce7c5d.jpg', '1598423769');
INSERT INTO `tplay_zoon` VALUES (2, 1, '二', '原野鸡', '100', '30', '5.50', '10', '10', '3', '\\uploads\\admin\\info_thumb\\20200826\\b85394a49d38928caf68a9bbceefb45e.jpg', '1598424803');
INSERT INTO `tplay_zoon` VALUES (3, 2, '三', '乌骨鸡', '500', '30', '26.00', '50', '50', '3', '\\uploads\\admin\\info_thumb\\20200826\\e8d7e09052e93112fed665bf6b9bbe33.jpg', '1598425072');
INSERT INTO `tplay_zoon` VALUES (4, 3, '四', '珍珠鸡', '55.00', '30', '1000', '100', '100', '2', '\\uploads\\admin\\info_thumb\\20200826\\f84ded7f602dc7d57096e1d0a13865cb.jpg', '1598425282');
INSERT INTO `tplay_zoon` VALUES (5, 4, '五', '孔雀鸡', '5000', '30', '260.00', '500', '500', '1', '\\uploads\\admin\\info_thumb\\20200826\\90b51b966b6105ad79fd8c54562b3e44.jpg', '1598425387');

SET FOREIGN_KEY_CHECKS = 1;
