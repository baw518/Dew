<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function(){
		$(":input[name=updateView]").click(function(){
			location.href="member_updateview.do";
		});
		$(":input[name=deleteView]").click(function(){
			location.href="member_deleteview.do";
		});
		$(":input[name=pointView]").click(function(){
			location.href="member_pointUpView.do";
		});
	});
</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<div class="main">

<form  action="member_profile.do" method="post">
<table class="dewTable">
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">회원아이디</th>
		<td>${sessionScope.mvo.id}</td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">이름</th>
		<td>${sessionScope.mvo.memberName}</td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">비밀번호</th>
		<td>${sessionScope.mvo.memberPassword}</td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">생년월일</th>
		<td>${sessionScope.mvo.birthDate}</td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">사용자 점수</th>
		<td>${sessionScope.mvo.score}</td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">보유머니</th>
		<td>${sessionScope.mvo.point}</td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">비밀번호 찾기 질문</th>
		<td>${sessionScope.mvo.passwordQuestion}</td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">비밀번호 찾기 질문 답</th>
		<td>${sessionScope.mvo.passwordAnswer}</td>
		</tr>
	</thead>
	<tr>
		<td colspan="2" style="border-bottom-color: #ffffff" align="center">
			<input type="button" name="updateView" value="정보수정">
			<input type="button" name="deleteView" value="회원탈퇴">
			<input type="button" name="pointView" value="포인트충전">
		</td>
	</tr>
</table>
</form>

</div>
