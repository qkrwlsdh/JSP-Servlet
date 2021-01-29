<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05Form.jsp</title>
</head>
<body>
<h1>ex05Form.jsp</h1>
<hr>
<form action="ex05Result.jsp" method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input type="submit" value="로그인"></p>
</form>
<a href="ex05Result.jsp?userid=itbank&userpw=it">결과 페이지 링크 (GET)</a>
</body>
</html>