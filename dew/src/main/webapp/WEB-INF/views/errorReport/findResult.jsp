<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">

</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<div class="main">
	<table class="dewTable">
		<thead>
		<tr><th>
			${type }
		 </th></tr>
		</thead>
		<tbody>
		<tr>
				<c:forEach items="${requestScope.result }" var = "evo" varStatus="status">
					<c:if test="${evo.errorCode !=null }">
						<td width="300" height="50" align="left"><a href="report_showContent.do?error=${evo.errorCode }&type=${type}"><u>${evo.errorCode }</u></a></td>
						<c:if test="${status.count %3==0}"></tr><tr></c:if>
					</c:if>
					<c:if test="${evo.errorCode ==null }">
					<td width="300" height="50" align="left"><a href="report_showContent.do?error=${evo.exceptionMessage }&type=${type}"><u>${evo.exceptionMessage }</u></a></td>
					<c:if test="${status.count %3==0}"></tr><tr></c:if>
					</c:if> 
				</c:forEach>
		

		</tr>
		</tbody>
	</table>
</div>