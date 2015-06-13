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
	$("#change").click(function(){
		location.href="QnA_UpdateForm.do?qnaNo=${requestScope.qvo.qnaNo}";
	});
	$("#delete").click(function(){
		if("${requestScope.qvo.answerStatus}"==1){
			alert("채택완료된 답변글에대한 질문글은 삭제할수 없습니다.");
			return false;
		}
		if("${requestScope.qvo.answerStatus}"==2){
			alert("채택된 답변글은 삭제할수 없습니다.");
			return false;
		}
		if(!confirm("삭제를 하셔도 포인트를 돌려받지 못합니다. 삭제하시겠습니까??")){
			return false;
		}
		location.href="QnA_delete.do?qnaNo=${requestScope.qvo.qnaNo}";
	});
	
	$("#reply").click(function(){
		location.href="QnA_replyForm.do?qnaNo=${requestScope.qvo.qnaNo}";
	});
});
</script>

<table class="table" align="center" >
	<tr>
		<td>NO : ${requestScope.qvo.qnaNo } </td>
		<td colspan="3">${requestScope.qvo.title} </td>
	</tr>
	<tr>
		<td>작성자 :  ${requestScope.qvo.id }</td>
		<td>질문작성일 : ${requestScope.qvo.date }</td>
		<td>포인트 : ${requestScope.qvo.point }</td>
		<td>조회수 : ${requestScope.qvo.hit }</td>
	</tr>
	<tr>
		<td colspan="4">
		<pre>${requestScope.qvo.content}</pre>
		</td>
	</tr>
	<tr>
		<td>
			<c:if test="${sessionScope.mvo.id == requestScope.qvo.id}">
				<input type="button" id="reply" name="reply" value="답글달기">
			</c:if>
		</td>
		<td valign="middle" align="center" colspan="2">
			<input type="button" id="list" name="list" value="목록" id="list">
			<c:if test="${sessionScope.mvo.id == requestScope.qvo.id}">
				<input type="button" value="수정" name="change" id="change">
				<input type="button" value="삭제" name="delete" id="delete">
			</c:if>
		 </td>
		 <td></td>
	</tr>
</table>