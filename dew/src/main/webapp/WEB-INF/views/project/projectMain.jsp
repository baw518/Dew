<%@page import="org.kosta.dew.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <link rel="stylesheet" href="css/project.css">
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$("#create").mouseover(function(){
  			$(this).attr({src:"${initParam.root}images/Create2.jpg"});
  		}).mouseout(function(){
  			$(this).attr({src:"${initParam.root}images/Create.jpg"});
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
  		$("#manage").mouseover(function(){
  			$(this).attr({src:"${initParam.root}images/manage2.jpg"});
  		}).mouseout(function(){
  			$(this).attr({src:"${initParam.root}images/manage.jpg"});
  	});
  		$("#create").click(function(){
  			<%MemberVO mvo=(MemberVO)session.getAttribute("mvo");
  			if(mvo==null){
%>  			alert("로그인하세요");
  				location.href="login_form.do";
  			<%}else{%>
  			location.href="project_registerForm.do";
  			<%}%>
  		});
  		$("#Join").click(function(){
  			location.href="project_listView.do";
  		});
  		$("#want").click(function(){
  			location.href="project_projectRequestForm.do";
  		});
  		$("#manage").click(function(){
  			<%if(mvo==null){
%>  			alert("로그인하세요");
  				location.href="login_form.do";
  			<%}else{%>
  			location.href="project_projectManageForm.do";
  			<%}%>
  		});
  	});
  </script>
<body>
<div id="main_viewForm">
<div id="main_view1">
	<img src="${initParam.root}images/Create.jpg"  id="create">
	<img src="${initParam.root}images/Join.jpg"  id="Join">
</div><div id="main_view2">
	<img src="${initParam.root}images/want.jpg"  id="want">
	<img src="${initParam.root}images/manage.jpg"  id="manage">
</div>
</div>
</body>
