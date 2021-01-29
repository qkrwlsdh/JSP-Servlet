<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
<%
	ArrayList<Member> list = (ArrayList<Member>)application.getAttribute("list");

	for(int i = 0; i < list.size(); i++){
		Member m = list.get(i);
		out.print("<p>" + m + "</p>");
	}
%>
</main>
</body>
</html>