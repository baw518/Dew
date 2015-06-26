<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
	function deleteBoard(a){
		var q =  confirm(a+"번 게시글을 삭제하시겠습니까?");
		if(q){
			location.href="discussion_requestDelete.do?no="+a;
		}
	}
	function noDeleteBoard(a){
		var q =  confirm(a+"번 게시글 삭제요청을 취소하시겠습니까?");
		if(q){
			location.href="discussion_requestNoDelete.do?no="+a;
		}
	}
	$(document).ready(function(){
		if(${sessionScope.mvo.memberLevel != 0}){
			alert("관리자 접근 가능!");
			location.href="home.do";
		}
	});
</script>
<div class="main">
<c:choose>
	<c:when test="${sessionScope.mvo.memberLevel == 0}">
<table class="dewTable">
	<thead>
	<tr>
		<th>Id</th>
		<th>No</th>
		<th></th>
	</tr>
	<c:forEach items="${requestScope.list}" var="list">
		<tr>
			<td>${list.id }</td>
			<td>${list.no }</td>
			<td align="center">
			<input type="button" name="delete" value="삭제" onclick="deleteBoard('${list.no}')">
			<input type="button" name="noDelete" value="취소" onclick="noDeleteBoard('${list.no}')">			
			</td>
		</tr>
	</c:forEach>
	</thead>
</table>
</c:when>
<c:otherwise>
	<img src="${initParam.root }images/jjong.jpg">
</c:otherwise>
</c:choose>
</div>

