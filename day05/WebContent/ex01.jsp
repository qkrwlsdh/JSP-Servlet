<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp - Expression Language</title>
</head>
<body>
<h1>ex01.jsp - EL</h1>
<hr>
<ul>
	<li>JSP문법의 Expression - <span style="color: orange; font-weight: bold;">&lt;%= %></span></li>
	<li>표현식은 내장객체의 attribute에 자동으로 접근하는 기능이 없다</li>
	<li>((Member)session.getAttribute("login")).getUsername() 과 같이 복잡하게 사용</li>
	<li>이런 단점을 해소하기 위해 등장한 문법이 Expression Language, EL Tag</li>
	<li>파라미터에도 손쉽게 접근이 가능하다</li>
	<li>param.userid</li>
	<li>null값은 출력하지 않는다</li>
	<%
		String login = null;
		pageContext.setAttribute("login", login);
	%>
	<li>표현식 : <%=login %></li>
	<li>표현언어 : ${login }</li>
	<li>표현언어는 JSP 기본 스펙이므로, JSP 구동 가능한 환경 어디서나 바로 사용 가능</li>
	<li>EL Tag의 최소 스펙은 java 1.5, tomcat 6, servlet 2.5</li>
</ul>
</body>
</html>