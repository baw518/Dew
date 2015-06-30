<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">

</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">

<form method="post" action="report_findWord.do">
<input type="radio" name="type" value="ExceptionMessage">Exception &nbsp;
<input type="radio" name="type" value="ErrorCode">ErrorCode <br>
 첫  단어로 검색하기 <input type="text" name="startWord"><br>
중간 단어로 검색하기 <input type="text" name="containsWord"><br>
 끝  단어로 검색하기 <input type="text" name="endWord"><br>
 <input type="submit" value="검색">
 </form>