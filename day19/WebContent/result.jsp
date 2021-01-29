<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<h1>${login.username } ${not empty login ? '로그인 성공' : '로그인 실패' }</h1>
	<hr>
	<script>
		const userid = '${sessionScope.login.userid}';
		const username = '${sessionScope.login.username}';
		
		if(userid !== '' && username !== '') {
			alert(username + '(' + userid + ') 님 로그인 성공 !!');
		}
		else {
			alert('로그인 실패ㅋ');
		}
	</script>
</main>
<%@ include file="footer.jsp" %>
