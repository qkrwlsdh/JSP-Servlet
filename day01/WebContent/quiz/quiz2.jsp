<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2 구구단</title>
</head>
<body>
<%
	for(int i = 2; i < 10; i++){
		out.println(i + "단을 출력합니다<br>");
		
		for(int j = 1; j < 10; j++){
			out.println(i + "*" + j + "=" + i * j + "<br>");
		}
		out.println("<br>");
	}
%>
</body>
</html>