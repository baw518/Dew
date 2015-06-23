<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<script>
$(document).ready(function(){
	if(${sessionScope.mvo.memberLevel != 0}){
		alert("관리자 접근 가능!");
		location.href="home.do";
	}
});
function outMember(a){
	var q = confirm(a+" 회원을 탈퇴시키겠습니까?");
	if(q){		
	location.href="member_deletemember.do?id="+a;
	}
}
</script>
<div class="main" align="center">
<c:choose>
	<c:when test="${sessionScope.mvo.memberLevel == 0}">
<table class="dewTable">
<thead>
	<tr>
		<th scope="cols">Id</th>
		<th scope="cols">Name</th>
		<th scope="cols">Score</th>
		<th scope="cols">Point</th>
		<th scope="cols">P.Q</th>
		<th scope="cols">P.A</th>
		<th scope="cols"></th>
	</tr>
</thead>
<c:forEach items="${requestScope.mlvo.list}" var="list" varStatus="status">
	<tr>
		<td>${list.id }<input type="hidden" id="id" name="id" value="${list.id }"></td>
		<td>${list.memberName }</td>
		<td>${list.score }</td>
		<td>${list.point }</td>
		<td>${list.passwordQuestion }</td>
		<td>${list.passwordAnswer }</td>
		<td><input type="button" name="outMemberBtn" value="탈퇴" onclick="outMember('${list.id}')"></td>

	</tr>
</c:forEach>
</table>
<div class="page">
<br><br>
	<a href="member_view.do?pageNo=${requestScope.mlvo.pagingBean.startPageOfPageGroup-1}">
	<c:if test="${requestScope.mlvo.pagingBean.previousPageGroup== true && requestScope.dslvo.pagingBean.nowPageGroup!=1}"><img src="${initParam.root}images/left.jpg" width="21" height="21"></c:if>
	</a>
	
	<c:forEach var="i" begin="${requestScope.mlvo.pagingBean.startPageOfPageGroup}" end="${requestScope.mlvo.pagingBean.endPageOfPageGroup}" step="1">
		<a href="member_view.do?pageNo=${i}">${i}</a>
	</c:forEach>
	
	<a href="member_view.do?&pageNo=${requestScope.mlvo.pagingBean.endPageOfPageGroup+1}">
		<c:if test="${requestScope.mlvo.pagingBean.nextPageGroup== true}"><img src="${initParam.root}images/right.jpg" width="21" height="21"></c:if>
	</a>
	</div>
	</c:when>
	<c:otherwise>
		<img src="${initParam.root }images/jjong.jpg">
	</c:otherwise>
</c:choose>

</div>