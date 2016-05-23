	create table second (
	sh_no number primary key, 											--게시글
	sh_title varchar(50) not null, 										--제목
	sh_category varchar(50) not null,									--상품종류
	sh_explanation varchar(300) not null,										--설명
	sh_reg_date date default sysdate,									--등록일
	sh_image varchar(50) default 'nothing.jpg',							--이미지
	sh_approve char(1) default 'n' check (sh_approve in ('y', 'n')),	--승인여부
	sh_arrive char(1) default 'n' check (sh_arrive in ('y', 'n'))		--도착여부
);