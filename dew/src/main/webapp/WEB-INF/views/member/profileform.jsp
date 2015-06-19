<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form  action="member_profile.do" method="post">
아이디 <input type="text" name="id" value="${sessionScope.mvo.id}" readonly="readonly"><br>
이름 <input type="text" name=memberName value="${sessionScope.mvo.memberName}" readonly="readonly"><br>
비밀번호<input type="text" name="memberPassword" value="${sessionScope.mvo.memberPassword}" readonly="readonly"><br>
생년월일<input type="text" name="birthDate" value="${sessionScope.mvo.birthDate}"readonly="readonly"><br>
사용자 점수<input type="text" name="score" value="${sessionScope.mvo.score}" readonly="readonly"><br>
보유머니<input type="text" name="point" value="${sessionScope.mvo.point}" readonly="readonly"><br>
질문<input type="text" name="passwordQuestion" value="${sessionScope.mvo.passwordQuestion}" readonly="readonly"><br>
질문에대한답변<input type="text" name="passwordAnswer" value="${sessionScope.mvo.passwordAnswer}" readonly="readonly"><br>


</form>
<a href="member_mypageForm.do">마이페이지 홈으로</a><br>
<a href="member_updateview.do">회원정보 수정하기</a><br>
<a href="member_deleteview.do">회원탈퇴하기</a><br>



</body>
</html>