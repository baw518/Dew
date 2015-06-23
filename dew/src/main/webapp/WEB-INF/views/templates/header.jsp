<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >

<meta charset="UTF-8">
<title>Dew Project</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>


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

<li><input type="text" class="search" placeholder="검색어를 입력해주세요"></li>
</ul>

</div>
<hr class="gray_hr">
<br>