<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<br><br>
<h4>동영상강의 ${requestScope.wordName}에 대한 검색결과<br></h4>

<c:forEach items="${requestScope.video}" var="i">
	<a href="video_showContent.do?no=${i.videoNo}">${i.title }</a>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#B0B0B0">${i.videoDate }</font><br>
	${i.content }<br><br>
</c:forEach>


<div class="page" align="center">
	<a href="search_videoListView.do?pageNo=${requestScope.vo.pagingBean.startPageOfPageGroup-1}&wordName=${requestScope.wordName}">
		<c:if test="${requestScope.vo.pagingBean.previousPageGroup== true && requestScope.vo.pagingBean.nowPageGroup!=1}"><img src="${initParam.root}images/left.jpg" width="21" height="21"></c:if>
	</a>
	
	<c:forEach var="i" begin="${requestScope.vo.pagingBean.startPageOfPageGroup}" end="${requestScope.vo.pagingBean.endPageOfPageGroup}" step="1">
		<c:choose>
			<c:when test="${requestScope.vo.pagingBean.nowPage == i}">
				${i}
			</c:when>
			<c:otherwise>
				<a href="search_videoListView.do?pageNo=${i}&wordName=${requestScope.wordName}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<a href="search_videoListView.do?pageNo=${requestScope.vo.pagingBean.endPageOfPageGroup+1}&wordName=${requestScope.wordName}">
		<c:if test="${requestScope.vo.pagingBean.nextPageGroup== true}"><img src="${initParam.root}images/right.jpg" width="21" height="21"></c:if>
	</a>
</div>