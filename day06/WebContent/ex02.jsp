<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02 - directive</title>
</head>
<body>
<h1>ex02 - include (directive)</h1>
<hr>
<%@include file="header.jsp" %>
<%-- directive의 include는 지역을 공유하기 때문에 String test가 안됨 --%>
<%
	String test = "ex02";
%>
<h2>test : <%=test %></h2>
</body>
</html>