<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
<h2>로그인</h2>
<form action="loginResult.jsp" method="post">
	<p><input name="userid" placeholder="ID" autofocus="autofocus" required></p>
	<p><input name="userpw" type="password" placeholder="Password" required></p>
	<p><button>로그인</button>
</form>
</main>
</body>
</html>