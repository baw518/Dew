<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 토론방 생성 FORM  -->
<c:choose>
<c:when test="${sessionScope.mvo !=null}">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function(){
		// 확인 버튼 누르면 세션id/제목/주제/내용을 가지고 updateDiscussComment 로 감
		$("#submit").click(function(){
			location.href="registerDiscussion.do?id="+$("#sessionId").val()+"&title="+$("#title").val()+"&subject="+$("#subject").val()+"&content="+$("#content").val(); 
		});
	});
</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<div class="main">

<input type="hidden" id="sessionId" name="sessionId" value="${sessionScope.mvo.id}">
<form>
<%-- <input type="hidden" name="id" value="${sessionScope.mvo.id }"> --%>
<table class="dewTable">
<caption><h1>write Discussion</h1></caption>
	<tr>
		<td>제목 <input type="text" name="title" id="title" ></td>
	</tr>
	<tr>
		<td>주제<input type="text" name="subject" id="subject"></td>
	</tr>
	<tr><td colspan="2" style="border-bottom: 3px solid #fbe762">내용</td></tr>
	<tr>
		<td colspan="2" style="border-bottom-color: #ffffff">
			<textarea rows="10" cols="100" id="content" name="content"></textarea>
		</td>
	</tr>
	<tr>
	<td colspan="2" align="center" style="border-bottom-color: #ffffff">
	<input type="button" value="임시저장">
	<input type="button" value="미리보기">
	<input type="button" id="submit" value="확인">
	</td>
	</tr>
</table>
</form>
</c:when>
<c:otherwise>
	로그인해..
</c:otherwise>
</c:choose>
</div>