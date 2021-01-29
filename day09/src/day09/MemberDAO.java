package day09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {	// Database Access Object
	
	private Connection conn;	// DB와의 연결정보를 저장하는 객체
	private Statement stmt;		// 연결 상태를 가지고 있고 sql를 전달할 수 있는 객체
	private ResultSet rs;		// sql을 수행한 이후의 결과를 담고 있는 객체
	
	private final String url = "jdbc:oracle:thin:@localhost:32118:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 클래스를 로드할 수 없습니다 : " + e);
		} catch (SQLException e) {
			System.out.println("지정된 DB에 접속할 수 없습니다 : " + e);
		}
	}

	public ArrayList<MemberDTO> getMemberList() {	// EL Tag 로 참조하기 위해서, ${dao.memberList}
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from member";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);		// select문이므로 반환값이 ResultSet
//			int row = stmt.executeUpdate(sql);	// select가 아니면 반환값이 int
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setAge(rs.getInt("age"));
				dto.setGender(rs.getString("gender"));
				dto.setIdNumber(rs.getString("idnumber"));
				dto.setName(rs.getString("name"));
				list.add(dto);
			}
			return list;
			
		} catch (SQLException e) {
			System.out.println("SQL 예외 발생 : " + e);
			
		} catch (NullPointerException e) {
			System.out.println("널 포인터 : " + e);
			e.printStackTrace(); 	// 예외가 어떻게 발생했는지 순서대로 보여준다
			
		} finally {
			try { if (rs != null) 	{ rs.close(); } } 	catch(Exception e1) {}
			try { if (stmt != null) { stmt.close(); } } catch(Exception e1) {}
			try { if (conn != null) { conn.close(); } } catch(Exception e1) {}
		}
		return null;
	}

	// 입력받은 데이터를 DB에 추가하는 함수
	public int insertMember(MemberDTO dto) {
		
		String sql = "insert into member values ('%s', '%s', %d, '%s')";
		sql = String.format(sql, dto.getIdNumber(), dto.getName(), dto.getAge(), dto.getGender());
		
		try {
			stmt = conn.createStatement();
			int row = stmt.executeUpdate(sql);
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
		} catch (NullPointerException e) {
			System.out.println("널 포인터 : " + e);
			e.printStackTrace(); 	// 예외가 어떻게 발생했는지 순서대로 보여준다
			
		} finally {
			try { if (rs != null) 	{ rs.close(); } } 	catch(Exception e1) {}
			try { if (stmt != null) { stmt.close(); } } catch(Exception e1) {}
			try { if (conn != null) { conn.close(); } } catch(Exception e1) {}
		}
		return 0;
	}

}








