<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03Form.jsp</title>
</head>
<body>
<h1>ex03Form.jsp</h1>
<hr>
<form action="ex03Result.jsp">	<%-- 입력받은 파라미터를 ex03Result.jsp에게 전송하겠다 --%>

	<p><input type="text" name="name" placeholder="이름"></p>
	<p><input type="text" name="age" placeholder="나이"></p>
	<p><input type="submit" value="전송"></p>
	
</form>
</body>
</html>