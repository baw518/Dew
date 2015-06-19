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
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<div class="dewTable">
	<table class="table" >
		<caption><h2>discussion게시판</h2></caption>
		<thead class="thead">
		<tr>
			<th class="tableNo">NO</th>
			<th class="tableTitle">제목</th>
			<th class="tableId">아이디</th>
			<!-- 주제 필요없어서 주석 처리 -->
			<th class="tableSubject">주제</th> 
			<th class="tableDate">작성일</th>
			<th class="tableHit">HIT</th>
			</tr>		
		</thead>
			<c:forEach var="dsvo" items="${requestScope.dslvo.list}">		
			<tr>
			    <td class="tableNo">${dsvo.discussionNo }</td>					
			    <td class="tableTitle"><a href="findDiscussContent.do?no=${dsvo.discussionNo }">${dsvo.title }</a></td>					
			    <td class="tableId">${dsvo.id }</td>	
			    <!-- 주제 필요없어서 주석 처리 -->				
			    <td class="tableSubject">${dsvo.discussionSubject }</td>		
			    <td class="tableDate">${dsvo.discussionDate }</td>					
			    <td class="tableHit">${dsvo.hit }</td>					 
			</tr>		
			</c:forEach>
				<tr>
		<td colspan="6" align="right">
			<c:if test="${sessionScope.mvo != null}">
				<a href="registerDiscussionForm.do"><img  src="${initParam.root}images/qna_write.jpg" border="0"></a>
			</c:if>
		</td>
	</tr>
	</table><br></br>	
</div>
<div class="page">
	<a href="discussion_listView.do?pageNo=${requestScope.dslvo.pagingBean.startPageOfPageGroup-1}">
	<c:if test="${requestScope.dslvo.pagingBean.previousPageGroup== true && requestScope.dslvo.pagingBean.nowPageGroup!=1}"><img src="${initParam.root}images/left.jpg" width="21" height="21"></c:if>
	</a>
	
	<c:forEach var="i" begin="${requestScope.dslvo.pagingBean.startPageOfPageGroup}" end="${requestScope.dslvo.pagingBean.endPageOfPageGroup}" step="1">
		<a href="discussion_listView.do?pageNo=${i}">${i}</a>
	</c:forEach>
	
	<a href="discussion_listView.do.do?&pageNo=${requestScope.dslvo.pagingBean.endPageOfPageGroup+1}">
		<c:if test="${requestScope.dslvo.pagingBean.nextPageGroup== true}"><img src="${initParam.root}images/right.jpg" width="21" height="21"></c:if>
	</a>
</div>
<br><br>