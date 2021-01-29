<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03Form.jsp</title>
</head>
<body>
<h1>ex03Form.jsp - 비밀번호 데이터 전달하기</h1>
<hr>
<form action="ex03Result.jsp" method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input type="submit" value="로그인"></p>
</form>
<a href="ex03Result.jsp?userid=itbank&userpw=it">결과 페이지 링크 (GET)</a>

<%-- GET방식 접근
	1) 주소창에 주소를 직접 입력한다
	2) a 태그를 이용하여 브라우저의 주소창이 변경된다
	3) 자바스크립트를 이용하여 location을 변경하거나, history로 접근한다
	4) form 태그에 method를 지정하지 않고, submit을 수행한다
	5) JSP의 response.sendRedirect("url"); --%>
	
	<%-- POST를 사용하는 경우
		1) 패스워드와 같이 데이터가 주소창에 노출되는걸 원하지 않는 경우
		2) 전달할 데이터의 용량이 커서 GET방식으로 전달할 수 없는 경우 --%>
		
		<%-- GET방식을 사용해야 하는 경우
			1) 링크를 공유하는 상황에서 모든 파라미터가 같이 전달되어야 하는 경우
			2) 보안상 숨겨야 하는 데이터가 없고, POST보다 빠른 처리가 필요한 경우 --%>
</body>
</html>