<%@page import="org.kosta.dew.model.vo.MemberVO"%>
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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script type="text/javascript">
  	$(document).ready(function(){
  		$("#create").hover(function(){
  			$(this).attr({src:"${initParam.root}images/Create2.jpg"});
  		},function(){
  			$(this).attr({src:"${initParam.root}images/Create.jpg"});
  	});
  		$("#Join").hover(function(){
  			$(this).attr({src:"${initParam.root}images/Join21.jpg"});
  		},function(){
  			$(this).attr({src:"${initParam.root}images/Join.jpg"});
  	});
  		$("#want").hover(function(){
  			$(this).attr({src:"${initParam.root}images/want21.jpg"});
  		},function(){
  			$(this).attr({src:"${initParam.root}images/want.jpg"});
  	});
  		$("#want").click(function(){
  			location.href="project_reqRegisterForm.do";
  		});
  		$("#create").click(function(){
  			<%MemberVO mvo=(MemberVO)session.getAttribute("mvo");
  			if(mvo==null){
%>  			alert("로그인하세요");
  				location.href="login_form.do";
  			<%}else{%>
  			location.href="project_registerForm.do";
  			<%}%>
  		});
  		$("#Join").click(function(){
  			location.href="project_listView.do";
  		});

  	});
  </script>
  <script type="text/javascript">
 	 $(document).ready(function(){
 		<%ProjectManageVO pmvo=(ProjectManageVO)request.getAttribute("pmvo");
 			List<ProjectVO> jpl=pmvo.getJoinProject();
 			for(int i=0;i<jpl.size();i++){%>
 			$("#deleteJoinBtn<%=i%>").click(function(){
				if(confirm("취소하시겠습니까?"))
 					location.href="deleteJoinComment.do?commentNo="+$("#deleteJoinBtnHid<%=i%>").val();
			});
 		<%}
 			List<ProjectVO> cpl=pmvo.getCreatingProject();
 			for(int i=0;i<cpl.size();i++){%>
 			$("#startProBtn<%=i%>").click(function(){
				if(confirm("시작하시겠습니까?"))
					location.href="project_start.do?projectNo="+$("#ProBtnHid<%=i%>").val();
			});
			$("#deleteBtn<%=i%>").click(function(){
				if(confirm("삭제하시겠습니까?"))
					location.href="project_delete.do?projectNo="+$("#ProBtnHid<%=i%>").val()+"&manage=true";
			});
			$("#deleteJoiner<%=i%>").click(function(){
				if(confirm("삭제하시겠습니까?"))
					location.href="project_deleteJoiner.do?id="+$("#deleteJoinerBtnHid<%=i%>").val()+"&projectNo="+$("#deleteJoinerBtnHid2<%=i%>").val();
			});
			<%}
			List<ProjectVO> ppl=pmvo.getProcessingProject();
 			for(int i=0;i<ppl.size();i++){%>
			$("#successBtn<%=i%>").click(function(){
				if(confirm("완료하시겠습니까?"))
					location.href="project_success.do?projectNo="+$("#successBtnHid<%=i%>").val();
			});
			$(function() {
		 	    $( '#progressbar<%=i%>' ).progressbar({
		 	      value: <%=ppl.get(i).getProgressing()%>
		 	    });
		 	  });
			$(function() {
			    $( "#slider<%=i%>" ).slider({
			    	  value:  <%=ppl.get(i).getProgressing()%>,
			 		  change: function(){
			 			 $.ajax({
			  					type:"POST",
			  					url:"updateProgressAjax.do",
			  					data: "projectNo="+<%=ppl.get(i).getProjectNo()%>+"&progressing="+$( '#slider<%=i%>' ).slider( "option", "value" ),
			  					success:function(progressing){
			  						$( "#progressbar<%=i%>" ).progressbar( "option", "value", progressing );
			 		  }
			    	});
			  }
			    });
			});
			$("#popupPro<%=i%>").click(function(){
	  			window.open("project_popupProGetJoiner.do?projectNo="+<%=ppl.get(i).getProjectNo()%>,"notice","width=350,height=460,top=120,left=950");
			});
			<%}%>
			$("#deleteSuccessProject").click(function(){
				location.href="project_delete.do?projectNo="+$('#successProjectNo').val()+"&manage=true";
			});
 	 });
 	$(function() {
	    $( "#accordion" ).accordion({
	    	collapsible: true,
	    	heightStyle: "content"
	    });
	  });
  </script>
<body>
<c:choose><c:when test="${sessionScope.mvo!=null }">
<br><br><br>
<div id="manageForm">
 <div id="main_viewForm1">
	<img src="${initParam.root}images/Create.jpg"  id="create">
	<img src="${initParam.root}images/Join.jpg"  id="Join">
	<img src="${initParam.root}images/want.jpg"  id="want">
 </div>
