create table pt_user(
	email varchar2(300) primary key,--�̸���
	pw varchar2(200) not null, -- ���
	name varchar2(100) not null, -- �̸�
	phone varchar2(150) not null,-- ����ȣ
	user_key varchar2(100) not null,-- ȸ������ Ű
	reg_date date,--���Գ�¥
	membertype char,--ȸ�����
	point int default 0,--����Ʈ
	login_way char not null --�α�������
);

insert into PT_USER values('abc@naver.com','1q2w3e4r!','ȫ�浿','010-1234-5678','�����Ϸ�',sysdate,1,0,0);
drop table pt_user;