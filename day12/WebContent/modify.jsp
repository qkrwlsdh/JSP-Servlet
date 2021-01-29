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
<h1><a href="${cpath }">게시판</a></h1>
<hr>
<c:set var="dao" value="<%=BoardDAO.getInstance() %>" scope="session" />
<c:if test="${pageContext.request.method == 'GET' }">
	<c:set var="dto" value="${dao.selectOne(param.idx) }"/>
	<form method="post">
		<table style="text-align: center; border: 1px solid black">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 수정 양식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" placeholder="글 제목" name="title" maxlength="50"
					 value="${dto.title }"></td>
				</tr>
				<tr>
					<td><textarea placeholder="글 내용" name="context" maxlength="2048" style="height: 350px;">
					${dto.context }</textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="글수정">
	</form>
</c:if>
<c:if test="${pageContext.request.method == 'POST' }">
	<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="modifytext" class="board1.BoardDTO" />
	<jsp:setProperty property="*" name="modifytext" />
	<c:set var="row" value="${dao.update(modifytext) }" />
	<c:redirect url="/" />
</c:if>
</body>
</html>