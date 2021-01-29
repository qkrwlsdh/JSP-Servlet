<%@page import="beans.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05Welcome.jsp</title>
</head>
<body>
<marquee direction="down" behavior="slide" scrollamount="2">
	<marquee direction="up" behavior="slide" scrollamount="2">
		<h2>안녕하세요, 로그인 성공</h2>
	</marquee>
</marquee>
<%
	Login result = (Login)request.getAttribute("result");
	// getAttribute()의 반환형은 Object이므로, 다운캐스팅이 필요하다
%>
<p>로그인한 계정의 사용자 이름 : <%=result.getUsername() %></p>
<p>EL tag로 출력 : ${result.username }</p>
<%-- 
	사용자의 입력데이터(문자열) -> 서버
	서버는 문자열 데이터나 원시 자료형 데이터를 묶어서 객체화 할 수 있다
	다른 페이지로 포워딩할 때, 문자열 데이터만 전송하는것이 아니라
	객체 그 자체를 전송할 수 있다면 적은 횟수로 많은 데이터를 전송하는것이 가능하다
	
	parameter : 사용자 입력 데이터(문자열)
	attribute : 서버에서 만들어서 주거나 받을 수 있는 데이터(객체, Object)
	
	parameter는 서버가 입력하는 것이 아니기 때문에, getParameter(name)만 존재하고 setter없음
	attribute는 클라이언트가 입력할 수 없기 때문에, getter와 setter가 모두 존재한다
	
	request.getParameter(name) - String을 반환
	request.getAttribute(name) - Object를 반환
	request.setAttribute(name, object); - void
--%>
</body>
</html>