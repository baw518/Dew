<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 토론방 생성 FORM  -->
${sessionScope.mvo.id }
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function(){
		// 확인 버튼 누르면 세션id/제목/주제/내용을 가지고 updateDiscussComment 로 감
		$("#submit").click(function(){
			alert($("#id").val());
			/* location.href="updateDiscussComment.do?id="+$("#id").val()+"&title="+$("#title").val()+"&subject="+$("#subject").val()+"&content="+$("#content").val(); */
		});
	});
</script>
<form>
<input type="hidden" name="id" value="${sessionScope.mvo.id }">
<table class="table">
	<tr>
		<td>제목 <input type="text" name="title" id="title"></td>
	</tr>
	<tr>
		<td>주제<input type="text" name="subject" id="subject"></td>
	</tr>
	<tr><td colspan="2">내용</td></tr>
	<tr>
		<td colspan="2">
			<textarea rows="10" cols="100" id="content" name="content"></textarea>
		</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="button" value="임시저장">
	<input type="button" value="미리보기">
	<input type="button" id="submit" value="확인">
	</td>
	</tr>
</table>
</form>