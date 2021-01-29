<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<main>
<h2>도서 추가</h2>

<form action="joinResult.jsp" method="post">
	<table>
		<tr>
			<td>출판사</td>
			<td><input name="company" placeholder="출판사" autofocus required></td>
		</tr>
		<tr>
			<td>도서명</td>
			<td><input name="bookname" placeholder="도서명" required></td>
		</tr>
		<tr>
			<td>출판연도</td>
			<td><input type="number" name="year" placeholder="출판연도" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<button>추가</button>
			</td>
		</tr>
	</table>
</form>
</main>
</body>
</html>