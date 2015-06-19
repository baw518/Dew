<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jquery-1.11.0.js"></script>

<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("form").submit(function(){
			if($(":input[name=id]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}
			else if($(":input[name=memberPassword]").val()==""){
				alert("비밀번호를 입력하세요!");
				return false;
			}
			
			else if($(":input[name=birthDate]").val()==""){
				alert("생년월일를 입력하세요!");
				return false;
			}
			
			else if($(":input[name=passwordQuestion]").val()==""){
				alert("질문을 입력하세요!");
				return false;
			}
			else if($(":input[name=passwordAnswer]").val()==""){
				alert("질문에 대한 답을 입력하세요!");
				return false;
			}else{
				if($(":input[name=birthDate]").length==8){
					alert("제대로된 생년월일 8글자 입력해주세요");
					return false;
				}
			}
			
			
		});
	
		});
</script>
</head>
<body>
 
<form  action="member_register.do" method="post">
<!-- private String id;
	private String memberName;
	private String memberPassword;
	private String birthDate;
	private String memberLevel;
	private int userType;
	private int score;
	private int point;
	private String passwordQuestion;
	private String passwordAnswer; -->
id <input type="text" name="id" id="id" ><br>
이름<input type="text" name="memberName" id="memberName"><br>
패스워드 <input type="password" id="memberPassword"name="memberPassword"><br>
생년월일<input type="text"id="birthDate" name="birthDate"><br>
질문<input type="text"id="passwordQuestion" name="passwordQuestion"><br>
질문에 대한 답변<input type="text"id="passwordAnswer" name="passwordAnswer"><br>

<c:forEach var="item" varStatus="i" items="${requestScope.list}">
 <input type="radio" id="jobNo" name="jobNo" value="${item.jobNo}"> ${item.jobName} <br>
</c:forEach> 
<br><input type="submit" value="회원가입">
</form>

</body>
</html>











