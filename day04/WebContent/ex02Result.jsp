<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02Result.jsp</title>
</head>
<body>
<h1>ex02Result.jsp</h1>
<hr>
<%
	String method = request.getParameter("method");
	String param = request.getParameter("param");
	String msg = request.getParameter("msg");
	
	switch(method){
	case "sendError":
		response.sendError(Integer.parseInt(param), msg);
		break;
	case "sendRedirect":
		response.sendRedirect(param);
		break;
	}
%>
</body>
</html>