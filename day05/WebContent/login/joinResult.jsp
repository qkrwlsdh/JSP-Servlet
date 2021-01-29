<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
추가처리

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="newbie" class="beans.Member" />
<jsp:setProperty property="*" name="newbie"/>
<%
	ArrayList<Member> list = (ArrayList<Member>)application.getAttribute("list");
	boolean add = list.add(newbie);
	pageContext.setAttribute("add", add);	// 자바스크립트 활성화를 위한 코드
	if(add) {
		response.sendRedirect("/day05");	// 자바에서 직접 페이지 이동
	}
%>
<script>
if(false){
	
	const add = <%=pageContext.getAttribute("add")%>;
	// const add = true;
	if(add){
		alert('도서 추가 성공!');
		location.href = '/day05/';
	}
	else{
		alert('도서 추가 실패!');
		history.go(-1);
	}
}
</script>
</main>
</body>
</html>