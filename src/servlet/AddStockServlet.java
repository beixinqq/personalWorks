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
 * Servlet implementation class AddStockServlet
 */
@WebServlet("/AddStockServlet")
public class AddStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static Connection conn=null;
	PreparedStatement pst=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStockServlet() {
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
		String stocknumber=req.getParameter("stocknumber");
		String stockid=req.getParameter("stockid");
		String sql = "update stock set stocknumber=? where stockid=?";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, stocknumber);
			pst.setString(2, stockid);
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/houtai/htmls/addgoodsku.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/houtai/htmls/addgoodskuok.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
	}

}
