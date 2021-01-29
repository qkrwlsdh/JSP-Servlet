<%@page import="day10.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-delete.jsp</title>
</head>
<body>

<c:set var="dao" value="<%=new MemberDAO() %>" />
<c:set var="row" value="${dao.delete(param.idNumber) }" />	<%--삭제된 줄 수 (0 or 1) --%>
<c:if test="${row == 1 }">
	<c:redirect url="/" />
</c:if>
<c:if test="${row == 0 }">
	<c:redirect url="${header.referer }" />	<%--현재 페이지에 오기 위해서 어디를 통해서 왔는가? --%>
</c:if>

</body>
</html>