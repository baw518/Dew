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
	
	$(window).scroll(function(){
		if($(window).scrollTop()>100){
			$('.top').fadeIn('slow'); 
		}
	    else{
	    	$('.top').fadeOut('slow'); 
	    }
	});
	    
	$('.top a').click(function () { // 
		$('html, body').animate({ scrollTop:0 }, 'slow');
	    	return false;
	});
	var browserHeightSize = $(window).height();
	var loc = $("#loc").offset();
	
	$(document).scrollTop(loc.top-browserHeightSize/2);
	

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
