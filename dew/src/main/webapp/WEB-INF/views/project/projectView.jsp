<%@page import="org.kosta.dew.model.vo.ProjectVO"%>
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
		$('#joinProBtn').click(function(){
			$("#joinComment").html("<textarea rows='3' cols='53' id='joinCommentArea'></textarea><br><br>");
			$("#joinCommentArea").focus();
			$("#switchBtn").html("<input type='button' value='신청완료' id='joinProBtn' >");
		});
		$("#joinProBtn").click(function(){
			/*Ajax사용  */
		});
		$("#backBtn").click(function(){
			location.href="project_listView.do";
		});
		$("#deleteProBtn").click(function(){
			alert("삭제완료");
			location.href="project_delete.do?projectNo=${requestScope.pvo.projectNo}";
		});
		$("#updateProBtn").click(function(){
			alert("수정완료");
			location.href="project_update.do?projectNo=${requestScope.pvo.projectNo}";
		});
});  
</script>
	<link rel="stylesheet" href="css/project.css">
<body>
<h3 id="projectRegisterLogo">프로젝트</h3>
<div id="viewForm">
<div id="view">
<table border="1" width="500px" align="center">
<tr><th>프로젝트명</th><td>${requestScope.pvo.projectName}</td></tr>
<tr><th>작성자</th><td>${requestScope.pvo.writer}</td></tr>
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
<span id="switchBtn"><input type="button" value="참가신청" id="joinProBtn" ></span>
<input type="button" value="수정" id="updateProBtn" style="margin-left: 100px">
<input type="button" value="삭제" id="deleteProBtn" >
</div>
  </div>
   <span id="comment"></span>
  <div id="space"></div>
</body>
