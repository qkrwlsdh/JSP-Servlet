<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="beans.Member2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1start.jsp</title>
</head>
<body>
<%
	Member2 [] twice = {
	new Member2("나연", 27),
	new Member2("사나", 26),
	new Member2("다현", 24),
	new Member2("정연", 26),
	new Member2("지효", 25),
	new Member2("채영", 23),
	new Member2("모모", 26),
	new Member2("미나", 25),
	new Member2("쯔위", 23)
	};

	List<Member2> list = Arrays.asList(twice);
	
	request.setAttribute("list", list);
	
	RequestDispatcher rd = request.getRequestDispatcher("quiz1.jsp");
	rd.forward(request, response);
%>
</body>
</html>