select er.error_no as errorNo,e.exception_message as exceptionMessage, er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null ;
select * from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_code is not null ;
select er.error_no as errorNo,e.exception_message as exceptionMessage, er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null ;

select er.error_no as errorNo,e.exception_message as exceptionMessage, er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null
select er.error_no as errorNo, e.error_code as errorCode ,er.discussion_status as discussionstatus  from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.error_code is not null ;