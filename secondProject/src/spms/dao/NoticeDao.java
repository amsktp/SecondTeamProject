package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import spms.dto.MemberDto;
import spms.dto.NoticeDto;

public class NoticeDao {
	
	private Connection connection;

//	주입 -> 의존

	public void setConnection(Connection conn) {
		this.connection = conn;
	}
	
	public int noticeAdd(NoticeDto noticeDto) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			String title = noticeDto.getTitle();
			String writer = noticeDto.getWriter();
			String content = noticeDto.getContents();
			
			String sql = "INSERT INTO NOTICE_BOARD";
			sql +=	" VALUES(NOTICE_BOARD_NNO_SEQ.NEXTVAL,";
			sql +=	" ?, ?, ?,";
			sql +=	" SYSDATE)";
			
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			pstmt.setString(3, content);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
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
	
	public ArrayList<NoticeDto> noticeSelect() {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT";
		sql	+= " NCONTENTS, ntitle, nno, nwriter";
		sql	+= " FROM NOTICE_BOARD";
		
		ArrayList<NoticeDto> noticeList = new ArrayList<NoticeDto>();
		
		try {
						
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				String contents = rs.getString("NCONTENTS");
				int no = rs.getInt("nno");
				String title = rs.getString("ntitle");
				String writer = rs.getString("nwriter");
				
				NoticeDto noticeDto = new NoticeDto();
				
				noticeDto.setContents(contents);
				noticeDto.setNo(no);
				noticeDto.setTitle(title);
				noticeDto.setWriter(writer);
				
				noticeList.add(noticeDto);
			}
		
			} catch (Exception e) {
			// TODO: handle exception
		}
		return noticeList;
	}
	
	public int noticeUpdate(NoticeDto noticeDto ) {

		PreparedStatement pstmt = null;
		int result = 0;

		try {
			
			String contents = noticeDto.getContents();

			String sql = "UPDATE Notice_Board";
			sql += " set NCONTENTS = ?"; 

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, contents);

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
}
