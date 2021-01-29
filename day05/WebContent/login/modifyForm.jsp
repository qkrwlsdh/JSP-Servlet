<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
<h2>도서 수정</h2>
<form action="modifyResult.jsp" method="post">
	<table>
		<tr>
			<td>수정할 도서명</td>
			<td><input name="bookname" placeholder="도서명" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<button>검색</button>
			</td>
		</tr>
	</table>
</form>
<hr>
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