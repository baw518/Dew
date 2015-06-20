<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="http://bootswatch.com/cerulean/bootstrap.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

            <div class="row">
                <div class="col-md-7"style="margin-left:30px;" >
                    <div class="product-item-1">
                        <div class="product-thumb">
                        <div class="col-md-12">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators ->
  <ol class="carousel-indicators">
  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
  <li data-target="#myCarousel" data-slide-to="1"></li>
  <li data-target="#myCarousel" data-slide-to="2"></li>
  <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  <div class="item active" style="padding-left: 130px; padding-right: 120px; ">
  <h4 align="center">토론방</h4><h6 align="right"><a href="discussion_listView.do">more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h6>	
                        		<table class="table">
	                        		<c:forEach items="${requestScope.discussList}" var="i">
	                        			<tr>
	                        				<td><a href="findDiscussContent.do?no=${i.discussionNo}">${i.title}</a></td>
	                        			</tr>
	                        		</c:forEach>
                        		</table>
  </div>

  <div class="item"  style="padding-left: 130px; padding-right: 120px; ">
    <h4 align="center">질의응답</h4><h6 align="right" ><a href="QnA_listView.do">more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h6>                    
                        		<table class="table">
	                        		<c:forEach items="${requestScope.qnaList}" var="i">
	                        			<tr>
	                        				<td><a href="QnA_showContent.do?qnaNo=${i.qnaNo}">${i.title}</a></td>
	                        			</tr>
	                        		</c:forEach>
                        		</table>	
                        	
  </div>

  <div class="item"  style="padding-left: 130px; padding-right: 120px; ">
  <h4 align="center">Exception</h4><h6 align="right"><a href="report_listView.do">more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h6>
                    		<table class="table">
	                    		<c:forEach items="${requestScope.errorReportExceptionList}" var="i">
	                    			<tr>
	                    				<td><a href="report_showContent.do?error=${i.exceptionMessage}&type=exception">${i.exceptionMessage}</a></td>
	                    			</tr>
	                    		</c:forEach>
                    		</table>
  </div>

  <div class="item"  style="padding-left: 130px; padding-right: 120px; ">
 <h4 align="center">ErrorCode</h4><h6 align="right" ><a href="report_listView.do" >more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h6>
                    		<table class="table">
	                    		<c:forEach items="${requestScope.errorReportErrorCodeList}" var="i">
	                    			<tr>
	                    				<td><a href="report_showContent.do?error=${i.errorCode}&type=errorcode">${i.errorCode}</a></td>
	                    			</tr>
	                    		</c:forEach>
                    		</table>
  </div>
   <div class="item"  style="padding-left: 130px; padding-right: 120px; ">
   <h4 align="center">모집중프로젝트</h4><h6 align="right" ><a href="project_listView.do">more&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h6>
                    		<table class="table">
	                    		<c:forEach items="${requestScope.projectList}" var="i" varStatus="num">
	                    			<tr>
	                    				<td><a href="project_View.do?projectNo=${i.projectNo}">${i.projectName}</a></td>
	                    			</tr>
	                    		</c:forEach>
                    		</table>
   
   </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button"
  data-slide="prev"> <span
  class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
  <span class="sr-only">Previous</span>
  </a> <a class="right carousel-control" href="#myCarousel" role="button"
  data-slide="next"> <span
  class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
  <span class="sr-only">Next</span>
  </a>
  </div>	   	
                    
                                
                                
                                
                            </div> <!-- /.product-thumb -->
                        </div> <!-- /.product-item-2 -->
                        <!-- <div class="clearfix">dfgdfsgdsfg</div> -->
                    </div> <!-- /.product-holder -->
                </div> <!-- /.col-md-5 -->
                 <div class="col-md-2" style="margin-left:30px;">
                 	 <div class="product-holder">
                        <div class="product-item-2">
                            <div class="product-thumb">
                            
                            	<h4 align="center">기여도랭킹</h4><h6 align="right"><a href="ranking_listView.do">more</a></h6>
                        		<table class="table">
	                            	<c:forEach items="${requestScope.rankingList}" var="r" begin="0" step="1" end="4">
                            			<tr>
                            				<td>${r.RANKING}위</td><td>${r.ID}</td><td>${r.CONTRIBUTION}</td>
                            			</tr>
	                            	</c:forEach>
                        		</table>
                        		

                            
                            	<h4 align="center">동영상강좌</h4><h6 align="right"><a href="video_listView.do">more</a></h6>
                        		<table class="table">
	                            	<c:forEach items="${requestScope.videoList}" var="i">
                            			<tr>
                            				<td><a href="video_showContent.do?no=${i.videoNo}">${i.title}</a></td>
                            			</tr>
	                            	</c:forEach>
                        		</table>
                        		
                            </div> <!-- /.product-thumb -->
                        </div> <!-- /.product-item-2 -->
                    </div> <!-- /.product-holder -->
                 </div><!-- col-md-2 -->
          

                        	
                            
                        		
 
