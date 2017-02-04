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
 * Servlet implementation class I_LoginServlet
 */
@WebServlet("/I_LoginServlet")
public class I_LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public I_LoginServlet() {
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
		String userid=req.getParameter("username");
		String userpassword=req.getParameter("password");
		
		conn = GetConnection.getConnection();
		String sql = "select * from user where userid="+userid+"";
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			User user = null;
			while(rs.next()){
				user = LoginObject.user2User(rs);
			}
			String target = null;
			if(null != user){
				if (user.getUserId().equals(userid)&&user.getUserpassword().equals(userpassword)){
					req.getSession().setAttribute("userid",userid);
					target = "/qiantai/htmls/i-search.jsp";
				}else {
					target = "/qiantai/htmls/i-login.jsp";
				}
			}else{
				target = "/qiantai/htmls/i-login.jsp";
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
