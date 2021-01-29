<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h1>JSTL</h1>
<hr>
<div>
	<form action="">
		<select name="select">
			<c:forEach var="i" begin="1" end="7">
			<%-- select 안에서 forEach로 변수i를 1부터 7까지 반복문 --%>
				<c:set var="fileName" value="ex0${i }.jsp"/>
				<%-- 변수를 선언하고, 값을 세팅 --%>
				<option ${param.select == fileName ? 'selected' : ''}>
				<%-- select의 option을 생성 - EL Tag로 select와 fileName이 같은지 확인하고 같다면 selected(true) --%>
				<%-- selected는 boolean속성을 가진다 --%>
					${fileName }
				</option>
			</c:forEach>
		</select>
		<input type="submit">
	</form>
</div>
<main style="border: 3px solid red; height: 900px; padding: 20px; margin: 20px">
	<c:if test="${not empty param.select }">
	<%-- param.select가 비어있지않다면 --%>
		<jsp:include page="${param.select }"/>
		<%-- param.select 값의 페이지를 현재 페이지에 포함시켜라 --%>
	</c:if>
</main>
</body>
</html>