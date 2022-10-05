
create table pt_board(
	pt_num int primary key, --게시판 번호
	pt_title varchar2(300) not null,
	pt_cont varchar2(4000) not null,
	pt_hit int default 0, -- 조회수
	pt_date date,
	pt_img_url varchar2(2000) null,
	email varchar2(100)
);


create sequence ptb_seq
start with 1
increment by 1
nocache

insert into pt_board values(ptb_seq.nextval,'제목입니다.','내용입니다',0,sysdate,null,'wlghks4111@naver.com');
insert into pt_board values(ptb_seq.nextval,'제목입니다2','내용입니다2',0,sysdate,null,'wlghks4111@naver.com');
insert into pt_board values(ptb_seq.nextval,'제목입니다3','내용입니다3',0,sysdate,null,'wlghks4111@naver.com');