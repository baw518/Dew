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
		var sessionId = "${sessionScope.mvo.id}";
		var adminCheck = "${sessionScope.mvo.memberLevel}";
		var commentWriteId = $(this).parent().prev().prev().prev().text();
		if(sessionId != commentWriteId && adminCheck != 0){
			alert("본인의 댓글만 삭제가능합니다.");
			return false;
		}
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
		var relevel = $(this).next().next().next().next().next().val();
		var refCount = "";
		for(var i=1; i<=relevel; i++){
			refCount += "re:";
		}
		
		var sessionId = "${sessionScope.mvo.id}";
		var adminCheck = "${sessionScope.mvo.memberLevel}";
		var commentWriteId = $(this).parent().prev().prev().prev().text();
		var hiddenContent = $(this).parent().prev().text();
		if(sessionId != commentWriteId && adminCheck != 0){
			alert("본인의 댓글만 수정가능합니다.");
			return false;
		}
		var commentNo = $(this).parent().children().val();
		var no = $("#no").val();
		var q = confirm("수정하시겠습니까?");
		if(q){	
		$(this).parent().parent().children("td:eq(2)").html("<input type='hidden' id='commentNo' name='commentNo' value='"+commentNo+"'>"+
					"<textarea id='auto_textarea2' cols='50' rows='2' maxlength='1000'>"+hiddenContent+"</textarea>"+
					"<input type='button' name='commentUpdateBtn' id='commentUpdateBtn' value='확인'>"+
					"<input type='button' name='commentUpdateCancel' id='commentUpdateCancel' value='취소'>"+
					"<input type='hidden' name='hiddenContent' id='hiddenContent' value='"+hiddenContent+"'>");
		$("#commentUpdateBtn").click(function(){
			location.href="updateDiscussComment.do?no="+commentNo+"&index="+no+"&content="+$("#auto_textarea2").val();
		}); 
		$(document).on("click", "#commentUpdateCancel" , function(e){
			if(!confirm("입력한 내용을 취소하시겠습니까??")){
				return false;
			}
			var hiddenContent = $(this).next().val();
			$(this).parent().html(hiddenContent);

			/* $(this).parent().html("con"); */
			
		//	location.href="QnA_showContent.do?qnaNo=${requestScope.qvo.qnaNo }";
			
		});
		}
	});
	
	// 댓글의 답글
	$(document).on("click", "#commentReplyWriteView" , function(){
		var reflevel = $(this).next().next().next().val();
		var refCount = "";
		for(var i=0; i<=reflevel; i++){
			refCount += "re:";
		}
		
		var p = "<td colspan='6'><input type='text' name='commentReplyText' id='commentReplyText' value='"+refCount+"'>"+
					"<input type='button' id='commentReplyWriteBtn' name='commentReplyWriteBtn' value='등록'>"+
					"<input type='button' id='commentReplyCancel' name='commentReplyCancel' value='취소'>"+
					"<input type='hidden' id='boardNo' name='boardNo' value='${requestScope.qvo.qnaNo}'"+
					"</td>";
		$(this).parent().parent().next().html(p);
		
	});

	$(document).on("click", "#commentReplyCancel", function(){
		if(!confirm("입력한 내용을 취소하시겠습니까???")){
			return false;
		}
		$(this).parent().parent().html("");
	});
	
	
	$(document).on("click", "#commentReplyWriteBtn", function(){
		var id = $("#id").val();
		var ref = $(this).parent().parent().prev().children().next().children().next().next().next().next().val();
		var reStep = $(this).parent().parent().prev().children().next().children().next().next().next().next().next().val();
		var relevel = $(this).parent().parent().prev().children().next().children().next().next().next().next().next().next().val();
		var content = $(this).prev().val();
		if(content==""){
			alert("커맨트 답글 내용을 입력하세요");
			return false;
		}
		
		$.ajax({
		      type:"post",
		      url:"DSajaxWriteCommentReply.do",
		      data:"content="+content+"&id=${sessionScope.mvo.id}&boardNo=${requestScope.dsvo.discussionNo}&ref="+ref+"&reStep="+reStep+"&relevel="+relevel,
		      dataType:"json",
		      success:function(result){
		    	    $("#commentView").html("");
		    		var c = "";
		    		$.each(result,function(index,data){
						 c+="<tr><td>"+data.id+"</td>";
						 c+="<td>"+data.commentDate+"</td>";
						 c+="<td>"+data.content+"</td>";
						 c+="<td><input type='hidden' id='commentNo' name='commentNo' value='"+data.commentNo+"'>"
						 +"<input type='button' id='commentUpdateText' name='commentUpdateText' value='수정'>"
						 +"<input type='button' id='commentDeleteBtn' name='commentDeleteBtn' value='삭제'>"+
						 "<input type='button' id='commentReplyWriteView' name='commentReplyWriteView' value='댓글달기'>"+
						 "<input type='hidden' id='ref' name='ref' value='"+data.ref+"'>"+
						 "<input type='hidden' id='reStep' name='reStep' value='"+data.reStep+"'>"+
						 "<input type='hidden' id='relevel' name='relevel' value='"+data.relevel+"'></td>";
						 c+="</tr>";
					});
		    		c+="<tr></tr>";
		    		$("#commentView").html(c);  
		      } 
		}); 
	});
	
	//삭제 요청 버튼 누를 시
	$("#deleteManager").click(function(){
		var no = $("#no").val();
		location.href="deleteManager.do?discussionNo="+no;
		alert("삭제요청되었습니다.");
	});
	
	//관리자가 삭제 버튼 누를 시
	$("#delete").click(function(){
		var no  = $("#no").val();
		var q = confirm(no+"게시글을 삭제하시겠습니까?");
		if(q){	
		location.href="delete.do?discussionNo="+no;
		}
	});
});//ready
</script>
 <div align="right">
 <br>
 <!-- 게시글 작성자와 로그인한 회원이 일치할 때 삭제요청 가능. -->
 <c:if test="${sessionScope.mvo.id == requestScope.dsvo.id}">
 <input type="button" id="deleteManager" name="deleteManager" value="삭제 요청">
 </c:if>
 <c:if test="${sessionScope.mvo.memberLevel == 0}">
 	<input type="button" value="삭제" id="delete">
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


