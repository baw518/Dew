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
	progressing_end_date varchar2(100) not null,
)
 drop sequence project_seq;
 create sequence project_seq; 

drop table project_depart;
create table project_depart(
	subject varchar2(50) not null,
	subject_man number not null,
	project_no number	not null,
	constraint fk_project_no_ex foreign key(project_no) references project_write(project_no)
)
drop table project_comment;
create table project_comment(
	project_comment_no number primary key,
	project_no number not null,
	id varchar2(50) not null,
	content clob not null,
	project_comment_date date not null,
	type number default 0,
	project_sub varchar2(50),
	constraint fk_reply_project_no_ex foreign key(project_no) references project_write(project_no)
)
drop sequence project_comment_seq;
create sequence project_comment_seq;
 
drop table chat
create table chat(
	chat_no number not null,
	project_no number not null,
	chat_content clob not null,
	chat_date date not null,
	constraint fk_chat_project_no_ex foreign key(project_no) references project_write(project_no)
)
drop sequence project_chat_seq;
create sequence project_chat_seq;

	select id,member_name,member_password,birth_date,member_level,contribution,point,password_question,password_answer from member where id='java' and member_password=1

