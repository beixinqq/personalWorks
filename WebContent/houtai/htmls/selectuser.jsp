<%@ page language="java" import="java.util.*,jbean.*,java.sql.*,common.*,servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<style>
        body {
            padding-top: 50px;
            padding-bottom: 40px;
            color: #5a5a5a;
        }
.sidebar {
            position: fixed;
            top: 51px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto;
            background-color: #ddd;
            border-right: 1px solid #eee;
        }

        .nav-sidebar {
            margin-right: -21px;
            margin-bottom: 20px;
            margin-left: -20px;
        }

        .nav-sidebar > li > a {
            padding-right: 20px;
            padding-left: 20px;
        }

        .nav-sidebar > .active > a,
        .nav-sidebar > .active > a:hover,
        .nav-sidebar > .active > a:focus {
            color: #fff;
            background-color: #428bca;
        }

        .main {
            padding: 20px;
        }

        .main .page-header {
            margin-top: 0;
        }
        .a44{
        margin-left:-10px;
        margin-top:-70px;}
</style>
</head>
<body>
<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main a44">	
    
<div class="row">
    <div class="col-lg-10">    
    	<div class="panel panel-primary">
    	<div class="panel-heading">
        	<h3 class="panel-title">客户信息管理</h3>
        </div>
         <div class="panel-body">
		<table class="table table-striped" >
		<thead>	
		<tr>
		<td>用户名</td>
		<td>真实名字</td>
		<td>密码</td>
		<td>联系电话</td>
		<td>电子邮箱</td>
		<td>操作</td>
		</tr>
		</thead>
		<tbody>	
		 <%
			Connection conn=null;
			Statement st=null;
			ResultSet rs=null;
			String sql;
			conn = GetConnection.getConnection();
		    sql = "select * from zhuceuser ";
				try {
					st = conn.createStatement();
					rs = st.executeQuery(sql);
					while(rs.next()){
		    %>	

		<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><a href="<%=basePath%>houtai/htmls/deleuser.jsp?zhuceid=<%=rs.getString(1)%>"><input type="submit" value="删除" /></a></td>
		</tr>

		 <%
			}
					}
					catch (SQLException e) {
					System.out.println("数据库操作出现异常");
					e.printStackTrace();
				}

			%>


		</tbody>
		</table>
</body>
</html>