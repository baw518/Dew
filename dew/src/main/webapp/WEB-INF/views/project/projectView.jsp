<%@page import="java.util.List"%>
<%@page import="org.kosta.dew.model.vo.CommentVO"%>
<%@page import="org.kosta.dew.model.vo.MemberVO"%>
<%@page import="org.kosta.dew.model.vo.ProjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript">
	<%ProjectVO pvo=(ProjectVO)request.getAttribute("pvo");%>
	 $(document).ready(function(){
		$("#joinProBtn").click(function(){
			<%MemberVO mvo=(MemberVO)session.getAttribute("mvo");
  			if(mvo==null){
%> 			alert("로그인하세요");
				location.href="home.do";
  			<%}else{%>
  				$("#joinComment").html("지원분야 <select id='subjectVal'><option value=''>고르세요</option><c:forEach items='${requestScope.pvo.departVO}' var='dvo'><option value='${dvo.subject}'>${dvo.subject}</option></c:forEach></select><br><textarea rows='3' cols='53' id='joinCommentArea'></textarea><br><br>");
  				$("#joinCommentArea").focus();
  				$("#switchBtn").html("<img src='${initParam.root }images/joinProBtn2.jpg' id='joinProBtn2'>");
  			<%}%>
  			$("#joinProBtn2").click(function(){
  				if($("#subjectVal").val()==""){
  					alert("분야를 고르세요");
  					return false;
  				}
  				$.ajax({
  					type:"POST",
  					url:"joinProjectAjax.do",
  					data: "joinContent="+$("#joinCommentArea").val()+"&projectNo=${requestScope.pvo.projectNo}&projectSub="+$('#subjectVal').val(),
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
			<%if(pvo.getAchieve().equals("진행중")){%>
			alert("진행중인 프로젝트는 삭제할 수 없습니다");
			return;
			<%}else{%>
			if(confirm("삭제하시겠습니까?"))
			location.href="project_delete.do?projectNo=${requestScope.pvo.projectNo}";
			<%}%>
		});
		$("#updateProBtn").click(function(){
			<%if(pvo.getAchieve().equals("의뢰")){%>
			location.href="project_updateForm.do?projectNo=${requestScope.pvo.projectNo}&req=true";
			<%}else{%>
			location.href="project_updateForm.do?projectNo=${requestScope.pvo.projectNo}";
			<%}%>
		});
		$("#writeComment").click(function(){
			if($("#commentTextContent").val()==""){
				alert("댓글을 입력하세요");
				return;
			}
			location.href="registerProjectComment.do?content="+$("#commentTextContent").val()+"&projectNo=${requestScope.pvo.projectNo}";
		});
		$("#writeCommentLogin").click(function(){
			location.href="home.do";
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
			$("#commentTextSpan<%=i%>").html("<img src='${initParam.root }images/cmtUpdateBtn.jpg' id='updateCommentSpanBtn<%=i%>' >");
			 $("#commentTextSpan<%=i%>").on("click","#updateCommentSpanBtn<%=i%>", function(){
				 location.href="updateProjectComment.do?commentNo="+$('#commentNo<%=i%>').val()+"&boardNo=${requestScope.pvo.projectNo}"
					+"&content="+$('#updateComment<%=i%>').val();
			}); 
			});
		 <%}%>
		});
	 $(function() {
	 	    $( "#progressbar" ).progressbar({
	 	      value: <%=pvo.getProgressing()%>
	 	    });
	 	  });
</script>
	
	<link rel="stylesheet" href="css/dew.css">
<body>
<div class="main" align="center">
<div id="viewForm" style="margin-top: 50px">
<div id="view">


 <table class="dewTable">
     <c:choose>
    <c:when test="${requestScope.pvo.achieve=='의뢰' }">
<thead>
	<tr>
		<th>제목 : ${requestScope.pvo.projectName}</th>
		<th>작성자 : <img src="${initParam.root }upload/img/${requestScope.pvo.id}.jpg" width="30px"> ${requestScope.pvo.id}</th>
		<th>${requestScope.pvo.project_date}</th>
	</tr>
	<tr>
		<td colspan="7" >${requestScope.pvo.content}<br><c:choose><c:when test="${requestScope.pvo.deadline!='noImage' }">
<img src="${initParam.root}upload/img/${requestScope.pvo.deadline}" width="500px" style="padding: 50px;margin-left: 100px"> </c:when></c:choose></td>
	</tr>
</thead>
    </c:when>
    <c:otherwise>
    <thead>
	<tr>
		<th>프로젝트 : </th>
		<th>${requestScope.pvo.projectName}</th>
		<th>작성자 : </th>
		<th><img src="${initParam.root }upload/img/${requestScope.pvo.id}.jpg" width="30px"> ${requestScope.pvo.id}</th>
		<th>작성일 : ${requestScope.pvo.project_date}</th>
		<th>${requestScope.pvo.point}<b>point</b></th>
	</tr>
	<tr>
		
		<tr>
		<th>분야</th>
		<th colspan="3">
		<c:forEach items="${requestScope.pvo.departVO}" var="dvo" varStatus="i">
		<c:if test="${dvo.subject=='웹디자인'}"><img src="${initParam.root }images/webD.jpg" height="30px"></c:if>
		<c:if test="${dvo.subject=='웹프로그래밍'}"><img src="${initParam.root }images/webP.jpg" height="30px"></c:if>
		<c:if test="${dvo.subject=='DB'}"><img src="${initParam.root }images/webDB.jpg" height="30px"></c:if>
		<c:if test="${dvo.subject=='서버'}"><img src="${initParam.root }images/webS.jpg" height="30px"></c:if>
		<c:if test="${dvo.subject=='기타'}"><img src="${initParam.root }images/webOther.jpg" height="30px"></c:if>
		${dvo.subject} (${dvo.mans}) <br>
		</c:forEach>
		</th>
		<c:choose><c:when test="${requestScope.pvo.achieve=='모집중' }">
		<th></th><th>모집기간: <span id="date">${requestScope.pvo.deadline}</span></th>
		</c:when>
		<c:when test="${requestScope.pvo.achieve=='진행중' }">
		<th>진행률</th>
		<th><div id="progressbar"></div></th>		
		</c:when><c:otherwise></c:otherwise>
</c:choose>
		</tr>
	<tr>
		<td colspan="7">${requestScope.pvo.content}</td>
	</tr>
</thead>
    
    </c:otherwise>
    </c:choose>
  </table>
<c:if test="${(requestScope.pvo.achieve=='모집중'||requestScope.pvo.achieve=='추가모집중')&&sessionScope.mvo.id!=requestScope.pvo.id }">
			<span id="switchBtn" ><img src="${initParam.root }images/joinProBtn.jpg" id="joinProBtn"></span>
			</c:if>
<br>
<span id="joinComment"></span>
<img align="left" src="${initParam.root }images/backBtn.jpg" id="backBtn">
	<c:choose>
		<c:when test="${sessionScope.mvo.id==requestScope.pvo.id }">
			<span>
			<img align="right" src="${initParam.root }images/deleteBtn.jpg" id="deleteProBtn">
			<img align="right" src="${initParam.root }images/updateBtn.jpg" id="updateProBtn">
			</span>
		</c:when>
		<c:when test="${requestScope.pvo.achieve!='모집중'&&requestScope.pvo.achieve!='의뢰'&&requestScope.pvo.achieve!='추가모집중' }">
			<b>마감되었습니다.</b>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>

<div id="commentForm">
	<table style="border: 1px soild #ccc; background-color: #f8f8f8" id="commentTable" class="dewTable">
	<c:forEach var="cvo" items="${requestScope.pvo.commentVO}" varStatus="c">
		<tr><td id="writer" height="30px" width="10px"><img src="${initParam.root }upload/img/${cvo.id}.jpg" width="30px">${cvo.id }</td>
			 <td><span id="commentContent${c.index }" >${cvo.content }</span>
			 <input type="hidden" value="${cvo.content }" id="commentContentHidden${c.index }">
			 <c:choose>
			 	<c:when test="${sessionScope.mvo.id==cvo.id }">
			 	<span id="commentTextSpan${c.index }">
			 	<img src="${initParam.root }images/cmtUpdateBtn.jpg" id="updateCommentBtn${c.index }" name="btn"">
				<img src="${initParam.root }images/cmtDeleteBtn.jpg" id="deleteCommentBtn${c.index }" >
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
		<input type="text" id='commentTextContentNoLogin' readonly="readonly" value="로그인하세요" style="width: 500px;margin-top: 10px">
		<input type="button" value="로그인" id="writeCommentLogin">
		</c:when>
		<c:otherwise>
		<input type="text" id="commentTextContent" style="width: 500px">
		<img src="${initParam.root }images/writeCmtBtn.jpg" id="writeComment" >
		</c:otherwise>
	</c:choose>
</div>
</div>
  </div>
  <div id="space"></div>
    </div>
</body>
