<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${initParam.root}smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];

function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	var sHTML = oEditors.getById["content"].getIR();
	var title = $("#title").val();
	var point = $("#point").val();
	
	if(title==""){
		alert("제목을 입력하세요");
		return false;
	}
	if(sHTML==""){
		alert("내용을 입력하세요");
		return false;
	}
	if(!confirm("작성하시겠습니까??")){
		return false;
	}
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

$(document).ready(function(){
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${initParam.root}/smarteditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			oEditors.getById["content"].exec("PASTE_HTML", ["답변 내용을 입력하세요."]);
		},
		fCreator: "createSEditor2"
	});
	
	$("#cancel").click(function(){
		if(!confirm("입력한 내용을 취소하시겠습니까??")){
			return false;
		}
		location.href="QnA_showContent.do?qnaNo=${requestScope.qvo.qnaNo}";
	});
	
	$("#reply").click(function(){
		
		var title = $("#title").val();
		var content = $("#content").val();
		if(title==""){
			alert("제목을 입력하세요");
			return false;
		}
		if(content==""){
			alert("내용을 입력하세요");
			return false;
		}
		if(!confirm("등록하시겠습니까??")){
			return false;
		}
		$("#replyForm").submit();
	});

});
</script>

<form action="QnA_WriteReply.do" method="post" id="replyForm">
<input type="hidden" name="qnaNo" id="qnaNo" value="${requestScope.qvo.qnaNo}">
<input type="hidden" name="groupNo" id="groupNo" value="${requestScope.qvo.groupNo}">
<input type="hidden" name="ref" value="${requestScope.qvo.ref }">
<input type="hidden" name="restep" value="${requestScope.qvo.restep }">
<input type="hidden" name="relevel" value="${requestScope.qvo.relevel }">
<input type="hidden" name="questionID" value="${requestScope.questionID}">
	<h2>질문글쓰기</h2>
	 <table class="table" >
		  <tbody>
			  <tr>
			  	<td>분류 :</td>
			  	<td>
			  		<c:forEach items="${requestScope.groupList}" var="i">
			  			<c:if test="${requestScope.qvo.groupNo == i.qnAGroupNo}">
			  				<input type="text" id="groupName" name="groupName" value="${i.qnAGroupName}" readonly>
			  			</c:if>
			  		</c:forEach>
					
				</td>
			  	<td>아이디</td>
			  	<td><input type="text" id="id" name="id" value="${sessionScope.mvo.id}" readonly></td>
			  	<td>포인트</td>
			  	<td ><input type="text" id="point" name="point" value="${requestScope.qvo.point }" readonly></td>
			  </tr>
			  <tr>
			  	<td>제목</td>
			  	<td colspan="5">
			  		<input type="text" id="title" name="title" size="99" value="RE:${requestScope.qvo.title}" >
			  	</td>
			  </tr>
			  <tr>
			  	<td colspan="6" align="left">
			   	&nbsp;&nbsp;
			  	<textarea cols="105" rows="10" id="content" name="content"></textarea>
			  	</td>
			  	<td><span id="pointView"></span></td>
			  </tr> 
			  <tr>
			  	<td colspan="6" align="center" >
				    <input type="button" onclick="submitContents(this);" value="답글쓰기" />
				    <input type="button" id="cancel" name="cancel" value="작성취소">
			  	</td>  
			  </tr>
		  </tbody>
	 </table>
</form>