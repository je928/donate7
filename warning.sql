create table warning (
	wa_no number primary key,
	m_no number not null,
	wa_sort char(1) check (wa_sort in ('d','b')),
	wa_cnt number not null,
	wa_re varchar2(50) not null,
	wa_date date not null,
	re_num number not null
);

select * from warning;