<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#getList").click(function(){
		location.href="report_listView.do";
	$("#update").click(function(){
		var type ="${requestScope.type}" ;
		if( type =="ExceptionMessage"){
			location.href="report_updateView.do?errorNo=${requestScope.exception.errorNo}&type="+type;
		}else if(type == "ErrorCode"){
			location.href="report_updateView.do?errorNo=${requestScope.errorcode.errorNo}&type="+type;
		}
		
	});
});
</script>
<table class="table" >
<c:if test="${requestScope.exception !=null }">
<tr>
<td width="100">Exception Message </td>
<td witdh="200">${exception.exceptionMessage }</td>
<td width="50">
<c:if test="${exception.discussionStatus !=0 }">
토론없음
</c:if>
<c:if test="${exception.discussionStatus ==0 }">
토론있음
</c:if>
</td>
<td width="150">
최종 편집일 :<br>
${exception.date }
</td>
</tr>
<tr><td colspan="4">
<pre>
${exception.content }
</pre>
</td></tr>

</c:if>
<c:if test="${requestScope.errorcode !=null }">
<tr>
<td width="100">Error Code </td>
<td witdh="200">${errorcode.errorCode }</td>
<td width="50">
<c:if test="${errorcode.discussionStatus ==0 }">
토론없음
</c:if>
<c:if test="${errorcode.discussionStatus !=0 }">
토론있음
</c:if>
</td>
<td width="150">
최종 편집일 :<br>
${errorcode.date }
</td>
</tr>
<tr><td colspan="4">
<pre>
${errorcode.content }
</pre>
</td></tr>

</c:if>
<tr>
<td align="right" colspan="4">
<c:if test="${sessionScope.mvo !=null }">
<input type="button" value="편집" id="update">
</c:if>
<input type="button" value="목록" id="getList">
</td>
</tr>
</table>

