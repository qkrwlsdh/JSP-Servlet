package phonebook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class PhoneBookDAO {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private PreparedStatement pstmt;	// sql에서 전달할 파라미터의 개수가 많을 때 사용하자
	
	private final String url = "jdbc:oracle:thin:@localhost:32118:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	private final List<String> filterList;
	
	public PhoneBookDAO() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
		String[] filterArr = "가,나,다,라,마,바,사,아,자,차,카,타,파,하,힣".split(",");
		filterList = Arrays.asList(filterArr);
	}
	
	// rs, stmt, conn 닫기 위한 함수
	public void close() {
		try { if(rs != null)	rs.close(); }	catch(Exception e) {}
		try { if(stmt != null)	stmt.close(); }	catch(Exception e) {}
		try { if(conn != null)	conn.close(); }	catch(Exception e) {}
		try { if(pstmt != null)	pstmt.close(); }	catch(Exception e) {}
	}
	
	// 전체목록
	public List<PhoneBookDTO> selectAll(){
		ArrayList<PhoneBookDTO> list = new ArrayList<PhoneBookDTO>();
		String sql = "select * from phonebook order by name";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				PhoneBookDTO dto = new PhoneBookDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPnum(rs.getString("pnum"));
				list.add(dto);
			}
			return list;
			
		} catch (SQLException e) {
			System.out.println("SQLException : " + e);
		} finally {
			close();
		}
		return null;
	}
	
	// 검색
	public List<PhoneBookDTO> selectList(String type, String word){
		String sql = "select * from phonebook where %s like '%%%s%%'";
		// 자바문자열에서 %기호는 서식제어문자(%s, %d, %f 등)의 기호이므로
		// 글자 그대로 %를 사용하려면 %%로 표현한다
		
		sql = String.format(sql, type, word);
		
		ArrayList<PhoneBookDTO> list = new ArrayList<PhoneBookDTO>();
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				PhoneBookDTO dto = new PhoneBookDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPnum(rs.getString("pnum"));
				list.add(dto);
			}
			return list;
			
		} catch (SQLException e) {
			System.out.println("SQLException : " + e);
		} finally {
			close();
		}
		return null;
	}
	
	// 하나 선택
	public PhoneBookDTO selectOne(int idx) {
		PhoneBookDTO dto = null;
		
		String sql = "select * from phonebook where idx=" + idx;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				dto = new PhoneBookDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPnum(rs.getString("pnum"));
				return dto;
			}
		} catch (SQLException e) {
			System.out.println("SQLException : " + e);
		}finally {
			close();
		}
		return dto;
	}

	// 추가
	public int insert(PhoneBookDTO newbie) {
		int row = 0;
		String sql = "insert into phonebook (name, pnum) values (?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newbie.getName());	// setString이면 '' 처리를 자동으로 수행한다
			pstmt.setString(2, newbie.getPnum());	// setInt이면 '' 처리를 수행하지 않는다
			row = pstmt.executeUpdate();			// 배열의 인덱스와 다르게, 1부터 시작한다
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQLException : " + e);
		} finally {
			close();
		}
		return 0;
	}
	
	// 삭제
	public int delete(int idx) {
		int row = 0;
		
		String sql = "delete phonebook where idx=" + idx;
		
		try {
			stmt = conn.createStatement();
			row = stmt.executeUpdate(sql);
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
		} finally {
			close();
		}
		return 0;
	}
	
	// 수정
	public int update(PhoneBookDTO dto) {
		int row = 0;
		String sql = "update phonebook set name=?, pnum=? where idx=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPnum());
			pstmt.setInt(3, dto.getIdx());
			row = pstmt.executeUpdate();
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
		} finally {
			close();
		}
		
		return 0;
	}


	public List<String> getFilterList() {
		return filterList;
	}

	public List<PhoneBookDTO> selectFilterList(String a){
		ArrayList<PhoneBookDTO> list = new ArrayList<PhoneBookDTO>();
		int index = filterList.indexOf(a);
		String b = filterList.get(index + 1);
		
		String sql = "select * from phonebook where name between ? and ? order by name";
		// select * from TABLENAME where COLUMN between A and B
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, b);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PhoneBookDTO dto = new PhoneBookDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPnum(rs.getString("pnum"));
				list.add(dto);
			}
			return list;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
		} finally {
			close();
		}
		return null;
	}
}
