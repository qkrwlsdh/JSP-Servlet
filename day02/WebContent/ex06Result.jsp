<%@page import="java.util.Set"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06Result.jsp</title>
</head>
<body>
<h1>ex06Result.jsp</h1>
<hr>
<%	// 요청에 들어온 모든 파라미터의 name:value형식을 맵 객체로 반환
	Map<String, String[]> params = request.getParameterMap();
	
	// 모든 파라미터의 이름을 열거할 수 있는 객체를 반환
	Enumeration<String> names = request.getParameterNames();
	
	while(names.hasMoreElements()){		// 아직 처리하지 않은 이름이 남아있다면
		String name = names.nextElement();		// 이름을 가져와서
		String[] valueArr = request.getParameterValues(name);	// 값을 배열형태로 받고
		
		out.print(name + " : ");
		
		// 값의 개수만큼 반복하여 출력
		for(int i = 0; valueArr != null && i < valueArr.length; i++){
			out.print(valueArr[i]);
			out.print(i != valueArr.length - 1 ? ", " : "<br>");
		}
	}
%>
<hr>
<%	// 요청에 들어온 모든 파라미터의 name:value형식을 맵 객체로 반환
	Map<String, String[]> params2 = request.getParameterMap();
	
	// params2는 key와 value를 맵핑하여 저장하는데, key의 목록만 Set형식으로 반환
	Set<String> names2 = params2.keySet();
	
	for(String name : names2){	// Set은 index가 없기 때문에, 확장된 for문으로 접근
		
		String[] valueArr = request.getParameterValues(name);	// 값을 배열형태로 받고
		
		out.print(name + " : ");
		
		// 값의 개수만큼 반복하여 출력
		for(int i = 0; valueArr != null && i < valueArr.length; i++){
			out.print(valueArr[i]);
			out.print(i != valueArr.length - 1 ? ", " : "<br>");
			// 마지막 값이면 줄바꿈, 아니면 콤마
		}
	}
%>
<hr>
<%	// 요청에 들어온 모든 파라미터의 name:value형식을 맵 객체로 반환
	Map<String, String[]> params3 = request.getParameterMap();
	
	// 모든 파라미터의 이름을 열거할 수 있는 객체를 반환
	Set<String> names3 = params3.keySet();
	
	for(String name : names3){
		
		String[] valueArr = params3.get(name);	// 파라미터 맵에서 값을 가져온다
		
		out.print(name + " : ");
		
		// 값의 개수만큼 반복하여 출력
		for(int i = 0; valueArr != null && i < valueArr.length; i++){
			out.print(valueArr[i]);
			out.print(i != valueArr.length - 1 ? ", " : "<br>");
		}
	}
%>
</body>
</html>