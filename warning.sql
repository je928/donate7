create table warning (
	wa_no number primary key,
	m_no number not null,
	re_no number not null,
	wa_sort char(1) check (wa_sort in ('d','b')),
	wa_cnt number not null,
	wa_re varchar2(50) not null,
	wa_date date not null	
);
create table register (
	re_no number primary key,
	reporter_no number not null,
	reported_no number not null,
	re_content varchar2(150) not null,
	re_chk char(1) check (re_chk in ('y','n')),
	re_date date not null,
	re_sort char(1) check (re_sort in ('c','w')),
	re_sort_no number not null
);
select * from warning;
select * from register;

drop table warning;
drop table register;