<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
<form method="post">
	<p><input type="text" name="userid" placeholder="ID" autofocus required></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input class="btn" type="submit" value="로그인"></p>
</form>

<a href="${cpath }/findMyId">ID 찾기</a>
<%--
		사용자 이름과 email을 입력받아서, 일치하는 ID가 있으면
		ID를 자바스크립트로 팝업으로 출력하기
--%>
<a href="${cpath }/renewPassword">PW 재발급</a>
<%--
		사용자 이름과 email과 id를 입력받으면
		12글자의 랜덤한 문자열로 비밀번호를 재발급하고,
		이후 로그인이 가능해야 한다 (Hash 내용을 잘 생각해서 만들기)
--%>

<script type="text/javascript">
	const check = ${requestScope.find != null};
	
	if(check){
		alert('${requestScope.find.userid }');
		location.replace('${cpath}/login');
	}
</script>
</main>