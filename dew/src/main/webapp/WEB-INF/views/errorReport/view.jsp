<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
<c:forEach items="${requestScope.exception }" var = "evo">
<tr>
<td width="400"  height="30" align="left"><a href="getContent?errorNo=${evo.errorNo }">${evo.exceptionMessage }</a></td>

</tr>
</c:forEach>
<c:forEach items="${requestScope.errorcode }" var="cvo">
<tr>
<td width="400" height="30" align="left"><a href="getContent?errorCode=${cvo.errorNo }">${cvo.errorCode }</a></td>
</tr>
</c:forEach>
</table>