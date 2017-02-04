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
        	<h3 class="panel-title">库存信息管理</h3>
        </div>
         <div class="panel-body">
		<table class="table table-striped" >
		<thead>
			<tr>
			<th>编号</th>
			<th>商品名称</th>
			<th>商品单价</th>
			<th>图片</th>
			<th>商品产地</th>
			<th>操作</th>
			</tr>
		<thead>
		<tbody>
			 <%
				Connection conn=null;
				Statement st=null;
				ResultSet rs=null;
				String sql;
				conn = GetConnection.getConnection();
			    sql = "select * from stock ";
					try {
						st = conn.createStatement();
						rs = st.executeQuery(sql);
						while(rs.next()){
			    %>

			<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><img src="<%=basePath%>houtai/images/<%=rs.getString(4)%>" width="70" height="70" ></td>
			<td><%=rs.getString(6) %></td>
			<td><a href="<%=basePath%>houtai/htmls/addgoodskuok.jsp?stockid=<%=rs.getString(1)%>&stockname=<%=rs.getString(2)%>&stockprice=<%=rs.getString(3)%>&stockimg=<%=rs.getString(4)%>&stockplace=<%=rs.getString(6)%>"><button type="submit" class="btn btn-default" id="shuliang" onblur="fnshuliang();">输入剩余数量</button></a></td>
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
      function fngoods(){
        var zhucename=id("shuliang");
        var reg=/(\d{1,5}/;
        fn(reg,zhucename);
      }
</script>
