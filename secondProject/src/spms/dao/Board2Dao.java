package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.Board2Dto;
import spms.dto.MemberDto;

public class Board2Dao {
	private Connection connection;
	String testStr = "이게 출력되면 testStr, testFnc()가 먹혔다는 것";
	String addTestStr = "이게 출력되면 addTestStr, addTestFnc()가 먹혔다는 것";
	
	public void setConnection(Connection conn) {
		this.connection = conn;
	}
	
	public List<Board2Dto> testFnc() throws Exception {
		System.out.println(testStr);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT BNO_2, TITLE_2, WRITER_2, WRITE_DATE_2 FROM BOARD_2";
				sql += " ORDER BY BNO_2 DESC";
		
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<Board2Dto> board2List = new ArrayList<Board2Dto>();

			int bno2 = 0;
			String title2 = "";
			String writer2 = "";
			Date writeDate2 = null;

			while (rs.next()) {
				bno2 = rs.getInt("BNO_2");
				title2 = rs.getString("TITLE_2");
				writer2 = rs.getString("WRITER_2");
				writeDate2 = rs.getDate("WRITE_DATE_2");

				Board2Dto board2Dto = new Board2Dto(bno2, title2, writer2, writeDate2);

				board2List.add(board2Dto);
			}
		return board2List;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
	}
	
	public int addTestFnc(Board2Dto board2Dto) throws Exception {
		System.out.println(addTestStr);
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO BOARD_2 (BNO_2, TITLE_2, WRITER_2, CONTENTS_2, WRITE_DATE_2)";
		sql += " VALUES (BOARD_2_BNO_2_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
		
		try {
			String title2 = board2Dto.getTitle2();
			String contents2 = board2Dto.getContents2();
			String writer2 = board2Dto.getWriter2();
			
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, title2);
			pstmt.setString(2, writer2);
			pstmt.setString(3, contents2);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	// 게시글 상세 정보 조회
	public Board2Dto selectOneTestFnc(int no) throws Exception {

		Board2Dto board2Dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		sql = "SELECT BNO_2, TITLE_2, WRITER_2, CONTENTS_2 FROM BOARD_2";
		sql += " WHERE BNO_2 = ?";

		try {
			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			String title2 = "";
			String writer2 = "";
			String contents2 = "";

			if (rs.next()) {
				title2 = rs.getString("TITLE_2");
				writer2 = rs.getString("WRITER_2");
				contents2 = rs.getString("CONTENTS_2");

				board2Dto = new Board2Dto();

				board2Dto.setBno2(no);
				board2Dto.setTitle2(title2);
				board2Dto.setWriter2(writer2);
				board2Dto.setContents2(contents2);
			} else {
				throw new Exception("해당 번호의 게시글을 찾을 수 없습니다.");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {

			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally 종료
		return board2Dto;
	}
	
	public int updateTestFnc(Board2Dto board2Dto) throws SQLException {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = "";
		sql = "UPDATE BOARD_2 SET TITLE_2 = ?, CONTENTS_2 = ?";
		sql += " WHERE BNO_2 = ?";

		try {
			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, board2Dto.getTitle2());
			pstmt.setString(2, board2Dto.getContents2());
			pstmt.setInt(3, board2Dto.getBno2());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally 종료
		return result;
	}
	
	// 게시글삭제
	public int deleteTestFnc(int bno2) throws SQLException {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = "";
		sql = "DELETE FROM BOARD_2";
		sql += " WHERE BNO_2 = ?";

		try {
			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, bno2);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally 종료

		return result;
	}
}
