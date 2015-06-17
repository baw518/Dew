<%@page import="org.kosta.dew.model.vo.ProjectVO"%>
<%@page import="java.util.List"%>
<%@page import="org.kosta.dew.model.vo.ProjectManageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
        <link rel="stylesheet" href="css/project.css">
         <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script type="text/javascript">
 	 $(document).ready(function(){
 		$("#allProForm").hover(function(){
  		 	$("#allPro").css("background","#B4E5FF");
			$("#allProView").html("<c:choose><c:when test='${fn:length(requestScope.pmvo.creatingProject)!=0||fn:length(requestScope.pmvo.joinProject)!=0||fn:length(requestScope.pmvo.processingProject)!=0}'><table border='1'><tr><td colspan='2' width='500px'>생성중</td></tr><c:forEach items='${requestScope.pmvo.creatingProject}' var='createP'><tr><td>${createP.projectName}</td><td>${createP.project_date}</td></tr></c:forEach>"+
				"<tr><td colspan='2'>신청중</td></tr><c:forEach items='${requestScope.pmvo.joinProject}' var='joinP'><tr><td>${joinP.projectName}</td><td>${joinP.deadline}</td></tr></c:forEach><tr><td colspan='2'>진행중</td></tr><c:forEach items='${requestScope.pmvo.processingProject}' var='processP'><tr><td>${processP.projectName}</td><td>${processP.project_date}</td></c:forEach></table></c:when><c:otherwise></c:otherwise></c:choose>");
  		},function(){
  			$("#allPro").css("background","white");
  			$("#allProView").html("");
  		});
 		$("#regProForm").hover(function(){
  			$("#regPro").css("background","#B4E5FF");
  			$("#regProView").html("<c:choose><c:when test='${fn:length(requestScope.pmvo.creatingProject)!=0}'><c:forEach items='${requestScope.pmvo.creatingProject}' var='createP' varStatus='start'><table border='1'><tr><td><a href='project_View.do?projectNo=${createP.projectNo}'>${createP.projectName}</a></td></tr> "+
  			"<tr><td>${createP.point}point ${createP.project_date} ${createP.deadline} <input type='button' value='시작' id='startProBtn${start.index}'><input type='hidden' value='${createP.projectNo}' id='ProBtnHid${start.index}'><input type='button' value='삭제' id='deleteBtn${start.index}'></td></tr>"+
  			"<tr><td><c:forEach items='${createP.commentVO }' var='com' varStatus='cp'><br><table border='1' ><tr><td colspan='3'>참가신청자</td></tr><tr><td width='80px'>ID</td><td width='200px'>한마디</td><td width='150px' >접수일</td></tr><tr><td>${com.id}</td><td>${com.content}</td><td>${com.commentDate} <input type='hidden' value='${com.id}' id='deleteJoinerBtnHid${cp.index}'><input type='button' value='삭제' style='padding: 0px;' id='deleteJoiner${cp.index}'></td></tr></table></c:forEach><br></c:forEach></td></tr></table></c:when><c:otherwise></c:otherwise></c:choose>");
  		},function(){
  			$("#regPro").css("background","white");
  			$("#regProView").html("");
  		});
 		$("#joinProForm").hover(function(){
  			$("#joinPro").css("background","#B4E5FF");
  			//프로젝트 VO를 받아왔는데 코멘트 NO가 필요하므로 프로젝트VO의 hit를 사용하여 받아왔다. 
  			$("#joinProView").html("<c:choose><c:when test='${fn:length(requestScope.pmvo.joinProject)!=0}'><br><table><c:forEach items='${requestScope.pmvo.joinProject}' var='joinP' varStatus='jp'><tr><td width='280px'><a href='project_View.do?projectNo=${joinP.projectNo}'>${joinP.projectName}</a></td><td> ${joinP.deadline} <input type='button' value='취소' id='deleteJoinBtn${jp.index}'><input type='hidden' value='${joinP.hit}' id='deleteJoinBtnHid${jp.index}'></td></tr></c:forEach></table><br></c:when><c:otherwise></c:otherwise></c:choose>");
  		},function(){
  			$("#joinPro").css("background","white");
  			$("#joinProView").html("");
  		});
 		$("#processProForm").hover(function(){
  			$("#processPro").css("background","#B4E5FF");
  			$("#processProView").html("<c:choose><c:when test='${fn:length(requestScope.pmvo.processingProject)!=0}'><table><c:forEach items='${requestScope.pmvo.processingProject}' var='processP'><tr><td width='290px'><a href='project_View.do?projectNo=${processP.projectNo}'>${processP.projectName}</a></td><td> ${processP.progressing}% </td><td>${processP.project_date}</td></tr></c:forEach></table><br></c:when><c:otherwise></c:otherwise></c:choose>");
  		},function(){
  			$("#processPro").css("background","white");
  			$("#processProView").html("");
  		});
 		$("#requestProForm").hover(function(){
  			$("#requestPro").css("background","#B4E5FF");
  		},function(){
  			$("#requestPro").css("background","white");
  		});
 		<%ProjectManageVO pmvo=(ProjectManageVO)request.getAttribute("pmvo");
 			List<ProjectVO> jpl=pmvo.getJoinProject();
 			for(int i=0;i<jpl.size();i++){%>
 			$("#joinProView").on("click","#deleteJoinBtn<%=i%>", function(){
 				if(confirm("취소하시겠습니까?"))
 					location.href="deleteJoinComment.do?commentNo="+$("#deleteJoinBtnHid<%=i%>").val();
 			});
 		<%}
 			List<ProjectVO> cpl=pmvo.getCreatingProject();
 			for(int i=0;i<cpl.size();i++){%>
 			$("#regProView").on("click","#startProBtn<%=i%>", function(){
				if(confirm("시작하시겠습니까?"))
					location.href="startProject.do?projectNo="+$("#ProBtnHid<%=i%>").val();
			});
			$("#regProView").on("click","#deleteBtn<%=i%>", function(){
				if(confirm("삭제하시겠습니까?"))
					location.href="project_delete.do?projectNo="+$("#ProBtnHid<%=i%>").val()+"&manage=true";
			});
			$("#regProView").on("click","#deleteJoiner<%=i%>",function(){
				if(confirm("삭제하시겠습니까?"))
					location.href="project_deleteJoiner.do?commentId="+$("#deleteJoinerBtnHid<%=i%>").val();
			});
			<%}%>
 	 });
  </script>
