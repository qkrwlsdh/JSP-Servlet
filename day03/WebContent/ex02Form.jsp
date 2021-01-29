<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02Form.jsp</title>
</head>
<body>
	<h1>ex02Form.jsp</h1>
	<hr>
	<form action="ex02Result.jsp" method="POST">
	<%-- action의 값이 없으면 대상페이지가 자신이 된다 --%>
	<%-- method의 값이 없으면 기본 전송 방식은 GET방식으로 처리한다 --%>
	
	<%-- GET 방식은 파라미터를 주소창을 통해서 전달한다 (엽서, 카드) --%>
	<%-- POST 방식은 파라미터를 별도의 헤더에 포함하여 전달한다 (봉투에 담아서 전달, 주소창 사용 X) --%>
	
	<%-- GET 방식은 주소값 + 쿼리스트링의 크기가 최대 255자까지 전달 가능 --%>
	<%-- GET (HTTP 1.1)의 경우 최대 2048자까지 전달 가능 --%>
	<%-- 주소창을 통해서 전달하므로, 문자열이 아닌 데이터(바이너리)는 전달하기 힘들다 --%>
	
	<%-- POST 방식은 한번에 전송하는 데이터의 크기에 제한이 없다 --%>
	<%-- POST 방식은 파일데이터도 전송할 수 있다 --%>
	
	<%-- GET 방식에서의 queryString : 서버가 가지는 데이터를 조회하기 위한 참조 자료 --%>
	<%-- POST 방식에서는 전달하는 데이터를 서버에 생성하라는 의미 --%>
	
		<p><input type="text" name="name" placeholder="이름을 입력하세요" required></p>
		<p><input type="number" name="age" placeholder="나이를 입력하세요" required></p>
		<p><input type="submit"></p>
	</form>
</body>
</html>