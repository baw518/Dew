<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#writeForm").submit(function(){
		if($("#title").val()=="") {
			alert("제목을 입력해주세요!");
			return false;
		}
		if($("#content").val()=="") {
			alert("내용을 입력해주세요!");
			return false;
		}
		if(!confirm("등록하시겠습니까?")) {
			return false;
		}
	});
});
</script>

<form method="post" action="video_write.do" name = "writeForm" id = "writeForm">
	<table class="table" align="center" >
		<tr>
		<td>제목: <input type="text" id="title" name="title"></input></td>
		</tr>
		<tr>
			<td>내용: <input type="text" id="content" name="content" ></input></td>
		</tr>
		<tr>
			<td>비디오 경로: <input type="text" id="videoPath" name="videoPath" ></input></td>
		</tr>
		<!-- 
		<tr>
			<td>파일올리기</td>
		</tr>
		 -->
		 <tr>
			<td valign="middle" align="center" >
			<input type="hidden" id="id" name="id" value ="${sessionScope.mvo.id }"></input>
				<input type="submit" value="글 등록" >		
			 </td>
		</tr>
	</table>
</form>