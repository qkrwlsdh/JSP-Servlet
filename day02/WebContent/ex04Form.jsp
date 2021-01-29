<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04Form.jsp</title>
</head>
<body>
<%-- 사용자에게 정수를 입력받아서, 그 정수를 거꾸로 출력하는 페이지를 작성하세요
		입력페이지에서 ex04Result.jsp로 데이터를 넘겨서 처리하면 됩니다
		
		입력 데이터는 숫자만 받게끔 처리하고, (type="number")
		값을 입력하지 않으면 진행하지 않도록 하세요 (required)
		결과 페이지에서는 입력받은 숫자와 거꾸로 변환한 숫자를 같이 출력해야 합니다 --%>
		
	<h1>ex04Form.jsp</h1>
	<hr>
	<form action="ex04Result.jsp">
		<p><input type="number" name="number" placeholder="숫자를 입력하세요"></p>
		<p><input type="submit" value="전송"></p>
	</form>
	
</body>
</html>