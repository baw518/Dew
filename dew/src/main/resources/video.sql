SELECT video_no,title,hit,id,video_date FROM(
	SELECT video_no,title,hit,id,video_date,CEIL(rownum/5) AS page FROM (
		SELECT video_no,title,hit,id,to_char(video_date,'YYYY.MM.DD') 
		as video_date FROM video_tutorial order by video_no desc
	)
) WHERE PAGE=1
insert into video_path(video_no,video_path)
	values(2,'123123')

	
insert into video_path(video_path_no,video_no,video_path)
	values(video_path_no.nextval,2,'123123')
	
	
	select * from video_file
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