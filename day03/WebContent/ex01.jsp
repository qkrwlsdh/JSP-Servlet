<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>
<h1>ex01.jsp - request</h1>
<hr>
<table border="1" cellspacing="0" cellpadding="10">
	<thead>
		<tr>
			<th>메서드</th>
			<th>출력결과</th>
			<th>설명</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>request.getContextPath()</td>
			<td><%=request.getContextPath() %></td>
			<td>서버에서 기본 문서 경로를 출력한다</td>
		</tr>
		<tr>
			<td>request.getMethod()</td>
			<td><%=request.getMethod() %></td>
			<td>클라이언트가 요청한 HTTP 방식을 출력한다 (GET / POST / PUT / DELETE 등)</td>
		</tr>
		<tr>
			<td>request.getLocalAddr()</td>
			<td><%=request.getLocalAddr() %></td>
			<td>클라이언트가 요청한 서버의 IP주소를 문자열로 반환한다</td>
		</tr>
		<tr>
			<td>request.getRemoteAddr()</td>
			<td><%=request.getRemoteAddr() %></td>
			<td>클라이언트의 IP주소를 문자열로 반환한다</td>
		</tr>
		<tr>
			<td>request.setCharacterEncoding("UTF-8")</td>
			<td>void</td>
			<td>request에 담긴 parameter가 있다면, 인코딩 방식을 UTF-8로 지정한다</td>
		</tr>
		<tr>
			<td>request.getCookies()</td>
			<td><%=request.getCookies() %></td>
			<td>클라이언트가 요청하면서 첨부한 쿠키의 목록을 배열형태로<br> 반환한다<br>즐겨찾기, 장바구니</td>
		</tr>
		<tr>
			<td>request.getSession()</td>
			<td><%=request.getSession() %></td>
			<td>세션 객체를 반환한다<br>(쿠키와 대응되는 서버에 저장하는 데이터 객체)</td>
		</tr>
	</tbody>
</table>

<ul>
	<li><a href="/">/</a></li>
	<li><a href="<%=request.getContextPath() %>/">contextPath</a></li>
</ul>
</body>
</html>