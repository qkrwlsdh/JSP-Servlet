<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quizForm.jsp</title>
</head>
<body>
<%--
		쿠키를 활용한 로그인 기능을 구현하세요
		
		quiz1Form.jsp	: 로그인 폼, ID자동저장이 체크되어있으면 ID자동완성 및 체크박스 체크된 상태
		quiz1Login.jsp	: 로그인을 처리하고, 자동저장 체크박스에 따라 쿠키 저장 여부 결정 (출력코드 없음)
		quiz1Result.jsp	: 로그인 성공시에만 표시, 로그아웃 링크를 가지고 있어야 함
		quiz1Logout.jsp : 로그아웃 하고 나서 quiz1Form.jsp로 리다이렉트
--%>
<h1><a href="<%=request.getContextPath()%>/quiz1Form.jsp">Quiz</a></h1>
<hr>
<%
	// 로그인 된 상태에서 입력창이 뜨면 이상하잖아
	if(session.getAttribute("login") != null) {		// 세션에 login이 있으면 결과로 돌리자
		response.sendRedirect("quiz1Result.jsp");
	}

	
	Cookie[] cs = request.getCookies();		// 쿠키의 배열을 request에서 받아와서
	String userid = "";						// 쿠키가 있으면 저장할건데, 일단은 빈 문자열로 초기화
	for(int i = 0; cs != null && i < cs.length; i++) {	// 쿠키가 존재하면 반복문으로 접근
		Cookie c = cs[i];					// i번째 요소를 c라고 할 때
		switch(c.getName()) {				// 쿠키의 이름에 따라서 (equals()메서드 쓰기 귀찮음)
			case "userid" : userid = c.getValue(); break;
		}	// 이름이 userid인 쿠키를 찾아서 그 값을 String userid에 담아두자
	}
%>
<form action="quiz1Login.jsp">
	<!-- 쿠키가 없으면 userid=""이니까, value에 영향을 주지 않는다 (placeholder도 지워지지 않는다) -->
	<p><input type="text" name="userid" value="<%=userid %>" placeholder="ID" required autofocus></p>
	
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p>
		<label>
			<input type="checkbox" name="storeid" 
				   <%="".equals(userid) ? "" : "checked" %>>ID 자동 저장
			<!-- 쿠키에 userid가 있다는건, 자동저장에 체크했다는 이야기니까, 체크를 해주자 -->
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