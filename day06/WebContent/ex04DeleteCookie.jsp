<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04DeleteCookie.jsp</title>
</head>
<body>
<h1>ex04DeleteCookie.jsp - 쿠키 삭제</h1>
<hr>
<%
	Cookie c = new Cookie("comment", "아무값이나상관없음");		// 이름이 같으면 덮어씌움
	c.setMaxAge(0);			// 쿠키의 유효시간을 0으로 설정하면, 브라우저 도착한 후 폐기됨
	response.addCookie(c);
	response.sendRedirect("ex04-cookie.jsp");
%>
</body>
</html>