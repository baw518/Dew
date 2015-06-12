<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#list").click(function(){
		location.href="video_listView.do";
	});
	$("#delete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			location.href="video_delete.do?no=${requestScope.vvo.videoNo}";
		}
	});
	$("#update").click(function(){
		if(confirm("수정하시겠습니까?")){
			location.href="video_updateView.do?no=${requestScope.vvo.videoNo}";
		}
	});
});
</script>
<table class="table" align="center" >
	<tr>
	<td>NO : ${requestScope.vvo.videoNo } </td>
		<td colspan="2">${requestScope.vvo.title} </td>
	</tr>
	<tr>
		<td>작성자 :  ${requestScope.vvo.id }</td>
		<td> ${requestScope.vvo.videoDate }</td>
		<td>조회수 : ${requestScope.vvo.hit }</td>
	</tr>
	<tr>
		<td colspan="3">
		<pre>${requestScope.vvo.content}</pre>
		</td>
	</tr>
	<tr>
		<td valign="middle" align="center" colspan="3">
			<input type="button" value="목록" id="list">
			<c:if test="${sessionScope.mvo.memberLevel == 0}">
				<input type="button" value="수정" id="update">
				<input type="button" value="삭제" id="delete">
			</c:if>
		 </td>
	</tr>
</table>