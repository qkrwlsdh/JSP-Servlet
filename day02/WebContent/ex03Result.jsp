<%@page import="org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03Result.jsp</title>
</head>
<body>
	<h1>ex03Result.jsp</h1>
	<hr>
	<%
		// scriptlet : 제어문, 연산, 대입, 함수 호출
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		// 나이가 20살 이상이면 성인이라고 출력하기
		int adult;
		String msg;
		try{
			adult = Integer.parseInt(age);
			msg = adult > 19 ? "성인" : "미성년자";
		} catch(NumberFormatException e){
			adult = 0;
			msg = "나이를 잘못 입력했습니다";
		}
	%>
	<%-- expression은 값을 출력하는 영역 (out.print()) --%>
	<p><%=name != null ? "이름 : " + name : "" %></p>
	<p><%=age != null ? "나이 : " + age + "세" : "" %></p>
	<p><%=msg %></p>
	<p><%=request.getQueryString() %></p>
	<a href="https://www.w3schools.com/tags/ref_urlencode.ASP">URL Encoding</a>
</body>
</html>