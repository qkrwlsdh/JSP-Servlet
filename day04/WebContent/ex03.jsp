<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
<h1>ex03.jsp</h1>
<hr>
<%
	// 리다이렉트는 한번만 수행되어야 한다
//	response.sendRedirect("ex01.jsp");		// 클라이언트에게 ex01.jsp로 이동하라고 전달
//	response.sendRedirect("ex02Form.jsp");	// 다시 다른곳으로 이동하라고 전달(X)

	// sendRedirect 이후 서버에서 콘솔 출력은 가능하지만, response객체에 글자를 전달해도 의미없다
	System.out.println("server에서 메시지 출력");
	out.println("리다이렉트");
	
	PrintWriter myOut = response.getWriter();	// new PrintWriter(so.getOutputStream());
	myOut.println("response객체에서 가져온 out객체로 출력");
	
	// jsp내장객체 out은 response에게 문자열을 출력하는 객체이다
%>
<h2>HTML 메시지</h2>

</body>
</html>