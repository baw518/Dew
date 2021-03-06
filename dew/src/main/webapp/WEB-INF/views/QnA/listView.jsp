<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<title>QnA 게시판 입니다.</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#group").change(function(){
		var c = $("#group").val();
		if(c=="all"){
			location.href="QnA_listView.do";
		}
		else{
			location.href="QnA_SelectedListView.do?qnAGroupNo="+c+"&pageNo=1";
		}
		
	});
	
	$("#group").val("${requestScope.selectGroupNo}");
});
</script>
</head>






<div class="main" align="center">
<table class="dewTable">
	<caption><h2>QnA게시판</h2></caption>
	<thead class="thead">
		<thead>
			<tr>
			<th colspan="1" style="border-bottom-color: #ffffff" colspan="7" >
				<select id="group">
				<option value="all">전체</option>
				<c:forEach items="${requestScope.groupList}" var="i">
					<option value="${i.qnAGroupNo}">${i.qnAGroupName }</option>
				</c:forEach>
				</select> 
			</th>
		<tr>
			<th class="tableNo" >NO</th>
			<th class="tableChoose">글상태</th>
			<th class="tableTitle" >제목</th>
			<th class="tableId">아이디</th>
			<th class="tPoint">포인트</th>
			<th class="tableDate">작성일</th>
			<th class="tableHit">HIT</th>
		</tr>
	</thead>
	<tbody>			
	<c:forEach var="list" items="${requestScope.vo.list}">				
		<tr>
		    <td >${list.qnaNo }</td>
		    <td >
		    	<c:if test="${list.answerStatus==0}"></c:if>
		    	<c:if test="${list.answerStatus==1}">완료</c:if>
		    	<c:if test="${list.answerStatus==2}">채택</c:if>
		    	<c:if test="${list.answerStatus==3}"></c:if>
		    </td>			
			<td class="tableTitle">
				<a href="QnA_showContent.do?qnaNo=${list.qnaNo}"  class="hover_font">${list.title }</a>
			</td>
			<td height="30px"><img src="${initParam.root }upload/img/${list.id}.jpg" width="30px">${list.id }</td>
			<td >
				<c:choose>
					<c:when test="${list.restep== 0}">
						${list.point }
					</c:when>
					<c:otherwise>
					-
					</c:otherwise>
				</c:choose>
			</td>
			<td >${list.date }</td>
			<td >${list.hit }</td>
		</tr>	
	</c:forEach>
	<tr>
		<td colspan="7" align="right" style="border-bottom-color: #ffffff">
			<c:if test="${sessionScope.mvo != null}">
				<a href="QnA_WriteForm.do"><img  src="${initParam.root}images/qna_write.jpg" border="0"></a>
			</c:if>
		</td>
	</tr>
	</tbody>
</table>


<div class="page">
	<c:choose>
		<c:when test="${requestScope.selectGroupNo == all}">
			<a href="QnA_listView.do?pageNo=${requestScope.vo.pagingBean.startPageOfPageGroup-1}">
				<c:if test="${requestScope.vo.pagingBean.previousPageGroup== true && requestScope.vo.pagingBean.nowPageGroup!=1}"><img src="${initParam.root}images/left.jpg" width="21" height="21"></c:if>
			</a>
			
			<c:forEach var="i" begin="${requestScope.vo.pagingBean.startPageOfPageGroup}" end="${requestScope.vo.pagingBean.endPageOfPageGroup}" step="1">
				<c:choose>
					<c:when test="${requestScope.vo.pagingBean.nowPage == i}">
						${i}
					</c:when>
					<c:otherwise>
						<a href="QnA_listView.do?pageNo=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<a href="QnA_listView.do?&pageNo=${requestScope.vo.pagingBean.endPageOfPageGroup+1}">
				<c:if test="${requestScope.vo.pagingBean.nextPageGroup== true}"><img src="${initParam.root}images/right.jpg" width="21" height="21"></c:if>
			</a>
		</c:when>
		<c:otherwise>
			<a href="QnA_SelectedListView.do?pageNo=${requestScope.vo.pagingBean.startPageOfPageGroup-1}&qnAGroupNo=${requestScope.selectGroupNo}">
				<c:if test="${requestScope.vo.pagingBean.previousPageGroup== true && requestScope.vo.pagingBean.nowPageGroup!=1}"><img src="${initParam.root}images/left.jpg" width="21" height="21"></c:if>
			</a>
			
			<c:forEach var="i" begin="${requestScope.vo.pagingBean.startPageOfPageGroup}" end="${requestScope.vo.pagingBean.endPageOfPageGroup}" step="1">
				<c:choose>
					<c:when test="${requestScope.vo.pagingBean.nowPage == i}">
						${i}
					</c:when>
					<c:otherwise>
						<a href="QnA_SelectedListView.do?pageNo=${i}&qnAGroupNo=${requestScope.selectGroupNo}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<a href="QnA_SelectedListView.do?&pageNo=${requestScope.vo.pagingBean.endPageOfPageGroup+1}&qnAGroupNo=${requestScope.selectGroupNo}">
				<c:if test="${requestScope.vo.pagingBean.nextPageGroup== true}"><img src="${initParam.root}images/right.jpg" width="21" height="21"></c:if>
			</a>
		</c:otherwise>
	</c:choose>
</div>

<br>
<br>
<br>
</div>
