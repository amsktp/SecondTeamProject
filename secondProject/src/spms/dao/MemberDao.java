package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.MemberDto;

public class MemberDao {

	private Connection connection;

//	주입 -> 의존

	public void setConnection(Connection conn) {
		this.connection = conn;
	}

	public List<MemberDto> selectList() throws Exception {
		// TODO Auto-generated method stub

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT MNO, MNAME, EMAIL, CRE_DATE";
		sql += " FROM MEMBER";
		sql += " ORDER BY MNO ASC";

		try {
			pstmt = connection.prepareStatement(sql);

			rs = pstmt.executeQuery();

			ArrayList<MemberDto> memberList = new ArrayList<MemberDto>();

			int no = 0;
			String name = "";
			String email = "";
			Date creDate = null;

			while (rs.next()) {
				no = rs.getInt("mno");
				name = rs.getString("mname");
				email = rs.getString("email");
				creDate = rs.getDate("cre_date");

				MemberDto memberDto = new MemberDto(no, name, email, creDate);

				memberList.add(memberDto);
			}

			return memberList;

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

	public int memberInsert(MemberDto memberDto) throws Exception {

		int result = 0;
		PreparedStatement pstmt = null;

		try {

			String email = memberDto.getEmail();
			String pwd = memberDto.getPassword();
			String name = memberDto.getName();

			String sql = "insert into member";
			sql += " value(mno, email, password, mname, cre_date, mod_date)";
			sql += " values(member_mno_seq.nextval";
			sql += ", ?, ?, ?, sysdate, sysdate)";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);

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

	public int memberDelete(int no) throws Exception {

		PreparedStatement pstmt = null;

		int result = 0;

		try {

			String sql = "delete FROM member";
			sql += " where mno = ?";

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

	public MemberDto memberSelectOne(int no) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberDto memberDto = new MemberDto();

		try {

			String sql = "SELECT MNO, EMAIL, MNAME, CRE_DATE";
			sql += " FROM MEMBER";
			sql += " WHERE MNO = ?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				String name = "";
				String email = "";
				Date creDate = null;

				name = rs.getString("MNAME");
				email = rs.getString("email");
				creDate = rs.getDate("CRE_DATE");

				memberDto.setNo(no);
				memberDto.setName(name);
				memberDto.setEmail(email);
				memberDto.setCreateDate(creDate);

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

		return memberDto;

	}

	public int memberUpdate(MemberDto memberDto) {

		PreparedStatement pstmt = null;
		int result = 0;

		try {

			int no = memberDto.getNo();
			String email = memberDto.getEmail();
			String name = memberDto.getName();

			String sql = "UPDATE MEMBER";
			sql += " SET EMAIL = ?, " + "MNAME =?, MOD_DATE=SYSDATE";
			sql += " WHERE MNO = ?";

			pstmt = connection.prepareStatement(sql);

			pstmt.setString(1, email);
			pstmt.setString(2, name);
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
}
