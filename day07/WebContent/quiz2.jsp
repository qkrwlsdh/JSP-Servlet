<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz2.jsp</title>
</head>
<body>
<header>
	<h1>
	cookie문제2
		<form action="quiz2Process.jsp" method="post">
			<select name="theme">
				<option value="light" ${cookie.theme.value == 'light' ? 'selected' : '' }>밝게</option>
									<%-- cookie의 theme의 value가 light라면 selected 추가 --%>
				<option value="dark" ${cookie.theme.value == 'dark' ? 'selected' : '' }>어둡게</option>
			</select>
			<input type="submit" value="변경">
		</form>
	</h1>
</header>
<hr>
<main>
	<p>너무 힘들어요</p>
</main>
${cookie.theme.value}
<script>
	const theme = '${cookie.theme.value}';
	const body = document.querySelector('body');
	const flag = theme === 'light';
		body.style.backgroundColor = flag ? 'white' : 'dimgrey';
		body.style.color = flag ? 'black': 'white';
</script>
</body>
</html>