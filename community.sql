create table community (
	brd_no number primary key,
	brd_subject varchar2(200) not null,
	brd_content varchar2(4000) not null,
	brd_readcount number default 0,
	brd_ip varchar2(20) not null,
	brd_reg_date date default sysdate,
	brd_update_date date,
	brd_del_yn char(1) default 'n' check (brd_del_yn in ('y','n','w')),
	ref number not null,
	re_step number not null,
	re_level number not null,
	no number not null
);

create table communityReply (
	cr_no number primary key,
	cr_content varchar2(2000) not null,
	cr_reg_date date default sysdate,
	cr_update_date date,
	cr_del_yn char(1) default 'n',
	brd_no number not null,
	no number not null
);

select * from community;
select * from communityReply;

drop table community;
drop table communityReply;