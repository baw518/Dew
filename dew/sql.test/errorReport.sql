select er.error_report_no as errorNo,e.exception_message as exceptionMessage, er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null ;
select * from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_code is not null ;
select  er.error_report_no as errorNo,e.exception_message as exceptionMessage, er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null ;

select distinct e.exception_message as exceptionMessage, er.error_report_no as errorNo,  er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null
select distinct e.error_code as errorCode , er.error_report_no as errorNo,  er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_code is not null ;

select e.exception_message as exceptionMessage, to_char(error_report_date,'yyyy/mm/dd HH24:MI:SS') as reportdate , er.content as content from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_no ='3';
select e.error_code as errorCode, to_char(error_report_date,'yyyy/mm/dd HH24:MI:SS') as reportdate , er.content as content from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_no ='2';

select e.error_code as errorCode ,  e.exception_message as exceptionMessage,to_char(error_report_date,'yyyy/mm/dd HH24:MI:SS') as reportdate, er.id, er.discussion_status as discussionstatus from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_no = '3'

select * from error_report

select er.* , e.*  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no

insert into error(error_no,error_code) values(error_no.nextval,'HTTP Error 404. The requested resource is not found.');
insert into error_report(error_report_no,error_no,id,error_report_date,content)
values(error_report_no.nextval,error_no.currval,'java',sysdate,'해당 웹페이지가 삭제되었거나 찾지 못하였을 때 뜨는 오류일까?
주소를 정확히 적어서 다시해보시고 마찬가지이면 페이지가 삭제된 경우입니다.');

select e.error_code as errorCode ,  e.exception_message as exceptionMessage,to_char(error_report_date,'yyyy/mm/dd HH24:MI') as reportdate, er.id, er.discussion_status as discussionstatus from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_no = '13'
-- errorCode 와 exceptionMessage 추출
select e.error_code as errorCode ,  e.exception_message as exceptionMessage,to_char(error_report_date,'yyyy/mm/dd HH24:MI') as reportdate, er.id, er.discussion_status as discussionstatus from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_code='4412'
-- 해당 exception meesage 의 최근 등록/삭제 날짜를 가지고 exception Message의 최근 글 상세 내용을 출력
select e.exception_message as exceptionMessage, to_char(error_report_date,'yyyy/mm/dd HH24:MI:SS') as reportdate , er.content as content from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message ='4412' and er.error_report_date = (select max(er.error_report_date)    from error_report er, error e  where er.error_no =e.error_no and  e.exception_message ='4412')
-- 해당 exceptionMessage 의 최근 등록/삭제 날짜
(select max(er.error_report_date)    from error_report er, error e  where er.error_no =e.error_no and  e.exception_message ='4412')
-- distinct errorCode 출력 화면
select distinct(e.error_code) as errorCode   from error e , error_report er where e.error_no = er.error_no and e.exception_message is null order by e.error_code asc
-- distinct exceptionMessage 출력 화면
select distinct(e.exception_message) as errorCode   from error e , error_report er where e.error_no = er.error_no and e.error_code is null order by e.exception_message asc
-- 최근 작성/수정 code list
-- errorCode
select distinct(e.error_code) as errorCode , er.error_report_date as reportDate   from error e , error_report er where e.error_no = er.error_no and e.exception_message is null order by er.error_report_date desc
-- exceptionMessage
select distinct(e.exception_message) as errorCode, er.error_report_date as reportDate   from error e , error_report er where e.error_no = er.error_no and e.error_code is null order by er.error_report_date desc
-- 시작 단어로 검색하기 
-- errorCode
select distinct(e.error_code) as errorCode  from error e , error_report er where e.error_no = er.error_no and e.exception_message is null and e.error_code like 'e%' order by e.error_code asc 
-- exceptionMessage
select distinct(e.exception_message) as errorCode   from error e , error_report er where e.error_no = er.error_no and e.error_code is null  and e.exception_message like 'e%' order by e.exception_message asc

-- 끝 단어로 검색하기 
-- errorCode
select distinct(e.error_code) as errorCode  from error e , error_report er where e.error_no = er.error_no and e.exception_message is null and e.error_code like '%e' order by e.error_code asc 
-- exceptionMessage
select distinct(e.exception_message) as errorCode   from error e , error_report er where e.error_no = er.error_no and e.error_code is null  and e.exception_message like '%e' order by e.exception_message asc