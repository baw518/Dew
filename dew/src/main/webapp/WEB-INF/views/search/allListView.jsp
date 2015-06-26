<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<br><br>
<h4>${requestScope.wordName}에 대한 검색결과<br></h4>

<c:if test="${requestScope.errorCode != null }">
	애러코드 검색결과<br>
	<c:forEach items="${requestScope.errorCode}" var="i">
		<a href="report_showContent.do?error=${i.errorCode}&type=error">${i.errorCode}</a><br>
		${i.content}<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_errorCodeListView.do?wordName=${requestScope.wordName}&pageNo=1">애러코드 검색결과 더보기</a></div>
	<hr>
</c:if>


<c:if test="${requestScope.exception != null }">
	exception 검색결과<br>
	<c:forEach items="${requestScope.exception}" var="i">
		<a href="report_showContent.do?error=${i.exceptionMessage}&type=exception">${i.exceptionMessage }</a> <br>
		${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_exceptionListView.do?wordName=${requestScope.wordName}&pageNo=1">exception 검색결과 더보기</a></div>
	<hr>
</c:if>

<c:if test="${requestScope.qna != null }">
	질의응답 검색결과<br>
	<c:forEach items="${requestScope.qna}" var="i">
		<a href="QnA_showContent.do?qnaNo=${i.qnaNo}">${i.title }</a><br>
		 ${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_qnaListView.do?wordName=${requestScope.wordName}&pageNo=1">질의응답 검색결과 더보기</a></div>
	<hr>
</c:if>

<c:if test="${requestScope.discuss != null }">
	토론방 검색결과<br>
	<c:forEach items="${requestScope.discuss}" var="i">
		<a href="findDiscussContent.do?no=${i.discussionNo}">${i.title }</a><br>
		${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_discussListView.do?wordName=${requestScope.wordName}&pageNo=1">토론방 검색결과 더보기</a></div>
	<hr>
</c:if>

<c:if test="${requestScope.project != null }">
	프로젝트 검색결과<br>
	<c:forEach items="${requestScope.project}" var="i">
		<a href="project_View.do?projectNo=${i.projectNo }">${i.projectName}</a><br>
		${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_projectListView.do?wordName=${requestScope.wordName}&pageNo=1">프로젝트 검색결과 더보기</a></div>
	<hr>
</c:if>

<c:if test="${requestScope.video != null }">
	동영상강의 검색 결과<br>
	<c:forEach items="${requestScope.video}" var="i">
		<a href="video_showContent.do?no=${i.videoNo}">${i.title }</a><br>
		${i.content }<br><br>
	</c:forEach>
	<br>
	<div align="right"><a href="search_videoListView.do?wordName=${requestScope.wordName}&pageNo=1">동영상강의 검색결과 더보기</a></div>
	<hr>
</c:if>