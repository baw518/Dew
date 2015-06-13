<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#groupNo").val("${requestScope.qvo.groupNo}");
	$("#content").html("${requestScope.qvo.content}");
	
	$("#cancel").click(function(){
		location.href="QnA_showContent.do?qnaNo=${requestScope.qvo.qnaNo}";
	});
	
	$("#update").click(function(){
		var title = $("#title").val();
		var content = $("#content").val();
		if(title==""){
			alert("제목을 입력하세요");
			return false;
		}
		if(content==""){
			alert("내용을 입력하세요");
			return false;
		}
		if(!confirm("수정하시겠습니까??")){
			return false;
		}
		$("#updateForm").submit();
	});

});
</script>

<form action="QnA_Update.do" method="post" id="updateForm">
<input type="hidden" name="qnaNo" id="qnaNo" value="${requestScope.qvo.qnaNo }">
	<h2>질문글쓰기</h2>
	 <table class="table" >
		  <tbody>
			  <tr>
			  	<td>분류 :</td>
			  	<td>
					<select id="groupNo" name="groupNo"> 
						<c:forEach items="${requestScope.groupList}" var="i">
							<option value="${i.qnAGroupNo}">${i.qnAGroupName }</option>
						</c:forEach>
					</select>
				</td>
			  	<td>제목</td>
			  	<td colspan="3">
			  		<input type="text" id="title" name="title" value="${requestScope.qvo.title}" >
			  	</td>
			  	<td>아이디</td>
			  	<td><input type="text" id="id" name="id" value="${sessionScope.mvo.id}" readonly></td>
			  	<td>포인트</td>
			  	<td ><input type="text" id="point" name="point" value="${requestScope.qvo.point }" readonly></td>
			  </tr>
			  <tr>
			  	<td></td>
			  	<td colspan="7" align="left">
			   	&nbsp;&nbsp;
			  	<textarea cols="190" rows="30" id="content" name="content"></textarea>
			  	</td>
			  	<td><span id="pointView"></span></td>
			  </tr> 
			  <tr>
			  	<td colspan="9" align="center" >
				    <input type="button" id="update" name="update" value="수정">
				    <input type="button" id="cancel" name="cancel" value="작성취소">
			  	</td>  
			  </tr>
		  </tbody>
	 </table>
</form>