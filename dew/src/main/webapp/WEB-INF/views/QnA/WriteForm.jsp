<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#writeBtn").click(function(){		
		var title = $("#title").val();
		var content = $("#content").val();
		var point = $("#point").val();
		if(title==""){
			alert("제목을 입력하세요");
			return false;
		}
		if(point==""){
			alert("포인트를 입력하세요");
			return false;
		}
		if(isNaN(point)){
			alert("포인트는 숫자만 입력하세요");
			return false;
		}
		if(content==""){
			alert("내용을 입력하세요");
			return false;
		}
		if(!confirm("작성하시겠습니까??")){
			return false;
		}
		$("#writeForm").submit();
	});
	
	$("#point").keyup(function(){
		var point = $("#point").val();
		var sessionPoint = ${sessionScope.mvo.point}
		if(point==""){
			$("#pointView").html("<font color='red'>포인트를 입력하세요.</font>");
			return false;
		}
		if(isNaN(point)){
			$("#pointView").html("<font color='red'>포인트는 숫자만 가능합니다.</font>");
			return false;
		}
		if(point>sessionPoint){
			$("#pointView").html("<font color='red'>현재 가지고있는 포인트보다 더 많은 포인트를 적용 할 수 없습니다.</font>");
			return false;
		}
		if(point<=sessionPoint){
			var resultPoint = sessionPoint-point;
			$("#pointView").html("<font color='blue'>사용가능</font><br>"+
										"<font color='orange'>글등록 후 잔액 :"+resultPoint+" </font>");
			return false;
		}
		
	});
});
</script>

<form action="QnA_Write.do" method="post" id="writeForm">
	<h2>질문글쓰기</h2>
	 <table class="table">
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
		  		<input type="text" id="title" name="title">
		  	</td>
		  	<td>아이디</td>
		  	<td><input type="text" id="id" name="id" value="${sessionScope.mvo.id}" readonly></td>
		  	<td>포인트</td>
		  	<td ><input type="text" id="point" name="point" ></td>
		  </tr>
		  <tr>
		  	<td></td>
		  	<td colspan="7" align="left">
		   	&nbsp;&nbsp;
		  	<textarea cols="190" rows="30" id="content" name="content"></textarea>
		  	</td>
		  	<td><span id="pointView">사용가능한 포인트 : ${sessionScope.mvo.point}</span></td>
		  </tr> 
		  <tr>
		  	<td colspan="9" align="center" >
			    <img class="action" src="${initParam.root}images/qna_write_complete.jpg" id="writeBtn">
			    <input type="button" id="cancel" value="작성취소">
		  	</td>  
		  </tr>
	 </table>
</form>