<%@page import="beans.Member2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
</head>
<body>
	<h1>quiz1 - 트와이스 멤버의 이름과 나이를 테이블의 형식으로 화면에 출력하세요</h1>
	<hr>
	<table>
		<thead>
			<tr>
				<td>이름</td>
				<td>나이</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=((List<Member2>)request.getAttribute("list")).get(0).getName()%></td>
				<td><%=((List<Member2>)request.getAttribute("list")).get(0).getAge()%></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
				<td>${list[1].name }</td>
				<td>${list[1].age }</td>
			</tr>
			<%
				for(int i = 2; i < 9; i++){
					pageContext.setAttribute("i", i);
			%>
			<tr>
				<td>${list[i].name }</td>
				<td>${list[i].age }</td>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>