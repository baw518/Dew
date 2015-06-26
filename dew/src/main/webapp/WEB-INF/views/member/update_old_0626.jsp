<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main">
<form name="updateForm" action="member_update.do" method="post">
아이디 <input type="text" name="id" value="${sessionScope.mvo.id}" readonly="readonly"><br>
이름 <input type="text" name=memberName value="${sessionScope.mvo.memberName}"><br>
비밀번호<input type="text" name="memberPassword" value="${sessionScope.mvo.memberPassword}"><br>
생년월일<input type="text" name="birthDate" value="${sessionScope.mvo.birthDate}"readonly="readonly"><br>
질문<input type="text" name="passwordQuestion" value="${sessionScope.mvo.passwordQuestion}"><br>
질문에대한답변<input type="text" name="passwordAnswer" value="${sessionScope.mvo.passwordAnswer}"><br>

<input type="submit" value="수정하기" >
</form>
</div>
</body>
</html>






