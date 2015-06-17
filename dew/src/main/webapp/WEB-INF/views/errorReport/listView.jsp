<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br><br>
<table >
<caption><font size="25">E x c e p t i o n<br></font></caption>
<tr>
<c:forEach items="${requestScope.exception }" var = "evo" varStatus="status">
<td width="500" height="50" align="left"><a href="report_showContent.do?error=${evo }&type=exception"><u>${evo }</u></a></td>
<c:if test="${status.count %3==0}"></tr><tr></c:if> 
</c:forEach>
</tr>
</table>
<br><br><br>
<table >
<caption ><font size="25">E r r o r C o d e</font></caption><br>
<tr>
<c:forEach items="${requestScope.errorcode }" var="cvo" varStatus="status">
<td width="500" height="50" align="left"><a href="report_showContent.do?error=${cvo }&type=error"><u>${cvo }</u></a></td>
<c:if test="${status.count %3==0}"></tr><tr></c:if> 
</c:forEach>
</tr>
</table>