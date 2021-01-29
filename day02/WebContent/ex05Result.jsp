<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05Result.jsp</title>
</head>
<body>
<h1>ex05Result.jsp - 여러개의 중복값을 받아서 처리하기</h1>
<hr>
<%
	request.getParameter("여기에는 input 태그의 name속성 문자열을 적는다");	// 반환자료형은 String
	String test = request.getParameter("color");	// 여러 값이 전달되어도 하나만 받을 수 있다
	
	String[] colorArr = request.getParameterValues("color");
	
	/* NullPointerException 예외가 발생하면 .연산자를 찾아라 */
%>
<p>test : <%=test %></p>

<div><%
	// 스크립틀릿이 중간에 끊어졌다가 다시 생성해도, HTML상의 위치만 바뀔뿐, 처리되는 우선순위는 같다
	for(int i = 0; colorArr != null && i < colorArr.length; i++){
		//out.print("color : " + colorArr[i] + "<br>");
		%>
		<div style="background-color: <%=colorArr[i] %>;
					color: white;
					font-weight: bold;
					display: inline;">color : <%=colorArr[i] %></div>
		<%
	}
%></div>

<div><%
	for(String str : colorArr){
		%><div style= "display: inline;
						color: <%=str %>;
						padding: 5px;">색깔 : <%=str %></div><%
	}
%></div>
<%-- 확장된 for문 형식으로 써도 nullPointer가 발생할 수 있으니,
	arr != null && i < arr.length 조건을 쓰자 --%>
	
<%
	request.getParameter("name");		// 기본형, 단일 데이터를 문자열 형식으로 반환한다	String
	request.getParameterMap();			// 파라미터의 이름과 값을 Map에 저장하여 반환한다	Map<String, String[]>
	request.getParameterNames();		// 파라미터의 이름만 가져온다					Enumeration<String>
	request.getParameterValues("name");	// 하나의 이름에 여러 값이 있을 경우에 가져온다	String[]
			
	// 자바 컬렉션 프레임워크 : 다수의 데이터를 효과적으로 처리할 수 있는 자료구조, 자바에서 기본 제공하는 클래스
	// List, Set, Map, Iterator, Enumeration
	// 만약, form태그에서 입력받는 파라미터의 개수가 23개라면..?
	// 파라미터마다 값의 개수도 다르고 변수 이름도 다르다면..?
%>
</body>
</html>