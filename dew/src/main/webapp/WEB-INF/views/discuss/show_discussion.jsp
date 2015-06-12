<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  ${requestScope.dsvo}  --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type:'post',
        url:'show_discussion_comment.do?discussionNo='+$("#discussionNo").val(),
        dataType:'json',
        // data = List<CommentVO>
        success:function(data){
        	 	var showCommentComp = ""; 
				$.each(data,function(i,data){
				   /*  alert(i+"."+data);   */
					showCommentComp+="<tr>";
					showCommentComp+="<td>";					
					showCommentComp+=data.id;
					showCommentComp+="</td>";
					showCommentComp+="<td>";					
					showCommentComp+=data.date;
				/* 	showCommentComp+="<input type='button' id='updateBtn' value='수정'><input type='button' id='deleteBtn' value='삭제'>"; */
		/* 			showCommentComp+="<a href='updateDiscussComment.do'>수정</a>"; */
					showCommentComp+="<input type='button' name='updateBtn' value='수정'>";
					showCommentComp+="<a href='deleteDiscussComment.do?no="+data.no+"&index="+data.index+"'>삭제</a>";
					showCommentComp+="</td></tr>";
					showCommentComp+="<tr><td colspan='2'><pre>";					
					showCommentComp+=data.content;
					showCommentComp+="</pre></td>";
					showCommentComp+="</tr>";
					showCommentComp+= "<input type='hidden' id='no' name='no' value='data.no'>";
					showCommentComp+="</tr>";
				});
				$("#showComment").html(showCommentComp);
				// 수정버튼클릭시
				$("input[name=updateBtn]").click(function(){
					alert("하기싫다");
					
				});
        }
        
     });
	// textarea 자동 크기 조절
	$("#auto_textarea").on("keydown",function(){
		$(this).height(1);
		 $(this).height(20 + $(this).prop("scrollHeight"));
		});
	// 댓글 확인 버튼 누를 시
	$("#submit").click(function(){
		/* alert($("#auto_textarea").val()); */
		if($("#sessionId").val()==""){
			alert("로그인이나하시져");
			return false;
		}
		location.href="registerDiscussComment.do?no="+$("#discussionNo").val()+"&content="+$("#auto_textarea").val()+"&id="+$("#sessionId").val();
	});
	
});
</script>
 <input type="hidden" id="discussionNo" name="discussionNo" value="${requestScope.dsvo.discussionNo}">
 <input type="hidden" id="sessionId" name="sessionId" value="${sessionScope.mvo.id}">
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
 		<td class="content" colspan="5" align="center"><pre>${requestScope.dsvo.content} </pre></td>
 	</tr>
 	</table>
 	<table id="discussCommentView" class="table" align="center">
 	<div id="showComment" align="center"></div>
 	<tr>
	<td colspan="5" align="center">
	<!-- 크기가 크롬에선 자동으로 바뀌게할 수 있으니 css에서 resize:none; 해주기 -->
	<textarea id="auto_textarea" cols="50" rows="2" class="textarea m-tcol-c" maxlength="1000" style="overflow:hidden"></textarea>
 	<input type="image" name="" src="http://cafeimgs.naver.net/cafe4/btn_cmt_cfm_v1.gif" alt="확인" id="submit">
	</td> 
 	</tr> 
 	</table>
<form>
	
</form>
