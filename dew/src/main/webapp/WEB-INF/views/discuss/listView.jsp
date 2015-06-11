<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%--    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글목록</title>
<link rel="stylesheet" href="${initParam.root}/css/board.css" type="text/css">
</head>
<body> --%>
<%-- <c:import url="/template/header.jsp"></c:import>	 --%>
	<table class="table" >
		<caption><h2>목록</h2></caption>
		<thead>
		<tr>
			<th class="discussionNo">NO</th>
			<th class="title">제목</th>
			<th class="id">아이디</th>
			<th class="discussionSubject">분류</th>
			<th class="discussionDate">작성일</th>
			<th class="hit">HIT</th>
			</tr>		
		</thead>	
			<c:forEach var="dsvo" items="${requestScope.dslvo.list}">		
			<tr>
			    <td>${dsvo.discussionNo }</td>					
			    <td><a href="findDiscussContent.do?no=${dsvo.discussionNo }">${dsvo.title }</a></td>					
			    <td>${dsvo.id }</td>					
			    <td>${dsvo.discussionSubject }</td>					
			    <td>${dsvo.discussionDate }</td>					
			    <td>${dsvo.hit }</td>					 
			</tr>		
			</c:forEach>
	</table><br></br>	
<br></br>	
<center>
	<a href="discussion_listView.do?pageNo=${requestScope.dslvo.pagingBean.startPageOfPageGroup-1}">
	<c:if test="${requestScope.dslvo.pagingBean.previousPageGroup== true && requestScope.dslvo.pagingBean.nowPageGroup!=1}">◀</c:if>
	</a>
	
	<c:forEach var="i" begin="${requestScope.dslvo.pagingBean.startPageOfPageGroup}" end="${requestScope.dslvo.pagingBean.endPageOfPageGroup}" step="1">
		<a href="discussion_listView.do?pageNo=${i}">${i}</a>
	</c:forEach>
	
	<a href="discussion_listView.do.do?&pageNo=${requestScope.dslvo.pagingBean.endPageOfPageGroup+1}">
		<c:if test="${requestScope.dslvo.pagingBean.nextPageGroup== true}">▶</c:if>
	</a>
</center>