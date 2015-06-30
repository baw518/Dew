<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HoHoHo</title>
<link rel="stylesheet" type="text/css" href="css/dew.css" />
</head>
<body>
<div class="header">
<link rel="stylesheet" href="${initParam.root }css/dew.css">
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
</div>
<div class="container">
	<div class="main" style="margin-left: 180px; width: 1000px">
		<h4>${requestScope.wordName}에 대한 검색결과<br></h4>

<c:if test="${requestScope.errorCode != null }">
	애러코드 검색결과<br>
	<c:forEach items="${requestScope.errorCode}" var="i">
		<a href="report_showContent.do?error=${i.errorCode}&type=error">${i.errorCode}</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#B0B0B0">${i.date }</font><br>
		${i.content}<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_errorCodeListView.do?wordName=${requestScope.wordName}&pageNo=1">애러코드 검색결과 더보기</a></div>
	<hr>
</c:if>


<c:if test="${requestScope.exception != null }">
	exception 검색결과<br>
	<c:forEach items="${requestScope.exception}" var="i">
		<a href="report_showContent.do?error=${i.exceptionMessage}&type=exception">${i.exceptionMessage }</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#B0B0B0">${i.date}</font><br>
		${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_exceptionListView.do?wordName=${requestScope.wordName}&pageNo=1">exception 검색결과 더보기</a></div>
	<hr>
</c:if>

<c:if test="${requestScope.qna != null }">
	질의응답 검색결과<br>
	<c:forEach items="${requestScope.qna}" var="i">
		<a href="QnA_showContent.do?qnaNo=${i.qnaNo}">${i.title }</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#B0B0B0">${i.date }</font><br>
		 ${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_qnaListView.do?wordName=${requestScope.wordName}&pageNo=1">질의응답 검색결과 더보기</a></div>
	<hr>
</c:if>

<c:if test="${requestScope.discuss != null }">
	토론방 검색결과<br>
	<c:forEach items="${requestScope.discuss}" var="i">
		<a href="findDiscussContent.do?no=${i.discussionNo}">${i.title }</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#B0B0B0">${i.discussionDate }</font><br>
		${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_discussListView.do?wordName=${requestScope.wordName}&pageNo=1">토론방 검색결과 더보기</a></div>
	<hr>
</c:if>

<c:if test="${requestScope.project != null }">
	프로젝트 검색결과<br>
	<c:forEach items="${requestScope.project}" var="i">
		<a href="project_View.do?projectNo=${i.projectNo }">${i.projectName}</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#B0B0B0">${i.project_date }</font><br>
		${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_projectListView.do?wordName=${requestScope.wordName}&pageNo=1">프로젝트 검색결과 더보기</a></div>
	<hr>
</c:if>

<c:if test="${requestScope.video != null }">
	동영상강의 검색 결과<br>
	<c:forEach items="${requestScope.video}" var="i">
		<a href="video_showContent.do?no=${i.videoNo}">${i.title }</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#B0B0B0">${i.videoDate }</font><br>
		${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_videoListView.do?wordName=${requestScope.wordName}&pageNo=1">동영상강의 검색결과 더보기</a></div>
	<hr>
</c:if>
	</div>
<div id="footer">
 <footer class="site-footer">
        <div class="bottom-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <span>Copyright &copy; 2015 <a href="#">일풀리먼츠</a></span>
                        <p>do you know kimchi i'm fine thank you and you where are you from i am from korea I say o you say ah o ah oah</p>
                    </div> <!-- /.col-md-12 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.bottom-footer -->
    </footer> <!-- /.site-footer -->
</div>

</div>
</body>
</html>