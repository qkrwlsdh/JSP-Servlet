<%@page import="day10.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04-selectOne.jsp</title>
</head>
<body>

<h1><a href="<c:url value="/"/>">ex04-selectOne.jsp</a></h1>
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
				<li>${dto.name }</li>
				<li>${dto.age }</li>
				<li>${dto.gender }</li>
			</ul>
		</div>
	</div>
	
	<div style="display: flex; justify-content: space-between; width: 300px;">
		<div>
			<a href="<c:url value="/"/>"><button>목록으로</button></a>
		</div>
		<div>
			<a href="<c:url value="/ex06-modifyForm.jsp?idNumber=${dto.idNumber }" />"><button>수정</button></a>
			<button id="deleteBtn">삭제</button>
		</div>
	</div>
	<script type="text/javascript">
		const deleteBtn = document.getElementById('deleteBtn');
		
		deleteBtn.onclick = () => {
			const select = confirm('정말 삭제하시겠습니까?');
			if(select) {
				location.href = '<c:url value="/ex05-delete.jsp?idNumber=${dto.idNumber }" />';
			}
		}
	</script>
</c:if>


</body>
</html>