<body>
<h3 id="projectRegisterLogo">프로젝트 관리</h3>
<div id="manageForm">
<div id="manageFormView">
		<hr><a href=""><b>${sessionScope.mvo.memberName } </b></a> 프로젝트 정보<hr>
		<div id="allProForm" ><div id="allPro" style="cursor: pointer" class="all"><hr>전체 프로젝트<b> ${fn:length(requestScope.pmvo.creatingProject)+fn:length(requestScope.pmvo.joinProject)+fn:length(requestScope.pmvo.processingProject)}</b><hr></div><div id="allProView"></div></div>
		<div id="regProForm" ><div id="regPro" style="cursor: pointer"><hr>생성중<b> ${fn:length(requestScope.pmvo.creatingProject)}</b><hr></div><div id='regProViewForm'><div id="regProView"></div></div></div>
		<div id="joinProForm" ><div id="joinPro" style="cursor: pointer"><hr>참가신청<b> ${fn:length(requestScope.pmvo.joinProject)}</b><hr></div><div id="joinProView"></div></div>
		<div id="processProForm" ><div id="processPro" style="cursor: pointer"><hr>진행중<b> ${fn:length(requestScope.pmvo.processingProject)}</b><hr></div><div id="processProView"></div></div>
		<div id="requestProForm" ><div id="requestPro" style="cursor: pointer"><hr>의뢰<b> 0</b><hr></div><div id="requestProView"></div></div>
</div>
  </div>
    <div id="manageSpace"></div>
</body>