<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp - JSTL Core Tag</title>
<style type="text/css">
	.red { color: red; }
</style>
</head>
<body>
<h1 align="center">JSTL Core Tag</h1>
<hr>
<ul align="center">
	<li><strong class="red">c:set</strong> : 변수(attribute)를 선언하거나, 값을 설정한다</li><br>
	<li><strong>c:remove</strong> : 변수의 값을 제거한다</li><br>
	<li><strong class="red">c:if</strong> : 조건을 만족하면 코드를 수행한다</li><br>
	<li><strong class="red">c:choose</strong> : 여러 조건에 따라 다른 처리를 수행한다(switch ~ case)</li><br>
	<li><strong class="red">c:forEach</strong> : 반복 처리를 위해서 사용, 횟수에 의한 반복, 컬렉션으로 반복 가능</li><br>
	<li><strong>c:forTokens</strong> : 구분자로 분리된 각각의 문자열 토큰을 처리한다</li><br>
	<li><strong>c:Import</strong> : url을 지정하여 외부 자원을 가져온다</li><br>
	<li><strong class="red">c:redirect</strong> : response.sendRedirect()와 동일한 기능</li><br>
	<li><strong>c:url</strong> : 문자열을 url형식으로 출력한다</li><br>
	<li><strong>c:out</strong> : 데이터를 출력하는 태그, 표현식이나 표현언어(EL)로 처리 가능</li><br>
	<li><strong>c:catch</strong> : 예외처리에 사용한다</li>
</ul>
</body>
</html>