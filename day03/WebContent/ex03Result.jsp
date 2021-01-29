<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03Result.jsp</title>
</head>
<body>
<h1>ex03Result.jsp</h1>
<hr>
<%
	request.setCharacterEncoding("UTF-8");

	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");

	String id1 = "itbank", pw1 = "it", name1 = "아이티뱅크";
	String msg = "로그인 실패";
	
	if(id1.equals(userid) && pw1.equals(userpw)){
		msg = name1 + "님 안녕하세요";
	}

	if("post".equalsIgnoreCase(request.getMethod()) == false){
		// response.sendRedirect("ex03Form.jsp");
		%><script>
			alert('잘못된 접근입니다');
			history.go(-1);
		</script><%
	}
%>
<h2><%=msg %></h2>
</body>
</html>