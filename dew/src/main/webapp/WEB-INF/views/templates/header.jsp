<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >

<meta charset="UTF-8">
<title>Dew Project</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
$(document).ready(function(){
	$("#word").bind("keyup",function(e){
		if(e.keyCode == 13){
			var word = $("#word").val();
			if(word==""){
				alert("검색할 단어를 입력하세요");
				return false;
			}
			
			if(word.charAt(0)=="/"){
				if(word.indexOf(" ")==-1){
					alert("게시판이름과 검색단어의 사이의 스페이스 구분자가 없습니다. /게시판이름 검색단어");
					return false;
				}
			}
			 

			
			location.href="search_resultListView.do?word="+word;
		}
	});
});
</script>

<link rel="stylesheet" href="${initParam.root }css/dew.css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">


<h1 class="logo" align="center"><a href="home.do" ><img src="${initParam.root }images/logo.jpg" ></a></h1>
<div id="main_navi" >
<ul>
<li>　</li>
<li>　</li>
<li>　</li>
<li><a href="report_listView.do">Report</a></li>
<li><a href="project_main.do">Project</a></li>
<li><a href="QnA_listView.do">QnA</a></li>
<li><a href="discussion_listView.do">Discuss</a></li>
<li><a href="video_listView.do">Video</a></li>
<li>　</li>

<li><input type="text" id="word" name="word" class="search" placeholder="검색어를 입력해주세요"></li>
</ul>

</div>
<hr class="gray_hr">
<br>