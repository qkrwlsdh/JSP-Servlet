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
	session.invalidate();	// 현재 사용중인 세션을 서버에서 제거하는 메서드
							// 다음 번에 클라이언트가 방문하면 사용하던 세션이 없으므로
							// 새로운 세션을 생성하여 클라이언트에게 전달하게 된다
							// 기존의 세션은 사용할 수 없다
	
	response.sendRedirect("ex01.jsp");
%>
</body>
</html>