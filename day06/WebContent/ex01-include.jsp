<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp - action tag</title>
</head>
<body>
<h1>ex01 - action tag</h1>
<hr>
<%--
	include 방식
	
	1) directive, 두 파일을 컴파일 전에 미리 합쳐서, 합쳐진 하나의 파일을 컴파일한다 (지역 공유)
		* header가 가지는 변수를 다른 파일들에서 공유하고 싶을 때 사용 *
		
	2) action tag, 각각의 파일을 컴파일하고, 나온 결과물(HTML 태그)을 합쳐서 보여준다 (지역 공유 안함)
		* 상단과 하단의 지역 변수 충돌이 없도록 하고 싶을 때 사용 *
 --%>
<jsp:include page="header.jsp"></jsp:include>	<%-- 지역변수 test가 선언되어 있음 --%>
<%-- action tag의 include는 변수를 공유하지 않음 (중복 가능) --%>
<%
	String test = "ex01";
%>
<h2>test : <%=test %></h2>

<%-- <jsp:forward page=""></jsp:forward> --%>

<%--
<jsp:useBean id="bean" class="java.util.ArrayList"></jsp:useBean>	<!-- 객체 생성 -->
<jsp:getProperty property="" name=""/>	<!-- getter의 역할을 수행, EL Tag로 대체 가능 -->
<jsp:setProperty property="" name=""/>	<!-- setter의 역할을 수행, 자바빈즈의 모든 속성을 한번에 처리 (*) -->
--%>
</body>
</html>