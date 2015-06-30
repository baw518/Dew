<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#moreMans").click(function(){
			 $.ajax({
					type:"POST",
					url:"project_mansAjax.do",
					data: "projectNo="+$("#projectNo").val()+"&achieve=추가모집중",
					success:function(){
						alert("추가모집중");
					}
		});
	});
		$("#stopMans").click(function(){
			 $.ajax({
					type:"POST",
					url:"project_mansAjax.do",
					data: "projectNo="+$("#projectNo").val()+"&achieve=진행중",
					success:function(){
						alert("모집종료");
					}
		});
	});
		$("#joinChat").click(function(){
  			location.href="joinChat.do?projectNo="+$('#projectNo').val();
		});
	});
	
</script>
</head>
<body>
<c:choose>
<c:when test="${requestScope.cvo!=null }">
<table cellpadding="12" width="330px">
<tr><th colspan="3">팀원현황</th></tr>
<c:forEach items="${requestScope.cvo }" var="c">
<tr>
	<td width="60px"><img src="${initParam.root }upload/img/${c.id }.jpg" width="60px" height="60px"></td><td>${c.id }</td><td>${c.projectSub }</td>
</tr>
<input type="hidden" value="${c.boardNo }" id="projectNo">
</c:forEach>
</table>
<br><br>
<div align="center">
<img src="${initParam.root }images/moreMan.jpg" id="moreMans">
<img src="${initParam.root }images/stopMan.jpg" id="stopMans">
<img src="${initParam.root }images/joinChat.jpg" id="joinChat">
</div>
</c:when>
<c:otherwise>
혼자하고있습니다.
</c:otherwise>
</c:choose>
</body>
</html>