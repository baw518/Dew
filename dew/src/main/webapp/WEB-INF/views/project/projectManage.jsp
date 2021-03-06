<%@page import="org.kosta.dew.model.vo.MemberVO"%>
<%@page import="org.kosta.dew.model.vo.ProjectVO"%>
<%@page import="java.util.List"%>
<%@page import="org.kosta.dew.model.vo.ProjectManageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="css/project.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
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
  			if(mvo==null){%>  			alert("로그인하세요");
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
				if(confirm("시작하시겠습니까?")){
					if($("#commentVOHid<%=i%>").val()=='[]'){
						alert("최소 두 명이 필요합니다");
						return;
					}
					location.href="project_start.do?projectNo="+$("#ProBtnHid<%=i%>").val();
				}
			});
			$("#deleteBtn<%=i%>").click(function(){
				if(confirm("삭제하시겠습니까?"))
					location.href="project_delete.do?projectNo="+$("#ProBtnHid<%=i%>").val()+"&manage=true";
			});
			<%for(int c=0;c<cpl.get(i).getCommentVO().size();c++){%>
			$("#deleteJoiner<%=i%><%=c%>").click(function(){
				if(confirm("삭제하시겠습니까?"))
					location.href="project_deleteJoiner.do?id="+$("#deleteJoinerBtnHid<%=i%><%=c%>").val()+"&projectNo="+$("#deleteJoinerBtnHid2<%=i%><%=c%>").val();
			}); 
			<%}}
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
			$("#popupPro<%=i%>")
								.click(
										function() {
											window
													.open(
															"project_popupProGetJoiner.do?projectNo="
																	+<%=ppl.get(i).getProjectNo()%>,
															"notice",
															"width=350,height=460,top=120,left=950");
										});
<%}List<ProjectVO> spl=pmvo.getSuccessProject();
	for(int s=0;s<spl.size();s++){%>
	$("#deleteSuccessProject<%=s%>")
								.click(
										function() {
											location.href = "project_delete.do?projectNo="
													+ $('#successProjectNo<%=s%>').val()+ "&manage=true";
										});
	 <%}%>
					});
 	
	$(function() {
		$("#accordion").accordion({
			collapsible : true,
			heightStyle : "content"
		});
	});
