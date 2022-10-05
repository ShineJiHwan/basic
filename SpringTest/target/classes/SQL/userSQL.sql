create table pt_user(
	email varchar2(300) primary key,--이메일
	pw varchar2(200) not null, -- 비번
	name varchar2(100) not null, -- 이름
	phone varchar2(150) not null,-- 폰번호
	user_key varchar2(100) not null,-- 회원인증 키
	reg_date date,--가입날짜
	membertype char,--회원등급
	point int default 0,--포인트
	login_way char not null --로그인유지
);

insert into PT_USER values('abc@naver.com','1q2w3e4r!','홍길동','010-1234-5678','인증완료',sysdate,1,0,0);
drop table pt_user;