create table member (
	m_no number primary key,
	m_email varchar2(50) not null unique,
	m_passwd varchar2(30) not null,
	m_name varchar2(30) not null,
	m_nick varchar2(30) not null unique,
	m_birth date,
	m_gender varchar2(10) not null,
	m_tel varchar2(30) not null,
	m_job varchar2(30) not null,
	m_warning number,
	m_reg_date date default sysdate,
	m_out_date date,
	m_del_yn char(1) default 'n'
);

create table organ (
	o_no number primary key,
	o_email varchar2(50) not null unique,
	o_passwd varchar2(30) not null,
	o_license varchar2(50) not null,
	o_oname varchar2(50) not null unique,
	o_name varchar2(30) not null,
	o_tel varchar2(30) not null,
	o_addr varchar2(500) not null,
	o_category varchar2(30),
	o_reg_date date default sysdate,
	o_out_date date,
	o_del_yn char(1) default 'n',
	o_ok_xyn char(1) default 'x'
);

select * from member;
select * from organ;

drop table member;
drop table organ;