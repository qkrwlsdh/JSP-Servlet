<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// quiz2에서 넘어온 파라미터를 처리하고나서
	request.setCharacterEncoding("UTF-8");

	String theme = request.getParameter("theme");
	System.out.println("theme" + theme);
	
	// 쿠키를 만들어서 클라이언트에게 보내면 된다
	Cookie cookie = new Cookie("theme", theme);
	cookie.setMaxAge(60*60*24*30*12);
	response.addCookie(cookie);
	
	response.sendRedirect("quiz2.jsp");
%>
</body>
</html>