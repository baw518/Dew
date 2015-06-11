<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table class="table" border="1" >
<c:forEach items="${requestScope.exception }" var = "evo">
<tr><td>${evo.exceptionMessage }</td></tr>
</c:forEach>

<c:forEach items="${requestScope.errorcode }" var="cvo">
<tr><td>${cvo.errorCode }</td></tr>
</c:forEach>

<tr><td>하하하</td><td>asfds</td></tr>
</table>