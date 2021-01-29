<%@page import="day15.ImageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp : 파일을 업로드하고, 파일이름을 DB에 저장</title>
</head>
<body>

<h1>ex02-form.jsp</h1>
<hr>

<form method="POST" enctype="multipart/form-data" action="ex02-result.jsp">
	<p><input type="file" name="uploadFile" required></p>
	<p><input type="submit" value="등록"></p>
</form>

<c:set var="imageDAO" value="<%=ImageDAO.getInstance() %>" />
<c:set var="list" value="${imageDAO.selectAll() }" />
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<c:set var="uploadPath">/uploadFolder</c:set>

<div style="display: flex;
			flex-flow: row wrap;
			justify-content: flex-start;
			align-items: center;">
	<c:forEach var="dto" items="${list }">
		
		<div style="width: 250px; height: 200px; 
				    border: 2px solid black; padding: 15px;
				    margin: 10px; 
				    display: flex;
				    flex-flow: column;
				    justify-content: center;
				    align-items: center;">
			<a href="${cpath }/ex02-view.jsp?idx=${dto.idx}">
				<img src="${cpath}/${uploadPath }/${dto.storedFileName}" width="200px">
			</a>
				<p>${dto.originalFileName }</p>
		</div>
		
		
	</c:forEach>

</div>






</body>
</html>