<div id="manageFormView">
<div id="accordion">
  <h3>전체 프로젝트 <b> (${fn:length(requestScope.pmvo.creatingProject)+fn:length(requestScope.pmvo.joinProject)+fn:length(requestScope.pmvo.processingProject)})</b></h3>
  <div>
    <table border='5' ><tr><td colspan='2' width='700px' style="background-color: yellow">생성중</td></tr><c:forEach items='${requestScope.pmvo.creatingProject}' var='createP'><tr><td>${createP.projectName}</td><td>${createP.project_date}</td></tr></c:forEach>
	<tr><td colspan='2' style="background-color: yellow">신청중</td></tr><c:forEach items='${requestScope.pmvo.joinProject}' var='joinP'><tr><td>${joinP.projectName}</td><td>${joinP.deadline}</td></tr></c:forEach><tr><td colspan='2' style="background-color: yellow">진행중</td></tr>
	<c:forEach items='${requestScope.pmvo.processingProject}' var='processP'><tr><td>${processP.projectName}</td><td>${processP.project_date}</td></c:forEach></table>
  </div>
  <h3>모집중<b> (${fn:length(requestScope.pmvo.creatingProject)})</b></h3>
  <div>
  <c:choose>
  <c:when test="${fn:length(requestScope.pmvo.creatingProject)!=0}">
   <table border='5'><tr><td><c:forEach items='${requestScope.pmvo.creatingProject}' var='createP' varStatus='start'>
    		<table border= "3"><tr><td style='width: 700px;background-color: yellow;'><a href='project_View.do?projectNo=${createP.projectNo}'>${createP.projectName}</a></td></tr> 
  			<tr><td>${createP.point}point 일시 ${createP.project_date} 마감 ${createP.deadline} <input type='button' value='시작' id='startProBtn${start.index}'style='padding: 0px;'><input type='hidden' value='${createP.projectNo}' id='ProBtnHid${start.index}'>
  			<input type='button' value='삭제' id='deleteBtn${start.index}' style='padding: 0px;'></td></tr><tr><td>
  			<c:forEach items='${createP.commentVO }' var='com' varStatus='cp'><br><table border='1' ><tr><td colspan='4'>참가신청자</td></tr>
  			<tr><td width="80px">ID</td><td width="120px">분야</td><td width='350px'>내용</td><td width='160px' >접수일</td></tr><tr><td>${com.id}</td><td>${com.projectSub }</td><td>${com.content}</td><td>${com.commentDate} 
  			<input type='hidden' value='${com.id}' id='deleteJoinerBtnHid${cp.index}'><input type='hidden' value='${createP.projectNo}' id='deleteJoinerBtnHid2${cp.index}'>
  			<input type='button' value='삭제' style='padding: 0px;' id='deleteJoiner${cp.index}'></td></tr></table></c:forEach><br></td></tr></table><br></c:forEach></td></tr></table>
	</c:when>
 	</c:choose>
  </div>
  <h3>참가신청<b> (${fn:length(requestScope.pmvo.joinProject)})</b></h3>
  <div>
    <!-- 프로젝트 VO를 받아왔는데 코멘트 NO가 필요하므로 프로젝트VO의 hit를 사용하여 받아왔다.  -->
   <br><table border='5'>
    <tr style="background-color: yellow"><td width='400px' >프로젝트명</td><td width="230px">신청일</td></tr><c:forEach items='${requestScope.pmvo.joinProject}' var='joinP' varStatus='jp'><tr><td>
    <a href='project_View.do?projectNo=${joinP.projectNo}'>${joinP.projectName}</a></td><td> ${joinP.deadline} 
    <input type='button' value='취소' id='deleteJoinBtn${jp.index}'><input type='hidden' value='${joinP.hit}' id='deleteJoinBtnHid${jp.index}'></td>
   </tr></c:forEach></table><br>
  </div>
  <h3>진행중<b> (${fn:length(requestScope.pmvo.processingProject)})</b></h3>
  <div>
    <table border='5'><tr style="background-color: yellow"><td width='600px'>프로젝트명</td>
    <td width='120px'>진행률</td><td width='250px'>생성일</td></tr>
    <c:forEach items='${requestScope.pmvo.processingProject}' var='processP' varStatus='pro'><tr><td width='250px'>
    <span id="popupProForm"><span id="popupPro${pro.index }"><U><font color="blue">${processP.projectName}</font></U></span></span></td><td> <div id="progressbar${pro.index}"></div>
    </td><td>${processP.project_date}<c:choose><c:when test='${processP.id==sessionScope.mvo.id}'>
    <input type='button' value='완료' id='successBtn${pro.index}'><input type='hidden' value='${processP.projectNo}' id='successBtnHid${pro.index}'>
    <tr><td colspan="3"><div id="slider${pro.index }"></div></td></tr></c:when></c:choose></td></tr></c:forEach></table><br>
  </div>
   <h3>완료<b> (${fn:length(requestScope.pmvo.successProject)})</b></h3>
  <div>
   <table border='5'><tr style="background-color: yellow"><td width='600px'>프로젝트명</td><td width="200px">완료일</td></tr>
    <c:forEach items='${requestScope.pmvo.successProject}' var='successP'><tr><td><a href='project_View.do?projectNo=${successP.projectNo}'>${successP.projectName}</a>
    </td><td>${successP.project_date}<input type="hidden" value="${successP.projectNo}" id="successProjectNo"> <input type="button" value="삭제" id="deleteSuccessProject"></td></tr></c:forEach></table><br>
  </div>
</div>
</div>
  </div>
    <div id="manageSpace"></div>	
 </c:when></c:choose>
</body>