<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>naverForm.jsp</title>
</head>
<body>
<h1>NAVER</h1>
<form action="naverResult.jsp">
	아이디
	<div><input type="text" name="id" placeholder="@naver.com" required></div>
	비밀번호
	<div><input type="password" name="pw" required></div>
	비밀번호 재확인
	<div><input type="password" name="checkpw" required></div>
	<br>
	이름
	<div><input type="text" name="name" required></div>
	생년월일
	<span>
		<label><input type="number" name="birYear" placeholder="년(4자)" required></label>
		<label><select name="birMonth" required>		
			<option value="월">월</option>
			<%
				for(int i = 1; i <= 12; i++){
					out.print("<option>" + i + "월</option>");
				}
			%>
		</select></label>
		<label><input type="number" name="birDay" placeholder="일" required></label>
	</span>
	<br><br>
	성별
	<div>
		<select name="gender" required>
			<option value="성별">성별</option>
			<option value="남성">남성</option>
			<option value="여성">여성</option>
		</select>
	</div>
	본인 확인 이메일(선택)
	<div>
		<input type="text" name="email" placeholder="선택입력">
	</div>
	<br>
	
	휴대전화
	<div>
		<p><select name="country" required>
			<option value="대한민국 +82">대한민국 +82</option>
			<option value="일본 +81">일본 +81</option>
			<option value="중국 +80">중국 +80</option>
		</select></p>
		<p><input type="number" name="pnum" placeholder="전화번호 입력" required></p>
	</div>
	<div><input type="submit" value="가입하기"></div>
</form>
</body>
</html>