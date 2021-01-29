<%@page import="beans.PhoneBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화번호부 목록 출력</title>
<%@ include file="header.jsp" %>
</head>
<body>
<h1><a href="${cpath }">전화번호부</a></h1>
<hr>
<c:set var="dao" value="<%=new PhoneBookDAO() %>"/>	<%-- 변수 dao 설정 ${dao }로 사용할수있음 --%>

<c:if test="${empty param.type && empty param.filter }"><%-- 파라미터의 타입과 필터가 모두 비었다면 --%>
	<c:set var="list" value="${dao.selectAll() }"/><%-- dao의 전체목록함수를 변수 list로 생성 --%>
</c:if>

<c:if test="${not empty param.filter }"><%-- 파라미터의 필터에 값이 있다면 --%>
	<c:set var="list" value="${dao.selectFilterList(param.filter) }"/><%-- dao의 이름에따라출력하는함수를 변수 list로 생성 --%>
</c:if>

<c:if test="${not empty param.type }"><%-- 파라미터의 타입에 값이 있다면 --%>
	<c:set var="list" value="${dao.selectList(param.type, param.word) }"/><%-- dao의 검색함수를 변수 list 생성 --%>
</c:if>

<form>
	<p>
		<select name="type">
			<option value="name" ${param.type == 'name' ? 'selected' : '' }>이름으로 검색</option>
			<option value="pnum" ${param.type == 'pnum' ? 'selected' : '' }>전화번호로 검색</option>
		</select>
		<input name="word" value="${param.word }">
		<input type="submit" value="검색">
	</p>
</form>

<table border="1">
	<tr>
		<th>이름</th><th>전화번호</th>
	</tr>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td><a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.name }</a></td>
			<td><a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.pnum }</a></td>
		</tr>
	</c:forEach>
</table>
<p>
	<a href="${cpath }/insert.jsp"><button>추가</button></a>
</p>
</body>
</html>