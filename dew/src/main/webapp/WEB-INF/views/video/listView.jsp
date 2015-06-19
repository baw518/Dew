<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#write").click(function(){
		location.href="video_writeView.do";
	});
});
</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<title>Video 게시판 입니다.</title>
<br>
<div class="dewTable">
<table class="table">
<caption><h2>Video게시판</h2></caption>
	<thead class="thead">
	<tr>
		<th class="tableNo" >NO</th>
		<th class="tableTitle" >제목</th>
		<th class="tableId">아이디</th>
		<th class="tableDate">작성일</th>
		<th class="tableHit">HIT</th>
		</tr>
	</thead>
	<tbody>			
	<c:forEach var="list" items="${requestScope.vo.list}">				
		<tr>
		    <td class="tableNo" >${list.videoNo }</td>				
			<td class="tableTitle" ><a href="video_showContent.do?no=${list.videoNo}">
			${list.title }</a></td>
			<td class="tableId">${list.id }</td>
			<td class="tableDate">${list.videoDate }</td>
			<td class="tableHit">${list.hit }</td>
		</tr>	
	</c:forEach> 
	<tr>
		<td colspan="5" align="right">
			 <c:if test="${sessionScope.mvo.memberLevel == 0}">
				<input type="button" value="글쓰기" id="write">
			</c:if>
		</td>
	</tr>
	</tbody>
</table>
</div>
<div class="page">
	<a href="video_listView.do?pageNo=${requestScope.vo.pagingBean.startPageOfPageGroup-1}">
	<c:if test="${requestScope.vo.pagingBean.previousPageGroup== true && requestScope.vo.pagingBean.nowPageGroup!=1}"><img src="${initParam.root}images/left.jpg" width="21" height="21"></c:if>
	</a>
	<c:forEach var="i" begin="${requestScope.vo.pagingBean.startPageOfPageGroup}" end="${requestScope.vo.pagingBean.endPageOfPageGroup}" step="1">
		<a href="video_listView.do?pageNo=${i}">${i}</a>
	</c:forEach>
	<a href="video_listView.do?&pageNo=${requestScope.vo.pagingBean.endPageOfPageGroup+1}">
		<c:if test="${requestScope.vo.pagingBean.nextPageGroup== true}"><img src="${initParam.root}images/right.jpg" width="21" height="21"></c:if>
	</a>
</div>

<br>
<br>
<br>