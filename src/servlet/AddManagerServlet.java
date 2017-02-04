package servlet;

import common.*;
import jbean.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddManagerServlet
 */
@WebServlet("/AddManagerServlet")
public class AddManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public static Connection conn=null;
	PreparedStatement pst=null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		doPost(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
		req.setCharacterEncoding("utf-8");
		String managerid=req.getParameter("managerid");
		String managername=req.getParameter("managername");
		String managerpassword=req.getParameter("managerpassword");
		String managertouch=req.getParameter("managertouch");
		String manageremail=req.getParameter("manageremail");
		
		String sql = "insert into addmanager values(?,?,?,?,?)";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, managerid);
			pst.setString(2, managername);
			pst.setString(3, managerpassword);
			pst.setString(4, managertouch);
			pst.setString(5, manageremail);
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/houtai/htmls/addmanager.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/houtai/htmls/addmanager.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
	
		
		
		sql = "insert into manager values(?,?,?)";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, managerid);
			pst.setString(2, managerpassword);
			pst.setString(3, "¹ÜÀíÔ±");
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/houtai/htmls/addmanager.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/houtai/htmls/addmanager.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
	
	
	}

}
