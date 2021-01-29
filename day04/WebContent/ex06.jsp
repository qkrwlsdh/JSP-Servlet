<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
<style>
	span{
		color: red;
		font-weight: bold;
	}
	div{
		color: darkgrey;
		display: flex;
	}
</style>
</head>
<body>
<h1>ex06.jsp - JSP 주요 내장 객체</h1>
<hr>
<ul>
	<li><div>page</div> : JSP 페이지를 구현한 객체</li>
	<li><span>pageContext</span> : JSP 페이지에 대한 정보를 저장하는 객체 (scope)</li>
	<li><span>request</span> : 웹 브라우저의 요청에 대한 정보를 저장하는 객체 (scope)</li>
	<li><span>response</span> : 웹 브라우저의 요청에 대한 응답을 저장하는 객체</li>
	<li>out : response에 대해 출력 스트림을 가지는 객체</li>
	<li><span>session</span> : 웹 브라우저가 종료되기 전까지의 정보를 저장하는 객체 (scope)</li>
	<li><span>application</span> : 웹 서버가 종료되기 전까지의 정보를 저장하는 객체 (scope)</li>
	<li><div>config</div> : JSP의 설정 정보를 저장하는 객체</li>
	<li>exception : 예외가 발생할 경우 사용하는 객체</li>
</ul>
<%
	pageContext.setAttribute("ob1", "pageContext");		// 페이지 하나마다 별도로 생성되는 객체
	request.setAttribute("ob2", "request");		// 요청이 발생할 때마다 생성되는 객체, forward시 유지된다
	session.setAttribute("ob3", "session");		// 웹 브라우저가 종료되기 전까지 유지되는 객체
	application.setAttribute("ob4", "application");		// 서버가 종료되기 전까지 유지되는 객체
	
	pageContext.getRequest();			// request 객체를 반환
	pageContext.getResponse();			// response 객체를 반환
	pageContext.getSession();			// session 객체를 반환
	pageContext.getServletContext();	// application 객체를 반환
	
	RequestDispatcher rd = request.getRequestDispatcher("ex06Forward.jsp");
	rd.forward(request, response);
%>
</body>
</html>