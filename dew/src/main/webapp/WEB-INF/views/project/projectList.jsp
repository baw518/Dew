<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="${initParam.root}css/dew.css" type="text/css">
<body>


<div class="main" align="center" style="margin-top: 50px">
<table class="dewTable">
<thead>
<tr>
<th scope="cols">NO</th>
<th scope="cols">상태</th>
<th scope="cols">프로젝트명</th>
<th scope="cols">작성자</th>
<th scope="cols">포인트</th>
<th scope="cols">모집기간</th>
<th scope="cols">작성일</th>
<th scope="cols">hit</th>
</tr>
</thead>
<tbody>
<c:forEach var="plist" items="${requestScope.plvo.list}">
<tr>
<td>${plist.projectNo}</td>
<td>${plist.achieve}</td>
<td><a href="project_View.do?projectNo=${plist.projectNo}" class="hover_font">${plist.projectName} [${fn:length(plist.commentVO)}]</a></td>
<td height="30px"><img src="${initParam.root }upload/img/${plist.id}.jpg" width="30px"> ${plist.id}</td>
<c:choose><c:when test="${plist.achieve!='의뢰'}">
<td>${plist.point}<b>p</b></td>
<td class="deadlinelist">${plist.deadline}</td></c:when><c:otherwise><td></td><td></td></c:otherwise></c:choose>
<td>${plist.project_date}</td>
<td>${plist.hit}</td>
</tr>
</c:forEach>
</tbody>
</table>
<p class="page" align="center">
<c:set var="pb" value="${requestScope.plvo.pagingBean}"></c:set>
<c:if test="${pb.previousPageGroup}">
	<a href="project_listView.do?pageNo=${pb.startPageOfPageGroup-1}">
	<img src="${initParam.root}images/left.jpg" width="21" height="21"> </a>	
	</c:if>
<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<a href="project_listView.do?pageNo=${i}">${i}</a> 
	</c:when>
	<c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">
	<a href="project_listView.do?pageNo=${pb.endPageOfPageGroup+1}">
	<img src="${initParam.root}images/right.jpg" width="21" height="21"></a>
	</c:if>
	</p>
</div>

</body>
</html>