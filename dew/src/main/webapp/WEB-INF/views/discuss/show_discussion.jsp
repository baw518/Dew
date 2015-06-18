<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  ${requestScope.dsvo}  --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
$(document).ready(function(){
	
	// textarea 자동 크기 조절
	$("#auto_textarea").on("keydown",function(){
		$(this).height(1);
		 $(this).height(20 + $(this).prop("scrollHeight"));
		});//function
		
	// 댓글 확인 버튼 누를 시
	$("#submit").click(function(){
		var content = $("#auto_textarea").val();
		var id = $("#id").val();
		var no= $("#no").val();
		$.ajax({
			type:'post',
			url:'show_discussion_comment.do',
	        data:"content="+content+"&id="+id+"&discussionNo="+no,
	        dataType:'json',
	        // data = List<CommentVO>
	        success:function(data){
	        	var c = ""; 
				$.each(data,function(i,data){  
					 c+="<tr><td>"+data.id+"</td>";
					 c+="<td>"+data.commentDate+"</td>";
					 c+="<td>"+data.content+"</td>";
					 c+="<td><input type='hidden' id='commentNo' name='commentNo' value='"+data.commentNo+"'>"
					 +"<input type='button' id='commentUpdateText' name='commentUpdateText' value='수정'>"
					 +"<input type='button' id='commentDeleteBtn' name='commentDeleteBtn' value='삭제'>"+
					 "<input type='button' id='commentReplyWriteView' name='commentReplyWriteView' value='답글'>"+
					 "<input type='hidden' id='ref' name='ref' value='"+data.ref+"'>"+
					 "<input type='hidden' id='reStep' name='reStep' value='"+data.reStep+"'>"+
					 "<input type='hidden' id='relevel' name='relevel' value='"+data.relevel+"'></td>";
					 c+="</tr>";
				});
	    		c+="<tr></tr>";
				$("#commentView").html(c);
				$("#auto_textarea").val("");
	        }
		});
	});
		
	// 삭제 Btn
	$(document).on("click", "#commentDeleteBtn",function(e){
		var commentNo = $(this).parent().children().val();
		var id = $("#id").val();
		var no = $("#no").val();	
		var q = confirm("삭제하시겠습니까?");
		if(q){	
		location.href="deleteDiscussComment.do?no="+commentNo+"&index="+no;
		}else{
			return false;
		}					
	});
	
	// 수정 Btn -> form
	$(document).on("click", "#commentUpdateText",function(e){
		var commentNo = $(this).parent().children().val();
		alert(commentNo);
		var no = $("#no").val();	
		var q = confirm("수정하시겠습니까?");
		if(q){	
		$.ajax({
			type:'post',
	        url:'updateDiscussCommentForm.do?no='+commentNo,
	        dataType:'json',
	        success:function(data){
	        	var c = ""; 
					 c+="<tr><td>"+data.id+"</td>";
					 c+="<td>"+data.commentDate+"</td>";
					 c+="<td colspan='2'>";		
					 c+="<textarea id='auto_textarea2' cols='50' rows='2' maxlength='1000'>"+data.content+"</textarea>";
					 c+="<input type='image' src='http://cafeimgs.naver.net/cafe4/btn_cmt_cfm_v1.gif' alt='확인' id='commentUpdateBtn'>";
					 c+="</td>";
					 c+="<td><input type='hidden' id='commentNo' name='commentNo' value='"+data.commentNo+"'>"
					 +"<input type='button' id='commentUpdateText' name='commentUpdateText' value='수정'>"
					 +"<input type='button' id='commentDeleteBtn' name='commentDeleteBtn' value='삭제'>"+
					 "<input type='button' id='commentReplyWriteView' name='commentReplyWriteView' value='답글'>"+
					 "<input type='hidden' id='ref' name='ref' value='"+data.ref+"'>"+
					 "<input type='hidden' id='reStep' name='reStep' value='"+data.reStep+"'>"+
					 "<input type='hidden' id='relevel' name='relevel' value='"+data.relevel+"'></td>";
					 c+="</tr>";
	    			c+="<tr></tr>";
					$("#commentView").html(c);
					 $("#commentUpdateBtn").click(function(){
						location.href="updateDiscussComment.do?no="+commentNo+"&index="+no+"&content="+$("#auto_textarea2").val();
					}); 
	  	     	 }
			});
		}
	});
	
/* 	// 수정 form 확인
	$(document).on("click", "#commentUpdateBtn", function(e){
		var commentNo = $("#commentUpdateText").parent().children().val();
		var no = $("#no").val();	
		var content = $("#auto_textarea").val();
		alert(no+"/"+commentNo+"/"+content);
	 	location.href="updateDiscussComment.do?no="commentNo+"&index="no+"&content="content; 
	}); */
	
});//ready
</script>
 <div align="right">
 <br>
 <!-- 게시글 작성자와 로그인한 회원이 일치할 때 삭제요청 가능. -->
 <c:if test="${sessionScope.mvo.id == requestScope.dsvo.id}">
 <input type="button" id="deleteManager" name="deleteManager" value="삭제 요청">
 </c:if>
 </div>
 <br>
 <table id="discussView" class="table" align="center">
 	<tr>
 		<td id="discussionNo" class="discussionNo"> ${requestScope.dsvo.discussionNo} </td>
 		<td class="title"> ${requestScope.dsvo.title} </td>
 		<td class="discussionSubject">${requestScope.dsvo.discussionSubject} </td>
 		<td class="discussionDate"> ${requestScope.dsvo.discussionDate} </td>
 		<td class="hit"> ${requestScope.dsvo.hit} </td>
 	</tr>
 	<tr>
 		<td class="id" colspan="5" align="left">${requestScope.dsvo.id} </td>
 	</tr>
 	<tr>
 		<td class="content" colspan="5" align="center">
 		<pre>${requestScope.dsvo.content} </pre></td>
 	</tr>
 	<tr>
		<td colspan="4">
				<table class="table" align="center" id="commentView">
					<c:forEach items="${requestScope.cmvo}" var="i" varStatus="index">
						<tr>
							<td>${i.id}</td>
							<td>${i.commentDate}</td>
							<td colspan="3">${i.content}</td>
							<td>
								<input type="hidden" id="commentNo" name="commentNo" value="${i.commentNo}">
								<input type="button" id="commentUpdateText" name="commentUpdateText" value="수정">
								<input type="button" id="commentDeleteBtn"name="commentDeleteBtn" value="삭제">
								<input type="button" id="commentReplyWriteView" name="commentReplyWriteView" value="답글">
						
								<input type="hidden" id="ref" name="ref" value="${i.ref}">
								<input type="hidden" id="reStep" name="reStep" value="${i.reStep}">
								<input type="hidden" id="relevel" name="relevel" value="${i.relevel}">
							</td>
						</tr>
						<tr>
						</tr>
					</c:forEach>
				</table>
	<c:if test="${sessionScope.mvo.id != null}">
 	<tr>
	<td colspan="5" align="center">
	<!-- 크기가 크롬에선 자동으로 바뀌게할 수 있으니 css에서 resize:none; 해주기 -->
	<textarea id="auto_textarea" cols="50" rows="2" class="textarea m-tcol-c" maxlength="1000" style="overflow:hidden"></textarea>
 	<input type="image" src="http://cafeimgs.naver.net/cafe4/btn_cmt_cfm_v1.gif" alt="확인" id="submit">
 	<input type="hidden" name="id" id="id" value="${sessionScope.mvo.id }">
	<input type="hidden" name="no" id="no" value="${requestScope.dsvo.discussionNo}">
	</td> 
 	</tr> 
	</c:if>
 	</table>


