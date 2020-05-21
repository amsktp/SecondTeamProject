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
	
	public ArrayList<NoticeDto> noticeSelect() {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT";
		sql	+= " NCONTENTS";
		sql	+= " FROM NOTICE_BOARD";
		
		ArrayList<NoticeDto> noticeList = new ArrayList<NoticeDto>();
		
		try {
						
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				String contents = rs.getString("NCONTENTS");
				
				NoticeDto noticeDto = new NoticeDto();
				noticeDto.setContents(contents);
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
