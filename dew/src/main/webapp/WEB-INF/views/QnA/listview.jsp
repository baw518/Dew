<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<title>QnA 게시판 입니다.</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#group").change(function(){
		
	});
});
</script>
</head>

<center><h2>QnA게시판</h2></center>

분류 : 
<select id="group">
	<option value="">전체보기</option>
	<c:forEach items="${requestScope.groupList}" var="i">
		<option value="i">${i.qnAGroupName }</option>
	</c:forEach>
</select> 



<table class="table">
	<thead>
	<tr>
		<th class="no" >NO</th>
		<th class="title" >제목</th>
		<th class="id">아이디</th>
		<th class="date">작성일</th>
		<th class="hit">HIT</th>
		</tr>
	</thead>
	<tbody>			
	<c:forEach var="list" items="${requestScope.vo.list}">				
		<tr>
		    <td>${list.qnaNo }</td>				
			<td ><a href="QnA_showContent.do?qnaNo=${list.qnaNo}">
			${list.title }</a></td>
			<td>${list.id }</td>
			<td>${list.date }</td>
			<td>${list.hit }</td>
		</tr>	
	</c:forEach>
	<tr>
		<td colspan="5" align="right">
			<a href="QnA_write.do"><img  src="${initParam.root}images/qna_write.jpg" border="0"></a>
		</td>
	</tr>
	</tbody>
</table>

<center>
	<a href="QnA_listview.do?pageNo=${requestScope.vo.pagingBean.startPageOfPageGroup-1}">
	<c:if test="${requestScope.vo.pagingBean.previousPageGroup== true && requestScope.vo.pagingBean.nowPageGroup!=1}">◀</c:if>
	</a>
	
	<c:forEach var="i" begin="${requestScope.vo.pagingBean.startPageOfPageGroup}" end="${requestScope.vo.pagingBean.endPageOfPageGroup}" step="1">
		<a href="QnA_listview.do?pageNo=${i}">${i}</a>
	</c:forEach>
	
	<a href="QnA_listview.do?&pageNo=${requestScope.vo.pagingBean.endPageOfPageGroup+1}">
		<c:if test="${requestScope.vo.pagingBean.nextPageGroup== true}">▶</c:if>
	</a>
</center>

<br>
<br>
<br>
