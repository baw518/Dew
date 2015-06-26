<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var type ="${requestScope.type}" ;
	var refer ;
	$("#reference").click(function(){
		if(type =="ExceptionMessage"){
			refer = "${exception.exceptionMessage }";
		}else{
			refer = "${errorcode.errorCode }";
		}
		location.href="report_referView.do?refer="+refer+"&type="+type;
	});
	
	$("#getList").click(function(){
		location.href="report_listView.do";
	});
	
	$("#update").click(function(){
		
		if( type =="ExceptionMessage"){
			location.href="report_updateView.do?errorNo=${requestScope.exception.errorNo}&type="+type;
		}else if(type == "ErrorCode"){
			location.href="report_updateView.do?errorNo=${requestScope.errorcode.errorNo}&type="+type;
		}
	});
	$("#myupdate").click(function(){
		if( type =="ExceptionMessage"){
			location.href="report_updateView.do?errorNo=${requestScope.exception.errorNo}&type="+type;
		}else if(type == "ErrorCode"){
			location.href="report_updateView.do?errorNo=${requestScope.errorcode.errorNo}&type="+type;
		}
	});
	$("#insertManagerBtn").click(function(){
		if( type =="ExceptionMessage"){
			location.href="insertManager.do?no=${requestScope.exception.errorNo}";
		}else if(type == "ErrorCode"){
			location.href="insertManager.do?no=${requestScope.errorcode.errorNo}";
		}
	});
});
</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<div class="main">


<table class="dewTable" >
<c:if test="${requestScope.exception !=null }">
<thead>
<tr>
<th>Exception Message </th>
<th>${exception.exceptionMessage }</th>
<th>
<c:if test="${exception.discussionStatus ==0 }">
토론없음
</c:if>
<c:if test="${exception.discussionStatus ==1 }">
토론있음
</c:if>
</th>
<td>
최종 편집일 :<br>
${exception.date }
</td>
</tr>
</thead>
<tr><td colspan="4">
<pre>
${exception.content }
</pre>
</td></tr>

</c:if>
<c:if test="${requestScope.errorcode !=null }">
<thead>
<tr>
<th>Error Code </th>
<th>${errorcode.errorCode }</th>
<th>
<c:if test="${errorcode.discussionStatus == 1}">
토론 있음
</c:if>
<c:if test="${errorcode.discussionStatus == 0}">
토론 없음
</c:if>
</th>
<th width="150">
최종 편집일 :<br>
${errorcode.date }
</th>
</tr>
</thead>
<tr><td colspan="4">
<pre>
${errorcode.content }
</pre>
</td></tr>

</c:if>
<tr>
<td align="right" colspan="4">

<input type="button" value="관련글" id="reference">

	<c:if test="${sessionScope.mvo !=null }">
	<input type="button" value="토론 등록 요청" id="insertManagerBtn">
			<c:if test="${sessionScope.mvo.id == errorcode.id }">
			 <input type="button" value="내글편집하기" id="myupdate">
			</c:if>
			<c:if test="${sessionScope.mvo.id == exception.id }">
			 <input type="button" value="내글편집하기" id="myupdate">
			</c:if>
			<c:if test="${requestScope.exception !=null }">
				<c:if test="${sessionScope.mvo.id != exception.id }">
					<input type="button" value="편집하기" id="update">
				</c:if>
			</c:if>
			<c:if test="${requestScope.errorcode !=null }">	
				<c:if test="${sessionScope.mvo.id != errorcode.id }">
					<input type="button" value="편집하기" id="update">
				</c:if>
			</c:if>	
</c:if>
<input type="button" value="목록" id="getList">

</td>
</tr>
</table>

</div>