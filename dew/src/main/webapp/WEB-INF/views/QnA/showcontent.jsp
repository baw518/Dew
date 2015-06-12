<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#list").click(function(){
		location.href="QnA_listView.do";
	});
});
</script>

<table class="table" align="center" >
	<tr>
		<td>NO : ${requestScope.qvo.qnaNo } </td>
		<td colspan="2">${requestScope.qvo.title} </td>
	</tr>
	<tr>
		<td>작성자 :  ${requestScope.qvo.id }</td>
		<td> ${requestScope.qvo.date }</td>
		<td>조회수 : ${requestScope.qvo.hit }</td>
	</tr>
	<tr>
		<td colspan="3">
		<pre>${requestScope.qvo.content}</pre>
		</td>
	</tr>
	<tr>
		<td valign="middle" align="center" colspan="3">
			<input type="button" id="list" name="list" value="목록" id="list">
			<c:if test="${sessionScope.mvo.id == requestScope.qvo.id}">
				<input type="button" value="수정" id="change">
				<input type="button" value="삭제" id="delete">
			</c:if>
		 </td>
	</tr>
</table>