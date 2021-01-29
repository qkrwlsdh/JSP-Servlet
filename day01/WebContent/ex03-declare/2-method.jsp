<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2-method.jsp</title>
</head>
<body>
<%!
	// declaration : 함수를 정의할 수 있다
	public int add(int n1, int n2) {
		return n1 + n2;
	}
	int field = add(10, 20);
%>
<%
	// scriptlet : 함수를 호출할 수 있으며, 정의할 수 없다
	int n1 = 10;
	int n2 = 20;
	int ret1 = n1 + n2;
	
	int n3 = 30;
	int n4 = 40;
	int ret2 = add(n3, n4);
	
	out.print(n1 + " + " + n2 + " = " + ret1 + "<br>");
	out.print(n3 + " + " + n4 + " = " + ret2 + "<br>");
	out.print(field + "<br>");
%>

</body>
</html>