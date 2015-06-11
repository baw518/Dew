<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  ${requestScope.dsvo}  --%>
<%--  ${requestScope.list[0].discussionNo} 
 ${requestScope.list[0].id} 
 ${requestScope.list[0].title} 
 ${requestScope.list[0].content} 
 ${requestScope.list[0].discussionDate} 
 ${requestScope.list[0].hit} 
 ${requestScope.list[0].discussionSubject}  --%>
 <table class="table">
 	<tr>
 		<td class="discussionNo"> ${requestScope.dsvo.discussionNo} </td>
 		<td class="title"> ${requestScope.dsvo.title} </td>
 		<td class="discussionSubject">${requestScope.dsvo.discussionSubject} </td>
 		<td class="discussionDate"> ${requestScope.dsvo.discussionDate} </td>
 		<td class="hit"> ${requestScope.dsvo.hit} </td>
 	</tr>
 	<tr>
 		<td class="id" colspan="5">${requestScope.dsvo.id} </td>
 	</tr>
 	<tr>
 		<td class="content" colspan="5">${requestScope.dsvo.content} </td>
 	</tr>
 </table>

