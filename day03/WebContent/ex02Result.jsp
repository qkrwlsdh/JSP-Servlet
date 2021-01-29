<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02Result.jsp</title>
</head>
<body>
<h1>ex02Result.jsp - POST 처리</h1>
<hr>
<%
	// POST로 파라미터를 전달받을 경우, request 내부의 모든 글자 데이터를 UTF-8로 처리하겠다
	request.setCharacterEncoding("UTF-8");

	// 클라이언트가 요청한 방식을 확인해보자
	String method = request.getMethod();
	
	// method가 POST가 아니면, 입력페이지로 되돌려보내기
	if("post".equalsIgnoreCase(request.getMethod()) == false){
			// equalsIgnoreCase -> 대소문자 구분하지 않고, 비교함
		response.sendRedirect("ex02Form.jsp");
	}
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String adult = age >= 20 ? "성인" : "미성년자";
	
	String msg = "%s님은 %d살이고, %s입니다";
	msg = String.format(msg, name, age, adult);
%>
<h2><%=msg %></h2>
<h3>method : <%=method %></h3>
</body>
</html>