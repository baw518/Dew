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
