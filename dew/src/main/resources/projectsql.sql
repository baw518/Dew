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
	project_comment_no number primary key,
	project_no number not null,
	id varchar2(50) not null,
	content clob not null,
	project_comment_date date not null,
	type number default 0, 
	constraint fk_reply_project_no_ex foreign key(project_no) references project_write(project_no)
)

select p.title,p.progressing,p.point,c.project_no,c.id,c.project_comment_date from project_comment c,project_write p where c.type=1 and c.id='java' and c.project_no=p.project_no
delete from project_comment where project_comment_no=2
select * from project_comment
insert into project_comment(project_comment_no,project_no,id,content,project_comment_date) values(project_comment_seq.nextval,1,'사용자1234','내용임니다잉',sysdate)
drop sequence project_comment_seq;
create sequence project_comment_seq;


select project_comment_no as no,id,content,project_comment_date as commentDate from project_comment where project_no=1 order by project_no desc
select project_comment_no as commentNo,content,project_comment_date as commentDate from project_comment where project_no=1
select project_comment_no as commentNo,id,content,to_char(project_comment_date,'YYYY-MM-DD HH:MI') as commentDate from project_comment where project_no=1 order by project_no desc

  	select p.title,p.progressing,p.point,p.project_no,c.project_comment_date as deadline from project_comment c,project_write p where type=1 and c.id='java' and c.project_no=p.project_no

  	select p.title,p.progressing,p.point,p.project_no,c.project_comment_date as deadline from project_comment c,project_write p where type=1 and c.id='java' and c.project_no=p.project_no

  select project_comment_no as commentNo,content,to_char(project_comment_date,'YYYY-MM-DD HH:MI') as commentDate from project_comment where project_comment_no=1

  	select p.achieve,p.title,p.progressing,p.point,p.project_no,c.project_comment_date as deadline from project_comment c,project_write p where c.type=1 and p.achieve='진행중' and c.id='java' and c.project_no=p.project_no

select * from project_write
  select * from project_comment
   
   select from project_write where project_no= and id=
   --TYPE :  0 작성 1 참여 2 댓글
  


 	select project_comment_no as commentNo, project_no as boardNo,id,content,project_comment_date as commentDate from project_comment where project_no=4 and id='java1' and type=1

 	
 	
 	  	select p.title,p.progressing,p.point,p.project_no,to_char(c.project_comment_date,'YYYY-MM-DD HH:MI') as deadline from project_comment c,project_write p where c.type=1 and c.id='java' and c.project_no=p.project_no

 	
 	
 	select project_no,id,title,achieve,project_date,progressing_end_date as deadline,hit,point from(select project_no,id,title,achieve,project_date,hit,progressing_end_date,ceil(rownum/10) as page,point 
		from(select project_no,id,title,achieve,to_char(project_date,'YYYY.MM.DD') as project_date,hit,progressing_end_date,point from project_write order by project_no desc))
		where page=1
 	select * from project_comment
 	delete from project_comment where project_comment_no=26
 	
 	
 	select * from project_write
 	  	 select distinct p.title,p.achieve,p.progressing,p.point,p.project_no,to_char(p.project_date,'YYYY.MM.DD') as deadline from project_comment c,project_write p where c.type!=2 and p.achieve='진행중' and (p.id='java' or c.id='java')
 	  
 	  	
 	  	
 	  	select id,content,project_comment_date from PROJECT_COMMENT where project_no=21 and type='1'
 	  	
 	  	
 	  		select p.project_no,p.title,c.id,c.content,p.content,p.point,p.progressing,
 		to_char(p.project_date,'YYYY.MM.DD HH24:MI') as project_date,p.progressing_end_date 
 		from project_write p,project_comment c where p.project_no=c.project_no and p.achieve='모집중' and c.type=1 and p.project_no=31
 	 
 				select c.id,c.content,
 		to_char(p.project_date,'YYYY.MM.DD HH24:MI') as commentDate
 		from project_write p,project_comment c where p.project_no=c.project_no and p.achieve='모집중' and c.type=1 and p.project_no=31
 	 
 		
 
 	  	
 	  	select project_no,title,id,content,point,progressing,achieve,hit,
 		to_char(project_date,'YYYY.MM.DD HH24:MI') as project_date,progressing_end_date 
 		from project_write where id='java' and achieve='모집중'
 	  	
 	  	
 		
 			select p.project_no,c.id,c.content,
 		to_char(p.project_date,'YYYY.MM.DD') as project_date,
 		from project_write p,project_comment c where p.project_no=c.project_no and p.achieve='모집중' and c.type=1 and p.project_no=28
 	  	
 		
 			select p.project_no as boardNo,c.id,c.content,
 		to_char(p.project_date,'YYYY.MM.DD') as commentDate,
 		from project_write p,project_comment c where p.project_no=c.project_no and p.achieve='모집중' and c.type=1 and p.project_no='java'

 		
 		
 		