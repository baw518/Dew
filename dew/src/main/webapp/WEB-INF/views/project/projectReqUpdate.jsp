<%@page import="org.kosta.dew.model.vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<title>projectRegister</title>
<%ProjectVO pvo=(ProjectVO)request.getAttribute("pvo");%>
<script type="text/javascript">
function checkUpdate(){
	if($("#projectName").val()==""){
		alert("제목을 입력하세요");
		return false;
	}
	else if($("#content").val()==""){
		alert("내용를 입력하세요");
		return false;
	}
}
	
</script>
<link rel="stylesheet" href="css/project.css">
<link rel="stylesheet" href="css/dew.css">
<body>
<div class="main">
<h3 id="projectRegisterLogo">Project Req Update</h3>
<div id="registerProjectForm"  >
<form action="project_ReqUpdate.do" method="post" class="regform"  onsubmit="return checkUpdate()" enctype="multipart/form-data">
<hr>
제목
<input type="text" name="projectName" value="${requestScope.pvo.projectName }" id="projectName">
<hr>
내용<textarea rows="3" cols="40" name="content" id="content">${requestScope.pvo.content }</textarea><hr>
<input type="file" name="picture" ><br><hr>
<input type="submit" value="수정" id="regProBtn">
<input type="hidden" name="projectNo" value="${requestScope.pvo.projectNo }">
</form>
</div></div>
</body>
