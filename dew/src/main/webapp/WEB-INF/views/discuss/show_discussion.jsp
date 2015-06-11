<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%-- ${requestScope.list}  --%>
 ${requestScope.list[0].discussionNo} 
 ${requestScope.list[0].id} 
 ${requestScope.list[0].title} 
 ${requestScope.list[0].content} 
 ${requestScope.list[0].discussionDate} 
 ${requestScope.list[0].hit} 
 ${requestScope.list[0].discussionSubject} 

