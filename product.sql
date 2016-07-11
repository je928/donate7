create table product (
	pr_no number primary key,
	pr_mno number not null,=
	pr_proname varchar2(70)	not null,
	pr_item	varchar2(50) not null,
	pr_content 	varchar2(4000)	not null,
	pr_qty number not null,
	pr_price varchar2(50) not null,
	pr_img varchar2(50)	default 'nothing.jpg',
	pr_donation varchar2(20) not null,
	pr_approve CHAR(1) default 'n' check (pr_APPROVE in ('y','n')),
	pr_callm varchar2(1000)	not null,
	pr_date date default sysdate,
	pr_update date
);                

drop table product;
