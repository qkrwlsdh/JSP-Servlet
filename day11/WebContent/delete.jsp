<%@page import="phonebook.PhoneBookDAO"%>
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
<c:set var="dao" value="<%=new PhoneBookDAO() %>"/>
<c:set var="row" value="${dao.delete(param.idx) }"/>

<c:redirect url="/"/>
<%-- JSTL redirect 태그나 url 태그에서는 contextPath를 명시하지 않아도 된다 --%>
</body>
</html>