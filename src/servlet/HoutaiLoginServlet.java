package servlet;

import java.io.*;
import java.sql.*;

import common.*;
import jbean.*;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HoutaiLoginServlet
 */
@WebServlet("/HoutaiLoginServlet")
public class HoutaiLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HoutaiLoginServlet() {
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
		String managerpassword=req.getParameter("managerpassword");
		
		conn = GetConnection.getConnection();
		String sql = "select * from manager where managerid="+managerid+"";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			Manager manager = null;
			while(rs.next()){
				manager = LoginObject.manager2Manager(rs);
			}
			String target = null;
			if(null != manager){
				if (manager.getManagerid().equals(managerid)&&manager.getManagerpassword().equals(managerpassword)){
					req.getSession().setAttribute("managerid",managerid);
					target = "/houtai/htmls/houtai.jsp";
				}else {
					target = "/houtai/index.jsp";
				}
			}else{
				target = "/houtai/index.jsp";
			}
			req.getRequestDispatcher(target).forward(req, resp);
		} catch (NumberFormatException e) {
			System.out.println("目标字符串不能转换成Long型数值!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("数据库操作出现异常!");
			e.printStackTrace();
		}
		
		
	}

}
