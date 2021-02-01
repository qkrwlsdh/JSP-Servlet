package day21;

import org.apache.commons.dbcp2.BasicDataSource;
import java.sql.*;

public class DataSourceTest1 {
	public static void main(String[] args) throws Exception {
		
		BasicDataSource ds = new BasicDataSource();		// 생성자로 생성하니까 메모리를 자꾸 점유한다
		
		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");	// 속성을 일일이 준비해주기가 번거롭다
		ds.setUrl("jdbc:oracle:thin:@localhost:32118:xe");
		ds.setUsername("c##itbank");
		ds.setPassword("it");
		ds.setMaxTotal(20);
		ds.setMaxIdle(10);
		ds.setMaxWaitMillis(-1);
		
		String sql = "select * from v$version";
		
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			System.out.println(rs.getString(1));
		}
		rs.close();
		stmt.close();
		conn.close();
		ds.close();
	}
}
