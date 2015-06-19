<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="content-section" style="margin-left:100px;">
        <div class="container">
            <div class="row">
                <div class="col-md-4"style="margin-left:30px;" >
                    <div class="product-item-1">
                        <div class="product-thumb">
                        	
                        	<h4 align="center">토론방</h4><h6 align="right"><a href="discussion_listView.do">more</a></h6>
                        		<table class="table">
	                        		<c:forEach items="${requestScope.discussList}" var="i">
	                        			<tr>
	                        				<td><a href="findDiscussContent.do?no=${i.discussionNo}">${i.title}</a></td>
	                        			</tr>
	                        		</c:forEach>
                        		</table>
                        	
                            <!-- <img src="images/board1.jpg"> -->
                        </div> <!-- /.product-thumb -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->
                <div class="col-md-4" style="margin-left:10px;">
                    <div class="product-holder">
                        <div class="product-item-2">
                            <div class="product-thumb">
                                
                                <h4 align="center">질의응답</h4><h6 align="right"><a href="QnA_listView.do">more</a></h6>
                        		<table class="table">
	                        		<c:forEach items="${requestScope.qnaList}" var="i">
	                        			<tr>
	                        				<td><a href="QnA_showContent.do?qnaNo=${i.qnaNo}">${i.title}</a></td>
	                        			</tr>
	                        		</c:forEach>
                        		</table>
                                
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
            </div> <!-- /.row -->
            <div class="row">
                <div class="col-md-3 col-sm-6 " style="margin-left:30px;">
                    <div class="product-item-4">
                        <div class="product-thumb">
                        	
                        	<h4 align="center">Exception</h4><h6 align="right"><a href="report_listView.do">more</a></h6>
                    		<table class="table">
	                    		<c:forEach items="${requestScope.errorReportExceptionList}" var="i">
	                    			<tr>
	                    				<td><a href="report_showContent.do?error=${i.exceptionMessage}&type=exception">${i.exceptionMessage}</a></td>
	                    			</tr>
	                    		</c:forEach>
                    		</table>
                            
                        		
                        </div> <!-- /.product-thumb -->
                    </div> <!-- /.product-item-4 -->
                </div> <!-- /.col-md-4 -->
                <div class="col-md-3 col-sm-6 " style="margin-left:30px;">
                    <div class="product-item-4">
                        <div class="product-thumb">
                        
                        	<h4 align="center">ErrorCode</h4><h6 align="right"><a href="report_listView.do">more</a></h6>
                    		<table class="table">
	                    		<c:forEach items="${requestScope.errorReportErrorCodeList}" var="i">
	                    			<tr>
	                    				<td><a href="report_showContent.do?error=${i.errorCode}&type=errorcode">${i.errorCode}</a></td>
	                    			</tr>
	                    		</c:forEach>
                    		</table>
                            
                        		
                        </div> <!-- /.product-thumb -->
                    </div> <!-- /.product-item-4 -->
                </div> <!-- /.col-md-4 -->
                <div class="col-md-3 col-sm-12 " style="margin-left:30px;">
                    <div class="ads-placemenet">
                    
                        <h4 align="center">프로젝트참여</h4><h6 align="right"><a href="project_listView.do">more</a></h6>
                    		<table class="table">
	                    		<c:forEach items="${requestScope.projectList}" var="i">
	                    			<tr>
	                    				<td><a href="project_View.do?projectNo=${i.projectNo}">${i.projectName}</a></td>
	                    			</tr>
	                    		</c:forEach>
                    		</table>
                       		
                    </div> <!-- /.ads-placement -->
                </div> <!-- /.col-md-4 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.content-section -->
    
