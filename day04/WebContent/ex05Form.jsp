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
	<p><input name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="Password"></p>
	<p><button>전송</button></p>
	<%-- button 태그가 form 내부에 있으면 submit의 역할을 수행한다 --%>
	<%-- input type="button"은 form 내부에 있어도 submit의 역할을 수행하지 않는다 --%>
</form>
</body>
</html>