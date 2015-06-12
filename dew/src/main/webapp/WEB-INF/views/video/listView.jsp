<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Video 게시판 입니다.</title>
<br>
<center><h2>Video게시판</h2></center>
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
		    <td>${list.videoNo }</td>				
			<td ><a href="video_showContent.do?no=${list.videoNo}">
			${list.title }</a></td>
			<td>${list.id }</td>
			<td>${list.videoDate }</td>
			<td>${list.hit }</td>
		</tr>	
	</c:forEach> 
	<tr>
		<td colspan="5" align="right">
			<%-- <a href="QnA_write.do"><img  src="${initParam.root}images/qna_write.jpg" border="0"></a> --%>
		</td>
	</tr>
	</tbody>
</table>

<center>
	<a href="video_listView.do?pageNo=${requestScope.vo.pagingBean.startPageOfPageGroup-1}">
	<c:if test="${requestScope.vo.pagingBean.previousPageGroup== true && requestScope.vo.pagingBean.nowPageGroup!=1}">◀</c:if>
	</a>
	<c:forEach var="i" begin="${requestScope.vo.pagingBean.startPageOfPageGroup}" end="${requestScope.vo.pagingBean.endPageOfPageGroup}" step="1">
		<a href="video_listView.do?pageNo=${i}">${i}</a>
	</c:forEach>
	<a href="video_listView.do?&pageNo=${requestScope.vo.pagingBean.endPageOfPageGroup+1}">
		<c:if test="${requestScope.vo.pagingBean.nextPageGroup== true}">▶</c:if>
	</a>
</center>

<br>
<br>
<br>