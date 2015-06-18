<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >

<head>
<meta charset="UTF-8">
<title>Dew Project</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#errorReportBtn").click(function(){
		location.href="report_listView.do";
	});
	$("#projectBtn").click(function(){
		location.href="project_main.do";
	});
	$("#QnABtn").click(function(){
		location.href="QnA_listView.do";
	});
	$("#discussBtn").click(function(){
		location.href="discussion_listView.do";
	});
	$("#videoBtn").click(function(){
		location.href="video_listView.do";
	});
	
});
</script>
<link rel="stylesheet" href="${initParam.root }css/test.css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
    
    <link rel="stylesheet" href="${initParam.root }css/bootstrap.css">
    <link rel="stylesheet" href="${initParam.root }css/normalize.min.css">
    <link rel="stylesheet" href="${initParam.root }css/templatemo-style.css">

<div id="headWrap" >

<a href="home.do"  >홈으로</a>
                                <c:choose>
                                   <c:when test="${sessionScope.mvo==null }">
                                <a href="login_form.do">로그인</a>
                                   </c:when>
                                   <c:otherwise>
                                <a href="report_writeForm.do">에러 리포트 등록</a>
                                <a href="member_mypageForm.do">마이 페이지</a>
                                 <a href="dletepassword.do?id=${sessionScope.vo.id}">회원탈퇴</a>
                                <a href="memberupdateview.do">회원수정</a>
                                <a href="logout.do">로그아웃</a>                  
                                   </c:otherwise>
                                   </c:choose>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<hr>
<h1 class="logo"><a href="home.do" >DEW</a></h1>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text"  class="search" >

<br><br>
<div id="menuWrap" >
<input type="button" class="menuBtn" value="에러리포트" id="errorReportBtn" >
<input type="button" class="menuBtn" value="프로젝트" id="projectBtn">
<input type="button" class="menuBtn" value="질의응답" id="QnABtn">
<input type="button" class="menuBtn" value="토론방" id="discussBtn">
<input type="button" class="menuBtn" value="동영상 강좌" id="videoBtn">
</div>
</div> 
<br>
</head>
