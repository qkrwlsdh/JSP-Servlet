<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05 - c:if</title>
</head>
<body>
<h1>c:if</h1>
<hr>
<c:if test="${empty param.age }">
	<form method="post">
		<p>
			나이를 입력하세요 :
			<input type="number" name="age">
			<input type="submit">
		</p>
	</form>
</c:if>

<c:if test="${param.age < 20 }">
	<h2>당신은 미성년자입니다</h2>
	<a href="ex05.jsp"><button>돌아가기</button></a>
</c:if>
<c:if test="${param.age >= 20 }">
	<h2>당신은 성인입니다</h2>
	<a href="ex05.jsp"><button>돌아가기</button></a>
</c:if>
<%-- JSTL 화면을 보여주는 쪽에 초점을 맞춘다 --%>
</body>
</html>