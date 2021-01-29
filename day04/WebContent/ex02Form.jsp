<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02Form.jsp</title>
</head>
<body>
<form action="ex02Result.jsp">
	<p><label><input type="radio" name="method" value="sendError">sendError()</label>
	<p><label><input type="radio" name="method" value="sendRedirect">sendRedirect()</label>
	<p><input type="text" name="param" placeholder="error 숫자 코드 혹은 이동할 url"></p>
	<p><input type="text" name="msg"></p>
	<p><input type="submit"></p>
</form>
</body>
</html>