<%@page import="day10.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp - 추가</title>
</head>
<body>

<%-- 
		DAO에 메서드를 추가해서 데이터를 입력할 수 있는 페이지를 구성해보세요
		form(post) -> dto -> dao.insertMember(dto) -> int row != 0 -> success
 --%>


<h1><a href="<c:url value="/" />">데이터베이스에 Member 추가</a></h1>
<hr>
${pageContext.request.method }	
<%-- request.getMethod() --%>

<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input name="idNumber" placeholder="주민등록번호" required autofocus></p>
		<p><input name="name" placeholder="이름" required></p>
		<p><input name="age" placeholder="나이" required></p>
		<p><input name="gender" placeholder="성별" required></p>
		<p><input type="submit" value="추가"></p>
	</form>
	<p>
		<a href="ex02.jsp"><button>목록으로</button></a>
	</p>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">

	<%
		request.setCharacterEncoding("UTF-8");
	%>			<%--인코딩 설정 --%>
	<jsp:useBean id="bean" class="day10.MemberDTO" />		<%--bean 객체 생성 --%>
	<jsp:setProperty property="*" name="bean" />			<%--bean 객체에 파라미터를 세팅 --%>
	<c:set var="dao" value="<%=new MemberDAO() %>" />		<%--dao 객체 생성, scope="page" --%>
	<c:set var="row" value="${dao.insertMember(bean) }" />	<%--dao.insertMember(bean) --%>
	
	<c:if test="${row == 1 }">			<%--함수 호출의 결과값이 1이면 1줄이 추가되었으니 --%>
		<c:redirect url="ex02.jsp" />	<%--목록으로 이동해라 --%>
	</c:if>
	
	<c:if test="${row == 0 }">			<%--함수 호출의 결과값이 0이면 추가되지 않았으니 --%>
		<c:redirect url="ex03.jsp" />	<%--현재 페이지로 리다이렉트한다 (GET) --%>
	</c:if>

</c:if>


</body>
</html>






