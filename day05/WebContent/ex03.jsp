<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp - Array, List, Map</title>
</head>
<body>
<h1>ex03 - Array, List, Map</h1>
<hr>
<%
	String[] arr = {"봄", "여름", "가을", "겨울"};
	pageContext.setAttribute("arr", arr);
	
	List<String> list = Arrays.asList(arr);
	request.setAttribute("list", list);
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("key", "value");
	map.put("apple", "사과");
	map.put("orange", "델몬트");
	map.put("banana", "바나나");
	session.setAttribute("map", map);
%>
<h2>표현식 : <%=arr[0] %>, <%=arr[1] %>, <%=arr[2] %>, <%=arr[3] %></h2>
<h2>EL Tag : ${arr[0] }, ${arr[1] }, ${arr[2] }${arr[3] }</h2>
<hr>
<h2>표현식 : <%=list.get(0) %>, <%=list.get(1) %>, <%=list.get(2) %>, <%=list.get(3) %></h2>
<h2>EL Tag : ${list[0] }, ${list[1] }, ${list[2] }${list[3] }</h2>
<hr>
<h2>표현식 : <%=map.get("apple") %>, <%=map.get("orange") %>, <%=map.get("banana") %></h2>
<h2>EL Tag : ${map['apple'] }, ${map['orange'] }, ${map['banana'] }</h2>
<h2>EL Tag : ${map.apple }, ${map.orange }, ${map.banana }</h2>
<hr>
<p>map의 key는 array의 index와 같은 역할이다. 둘 다 value에 접근하기 위한 데이터이다</p>
</body>
</html>