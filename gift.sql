ALTER TABLE gift ADD (g_delChk char(1));

create table gift (
   g_no number primary key,
   g_name VARCHAR2(50) not null,
   g_img VARCHAR2(100) not null,
   g_price number not null,
   g_delChk  char(1) check (g_delChk in ('y','n'))
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

update gift set g_delChk='n';


drop table gift;
drop table cpoint_info;