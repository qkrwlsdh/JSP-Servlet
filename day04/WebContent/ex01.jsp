<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
<h1>ex01.jsp - Response</h1>
<hr>
<table border="1" cellpadding="10" cellspacing="0" align="center">
	<tr><th>메서드</th><th>결과</th><th>설명</th></tr>
	<tr>
		<td>response.getStatus()</td>
		<td><%=response.getStatus() %></td>
		<td>클라이언트에게 보내는 웹 상태 코드</td>
	</tr>
	<tr>
		<th colspan="3">
			<ul>
				<li>200 : OK(정상)</li>
				<li>400 : Bad Request(잘못된 요청, 문법)</li>
				<li>401 : Unauthorized(인증되지 않은 접근)</li>
				<li>403 : Forbidden(권한 부족)</li>
				<li>404 : Not Found(주소 혹은 응답 페이지 없음)</li>
				<li>500 : Internal Server Error(서버 내부의 오류)</li>
			</ul>
		</th>
	</tr>
	<tr>
		<td>response.getContentType()</td>
		<td><%=response.getContentType() %></td>
		<td>클라이언트에게 보내는 응답 데이터의 유형</td>
	</tr>
	<tr>
		<td>response.setCharacterEncoding("UTF-8")</td>
		<td>반환 값 없음</td>
		<td>응답에 포함되는 모든 글자데이터의 인코딩을 설정한다</td>
	</tr>
</table>
</body>
</html>