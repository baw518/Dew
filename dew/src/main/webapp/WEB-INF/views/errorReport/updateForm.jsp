<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">

</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<title>Report_updateForm</title>
<div class="main">
<form method="post" action="report_write.do">
<table class="dewTable">
<thead>
<tr><th width="100">
${type }
</th>
<c:choose>
<c:when test="${evo.exceptionMessage !=null }">
<th>${evo.exceptionMessage }
<input type="hidden" name="title" value="${evo.exceptionMessage }">
<input type="hidden" name="type" value="exception">
</th>
</c:when>
<c:otherwise>
<th>${evo.errorCode }
<input type="hidden" name="title" value="${evo.errorCode }"></th>
<input type="hidden" name="type" value="errorcode">
</c:otherwise>
</c:choose>
<th width="100">
<c:if test="${evo.discussionStatus == 1}">
토론 있음
</c:if>
<c:if test="${evo.discussionStatus == 0}">
토론 없음
</c:if>
</th>
<th width="150">
최종 편집일 :<br>
${evo.date }
</th>
</tr>
</thead>
<tr><td align="center" colspan="4">내용 :<pre> <TEXTAREA name="content" rows="15" cols="100" >${evo.content }</TEXTAREA></pre></td></tr>
<tr><td align="right" colspan="4" style="border-bottom-color: #ffffff">
<input type="hidden" name="id" value="${sessionScope.mvo.id }">
<input type="hidden" name="writer" value="${sessionScope.mvo.memberName }">
<c:choose>
<c:when test="${sessionScope.mvo.id == requestScope.evo.id }">
<input type="hidden" name="errorNo" value="${evo.errorNo }">
<input type="hidden" name="command" value="update">
<input type="submit" value="편집" >
</c:when>
<c:otherwise>
<input type="hidden" name="command" value="register">
<input type="submit" value="등록">
</c:otherwise>
</c:choose>

</td></tr>
</table>
</form>
</div>
