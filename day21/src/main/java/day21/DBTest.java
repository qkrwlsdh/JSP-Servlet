package day21;

import java.sql.*;

public class DBTest {

	public static void main(String[] args) throws Exception {
		String url = "jdbc:oracle:thin:@localhost:32118:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String user = "c##itbank";
		String password = "it";
		String sql = "select * from v$version";
		
		Class.forName(driver);
		
		Connection conn = DriverManager.getConnection(url, user, password);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			System.out.println(rs.getString(1));
		}
		rs.close();
		stmt.close();
		conn.close();
	}
}
