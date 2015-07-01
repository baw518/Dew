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
	
	if(title==""){
		alert("제목을 입력하세요");
		return false;
	}
	if(sHTML==""){
		alert("내용을 입력하세요");
		return false;
	}
	if(!confirm("수정하시겠습니까??")){
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
	
	$("#groupNo").val("${requestScope.qvo.groupNo}");
	
	$("#cancel").click(function(){
		if(!confirm("수정을 취소하시겠습니까??")){
			return false;
		}	
		location.href="QnA_showContent.do?qnaNo=${requestScope.qvo.qnaNo}";
	});


});
</script>

<form action="QnA_Update.do" method="post" id="updateForm">
<input type="hidden" name="qnaNo" id="qnaNo" value="${requestScope.qvo.qnaNo }">
	<h2>질문글쓰기</h2>
	 <table class="dewTable" >
		  <thead>
			  <tr>
			  	<th>분류 :</th>
			  	<th>
					<select id="groupNo" name="groupNo"> 
						<c:forEach items="${requestScope.groupList}" var="i">
							<option value="${i.qnAGroupNo}">${i.qnAGroupName }</option>
						</c:forEach>
					</select>
				</th>
			  	<th>아이디</th>
			  	<th><input type="text" id="id" name="id" value="${requestScope.qvo.id}" readonly></th>
			  	<th>포인트</th>
			  	<th ><input type="text" id="point" name="point" value="${requestScope.qvo.point }" readonly></th>
			  </tr>
			  <tr>
				<th>제목</th>
			  	<th colspan="4">
			  		<input type="text" id="title" name="title"  size="40" value="${requestScope.qvo.title}" >
			  	</th>
			  	<th></th>
			  </tr>
			  <tr>
			  	<th colspan="6" align="left">
			   	&nbsp;&nbsp;
			  	<textarea cols="111" rows="10" id="content" name="content"></textarea>
			  	</th>
			  </tr> 
			  <tr>
			  	<th colspan="6" align="center"  style="border-bottom-color: #ffffff">
				    <input type="button" onclick="submitContents(this);" value="수정">
				    <input type="button" id="cancel" name="cancel" value="작성취소">
			  	</th>  
			  </tr>
		  </thead>
	 </table>
</form>