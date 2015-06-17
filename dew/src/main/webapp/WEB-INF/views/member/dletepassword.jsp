<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("passwordptn").submit(function(){
			if($(":input[name=id]").val()==""){
				
				return false;
			}
			
		});
	});
</script> -->
</head>
<body>
<form action="deltemember.do" method="post">
비밀번호을 입력하세요<input type="password" name="memberPassword" id="memberPassword"><br>
<input type="hidden" name="id" id="id" value="${sessionScope.mvo.id}">

<br><input type="submit" id="passwordptn" value="회원탈퇴">
</form>
</body>
</html>