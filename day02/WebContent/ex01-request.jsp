<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-request.jsp</title>
</head>
<body>

	<%-- JSP 내장 객체, 생성자를 호출하여 따로 생성하지 않더라도, 처음부터 접근하여 사용할 수 있는 객체 --%>
	
	<%-- 
		request		: 클라이언트가 서버에게 요청하는 메시지 (주로 문서의 이름을 요청)
		response	: 서버가 클라이언트에게 응답하는 메시지 (주로 문서의 내용을 응답)
	 --%>
	 
<%
	String localAddr = request.getLocalAddr();
	String localName = request.getLocalName();
	int localPort = request.getLocalPort();
%>
<h2>request 내장객체의 간단한 메서드</h2>
<hr>
<h3>서버의 IP 주소<%=localAddr %></h3>
<h3>서버의 이름<%=localName %></h3>
<h3>서버가 사용중인 포트<%=localPort %></h3>
<%
	String contentType = response.getContentType();
	int status = response.getStatus();
	String charEncoding = response.getCharacterEncoding();
%>
<h3>응답의 유형 : <%=contentType %></h3>
<h3>응답의 상태 코드 : <%=status %></h3>
<h3>응답의 글자 인코딩 : <%=charEncoding %></h3>
</body>
</html>