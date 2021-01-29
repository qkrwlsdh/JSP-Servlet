<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quizForm.jsp</title>
</head>
<body>
<h1><a href="<%=request.getContextPath()%>/quiz1Form.jsp">Quiz</a></h1>
<hr>
<%
	if(session.getAttribute("login") != null) {
		response.sendRedirect("quiz1Result.jsp");
	}
%>
<form action="quiz1Login.jsp">
	
	<p><input type="text" name="userid" value="${cookie.userid.value }" placeholder="ID" required autofocus></p>
	
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p>
		<label>
			<input type="checkbox" name="storeid" 
				   ${empty cookie.userid.value ? '' : 'checked' }>ID 저장
		</label>
		<label>	<%-- 자동 로그인 추가 (quiz1Login에 구현) --%>
			<input type="checkbox" name="autologin">자동 로그인
		</label>
	</p>
	<p><input type="submit" value="로그인"></p>
</form>

<ul>
	<li>test / 1234</li>
	<li>root / 1</li>
	<li>itbank / it</li>
</ul>
</body>
</html>