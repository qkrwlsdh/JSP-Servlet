<%@page import="beans.NaverJoin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1Result.jsp</title>
</head>
<body>
<%--
	quiz1Form.jsp에서 대응되는 quiz1Result.jsp파일을 완성하세요
	
		- form에서 전달하는 요소의 name을 멤버필드로 가지는 클래스 NaverJoin.java를 작성하세요
		- 전달방식은 post로 처리하세요
		- 출력 결과는 table에 속성 이름과 값을 각각 출력하세요
		- <jsp:useBean>, <jsp:setProperty> 태그를 활용하세요
--%>
<%!ArrayList<NaverJoin> list = new ArrayList<NaverJoin>();%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="join" class="beans.NaverJoin"/>
<jsp:setProperty property="*" name="join"/>
<%
	list.add(join);
%>
<h1><%=list %></h1>

<table border="1" cellpadding="10" cellspacing="0" align="center">
	<tr><td>userid</td><td><%=join.getUserid() %></td></tr>
	<tr><td>userpw</td><td><%=join.getUserpw() %></td></tr>
	<tr><td>userpw2</td><td><%=join.getUserpw2() %></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
	<tr><td></td><td></td></tr>
</table>
</body>
</html>