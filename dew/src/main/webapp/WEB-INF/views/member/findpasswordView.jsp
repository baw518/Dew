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
			if($(":input[name=id]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}
			else if($(":input[name=birthDate]").val()==""){
				alert("생년월일를 입력하세요!");
				return false;
			}
				
		});
	
		});
</script>

</head>

<body>
<form action="findbypassword.do" method="post">

아이디를 입력하세요<input type="text" name="id" id="id"><br>
생년월일을 입력하세요<input type="text" name="birthDate" id="birthDate"><br>


<br><input type="submit" value="비밀번호 찾기">
</form>
</body>
</html>