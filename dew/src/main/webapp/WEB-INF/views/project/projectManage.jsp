<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
        <link rel="stylesheet" href="css/project.css">
         <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script type="text/javascript">
 	 $(document).ready(function(){
 		$("#allProForm").mouseover(function(){
  			$("#allPro").css("background","#B4E5FF");
				$("#allProView").html("<br>생성중<br><c:forEach items='${requestScope.pmvo.creatingProject}' var='createP'>${createP.projectName} ${createP.point}point ${createP.project_date} ${createP.deadline}<br></c:forEach><br>"+
				"신청중<br><c:forEach items='${requestScope.pmvo.joinProject}' var='joinP'>${joinP.projectName} ${joinP.deadline}<br></c:forEach><br>진행중<br><c:forEach items='${requestScope.pmvo.processingProject}' var='processP'>${processP.projectName}<br></c:forEach><br>");
  		}).mouseout(function(){
  			$("#allPro").css("background","white");
  			$("#allProView").html("");
  		});
 		$("#regProForm").mouseover(function(){
  			$("#regPro").css("background","#B4E5FF");
  			$("#regProView").html("<br><c:forEach items='${requestScope.pmvo.creatingProject}' var='createP'>${createP.projectName} ${createP.point}point ${createP.project_date} ${createP.deadline}<br></c:forEach><br>");
  		}).mouseout(function(){
  			$("#regPro").css("background","white");
  			$("#regProView").html("");
  		});
 		$("#joinProForm").mouseover(function(){
  			$("#joinPro").css("background","#B4E5FF");
  			$("#joinProView").html("<br><c:forEach items='${requestScope.pmvo.joinProject}' var='joinP'>${joinP.projectName} ${joinP.deadline}<br></c:forEach><br>");
  		}).mouseout(function(){
  			$("#joinPro").css("background","white");
  			$("#joinProView").html("");
  		});
 		$("#processProForm").mouseover(function(){
  			$("#processPro").css("background","#B4E5FF");
  			$("#processProView").html("<br><c:forEach items='${requestScope.pmvo.processingProject}' var='processP'>${processP.projectName}<br></c:forEach><br>");
  		}).mouseout(function(){
  			$("#processPro").css("background","white");
  			$("#processProView").html("");
  		});
 		$("#requestProForm").mouseover(function(){
  			$("#requestPro").css("background","#B4E5FF");
  		}).mouseout(function(){
  			$("#requestPro").css("background","white");
  		});
 	 });
  </script>
<body>
<h3 id="projectRegisterLogo">프로젝트 관리</h3>
<div id="manageForm">
<div id="manageFormView" class="all">
		<hr><a href=""><b>${sessionScope.mvo.memberName } </b></a> 프로젝트 정보<hr>
		<div id="allProForm" ><div id="allPro" style="cursor: pointer" class="all"><hr>전체 프로젝트<b> ${fn:length(requestScope.pmvo.creatingProject)+fn:length(requestScope.pmvo.joinProject)+fn:length(requestScope.pmvo.processingProject)}</b><hr></div><div id="allProView"></div></div>
		<div id="regProForm" ><div id="regPro" style="cursor: pointer"><hr>생성중<b> ${fn:length(requestScope.pmvo.creatingProject)}</b><hr></div><div id="regProView"></div></div>
		<div id="joinProForm" ><div id="joinPro" style="cursor: pointer"><hr>참가신청<b> ${fn:length(requestScope.pmvo.joinProject)}</b><hr></div><div id="joinProView"></div></div>
		<div id="processProForm" ><div id="processPro" style="cursor: pointer"><hr>진행중<b> ${fn:length(requestScope.pmvo.processingProject)}</b><hr></div><div id="processProView"></div></div>
		<div id="requestProForm" ><div id="requestPro" style="cursor: pointer"><hr>의뢰<b> 0</b><hr></div><div id="requestProView"></div></div>
	
</div>
  </div>
    <div id="manageSpace"></div>
</body>