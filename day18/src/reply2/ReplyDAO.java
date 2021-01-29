package reply2;

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

public class ReplyDAO {
	private DataSource ds;
	private Connection conn;
	private Context init;
	private static ReplyDAO instance;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReplyDAO() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch(Exception e) {
			System.out.println("생성자 예외 발생 : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
	
	public static ReplyDAO getInstance() {
		if(instance == null) {
			instance = new ReplyDAO();
		}
		return instance;
	}

	private void close() {
		try {
			if(rs != null) 		rs.close(); 
			if(pstmt != null) 	pstmt.close();
			if(stmt != null) 	stmt.close();
			if(conn != null) 	conn.close();
		} catch(Exception e) {}
	}
	
	public List<ReplyDTO> selectList(int idx){
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		String sql = "select R.*, M.userid, M.username from reply2 R, member2 M" +
			    " where R.writer = M.idx" +
//		        " and R.deleted = 0 " +
		        " and R.boardnum = %d" +
		        " order by R.idx asc";
		
		sql = String.format(sql, idx);
		
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setWriter(rs.getInt("writer"));
				dto.setContext(rs.getString("context"));
				dto.setCreaDate(rs.getDate("creadate"));
				dto.setDeleted(rs.getInt("deleted"));
				dto.setUserid(rs.getString("userid"));
				dto.setUsername(rs.getString("username"));
				list.add(dto);
			}
			return list;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	public int insertReply(ReplyDTO dto) {
		
		String sql = "insert into reply2 (boardNum, writer, context)"
				+ "    values (?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardNum());
			pstmt.setInt(2, dto.getWriter());
			pstmt.setString(3, dto.getContext());
			int row = pstmt.executeUpdate();
			return row;
			
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e);
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteReply(int idx) {
		
		String sql = "update reply2 set deleted=1 where idx=" + idx;
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
