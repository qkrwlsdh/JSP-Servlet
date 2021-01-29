<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
<h2>회원가입</h2>

<form action="joinResult.jsp" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td><input name="userid" placeholder="ID" autofocus required></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input name="userpw" type="password" placeholder="Password" required></td>
		</tr>
		<tr>
			<td>사용자 이름</td>
			<td><input name="username" placeholder="이름" required></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input name="age" placeholder="나이" required></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label><input name="gender" type="radio" value="남성" required>남성</label>
				<label><input name="gender" type="radio" value="여성" required>여성</label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button>가입신청</button>
			</td>
		</tr>
	</table>
</form>
</main>
</body>
</html>