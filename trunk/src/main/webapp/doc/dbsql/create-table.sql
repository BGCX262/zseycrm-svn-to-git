/************************************************************************ ϵͳģ�� ��ʼ ************************************************************************/
--ϵͳ��ˮ��
drop table if exists sys_sequence;
create table sys_sequence (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	seq_name varchar(50) not null comment '��������',
	seq_value int not null comment '����ֵ',
	caption varchar(255) not null comment '��ע',
	constraint pk_sequence_id primary key (id),
	constraint un_sequence_name unique (seq_name)
) engine=innodb default charset=utf8;
alter table sys_sequence comment 'ϵͳ��ˮ��';

--ϵͳ����
drop table if exists accessory;
create table accessory (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	data_sort tinyint not null comment '���ݷ���',
	data_id bigint not null comment '����ID',
	data_name varchar(255) not null comment '����ԭʼ����',
	path varchar(255) not null comment '�����ϴ�·��',
	constraint pk_accessory_id primary key (id)
) engine=innodb default charset=utf8;
alter table accessory comment 'ϵͳ����';

--ϵͳ�ֵ���
drop table if exists dictionary;
create table dictionary (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	sort tinyint not null comment '����',
	name varchar(50) not null comment '����',
	code tinyint not null comment '���',
	caption varchar(255) not null comment '�����ϴ�·��',
	constraint pk_dictionary_id primary key (id),
	constraint un_dict_namecode unique (name,code)
) engine=innodb default charset=utf8;
alter table dictionary comment 'ϵͳ�ֵ���';

--������
drop table if exists audit_mind;
create table audit_mind (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	data_sort tinyint not null comment '����',
	data_id bigint not null comment '��¼ID',
	audit_id bigint not null comment '�����ID',
	auditor varchar(20) not null comment '�����',
	audit_mind varchar(255) not null comment '������',
	audit_time datetime not null comment '�������',
	audit_state tinyint not null comment '���״̬',
	constraint pk_mind_id primary key (id)
) engine=innodb default charset=utf8;
alter table audit_mind comment '������';

