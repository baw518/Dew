drop table project_write;
create table project_write(
	project_no number	primary key,
	title varchar2(50) not null,
	id varchar2(50) not null,
	content clob not null,
	progressing number default 0,
	achieve varchar2(50) not null,
	hit number default 0,
	point number default 0,
	project_date date not null,
	progressing_end_date varchar2(50) not null
)

 drop sequence project_seq;
 create sequence project_seq; 
 
insert into project_write(project_no,title,id,content,progressing,achieve,project_date,progressing_end_date) 
values(project_seq.nextval,'제목입니다','작성자','내용입니다',0,'진행중',sysdate,'2015/6/12');


select * from project_write;

drop table project_depart;
create table project_depart(
	subject varchar2(50) not null,
	subject_man number not null,
	project_no number	not null,
	constraint fk_project_no_ex foreign key(project_no) references project_write(project_no)
)

insert into project_depart(subject,subject_man,project_no) values('웹디자인',5,1);
insert into project_depart(subject,subject_man,project_no) values('웹개발',3,1);
insert into project_depart(subject,subject_man,project_no) values('기타',2,1);

delete from project_depart;
select * from project_depart;


select project_no,id,title,achieve,project_date,hit,progressing_end_date from(select project_no,id,title,achieve,project_date,hit,progressing_end_date,ceil(rownum/5) as page 
		from(select project_no,id,title,achieve,to_char(project_date,'YYYY.MM.DD') as project_date,hit,progressing_end_date from project_write order by project_no desc))
		where page=1

		
select count(*) from project_write

drop table project_comment;
create table project_comment(
	project_comment_no varchar2(50) primary key,
	project_no number not null,
	id varchar2(50) not null,
	content clob not null,
	project_comment_date date not null,
	constraint fk_reply_project_no_ex foreign key(project_no) references project_write(project_no)
)
insert into project_comment(project_comment_no,project_no,id,content,project_comment_date) values(project_comment_seq.nextval,1,'사용자1234','내용임니다잉',sysdate)

drop sequence project_comment_seq;
create sequence project_comment_seq;

  select project_comment_no as no,id,content,project_comment_date as commentDate from project_comment where project_no=1 order by project_no desc



  select project_comment_no as commentNo,content,project_comment_date as commentDate from project_comment where project_no=1

  select project_comment_no as commentNo,id,content,project_comment_date as commentDate from project_comment where project_no=1 order by project_no desc


	insert into project_comment(
	  project_comment_no,project_no,id,content,project_comment_date) 
	  values(project_comment_seq.nextval,1,'글쓴이','qwf',sysdate)

select * from project_comment 


