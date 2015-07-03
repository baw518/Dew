<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="css/dew.css" />
<link rel="stylesheet" type="text/css" href="css/button.css" />
<link rel="stylesheet" type="text/css" href="css/font.css" />
<div class="left">
<div class="loginForm">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginForm").submit(function(){
			if($(":input[name=id]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}
			else if($(":input[name=memberPassword]").val()==""){
				alert("패스워드를 입력하세요!");
				return false;
			}
			$.ajax({
				type:"POST",
				url:"checkMemberLogin.do",
				data: "id="+$("#userId").val()+"&memberPassword="+$('#userPass').val(),
				success:function(flag){
					if(flag==false){
						alert("아이디와 비밀번호를 확인하세요");
						location.href="home.do";
					}
				}
			}); 
		});
	});
</script>
<c:choose>
	<c:when test="${sessionScope.mvo==null }">
	<!-- 세션이 없으면 보여준다.  -->
		<form id="loginForm" name="loginForm" action="member_login.do" method="post">
			&nbsp;&nbsp;
			<input class="input_form" type="text" name="id" id="userId" placeholder="id"><br>
			&nbsp;&nbsp;
			<input class="input_form" type="password" name="memberPassword" id="userPass" placeholder="password"><br>
			<input class="login_button" type="submit" value="LOGIN" id="loginBtn">
			<ul class="loginmenu">
			<li><a href="member_registerView.do" class="menu_font_red">SIGN UP</a></li>
			<li><a href="member_findidView.do" class="menu_font_red">ID SEARCH</a></li>
			<li><a href="member_findpasswordView.do" class="menu_font_red">PW SEARCH</a></li>
			</ul>
		</form>
		</c:when>
		<c:when test="${sessionScope.mvo.memberLevel == 0}">
		<span style="margin-left: 50px"><img src="${initParam.root }images/${sessionScope.mvo.id }.jpg"></span>
		<ul class="leftmenu">
			<li><a href="member_view.do" class="list_font">회원관리</a></li>
			<li><a href="member_insertRequest.do" class="list_font">토론방 등록 요청</a></li>
			<li><a href="member_deleteRequest.do" class="list_font">토론방 삭제 요청</a></li>
			<li><a href="member_logout.do" class="list_font">로그아웃</a></li>   
		</ul>
		</c:when>
		<c:otherwise>
		<span style="margin-left: 50px"><img src="${initParam.root }upload/img/${sessionScope.mvo.id}.jpg" width="150px"></span>
		<ul class="leftmenu">
			 <li><a href="member_profileForm.do" class="list_font">my page</a></li>
			 <li><a href="report_writeForm.do" class="list_font">add errorReport</a></li>
			 <li><a href="member_logout.do" class="list_font">logout</a></li>   
		</ul>
		</c:otherwise>
</c:choose>
</div>

</div>