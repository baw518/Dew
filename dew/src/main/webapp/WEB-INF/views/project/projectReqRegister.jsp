<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="js/jQuery.MultiFile.min.js"></script>
<title>projectRegister</title>
<script type="text/javascript">
	$(document).ready(function(){
		 $('#multiform input[name=picture]').MultiFile({
			 	max: 1, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
		        accept: 'jpg|png', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
		        maxfile: 1024, //각 파일 최대 업로드 크기
		        maxsize: 3024,  //전체 파일 최대 업로드 크기
		        STRING: { //Multi-lingual support : 메시지 수정 가능
		            denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
		            selected:'$file 을 선택했습니다.', 
		            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
		            toobig: "$file 은 크기가 매우 큽니다. (max $size)",
		            toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다."
		        },
		    });
	});
   function checkRegit(){
      if($("#projectName").val()==""){
         alert("제목을 입력하세요");
         return false;
      }else if($("#content").val()==""){
         alert("내용을 입력하세요");
         return false;
      }
   }
</script>
<link rel="stylesheet" href="css/project.css">
<link rel="stylesheet" href="css/dew.css">
<body>
<div class="main">
<h3 id="projectRegisterLogo"><font color=#FFCA9B>Project Request</font></h3>
<div id="registerProjectForm" >
<form id="multiform" action="project_reqRegister.do" method="post" class="regform" onsubmit="return checkRegit()" enctype="multipart/form-data" 
style="background-color: #FDF5DC;border-color: #FFD5B4">
<hr>
제목
<input type="text" name="projectName" id="projectName"><hr>
내용<textarea rows="10" cols="28" name="content" id="content"></textarea><hr>
<input type="file" name="picture" ><br>
<hr>
<input type="submit" value="등록" id="regProBtn" id="img">
</form>
</div>
</div>
</body>