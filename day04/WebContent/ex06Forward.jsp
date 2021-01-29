<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06Forward.jsp</title>
</head>
<body>
<%=pageContext.getAttribute("ob1") %>	<%-- 현재 페이지에서만 공유되는 객체 --%>
<%=request.getAttribute("ob2") %>		<%-- 요청이 살아있는 동안에만 공유되는 객체 --%>
<%=session.getAttribute("ob3") %>		<%-- 강제로 세션을 만료시키거나, 브라우저를 종료하기전까지 유지 --%>
<%=application.getAttribute("ob4") %>	<%-- 서버가 재시작하기 전까지 유지되는 객체 --%>

<%--
	session == FXChat에서 ClientThread (서버입장에서 각 클라이언트를 관리하는 객체)
--%>

<a href="ex06.jsp"><button>ex06</button></a>
</body>
</html>