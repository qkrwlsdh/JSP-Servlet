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
	// 회원정보에 이름이 없으면 별로니까, 이름도 넣어야 하는데
	// 입력에는 이름이 없으니까, 자바 빈즈를 써야겠다 -> Member.java
	
	Member[] arr = {	// 생성자 오버로딩 했으니, 객체를 배열로 만들어야지
			new Member("test", "1234", "테스트"),
			new Member("root", "1", "관리자"),
			new Member("itbank", "it", "학원")
	};
	// 만약 회원가입 기능을 구현해야 했다면 이렇게 썼을 것
//	ArrayList<Member> list = new ArrayList<Member>(Arrays.asList(arr));
%>
<% request.setCharacterEncoding("UTF-8");	// 빈즈로 입력받을건데, POST니깐 인코딩 설정해야지 %>
<jsp:useBean id="login" class="beans.Member" />
<jsp:setProperty property="*" name="login"/>
<%
	String storeid = request.getParameter("storeid");	// 빈즈에는 체크박스 항목이 없으니 별도로 받자

	for(int i = 0; i < arr.length; i++){	// 배열의 멤버들을 대상으로 반복문
		Member m = arr[i];					// 각각의 멤버를 m이라고 하면
		boolean flag1 = m.getUserid().equals(login.getUserid());
		// 입력받은 ID와 저장된 멤버의 ID가 같은가? : flag1
		boolean flag2 = m.getUserpw().equals(login.getUserpw());
		// 입력받은 PW와 저장된 멤버의 PW가 같은가? : flag2
		
		if(flag1 && flag2){		// 아이디와 비번이 일치하면
			session.setAttribute("login", m);	// 계정 정보를 세션에 저장하자 (로그인)
		}
	}
	boolean flag3 = storeid != null;
	// 체크박스에 체크했다면 null이 아니겠지 -> flag3
	
	boolean flag4 = session.getAttribute("login") != null;
	// 로그인 성공했다면 세션의 login이 null이 아니겠지 -> flag4
	
	Cookie idcookie = new Cookie("userid", login.getUserid());
	// 쿠키를 만들고 ID를 담는다
	
	idcookie.setMaxAge(flag3 && flag4 ? 68400 : 0);
	// 로그인 성공 && 체크박스 체크 => 시간은 일주일, 아니면 0
	
	response.addCookie(idcookie);
	// 응답에 실어서 보내면, 다음 요청때 돌아오겠지
	
	response.sendRedirect("quiz1Result.jsp");
	// 나머지는 quiz1Result.jsp에서 처리하자
%>
</body>
</html>