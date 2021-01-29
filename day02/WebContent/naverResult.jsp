<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>naverResult</title>
</head>
<body>
<h1>회원가입</h1>
<%	// 요청에 들어온 모든 파라미터의 name:value형식을 맵 객체로 반환
	Map<String, String[]> params = request.getParameterMap();
	
	// 모든 파라미터의 이름을 열거할 수 있는 객체를 반환
	Set<String> names = params.keySet();
	
	for(String name : names){
		String[] valueArr = params.get(name);	// 파라미터 맵에서 값을 가져온다
		
		out.print("<br>");
		
		for(int i = 0; valueArr != null && i < valueArr.length; i++){
			out.print(name + " : " + valueArr[i]);
		}
		out.print("<br>");
	}
%>
</body>
</html>