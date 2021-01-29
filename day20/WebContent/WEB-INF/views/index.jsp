<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<div style="display: flex;
			justify-content: space-between;
			align-items: flex-end;">

<h1>index.jsp</h1>
<div><b>${login.username }</b> ${not empty login ? '님 로그인 중' : '' }</div>
</div>
<hr>

<p>WebContent/WEB-INF/views/index.jsp</p>

<p>WEB-INF 하위 폴더의 경로는 요청하면 접근할 수 없다</p>
<p>요청에 따라서 처리하고, 서블릿이 forward하는 경우에는 보여줄 수 있다</p>
<p>클라이언트가 JSP에 직접 접근할 수는 없지만, 정해진 형식대로 접근하면 서블릿이 통제하에 보여줄 수 있다</p>

<ul>
	<li><a href="${cpath }/login">ex01 - login</a></li>
</ul>

<script type="text/javascript">
	const loginFail = ${requestScope.loginFail};
	console.log('loginFail : ', loginFail);
	if(loginFail){
		alert('로그인 실패!!');
		location.replace('${cpath}/login');
	}
</script>
</body>
</html>