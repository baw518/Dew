<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){

});

</script>

<center><h2>기여도 랭킹 순위</h2></center>
	<h3 align="right">
		<c:forEach items="${requestScope.rankingList}"  var="r" >
			<c:if test="${sessionScope.mvo.id == r.ID }">
				<font color='blue'>${sessionScope.mvo.id} 님의 랭킹은 ${r.RANKING}위 입니다.</font>
			</c:if>
		</c:forEach>
	</h3>
<br>
<table class="table">
	<thead>
		<tr>
			<td class="ranking">순위</td><td class="id">아이디</td><td class="score">기여도</td>
		</tr>
	</thead>
	
	<tbody>
	   	<c:forEach var="r" items="${requestScope.rankingList}" >
	   		<c:choose>
		   		<c:when test="${sessionScope.mvo.id == r.ID }">
					<tr bgcolor="orange">
						<td>${r.RANKING}위</td><td>${r.ID}</td><td>${r.CONTRIBUTION}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${r.RANKING}위</td><td>${r.ID}</td><td>${r.CONTRIBUTION}</td>
					</tr>
				</c:otherwise>
			</c:choose>
	   	</c:forEach>
   	</tbody>
</table>