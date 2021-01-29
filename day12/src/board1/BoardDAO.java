package board1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {
	
	private Connection conn;
	private Context init;
	private PreparedStatement pstmt;
	private Statement stmt;
	private DataSource ds;
	private ResultSet rs;
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;	
	}						
	private BoardDAO() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("생성자 예외 발생 : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
	
	// 총 게시글의 개수를 가져오기
	public int selectBoardCount() {
		String sql = "select count(*) from board1";
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				count = rs.getInt(1);
				return count;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return 0;
	}
	
	// 게시글 불러오기 (페이징)
//	public HashMap<String, Object> selectAll(){	// 페이지 값을 전달받지 않았으면
//		return selectAll(1);			// 1페이지를 전달해서 값을 반환해라
//	}
	
	// 전체 출력
	public HashMap<String, Object> selectAll(int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String sql = "select * from board1 " + 
				"where idx between ? and ? " +
				"order by idx desc";
//		String sql = "select * from " + 
//				" (select rownum as st, A.* from" +
//				" (select * from board1 order by idx desc)" +
//				" A where rownum <= %d)" +
//				"where st >= %d";
		
		// 페이징에 필요한 계산
		int boardCount = selectBoardCount();
		final int perPage = 10;		// 한 페이지에 출력하는 글의 개수
		final int perSection = 10;	// 하나의 섹션에서 출력하는 페이지 번호의 개수
		int pageCount = boardCount / perPage;
		pageCount += (boardCount % perPage) == 0 ? 0 : 1;
		
		int first = boardCount - perPage * (page - 1);
		int last = first - (perPage - 1);
		
		int section = (page - 1) / 10;	// (1 ~ 10 : 0), (11 ~ 20 : 1), (21 ~ 30 : 2), ...
		int begin = 10 * section + 1;	// (0, 1), (1, 11), (2, 21)
		int end = begin + perSection - 1;	// (0, 10), (1, 20), (2, 30)
		end = end > pageCount ? pageCount : end;	// 총 페이지수보다 큰 값은 출력하지 않는다
		
		boolean prev = section != 0;	// 이전 섹션으로 이동하는 링크를 출력하는지에 대한 조건
		boolean next = boardCount > perPage * end;	// 다음 섹션으로 이동하는 링크 출력할지에 대한 조건

//		map.put("pageCount", pageCount);	// 1) 총 페이지 개수를 저장
		map.put("section", section);
		map.put("begin", begin);
		map.put("end", end);
		map.put("prev", prev);
		map.put("next", next);
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, last);
			pstmt.setInt(2, first);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setContext(rs.getString("context"));
				dto.setCreationDate(rs.getDate("creationDate"));
				dto.setIdx(rs.getInt("idx"));
				dto.setIpaddr(rs.getString("ipaddr"));
				dto.setTitle(rs.getString("title"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setWriter(rs.getString("writer"));
				list.add(dto);
			}
			map.put("list", list);
			return map;		// 1) 총페이지 개수		2) 불러온 게시글의 리스트
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {}
		}
		return null;
	}
	
	// 추가
	public int insert(BoardDTO newtext) {
		int row = 0;
		
		String sql = "insert into board1 (title, writer, context, creationDate, viewCount, ipaddr) values (?, ?, ?, sysdate, 0, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newtext.getTitle());
			pstmt.setString(2, newtext.getWriter());
			pstmt.setString(3, newtext.getContext());
			pstmt.setString(4, newtext.getIpaddr());
			
			row = pstmt.executeUpdate();
			return row;
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return 0;
	}
	
	// 하나 보여주기
	public BoardDTO selectOne(int idx) {
		BoardDTO dto = null;
		
		String sql = "select * from board1 where idx=" + idx;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContext(rs.getString("context"));
				dto.setViewCount(rs.getInt("viewcount"));
//				int viewCount = dto.setViewCount(rs.getInt("viewcount"));
				
				
				return dto;
			}
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
			
		return dto;
	}
	
	// 조회수
	public int updateViewCount(int idx) {
		String sql = "update board1 set viewcount = viewcount + 1 where idx =" + idx;
		Statement stmt = null;
		int row = 0;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			row = stmt.executeUpdate(sql);
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {				
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return 0;
	}
	
	// 삭제
	public int delete(int idx) {
		int row = 0;
		
		String sql = "delete board1 where idx=" + idx;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			row = stmt.executeUpdate(sql);
			return row;
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return 0;
	}
	
	// 수정
	public int update(BoardDTO dto) {
		int row = 0;
		String sql = "update board1 set title=?, context=? where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContext());
			pstmt.setInt(3, dto.getIdx());
			row = pstmt.executeUpdate();
			return row;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {}
		}
		return 0;
	}
	
}