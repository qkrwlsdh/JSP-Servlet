<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<h1>INDEX</h1>
<hr>
<strong>${login.username }</strong>
<ul>
	<li><a href="${cpath }/hello/">ex01 - Hello Servlet</a></li>
	<li><a href="${cpath }/now/">ex02 - Now Servlet</a></li>
	<li><a href="${cpath }/lifeCycle/">ex03 - Life Cycle</a></li>
	<li><a href="${cpath }/quiz/">quiz - Member2 테이블을 활용하여 로그인</a></li>
	<%-- 
		GET : 로그인 폼 출력
		POST : DAO, DTO를 활용하여 DB에서 데이터를 조회하고 일치하는 계정이 있으면
				자바스크립트로 로그인 성공 출력하기, 없으면 로그인 실패 출력하기
				
		JSP는 데이터 연산 처리를 수행하지 않고 화면에 출력하는 용도로만 처리한다
		!! 포워드는 request 객체의 유효기간을 연장하므로, request.setAttribute()를 활용하자
		서블릿에서 request.setAttribute("login", login);
		JSP에서 request.getAttribute("login")으로 객체를 가져올 수 있다
		${login.userid}, ${login.username} (필요하면 JSTL도 사용 가능)
	 --%>
</ul>
</body>
</html>