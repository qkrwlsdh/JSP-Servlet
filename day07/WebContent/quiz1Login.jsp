<%@page import="java.util.ArrayList"%>
<%@page import="beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz1Login.jsp</title>
</head>
<body>
<%!
	Member[] arr = {
			new Member("test", "1234", "테스트"),
			new Member("root", "1", "관리자"),
			new Member("itbank", "it", "학원")
	};
%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="login" class="beans.Member" />
<jsp:setProperty property="*" name="login"/>
<%
	String storeid = request.getParameter("storeid");
	// 체크박스에 value를 지정하지 않은 상태에서 체크되면 "on", 체크 안되면 null

	for(int i = 0; i < arr.length; i++){
		Member m = arr[i];
		boolean flag1 = m.getUserid().equals(login.getUserid());
		boolean flag2 = m.getUserpw().equals(login.getUserpw());
		
		if(flag1 && flag2){
			session.setAttribute("login", m);
		}
	}
	boolean flag3 = storeid != null;
	
	boolean flag4 = session.getAttribute("login") != null;
	
	Cookie idCookie = new Cookie("userid", login.getUserid());
	idCookie.setMaxAge(flag3 && flag4 ? 68400 : 0);
	response.addCookie(idCookie);
	
	String autologin = request.getParameter("autologin");	// 추가된 체크박스의 값을 받는 변수
	// 자동 로그인 관련 코드 : 체크되어 있지 않으면 평소의 JSESSIONID대로 처리하고, 체크되어 있으면 유효시간 설정한 쿠키로 덮어씌움
	if(autologin != null){		
		Cookie autocookie = new Cookie("JSESSIONID", session.getId());
		autocookie.setMaxAge(86400);
		response.addCookie(autocookie);
	}
	
	response.sendRedirect("quiz1Result.jsp");
%>
</body>
</html>