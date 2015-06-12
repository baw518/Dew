<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<title>projectRegister</title>
<script type="text/javascript">
	$(document).ready(function(){
		 	$(":input[name=subject]").change(function(){ 
			});
		    $("#plusP").click(function(){
		   		$("#formPoint").append($("#form").html()+"<br>");
		   });
	});
</script>
<script>
  $(function() {
    $( "#deadline" ).datepicker();
  });
  </script>
<link rel="stylesheet" href="css/project.css">
<body>
<h3 id="projectRegisterLogo">프로젝트 생성</h3>
<div id="registerProjectForm" >
<form action="project_register.do" method="post" class="regform">
<hr>
프로젝트명
<input type="text" name="projectName"><hr>
<div id="form">
<span id="formCopy">
분야
<select name="subject">
	<option value="">-------------------</option>
	<option value="웹프로그래밍">웹프로그래밍</option>
	<option value="웹디자인">웹디자인</option>
	<option value="기타">기타</option>
</select><br>
인원
<input type="text" name="mans" style="width: 40px">
</span></div>
<span id="formPoint"></span>
<input type="button" value="+" id="plusP">
<hr>
배당포인트 <input type="text" name="point"  style="width: 60px"> <b>p</b><br>
모집마감일 <input type="text" id="deadline" name="deadline" style="width: 120px"><br>
<hr>
한마디<textarea rows="2" cols="28" name="content"></textarea><hr>
<input type="submit" value="등록" id="regProBtn">
</form>
</div>
</body>
