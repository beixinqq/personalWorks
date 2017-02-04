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
        .form-control{
        width:100px;
        }
</style>
</head>
<body>
<div class="col-sm-10 col-sm-offset-0 col-md-11 col-md-offset-1 main a44">

<div class="row">
    <div class="col-lg-10">
    	<div class="panel panel-primary">
    	<div class="panel-heading">
        	<h3 class="panel-title">管理员管理</h3>
        </div>
         <div class="panel-body">
		<table class="table table-striped" >
		<thead>
		<tr>
		<th>管理编号</th>
		<th>姓名</th>
		<th>密码</th>
		<th>联系电话</th>
		<th>邮箱</th>
		<th>操作</th>
		</tr>
	    </thead>
	    <tbody>
		 <%
			Connection conn=null;
			Statement st=null;
			ResultSet rs=null;
			String sql;
			conn = GetConnection.getConnection();
		    sql = "select * from addmanager ";
				try {
					st = conn.createStatement();
					rs = st.executeQuery(sql);
					while(rs.next()){
		    %>

		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><a href="<%=basePath%>houtai/htmls/delemanager.jsp?managerid=<%=rs.getString(1)%>"><input type="submit" value="删除" /></a></td>
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
		</div>
		</div>
    </div>
</div>
<div class="row">
	<div class="col-lg-10">
		<form action="addmanagerServlet" class="navbar-form navbar-right" role="search">
		<div class="form-group">
		<input type="text" style="width:150px;" name="managerid" id="managerid"  onblur="fnmanagerid();" class="form-control" placeholder="请输入管理编号..."/>
		<input type="text"  style="width:150px;" name="managername" id="managername" onblur="fnmanagername();" class="form-control" placeholder="请输入姓名..."/>
		<input type="text"  style="width:150px;" name="managerpassword" id="managerpassword" onblur="fnmanagerpassword();" class="form-control" placeholder="请输入密码..."/>
		<input type="text"  style="width:150px;" name="managertouch" id="managertouch" onblur="fnmanagertouch();" class="form-control" placeholder="请输入联系电话."/>
		<input type="text"   style="width:150px;" name="manageremail" id="manageremail" onblur="fnmanageremail();" class="form-control" placeholder="请输入邮箱."/>
		<button type="submit" class="btn btn-default "  />提交</button>
		<button type="reset" class="btn btn-default " />重置</button>
	     </div>
		</form>
    </div>
</div>
</div>
</body>
</html>
<script type="text/javascript">
  function fn(reg,str){
      if(reg.test(str.value)){
    	  str.style.border="1px solid rgb(1,135,206)";
        return true;
      }else {
    	  str.style.border="1px solid red";
        return false;
      }
  }
  function id(id){
    return document.getElementById(id);
  }
  function fnmanagerid(){
    var zhuceid=id("managerid");
    var reg=/\d{7}/;
    fn(reg,zhuceid);
  }
  function fnmanagername(){
    var zhucename=id("managername");
    var reg=/\W{2,5}/;
    fn(reg,zhucename);
  }
  var zhucepassword=id("managerpassword");
  function fnmanagerpassword(){
    var reg=/\w{7,}/;
    fn(reg,zhucepassword);
  }

function fnmanagertouch(){
  var zhucetouch=id("managertouch");
  var reg=/^1\d{10}$/;
  fn(reg,zhucetouch);
}

function fnmanageremail(){
  var zhuceemail=id("manageremail");
  var reg=/^\w+((-\w+)|(\.\w+))*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
  fn(reg,zhuceemail);
}
</script>
