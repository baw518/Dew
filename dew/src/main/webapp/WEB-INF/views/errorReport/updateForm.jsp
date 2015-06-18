<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">

</script>

<title>Report_updateForm</title>
<form method="post" action="report_write.do">
<table border="1" class="table">
<tr><td width="100">
${type }
</td>
<c:choose>
<c:when test="${evo.exceptionMessage !=null }">
<td>${evo.exceptionMessage }
<input type="hidden" name="title" value="${evo.exceptionMessage }">
<input type="hidden" name="type" value="exception">
</td>
</c:when>
<c:otherwise>
<td>${evo.errorCode }
<input type="hidden" name="title" value="${evo.errorCode }"></td>
<input type="hidden" name="type" value="errorcode">
</c:otherwise>
</c:choose>
<td width="50">
<c:if test="${evo.discussionStatus == 1}">
토론 있음
</c:if>
<c:if test="${evo.discussionStatus == 0}">
토론 없음
</c:if>
</td>
<td width="150">
최종 편집일 :<br>
${evo.date }
</td>
</tr>
<tr><td align="center" colspan="4">내용 :<pre> <TEXTAREA name="content" rows="15" cols="100" >${evo.content }</TEXTAREA></pre></td></tr>
<tr><td align="right" colspan="4">
<input type="hidden" name="id" value="${sessionScope.mvo.id }">
<input type="hidden" name="writer" value="${sessionScope.mvo.memberName }">
<input type="submit" value="등록">


</td></tr>
</table>
</form>
