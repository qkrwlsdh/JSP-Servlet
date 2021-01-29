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
	
	String url = "jdbc:oracle:thin:@localhost:32118:xe";
	String user = "c##itbank";
	String password = "it";
	
	String sql = "select * from member";
	
	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
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