package spms.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.MemberDao;

@WebServlet(value = "/member/delete")
public class MemberDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Connection conn = null;

		ServletContext sc = this.getServletContext();

		int mNo = Integer.parseInt(req.getParameter("no"));

		System.out.println("회원 번호 : " + mNo + " 삭제를 한다");
		conn = (Connection) sc.getAttribute("conn");

		MemberDao memberDao = new MemberDao();

		memberDao.setConnection(conn);

		try {
			int result = 0;
			
			result = memberDao.memberDelete(mNo);

			if(result == 0) {
				System.out.println("회원 삭제에 실패 했습니다.");
			}
			res.sendRedirect("./list");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("insert into member 수행 실패");
		} 

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost 오버라이딩");

	}

}
