<%@page import="phonebook.PhoneBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="header.jsp" %>
</head>
<body>
<h1><a href="${cpath }">전화번호부</a></h1>
<hr>
<c:set var="dao" value="<%=new PhoneBookDAO() %>"/>
<c:if test="${pageContext.request.method == 'GET' }">
	<c:set var="dto" value="${dao.selectOne(param.idx)	 }"/>
	<form method="post">
		<ul>
			<li>이름 : <input name="name" value="${dto.name }"></li>
			<li>전화번호 : <input name="pnum" value="${dto.pnum }"></li>
		</ul>
		<div>
			<input type="submit" value="수정하기">
		</div>
	</form>
</c:if>
<c:if test="${pageContext.request.method == 'POST' }">
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="dto" class="phonebook.PhoneBookDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="dao" value="<%=new PhoneBookDAO() %>"/>
	<c:set var="row" value="${dao.update(dto) }"/>
	<c:redirect url="/view.jsp?idx=${param.idx }"/> 
</c:if>
</body>
</html>