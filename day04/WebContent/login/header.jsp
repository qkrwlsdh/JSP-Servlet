<%@page import="beans.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN Sample</title>
<style type="text/css">
	a{
	text-decoration: none;
	color: inherit;
	display: block;
	}
	a:hover{
	border-bottom: 1px solid black;
	}
	nav{
	display: flex;
	justify-content: center;
	}
	ul{
	list-style: none;
	}
	li{
	display: inline-block;
	text-align: center;
	width: 150px;
	height: 25px;
	font-size: 14pt;
	font-weight: bold;
	}
	h1 > a:hover{
	border: 0;
	}
	.logo{
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	}
</style>
</head>
<body>
<%
	Object ob = application.getAttribute("list");

	if(ob == null) {	// 여기서 list 변수는 제어문 내에서만 접근 가능한 지역변수
		ArrayList<Member> list = new ArrayList<Member>();
		application.setAttribute("list", list);
	}
%>
<header>
	<div class="logo">
		<h1><a href="/day04/">Login Sample</a></h1>
		<div class="login">
			<%
				Member loginSession = (Member)session.getAttribute("login");
				if(loginSession != null) {
					out.print(loginSession.getUsername());
				}
			%>
		</div>
	</div>
	<nav>
		<ul>
			<li><a href="/day04/login/joinForm.jsp">회원가입</a></li>
			<li><a href="/day04/login/memberList.jsp">회원 목록 출력</a></li>
			<%
				boolean log = loginSession != null;
				String loginURL = "/day04/login/loginForm.jsp";
				String logoutURL = "/day04/login/logout.jsp";
			%>
			<li>
				<a href="<%=log ? logoutURL : loginURL %>">
					<%=log ? "로그아웃" : "로그인" %></a>
			</li>
		</ul>
	</nav>
</header>
<hr>
