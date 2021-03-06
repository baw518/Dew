<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(document).ready(function(){
	var type;
	var refer;
	
	if("${result.exceptionMessage}" !=null){
		type="ExceptionMessage";
		refer="${result.exceptionMessage}";
	}
	
	else{ 
		type="ErrorCode";
		refer="${result.errorCode}";
	}
	
	$("#getList").click(function(){
		location.href="report_listView.do";
	});
	$("#update").click(function(){
			location.href="report_updateView.do?errorNo=${requestScope.result.errorNo}&type="+type;

		
	});
	$("#reference").click(function(){
			location.href="report_referView.do?refer="+refer+"&type="+type;
	});
});
</script>
<title>ErrorReport Register Result</title>
  <link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
  <div class="main">
<table   class="dewTable" width="800">
<caption align="left"><h1> Report Register Result</h1></caption>
<thead>
<tr>
<th width="100">
<c:if test="${requestScope.result.exceptionMessage != null}">
ExceptionMessage
</c:if>
<c:if test="${requestScope.result.errorCode != null}">
ErrorCode
</c:if>
</th>
<th width="500">
 ${requestScope.result.exceptionMessage }
${requestScope.result.errorCode }
</th>
<th width="150">
<c:if test="${result.discussionStatus == 1}">
토론 있음
</c:if>
<c:if test="${result.discussionStatus == 0}">
토론 없음
</c:if> 
</th>
<th width="300">
최종 편집일 :<br>
${result.date }
</th>
</tr>
</thead>
<tr>
<td colspan="4" height="500">
<pre>
${result.content }
</pre>
</td>
</tr>
<tr >
	<td colspan="4" align="right"  style="border-bottom-color: #ffffff">
		<input type="button" value="관련글" id="reference">
		<input type="button" value="수정" id="update">
		<input type="button" value="목록" id="getList">
	</td>
</tr>
</table>
  </div>
