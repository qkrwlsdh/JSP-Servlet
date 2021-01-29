<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>telephone directory</title>
</head>
<body>
<h1 align="center">Jinoh's telephone directory</h1>
<hr>
<table border="1" cellpadding="10" cellspacing="0" align="center">
	<tr>
		<th>이름</th>
		<th>폰번호</th>
	</tr>
	
<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(driver);
	
	String url = "jdbc:oracle:thin:@localhost:32118:xe";
	String user = "c##itbank";
	String password = "it";
	
	String sql = "select * from phonebook";
	
	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		String name = rs.getString("name");
		String pnum = rs.getString("pnum");
		
		out.print("<tr>");
		out.print("<td>" + name + "</td>");
		out.print("<td>" + pnum + "</td>");
		out.print("</tr>");
	}
	rs.close();
	stmt.close();
	conn.close();
%>
</table>
</body>
</html>