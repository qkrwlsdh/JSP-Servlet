<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="header.jsp" %>
</head>
<body>
<c:set var="dao" value="<%=BoardDAO.getInstance() %>" scope="session"/>
<c:set var="row" value="${dao.delete(param.idx) }"/>

<c:redirect url="/"/>
</body>
</html>