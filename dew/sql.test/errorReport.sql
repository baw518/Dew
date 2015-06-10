select * from ERROR_REPORT er, ERROR e where e.error_no = er.error_no and e.exception_message is not null ;
