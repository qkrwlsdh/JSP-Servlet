package day10_phoneNum;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private final String url = "jdbc:oracle:thin:@localhost:32118:xe";
	private final String user = "c##itbank";
	private final String password = "it";

	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 클래스를 로드할 수 없습니다 : " + e);
		} catch (SQLException e) {
			System.out.println("지정된 DB에 접속할 수 없습니다 : " + e);
		}
	}
	public ArrayList<MemberDTO> getMemberList(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from phonebook";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setPnum(rs.getString("pnum"));
				list.add(dto);
			}
			return list;
			
		} catch (SQLException e) {
			System.out.println("SQL 예외 발생 : " + e);
		} catch (NullPointerException e) {
			System.out.println("널 포인터 : " + e);
		} finally {
			try { if(rs != null)	{ rs.close(); } }	catch(Exception e1) {}
			try { if(stmt != null)	{ stmt.close(); } }	catch(Exception e1) {}
			try { if(conn != null)	{ conn.close(); } }	catch(Exception e1) {}
		}
		return null;
	}
	
	// 입력받은 데이터를 DB에 추가
	public int insertMember(MemberDTO dto) {
		String sql = "insert into member values ('%s', '%s')";
		
		return 0;
	}
}
