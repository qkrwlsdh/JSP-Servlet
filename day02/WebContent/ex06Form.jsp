<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06Form.jsp</title>
<style>
	div{
	margin: 30px auto;
	padding: 5px;
	border-bottom: 5px solid gray;
	width: 400px;
	}
</style>
</head>
<body>
<h1>여러 파라미터 한번에 처리하기</h1>
<hr>
<form action="ex06Result.jsp">
	<div><input type="text" name="name" placeholder="이름을 입력하세요"></div>
	<div><input type="number" name="age" placeholder="나이를 입력하세요"></div>
	<div>
		<label><input type="radio" name="gender" value="남성">남성</label>
		<label><input type="radio" name="gender" value="여성">여성</label>
	</div>
	<div>
		학습했던 언어를 선택하세요 (중복 선택 가능)
		<p>
			<label><input type="checkbox" name="lang" value="파이썬">파이썬</label>
			<label><input type="checkbox" name="lang" value="C언어">C언어</label>
			<label><input type="checkbox" name="lang" value="자바">자바</label>
			<label><input type="checkbox" name="lang" value="자바스크립트">자바스크립트</label>
		</p>
	</div>
	<div>
		<select name="lastSchool">
			<option>===최종 학력을 선택하세요===</option>
			<option value="초등학교">초등학교</option>
			<option value="중학교">중학교</option>
			<option value="고등학교">고등학교</option>
			<option value="대학교">대학교</option>
			<option value="대학원">대학원</option>
		</select>
	</div>
	<div><input type="submit" value="전송"></div>
</form>
</body>
</html>