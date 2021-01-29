<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1Result.jsp</title>
</head>
<body>
<h1><a href="<%=request.getContextPath()%>/quiz1Form.jsp">Quiz</a></h1>
<hr>
<p>
${login.userid } (${login.username }) 님 로그인되었습니다

<input type="button" value="로그아웃" onclick="location.replace('quiz1Logout.jsp')">

<p>
<fieldset style="display: inline-block;">
	<blockquote>
		<p>로그인 된 상태에서는 초기화면으로 돌아가도 다시 현재 창으로 리다이렉트 됩니다</p>
		<p>로그아웃 하시면 입력창으로 돌아갈 수 있습니다</p>
	</blockquote>
</fieldset>

<script>
	const login = '${login.userid}';
	if(login === '') {
		alert('로그인 실패 !!');
		location.href = 'quiz1Form.jsp';
	}
</script>
</body>
</html>