<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 토론방 생성 FORM  -->
<c:choose>
<c:when test="${sessionScope.mvo !=null}">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${initParam.root}smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
 	$(document).ready(function(){

		// 확인 버튼 누르면 세션id/제목/주제/내용을 가지고 updateDiscussComment 로 감
		$("#submit").click(function(){
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	
			var sHTML = oEditors.getById["content"].getIR();
			var title = $("#title").val();
			var subject = $("#subject").val();
			if(title==""){
				alert("제목을 입력하세요");
				return false;
			}
			if(subject==""){
				alert("주제를 입력하세요");
				return false;
			}
			if(sHTML==""){
				alert("내용을 입력하세요");
				return false;
			}
			if(!confirm("작성하시겠습니까??")){
				return false;
			}
		
		 	location.href="registerDiscussion.do?id="+$("#sessionId").val()+"&title="+$("#title").val()+"&subject="+$("#subject").val()+"&content="+$("#content").val();  
		});
	}); 
	var oEditors = [];
	

	$(document).ready(function(){
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "${initParam.root}/smarteditor/SmartEditor2Skin.html",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function(){
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				oEditors.getById["content"].exec("PASTE_HTML", ["내용을 입력해 주세요."]);
			},
			fCreator: "createSEditor2"
		});
	});
</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<div class="main">

<input type="hidden" id="sessionId" name="sessionId" value="${sessionScope.mvo.id}">
<form>
<%-- <input type="hidden" name="id" value="${sessionScope.mvo.id }"> --%>
<table class="dewTable">
<caption><h1>write Discussion</h1></caption>
	<tr>
		<td>제목 <input type="text" name="title" id="title" ></td>
	</tr>
	<tr>
		<td>주제<input type="text" name="subject" id="subject"></td>
	</tr>
	<tr><td colspan="2" style="border-bottom: 3px solid #fbe762">내용</td></tr>
	<tr>
		<td colspan="2" style="border-bottom-color: #ffffff">
			<textarea rows="10" cols="100" id="content" name="content"></textarea>
		</td>
	</tr>
	<tr>
	<td colspan="2" align="center" style="border-bottom-color: #ffffff">
	<input type="button" value="임시저장">
	<input type="button" value="미리보기">
	<input type="button" id="submit" value="확인">
	</td>
	</tr>
</table>
</form>
</c:when>
<c:otherwise>
	로그인해..
</c:otherwise>
</c:choose>
</div>