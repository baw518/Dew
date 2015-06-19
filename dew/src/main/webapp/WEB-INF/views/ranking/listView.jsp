<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
  .top { position:fixed;right:15px;bottom:15px; z-index:999; display:none; }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(e){
	var browserHeightSize = $(window).height();
	var loc = $("#loc").offset();
	
	$(document).scrollTop(loc.top-browserHeightSize/2);
	
	$(window).scroll(function(){
		if($(window).scrollTop()>100){
			$('.top').fadeIn('slow'); // 100 픽셀을 초과하여 스크롤 된 다음 표시
		}
	    else{
	    	$('.top').fadeOut('slow'); // 100 픽셀 이하인 경우 숨김
	    }
	});
	    
	$('.top a').click(function () { // 
		$('html, body').animate({ scrollTop:0 }, 'slow');
	    	return false;
	});

});

</script>

<center><h2>기여도 랭킹 순위</h2></center>
	
<c:forEach items="${requestScope.rankingList}"  var="r" >
	<c:if test="${sessionScope.mvo.id == r.ID }">
		<h3 align="right">
			<font color='blue'>${sessionScope.mvo.id} 님의 랭킹은 ${r.RANKING}위 입니다.</font>
		</h3>
	</c:if>
</c:forEach>
	
<br>
<table class="table">
	<thead>
		<tr>
			<td class="ranking">순위</td><td class="id">아이디</td><td class="score">기여도</td>
		</tr>
	</thead>
	
	<tbody>
	   	<c:forEach var="r" items="${requestScope.rankingList}" >
	   		<c:choose>
		   		<c:when test="${sessionScope.mvo.id == r.ID }">
					<tr bgcolor="orange">
						<td>${r.RANKING}위</td><td>${r.ID}</td><td>${r.CONTRIBUTION}<div id="loc"></div></td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>${r.RANKING}위</td><td>${r.ID}</td><td>${r.CONTRIBUTION}</td>
					</tr>
				</c:otherwise>
			</c:choose>
	   	</c:forEach>
   	</tbody>
</table>

<div class="top"><a href="#"><img src="${initParam.root}images/top.jpg" /></a></div>
<div style="width:10px; height:5000px"></div>
