package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.Board1Dto;
import spms.dto.MemberDto;
import spms.dto.Board1Dto;

public class Board1Dao {

	
	private Connection connection;

//	주입 -> 의존

	public void setConnection(Connection conn) {
		this.connection = conn;
	}
	
	
	public List<Board1Dto> selectList() throws Exception {
		// TODO Auto-generated method stub

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT BNO_1, TITLE_1, WRITER_1, WRITE_DATE_1";
		sql += " FROM Board_1";
		sql += " ORDER BY BNO_1 DESC";

		try {
			pstmt = connection.prepareStatement(sql);

			rs = pstmt.executeQuery();

			ArrayList<Board1Dto> board1List = new ArrayList<Board1Dto>();

			int no = 0;
			String title = "";
			String writer = "";
			Date writeDate = null;

			while (rs.next()) {
				no = rs.getInt("BNO_1");
				title = rs.getString("TITLE_1");
				writer = rs.getString("WRITER_1");
				writeDate = rs.getDate("WRITE_DATE_1");

				Board1Dto board1Dto = new Board1Dto(no, title, writer, writeDate);

				board1List.add(board1Dto);
			}

			return board1List;

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
	
	public int board1Insert(Board1Dto board1Dto) throws Exception {
		// TODO Auto-generated method stub
		
		int result = 0;
		PreparedStatement pstmt = null;

		try {

			String title = board1Dto.getTitle();
			String writer = board1Dto.getWriter();
			String content = board1Dto.getContents();

			String sql = "insert into board_1";
			sql += " value(BNO_1, TITLE_1, WRITER_1, CONTENTS_1, WRITE_DATE_1)";
			sql += " values(Board_1_bno_1_seq.nextval, ?, ?, ?, sysdate)";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			pstmt.setString(3, content);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("여기서 멈춘거야??");
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


	public Board1Dto board1ContentsView(int no) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Board1Dto board1Dto = new Board1Dto();

		try {

			String sql = "SELECT TITLE_1, WRITER_1, CONTENTS_1, WRITE_DATE_1";
			sql += " FROM Board_1";
			sql += " WHERE BNO_1 = ?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				String contents = "";
				String title = "";
				String writer = "";
				Date writeDate = null;

				contents = rs.getString("CONTENTS_1");
				title = rs.getString("TITLE_1");
				writer = rs.getString("WRITER_1");
				writeDate = rs.getDate("WRITE_DATE_1");

				board1Dto.setNo(no);
				board1Dto.setContents(contents);
				board1Dto.setTitle(title);
				board1Dto.setWriteDate(writeDate);
				board1Dto.setWriter(writer);
				
			} else {
				throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
			}
			return board1Dto;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return null;
	}


	public Board1Dto board1SelectOne(int no) {
		// TODO Auto-generated method stub
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Board1Dto board1Dto = new Board1Dto();

		try {

			String sql = "SELECT TITLE_1, CONTENTS_1";
			sql += " FROM BOARD_1";
			sql += " WHERE BNO_1 = ?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				String title = "";
				String contents = "";

				title = rs.getString("TITLE_1");
				contents = rs.getString("CONTENTS_1");

				board1Dto.setNo(no);
				board1Dto.setTitle(title);
				board1Dto.setContents(contents);

			} else {
				throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return board1Dto;
	}
	
	
	public int board1Update(Board1Dto board1Dto) {

		PreparedStatement pstmt = null;
		int result = 0;

		try {

			int no = board1Dto.getNo();
			String title = board1Dto.getTitle();
			String contents = board1Dto.getContents();

			String sql = "UPDATE Board_1";
			sql += " SET TITLE_1 = ?, CONTENTS_1 =?";
			sql += " WHERE BNO_1 = ?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setInt(3, no);

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}


	public int board1Delete(int no) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;

		int result = 0;

		try {

			String sql = "delete FROM Board_1";
			sql += " where BNO_1 = ?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, no);

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
	
	
}
