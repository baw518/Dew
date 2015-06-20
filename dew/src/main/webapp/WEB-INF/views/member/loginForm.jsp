<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/login.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".loginBtn").submit(function(){
			if($(":input[name=id]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}
			if($(":input[name=memberPassword]").val()==""){
				alert("패스워드를 입력하세요!");
				return false;
			}
			
		});
	});
</script>
<link rel="stylesheet" href="${initParam.root }css/test.css">
<form action="member_login.do" method="post">
<br><br><br>
<div id="loginFormView">
<div class="loginForm" >
	<input type="text" class="loginId" id="user" name="id" placeholder="아이디를 입력해주세요"><br>
	<input type="password" class="loginPw" id="user" name="memberPassword" placeholder="비밀번호를 입력해주세요"><br>
	<div class="link"> <a href="member_registerView.do">회원가입</a> &nbsp;&nbsp;&nbsp; <a href="member_findidView.do">ID</a> / <a href="member_findpasswordView.do">PW</a></div>
	<input type="submit" class="loginBtn" value="SIGN IN">
</div>
</div>
<br><br><br>
 </form>