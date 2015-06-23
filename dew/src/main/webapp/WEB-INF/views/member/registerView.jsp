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
		$(".loginBtn").submit(function(){
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
<div class="main">
<form  action="member_register.do" method="post">
<div class="registerForm">
	<input type="text" class="registerName"  name="memberName" id="memberName" placeholder="이름을 입력해주세요"><br>
	<input type="text" class="register1" name="id" id="id"  placeholder="아이디를 입력해주세요"><br>
	<input type="password" class="register2" id="memberPassword"name="memberPassword" placeholder="비밀번호를 입력해주세요"><br>
	<input type="text" class="registerDate" id="birthDate" name="birthDate" placeholder="생년월일을 8자리 숫자로 입력해주세요"><br>
	<input type="text" class="registerJob" placeholder="직종을 선택해주세요" readonly="readonly"><br>
	<c:forEach var="item" varStatus="i" items="${requestScope.list}">
	<input type="radio" id="jobNo" name="jobNo" value="${item.jobNo}" placeholder="직종선택"><span class="radioText">${item.jobName}</span>
	</c:forEach> 
	<br><br>
	<input type="text" class="register1" id="passwordQuestion" name="passwordQuestion" placeholder="비밀번호 찾기 질문을 입력해주세요"><br>
	<input type="text" class="register2" id="passwordAnswer" name="passwordAnswer" placeholder="비밀번호 찾기 답을 입력해주세요"><br>
	<br><br>
<input type="submit" class="loginBtn" value="SIGN UP">
</div>
</form>
</div>











