<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	
    });
    </script>
    <link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>에러 리포트 등록 홈</title>
<div class="main">
<form method="post" action="report_write.do">
<table class="dewTable">
<thead>
<tr><th width="150"  align="center"><input type="radio" name="type" value="exception">Exception<br>
<input type="radio" name="type" value="errorcode">ErrorCode</th>
<th ><input type="text" name="title" width="500" style="width: 80%; margin-left: 20px; height: 70%; margin-top: 8px"></th></tr>
</thead>
<tr><td align="center" colspan="2">내용 :<pre> <TEXTAREA name="content" rows="15" cols="100"></TEXTAREA></pre></td></tr>
<tr><td align="right" colspan="2" style="border-bottom-color: #ffffff">
<input type="hidden" name="id" value="${sessionScope.mvo.id }">
<input type="hidden" name="writer" value="${sessionScope.mvo.memberName }">
<input type="hidden" name="command" value="register">
<input type="submit" value="등록"></td></tr>
</table>
</form>
</div>