<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html >
<meta charset="UTF-8">
<title>Reference View</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>

${requestScope.reference }
<hr>
${fn:length(requestScope.reference)}
<table border="1">
<caption>Reference</caption>
<tr >
<td width="100" rowspan="${fn:length(requestScope.reference)}">
${type }
</td>
<td width="400">
dd
</td>
<td>dd</td>
<td>ff</td>
</tr>
<tr><td>1</td><td>2</td><td>3</td></tr>
<tr><td>4</td><td>5</td><td>6</td></tr>
<%-- 
<c:forEach items="${requestScope.reference }" var ="refer" status="status">
<tr><td></td></tr>
</c:forEach>
 --%>
</table>
