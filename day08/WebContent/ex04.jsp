<%@page import="day08.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp - JSTL Core</title>
</head>
<body>
<h1>JSTL Core</h1>
<hr>
<h3>c:set - attribute를 추가한다. scope를 지정하지 않으면 기본은 pageContext에 추가한다</h3>

<c:set var="member1" value="이지은" scope="page"/>
<c:set var="member2" scope="request">홍진호</c:set>
<c:set var="member3" scope="session">배성재</c:set>
<c:set var="member4" scope="application">고은아</c:set>

<p>&#36;{pageScope.member1 } : ${pageScope.member1 }</p> 
<p>&#36;{requestScope.member2 } : ${requestScope.member2 }</p> 
<p>&#36;{sessionScope.member3 } : ${sessionScope.member3 }</p> 
<p>&#36;{applicationScope.member4 } : ${applicationScope.member4 }</p>

<c:set var="num1">1104</c:set>
<p>&#36;{num1 + 3} : ${num1 + 3 }</p>	<%-- EL Tag는 문자열 더하기를 지원하지 않는다 --%>
<p>${member1 }${member2 }</p>

<c:set var="test" value="<%=new Member() %>" scope="session"/>
<%-- test 변수에 new Member()를 담는다 --%>
<c:set target="${test }" property="name" value="김희철"/>
<c:set target="${test }" property="age" value="38"/>
<p>&#36;{test.name } : ${test.name }</p>
<p>&#36;{test.age } : ${test.age }</p>

<h3>c:remove - 지정한 scope의 attribute를 제거한다. 단,객체의 속성만 제거할 수는 없다</h3>
<c:remove var="member1" scope="page"/> 
<c:remove var="member2" scope="request"/> 
<c:remove var="member3" scope="session"/> 
<c:remove var="member4" scope="application"/>
<c:remove var="test"/>	<%-- scope를 지정하지 않으면 모든 영역의 attribute를 제거한다 --%>
<%--
	scope="page" : 그 페이지에서만 접근 가능
	scope="request" : 응답완료 전까지 접근 가능, 응답이 완료되면 사라짐
	scope="session" : 로그아웃 전까지만 접근 가능, 특정 클라이언트만 접근 가능
	scope="application" : 서버가 꺼지기 전까지 접근 가능, 전체 공개
--%>

<p>\${member1 } : ${member1 }</p> 
<p>\${member2 } : ${member2 }</p> 
<p>\${member3 } : ${member3 }</p> 
<p>\${member4 } : ${member4 }</p> 
<p>\${test } : ${test }</p>

</body>
</html>