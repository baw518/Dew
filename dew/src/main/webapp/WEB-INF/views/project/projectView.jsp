<%@page import="java.util.List"%>
<%@page import="org.kosta.dew.model.vo.CommentVO"%>
<%@page import="org.kosta.dew.model.vo.MemberVO"%>
<%@page import="org.kosta.dew.model.vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
	<%ProjectVO pvo=(ProjectVO)request.getAttribute("pvo");%>
	<%-- var subject=<%=pvo.getDepartVO().get(i).getSubject()%> --%>
	<%-- var mans=<%=pvo.getDepartVO().get(i).getMans()%> --%>
	 $(document).ready(function(){
		<%--<%for(int i=0;i<pvo.getDepartVO().size();i++){%>
			$('#mans<%=i%>').html("<table border='1'><tr><%for(int j=1;j<=Integer.parseInt(pvo.getDepartVO().get(i).getMans());j++){%><td>&nbsp;&nbsp;&nbsp;&nbsp;</td><%}%></tr></table>");
		<%}%>--%>
		$("#joinProBtn").click(function(){
			<%MemberVO mvo=(MemberVO)session.getAttribute("mvo");
  			if(mvo==null){
%> 			alert("로그인하세요");
				location.href="login_form.do";
  			<%}else{%>
  				$("#joinComment").html("<textarea rows='3' cols='53' id='joinCommentArea'></textarea><br><br>");
  				$("#joinCommentArea").focus();
  				$("#switchBtn").html("<input type='button' value='신청완료' id='joinProBtn2'>");
  			<%}%>
  			$("#joinProBtn2").click(function(){
  				$.ajax({
  					type:"POST",
  					url:"joinProjectAjax.do",
  					data: "joinContent="+$("#joinCommentArea").val()+"&projectNo=${requestScope.pvo.projectNo}",
  					success:function(flag){
  						if(flag==true){
  							alert("이미 신청했습니다");
  							$("#joinComment").html("");
  							return;
  						}else{
  							alert("신청완료");
  							location.href="project_View.do?projectNo=${requestScope.pvo.projectNo}"
  						}	
  					}
  				}); 
  			});
		});
		
		$("#backBtn").click(function(){
			location.href="project_listView.do";
		});
		$("#deleteProBtn").click(function(){
			if(confirm("삭제하시겠습니까?"))
			location.href="project_delete.do?projectNo=${requestScope.pvo.projectNo}";
		});
		$("#updateProBtn").click(function(){
			location.href="project_updateForm.do?projectNo=${requestScope.pvo.projectNo}";
		});
		$("#writeComment").click(function(){
			location.href="registerProjectComment.do?content="+$("#commentTextContent").val()+"&projectNo=${requestScope.pvo.projectNo}";
		});
		$("#writeCommentLogin").click(function(){
			location.href="login_form.do";
		});
		<%List<CommentVO> cvoList=pvo.getCommentVO();
		for(int i=0;i<cvoList.size();i++){%>
		$("#deleteCommentBtn<%=i%>").click(function(){
			if(confirm("삭제하시겠습니까?"))
			location.href="deleteProjectComment.do?commentNo="+$('#commentNo<%=i%>').val()+"&projectNo=${requestScope.pvo.projectNo}";
		});
		$("#updateCommentBtn<%=i%>").click(function(){
			$("#commentContent<%=i%>").html(" <input type='hidden' value='${cvo.commentNo }'><input type='text' id='updateComment<%=i%>' >");
			$("#updateComment<%=i%>").val($('#commentContentHidden<%=i%>').val());
			$("#commentTextSpan<%=i%>").html(" <input type='button' value='수정' id='updateCommentSpanBtn<%=i%>'>");
			 $("#commentTextSpan<%=i%>").on("click","#updateCommentSpanBtn<%=i%>", function(){
				 location.href="updateProjectComment.do?commentNo="+$('#commentNo<%=i%>').val()+"&boardNo=${requestScope.pvo.projectNo}"
					+"&content="+$('#updateComment<%=i%>').val();
			}); 
			});
		 <%}%>
		});

</script>
	<link rel="stylesheet" href="css/project.css">
<body>
<h3 id="projectRegisterLogo">프로젝트</h3>
<div id="viewForm">
<div id="view">
<table border="1" width="500px" align="center">
<tr><th>프로젝트명</th><td>${requestScope.pvo.projectName}</td></tr>
<tr><th>작성자</th><td>${requestScope.pvo.id}</td></tr>
<tr><th>작성일</th><td>${requestScope.pvo.project_date}</td></tr>
<c:forEach items="${requestScope.pvo.departVO}" var="dvo" varStatus="i">
<tr><th>분야</th><td>${dvo.subject}</td></tr>
<tr><th>인원</th><td>${dvo.mans}<%-- <span id="mans${i.index }"></span> --%></td></tr>
</c:forEach>
<tr><th>배당포인트</th><td>${requestScope.pvo.point}<b>point</b></td></tr>
<tr><th>모집기간</th><td><span id="date">${requestScope.pvo.deadline}</span></td></tr>
<tr><td colspan="2" align="center"><b>내용</b></td></tr>
<tr><td colspan="2"> <br>${requestScope.pvo.content}</td></tr>
</table>
<br>
<span id="joinComment"></span>
<input type="button" value="목록" id="backBtn">
	<c:choose>
		<c:when test="${sessionScope.mvo.id==requestScope.pvo.id }">
			<input type="button" value="수정" id="updateProBtn" style="margin-left: 330px">
			<input type="button" value="삭제" id="deleteProBtn" ><br>
		</c:when>
		<c:when test="${requestScope.pvo.achieve!='모집중' }">
			<b style="margin-left: 130px">마감되었습니다.</b>
		</c:when>
		<c:otherwise>
			<span id="switchBtn"><input type="button" value="참가신청" id="joinProBtn" ></span>
		</c:otherwise>
	</c:choose>
<div id="commentForm">
	<table border="1" id="commentTable">
	<c:forEach var="cvo" items="${requestScope.pvo.commentVO}" varStatus="c">
		<tr><td id="writer">${cvo.id }</td>
			 <td><span id="commentContent${c.index }" >${cvo.content }</span>
			 <input type="hidden" value="${cvo.content }" id="commentContentHidden${c.index }">
			 <c:choose>
			 	<c:when test="${sessionScope.mvo.id==cvo.id }">
			 	<span id="commentTextSpan${c.index }">
				 <input type='button' value='＋' id='updateCommentBtn${c.index }' style="width: 30px;"name="btn">
				 <input type='button' value='×' id='deleteCommentBtn${c.index }'>
				 </span>
				  <input type="hidden" value="${cvo.commentNo }"  name="cindex" id="commentNo${c.index }">
				 </c:when>
			 </c:choose>
			 </td>
			 <td id="date">${cvo.commentDate }</td>
		</tr>
	</c:forEach>
	</table>
	<div id="commentView"></div>
	<c:choose>
		<c:when test="${sessionScope.mvo==null }">
		<input type="text" id='commentTextContentNoLogin' readonly="readonly" value="로그인하세요">
		<input type="button" value="로그인" id="writeCommentLogin">
		</c:when>
		<c:otherwise>
		<input type="text" id="commentTextContent">
	<input type="button" value="댓글작성" id="writeComment">
		</c:otherwise>
	</c:choose>
</div>
</div>
  </div>
  <div id="space"></div>
</body>
