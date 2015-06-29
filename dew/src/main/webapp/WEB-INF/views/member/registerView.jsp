<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script src="//code.jquery.com/jquery-1.10.2.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function(){
		$(".loginBtn").submit(function(){
			if($(":input[name=id]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}
			else if($(":input[name=memberPassword]").val()==""){
				alert("비밀번호를 입력하세요!");
				return false;
			}
			else if($(":input[name=birthDate]").val()==""){
				alert("생년월일를 입력하세요!");
				return false;
			}
			else if($(":input[name=passwordQuestion]").val()==""){
				alert("질문을 입력하세요!");
				return false;
			}
			else if($(":input[name=passwordAnswer]").val()==""){
				alert("질문에 대한 답을 입력하세요!");
				return false;
			}else{
				if($(":input[name=birthDate]").length==8){
					alert("제대로된 생년월일 8글자 입력해주세요");
					return false;
				}
			}		
		});
		});
</script>
<link rel="stylesheet" href="${initParam.root }css/dew.css">
<div class="main">
<form:form action="member_register.do" method="post" role="form" commandName="memberVO" class="form-horizontal" enctype="multipart/form-data">
              <div class="form-group">
                <div class="col-sm-2" style="margin-bottom: 10px">
                  <label class="control-label">File</label>
                </div>
                <div class="col-sm-10" style="margin-bottom: 10px">
                  <input type="file" name="image" accept="image/jpeg">
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label" >Name</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" placeholder="Name" name="memberName" id="memberName">
                   <font color="red"><form:errors path="memberName"></form:errors></font>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">ID</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" placeholder="ID" name="id" id="id" >
                  <font color="red"><form:errors path="id"></form:errors></font>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label for="inputPassword3" class="control-label">Password</label>
                </div>
                <div class="col-sm-10">
                  <input type="password" class="form-control" id="inputPassword3" placeholder="Password" id="memberPassword"name="memberPassword">
               	  <font color="red"><form:errors path="memberPassword"></form:errors></font>
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">BirthDay</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" placeholder="YYYYMMDD" id="birthDate" name="birthDate">
                   <font color="red"><form:errors path="birthDate"></form:errors></font>
                </div>
              </div>
              <%-- <div class="form-group">
                <div class="col-sm-2" style="margin-bottom: 10px">
                  <label class="control-label">Jobs</label>
                </div>
                <div class="col-sm-10" style="margin-bottom: 10px">
                  <div class="radio" >
                  	<c:forEach var="item" varStatus="i" items="${requestScope.list}">
                  	   <label class="radio-inline">
                      <input type="radio"  id="jobNo" name="jobNo" value="${item.jobNo}" >${item.jobName}</label>
                  	</c:forEach> 
                  </div>
                </div>
              </div> --%>
                <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">P.Q</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" placeholder="password search Question" id="passwordQuestion" name="passwordQuestion">
                   <font color="red"><form:errors path="passwordQuestion"></form:errors></font>
                </div>
              </div>
                <div class="form-group">
                <div class="col-sm-2">
                  <label class="control-label">P.A</label>
                </div>
                <div class="col-sm-10">
                  <input type="text" class="form-control" placeholder="password search Answer"  id="passwordAnswer" name="passwordAnswer">
                   <font color="red"><form:errors path="passwordAnswer"></form:errors></font>
                </div>
              </div>
    			<br>
                <div class="col-sm-offset-2 col-sm-10" align="center">
                  <button type="submit" class="btn btn-default">Sign in</button>
                </div>
            
   </form:form>
</div>