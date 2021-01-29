<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>
<h1>ex03.jsp - 포워딩 된 이후 출력 페이지</h1>
<hr>
<form method="post">
	<select name="number">
		<option>1</option>
		<option>2</option>
		<option>3</option>
	</select>
	<input type="submit">
</form>
<img src="http://221.164.9.222/img/iu${param.number }.jpg" height="300px">
</body>
</html>