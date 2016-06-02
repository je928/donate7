create table donate (
	d_no number primary key,
	d_title varchar2(70) not null,
	d_member number not null,
	d_reg_date date default sysdate,
	d_content varchar2(3000) not null,
	d_plan varchar2(3000) not null,
	d_amount number not null,
	d_bank varchar2(30) not null,
	d_account varchar2(50) not null,
	d_img varchar2(2000) not null,
	d_approve char(1) default 'n',
	d_start_date date not null,
	d_end_date date not null
);
	

select * from donate;
drop table donate;


select d.*, a.no as no, a.email as email, a.nick as nick, a.job as category from donate d, 
			(select m_no as no, m_email as email, m_nick as nick, m_job as job, m_del_yn as del_yn from member where m_del_yn='n' 
			union select o_no, o_email, o_oname, o_category, o_del_yn from organ where o_del_yn='n') 
			a where d.d_member=a.no order by d_reg_date desc;
