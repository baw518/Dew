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
		alert("프로젝트명을 입력하세요");
		return false;
	}else if($("#subject").val()==""){
		alert("분야를 고르세요");
		return false;
	}else if($("#mans").val()==""||isNaN($("#mans").val())){
		alert("인원을 올바르게 입력하세요");
		return false;
	}else if($("#deadline").val()==""){
		alert("날짜를 고르세요");
		return false;
	}else if($("#point").val()==""||isNaN($("#point").val())){
		alert("포인트를 올바르게 입력하세요");
		return false;
	}
	else if($("#content").val()==""){
		alert("한마디를 입력하세요");
		return false;
	}
}
	$(document).ready(function(){
		    $("#plusP").click(function(){
		   		$("#formPoint").append($("#form").html()+"<br>");
		   });
	});
	$(function() {
	    $( "#deadline" ).datepicker();
	  });
	$(function() {
	    $( "#slider" ).slider({
	    	  value: <%=pvo.getProgressing()%>,
	 		  change: function(){
	 			 $.ajax({
	  					type:"POST",
	  					url:"updateProgressAjax.do",
	  					data: "projectNo=${requestScope.pvo.projectNo}&progressing="+$( '#slider' ).slider( "option", "value" ),
	  					success:function(progressing){
	  						$("#sliderVal").html(progressing+"%");
	 		  }
	    	});
	  }
	    });
	});
	
</script>
<link rel="stylesheet" href="css/project.css">
<body>
<h3 id="projectRegisterLogo">프로젝트 수정</h3>
<div id="registerProjectForm" >
<form action="project_update.do" method="post" class="regform"  onsubmit="return checkUpdate()">
<hr>
프로젝트명
<input type="text" name="projectName" value="${requestScope.pvo.projectName }" id="projectName"><hr>
<c:forEach var="dvo" items="${requestScope.pvo.departVO }">
분야
<select name="subject" id="subject">
	<option value="${dvo.subject }">${dvo.subject }</option>
		<option value="">-------------------</option>
	<option value="웹개발">웹개발</option>
	<option value="웹디자인">웹디자인</option>
	<option value="웹서버">웹서버</option>
	<option value="other">기타</option>
</select><br>
인원
<input type="text" name="mans" style="width: 40px" value="${dvo.mans }" id="mans"><br>
</c:forEach>
<div id="form">
<span id="formCopy">
분야
<select name="subject">
	<option value="">-------------------</option>
	<option value="웹프로그래밍">웹개발</option>
	<option value="웹디자인">웹디자인</option>
	<option value="웹서버">웹서버</option>
	<option value="other">기타</option>
</select><br>
인원
<input type="text" name="mans" style="width: 40px" id="mans">
</span></div>
<span id="formPoint"></span>
<input type="button" value="+" id="plusP">
<hr>
배당포인트 <input type="text" name="point"  style="width: 60px" value="${requestScope.pvo.point }" id="point"> <b>p</b><br>
모집마감일 <input type="text" id="deadline" name="deadline" style="width: 120px" value="${requestScope.pvo.deadline }"><br>
진행률<span id="sliderVal"><%=pvo.getProgressing()%>%</span><div style="padding: 10px;"><div id="slider"></div></div>
<hr>
한마디<textarea rows="2" cols="28" name="content" id="content">${requestScope.pvo.content }</textarea><hr>
<input type="submit" value="수정" id="regProBtn">
<input type="hidden" name="projectNo" value="${requestScope.pvo.projectNo }">
</form>
</div>
</body>
