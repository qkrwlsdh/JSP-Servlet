<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
검색 결과

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="search" class="beans.Member" />
<jsp:setProperty property="*" name="search"/>

<%
	ArrayList<Member> list = (ArrayList<Member>)application.getAttribute("list");

	for(int i = 0; i < list.size(); i++){
		Member m = list.get(i);
		if(m.getBookname().contains(search.getBookname())){
			if(m.getBookname().equalsIgnoreCase(search.getBookname())){
			out.print("<p>" + m + "</p>");
			}
		}
	}
%>
</main>
</body>
</html>