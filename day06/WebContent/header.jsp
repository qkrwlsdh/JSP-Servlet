<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
</head>
<body>
<h1>테스트용 header</h1>
<hr>
<%
	// 스크립틀릿 지역 변수 선언
	String test = "header";
%>
<h2>test : <%=test %></h2>

<p>이름 : ${param.name }</p>
<p>나이 : ${param.age }</p>
</body>
</html>