<%@page import="day15.ImageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-view.jsp</title>
</head>
<body>
<%	request.setCharacterEncoding("UTF-8"); %>

<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<c:set var="uploadPath">/uploadFolder</c:set>
<c:set var="dao" value="<%=ImageDAO.getInstance() %>" />
<c:set var="dto" value="${dao.selectOne(param.idx) }" />

<h1>
	<a href="${cpath }/ex02-form.jsp"
	   style="text-decoration: none;
	   color: inherit;">ex02-view.jsp</a>
</h1>
<hr>
<h3>${dto.originalFileName }</h3>
<div style="text-align: center;">
	<a href="${cpath }/${uploadPath}/${dto.storedFileName}" target="_blank">
		<img src="${cpath }/${uploadPath}/${dto.storedFileName}" style="width: 80%;">
	</a>
</div>

<c:if test="${pageContext.request.method == 'POST'}">
	<c:set var="row" value="${dao.insertReply(dto.idx, param.writer, param.reply) }" />
	<c:redirect url="/ex02-view.jsp?idx=${dto.idx }" />
</c:if>
<blockquote>
	<form method="POST">
		<input type="text" name="writer" placeholder="작성자">
		<input type="text" name="reply" size="50" placeholder="내용을 입력하세요">
		<input type="submit" value="댓글 달기">
	</form>
</blockquote>

<div style="border: 1px solid black; padding: 20px;">
	<c:set var="replyList" value="${dao.selectReplyList(dto.idx) }" />
	<c:forEach var="reply" items="${replyList }">
		<p>
			<b>${reply.writer } : </b> 
			<span>${reply.reply }</span>
		</p>
	</c:forEach>
</div>

</body>
</html>




