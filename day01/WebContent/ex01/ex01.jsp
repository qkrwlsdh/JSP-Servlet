<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

	<ul>
		<li>
			<p>&lt;%@ %> : directive, 지시자</p>
			<p>page, 언어, 인코딩, import 등을 처리한다</p>
			<p>include, 다른 JSP를 문서에 포함시키는 기능</p>
			<p>taglib, 외부 라이브러리를 불러올 때, JSTL</p>
		</li>		
		<li>
			<p>&lt;%! %> : declaration, 선언부<p>
			<p>변수의 선언이나, 함수의 정의를 수행할 수 있고, 제어문은 사용불가능</p>
			<p>자바 클래스에서 멤버 필드나 멤버 메서드를 선언하는 영역</p>
		</li>
		<li>
			<p>&lt;% %> : scriptlet, 스크립틀릿</p>
			<p>메인함수에서 작성하는 것과 같이, 자바 코드 진행을 작성한다</p>
		</li>
		<li>
			<p>&lt;%= %> : expression, 표현식</p>
			<p>자바 객체의 값을 HTML에 출력하기 위한 문법 (out.print() 와 동일함)</p>
		</li>
		<li>
			<p>&lt;%-- --%> : comment, JSP 주석</p>
			<p>자바 코드에서 /* */ 로 처리되는 주석, HTML에는 포함되지 않는다.</p>
		</li>
	</ul>
	
	<!-- HTML주석 : 브라우저에 노출된다 -->
	<%-- JSP주석 : 브라우저에 노출되지 않는다 --%>

</body>
</html>