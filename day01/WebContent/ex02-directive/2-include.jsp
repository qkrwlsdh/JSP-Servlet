<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2-include.jsp</title>
</head>
<body>

<%@ include file="1-page.jsp" %>
<%-- include 지시자가 사용된 위치에 지정한 파일 내용을 불러와서 같이 보여준다 --%>
<%-- include 지시자에 의해서 포함되는 파일은, 두 파일을 같이 불러와서 자바 소스를 합친 이후에 컴파일이 된다 --%>
<%-- 하나의 페이지가 되기 때문에 중복되는 이름은 사용할 수 없다 --%>
<hr>
<p>여기는 2-include.jsp 파일입니다</p>
<p>서로 다른 페이지가 동일한 header와 footer를 가지게끔 디자인하려할때 사용할 수 있다</p>
<%
	// String name = "홍진호";
	out.print(map2.get("name"));
%>

</body>
</html>