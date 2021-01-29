<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-form.jsp : 파일 업로드</title>
</head>
<body>

<h1>ex01-form.jsp : 파일 업로드</h1>
<hr>

<form action="ex01-result.jsp" method="POST"
      enctype="multipart/form-data">
    <%--form의 내부에 input type="file" 이 있다면 enctype 을 반드시 지정해라 --%>
      
    <p><input type="text" name="name" placeholder="그림 이름"></p>
	<p><input type="file" name="uploadFile"></p>
	<p><input type="submit" value="전송"></p>
</form>

</body>
</html>