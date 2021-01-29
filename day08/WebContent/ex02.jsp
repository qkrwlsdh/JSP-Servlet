<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp - JSTL의 종류</title>
</head>
<body>
<h1 align="center">JSTL의 종류</h1>
<hr>
<table border="1" cellpadding="10" cellspacing="0" align="center">
	<tr>
		<th>커스텀 태그</th><th>설명</th>
	</tr>
	<tr>
		<td>핵심기능(core)</td>
		<td>일반 프로그램 언어에서 제공하는것과 유사한, 변수선언과 제어문의 형식을 제공하며<br>
			웹 프로그램으로써, 다른 주소로 이동하는 기능도 제공한다
		</td>
	</tr>
	<tr>
		<td>형식화(format)</td>
		<td>
			숫자, 날짜, 시간의 형식을 지정하는 기능과, 국제화, 다국어 기능을 포함한다
		</td>
	</tr>
	<tr>
		<td>데이터베이스(sql)</td>
		<td>데이터베이스에서 입력/수정/삭제/조회하는 기능을 제공한다</td>
	</tr>
	<tr>
		<td>XML 관련 기능(xml)</td>
		<td>XML 문서 처리를 위한 기능을 제공한다</td>
	</tr>
	<tr>
		<td>함수 처리(functions)</td>
		<td>문자열을 처리하거나, 기타 유용한 함수를 제공한다</td>
	</tr>
</table>
<%-- 많이 쓰는 건 핵심기능, 형식화, 함수 처리 --%>
</body>
</html>