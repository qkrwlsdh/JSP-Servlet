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
<form action="ex05Result.jsp">
	<p>다음 중 선호하는 색상을 선택하세요 (중복 선택 가능)</p>
	<label><input name="color" type="checkbox" value="red">빨강</label>
	<label><input name="color" type="checkbox" value="green">초록</label>
	<label><input name="color" type="checkbox" value="blue">파랑</label>
	<p><input type="submit"></p>
</form>
</body>
</html>