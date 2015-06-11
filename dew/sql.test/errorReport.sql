select er.error_no as errorNo,e.exception_message as exceptionMessage, er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null ;
select * from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_code is not null ;
select er.error_no as errorNo,e.exception_message as exceptionMessage, er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null ;

select er.error_no as errorNo,e.exception_message as exceptionMessage, er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null
select er.error_no as errorNo, e.error_code as errorCode ,er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_code is not null ;

select e.exception_message as exceptionMessage, to_char(error_report_date,'yyyy/mm/dd HH24:MI:SS') as reportdate , er.content as content from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_no ='3';
select e.error_code as errorCode, to_char(error_report_date,'yyyy/mm/dd HH24:MI:SS') as reportdate , er.content as content from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_no ='2';

