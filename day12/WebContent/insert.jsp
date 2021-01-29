<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 추가하기</title>
</head>
<body>


<h1><a href="index.jsp">게시글 추가</a></h1>
<hr>
<%
	String ipaddr = request.getRemoteAddr();
	pageContext.setAttribute("ipaddr", ipaddr);
	// out.print(ipaddr);
%>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		제목 : <input type="text" name="title" placeholder="제목"><br>
		작성자 : <input type="text" name="writer" placeholder="작성자">
		<p><textarea name="context" cols="40" rows="10" placeholder="작성할 글"></textarea></p>
		<input type="hidden" name="ipaddr" value="${ipaddr }">
 		<button>추가하기</button>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="newtext" class="board1.BoardDTO" />
	<jsp:setProperty property="*" name="newtext" />
	<c:set var="row" value="${dao.insert(newtext) }" />
	<c:redirect url="/" />
</c:if>


</body>
</html>