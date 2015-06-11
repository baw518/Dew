<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table border="1" class="content" align="center" >
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
			<input type="button" value="수정">
			<input type="button" value="삭제">
			<input type="button" value="목록">
		 <%-- <img class="action" src="${initParam.root}img/list_btn.jpg" onclick="sendList()" >
		 <img class="action"  onclick="winOpen('delete')" 	src="${initParam.root}img/delete_btn.jpg" > 
		 <img class="action"  onclick="winOpen('update')"  src="${initParam.root}img/modify_btn.jpg" > --%>
		 </td>
	</tr>
</table>