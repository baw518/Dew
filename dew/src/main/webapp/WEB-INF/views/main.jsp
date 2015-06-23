<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">
<title>Insert title here</title>



<link rel="stylesheet" type="text/css" href="css/dew.css" />
<link rel="stylesheet" type="text/css" href="css/button.css" />
<link rel="stylesheet" type="text/css" href="css/table.css" />
<link rel="stylesheet" type="text/css" href="css/font.css" />




<div class="container">

<div class="main">
<img src="images/a.png"  >



<table border=1>
	<tr>
		<td style="margin-top: 0px;padding-top: 0px;">
			<table >
				<tr>
					<td colspan="2" width="300px"><span class="index_th">최근
							게시물</span>
					<hr></td>
				</tr>
				
			</table>
		</td>
		
		<td></td>
		
		<td style="margin-top: 0px;padding-top: 0px;">
		
			<table >
				<tr>
					<td colspan="2" width="300px"><span class="index_th">인기
							게시물</span>
					<hr></td>
				</tr>
				
			</table>

		</td>
	</tr>
	<tr>
		<td>
			<table style="float: left;">
				<tr>
					<td colspan="2" width="300px"><span class="index_th">자유
							게시판<span style="margin-left: 180px"><a
								href="board.inven?category=freeboard&contentType=1">more</a></span>
					</span>
					<hr></td>
				</tr>
				
			</table>

		</td>
		
		<td></td>
		
		<td></td>
	</tr>
</table></div>
<div class="right">
<h4 align="center">기여도랭킹</h4><h6 align="right"><a href="">more</a></h6>
                        		<table class="table">
	                            	<c:forEach items="${requestScope.rankingList}" varStatus="num" var="r" begin="0" step="1" end="4">
                            			<tr>
                            				<td>${num.index+1}위</td><td>${r.id}</td><td>${r.score}</td>
                            			</tr>
	                            	</c:forEach>
                        		</table>
</div>
</div>
