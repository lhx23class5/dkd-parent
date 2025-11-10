-- ----------------------------
-- 订单表
-- ----------------------------
DROP TABLE IF EXISTS tb_order;
CREATE TABLE tb_order (
  order_id          BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT '订单ID',
  order_no          VARCHAR(64)      NOT NULL                   COMMENT '订单编号',
  user_id           BIGINT(20)      DEFAULT NULL               COMMENT '用户ID',
  user_name         VARCHAR(50)      DEFAULT NULL               COMMENT '用户名称',
  total_amount       DECIMAL(10,2)   NOT NULL                   COMMENT '订单总金额',
  pay_amount        DECIMAL(10,2)   NOT NULL                   COMMENT '实付金额',
  discount_amount   DECIMAL(10,2)   DEFAULT 0.00               COMMENT '优惠金额',
  order_status       TINYINT(1)      DEFAULT 1                  COMMENT '订单状态（1待支付 2已支付 3已取消 4已完成 5已退款）',
  pay_type          TINYINT(1)      DEFAULT NULL               COMMENT '支付方式（1微信 2支付宝 3现金）',
  pay_time          DATETIME         DEFAULT NULL               COMMENT '支付时间',
  delivery_time     DATETIME         DEFAULT NULL               COMMENT '出货时间',
  finish_time       DATETIME         DEFAULT NULL               COMMENT '完成时间',
  cancel_time       DATETIME         DEFAULT NULL               COMMENT '取消时间',
  cancel_reason     VARCHAR(255)     DEFAULT NULL               COMMENT '取消原因',
  vm_id             BIGINT(20)      DEFAULT NULL               COMMENT '售货机ID',
  vm_inner_code     VARCHAR(64)      DEFAULT NULL               COMMENT '售货机编号',
  vm_addr           VARCHAR(255)     DEFAULT NULL               COMMENT '售货机地址',
  region_id         BIGINT(20)      DEFAULT NULL               COMMENT '区域ID',
  region_name       VARCHAR(100)     DEFAULT NULL               COMMENT '区域名称',
  partner_id        BIGINT(20)      DEFAULT NULL               COMMENT '合作商ID',
  partner_name      VARCHAR(100)     DEFAULT NULL               COMMENT '合作商名称',
  remark            VARCHAR(500)     DEFAULT NULL               COMMENT '备注',
  create_by         VARCHAR(64)      DEFAULT ''                 COMMENT '创建者',
  create_time       DATETIME                                   COMMENT '创建时间',
  update_by         VARCHAR(64)      DEFAULT ''                 COMMENT '更新者',
  update_time       DATETIME                                   COMMENT '更新时间',
  PRIMARY KEY (order_id),
  UNIQUE KEY uk_order_no (order_no),
  KEY idx_user_id (user_id),
  KEY idx_order_status (order_status),
  KEY idx_create_time (create_time),
  KEY idx_vm_id (vm_id)
) ENGINE=INNODB AUTO_INCREMENT=1 COMMENT = '订单表';

-- ----------------------------
-- 订单详情表
-- ----------------------------
DROP TABLE IF EXISTS tb_order_details;
CREATE TABLE tb_order_details (
  detail_id         BIGINT(20)      NOT NULL AUTO_INCREMENT    COMMENT '详情ID',
  order_id          BIGINT(20)      NOT NULL                   COMMENT '订单ID',
  sku_id            BIGINT(20)      NOT NULL                   COMMENT '商品ID',
  sku_name          VARCHAR(100)     NOT NULL                   COMMENT '商品名称',
  sku_image         VARCHAR(255)     DEFAULT NULL               COMMENT '商品图片',
  price             DECIMAL(10,2)   NOT NULL                   COMMENT '商品单价',
  quantity          INT(10)         NOT NULL                   COMMENT '购买数量',
  total_amount      DECIMAL(10,2)   NOT NULL                   COMMENT '小计金额',
  create_time       DATETIME                                   COMMENT '创建时间',
  PRIMARY KEY (detail_id),
  KEY idx_order_id (order_id),
  KEY idx_sku_id (sku_id)
) ENGINE=INNODB AUTO_INCREMENT=1 COMMENT = '订单详情表';

-- ----------------------------
-- 初始化订单状态字典
-- ----------------------------
INSERT INTO sys_dict_type VALUES(11, '订单状态', 'order_status', '0', 'admin', NOW(), '', NULL, '订单状态列表');

INSERT INTO sys_dict_data VALUES(30, 1,  '待支付',    '1', 'order_status', '', 'warning',  'N', '0', 'admin', NOW(), '', NULL, '订单状态-待支付');
INSERT INTO sys_dict_data VALUES(31, 2,  '已支付',    '2', 'order_status', '', 'primary', 'N', '0', 'admin', NOW(), '', NULL, '订单状态-已支付');
INSERT INTO sys_dict_data VALUES(32, 3,  '已取消',    '3', 'order_status', '', 'info',     'N', '0', 'admin', NOW(), '', NULL, '订单状态-已取消');
INSERT INTO sys_dict_data VALUES(33, 4,  '已完成',    '4', 'order_status', '', 'success', 'N', '0', 'admin', NOW(), '', NULL, '订单状态-已完成');
INSERT INTO sys_dict_data VALUES(34, 5,  '已退款',    '5', 'order_status', '', 'danger',  'N', '0', 'admin', NOW(), '', NULL, '订单状态-已退款');

-- ----------------------------
-- 初始化支付方式字典
-- ----------------------------
INSERT INTO sys_dict_type VALUES(12, '支付方式', 'pay_type', '0', 'admin', NOW(), '', NULL, '支付方式列表');

INSERT INTO sys_dict_data VALUES(35, 1,  '微信支付',   '1', 'pay_type', '', 'primary', 'N', '0', 'admin', NOW(), '', NULL, '支付方式-微信');
INSERT INTO sys_dict_data VALUES(36, 2,  '支付宝',     '2', 'pay_type', '', 'primary', 'N', '0', 'admin', NOW(), '', NULL, '支付方式-支付宝');
INSERT INTO sys_dict_data VALUES(37, 3,  '现金',       '3', 'pay_type', '', 'primary', 'N', '0', 'admin', NOW(), '', NULL, '支付方式-现金');