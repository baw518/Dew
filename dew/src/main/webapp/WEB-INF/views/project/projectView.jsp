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
				location.href="member_login_form.do";
  			<%}else{%>
  				$("#joinComment").html("지원분야 <select id='subjectVal'><option value=''>고르세요</option><c:forEach items='${requestScope.pvo.departVO}' var='dvo'><option value='${dvo.subject}'>${dvo.subject}</option></c:forEach></select><textarea rows='3' cols='53' id='joinCommentArea'></textarea><br><br>");
  				$("#joinCommentArea").focus();
  				$("#switchBtn").html("<input type='button' value='신청완료' id='joinProBtn2'>");
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
			location.href="member_login_form.do";
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
	 $(function() {
	 	    $( "#progressbar" ).progressbar({
	 	      value: <%=pvo.getProgressing()%>
	 	    });
	 	  });
</script>
	<link rel="stylesheet" href="css/project.css">
<body>
<h3 id="projectRegisterLogo">Project</h3>
<div id="viewForm">
<div id="view">
<table border="1" width="500px" align="center">
   <c:choose>
    <c:when test="${requestScope.pvo.achieve=='의뢰' }">
    <tr><td colspan="2">프로젝트명</td><td colspan="2">${requestScope.pvo.projectName}</td></tr>
<tr><td colspan="2">작성자</td><td colspan="2">${requestScope.pvo.id}</td></tr>
<tr><td colspan="2">작성일</td><td colspan="2">${requestScope.pvo.project_date}</td></tr>
<tr><td colspan="4" align="center"><b>내용</b></td></tr>
<tr><td colspan="4"> <br>${requestScope.pvo.content}<br><c:choose><c:when test="${requestScope.pvo.deadline!='noImage' }">
<img src="${initParam.root}upload/${requestScope.pvo.deadline}"> </c:when></c:choose></td></tr>
    </c:when>
    <c:otherwise>
    <tr><td colspan="2">프로젝트명</td><td colspan="2">${requestScope.pvo.projectName}</td></tr>
<tr><td colspan="2">작성자</td><td colspan="2">${requestScope.pvo.id}</td></tr>
<tr><td colspan="2">작성일</td><td colspan="2">${requestScope.pvo.project_date}</td></tr>
<c:forEach items="${requestScope.pvo.departVO}" var="dvo" varStatus="i">
<tr><td>분야</td><td>${dvo.subject}</td>
<td>인원</td><td>${dvo.mans}<%-- <span id="mans${i.index }"></span> --%></td></tr>
</c:forEach>
<tr><td colspan="2">배당포인트</td><td colspan="2">${requestScope.pvo.point}<b>point</b></td></tr>
<c:choose><c:when test="${requestScope.pvo.achieve=='모집중' }"><tr><td colspan="2">모집기간</td>
<td  colspan="2"><span id="date">${requestScope.pvo.deadline}</span></td></tr></c:when>
<c:when test="${requestScope.pvo.achieve=='진행중' }"><tr><td colspan="2">진행률</td><td colspan="2">
<div id="progressbar"></div></td></tr></c:when><c:otherwise></c:otherwise>
</c:choose>
<tr><td colspan="4" align="center"><b>내용</b></td></tr>
<tr><td colspan="4"> <br>${requestScope.pvo.content}</td></tr>
    </c:otherwise>
    </c:choose>
</table>
<br>
<span id="joinComment"></span>
<input type="button" value="목록" id="backBtn">
	<c:choose>
		<c:when test="${sessionScope.mvo.id==requestScope.pvo.id }">
			<input type="button" value="수정" id="updateProBtn" style="margin-left: 330px">
			<input type="button" value="삭제" id="deleteProBtn" ><br>
		</c:when>
		<c:when test="${requestScope.pvo.achieve!='모집중'&&requestScope.pvo.achieve!='의뢰'&&requestScope.pvo.achieve!='추가모집중' }">
			<b style="margin-left: 130px">마감되었습니다.</b>
		</c:when>
		<c:otherwise>
			<c:choose><c:when test="${requestScope.pvo.achieve!='의뢰' }">
			<span id="switchBtn"><input type="button" value="참가신청" id="joinProBtn" ></span>
			</c:when></c:choose>
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
