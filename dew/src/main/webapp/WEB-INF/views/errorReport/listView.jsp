<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<br><br>
<div class="main" align="center">	
<table class="dewErrorReportTable" >
<caption><font size="25">E x c e p t i o n</font><br>
<hr></caption><br>

<tr>
<c:forEach items="${requestScope.exception }" var = "evo" varStatus="status">
<td ><a href="report_showContent.do?error=${evo }&type=exception" class="hover_font"><u>${evo }</u></a></td>
	<c:if test="${status.count != fn:length(requestScope.exception)-1 }">
		<c:if test="${status.count %3==0}"></tr><tr></c:if> 
	</c:if>
</c:forEach>
</tr>
</table>

<br><br><br>

<table class="dewErrorReportTable">
<caption ><font size="25">E r r o r C o d e</font><br>
<hr></caption><br>
<tr>
<c:forEach items="${requestScope.errorcode }" var="cvo" varStatus="status">
<td ><a href="report_showContent.do?error=${cvo }&type=error" class="hover_font"><u>${cvo }</u></a></td>
	<c:if test="${status.count != fn:length(requestScope.errorcode)-1 }">
		<c:if test="${status.count %3==0}"></tr><tr></c:if> 
	</c:if>
</c:forEach>
</tr>
</table>
<br><br><br>
<br><br>
</div>