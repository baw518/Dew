<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${requestScope.exception }" var = "evo">
${evo.errorNo }

</c:forEach><br>
<c:forEach items="${requestScope.errorcode }" var="cvo">
${cvo.errorCode }<br>
</c:forEach>