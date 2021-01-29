<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1-field.jsp</title>
</head>
<body>
<%!
	// declaration : 선언부, 멤버 필드나 멤버 메서드를 선언하고 정의한다
	private String name = "이지은";
	private int age = 29;
	int cnt1 = 0;
%>
<%
	// scriptlet : 함수 내의 지역변수를 선언할 수 있다. 함수 내부이므로 함수의 정의는 불가능하다
	String name2 = "홍진호";
	int cnt2 = 0;
	
	// 객체가 소멸하기 전까지 유지되는 값이므로, 증가치가 유지된다
	out.print("cnt1 : " + cnt1++ + "<br>");
	out.print("cnt2 : " + cnt2++ + "<br>");
	// 함수의 지역변수는 종료되면 소멸하고, 호출될 때 새로 생성되는 값이므로 증가치가 유지되지 않는다
%>

</body>
</html>