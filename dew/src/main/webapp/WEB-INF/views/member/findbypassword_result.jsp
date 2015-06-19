<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<form action="member_findbypassowrd2.do" method="post">
질문${requestScope.vo.passwordQuestion}?<br>
질문에대한 답을 입력하세요?<input type="text" name="passwordAnswer" id="passwordAnswer"><br>
<input type="hidden" name="id" id="id" value="${requestScope.vo.id}">
확인<input type="submit" value="확인">


</form>
</body>

</html>