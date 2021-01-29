<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04Result.jsp</title>
</head>
<body>
<h1>ex04Result.jsp</h1>
<hr>
<%!
	public int rev(int num){
		int result = 0;
		while(num > 0){
			result *= 10;
			result += num % 10;
			num /= 10;
		}
		return result;
}
%>
<%
	String number = request.getParameter("number");
	int num = Integer.parseInt(number);
%>

<p><%=rev(num) %></p>
</body>
</html>