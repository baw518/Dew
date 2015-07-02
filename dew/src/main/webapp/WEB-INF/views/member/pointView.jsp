<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<div class="main">
<body>
<form action = "member_pointUp.do" id = "pointForm" name = "pointForm">
	<input type= "text"  id = "pointInput" name = "pointInput">
	<input type="hidden" id="id"  name="id" value=${sessionScope.mvo.id }>
	<input type = "submit" value = "충전하기">
</form>

</body>
</div>
</html>