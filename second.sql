	create table second (
	sh_no number primary key, 											--글번호
	sh_mno number not null,												--글쓴이
	sh_title varchar(50) not null, 										--제목
	sh_category varchar(50) not null,									--상품종류
	sh_explanation varchar(300) not null,								--설명
	sh_reg_date date default sysdate,									--등록일
	sh_image varchar(50) default 'nothing.jpg',							--이미지
	sh_approve char(1) default 'n' check (sh_approve in ('y', 'n')),	--승인여부
	sh_arrive char(1) default 'n' check (sh_arrive in ('y', 'n'))		--도착여부
);

drop table second;
select * from second;

select * from (select rownum rn, a.* from (select sc.*, mo.no as no, mo.email as email, mo.nick as nick from second sc,(select m_no as no, m_email as email, m_nick as nick, m_del_yn as del_yn from member where m_del_yn='n' union select o_no, o_email, o_oname, o_del_yn from organ where o_del_yn='n') mo where sc.sh_mno=a.no order by sh_reg_date desc) a);
