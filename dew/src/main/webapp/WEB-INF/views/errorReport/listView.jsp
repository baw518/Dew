<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
<tr><td width="1200"><u>E x c e p t i o n</u></td></tr>
<c:forEach items="${requestScope.exception }" var = "evo">
<tr>
<td width="400"  height="30" align="left"><a href="report_showContent.do?errorNo=${evo.errorNo }&type=exception">${evo.exceptionMessage }</a></td>

</tr>
</c:forEach>
<tr><td width="1200"><u>E r r o r C o d e</u></td></tr>
<c:forEach items="${requestScope.errorcode }" var="cvo">
<tr>
<td width="400" height="30" align="left"><a href="report_showContent.do?errorNo=${cvo.errorNo }&type=error">${cvo.errorCode }</a></td>
</tr>
</c:forEach>
</table>