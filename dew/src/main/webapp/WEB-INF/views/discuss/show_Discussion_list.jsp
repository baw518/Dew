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
	<table class="list" border=1>
		<caption>목록</caption>
		<thead>
		<tr>
			<th class="discussionNo">NO</th>
			<th class="title">TITLE</th>
			<th class="id">ID</th>
			<th class="discussionSubject">SUBJECT</th>
			<th class="discussionDate">DATE</th>
			<th class="hit">HIT</th>
			</tr>		
		</thead>	
			<c:forEach var="dsvo" items="${requestScope.dslvo.list}">		
			<tr>
			    <td>${dsvo.discussionNo }</td>					
			    <td>${dsvo.title }</td>					
			    <td>${dsvo.id }</td>					
			    <td>${dsvo.discussionSubject }</td>					
			    <td>${dsvo.discussionDate }</td>					
			    <td>${dsvo.hit }</td>					 
			</tr>		
			</c:forEach>
	</table><br></br>	
<br></br>	
<%-- <c:import url="/template/footer.jsp"></c:import>	 --%>
<!-- </body>
</html> -->