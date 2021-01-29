<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<%
	request.getRequestDispatcher("login/main.jsp").forward(request, response);
%>
여기 작성하는 내용은 화면에 표시되지 않습니다
</body>
</html>