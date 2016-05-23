create table gift (
   g_no number primary key,
   g_name VARCHAR2(50) not null,
   g_img VARCHAR2(100) not null,
   g_price number not null
)
create table cpoint_info(
   cp_no number primary key,
   m_no number not null,
   cp_sort char(1) check (cp_sort in ('c','p')),
   cp_date date not null,
   cp_point number not null,
   cp_point_re VARCHAR2(50) not null
)
create table gift_buy(
   gb_no number primary key,
   g_no number not null,
   m_no number not null,
   gb_chk char(1) default 'n' check (gb_chk in ('y','n'))
)

select * from gift;
select * from cpoint_info;
select * from gift_buy;


Alter table cpoint_info add Foreign Key (m_no) references member (m_no);
Alter table gift_buy add Foreign Key (m_no) references member (m_no);

drop table gift;
drop table cpoint_info;