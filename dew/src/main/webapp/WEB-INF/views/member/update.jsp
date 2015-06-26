<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
	$(document).ready(function(){
		$(":input[name=update]").click(function(){
			location.href="member_updateview.do";
		});
	});
</script>

<div class="main">
<form name="updateForm" action="member_update.do" method="post" enctype="multipart/form-data">

<table class="dewTable">
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">회원 이미지</th>
		<td><img src="${initParam.root}upload/${sessionScope.mvo.id}.jpg" width="150px"><br><input type="file" name="memberImage"></td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">회원아이디</th>
		<td><input type="text" name="id" value="${sessionScope.mvo.id}" readonly="readonly"></td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">이름</th>
		<td><input type="text" name=memberName value="${sessionScope.mvo.memberName}"></td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">비밀번호</th>
		<td><input type="text" name="memberPassword" value="${sessionScope.mvo.memberPassword}"></td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">생년월일</th>
		<td><input type="text" name="birthDate" value="${sessionScope.mvo.birthDate}"readonly="readonly"></td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">비밀번호 찾기 질문</th>
		<td><input type="text" name="passwordQuestion" value="${sessionScope.mvo.passwordQuestion}"></td>
		</tr>
	</thead>
	<thead>
		<tr>
		<th style="border-bottom: 1px solid #cccccc">비밀번호 찾기 질문 답</th>
		<td><input type="text" name="passwordAnswer" value="${sessionScope.mvo.passwordAnswer}"></td>
		</tr>
	</thead>
	<tr>
		<td colspan="2" style="border-bottom-color: #ffffff" align="center">
			<input type="submit" value="수정하기" >
		</td>
	</tr>
</table>

<%-- 아이디 <input type="text" name="id" value="${sessionScope.mvo.id}" readonly="readonly"><br>
이름 <input type="text" name=memberName value="${sessionScope.mvo.memberName}"><br>
비밀번호<input type="text" name="memberPassword" value="${sessionScope.mvo.memberPassword}"><br>
생년월일<input type="text" name="birthDate" value="${sessionScope.mvo.birthDate}"readonly="readonly"><br>
질문<input type="text" name="passwordQuestion" value="${sessionScope.mvo.passwordQuestion}"><br>
질문에대한답변<input type="text" name="passwordAnswer" value="${sessionScope.mvo.passwordAnswer}"><br>

<input type="submit" value="수정하기" > --%>
</form>
</div>