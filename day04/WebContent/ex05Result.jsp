<%@page import="beans.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05Result.jsp</title>
</head>
<body>
<%!
	Login[] arr = {
			new Login("iu930516", "iu", "이지은"),
			new Login("test", "1234", "테스트"),
			new Login("god", "123", "신")
	};
	public Login login(Login param){
		for(int i = 0; i < arr.length; i++){
			if(param.getUserid().equals(arr[i].getUserid())){
				if(param.getUserpw().equals(arr[i].getUserpw())){
					return arr[i];	// 배열에 있던 객체이므로, 사용자 이름이 포함되어 있다
				}
			}
		}
		return null;
	}
%>
<h1>ex05Result.jsp</h1>
<hr>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="param" class="beans.Login" />
<jsp:setProperty property="*" name="param"/>
<%
	Login result = login(param);

	if(result != null){
		// 결과가 있으면 환영 메시지를 출력하는 Welcome.jsp의 내용을 보여줘라 (주소변경없음, 요청 유지됨)
		String path = "ex05Welcome.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		
		// forward하기 전에 request객체에다가 login메서드의 반환 객체result를 추가해두면
		// welcome페이지에서 객체에 접근하여 이름을 출력할 수 있다
		request.setAttribute("result", result);
		
		rd.forward(request, response);
	}
	else{
		// 일치하는 결과가 없으면 로그인 페이지로 이동시켜라
		response.sendRedirect("ex05Form.jsp");
	}
%>
</body>
</html>