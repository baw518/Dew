<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<title>Insert title here</title>



<link rel="stylesheet" type="text/css" href="css/dew.css" />
<link rel="stylesheet" type="text/css" href="css/button.css" />
<link rel="stylesheet" type="text/css" href="css/table.css" />
<link rel="stylesheet" type="text/css" href="css/font.css" />




<div class="container">

<div class="main">

<div>
	<img alt="안보이시나요" src="${initParam.root }images/main.jpg" height="300px">
</div>
<br><br>
<div style="float: left; width: 300px;">
Exception Message <span style="margin-left: 100px"><a href="#" class="hover_font">more</a></span><hr>
 <c:forEach items="#{errorReportExceptionList }" var="exception">
 ${exception.exceptionMessage }<br>
 </c:forEach>
</div>
<div style="float: left; margin-left: 30px; width: 300px;">
Error Code <span style="margin-left: 150px"><a href="#" class="hover_font">more</a></span><hr>
 <c:forEach items="#{errorReportErrorCodeList }" var="error">
 ${error.errorCode }<br>
 </c:forEach>
</div>

<div style="float: left; margin-top:50px ;width: 630px;">
QnA Board <span style="margin-left: 480px" ><a href="#" class="hover_font">more</a></span><hr>
 <c:forEach items="${qnaList }" var="qna">
 <span style="width:100px">${qna.qnaNo } </span> <span style="margin-left:100px; width:400px;'">${qna.title }</span><br>
 </c:forEach>
 </div>
<div style="float: left; margin-top:50px ; width: 630px;">
Discuss Board <span style="margin-left: 460px" ><a href="#" class="hover_font">more</a></span><hr>
 <c:forEach items="${discussList }" var="discuss">
 <span style="width:100px">${discuss.discussionNo } </span> <span style="margin-left:100px; width:400px;">${discuss.title }</span><br>
 </c:forEach>
</div>

<div style="float: left; margin-top:50px ; width: 630px;">
Project Recruitment <span style="margin-left: 415px" ><a href="#" class="hover_font">more</a></span><hr>
 <c:forEach items="${projectList }" var="project">
 <span style="width:100px">${project.projectNo } </span> <span style="margin-left:100px; width:400px;">${project.projectName }</span><br>
 </c:forEach>
</div>

<div style="float: left; margin-top:50px ; width: 630px;">
Video Board <span style="margin-left: 470px" ><a href="#" class="hover_font">more</a></span><hr>
 <c:forEach items="${videoList }" var="video">
 <span style="width:100px">${video.videoNo } </span> <span style="margin-left:100px; width:400px;">${video.title }</span><br>
 </c:forEach>
</div>
</div>
<div class="right" style="width:150px;">
기여도랭킹<a href="#" class="hover_font" style="font-size: 6px;" >more</a>
                        		<%-- <table class="table">
	                            	<c:forEach items="${requestScope.rankingList}" varStatus="num" var="r" begin="0" step="1" end="4">
                            			<tr>
                            				<td>${num.index+1}위</td><td>${r.id}</td><td>${r.score}</td>
                            			</tr>
	                            	</c:forEach> --%>
	                            <table>
	                            <c:forEach items="${rankingList }" varStatus="num" var="rank" begin="0" step="1" end="4">
		                            <tr>	
		                              	<td>
		                            			${rank.RANKING }
		                            	</td>
		                            	<td>
												${rank.ID }
										</td>		
		                            </tr>	
	                            </c:forEach>	
                        		
                        		</table>
</div>
</div>
