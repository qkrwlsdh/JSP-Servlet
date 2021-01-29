<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<main>
	<%
		String userID = null;
		if(session.getAttribute("login") != null){
	%>
	<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST" enctype="multipart/form-data">
	<%--
		1) GET방식으로 파라미터만 전송되면, 주소창을 통해서 queryString의 형식으로 전달한다
		
		2) POST방식으로 파라미터만 전송되면, HTTP request Header를 통해서 파라미터가 전송된다
		
		3) 파일을 전송할 때는 HTTP request body에 바이너리 데이터의 형식으로 파일이 전송된다
		
		-> request를 통해서 파라미터를 처리할 수 없다
		-> <jsp:setProperty>를 이용한 파라미터 처리가 불가능하다
		-> <jsp:setProperty>는 사용자 입력값을 객체 형식으로 처리하기 위한 방법
		-> 직접 객체를 만들어서 DAO에게 전송하면 된다
		-> MultiPartRequest 객체를 생성해서, 나머지 문자열 파라미터를 받아야 한다
		-> MultiPartRequest 객체를 생성하기 위해서는 request 객체가 필요하기 때문에, request를 생성자에 전달
		-> 파일 전송시에는, MultiPartRequest 객체를 생성하는 것 만으로 파일이 지정한 위치에 업로드된다
	 --%>
		<input type="hidden" name="ipaddr" value="${pageContext.request.remoteAddr }">
		<input type="hidden" name="writer" placeholder="작성자를 입력하세요" value="${login.idx }">
		<div class="viewBoard">
			<p class="boardTitle"><input type="text" name="title" placeholder="제목을 입력하세요" autofocus required></p>
			<p>작성자 : <%=((MemberDTO)session.getAttribute("login")).getUsername() %></p>
			<div class="boardContext">
				<textarea name="context" placeholder="내용을 작성하세요"></textarea>
			</div>
			<p><input type="file" name="uploadFile"></p>
		</div>
		<div class="wrap">
			<div>
				<input type="button" value="돌아가기" class="btn" onclick="history.go(-1)">
			</div>
			<div>
				<input type="submit" value="작성" class="btn">
			</div>
		</div>
	</form>
	</c:if>
	<%
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	%>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		
		<jsp:useBean id="fileUpload" class="board2.FileUpload" />
		<c:set var="dto" value="${fileUpload.getBoardDTO(pageContext.request) }"/>
		<c:set var="idx" value="${boardDAO.insertBoard(dto) }" />
		<c:redirect url="/view.jsp?idx=${idx }&page=1" />
		
	</c:if>
</main>
<%@ include file="footer.jsp" %>