--����
drop table if exists area;
create table area (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	code varchar(10) not null comment '���',
	name varchar(50) not null comment '����',
	fk_area_id bigint comment '����',
	constraint pk_area_id primary key (id),
	constraint un_area_code unique (code),
	constraint fk_area_area foreign key (fk_area_id) 
		references area (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table area comment '����';

--ϵͳ�˵�
drop table if exists menu;
create table menu (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	title varchar(50) not null comment '����',
	name varchar(50) not null comment '����',
	href varchar(255) comment '��ַ',
	fk_menu_id bigint comment '�����˵�',
	constraint pk_menu_id primary key (id),
	constraint un_menu_code unique (name),
	constraint fk_menu_menu foreign key (fk_menu_id) 
		references menu (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table menu comment 'ϵͳ�˵�';

--ϵͳ��ɫ
drop table if exists role;
create table role (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	title varchar(50) not null comment '����',
	name varchar(50) not null comment '����',
	caption varchar(255) comment '��ע',
	constraint pk_role_id primary key (id),
	constraint un_role_code unique (name)
) engine=innodb default charset=utf8;
alter table role comment 'ϵͳ��ɫ';

--��ɫ�˵�
drop table if exists role_menu;
create table role_menu (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_role_id bigint not null comment '��ɫ',
	fk_menu_id bigint not null comment '�˵�',
	constraint pk_rolemenu_id primary key (id),
	constraint fk_role_rolemenu foreign key (fk_role_id) 
		references role (id) on delete restrict on update restrict,
	constraint fk_menu_rolemenu foreign key (fk_menu_id) 
		references menu (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table role_menu comment '��ɫ�˵�';

--����
drop table if exists department;
create table department (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	code char(4) not null comment '���',
	name varchar(50) not null comment '����',
	constraint pk_department_id primary key (id),
	constraint un_department_code unique (code)
) engine=innodb default charset=utf8;
alter table department comment '����';

--Ա��
drop table if exists employee;
create table employee (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_department_id bigint not null comment '����',
	username varchar(50) not null comment '�û�',
	password char(32) not null comment '����',
	realname varchar(20) not null comment '����',
	code char(10) not null comment '���',
	fk_duty_id bigint not null comment 'ְ��',
	idcard char(18) not null comment '���֤��',
	born date comment '��������',
	fk_nation_id bigint comment '����',
	phone varchar(20) comment '�绰',
	mobile char(11) comment '�ֻ�',
	fk_province_id bigint comment 'ʡ',
	fk_city_id bigint comment '��',
	fk_town_id bigint comment '��',
	address varchar(50) comment '��ַ',
	zip char(6) comment '�ʱ�',
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
alter table employee comment 'Ա��';

--Ա����ɫ
drop table if exists employee_role;
create table employee_role (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_role_id bigint not null comment '��ɫ',
	fk_employee_id bigint not null comment 'Ա��',
	constraint pk_emprole_id primary key (id),
	constraint fk_role_emprole foreign key (fk_role_id) 
		references role (id) on delete restrict on update restrict,
	constraint fk_employee_emprole foreign key (fk_employee_id) 
		references employee (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table employee_role comment 'Ա����ɫ';

--�ͻ���Ӧ��
drop table if exists customer;
create table customer (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	name varchar(50) not null comment '����',
	sort tinyint not null comment '���1���ͻ���2����Ӧ�̣�3������',
	fk_grade_id bigint comment '����',
	fk_genre_id bigint comment '����',
	phone varchar(20) not null comment '�绰',
	fax varchar(20) comment '����',
	fk_province_id bigint comment 'ʡ',
	fk_city_id bigint comment '��',
	fk_town_id bigint comment '��',
	address varchar(50) comment '��ַ',
	zip char(6) comment '�ʱ�',
	email varchar(50) comment '����',
	website varchar(255) comment '��վ',
	constraint pk_customer_id primary key (id),
	constraint fk_grade_customer foreign key (fk_grade_id) 
		references dictionary (id) on delete restrict on update restrict,
	constraint fk_genre_customer foreign key (fk_genre_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table customer comment '�ͻ���Ӧ��';

--��ϵ��
drop table if exists linkman;
create table linkman (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_customer_id bigint not null comment '�����ͻ���Ӧ��',
	realname varchar(20) not null comment '����',
	duty varchar(20)  comment 'ְ��',
	department varchar(20) comment '����',
	phone varchar(20) comment '����',
	email varchar(50) comment '����',
	qq varchar(30) comment 'QQ',
	mobile varchar(20) comment '�ֻ�',
	isdef bit default 0 comment '�Ƿ�Ĭ��',
	constraint pk_linkman_id primary key (id),
	constraint fk_customer_linkman foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table linkman comment '��ϵ��';

--ϵͳ����
drop table if exists category;
create table category (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_sort_id bigint not null comment '���',
	code int not null comment '���',
	name varchar(50) not null comment '����',
	fk_category_id bigint comment '��������',
	constraint pk_category_id primary key (id),
	constraint fk_sort_category foreign key (fk_sort_id) 
		references dictionary (id) on delete restrict on update restrict,
	constraint fk_category_category foreign key (fk_category_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table category comment 'ϵͳ����';

--����
drop table if exists material;
create table material (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_category_id bigint not null comment '����',
	name varchar(50) not null comment '����',
	code varchar(30) comment '�ͺ�',
	spec varchar(30) comment '���',
	unit varchar(10) comment '��λ',
	brand varchar(20) comment 'Ʒ��',
	color varchar(20) comment '��ɫ',
	price float comment '�ο���',
	picture varchar(255) comment 'ͼ��',
	constraint pk_material_id primary key (id),
	constraint fk_category_material foreign key (fk_category_id) 
		references category (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material comment '����';

--�ͻ���Ӧ�����ϼ۸�
drop table if exists customer_material;
create table customer_material (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_customer_id bigint not null comment '�ͻ���Ӧ��',
	fk_material_id bigint not null comment '����',
	price float not null commnet '�۸�',
	constraint pk_custmate_id primary key (id),
	constraint fk_customer_custmate foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict,
	constraint fk_material_custmate foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table customer_material comment '�ͻ���Ӧ�����ϼ۸�';

--��Ʒ
drop table if exists product;
create table product (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_category_id bigint not null comment '����',
	fk_customer_id bigint comment '�ͻ�',
	name varchar(50) not null comment '����',
	code varchar(30) comment '���',
	size varchar(10) comment '���',
	color varchar(20) comment '��ɫ',
	unit varchar(10) comment '��λ',
	price float comment '�ο���',
	picture varchar(255) comment 'ͼ��',
	constraint pk_product_id primary key (id),
	constraint fk_category_product foreign key (fk_category_id) 
		references category (id) on delete restrict on update restrict,
	constraint fk_customer_product foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product comment '��Ʒ';
/************************************************************************ ϵͳģ�� ���� ************************************************************************/

/************************************************************************ �ɹ�ģ�� ��ʼ ************************************************************************/
--���ϲɹ�ѯ��
drop table if exists buy_ask;
create table buy_ask (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_provider_id bigint not null comment '��Ӧ��',
	code char(10) not null comment '���',
	total float null comment '�ܶ�',
	caption varchar(255) comment '��ע',
	add_id bigint comment '�����',
	add_date datetime comment '�������',
	autdit_id bigint comment '�����',
	autdit_date datetime comment '�������',
	autdit_state tinyint default 0 comment '���״̬',
	constraint pk_buyask_id primary key (id),
	constraint un_buyask_code unique (code),
	constraint fk_provider_buyask foreign key (fk_provider_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_ask comment '���ϲɹ�ѯ��';

--���ϲɹ�ѯ����ϸ
drop table if exists buy_ask_list;
create table buy_ask_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_ask_id bigint not null comment '���۵�',
	fk_material_id bigint not null comment '����',
	amount float not null comment '����',
	total float null comment '���',
	caption varchar(255) comment '��ע',
	constraint pk_buyasklist_id primary key (id),
	constraint fk_ask_buyasklist foreign key (fk_ask_id) 
		references buy_ask (id) on delete restrict on update restrict,
	constraint fk_material_buyasklist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_ask_list comment '���ϲɹ�ѯ����ϸ';

--���ϲɹ����
drop table if exists buy_input;
create table buy_input (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_provider_id bigint not null comment '��Ӧ��',
	fk_ticket_id bigint not null comment 'Ʊ������',
	code char(10) not null comment '���',
	total float null comment 'Ӧ�����',
	payfor float null comment '�Ѹ����',
	nopay float null comment 'δ�����',
	fact float null comment 'ʵ�����',
	caption varchar(255) comment '��ע',
	add_id bigint comment '�����',
	add_date datetime comment '�������',
	autdit_id bigint comment '�����',
	autdit_date datetime comment '�������',
	autdit_state tinyint default 0 comment '���״̬',
	constraint pk_buyinput_id primary key (id),
	constraint un_buyinput_code unique (code),
	constraint fk_provider_buyinput foreign key (fk_provider_id) 
		references customer (id) on delete restrict on update restrict,
	constraint fk_ticket_buyinput foreign key (fk_ticket_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_input comment '���ϲɹ����';

--���ϲɹ������ϸ
drop table if exists buy_input_list;
create table buy_input_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_input_id bigint not null comment '���۵�',
	fk_material_id bigint not null comment '����',
	amount float not null comment '����',
	total float null comment '���',
	caption varchar(255) comment '��ע',
	constraint pk_buyinputlist_id primary key (id),
	constraint fk_input_buyinputlist foreign key (fk_input_id) 
		references buy_input (id) on delete restrict on update restrict,
	constraint fk_material_buyinputlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_input_list comment '���ϲɹ������ϸ';

--���ϲɹ��˻�
drop table if exists buy_output;
create table buy_output (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_provider_id bigint not null comment '��Ӧ��',
	code char(10) not null comment '���',
	total float null comment 'Ӧ�����',
	payfor float null comment '�Ѹ����',
	nopay float null comment 'δ�����',
	fact float null comment 'ʵ�����',
	caption varchar(255) comment '��ע',
	add_id bigint comment '�����',
	add_date datetime comment '�������',
	autdit_id bigint comment '�����',
	autdit_date datetime comment '�������',
	autdit_state tinyint default 0 comment '���״̬',
	constraint pk_buyoutput_id primary key (id),
	constraint un_buyoutput_code unique (code),
	constraint fk_provider_buyoutput foreign key (fk_provider_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_output comment '���ϲɹ��˻�';

--���ϲɹ��˻���ϸ
drop table if exists buy_output_list;
create table buy_output_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_output_id bigint not null comment '���۵�',
	fk_material_id bigint not null comment '����',
	amount float not null comment '����',
	total float null comment '���',
	caption varchar(255) comment '��ע',
	constraint pk_buyoutputlist_id primary key (id),
	constraint fk_output_buyoutputlist foreign key (fk_output_id) 
		references buy_output (id) on delete restrict on update restrict,
	constraint fk_material_buyoutputlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table buy_output_list comment '���ϲɹ��˻���ϸ';
/************************************************************************ �ɹ�ģ�� ���� ************************************************************************/

/************************************************************************ ����ģ�� ��ʼ ************************************************************************/
--���۱���
drop table if exists sell_ask;
create table sell_ask (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_customer_id bigint not null comment '�ͻ�',
	code char(10) not null comment '���',
	total float null comment '�ܶ�',
	caption varchar(255) comment '��ע',
	add_id bigint comment '�����',
	add_date datetime comment '�������',
	autdit_id bigint comment '�����',
	autdit_date datetime comment '�������',
	autdit_state tinyint default 0 comment '���״̬',
	constraint pk_sellask_id primary key (id),
	constraint un_sellask_code unique (code),
	constraint fk_customer_sellask foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_ask comment '���۱���';

--���۱�����ϸ
drop table if exists sell_ask_list;
create table sell_ask_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_ask_id bigint not null comment '���۵�',
	fk_product_id bigint not null comment '����',
	amount float not null comment '����',
	total float null comment '���',
	caption varchar(255) comment '��ע',
	constraint pk_buyasklist_id primary key (id),
	constraint fk_ask_sellasklist foreign key (fk_ask_id) 
		references sell_ask (id) on delete restrict on update restrict,
	constraint fk_product_sellasklist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_ask_list comment '���۱�����ϸ';

--���۶���
drop table if exists sell_order;
create table sell_order (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_customer_id bigint not null comment '�ͻ�',
	fk_ticket_id bigint not null comment 'Ʊ������',
	code char(10) not null comment '���',
	total float null comment 'Ӧ�ս��',
	payfor float null comment '���ս��',
	nopay float null comment 'δ�ս��',
	fact float null comment 'ʵ�ս��',
	caption varchar(255) comment '��ע',
	add_id bigint comment '�����',
	add_date datetime comment '�������',
	autdit_id bigint comment '�����',
	autdit_date datetime comment '�������',
	autdit_state tinyint default 0 comment '���״̬',
	constraint pk_sellorder_id primary key (id),
	constraint un_sellorder_code unique (code),
	constraint fk_customer_sellorder foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict,
	constraint fk_ticket_sellorder foreign key (fk_ticket_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_order comment '���۶���';

--���۶�����ϸ
drop table if exists sell_order_list;
create table sell_order_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_input_id bigint not null comment '���۵�',
	fk_product_id bigint not null comment '��Ʒ',
	amount float not null comment '����',
	total float null comment '���',
	caption varchar(255) comment '��ע',
	constraint pk_sellorderlist_id primary key (id),
	constraint fk_input_sellorderlist foreign key (fk_input_id) 
		references sell_order (id) on delete restrict on update restrict,
	constraint fk_product_sellorderlist foreign key (fk_product_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_order_list comment '���۶�����ϸ';

--�����˻�
drop table if exists sell_back;
create table sell_back (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_customer_id bigint not null comment '�ͻ�',
	code char(10) not null comment '���',
	total float null comment 'Ӧ�˽��',
	payfor float null comment '���˽��',
	nopay float null comment 'δ�˽��',
	fact float null comment 'ʵ�˽��',
	caption varchar(255) comment '��ע',
	add_id bigint comment '�����',
	add_date datetime comment '�������',
	autdit_id bigint comment '�����',
	autdit_date datetime comment '�������',
	autdit_state tinyint default 0 comment '���״̬',
	constraint pk_sellback_id primary key (id),
	constraint un_sellback_code unique (code),
	constraint fk_customer_sellback foreign key (fk_customer_id) 
		references customer (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_back comment '�����˻�';

--�����˻���ϸ
drop table if exists sell_back_list;
create table sell_back_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_back_id bigint not null comment '���۵�',
	fk_product_id bigint not null comment '��Ʒ',
	amount float not null comment '����',
	total float null comment '���',
	caption varchar(255) comment '��ע',
	constraint pk_sellbacklist_id primary key (id),
	constraint fk_back_sellbacklist foreign key (fk_back_id) 
		references sell_back (id) on delete restrict on update restrict,
	constraint fk_product_sellbacklist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table sell_back_list comment '�����˻���ϸ';
/************************************************************************ ����ģ�� ���� ************************************************************************/

/************************************************************************ ���ģ�� ��ʼ ************************************************************************/
--�ֿ�
drop table if exists store;
create table store (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	code varchar(4) not null comment '��ע',
	name varchar(20) not null comment '����',
	caption varchar(255) comment '��ע',
	constraint pk_store_id primary key (id),
	constraint un_store_code unique (code)
) engine=innodb default charset=utf8;
alter table store comment '�ֿ�';

--���Ͽ��
drop table if exists material_store;
create table material_store (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	fk_material_id bigint not null comment '����',
	upper_limit float not null comment '����',
	lower_limit float not null comment '����',
	amount float not null comment '�����',
	constraint pk_matestore_id primary key (id),
	constraint un_matestore_matestore unique (fk_store_id, fk_material_id),
	constraint fk_store_matestore foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict,
	constraint fk_material_matestore foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_store comment '���Ͽ��';

--��Ʒ���
drop table if exists product_store;
create table product_store (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	fk_product_id bigint not null comment '����',
	upper_limit float not null comment '����',
	lower_limit float not null comment '����',
	amount float not null comment '�����',
	constraint pk_matestore_id primary key (id),
	constraint un_matestore_matestore unique (fk_store_id, fk_product_id),
	constraint fk_store_matestore foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict,
	constraint fk_product_matestore foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_store comment '��Ʒ���';

--�����̵�
drop table if exists material_check;
create table material_check (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_matechk_id primary key (id),
	constraint fk_store_matechk foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_check comment '�����̵�';

--�����̵���ϸ
drop table if exists material_check_list;
create table material_check_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '�����̵㵥',
	fk_material_id bigint null comment '����',
	book float not null comment '�˱���',
	store float not null comment '�����',
	reality float not null comment 'ʵ����',
	constraint pk_matechklist_id primary key (id),
	constraint fk_check_matechklist foreign key (fk_check_id) 
		references material_check (id) on delete restrict on update restrict,
	constraint fk_material_matechklist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_check_list comment '�����̵���ϸ';

--�������
drop table if exists material_in;
create table material_in (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_matein_id primary key (id),
	constraint fk_store_matein foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_in comment '�������';

--���������ϸ
drop table if exists material_in_list;
create table material_in_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '������ⵥ',
	fk_material_id bigint null comment '����',
	amount float not null comment '����',
	constraint pk_mateinlist_id primary key (id),
	constraint fk_check_mateinlist foreign key (fk_check_id) 
		references material_in (id) on delete restrict on update restrict,
	constraint fk_material_mateinlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_in_list comment '���������ϸ';

--���ϳ���
drop table if exists material_out;
create table material_out (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_mateout_id primary key (id),
	constraint fk_store_mateout foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_out comment '���ϳ���';

--���ϳ�����ϸ
drop table if exists material_out_list;
create table material_out_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '���ϳ��ⵥ',
	fk_material_id bigint null comment '����',
	amount float not null comment '����',
	constraint pk_mateoutlist_id primary key (id),
	constraint fk_check_mateoutlist foreign key (fk_check_id) 
		references material_out (id) on delete restrict on update restrict,
	constraint fk_material_mateoutlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_out_list comment '���ϳ�����ϸ';

--�����˻�
drop table if exists material_back;
create table material_back (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_mateback_id primary key (id),
	constraint fk_store_mateback foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_back comment '�����˻�';

--�����˻���ϸ
drop table if exists material_back_list;
create table material_back_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '�����˻ص�',
	fk_material_id bigint null comment '����',
	amount float not null comment '����',
	constraint pk_matebacklist_id primary key (id),
	constraint fk_check_matebacklist foreign key (fk_check_id) 
		references material_back (id) on delete restrict on update restrict,
	constraint fk_material_matebacklist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_back_list comment '�����˻���ϸ';

--��������
drop table if exists material_profit_loss;
create table material_profit_loss (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_mateprolos_id primary key (id),
	constraint fk_store_mateprolos foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_profit_loss comment '��������';

--����������ϸ
drop table if exists material_profit_loss_list;
create table material_profit_loss_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '�������浥',
	fk_material_id bigint null comment '����',
	amount float not null comment '����',
	constraint pk_mateproloslist_id primary key (id),
	constraint fk_check_mateproloslist foreign key (fk_check_id) 
		references material_profit_loss (id) on delete restrict on update restrict,
	constraint fk_material_mateproloslist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_profit_loss_list comment '����������ϸ';

--���Ͽ�����
drop table if exists material_adjust;
create table material_adjust (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_to_id bigint not null comment '����ֿ�',
	fk_form_id bigint not null comment '�����ֿ�',
	constraint pk_mateadjust_id primary key (id),
	constraint fk_to_mateadjust foreign key (fk_to_id) 
		references store (id) on delete restrict on update restrict,
	constraint fk_from_mateadjust foreign key (fk_form_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_adjust comment '���Ͽ�����';

--���Ͽ�������ϸ
drop table if exists material_adjust_list;
create table material_adjust_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '���Ͽ�������',
	fk_material_id bigint null comment '����',
	amount float not null comment '����',
	constraint pk_mateadjustlist_id primary key (id),
	constraint fk_check_mateadjustlist foreign key (fk_check_id) 
		references material_adjust (id) on delete restrict on update restrict,
	constraint fk_material_mateadjustlist foreign key (fk_material_id) 
		references material (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table material_adjust_list comment '���Ͽ�������ϸ';

--��Ʒ�̵�
drop table if exists product_check;
create table product_check (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_prochk_id primary key (id),
	constraint fk_store_prochk foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_check comment '��Ʒ�̵�';

--��Ʒ�̵���ϸ
drop table if exists product_check_list;
create table product_check_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '��Ʒ�̵㵥',
	fk_product_id bigint null comment '��Ʒ',
	book float not null comment '�˱���',
	store float not null comment '�����',
	reality float not null comment 'ʵ����',
	constraint pk_prochklist_id primary key (id),
	constraint fk_check_prochklist foreign key (fk_check_id) 
		references product_check (id) on delete restrict on update restrict,
	constraint fk_product_prochklist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_check_list comment '��Ʒ�̵���ϸ';

--��Ʒ���
drop table if exists product_in;
create table product_in (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_proin_id primary key (id),
	constraint fk_store_proin foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_in comment '��Ʒ���';

--��Ʒ�����ϸ
drop table if exists product_in_list;
create table product_in_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '��Ʒ��ⵥ',
	fk_product_id bigint null comment '��Ʒ',
	amount float not null comment '����',
	constraint pk_proinlist_id primary key (id),
	constraint fk_check_proinlist foreign key (fk_check_id) 
		references product_in (id) on delete restrict on update restrict,
	constraint fk_product_proinlist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_in_list comment '��Ʒ�����ϸ';

--��Ʒ����
drop table if exists product_out;
create table product_out (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_proout_id primary key (id),
	constraint fk_store_proout foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_out comment '��Ʒ����';

--��Ʒ������ϸ
drop table if exists product_out_list;
create table product_out_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '��Ʒ���ⵥ',
	fk_product_id bigint null comment '��Ʒ',
	amount float not null comment '����',
	constraint pk_prooutlist_id primary key (id),
	constraint fk_check_prooutlist foreign key (fk_check_id) 
		references product_out (id) on delete restrict on update restrict,
	constraint fk_product_prooutlist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_out_list comment '��Ʒ������ϸ';

--��Ʒ�˻�
drop table if exists product_back;
create table product_back (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_proback_id primary key (id),
	constraint fk_store_proback foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_back comment '��Ʒ�˻�';

--��Ʒ�˻���ϸ
drop table if exists product_back_list;
create table product_back_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '��Ʒ�˻ص�',
	fk_product_id bigint null comment '��Ʒ',
	amount float not null comment '����',
	constraint pk_probacklist_id primary key (id),
	constraint fk_check_probacklist foreign key (fk_check_id) 
		references product_back (id) on delete restrict on update restrict,
	constraint fk_product_probacklist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_back_list comment '��Ʒ�˻���ϸ';

--��Ʒ����
drop table if exists product_profit_loss;
create table product_profit_loss (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_store_id bigint not null comment '�ֿ�',
	constraint pk_proprolos_id primary key (id),
	constraint fk_store_proprolos foreign key (fk_store_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_profit_loss comment '��Ʒ����';

--��Ʒ������ϸ
drop table if exists product_profit_loss_list;
create table product_profit_loss_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '��Ʒ���浥',
	fk_product_id bigint null comment '��Ʒ',
	amount float not null comment '����',
	constraint pk_proproloslist_id primary key (id),
	constraint fk_check_proproloslist foreign key (fk_check_id) 
		references product_profit_loss (id) on delete restrict on update restrict,
	constraint fk_product_proproloslist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_profit_loss_list comment '��Ʒ������ϸ';

--��Ʒ������
drop table if exists product_adjust;
create table product_adjust (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_to_id bigint not null comment '����ֿ�',
	fk_form_id bigint not null comment '�����ֿ�',
	constraint pk_proadjust_id primary key (id),
	constraint fk_to_proadjust foreign key (fk_to_id) 
		references store (id) on delete restrict on update restrict,
	constraint fk_from_proadjust foreign key (fk_form_id) 
		references store (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_adjust comment '��Ʒ������';

--��Ʒ��������ϸ
drop table if exists product_adjust_list;
create table product_adjust_list (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_check_id bigint null comment '��Ʒ��������',
	fk_product_id bigint null comment '��Ʒ',
	amount float not null comment '����',
	constraint pk_proadjustlist_id primary key (id),
	constraint fk_check_proadjustlist foreign key (fk_check_id) 
		references product_adjust (id) on delete restrict on update restrict,
	constraint fk_product_proadjustlist foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_adjust_list comment '��Ʒ��������ϸ';
/************************************************************************ ���ģ�� ���� ************************************************************************/

/************************************************************************ �����ӹ�ģ�� ��ʼ ************************************************************************/
--����
drop table if exists work;
create table work (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_category_id bigint null comment '����',
	code char(10) null comment '��Ʒ',
	name varchar(50) not null comment '����',
	price float not null comment '�ο���',
	caption varchar(255) comment '��ע',
	constraint pk_work_id primary key (id),
	constraint fk_category_work foreign key (fk_category_id) 
		references dictionary (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table work comment '����';

--��Ʒ����
drop table if exists product_work;
create table product_work (
	id bigint not null auto_increment comment '��ˮ��',
	creater bigint not null comment '������',
	create_time datetime not null comment '����ʱ��',
	editer bigint not null comment '�޸���',
	edit_time datetime not null comment '�޸�ʱ��',
	flag bit not null comment '���',
	status bit not null comment '״̬',
	fk_product_id bigint null comment '��Ʒ',
	fk_work_id bigint null comment '����',
	price float not null comment '�ο���',
	caption varchar(255) comment '��ע',
	constraint pk_prowork_id primary key (id),
	constraint fk_product_prowork foreign key (fk_product_id) 
		references product (id) on delete restrict on update restrict,
	constraint fk_work_prowork foreign key (fk_work_id) 
		references work (id) on delete restrict on update restrict
) engine=innodb default charset=utf8;
alter table product_work comment '��Ʒ����';
/************************************************************************ �����ӹ�ģ�� ���� ************************************************************************/
