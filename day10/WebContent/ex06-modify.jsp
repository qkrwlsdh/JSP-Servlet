<%@page import="day10.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-modify.jsp</title>
</head>
<body>
<%-- 수정하고 결과를 팝업으로 알려주고, 단일 항목 보기 페이지로 리다이렉트  --%>

<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="day10.MemberDTO" />
<jsp:setProperty property="*" name="member" />

<c:set var="dao" value="<%=new MemberDAO() %>" />
<c:set var="result" value="${dao.update(member) }" />	<%--int --%>

<script type="text/javascript">
	const result = ${result == 1};	// 쌍따옴표 사용하지 않았으니, true / false

	alert(result ? '성공적으로 수정되었습니다 !!' : '수정이 진행되지 않았습니다.');
	
	location.href = '<c:url value="/ex04-selectOne.jsp?idNumber=${member.idNumber}" />';
	// http://localhost:8080/day10/ex04-selectOne.jsp?idNumber=010203-3456789
</script>

</body>
</html>









