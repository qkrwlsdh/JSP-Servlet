<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member2.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="<%=MemberDAO.getInstance()%>" scope="application" />
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="${cpath }/css/style.css">
</head>
<body>
<header>
	<h1><a href="${cpath }/">회원제 게시판</a></h1>
	<div class="loginInfo">
		<strong>
		${login.username } 
		${not empty login ? '(' : '' }
		${login.userid }
		${not empty login ? ')' : '' }
		</strong>
	</div>
</header>

<nav>
	<ul>
		<li>
			<a href="${cpath }/${not empty login ? 'logout.jsp' : 'login.jsp' }">
			${not empty login ? '로그아웃' : '로그인' }
			</a>
		</li>
	</ul>
</nav>

</body>
</html>





