create table product_buy(
	pb_no number primary key,
	pr_no number,
	pb_mono number,
	pb_buyqty number,
	pb_addr varchar2(100),
	pb_name varchar2(50),
	pb_tel varchar2(30),
	pb_delivery varchar2(100)
);
INSERT INTO product_buy VALUES('1','1','1','1','주소1','받는사람1','전화번호1','n');
INSERT INTO product_buy VALUES('2','2','2','2','주소2','받는사람2','전화번호2','n');
update product_buy set pb_delivery = 'y' where pb_no=1;
select * from product_buy;
select pb_pr,m_name from product_buy,member where pb_no=m_no;
select * from product_buy ,member where member.m_email=m_email and pb_no=m_no
drop table product_buy;
select * from product_buy where pb_no=1;