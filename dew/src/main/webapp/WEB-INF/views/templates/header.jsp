<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="utf-8">
    <title>Dew Project</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">
    
    <link rel="stylesheet" href="${initParam.root }css/bootstrap.css">
    <link rel="stylesheet" href="${initParam.root }css/normalize.min.css">
    <link rel="stylesheet" href="${initParam.root }css/templatemo-style.css">


 <header class="site-header">
        <div class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-6">
                        <div class="social-icons">
                            <ul>
                                <li><a href="home.do">홈으로</a></li>
                                <c:choose>
                                   <c:when test="${sessionScope.mvo==null }">
                                   <li><a href="report_write.do">에러 리포트 등록</a></li>
                                <li><a href="login_form.do">로그인</a></li>
                                   </c:when>
                                   <c:otherwise>
                                <li><a href="logout.do">로그아웃</a></li>                                   
                                   </c:otherwise>
                                </c:choose>
                            </ul>
                            <div class="clearfix"></div>
                        </div> <!-- /.social-icons -->
                    </div> <!-- /.col-md-6 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.top-header -->
        <div class="main-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-8">
                        <div class="logo">
                            <h1><a href="home.do">DEW</a></h1>
                        </div> <!-- /.logo -->
                    </div> <!-- /.col-md-4 -->
                    <div class="col-md-15 col-sm-6 col-xs-8">
                        <div class="search">
                        	<input type="text" style="width: 570px"><!-- <input type="button" value="검색"> -->
                        </div>
                        </div>
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.main-header -->
        <div class="main-nav">
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <div class="list-menu">
                            <ul>
                                <li><a href="report_listView.do">에러 리포트</a></li>
                                <li><a href="project_listView.do">프로젝트</a></li>
                                 <li><a href="QnA_listView.do">QnA</a></li>
                                 <li><a href="discussion_listView.do">토론방</a></li>
                                  <li><a href="video_listView.do">동영상 강좌</a></li>
                            </ul>
                        </div> <!-- /.list-menu -->
                    </div> <!-- /.col-md-6 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /.main-nav -->
    </header> <!-- /.site-header -->