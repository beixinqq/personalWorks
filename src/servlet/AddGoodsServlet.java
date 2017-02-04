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
 * Servlet implementation class AddGoodsServlet
 */
@WebServlet("/AddGoodsServlet")
public class AddGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static Connection conn=null;
	PreparedStatement pst=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGoodsServlet() {
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
		String goodsid=req.getParameter("goodsid");
		String goodsname=req.getParameter("goodsname");
		String goodsprice=req.getParameter("goodsprice");
		String goodsimg=req.getParameter("goodsimg");
		String goodstime=req.getParameter("goodstime");
		String goodsplace=req.getParameter("goodsplace");
		
		String sql = "insert into goods values(?,?,?,?,?,?)";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, goodsid);
			pst.setString(2, goodsname);
			pst.setString(3, goodsprice);
			pst.setString(4, goodsimg);
			pst.setString(5, goodstime);
			pst.setString(6, goodsplace);
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/houtai/htmls/addgoods.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/houtai/htmls/addgoods.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
		
		
	    sql = "insert into stock values(?,?,?,?,?,?)";
		conn = GetConnection.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, goodsid);
			pst.setString(2, goodsname);
			pst.setString(3, goodsprice);
			pst.setString(4, goodsimg);
			pst.setString(5, null);
			pst.setString(6, goodsplace);
			int row = pst.executeUpdate();
			if(row>0)
			{
				req.getRequestDispatcher("/houtai/htmls/addgoods.jsp").forward(req, resp);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			req.getRequestDispatcher("/houtai/htmls/addgoods.jsp").forward(req, resp);
			e1.printStackTrace();
		}
		
		
	}

}
