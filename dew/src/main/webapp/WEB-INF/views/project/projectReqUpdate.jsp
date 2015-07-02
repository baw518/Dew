<%@page import="org.kosta.dew.model.vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="js/jQuery.MultiFile.min.js"></script>
<title>projectRegister</title>
<%ProjectVO pvo=(ProjectVO)request.getAttribute("pvo");%>
<script type="text/javascript">
	$(document).ready(function(){
		 $('#multiform input[name=picture]').MultiFile({
		        max: 1, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
		        accept: 'jpg|png', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
		        maxfile: 1024, //각 파일 최대 업로드 크기
		        maxsize: 3024,  //전체 파일 최대 업로드 크기
		        STRING: { //Multi-lingual support : 메시지 수정 가능
		            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
		            selected:'$file 을 선택했습니다.', 
		            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
		            toobig: "$file 은 크기가 매우 큽니다. (max $size)",
		            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다."
		        },
		    });
});
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
<form id="multiform" action="project_ReqUpdate.do" method="post" class="regform"  onsubmit="return checkUpdate()" enctype="multipart/form-data">
<hr>
제목
<input type="text" name="projectName" value="${requestScope.pvo.projectName }" id="projectName">
<hr>
내용<textarea rows="3" cols="40" name="content" id="content">${requestScope.pvo.content }</textarea><hr>
<input type="file" name="picture" ><br><input type="hidden" value="${requestScope.pvo.deadline }" name="deadline">${requestScope.pvo.deadline }<hr>
<input type="submit" value="수정" id="regProBtn">
<input type="hidden" name="projectNo" value="${requestScope.pvo.projectNo }">
</form>
</div></div>
</body>
