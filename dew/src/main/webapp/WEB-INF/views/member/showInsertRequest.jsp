<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
	function insertBoard(a){
		var q =  confirm(a+"번 게시글을 등록하시겠습니까?");
		if(q){
			location.href="discussion_requestInsert.do?no="+a;
		}
	}
	function noInsertBoard(a){
		var q =  confirm(a+"번 게시글 등록요청을 무시하시겠습니까?");
		if(q){
			location.href="discussion_requestNoInsert.do?no="+a;
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
${type }
<c:choose>
	<c:when test="${sessionScope.mvo.memberLevel == 0}">
<table class="dewTable">
	<thead>
	<tr>
		<th></th>
		<th>Id</th>
		<th>No</th>
		<th></th>
	</tr>
	<c:forEach items="${requestScope.list}" var="list" varStatus="status">
		<tr>
			<td>${count.count}</td>
			<td>${list.id }</td>
			<td>${list.no }</td>
			<td align="center">
			<input type="button" name="insert" value="등록" onclick="insertBoard('${list.no}')">
			<input type="button" name="noInsert" value="취소" onclick="noInsertBoard('${list.no}')">			
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