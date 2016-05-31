create table product (
	pr_no number primary key, 						-- ��û�Խñ� ��ȣ
	pr_mno number not null,							-- �ۼ����̸���
	pr_proname varchar2(70)	not null,				-- ��ǰ �̸�
	pr_item	varchar2(50) not null,					-- ��ǰ ����
	pr_content 	varchar2(4000)	not null,			-- ����
	pr_qty number not null,							-- ����
	pr_price varchar2(50) not null,					-- ����
	pr_img varchar2(50)	default 'nothing.jpg',	-- ����
	pr_donation varchar2(20) not null,				--���ó
	pr_approve CHAR(1) default 'n' check (pr_APPROVE in ('y','n')), --���ο���
	pr_callm varchar2(1000)	not null,				-- ��û�޼���
	pr_date date default sysdate,
	pr_update date
);                


create table pr_buy (	
	pb_no number primary key,				-- ���Ż��¹�ȣ
	pb_prno number not null,				-- �Ǹ�����(�Ǹ��� �г���, ��ǰ ����)
	pb_date date default sysdate,
	pb_mno number not null,					-- ������
	pb_buyqty number not null,				-- ���ż���
	pb_addr	varchar2(100) not null,			-- �ּ�
	pb_delivery	varchar2(100) not null		-- ��ۻ���
		
);

drop table pr_product;
drop table pr_buy;