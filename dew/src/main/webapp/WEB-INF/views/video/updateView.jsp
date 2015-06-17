<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jQuery import -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery Form Plugin import -->
<script src="js/jquery.form.min.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="js/jQuery.MultiFile.min.js"></script>

<script>
$(document).ready(function(){
	$("#updateForm").submit(function(){
		if(!confirm("수정하시겠습니까?")) {
			return false;
		}
	});
	$("#updateform").submit(function() {
		if($("#title").val()=="") {
			alert("제목을 입력해주세요!");
			return false;
		}
		if($("#content").val()=="") {
			alert("내용을 입력해주세요!");
			return false;
		}
		if($("#afile3-list").text() == "") {
			alert("파일을 올려주세요!");
			return false;
		}'
	});
	
    //use jQuery MultiFile Plugin 
   $('#updateform input[name=file]').MultiFile({
        max: 10, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
        accept: 'avi|mkv|mp4|mpeg|wmv|swf', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
        maxfile: 1024*1024*1024, //각 파일 최대 업로드 크기
        maxsize: 1024*1024*1024*10,  //전체 파일 최대 업로드 크기
        STRING: { //Multi-lingual support : 메시지 수정 가능
            remove : "해당 파일 제거->", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
            duplicate : "$file 은 이미 선택된 파일입니다.", 
            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
            selected:'$file 을 선택했습니다.', 
            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
        },
        list:"#afile3-list" //파일목록을 출력할 요소 지정가능
    });  
});
</script>


<form name="updateform" id="updateform" action="video_update.do"
                                      method="POST"  enctype="multipart/form-data" ><!-- enctype="multipart/form-data" -->  
    <table class="table" align="center" >
    <tr><td>제목: <input type="text" id="title" name="title" value ="${requestScope.vvo.title }"></input></td></tr>
    <tr><td>내용: <textarea rows = "30" cols ="70" id="content" name="content" >${requestScope.vvo.content }</textarea></td></tr>
    
    <!-- 다중 파일업로드  -->
  <tr><td>동영상 <input type="file" class="afile3"  name="file" /></td></tr>
    <tr><td id="afile3-list" id="afile3-list" style="border:2px solid #c9c9c9;min-height:50px"></td></tr>
   
   <tr><td> 
   <input type="hidden" id="videoNo" name="videoNo"  value = "${requestScope.vvo.videoNo }"></input>
  <!--  <input type="hidden" id="videoPath" name="videoPath" value = "temp" ></input> -->
    <input type="hidden" id="id" name="id"  value ="${sessionScope.mvo.id }">
   <input type="submit" id="write" value="글쓰기"/></td></tr>
	</table>
</form>    

<div id="result"></div>
