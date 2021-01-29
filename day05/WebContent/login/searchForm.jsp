<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
	<h2>도서 검색</h2>
	<form action="searchResult.jsp" method="post">
	<table>
		<tr>
			<td>도서명</td>
			<td><input name="bookname" placeholder="도서명" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<button>검색</button>
			</td>
		</tr>
	</table>
</form>
</main>
</body>
</html>