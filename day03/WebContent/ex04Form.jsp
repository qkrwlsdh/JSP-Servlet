<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04Form.jsp</title>
</head>
<body>
<h1>ex04Form.jsp</h1>
<hr>
<form action="ex04Result.jsp" method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input type="submit" value="로그인"></p>
</form>
<a href="ex04Result.jsp?userid=itbank&userpw=it">결과 페이지 링크 (GET)</a>
</body>
</html>