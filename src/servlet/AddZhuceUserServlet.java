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
 * Servlet implementation class AddZhuceUserServlet
 */
@WebServlet("/AddZhuceUserServlet")
public class AddZhuceUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static Connection conn=null;
	PreparedStatement pst=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddZhuceUserServlet() {
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
		String zhuceid=req.getParameter("zhuceid");
		String zhucename=req.getParameter("zhucename");
		String zhucepassword=req.getParameter("zhucepassword");
		String zhucetouch=req.getParameter("zhucetouch");
		String zhuceemail=req.getParameter("zhuceemail");
		
		String sql = "insert into zhuceuser values(?,?,?,?,?)";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, zhuceid);
			pst.setString(2, zhucename);
			pst.setString(3, zhucepassword);
			pst.setString(4, zhucetouch);
			pst.setString(5, zhuceemail);
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/qiantai/htmls/login.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/qiantai/htmls/zhuce.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
		
		sql = "insert into user values(?,?,?)";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, zhucetouch);
			pst.setString(2, zhucepassword);
			pst.setString(3, "¿Í»§");
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/qiantai/htmls/login.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/qiantai/htmls/zhuce.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
		
	}

}
