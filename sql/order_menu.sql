-- ----------------------------
-- 订单管理菜单
-- ----------------------------

-- 一级菜单 - 帝可得管理
INSERT INTO sys_menu VALUES('5', '帝可得管理', '0', '15', 'manage', null, '', 1, 0, 'M', '0', '0', '', 'shopping-cart', 'admin', NOW(), '', NULL, '帝可得管理目录');

-- 二级菜单 - 订单管理
INSERT INTO sys_menu VALUES('2000', '订单管理', '5', '1', 'order', 'manage/order/index', '', 1, 0, 'C', '0', '0', 'manage:order:list', 'list', 'admin', NOW(), '', NULL, '订单管理菜单');

-- 订单管理按钮
INSERT INTO sys_menu VALUES('2001', '订单查询', '2000', '1', '', '', '', 1, 0, 'F', '0', '0', 'manage:order:query', '#', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_menu VALUES('2002', '订单新增', '2000', '2', '', '', '', 1, 0, 'F', '0', '0', 'manage:order:add', '#', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_menu VALUES('2003', '订单修改', '2000', '3', '', '', '', 1, 0, 'F', '0', '0', 'manage:order:edit', '#', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_menu VALUES('2004', '订单删除', '2000', '4', '', '', '', 1, 0, 'F', '0', '0', 'manage:order:remove', '#', 'admin', NOW(), '', NULL, '');
INSERT INTO sys_menu VALUES('2005', '订单导出', '2000', '5', '', '', '', 1, 0, 'F', '0', '0', 'manage:order:export', '#', 'admin', NOW(), '', NULL, '');

-- 给管理员角色分配订单管理权限
INSERT INTO sys_role_menu VALUES ('1', '5');
INSERT INTO sys_role_menu VALUES ('1', '2000');
INSERT INTO sys_role_menu VALUES ('1', '2001');
INSERT INTO sys_role_menu VALUES ('1', '2002');
INSERT INTO sys_role_menu VALUES ('1', '2003');
INSERT INTO sys_role_menu VALUES ('1', '2004');
INSERT INTO sys_role_menu VALUES ('1', '2005');