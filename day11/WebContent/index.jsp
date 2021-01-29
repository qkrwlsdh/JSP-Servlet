<%@page import="java.util.ArrayList"%>
<%@page import="phonebook.PhoneBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화번호부 전체목록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<h1><a href="${cpath }">전화번호부</a></h1>
<hr>

<%-- dao를 생성하고, 필요한 리스트를 받아온다 (파라미터가 없으면 전체목록, 파라미터가 있으면 검색결과목록 --%>
	<c:set var="dao" value="<%=new PhoneBookDAO() %>" />
	
	<c:if test="${empty param.type && empty param.filter }">
		<c:set var="list" value="${dao.selectAll() }"/>
	</c:if>
	
	<c:if test="${not empty param.filter }">
		<c:set var="list" value="${dao.selectFilterList(param.filter) }"/>
	</c:if>
	
	<c:if test="${not empty param.type }">
		<c:set var="list" value="${dao.selectList(param.type, param.word) }"/>
	</c:if>
	
<%-- 사용자가 검색어를 입력할 수 있도록 제공하는 폼 --%>
<form action="">
	<p>
	<select name="type">
		<option value="name" ${param.type == 'name' ? 'selected' : '' }>이름으로 검색</option>
		<option value="pnum" ${param.type == 'pnum' ? 'selected' : '' }>전화번호로 검색</option>
	</select>
	<input name="word" value="${param.word }">
	<input type="submit" value="검색">
	</p>
</form>

<%-- 테스트 --%>
<c:set var="token" value="가,나,다,라,마,바,사,아,자,차,카,타,파,하"/>
<c:set var="filterList" value="<%=new ArrayList<String>() %>"/>
<p>
<c:forEach var="filter" items="${dao.filterList }" varStatus="st">
	<c:if test="${st.last == false }">
		<a href="${cpath }/?filter=${filter}">
			[${filter }]
		</a>
	</c:if>
</c:forEach>
</p>
<%-- 받아온 결과 목록을 화면에 출력하는 테이블 --%>
<table border="1" cellpadding="10" cellspacing="0">
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
<br><br>
<fieldset>
	<ul>
		<li>GET방식으로 파라미터를 받는다면, 파라미터가 null인지 체크</li>
		<li>POST방식으로 파라미터를 받는다면, request.getMethod()를 체크</li>
	</ul>
</fieldset>
</body>
</html>