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
<!-- 세션에 저장했으니 EL태그로 참조하는게 편하겠지 -->
${login.userid } (${login.username }) 님 로그인되었습니다

<input type="button" value="로그아웃" onclick="location.replace('quiz1Logout.jsp')">
<!-- 로그아웃 버튼 클릭하면 quiz1Logout.jsp로 이동한다 -->
<!-- 아...이거 그냥 a태그로 처리해도 똑같은데...location.replace() 보여줘야지 -->

<p>
<fieldset style="display: inline-block;">
	<blockquote>
		<p>로그인 된 상태에서는 초기화면으로 돌아가도 다시 현재 창으로 리다이렉트 됩니다</p>
		<p>로그아웃 하시면 입력창으로 돌아갈 수 있습니다</p>
	</blockquote>
</fieldset>

<script>
	const login = '${login.userid}';	// 세션에 값이 있으면 id가 들어올꺼고, 없으면 빈 문자열이 되겠지
										// EL Tag는 null값을 출력하지 않으니까 !!
	if(login === '') {					// login이 빈 문자열이면 세션에 값이 없는거니까 로그인 실패다
		alert('로그인 실패 !!');			// 팝업 띄우고
		location.href = 'quiz1Form.jsp';// 다시 입력하도록 돌려보내기, response.sendRedirect() 비슷
	}
</script>
</body>
</html>