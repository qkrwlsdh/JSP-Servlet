<%@page import="board1.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="dao" value="<%=BoardDAO.getInstance() %>" scope="session"/>

<c:set var="page" value="${empty param.page ? 1 : param.page }" /> 
<c:set var="map" value="${dao.selectAll(page) }" />	<%-- pageCount와 list가 함께 들어있다 --%>
<c:set var="list" value="${map.list }"/>
<c:set var="pageCount" value="${map.pageCount }"/>	<%-- map.get("pageCount") --%>

<%-- pageCount : ${pageCount } --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%@ include file="header.jsp" %>
<c:set var="row" value="${dao.updateViewCount(param.idx) }"/>
<h1><a href="${cpath }">게시판</a></h1>
<hr>
<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성날짜</th>
		<th>조회수</th>
		<th>IP Address</th>
	</tr>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td><a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.title }</a></td>
			<td>${dto.writer }</td>
			<td>${dto.creationDate }</td>
			<td>${dto.viewCount }</td>
			<td>${dto.ipaddr }</td>
		</tr>
	</c:forEach>
</table>
	<div class="paging">
	<c:forEach begin="${map.begin }" end="${map.end }" var="i">
	
		
		<a href="${cpath }/?page=${i}">
		${i == param.page ? '<strong>' : '' }
			[${i }]
		${i == param.page ? '</strong>' : '' }
		</a>
	</c:forEach>
	</div>
<p>
	<a href="${cpath }/insert.jsp?idx=${dto.idx}"><button>추가</button></a>
</p>
</body>
</html>