<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member table의 모든 정보를 웹 페이지에 출력하기</title>
</head>
<body>
<h1>member table의 모든 정보를 웹 페이지에 출력하기</h1>
<hr>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>주민등록번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>성별</th>
	</tr>
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(driver);
	
	String address = "localhost";	// 자기 컴퓨터의 DB 주소를 사용하세요
	String url = "jdbc:oracle:thin:@" + address +":32118:xe";
	String user = "c##itbank";	// oracle 12버전 이후는 일반 계정 앞에 c##을 붙여서 생성한다
	String password = "it";
	String sql = "select * from member";
	// select 쿼리는 ResultSet 을 반환하고
	// insert, update, delete 쿼리는 int를 반환한다 (변경되거나 쿼리문에 영향을 받은 줄의 개수)
	
	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		String idnumber = rs.getString("idnumber");
		String name = rs.getString("name");
		int age = rs.getInt("age");
		String gender = rs.getString("gender");
		
		out.print("<tr>");
		out.print("<td>" + idnumber + "</td>");
		out.print("<td>" + name + "</td>");
		out.print("<td>" + age + "</td>");
		out.print("<td>" + gender + "</td>");
		out.print("</tr>");
	}
	rs.close();
	stmt.close();
	conn.close();

%>

</table>
</body>
</html>











