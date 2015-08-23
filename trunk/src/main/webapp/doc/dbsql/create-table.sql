/************************************************************************ 系统模块 开始 ************************************************************************/
--系统流水号
drop table if exists sys_sequence;
create table sys_sequence (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	seq_name varchar(50) not null comment '序列名称',
	seq_value int not null comment '序列值',
	caption varchar(255) not null comment '备注',
	constraint pk_sequence_id primary key (id),
	constraint un_sequence_name unique (seq_name)
) engine=innodb default charset=utf8;
alter table sys_sequence comment '系统流水号';

--系统附件
drop table if exists accessory;
create table accessory (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	data_sort tinyint not null comment '数据分类',
	data_id bigint not null comment '数据ID',
	data_name varchar(255) not null comment '附件原始名称',
	path varchar(255) not null comment '附件上传路径',
	constraint pk_accessory_id primary key (id)
) engine=innodb default charset=utf8;
alter table accessory comment '系统附件';

--系统字典项
drop table if exists dictionary;
create table dictionary (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	sort tinyint not null comment '分类',
	name varchar(50) not null comment '名称',
	code tinyint not null comment '编号',
	caption varchar(255) not null comment '附件上传路径',
	constraint pk_dictionary_id primary key (id),
	constraint un_dict_namecode unique (name,code)
) engine=innodb default charset=utf8;
alter table dictionary comment '系统字典项';

--审核意见
drop table if exists audit_mind;
create table audit_mind (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	data_sort tinyint not null comment '分类',
	data_id bigint not null comment '记录ID',
	audit_id bigint not null comment '审核人ID',
	auditor varchar(20) not null comment '审核人',
	audit_mind varchar(255) not null comment '审核意见',
	audit_time datetime not null comment '审核日期',
	audit_state tinyint not null comment '审核状态',
	constraint pk_mind_id primary key (id)
) engine=innodb default charset=utf8;
alter table audit_mind comment '审核意见';

