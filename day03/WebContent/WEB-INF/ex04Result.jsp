<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04Result.jsp</title>
</head>
<body>
<%!
	ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
%>
<%
	request.setCharacterEncoding("UTF-8");

	// 계정을 DB에서 준비할 수 없으니, 대신 컬렉션으로 만들어둔 코드 (수정X)
	HashMap<String, String> account1 = new HashMap<String, String>();
	account1.put("userid", "itbank");
	account1.put("userpw", "it");
	account1.put("username", "아이티뱅크");
	list.add(account1);
	
	HashMap<String, String> account2 = new HashMap<String, String>();
	account2.put("userid", "iu930516");
	account2.put("userpw", "iu");
	account2.put("username", "이지은");
	list.add(account2);
	
	HashMap<String, String> account3 = new HashMap<String, String>();
	account3.put("userid", "test");
	account3.put("userpw", "1234");
	account3.put("username", "테스트");
	list.add(account3);
%>
<%
	// 사용자 입력 파라미터를 전달받는다
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String msg = "로그인 실패";
	
	// 입력받은 내용과 리스트에 일치하는 계정이 있는지 확인한다
	for(int i = 0; i < list.size(); i++){
		if(userid.equals(list.get(i).get("userid")) && userpw.equals(list.get(i).get("userpw"))){
			msg = list.get(i).get("username") + "님 환영합니다";
			break;
		}
	}
	
	// 결과 메시지를 출력
	if("post".equalsIgnoreCase(request.getMethod()) == false){
		msg = "<script>alert('잘못된 접근'); history.go(-1);</script>";
	}
%>
<h2><%=msg %></h2>
</body>
</html>