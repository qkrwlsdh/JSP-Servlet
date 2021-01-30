package com.itbank.board;

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
	private DataSource ds;
	private Connection conn;
	private Context init;
	private static BoardDAO instance;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// finally 블럭에서 처리할 close() 함수
		private void close() {
			try {
				if(rs != null) 		rs.close(); 
				if(pstmt != null) 	pstmt.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
			} catch(Exception e) {}
		}
		
		private BoardDAO() {
			try {
				init = (Context) new InitialContext();
				ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			} catch(Exception e) {
				System.out.println("생성자 예외 발생 : " + e);
			} finally {
				if(conn != null) try { conn.close(); } catch (Exception e) {}
			}
		}
		
		public static BoardDAO getInstance() {
			if(instance == null) {				// 만약 instance가 없으면
				instance = new BoardDAO();		// 새로 생성해서
			}									// (이미 있으면 생성하지 않음)
			return instance;					// 반환하기
		}
		
		// idx값 중 가장 높은 값을 반환
		private int selectMaxIdx() {
			String sql = "select max(idx) from board2";
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				conn = ds.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("SQL Exception : " + e);
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) 		rs.close(); 
					if(stmt != null) 	stmt.close(); 
					if(conn != null) 	conn.close(); 
				} catch(Exception e) {}
			}
			
			return 0;
		}
		
		// 새 글 작성(작성된 글의 idx를 반환)
		public int insertBoard(BoardDTO dto) {
			String sql = "insert into board2 (title, writer, context, ipaddr, uploadFile) "
					+ "values (?, ?, ?, ?, ?)";
			if(dto.getUploadfile() == null) {
				dto.setUploadfile("default.jpg");
			}
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setInt(2, dto.getWriter());
				pstmt.setString(3, dto.getContext());
				pstmt.setString(4, dto.getIpaddr());
				pstmt.setString(5, dto.getUploadfile());
				
				int row = pstmt.executeUpdate();
				if(row == 1) {
					return selectMaxIdx();
				}
				else {
					return 0;
				}
				
			} catch (SQLException e) {
				System.out.println("SQL Exception : " + e);
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) 	pstmt.close(); 
					if(conn != null) 	conn.close(); 
				} catch(Exception e) {}
			}
			
			return 0;
		}
		
		// 조회수 증가
		public int updateViewCount(int idx) {
			String sql = "update board2 set viewCount = viewCount + 1 where idx = " + idx;
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
					if(stmt != null) 	stmt.close(); 
					if(conn != null) 	conn.close(); 
				} catch(Exception e) {}
			}
			
			return 0;
		}
		
	 	public HashMap<String, Object> selectAll(int page, String type, String word) {
	 		HashMap<String, Object> map = new HashMap<String, Object>();
	 		
//			String sql = "select * from board1 order by idx desc";
	 		
//	 		String sql = "select rownum, board1.* from board1" + 
//	 				"    where idx between %d and %d" + 
//	 				"    order by idx desc";
	 		
	 		// 페이징 쿼리
	 		String sql = "select * from " + 
	 				"    (select rownum as st, A.* from " + 
	 				"        (%s)" + 
	 				"    A where rownum <= %d) " + 
	 				"where st >= %d";
	 		
	 		// 조인 쿼리
	 		String innerSql = "select board2.*, member2.userid, member2.username" +
	 				" from board2, member2" +
	 				" where board2.writer = member2.idx" +
	 				" and board2.deleted = 0" +
	 				" %s" +		// 검색 타입에 따라서, where의 조건절에 내용이 추가되는지 안되는지
	 				" order by board2.idx desc";
	 		
	 		switch(type) {
	 		case "":
	 			innerSql = String.format(innerSql, "");
	 			break;
	 		case "idx":
	 			innerSql = String.format(innerSql, "and board2.idx=" + word);
	 			break;
	 		default:
	 			innerSql = String.format(innerSql, "and " + type + " like '%" + word + "%'");
	 			break;
	 		}
	 		
	 		
	 		int boardCount = selectBoardCount(innerSql);
	 		Paging paging = new Paging(page, boardCount);
	 		
	 		sql = String.format(sql, innerSql, paging.getLast(), paging.getFirst());
	 		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	 		
			try {
				conn = ds.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setContext(rs.getString("context"));
					dto.setDeleted(rs.getInt("deleted"));
					dto.setIdx(rs.getInt("idx"));
					dto.setIpaddr(rs.getString("ipaddr"));
					dto.setTitle(rs.getString("title"));
					dto.setUploadfile(rs.getString("uploadFile"));
					dto.setUserid(rs.getString("userid"));
					dto.setUsername(rs.getString("username"));
					dto.setViewcount(rs.getInt("viewcount"));
					dto.setWriter(rs.getInt("writer"));
					list.add(dto);
				}
				map.put("list", list);
				map.put("paging", paging);
				return map;	// 1) 총페이지 개수 2) 불러온 게시글의 리스트
				
			} catch (SQLException e) {
				System.out.println("SQL Exception : " + e);
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) 		rs.close(); 
					if(pstmt != null) 	pstmt.close(); 
					if(conn != null) 	conn.close(); 
				} catch(Exception e) {}
			}
			return null;
		}
	 	
	 	// 총 게시글의 개수를 가져오기
	 	public int selectBoardCount(String innerSql) {
	 		String sql = "select count(*) from(" + innerSql + ")";
	 		
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
				System.out.println("SQL Exception : " + e);
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) 		rs.close();
					if(stmt != null) 	stmt.close(); 
					if(conn != null) 	conn.close(); 
				} catch(Exception e) {}
			}
			return 0;
	 	}

	 	public BoardDTO selectOne(int idx) {
	 		
	 		String sql = "select * from board2 where idx=" + idx;
	 		
	 		try {
				conn = ds.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setContext(rs.getString("context"));
					dto.setIdx(rs.getInt("idx"));
					dto.setIpaddr(rs.getString("ipaddr"));
					dto.setTitle(rs.getString("title"));
					dto.setViewcount(rs.getInt("viewcount"));
					dto.setWriter(rs.getInt("writer"));
					dto.setUploadfile(rs.getString("uploadFile"));
					return dto;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
	 		return null;
	 	}
	 	
	 	// 글 삭제
	 	public int delete(int idx) {
	 		String sql = "delete board2 where idx=" + idx;
	 		
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
				close();
			}
	 		return 0;
	 }
}
