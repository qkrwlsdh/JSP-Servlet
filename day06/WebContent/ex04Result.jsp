<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04Result.jsp</title>
</head>
<body>
<h1>ex04Result.jsp</h1>
<hr>
<%
	request.setCharacterEncoding("UTF-8");

	String comment = request.getParameter("comment");
	if(comment == null){
		response.sendRedirect("ex04-cookie.jsp");
	}
	else{	
	Cookie c = new Cookie("comment", comment.replace(" ", "_"));
//	Cookie c = new Cookie(String name, String value);

	c.setMaxAge(60 * 60 * 24 * 7);	// second 단위로 정수형으로 쿠키의 유효시간을 정한다
	
	response.addCookie(c);
	}
%>
<h2>입력값 : <%=comment %></h2>
<a href="ex04-cookie.jsp"><button>입력 페이지로</button></a>
</body>
</html>