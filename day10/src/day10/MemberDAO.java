package day10;

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
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
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

	// 전체 멤버의 목록을 리스트로 반환하는 함수
	public ArrayList<MemberDTO> selectMemberList() {	// EL Tag 로 참조하기 위해서, ${dao.memberList}
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

	// idNumber를 전달받아서, 해당하는 객체 하나를 반환하는 함수
	public MemberDTO selectOne(String idNumber) {
		String sql = "select * from member where idNumber='%s'";
		sql = String.format(sql, idNumber);
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {	// rs.next()가 처음부터 false면 반환하지 않는다?
				MemberDTO dto = new MemberDTO();
				dto.setAge(rs.getInt("age"));
				dto.setGender(rs.getString("gender"));
				dto.setIdNumber(rs.getString("idNumber"));
				dto.setName(rs.getString("name"));
				return dto;
			}
			
		} catch(SQLException e) {
			System.out.println("SQL Exception : " + e);
		} finally {
			try { if (rs != null) 	{ rs.close(); } } 	catch(Exception e1) {}
			try { if (stmt != null) { stmt.close(); } } catch(Exception e1) {}
			try { if (conn != null) { conn.close(); } } catch(Exception e1) {}
		}
		return null;	// 자바의 메서드는 반환형이 void가 아니라면, 어느조건에서도 값을 반환하는 형태여야 한다
	}

	// idNumber를 전달받아서, 해당하는 객체 하나를 삭제하고, 삭제된 줄 수를 반환하는 함수
	public int delete(String idNumber) {
		String sql = "delete member where idNumber='%s'";
		sql = String.format(sql, idNumber);
		
		try {
			stmt = conn.createStatement();
			int row = stmt.executeUpdate(sql);
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
		} finally {
			try { if (rs != null) 	{ rs.close(); } } 	catch(Exception e1) {}
			try { if (stmt != null) { stmt.close(); } } catch(Exception e1) {}
			try { if (conn != null) { conn.close(); } } catch(Exception e1) {}
		}
		
		return 0;
	}

	// member 객체를 전달받아서, 해당하는 객체를 수정하고, 수정된 줄 수를 반환하는 함수
	public int update(MemberDTO member) {
		String sql = "update member set name='%s', age=%d, gender='%s' where idNumber='%s'";
		sql = String.format(sql, 
				member.getName(), member.getAge(), 
				member.getGender(), member.getIdNumber());
		try {
			stmt = conn.createStatement();
			int row = stmt.executeUpdate(sql);
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
		} finally {
			try { if (rs != null) 	{ rs.close(); } } 	catch(Exception e1) {}
			try { if (stmt != null) { stmt.close(); } } catch(Exception e1) {}
			try { if (conn != null) { conn.close(); } } catch(Exception e1) {}
		}
		return 0;
	}

}








