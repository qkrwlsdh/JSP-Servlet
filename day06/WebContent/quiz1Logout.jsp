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
	session.invalidate();	// 세션 지우고
	response.sendRedirect(request.getContextPath() + "/quiz1Form.jsp");	// 입력 페이지로 돌아가자
	// request.getContextPath() 는 자꾸 보여줘야지 익숙해지겠지...?
%>
</body>
</html>