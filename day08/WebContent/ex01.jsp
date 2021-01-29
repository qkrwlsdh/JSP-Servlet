<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL을 사용하기 위해서는 taglib 지시자를 이용하여 선언해야 한다 --%>
<%-- taglib 지시자를 작성하고, 자동완성 prefix - c, 자동완성 uri, 자동완성 http://.../core --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="itbank" scope="page">여기에 attribute의 값이 들어온다</c:set>
<%// pageContext.setAttribute("itbank", "여기에 attribute의 값이 들어온다"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp - JSTL</title>
</head>
<body>
<h1>JSP Standard Tag Library - JSTL</h1>
<hr>
<h3>${pageScope.itbank }</h3>
<ul>
	<li>JSP는 스크립틀립과 자바 코드 등 여러 코드들이 섞여서 복잡한 구조로 되어 있는데,
		<br>간결하고 이해하기 쉽게 코딩을 하기 위해 자신만의 태그를 추가할 수 있도록 되어 있다
	</li>
	<br>
	<li>
		<b>커스텀 태그</b> : JSP에서 기본 제공되는 태그가 아닌, 자신이 추가한 태그
		<br>JSP를 작성할 때 자주 사용되는 자바 코드를 웹에서 사용할 수 있는 태그형태로 만드는 기술
	</li>
	<br>
	<li>
		<b>커스텀 태그 라이브러리</b> : 작성한 커스텀 태그를 모아서 압축한 후 배포해서 사용하는 것
	</li>
	<br>
	<li>
		<b>라이브러리</b> : 여러 프로그램이 공통으로 사용하는 코드를 모아놓은 집합체
	</li>
	<br>
	<li>
		<b>JSTL</b> : 커스텀 태그를 개별적으로 만들어서 쓰다보니, 일관성이 없어서 이를 표준화한 형태
		<br>JSTL도 공통으로 사용되는 코드의 집합
	</li>
</ul>
</body>
</html>