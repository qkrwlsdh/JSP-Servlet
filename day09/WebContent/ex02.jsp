<%@page import="day09.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02 - DAO와 DTO를 활용하여 데이터베이스 내용 출력하기</title>
</head>
<body>

<h1>DAO와 DTO를 활용하여 데이터베이스 내용 출력하기</h1>
<hr>

<c:set var="dao" value="<%=new MemberDAO() %>" />
<c:set var="list" value="${dao.memberList }" />		<%--get***으로 작성하면 EL Tag에서 불러오기 가능 --%>
<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>주민등록번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>성별</th>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.idNumber }</td>
		<td>${dto.name }</td>
		<td>${dto.age }살</td>
		<td>${dto.gender }</td>
	</tr>
	</c:forEach>
</table>
<p>
	<a href="ex03.jsp"><button>추가</button></a>
</p>
</body>
</html>
