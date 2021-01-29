<%@page import="beans.Account"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05Result.jsp - 로그인 처리 페이지</title>
</head>
<body>
<%!
	ArrayList<Account> list = new ArrayList<Account>();

	public Account login(String userid, String userpw){		// userid, userpw를 전달받아서
		for(int i = 0; i < list.size(); i++){
			Account acc = list.get(i);
			if(acc.getUserid().equals(userid)){			// 계정이 일치하면
				if(acc.getUserpw().equals(userpw)){		// 비밀번호가 일치하면
					return acc;							// 일치하는 계정을 반환한다
				}
			}
		}
		return null;
	}
%>
<%
	list.add(new Account("itbank", "it", "아이티뱅크"));
	list.add(new Account("iu930516", "iu", "이지은"));
	list.add(new Account("test", "1234", "테스트"));
%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String msg;
	
	if("post".equalsIgnoreCase(request.getMethod()) == false){
		msg = "<script>alert('잘못된 접근'); history.go(-1);</script>";
	}
	else{	
		Account acc = login(userid, userpw);
		msg = acc != null ? acc.getUsername() + "님 환영합니다" : "로그인 실패";
	}
%>
<h2><%=msg %></h2>
</body>
</html>