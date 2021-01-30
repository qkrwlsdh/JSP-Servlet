<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
	<form method="post">
		<p><input type="text" name="username" placeholder="이름" autofocus required></p>
		<p><input type="email" name="email" placeholder="e-mail" required></p>
		<p><input class="btn" type="submit" value="찾기"></p>
	</form>
</main>