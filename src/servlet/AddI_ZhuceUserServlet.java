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
 * Servlet implementation class AddI_ZhuceUserServlet
 */
@WebServlet("/AddI_ZhuceUserServlet")
public class AddI_ZhuceUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static Connection conn=null;
	PreparedStatement pst=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddI_ZhuceUserServlet() {
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
		String i_zhuceid=req.getParameter("i_zhuceid");
		String i_zhucename=req.getParameter("i_zhucename");
		String i_zhucepassword=req.getParameter("i_zhucepassword");
		String i_zhucetouch=req.getParameter("i_zhucetouch");
		String i_zhuceemail=req.getParameter("i_zhuceemail");
		
		String sql = "insert into zhuceuser values(?,?,?,?,?)";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, i_zhuceid);
			pst.setString(2, i_zhucename);
			pst.setString(3, i_zhucepassword);
			pst.setString(4, i_zhucetouch);
			pst.setString(5, i_zhuceemail);
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/qiantai/htmls/i-login.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/qiantai/htmls/i-zhuce.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
		
		sql = "insert into user values(?,?,?)";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, i_zhuceid);
			pst.setString(2, i_zhucename);
			pst.setString(3, "¿Í»§");
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/qiantai/htmls/i-login.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/qiantai/htmls/i-zhuce.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
		
		
		
		
	}

}
