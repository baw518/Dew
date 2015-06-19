<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html >
<meta charset="UTF-8">
<title>Reference View</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>

<table border="1">
<caption>Reference</caption>
<tr >
<td width="100" rowspan="${fn:length(requestScope.vo.list)+1}">
${type }
</td>
<td width="500">
메 시 지 
</td>
<td width="200">
날 짜
</td>
<td width="70">
토 론
</td> 
<c:forEach items="${requestScope.vo.list }" var ="refer" varStatus="status">
<tr>
<td>
<c:if test="${refer.exceptionMessage != null}">
<a href="report_showContentByNo.do?errorNo=${refer.errorNo }&type=${type}">${refer.exceptionMessage }</a> 
</c:if>
<c:if test="${refer.errorCode != null}">
${refer.errorCode } 
</c:if>
</td>
<td>${refer.date }</td>
<td>
<c:if test="${refer.discussionStatus == 1}">
토론 있음
</c:if>
<c:if test="${refer.discussionStatus == 0}">
토론 없음
</c:if>
</td>
</tr>


</c:forEach>

</table>
<br><br>

<center>

	<a href="report_referView.do?pageNo=${requestScope.vo.pagingBean.startPageOfPageGroup-1}&refer=${refer }&type=${type}">
	<c:if test="${requestScope.vo.pagingBean.previousPageGroup== true && requestScope.vo.pagingBean.nowPageGroup!=1}">◀</c:if>
	</a>

	
	<c:forEach var="i" begin="${requestScope.vo.pagingBean.startPageOfPageGroup}" end="${requestScope.vo.pagingBean.endPageOfPageGroup}" step="1">
		<a href="report_referView.do?pageNo=${i}&refer=${refer }&type=${type}">${i}</a>
	</c:forEach>
	
	<a href="report_referView.do?&pageNo=${requestScope.vo.pagingBean.endPageOfPageGroup+1}&refer=${refer }&type=${type}">
		<c:if test="${requestScope.vo.pagingBean.nextPageGroup== true}">▶</c:if>
	</a>
	

</center>
<br><br>