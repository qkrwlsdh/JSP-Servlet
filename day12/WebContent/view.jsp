<%@page import="board1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 보기</title>
<%@ include file="header.jsp" %>
<c:if test="${not empty param.c and param.c eq 'plus' }">
	<c:set var="row" value="${dao.updateViewCount(param.idx) }"/>
	<c:redirect url="/view.jsp?idx=${param.idx }&page=${param.page }"/>
</c:if>
<c:set var="dto" value="${dao.selectOne(param.idx)	 }"/>
</head>
<body>

<c:set var="dao" value="<%=BoardDAO.getInstance() %>"/>
<c:set var="row" value="${dao.updateViewCount(param.idx) }"/>
<h1><a href="${cpath }">게시판</a></h1>
<hr>
<table border="1" cellpadding="10" cellspacing="0">
<tr>
	<td>작성자 : ${dto.writer }</td>
	<td>제목 : ${dto.title }</td>
	<td>조회수 : ${dto.viewCount }</td>
	<td>IP주소 : ${dto.ipaddr }</td>
</tr>
<tr>
	<td colspan="4" align="center">내용 : ${dto.context }</td>
</tr>
<div>
	<a href="${cpath }/modify.jsp?idx=${dto.idx}"><button>수정</button></a>
	<a href="${cpath }/delete.jsp?idx=${dto.idx}"><button>삭제</button></a>
</div>
</table>

<script type="text/javascript">
	
</script>
</body>
</html>