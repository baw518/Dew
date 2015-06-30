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
	if(point==""){
		alert("포인트를 입력하세요");
		return false;
	}
	if(isNaN(point)){
		alert("포인트는 숫자만 입력하세요");
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

	
	$("#point").keyup(function(){
		var point = $("#point").val();
		var sessionPoint = ${sessionScope.mvo.point}
		if(point==""){
			$("#pointView").html("<font color='red'>포인트를 입력하세요.</font>");
			return false;
		}
		if(isNaN(point)){
			$("#pointView").html("<font color='red'>포인트는 숫자만 가능합니다.</font>");
			return false;
		}
		if(point>sessionPoint){
			$("#pointView").html("<font color='red'>현재 가지고있는 포인트보다 더 많은 포인트를 적용 할 수 없습니다.</font>");
			return false;
		}
		if(point<=sessionPoint){
			var resultPoint = sessionPoint-point;
			$("#pointView").html("<font color='blue'>사용가능</font><br>"+
										"<font color='orange'>글등록 후 잔액 :"+resultPoint+" </font>");
			return false;
		}
		
	});
});
</script>
<link rel="stylesheet" href="${initParam.root}/css/dew.css" type="text/css">
<div class="main">
<br><br>
<form action="QnA_Write.do" method="post" id="writeForm">
	<h1 align="center">질문글쓰기</h1>
	 <table class="dewTable">
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
		  	<th><input type="text" id="id" name="id" value="${sessionScope.mvo.id}" readonly></th>
		  	<th>포인트</th>
		  	<th ><input type="text" id="point" name="point" ></th>
		  </tr>
		  <tr>
		  	<th>제목</th>
		  	<th colspan="4">
		  		<input type="text" id="title" name="title" size="40">
		  	</th>
			<th><div id="pointView">사용가능한 포인트 : ${sessionScope.mvo.point}</div></th>
		  </tr>
		  <tr>
		  	<th colspan="6" align="left">
		   	&nbsp;&nbsp;
		  	<textarea cols="111" rows="10" id="content" name="content"></textarea>
		  	</th>	
		  </tr> 
		  <tr>
		  	<td colspan="6" align="center"  style="border-bottom-color: #ffffff">
		  		<input type="button" onclick="submitContents(this);" value="글쓰기" />
			    <input type="button" id="cancel" value="작성취소">
		  	</td>  
		  </tr>
		  </thead>
	 </table>
</form>

</div>