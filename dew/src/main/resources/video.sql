select * from member
select * from qna
select * from deleteid
delete from deleteid where id='java'
select * from deletid
select * from project_write order by project_no desc
select project_no,title from project where rownum <=5 order by project_no desc

select project_no,title from project_write where achieve='모집중' and rownum <=5 order by project_no desc


update member set contribution=contribution+999999 where id='admin';


select id,member_name,member_level,contribution,point from member order by contribution desc
select * from video_tutorial order by video_no desc

select * from error
select * from error_report order by error_report_date desc
select * from update_error_report

select * from error


select * from error_report
--------
select errorCode, reportDate
from(
		select distinct(e.error_code) as errorCode , er.error_report_date as reportDate
		from error e , error_report er 
		where e.error_no = er.error_no and e.exception_message is null or e.error_code is not null 
		order by er.error_report_date desc)
where rownum <=5
---------
select exceptionMessage
from(select distinct(e.exception_message) as exceptionMessage, er.error_report_date as reportDate   
		from error e , error_report er 
		where e.error_no = er.error_no and e.error_code is null 
		order by er.error_report_date desc)
where rownum<=5
----



SELECT video_no,title,hit,id,video_date FROM(
	SELECT video_no,title,hit,id,video_date,CEIL(rownum/5) AS page FROM (
		SELECT video_no,title,hit,id,to_char(video_date,'YYYY.MM.DD') 
		as video_date FROM video_tutorial order by video_no desc
	)
) WHERE PAGE=1
insert into video_path(video_no,video_path)
	values(2,'123123')
select * from qna
	
insert into video_path(video_path_no,video_no,video_path)
	values(video_path_no.nextval,2,'123123')

select * from member
select video_no,title,hit,id,video_date,content
		from video_tutorial
		where video_no=#{value}
		
update video_tutorial set hit=hit+1 where video_no=1

select count(*) from
		video_tutorial
		
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 목요일 공성','목요일공성',sysdate,'123123123')
		
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 목요일 공성','금요일공성',sysdate,'123123123')
		
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 목요일 공성','토요일공성',sysdate,'123123123')
		
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 토요일 공성','일요일공성',sysdate,'123123123')
		
		
insert into video_tutorial(video_no,id,title,content,video_date,video_path) 
		values(video_no.nextval,'admin','세븐나이츠 목요일 공성','목요일공성',sysdate,'123123123')