</script>
<body>
	<c:choose>
		<c:when test="${sessionScope.mvo!=null }">
			<br>
			<br>
			<br>
			<div id="manageForm">
				<div id="main_viewForm1">
					<img src="${initParam.root}images/Create.jpg" id="create"> <img
						src="${initParam.root}images/Join.jpg" id="Join"> <img
						src="${initParam.root}images/want.jpg" id="want">
				</div>
				<div id="manageFormView">
					<div id="accordion">
						<h3>
							전체 프로젝트 <b>
								(${fn:length(requestScope.pmvo.creatingProject)+fn:length(requestScope.pmvo.joinProject)+fn:length(requestScope.pmvo.processingProject)})</b>
						</h3>
						<div>
							<table>
								<tr>
									<td style="background-color: #E1F6FA;" colspan='2'
										width='700px'>생성중</td>
								</tr>
								<c:forEach items='${requestScope.pmvo.creatingProject}'
									var='createP'>
									<tr  style="background-color: #F4FFFF">
										<td>${createP.projectName}</td>
										<td>${createP.project_date}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan='2' style="background-color: #E1F6FA">신청중</td>
								</tr>
								<c:forEach items='${requestScope.pmvo.joinProject}' var='joinP'>
									<tr style="background-color: #F4FFFF">
										<td>${joinP.projectName}</td>
										<td>${joinP.deadline}</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan='2' style="background-color: #E1F6FA;">진행중</td>
								</tr>
								<c:forEach items='${requestScope.pmvo.processingProject}'
									var='processP'>
									<tr style="background-color: #F4FFFF">
										<td>${processP.projectName}</td>
										<td>${processP.project_date}</td>
								</c:forEach>
							</table>
						</div>
						<h3>
							모집중<b> (${fn:length(requestScope.pmvo.creatingProject)})</b>
						</h3>
						<div>
							<c:choose>
								<c:when
									test="${fn:length(requestScope.pmvo.creatingProject)!=0}">
									<table>
										<tr>
											<td><c:forEach
													items='${requestScope.pmvo.creatingProject}' var='createP'
													varStatus='start'>
													<table>
														<tr>
															<td style='width: 700px; background-color: #E1F6FA;'><a
																href='project_View.do?projectNo=${createP.projectNo}'>${createP.projectName}</a></td>
														</tr>
														<tr>
															<td>${createP.point}point일시 ${createP.project_date}
																마감 ${createP.deadline} 
																<img src="${initParam.root }images/startBtn.jpg" id='startProBtn${start.index}' width="25px">
																<input type='hidden' value='${createP.projectNo}'
																id='ProBtnHid${start.index}'> 
																<input type="hidden" value="${createP.commentVO}" id="commentVOHid${start.index}">
																<img src="${initParam.root }images/deleteProBtn.jpg" id='deleteBtn${start.index}' width="22px">
															</td>
														</tr>
														<tr>
															<td colspan='4' style="background-color: #FFEBF0">참가신청자</td>
														</tr>
														<tr>
															<td><c:forEach items='${createP.commentVO }'
																	var='com' varStatus='cp'>
																	<table>
																		
																		<tr style="background-color: #FFEBF0">
																			<td width="80px">ID</td>
																			<td width="120px">분야</td>
																			<td width='350px'>내용</td>
																			<td width='160px'>접수일</td>
																		</tr>
																		<tr>
																			<td><img src="${initParam.root }upload/img/${com.id }.jpg" width="60px" height="40px">${com.id}</td>
																			<td>${com.projectSub }</td>
																			<td>${com.content}</td>
																			<td>${com.commentDate}<input type='hidden'
																				value='${com.id}' id='deleteJoinerBtnHid${start.index }${cp.index}'><input
																				type='hidden' value='${createP.projectNo}' id='deleteJoinerBtnHid2${start.index }${cp.index }'>
																				<img src="${initParam.root }images/deleteMan.jpg" id='deleteJoiner${start.index }${cp.index}'></td>
																		</tr>
																	</table>
																</c:forEach><br></td>
														</tr>
													</table>
													<br>
												</c:forEach></td>
										</tr>
									</table>
								</c:when>
							</c:choose>
						</div>
						<h3>
							참가신청<b> (${fn:length(requestScope.pmvo.joinProject)})</b>
						</h3>
						<div>
							<!-- 프로젝트 VO를 받아왔는데 코멘트 NO가 필요하므로 프로젝트VO의 hit를 사용하여 받아왔다.  -->
							<br>
							<table>
								<tr style="background-color: #E1F6FA;">
									<td width='400px'>프로젝트명</td>
									<td width="230px">신청일</td>
								</tr>
								<c:forEach items='${requestScope.pmvo.joinProject}' var='joinP'
									varStatus='jp'>
									<tr style="background-color: #EBFFEB">
										<td><a
											href='project_View.do?projectNo=${joinP.projectNo}'>${joinP.projectName}</a></td>
										<td>${joinP.deadline} 
										<img src="${initParam.root }images/deleteProBtn.jpg" id='deleteJoinBtn${jp.index}' width="20px">
										<input type='hidden' value='${joinP.hit}' id='deleteJoinBtnHid${jp.index}'></td>
									</tr>
								</c:forEach>
							</table>
							<br>
						</div>
						<h3>
							진행중<b> (${fn:length(requestScope.pmvo.processingProject)})</b>
						</h3>
						<div>
							<table>
								<tr style="background-color: #E1F6FA;">
									<td width='600px'>프로젝트명</td>
									<td width='120px'>진행률</td>
									<td width='250px'>생성일</td>
								</tr>
								<c:forEach items='${requestScope.pmvo.processingProject}'
									var='processP' varStatus='pro'>
									<tr style="background-color: #EBFFEB">
										<td width='250px'><span id="popupProForm"><span
												id="popupPro${pro.index }"><U><font color="blue">${processP.projectName}</font></U></span></span></td>
										<td>
											<div id="progressbar${pro.index}"></div>
										</td>
										<td>${processP.project_date}
												<c:if test='${processP.id==sessionScope.mvo.id}'>
													<img src="${initParam.root }images/successProBtn.jpg" id='successBtn${pro.index}' >
													<input type='hidden' value='${processP.projectNo}'
														id='successBtnHid${pro.index}'>
													<tr>
														<td colspan="3"><div id="slider${pro.index }"></div></td>
													</tr>
												</c:if>
											</td>
									</tr>
								</c:forEach>
							</table>
							<br>
						</div>
						<h3>
							완료<b> (${fn:length(requestScope.pmvo.successProject)})</b>
						</h3>
						<div>
							<table>
								<tr style="background-color: #E1F6FA">
									<td width='600px'>프로젝트명</td>
									<td width="200px">완료일</td>
								</tr>
								<c:forEach items='${requestScope.pmvo.successProject}'
									var='successP' varStatus="sp">
									<tr style="background-color: #F4FFFF">
										<td><a
											href='project_View.do?projectNo=${successP.projectNo}'>${successP.projectName}</a>
										</td>
										<td>${successP.project_date}<input type="hidden"
											value="${successP.projectNo}" id="successProjectNo${sp.index }">
											<img src="${initParam.root }images/deleteProBtn.jpg" id='deleteSuccessProject${sp.index }' width="20px">
									</tr>
								</c:forEach>
							</table>
							<br>
						</div>
					</div>
				</div>
			</div>
			<div id="manageSpace"></div>
		</c:when>
	</c:choose>
</body>