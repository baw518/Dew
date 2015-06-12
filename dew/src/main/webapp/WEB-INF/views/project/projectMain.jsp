<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <link rel="stylesheet" href="css/project.css">
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$("#create").mouseover(function(){
  			$(this).attr({src:"${initParam.root}images/create2.jpg"});
  		}).mouseout(function(){
  			$(this).attr({src:"${initParam.root}images/create.jpg"});
  	});
  		$("#Join").mouseover(function(){
  			$(this).attr({src:"${initParam.root}images/Join2.jpg"});
  		}).mouseout(function(){
  			$(this).attr({src:"${initParam.root}images/Join.jpg"});
  	});
  		$("#want").mouseover(function(){
  			$(this).attr({src:"${initParam.root}images/want2.jpg"});
  		}).mouseout(function(){
  			$(this).attr({src:"${initParam.root}images/want.jpg"});
  	});
  		$("#create").click(function(){
  			location.href="project_Register.do";
  		});
  		$("#Join").click(function(){
  			location.href="project_listView.do";
  		});
  		$("#want").click(function(){
  			location.href="";
  		});
  	});
  </script>
<body>
<div class="main">
<div id="main_view">
	<img src="${initParam.root}images/create.jpg" onclick="" id="create">
	<img src="${initParam.root}images/Join.jpg" onclick="" id="Join">
	<img src="${initParam.root}images/want.jpg" onclick="" id="want">
</div>
</div>
</body>
