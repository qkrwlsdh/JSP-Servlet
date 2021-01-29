<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1-page.jsp</title>
</head>
<body>
<%	
	// 여기에 자바코드를 작성하면 된다, 스크립틀릿
	String name = "이지은";
	int age = 29;
	
	// 이렇게 일일이 패키지를 다 적어주기 번거로우니까
	java.util.HashMap<String, Object> map = new java.util.HashMap<String, Object>();
	
	// page 지시자를 이용하여 import를 선언하고 사용한다
	HashMap<String, Object> map2 = new HashMap<String, Object>();
	
	map2.put("name", name);
	map2.put("age", age);
	
	// System.out.print(), System.out.println() "\n"
	out.println(map2.get("name") + "님은 " + map2.get("age") + "살입니다<br>");
	
	map.put("name", "원종래");
	map.put("age", 37);
	
	out.println(map.get("name") + "님은 " + map.get("age") + "살입니다<br>");
	
%>
</body>
</html>