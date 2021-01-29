<%@page import="phonebook.PhoneBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화번호 하나 상태 보기</title>
<%@ include file="header.jsp" %>
</head>
<body>

<c:set var="dao" value="<%=new PhoneBookDAO() %>"/>
<c:set var="dto" value="${dao.selectOne(param.idx)	 }"/>

<h1><a href="${cpath }">전화번호부</a></h1>
<hr>
<ul>
	<li>이름 : ${dto.name }</li>
	<li>전화번호 : ${dto.pnum }</li>
</ul>
<div>
	<a href="${cpath }/modify.jsp?idx=${dto.idx}"><button>수정</button></a>
	<button id="deleteBtn">삭제</button>
</div>

<script type="text/javascript">
	const deleteBtn = document.getElementById('deleteBtn');
	
	deleteBtn.onclick = () => {
		const answer = confirm('${dto.name} : ${dto.pnum} \n정말 삭제하시겠습니까?');
		if(answer){
			location.replace('delete.jsp?idx=${dto.idx}');
		}
	};
</script>
</body>
</html>