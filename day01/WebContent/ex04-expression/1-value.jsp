<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1-value.jsp</title>
</head>
<body>
<%	// scriptlet
	out.print("Hello, Scriptlet !!<br>");

	String name = "이지은";
	int age = 29;
	out.print("<h3>" + name + "님의 나이는 " + age + "살입니다 !!</h3>");
	// out.print()는 함수호출이므로, 반드시 세미콜론을 붙여야 한다
%>

<%=	"Hello, expression !!" %><br>
<h3><%=name %>님의 나이는 <%=age %>살입니다 !!</h3>
<!-- 표현식은 그 자체가 함수호출의 형식을 포함하므로, 값만 넣어주고 세미콜론은 쓰지 않는다 -->

<h3><%=name + "님의 나이는 " + age + "살입니다 !!" %></h3>

</body>
</html>