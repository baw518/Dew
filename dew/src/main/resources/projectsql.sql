drop table project_ex;
create table project_ex(
	project_no number	primary key,
	title varchar2(50) not null,
	writer varchar2(50) not null,
	content clob not null,
	progressing number default 0,
	achieve varchar2(50) not null,
	hit number default 0,
	point number default 0,
	project_date date not null,
	progressing_end_date varchar2(50) not null
)
 drop sequence project_ex_seq;
 create sequence project_ex_seq; 
 
insert into project_ex(project_no,title,writer,content,progressing,achieve,project_date,progressing_end_date) 
values(project_ex_seq.nextval,'제목입니다','작성자','내용입니다',0,'진행중',sysdate,'2015/6/12');


select * from project_ex;

drop table depart_ex;
create table depart_ex(
	subject varchar2(50) not null,
	subject_man number not null,
	project_no number	not null,
	constraint fk_project_no_ex foreign key(project_no) references project_ex(project_no)
)

insert into depart_ex(subject,subject_man,project_no) values('웹디자인',5,1);
insert into depart_ex(subject,subject_man,project_no) values('웹개발',3,1);
insert into depart_ex(subject,subject_man,project_no) values('기타',2,1);

delete from depart_ex where subject='웹디자인';
select * from depart_ex where project_no=81;

select project_no as projectNo,title as projectName,content,point,progressing,achieve,hit,project_date,progressing_end_date as deadline from project_ex where project_no=
select project_no as projectNo,title as projectName,content,point,progressing,achieve,hit,project_date,progressing_end_date as deadline from project_ex where project_no=1


select project_no,writer,title,achieve,project_date,hit,progressing_end_date from(select project_no,writer,title,achieve,project_date,hit,progressing_end_date,ceil(rownum/5) as page 
		from(select project_no,writer,title,achieve,to_char(project_date,'YYYY.MM.DD') as project_date,hit,progressing_end_date from project_ex order by project_no desc))
		where page=1

		
select count(*) from project_ex


select project_no as projectNo,writer,title as projectName,achieve,project_date,hit,progressing_end_date as deadline from(select project_no,writer,title,achieve,project_date,hit,progressing_end_date,ceil(rownum/5) as page 
		from(select project_no,writer,title,achieve,to_char(project_date,'YYYY.MM.DD') as project_date,hit,progressing_end_date from project_ex order by project_no desc))
		where page=1







