<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
<h1>세션 ID</h1>
<hr>
<%--
	session : JSP내장 객체중의 하나, 클라이언트의 브라우저가 종료되기 전까지 서버상에서 유지되는 객체
				attribute(자바 객체)를 저장할 수 있는 내장 객체이다
				페이지가 변경되어도, session에서 공통의 객체를 참조할 수 있다
				클라이언트마다 서로 다른 세션을 사용한다
				서버의 입장에서는 클라이언트의 수만큼, 혹은 그 이상의 세션을 가지게 된다
				서버는 다수의 세션을 구분하여 관리할 필요성이 발생한다
				서버가 각각의 세션을 구분하기 위한 ID를 세션 ID라고 한다
 --%>
 <h2>sessionID : ${pageContext.request.session.id }</h2>
 <h2>sessionID : <%=session.getId() %></h2>
 <h2>sessionID : ${cookie.JSESSIONID.value }</h2>
 <a href="ex01-invalidate.jsp"><button>session.invalidate()</button></a>
</body>
</html>