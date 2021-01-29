package day12;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	private Connection conn;
	private Context init;
	private DataSource ds;
	
	private static DAO instance = new DAO();	// 클래스가 자신을 나타내는 객체 하나를 미리 가지고 있다
	
	public static DAO getInstance() {	// 외부에서는 getInstance를 호출하여 이미 생성된 객체 하나를 반환받는다
		return instance;	// 일반 메서드는 객체 생성 이후 호출할 수 있으나
	}						// 생성자를 접근제한자로 막았기때문에, 객체를 통한 접근이 불가능하다 (클래스메서드로 접근가능)
	
	private DAO() {
		try {
			
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		} catch(Exception e) {
			System.out.println("생성자 예외 발생 : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
	
	public String test() {
		
		String sql = "select * from v$version";
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();		// DataSource가 가지는 여러 Connection 중 idle상태인 객체를 하나 받아온다
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();	// 커넥션 풀로 돌아가서 대기상태로 전환한다
			} catch(Exception e) {}
		}
		return null;
	}
}
