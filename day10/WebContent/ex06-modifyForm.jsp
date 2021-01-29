<%@page import="day10.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-modifyForm.jsp</title>
</head>
<body>

<h1><a href="<c:url value="/"/>">ex06-modifyForm.jsp</a></h1>
<hr>
<c:set var="dao" value="<%=new MemberDAO() %>" />
<c:set var="dto" value="${dao.selectOne(param.idNumber) }" />

<c:if test="${empty dto }">	<%-- dto == null --%>
	<script>
		alert('지정한 데이터를 찾을 수 없습니다');
		location.href = '<c:url value="/" />';
	</script>
</c:if>

<c:if test="${not empty dto }">	<%--dto != null --%>
	
	<form method="POST" action="ex06-modify.jsp">
	<div style="display: flex; justify-content: space-between; width: 300px;">
		<div>
			<ul>
				<li>idNumber</li>
				<li>name</li>
				<li>age</li>
				<li>gender</li>
			</ul>
		</div>
		<div>
			<ul style="list-style: none">
				<li>${dto.idNumber }</li>
				<li><input size="12" name="name" value="${dto.name }" required autofocus></li>
				<li><input size="12" name="age" value="${dto.age }" required></li>
				<li><input size="12" name="gender" value="${dto.gender }" required></li>
			</ul>
			<input type="hidden" name="idNumber" value="${dto.idNumber }">
			<%--type="hidden" 이면, 화면에 나타나지 않지만, submit했을때 값이 전송된다 --%>
		</div>
	</div>
	
	<div style="display: flex; justify-content: space-between; width: 300px;">
		<div>
			<a href="<c:url value="/"/>"><input type="button" value="목록으로"></a>
		</div>
		<div>
			<button>수정 완료</button>
		</div>
	</div>
	</form>
	
</c:if>

</body>
</html>



