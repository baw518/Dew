<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/login.css">

<form action="login.do" method="post">
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
      <label><input type="button"  id="but" value="회원가입"></label> <label><input
       type="button"  id="but" value="아이디/비밀번호 찾기"></label>
     </div>
    </div>
   </div>
  </div>
 </form>