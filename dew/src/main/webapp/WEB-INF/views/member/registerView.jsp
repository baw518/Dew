<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="jquery-1.11.0.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 
 }
</script>
<title>Insert title here</title>
<!-- <script type="text/javascript" src="jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var checkResultId="";
		$("#regForm").submit(function(){			
			if($(":input[name=id]").val()==""){
				alert("아이디를 입력하세요");				
				return false;
			}
			if($(":input[name=password]").val()==""){
				alert("패스워드를 입력하세요");				
				return false;
			}
			if($(":input[name=name]").val()==""){
				alert("이름을 입력하세요");				
				return false;
			}
			if($(":input[name=address]").val()==""){
				alert("주소를 입력하세요");				
				return false;
			}	
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}		
		});
		$("#id").keyup(function(){
			var id=$("#id").val().trim();
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css(
						"background","pink");
				checkResultId="";
				return;
			}
			$.ajax({
				type:"POST",
				url:"member.do",
				data:"command=idcheckAjax&id="+id,
				success:function(data){					
					if(data.flag=="fail"){
					$("#idCheckView").html(id+" 사용불가!").css("background","red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!").css(
								"background","yellow");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//keyup
	});//ready
</script> -->
</head>
<body>
 
<form id="regForm" action="register.do" method="post">
<!-- private String id;
	private String memberName;
	private String memberPassword;
	private String birthDate;
	private String memberLevel;
	private int userType;
	private int score;
	private int point;
	private String passwordQuestion;
	private String passwordAnswer; -->
id <input type="text" name="id" id="id" ><br>
이름<input type="text" name="memberName" id="memberName"><br>
패스워드 <input type="password" id="memberPassword"name="memberPassword"><br>
생년월일<input type="text"id="birthDate" name="birthDate"><br>
질문<input type="text"id="passwordQuestion" name="passwordQuestion"><br>
질문에 대한 답변<input type="text"id="passwordAnswer" name="passwordAnswer"><br>

<c:forEach var="item" varStatus="i" begin="1" items="${requestScope.list}">
 <input type="radio" name="radio" value="${i}"> ${item.jobName} <br>

 

</c:forEach> 
<br><input type="submit" value="회원가입">
</form>

</body>
</html>











