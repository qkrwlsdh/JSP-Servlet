package day15;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ImageDAO {
	
	private static ImageDAO instance = new ImageDAO();
	private Connection conn;
	private Context init;
	private DataSource ds;
	
	private ImageDAO() {
		try {
			init = (Context) new InitialContext();
			// 초기 컨텍스트를 구성합니다. 환경 속성을 제공하지 않았습니다. 새 초기 컨텍스트(null)와 동일합니다.
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
			
		} catch(Exception e) {
			System.out.println("생성자 예외 발생 : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
	
	public static ImageDAO getInstance() {
		return instance;
	}

	// 이미지 정보를 DB에 추가
	public int insertImage(ImageDTO dto) {
		String sql = "insert into image "
				+ "(originalFileName, storedFileName) values (?, ?)";
		PreparedStatement pstmt = null;
		int row = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getOriginalFileName());
			pstmt.setString(2, dto.getStoredFileName());
			row = pstmt.executeUpdate();
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return 0;
	}

	// 저장된 이미지의 모든 목록을 가져오는 메서드
	public List<ImageDTO> selectAll() {
		
		String sql = "select * from image order by idx desc";
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<ImageDTO> list = new ArrayList<ImageDTO>();
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ImageDTO dto = new ImageDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				dto.setStoredFileName(rs.getString("storedFileName"));
				list.add(dto);
			}
			return list;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) 	 rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		
		
		return null;
	}

	// 지정한 이미지 하나 불러오는 메서드
	public ImageDTO selectOne(int idx) {
		
		String sql = "select * from image where idx=" + idx;
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ImageDTO dto = new ImageDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				dto.setStoredFileName(rs.getString("storedFileName"));
				return dto;
			}
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) 	 rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		
		
		return null;
	}

	// 이미지에 댓글 달기
	public int insertReply(int imageIdx, String writer, String reply) {
		
		String sql = "insert into imageReply (imageidx, writer, reply) "
				+ "values (?, ?, ?)";
		
		PreparedStatement pstmt = null;
		int row = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, imageIdx);
			pstmt.setString(2, writer);
			pstmt.setString(3, reply);
			row = pstmt.executeUpdate();
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		
		return 0;
	}
	
	
	// 지정한 글 번호에 달린 댓글 목록 가져오기
	public List<ReplyDTO> selectReplyList(int idx) {
		ArrayList<ReplyDTO> replyList = new ArrayList<ReplyDTO>();
		String sql = "select * from imagereply where imageidx=" + idx;
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setImageidx(rs.getInt("imageidx"));
				dto.setReply(rs.getString("reply"));
				dto.setWriter(rs.getString("writer"));
				replyList.add(dto);
			}
			return replyList;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) 	 rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		
		
		
		
		return null;
	}
}















