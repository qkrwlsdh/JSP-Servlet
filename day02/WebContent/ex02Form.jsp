<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02Form.jsp</title>
</head>
<body>
<h1>ex02Form.jsp</h1>
<hr>
<form>
	<p><input type="text" name="name" placeholder="이름"></p>
	<p><input type="text" name="age" placeholder="나이"></p>
	<p><input type="submit" value="전송"></p>
</form>

<%
	String name = request.getParameter("name");		// input name="name"
	String age = request.getParameter("age");		// input name="age"
%>
<fieldset>
		<p><%=name != null ? "이름 : " + name : "" %></p>
		<p><%=age != null ? "나이 : " + age : "" %></p>
</fieldset>

<%-- 
	URL	: Uniform Resource Locator

	http://localhost:8080/day02/ex02Form.jsp?name=박진오&age=29
	
	http://		프로토콜의 이름, 어떤 약속으로 데이터를 주고 받는지
	localhost	서버의 이름, IP나 DomainName을 사용할 수 있다
	:8080		서버의 포트, 웹 브라우저는 :80 혹은 :443 포트를 기본값으로 사용합니다
	/day02/ex02Form.jsp		요청하는 자원의 경로
	?name=박진오&age=29		서버에 전달하는 파라미터
	
	https://search.naver.com/search.naver?query=아이유
	네이버에서 아이유를 검색하는 주소
 --%>
</body>
</html>