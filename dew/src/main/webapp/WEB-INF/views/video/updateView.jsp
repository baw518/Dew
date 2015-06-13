<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#updateForm").submit(function(){
		if(!confirm("수정하시겠습니까?")) {
			return false;
		}
	});
});
</script>

<form method="post" action="video_update.do" name = "updateForm" id = "updateForm">
	<table class="table" align="center" >
		<tr>
		<td>NO : ${requestScope.vvo.videoNo }<input type="hidden" id="videoNo" name="videoNo"value="${requestScope.vvo.videoNo }" readonly></td>
			<td colspan="3">제목: <input type="text" id="title" name="title" value="${requestScope.vvo.title}" ></td>
		</tr>
		<tr>
			<td>작성자 :  ${requestScope.vvo.id }</td>
			<td>작성 일자: ${requestScope.vvo.videoDate }</td>
			<td>조회수 : ${requestScope.vvo.hit }</td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="text" id="content" name="content" value="${requestScope.vvo.content}" >
			</td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
				<input type="submit" value="수정하기" >		
			 </td>
		</tr>
	</table>
</form>