<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-forward.jsp</title>
</head>
<body>
<h1>ex04-forward.jsp</h1>
<hr>
<%
	// redirect가 클라이언트에게 이동할 주소를 전달하는 방식이라면
	// forward는 클라이언트에게 알리지 않고, 서버에서 보여주는 내용을 바꿔치기 하는 기술이다
	
	String path = "ex01.jsp";	// 이동할 경로 (보여줄 내용)
	RequestDispatcher rd = request.getRequestDispatcher(path);
	rd.forward(request, response);	// 요청객체와 응답객체를 그대로 전달한다
	
	// forward의 경우, 페이지는 바뀌지만, request객체가 유지된다는 특징이 있다
	// redirect는 클라이언트가 새롭게 요청을 하기 때문에 request객체가 변경된다
	
	// forward는 서버에서 주도하기 때문에, 서버 내의 문서만 보여줄 수 있고
	// redirect는 클라이언트 입장에서 요청하기 때문에, 서버자신 외의 다른 경로도 요청가능하다
	
	System.out.println("forward 성공!!");
	System.out.println("주소창과 보여지는 내용을 비교해보세요");
%>
</body>
</html>