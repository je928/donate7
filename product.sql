create table pr_product (
	pr_no number primary key, 						-- 요청게시글 번호
	pr_mno number not null,							-- 작성자이메일
	pr_proname varchar2(70)	not null,				-- 제품 이름
	pr_item	varchar2(50) not null,					-- 제품 종류
	pr_content 	varchar2(4000)	not null,			-- 설명
	pr_qty number not null,							-- 수량
	pr_price varchar2(50) not null,					-- 가격
	pr_picture varchar2(50)	default 'nothing.jpg',	-- 사진
	pr_donation varchar2(20) not null,				--기부처
	pr_approve CHAR(1) default 'n' check (pr_APPROVE in ('y','n')), --승인여부
	pr_callm varchar2(1000)	not null				-- 요청메세지
);                


create table pr_buy (	
	pb_no number primary key,				-- 구매상태번호
	pb_prno number not null,				-- 판매정보(판매자 닉네임, 제품 가격)
	pb_mno number not null,					-- 구매자
	pb_buyqty number not null,				-- 구매수량
	pb_addr	varchar2(100) not null,			-- 주소
	pb_delivery	varchar2(100) not null		-- 배송상태
		
);
