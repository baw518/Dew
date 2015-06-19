<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/login.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("form").submit(function(){
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
<form action="member_login.do" method="post">
  <div id="wrap">
   <h1 class="member">member login</h1>
   <div class="form">
    <div class="form2">
     <div class="form3">
      <label for="user">아이디</label><input type="text" id="user" name="id" style="background-color: #C6E2FF">
      <div class="clear"></div>
      <label for="user">비밀번호</label><input type="password" id="user"  name="memberPassword" style="background-color: #C6E2FF">
     </div>
  	 <input type="submit" id="sub" value="로그인">
     <div class="clear"></div>
     <div class="form4"><br>
      <label><input type="checkbox">아이디저장</label>
      <div class="clear"></div>
      <label><a href="member_registerView.do">회원가입</a></label> 
      <label><a href="member_findidView.do">아이디찾기</a></label>
      <label><a href="member_findpasswordView.do">비밀번호 찾기</a></label>
     </div>
    </div>
   </div>
  </div>
 </form>
