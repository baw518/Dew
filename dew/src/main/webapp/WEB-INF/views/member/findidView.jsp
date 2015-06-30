<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("form").submit(function(){
			if($(":input[name=memberName]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}
			else if($(":input[name=birthDate]").val()==""){
				alert("비밀번호를 입력하세요!");
				return false;
			}
				
		});
	
		});
</script>
</head>

<body>
<div class="main" align="center">
<form action="member_findbyid.do" method="post">

<input type="text" class="form-control" placeholder="Name" name="memberName" id="memberName"><br>
<input type="text" class="form-control" placeholder="Date(yyyymmdd)" name="birthDate" id="birthDate"><br>

<br><input type="submit" value="아이디 찾기">
</form>
</div>
</body>
</html>