<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:forEach items="${requestScope.qna}" var="i">
	${i.qnaNo } , ${i.id } , ${i.groupNo } , ${i.title } , ${i.content } , ${i.qna_date }, ${i.answer_status }<br>
</c:forEach>


<div class="page">
	<a href="search_qnaListView.do?pageNo=${requestScope.vo.pagingBean.startPageOfPageGroup-1}&wordName=${requestScope.wordName}">
		<c:if test="${requestScope.vo.pagingBean.previousPageGroup== true && requestScope.vo.pagingBean.nowPageGroup!=1}"><img src="${initParam.root}images/left.jpg" width="21" height="21"></c:if>
	</a>
	
	<c:forEach var="i" begin="${requestScope.vo.pagingBean.startPageOfPageGroup}" end="${requestScope.vo.pagingBean.endPageOfPageGroup}" step="1">
		<c:choose>
			<c:when test="${requestScope.vo.pagingBean.nowPage == i}">
				${i}
			</c:when>
			<c:otherwise>
				<a href="search_qnaListView.do?pageNo=${i}&wordName=${requestScope.wordName}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<a href="search_qnaListView.do?pageNo=${requestScope.vo.pagingBean.endPageOfPageGroup+1}&wordName=${requestScope.wordName}">
		<c:if test="${requestScope.vo.pagingBean.nextPageGroup== true}"><img src="${initParam.root}images/right.jpg" width="21" height="21"></c:if>
	</a>
</div>