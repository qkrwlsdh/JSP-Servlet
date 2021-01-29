<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
	<h2>도서 삭제 페이지</h2>
	<%!
		public boolean confirm(String str){
			if(str.equalsIgnoreCase("yes")){
				return true;
			}
			return false;
		}
	%>
	<script type="text/javascript">
		const confirm = <%=pageContext.getAttribute("confirm")%>;
		if(confirm){
			alert('삭제 완료');
			local
		}
	</script>
	<%
	ArrayList<Member> list = (ArrayList<Member>)application.getAttribute("list");

	for(int i = 0; i < list.size(); i++){
		Member m = list.get(i);
		//confirm()
		out.print("<p>" + m + "</p>");
	}
%>
</main>
</body>
</html>