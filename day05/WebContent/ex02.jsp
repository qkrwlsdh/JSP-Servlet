<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ex02.jsp</h1>
<hr>
<form action="" method="post">
	<input name="test" placeholder="간단한 코멘트를 입력" autofocus>
</form>
<p>form태그에 input이 하나만 있으면 submit이 없어도 엔터키가 submit의 역할을 수행한다</p>

<%request.setCharacterEncoding("UTF-8"); %>

<h2>expression : <%=request.getParameter("test") %></h2>
<h2>EL Tag : ${param.test }</h2>
</body>
</html>