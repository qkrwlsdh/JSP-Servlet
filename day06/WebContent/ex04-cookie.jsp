<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-cookie.jsp</title>
</head>
<body>
<%--
		Cookie : 문자열 데이터를 클라이언트의 컴퓨터에 저장하는 형식
		세션이 값을 서버에 저장한다면, 쿠키는 클라이언트에 저장합니다
		Session : Server / Cookie : Client
		ID 자동 저장, 쇼핑몰의 장바구니 등에 활용할 수 있습니다
		
		단, 클라이언트에 저장되는 데이터에는 보안상 민감한 데이터를 저장하지 않습니다
		
		쿠키는 클라이언트 프로그램마다 별도로 관리하므로
		같은 사이트에 대해서도 웹 브라우저마다 서로 다른 쿠키를 가질 수 있다
		
		1) 사용자가 값을 서버에 전송 (request, form, parameter를 저장하는 형식 (문자열))
		2) 서버는 값을 쿠키로 만들어서, response에 담아서 같이 보낸다
		3) 클라이언트는 전달받은 쿠키를 브라우저에 저장해둔다
		4) 다음번에 다시 사이트에 재방문시, 전달받았던 쿠키를 서버에 같이 보낸다
		5) 서버는 쿠키를 확인하고, 쿠키에 담긴 값을 활용하여 응답을 구성하여 보낸다
 --%>
<h1>ex04-cookie.jsp</h1>
<hr>
<%
	request.setCharacterEncoding("UTF-8");
	Cookie[] cs = request.getCookies();		// 클라이언트가 요청에 함께 보낸 쿠키의 배열을 반환
	String autoComplete = "";				// 쿠키가 없으면 빈 문자열
	
	// 사이트 첫 방문시에는 쿠키가 없다 (쿠키는 재방문시에 활용되는 값)
	// 사이트에 첫 방문한 사용자에게 쿠키 사용 동의를 얻는 이유
	for(int i = 0; cs != null && i < cs.length; i++){	// 쿠키 배열 중에서
		Cookie c = cs[i];					// 각 원소를 c라고 할 때
		if(c.getName().equals("comment")){	// c의 이름이 comment이면
			autoComplete = c.getValue();	// c의 값을 문자열 변수에 저장하고
			autoComplete = autoComplete.replace("_", " ");	// 언더바를 띄워쓰기로 치환해라
		}
	}
%>
<form action="ex04Result.jsp">
	<input type="text" name="comment" value="<%=autoComplete %>" placeholder="간단한 메모를 입력하세요">
	<input type="submit">
</form>
<h2>주소 창에 입력해보세요 : javascript:alert(document.cookie)</h2>

<input type="button" value="쿠키 확인" onclick="alert(document.cookie)">
<input type="button" value="쿠키 삭제" onclick="location.replace('ex04DeleteCookie.jsp')">
</body>
</html>