--地区
drop table if exists area;
create table area (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	code varchar(10) not null comment '编号',
	name varchar(50) not null comment '名称',
	fk_area_id bigint comment '名称',
	constraint pk_area_id primary key (id),
	constraint un_area_code unique (code),
	constraint fk_area_area foreign key (fk_area_id) 
		references area (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table area comment '地区';

--系统菜单
drop table if exists menu;
create table menu (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	title varchar(50) not null comment '标题',
	name varchar(50) not null comment '名称',
	href varchar(255) comment '地址',
	fk_menu_id bigint comment '所属菜单',
	constraint pk_menu_id primary key (id),
	constraint un_menu_code unique (name),
	constraint fk_menu_menu foreign key (fk_menu_id) 
		references menu (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table menu comment '系统菜单';

--系统角色
drop table if exists role;
create table role (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	title varchar(50) not null comment '标题',
	name varchar(50) not null comment '名称',
	caption varchar(255) comment '备注',
	constraint pk_role_id primary key (id),
	constraint un_role_code unique (name)
) engine=innodb default charset=utf8;
alter table role comment '系统角色';

--角色菜单
drop table if exists role_menu;
create table role_menu (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_role_id bigint not null comment '角色',
	fk_menu_id bigint not null comment '菜单',
	constraint pk_rolemenu_id primary key (id),
	constraint fk_role_rolemenu foreign key (fk_role_id) 
		references role (id) on delete restrict on update restrict,
	constraint fk_menu_rolemenu foreign key (fk_menu_id) 
		references menu (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table role_menu comment '角色菜单';

--部门
drop table if exists department;
create table department (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	code char(4) not null comment '编号',
	name varchar(50) not null comment '名称',
	constraint pk_department_id primary key (id),
	constraint un_department_code unique (code)
) engine=innodb default charset=utf8;
alter table department comment '部门';

--员工
drop table if exists employee;
create table employee (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_department_id bigint not null comment '部门',
	username varchar(50) not null comment '用户',
	password char(32) not null comment '密码',
	realname varchar(20) not null comment '姓名',
	code char(10) not null comment '编号',
	fk_duty_id bigint not null comment '职务',
	idcard char(18) not null comment '身份证号',
	born date comment '出生日期',
	fk_nation_id bigint comment '民族',
	phone varchar(20) comment '电话',
	mobile char(11) comment '手机',
	fk_province_id bigint comment '省',
	fk_city_id bigint comment '市',
	fk_town_id bigint comment '区',
	address varchar(50) comment '地址',
	zip char(6) comment '邮编',
	constraint pk_employee_id primary key (id),
	constraint un_employee_code unique (code),
	constraint un_employee_username unique (username),
	constraint un_employee_idcard unique (idcard),
	constraint fk_depart_employee foreign key (fk_department_id) 
		references department (id) on delete restrict on update restrict,
	constraint fk_duty_employee foreign key (fk_duty_id) 
		references dictionary (id) on delete restrict on update restrict,
	constraint fk_nation_employee foreign key (fk_nation_id) 
		references dictionary (id) on delete restrict on update restrict,
	constraint fk_prov_emp foreign key (fk_province_id) 
		references area (id) on delete restrict on update restrict,
	constraint fk_city_emp foreign key (fk_city_id) 
		references area (id) on delete restrict on update restrict,
	constraint fk_town_emp foreign key (fk_town_id) 
		references area (id) on delete restrict on update restrict	
) engine=innodb default charset=utf8;
alter table employee comment '员工';

--员工角色
drop table if exists employee_role;
create table employee_role (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_role_id bigint not null comment '角色',
	fk_employee_id bigint not null comment '员工',
	constraint pk_emprole_id primary key (id),
	constraint fk_role_emprole foreign key (fk_role_id) 
		references role (id) on delete restrict on update restrict,
	constraint fk_employee_emprole foreign key (fk_employee_id) 
		references employee (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table employee_role comment '员工角色';

--客户供应商
drop table if exists customer;
create table customer (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	name varchar(50) not null comment '名称',
	sort tinyint not null comment '类别，1：客户，2：供应商，3：其他',
	fk_grade_id bigint comment '级别',
	fk_genre_id bigint comment '类型',
	phone varchar(20) not null comment '电话',
	fax varchar(20) comment '传真',
	fk_province_id bigint comment '省',
	fk_city_id bigint comment '市',
	fk_town_id bigint comment '镇',
	address varchar(50) comment '地址',
	zip char(6) comment '邮编',
	email varchar(50) comment '邮箱',
	website varchar(255) comment '网站',
	constraint pk_customer_id primary key (id),
	constraint fk_grade_customer foreign key (fk_grade_id) 
		references dictionary (id) on delete restrict on update restrict,
	constraint fk_genre_customer foreign key (fk_genre_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table customer comment '客户供应商';

--联系人
drop table if exists linkman;
create table linkman (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_customer_id bigint not null comment '所属客户供应商',
	realname varchar(20) not null comment '姓名',
	duty varchar(20)  comment '职务',
	department varchar(20) comment '部门',
	phone varchar(20) comment '部门',
	email varchar(50) comment '邮箱',
	qq varchar(30) comment 'QQ',
	mobile varchar(20) comment '手机',
	isdef bit default 0 comment '是否默认',
	constraint pk_linkman_id primary key (id),
	constraint fk_customer_linkman foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table linkman comment '联系人';

--系统分类
drop table if exists category;
create table category (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_sort_id bigint not null comment '类别',
	code int not null comment '编号',
	name varchar(50) not null comment '名称',
	fk_category_id bigint comment '所属分类',
	constraint pk_category_id primary key (id),
	constraint fk_sort_category foreign key (fk_sort_id) 
		references dictionary (id) on delete restrict on update restrict,
	constraint fk_category_category foreign key (fk_category_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table category comment '系统分类';

--物料
drop table if exists material;
create table material (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_category_id bigint not null comment '分类',
	name varchar(50) not null comment '名称',
	code varchar(30) comment '型号',
	spec varchar(30) comment '规格',
	unit varchar(10) comment '单位',
	brand varchar(20) comment '品牌',
	color varchar(20) comment '颜色',
	price float comment '参考价',
	picture varchar(255) comment '图样',
	constraint pk_material_id primary key (id),
	constraint fk_category_material foreign key (fk_category_id) 
		references category (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material comment '物料';

--客户供应商物料价格
drop table if exists customer_material;
create table customer_material (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_customer_id bigint not null comment '客户供应商',
	fk_material_id bigint not null comment '物料',
	price float not null commnet '价格',
	constraint pk_custmate_id primary key (id),
	constraint fk_customer_custmate foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict,
	constraint fk_material_custmate foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table customer_material comment '客户供应商物料价格';

--产品
drop table if exists product;
create table product (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_category_id bigint not null comment '分类',
	fk_customer_id bigint comment '客户',
	name varchar(50) not null comment '名称',
	code varchar(30) comment '编号',
	size varchar(10) comment '规格',
	color varchar(20) comment '颜色',
	unit varchar(10) comment '单位',
	price float comment '参考价',
	picture varchar(255) comment '图样',
	constraint pk_product_id primary key (id),
	constraint fk_category_product foreign key (fk_category_id) 
		references category (id) on delete restrict on update restrict,
	constraint fk_customer_product foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product comment '产品';
/************************************************************************ 系统模块 结束 ************************************************************************/

/************************************************************************ 采购模块 开始 ************************************************************************/
--物料采购询价
drop table if exists buy_ask;
create table buy_ask (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_provider_id bigint not null comment '供应商',
	code char(10) not null comment '编号',
	total float null comment '总额',
	caption varchar(255) comment '备注',
	add_id bigint comment '添加人',
	add_date datetime comment '添加日期',
	autdit_id bigint comment '审核人',
	autdit_date datetime comment '审核日期',
	autdit_state tinyint default 0 comment '审核状态',
	constraint pk_buyask_id primary key (id),
	constraint un_buyask_code unique (code),
	constraint fk_provider_buyask foreign key (fk_provider_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_ask comment '物料采购询价';

--物料采购询价明细
drop table if exists buy_ask_list;
create table buy_ask_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_ask_id bigint not null comment '报价单',
	fk_material_id bigint not null comment '物料',
	amount float not null comment '数量',
	total float null comment '金额',
	caption varchar(255) comment '备注',
	constraint pk_buyasklist_id primary key (id),
	constraint fk_ask_buyasklist foreign key (fk_ask_id) 
		references buy_ask (id) on delete restrict on update restrict,
	constraint fk_material_buyasklist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_ask_list comment '物料采购询价明细';

--物料采购入库
drop table if exists buy_input;
create table buy_input (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_provider_id bigint not null comment '供应商',
	fk_ticket_id bigint not null comment '票据类型',
	code char(10) not null comment '编号',
	total float null comment '应付金额',
	payfor float null comment '已付金额',
	nopay float null comment '未付金额',
	fact float null comment '实付金额',
	caption varchar(255) comment '备注',
	add_id bigint comment '添加人',
	add_date datetime comment '添加日期',
	autdit_id bigint comment '审核人',
	autdit_date datetime comment '审核日期',
	autdit_state tinyint default 0 comment '审核状态',
	constraint pk_buyinput_id primary key (id),
	constraint un_buyinput_code unique (code),
	constraint fk_provider_buyinput foreign key (fk_provider_id) 
		references customer (id) on delete restrict on update restrict,
	constraint fk_ticket_buyinput foreign key (fk_ticket_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_input comment '物料采购入库';

--物料采购入库明细
drop table if exists buy_input_list;
create table buy_input_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_input_id bigint not null comment '报价单',
	fk_material_id bigint not null comment '物料',
	amount float not null comment '数量',
	total float null comment '金额',
	caption varchar(255) comment '备注',
	constraint pk_buyinputlist_id primary key (id),
	constraint fk_input_buyinputlist foreign key (fk_input_id) 
		references buy_input (id) on delete restrict on update restrict,
	constraint fk_material_buyinputlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_input_list comment '物料采购入库明细';

--物料采购退回
drop table if exists buy_output;
create table buy_output (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_provider_id bigint not null comment '供应商',
	code char(10) not null comment '编号',
	total float null comment '应付金额',
	payfor float null comment '已付金额',
	nopay float null comment '未付金额',
	fact float null comment '实付金额',
	caption varchar(255) comment '备注',
	add_id bigint comment '添加人',
	add_date datetime comment '添加日期',
	autdit_id bigint comment '审核人',
	autdit_date datetime comment '审核日期',
	autdit_state tinyint default 0 comment '审核状态',
	constraint pk_buyoutput_id primary key (id),
	constraint un_buyoutput_code unique (code),
	constraint fk_provider_buyoutput foreign key (fk_provider_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_output comment '物料采购退回';

--物料采购退回明细
drop table if exists buy_output_list;
create table buy_output_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_output_id bigint not null comment '报价单',
	fk_material_id bigint not null comment '物料',
	amount float not null comment '数量',
	total float null comment '金额',
	caption varchar(255) comment '备注',
	constraint pk_buyoutputlist_id primary key (id),
	constraint fk_output_buyoutputlist foreign key (fk_output_id) 
		references buy_output (id) on delete restrict on update restrict,
	constraint fk_material_buyoutputlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_output_list comment '物料采购退回明细';
/************************************************************************ 采购模块 结束 ************************************************************************/

/************************************************************************ 销售模块 开始 ************************************************************************/
--销售报价
drop table if exists sell_ask;
create table sell_ask (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_customer_id bigint not null comment '客户',
	code char(10) not null comment '编号',
	total float null comment '总额',
	caption varchar(255) comment '备注',
	add_id bigint comment '添加人',
	add_date datetime comment '添加日期',
	autdit_id bigint comment '审核人',
	autdit_date datetime comment '审核日期',
	autdit_state tinyint default 0 comment '审核状态',
	constraint pk_sellask_id primary key (id),
	constraint un_sellask_code unique (code),
	constraint fk_customer_sellask foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_ask comment '销售报价';

--销售报价明细
drop table if exists sell_ask_list;
create table sell_ask_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_ask_id bigint not null comment '报价单',
	fk_product_id bigint not null comment '物料',
	amount float not null comment '数量',
	total float null comment '金额',
	caption varchar(255) comment '备注',
	constraint pk_buyasklist_id primary key (id),
	constraint fk_ask_sellasklist foreign key (fk_ask_id) 
		references sell_ask (id) on delete restrict on update restrict,
	constraint fk_product_sellasklist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_ask_list comment '销售报价明细';

--销售订单
drop table if exists sell_order;
create table sell_order (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_customer_id bigint not null comment '客户',
	fk_ticket_id bigint not null comment '票据类型',
	code char(10) not null comment '编号',
	total float null comment '应收金额',
	payfor float null comment '已收金额',
	nopay float null comment '未收金额',
	fact float null comment '实收金额',
	caption varchar(255) comment '备注',
	add_id bigint comment '添加人',
	add_date datetime comment '添加日期',
	autdit_id bigint comment '审核人',
	autdit_date datetime comment '审核日期',
	autdit_state tinyint default 0 comment '审核状态',
	constraint pk_sellorder_id primary key (id),
	constraint un_sellorder_code unique (code),
	constraint fk_customer_sellorder foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict,
	constraint fk_ticket_sellorder foreign key (fk_ticket_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_order comment '销售订单';

--销售订单明细
drop table if exists sell_order_list;
create table sell_order_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_input_id bigint not null comment '报价单',
	fk_product_id bigint not null comment '产品',
	amount float not null comment '数量',
	total float null comment '金额',
	caption varchar(255) comment '备注',
	constraint pk_sellorderlist_id primary key (id),
	constraint fk_input_sellorderlist foreign key (fk_input_id) 
		references sell_order (id) on delete restrict on update restrict,
	constraint fk_product_sellorderlist foreign key (fk_product_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_order_list comment '销售订单明细';

--销售退回
drop table if exists sell_back;
create table sell_back (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_customer_id bigint not null comment '客户',
	code char(10) not null comment '编号',
	total float null comment '应退金额',
	payfor float null comment '已退金额',
	nopay float null comment '未退金额',
	fact float null comment '实退金额',
	caption varchar(255) comment '备注',
	add_id bigint comment '添加人',
	add_date datetime comment '添加日期',
	autdit_id bigint comment '审核人',
	autdit_date datetime comment '审核日期',
	autdit_state tinyint default 0 comment '审核状态',
	constraint pk_sellback_id primary key (id),
	constraint un_sellback_code unique (code),
	constraint fk_customer_sellback foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_back comment '销售退回';

--销售退回明细
drop table if exists sell_back_list;
create table sell_back_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_back_id bigint not null comment '报价单',
	fk_product_id bigint not null comment '产品',
	amount float not null comment '数量',
	total float null comment '金额',
	caption varchar(255) comment '备注',
	constraint pk_sellbacklist_id primary key (id),
	constraint fk_back_sellbacklist foreign key (fk_back_id) 
		references sell_back (id) on delete restrict on update restrict,
	constraint fk_product_sellbacklist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_back_list comment '销售退回明细';
/************************************************************************ 销售模块 结束 ************************************************************************/

/************************************************************************ 库存模块 开始 ************************************************************************/
--仓库
drop table if exists store;
create table store (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	code varchar(4) not null comment '备注',
	name varchar(20) not null comment '名称',
	caption varchar(255) comment '备注',
	constraint pk_store_id primary key (id),
	constraint un_store_code unique (code)
) engine=innodb default charset=utf8;
alter table store comment '仓库';

--物料库存
drop table if exists material_store;
create table material_store (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	fk_material_id bigint not null comment '物料',
	upper_limit float not null comment '上限',
	lower_limit float not null comment '下限',
	amount float not null comment '库存数',
	constraint pk_matestore_id primary key (id),
	constraint un_matestore_matestore unique (fk_store_id, fk_material_id),
	constraint fk_store_matestore foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict,
	constraint fk_material_matestore foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_store comment '物料库存';

--产品库存
drop table if exists product_store;
create table product_store (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	fk_product_id bigint not null comment '物料',
	upper_limit float not null comment '上限',
	lower_limit float not null comment '下限',
	amount float not null comment '库存数',
	constraint pk_matestore_id primary key (id),
	constraint un_matestore_matestore unique (fk_store_id, fk_product_id),
	constraint fk_store_matestore foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict,
	constraint fk_product_matestore foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_store comment '产品库存';

--物料盘点
drop table if exists material_check;
create table material_check (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_matechk_id primary key (id),
	constraint fk_store_matechk foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_check comment '物料盘点';

--物料盘点明细
drop table if exists material_check_list;
create table material_check_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '物料盘点单',
	fk_material_id bigint null comment '物料',
	book float not null comment '账本数',
	store float not null comment '库存数',
	reality float not null comment '实际数',
	constraint pk_matechklist_id primary key (id),
	constraint fk_check_matechklist foreign key (fk_check_id) 
		references material_check (id) on delete restrict on update restrict,
	constraint fk_material_matechklist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_check_list comment '物料盘点明细';

--物料入库
drop table if exists material_in;
create table material_in (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_matein_id primary key (id),
	constraint fk_store_matein foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_in comment '物料入库';

--物料入库明细
drop table if exists material_in_list;
create table material_in_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '物料入库单',
	fk_material_id bigint null comment '物料',
	amount float not null comment '数量',
	constraint pk_mateinlist_id primary key (id),
	constraint fk_check_mateinlist foreign key (fk_check_id) 
		references material_in (id) on delete restrict on update restrict,
	constraint fk_material_mateinlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_in_list comment '物料入库明细';

--物料出库
drop table if exists material_out;
create table material_out (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_mateout_id primary key (id),
	constraint fk_store_mateout foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_out comment '物料出库';

--物料出库明细
drop table if exists material_out_list;
create table material_out_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '物料出库单',
	fk_material_id bigint null comment '物料',
	amount float not null comment '数量',
	constraint pk_mateoutlist_id primary key (id),
	constraint fk_check_mateoutlist foreign key (fk_check_id) 
		references material_out (id) on delete restrict on update restrict,
	constraint fk_material_mateoutlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_out_list comment '物料出库明细';

--物料退回
drop table if exists material_back;
create table material_back (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_mateback_id primary key (id),
	constraint fk_store_mateback foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_back comment '物料退回';

--物料退回明细
drop table if exists material_back_list;
create table material_back_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '物料退回单',
	fk_material_id bigint null comment '物料',
	amount float not null comment '数量',
	constraint pk_matebacklist_id primary key (id),
	constraint fk_check_matebacklist foreign key (fk_check_id) 
		references material_back (id) on delete restrict on update restrict,
	constraint fk_material_matebacklist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_back_list comment '物料退回明细';

--物料损益
drop table if exists material_profit_loss;
create table material_profit_loss (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_mateprolos_id primary key (id),
	constraint fk_store_mateprolos foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_profit_loss comment '物料损益';

--物料损益明细
drop table if exists material_profit_loss_list;
create table material_profit_loss_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '物料损益单',
	fk_material_id bigint null comment '物料',
	amount float not null comment '数量',
	constraint pk_mateproloslist_id primary key (id),
	constraint fk_check_mateproloslist foreign key (fk_check_id) 
		references material_profit_loss (id) on delete restrict on update restrict,
	constraint fk_material_mateproloslist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_profit_loss_list comment '物料损益明细';

--物料库存调拨
drop table if exists material_adjust;
create table material_adjust (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_to_id bigint not null comment '调入仓库',
	fk_form_id bigint not null comment '调出仓库',
	constraint pk_mateadjust_id primary key (id),
	constraint fk_to_mateadjust foreign key (fk_to_id) 
		references store (id) on delete restrict on update restrict,
	constraint fk_from_mateadjust foreign key (fk_form_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_adjust comment '物料库存调拨';

--物料库存调拨明细
drop table if exists material_adjust_list;
create table material_adjust_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '物料库存调拨单',
	fk_material_id bigint null comment '物料',
	amount float not null comment '数量',
	constraint pk_mateadjustlist_id primary key (id),
	constraint fk_check_mateadjustlist foreign key (fk_check_id) 
		references material_adjust (id) on delete restrict on update restrict,
	constraint fk_material_mateadjustlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_adjust_list comment '物料库存调拨明细';

--产品盘点
drop table if exists product_check;
create table product_check (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_prochk_id primary key (id),
	constraint fk_store_prochk foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_check comment '产品盘点';

--产品盘点明细
drop table if exists product_check_list;
create table product_check_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '产品盘点单',
	fk_product_id bigint null comment '产品',
	book float not null comment '账本数',
	store float not null comment '库存数',
	reality float not null comment '实际数',
	constraint pk_prochklist_id primary key (id),
	constraint fk_check_prochklist foreign key (fk_check_id) 
		references product_check (id) on delete restrict on update restrict,
	constraint fk_product_prochklist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_check_list comment '产品盘点明细';

--产品入库
drop table if exists product_in;
create table product_in (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_proin_id primary key (id),
	constraint fk_store_proin foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_in comment '产品入库';

--产品入库明细
drop table if exists product_in_list;
create table product_in_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '产品入库单',
	fk_product_id bigint null comment '产品',
	amount float not null comment '数量',
	constraint pk_proinlist_id primary key (id),
	constraint fk_check_proinlist foreign key (fk_check_id) 
		references product_in (id) on delete restrict on update restrict,
	constraint fk_product_proinlist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_in_list comment '产品入库明细';

--产品出库
drop table if exists product_out;
create table product_out (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_proout_id primary key (id),
	constraint fk_store_proout foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_out comment '产品出库';

--产品出库明细
drop table if exists product_out_list;
create table product_out_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '产品出库单',
	fk_product_id bigint null comment '产品',
	amount float not null comment '数量',
	constraint pk_prooutlist_id primary key (id),
	constraint fk_check_prooutlist foreign key (fk_check_id) 
		references product_out (id) on delete restrict on update restrict,
	constraint fk_product_prooutlist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_out_list comment '产品出库明细';

--产品退回
drop table if exists product_back;
create table product_back (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_proback_id primary key (id),
	constraint fk_store_proback foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_back comment '产品退回';

--产品退回明细
drop table if exists product_back_list;
create table product_back_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '产品退回单',
	fk_product_id bigint null comment '产品',
	amount float not null comment '数量',
	constraint pk_probacklist_id primary key (id),
	constraint fk_check_probacklist foreign key (fk_check_id) 
		references product_back (id) on delete restrict on update restrict,
	constraint fk_product_probacklist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_back_list comment '产品退回明细';

--产品损益
drop table if exists product_profit_loss;
create table product_profit_loss (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_store_id bigint not null comment '仓库',
	constraint pk_proprolos_id primary key (id),
	constraint fk_store_proprolos foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_profit_loss comment '产品损益';

--产品损益明细
drop table if exists product_profit_loss_list;
create table product_profit_loss_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '产品损益单',
	fk_product_id bigint null comment '产品',
	amount float not null comment '数量',
	constraint pk_proproloslist_id primary key (id),
	constraint fk_check_proproloslist foreign key (fk_check_id) 
		references product_profit_loss (id) on delete restrict on update restrict,
	constraint fk_product_proproloslist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_profit_loss_list comment '产品损益明细';

--产品库存调拨
drop table if exists product_adjust;
create table product_adjust (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_to_id bigint not null comment '调入仓库',
	fk_form_id bigint not null comment '调出仓库',
	constraint pk_proadjust_id primary key (id),
	constraint fk_to_proadjust foreign key (fk_to_id) 
		references store (id) on delete restrict on update restrict,
	constraint fk_from_proadjust foreign key (fk_form_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_adjust comment '产品库存调拨';

--产品库存调拨明细
drop table if exists product_adjust_list;
create table product_adjust_list (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_check_id bigint null comment '产品库存调拨单',
	fk_product_id bigint null comment '产品',
	amount float not null comment '数量',
	constraint pk_proadjustlist_id primary key (id),
	constraint fk_check_proadjustlist foreign key (fk_check_id) 
		references product_adjust (id) on delete restrict on update restrict,
	constraint fk_product_proadjustlist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_adjust_list comment '产品库存调拨明细';
/************************************************************************ 库存模块 结束 ************************************************************************/

/************************************************************************ 生产加工模块 开始 ************************************************************************/
--工序
drop table if exists work;
create table work (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_category_id bigint null comment '分类',
	code char(10) null comment '产品',
	name varchar(50) not null comment '数量',
	price float not null comment '参考价',
	caption varchar(255) comment '备注',
	constraint pk_work_id primary key (id),
	constraint fk_category_work foreign key (fk_category_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table work comment '工序';

--产品工序
drop table if exists product_work;
create table product_work (
	id bigint not null auto_increment comment '流水号',
	creater bigint not null comment '创建人',
	create_time datetime not null comment '创建时间',
	editer bigint not null comment '修改人',
	edit_time datetime not null comment '修改时间',
	flag bit not null comment '标记',
	status bit not null comment '状态',
	fk_product_id bigint null comment '产品',
	fk_work_id bigint null comment '工序',
	price float not null comment '参考价',
	caption varchar(255) comment '备注',
	constraint pk_prowork_id primary key (id),
	constraint fk_product_prowork foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict,
	constraint fk_work_prowork foreign key (fk_work_id) 
		references work (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_work comment '产品工序';
/************************************************************************ 生产加工模块 结束 ************************************************************************/
