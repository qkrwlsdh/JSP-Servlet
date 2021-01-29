<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- directive, 지시자 --%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1.jsp</title>
</head>
<body>
<%!	// declaration, 선언부
	public String getToday() {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String result = sdf.format(now);
		return result;
	}
	String field = getToday();

%>
<%
	// scriptlet
	String today = getToday();
	String data = String.format("지금은 %s 입니다", today);
%>

<h2><%=data %></h2>
<h2><%=String.format("지금은 %s 입니다", getToday()) %></h2>

<h3><%=field %></h3>	<%-- 멤버필드로 만든 getToday()는 처음 호출된 시간만 출력됨 --%>

<%--

	1) java.util.Date, java.text.SimpleDateFormat 을 import 하세요
	
	2) 현재 날짜 객체를 생성하여 SimpleDateFormat을 활용하여 yyyy-MM-dd hh:mm:ss 형식의 문자열로 변환하여
	      반환하는 함수 public String getToday() 함수를 정의하세요
	   	
	3) 스크립틀릿에서 String.format() 함수를 이용하여 "지금은 %s입니다" 형식으로 문자열 서식 값을 준비하세요
	
	4) 표현식을 활용하여 <h2> 태그 내부에 값을 출력하세요 (표현식은 함수의 반환값도 출력할 수 있다)
	
 --%>

</body>
</html>