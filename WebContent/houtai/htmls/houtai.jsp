<%@ page language="java" import="java.util.*,jbean.*,java.sql.*,common.*,servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
 <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>后台管理系统</title>
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
		.a33{
			position:fixed;
			}
			span1{
			font-size:80px;
			height:40px;
			}
</style>

</head>

<body>

<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
<div class="container-fluid">
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
<span class="sr-only">Toggle navigation</span>
</button>
<a class="navbar-brand" href="#"><span class="pan1">掌上超市购物商城后台管理系统</span></a>
</div>

<!--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

<form class="navbar-form navbar-right" role="search">
<div class="form-group">
<input type="text" class="form-control" placeholder="用户名...">
<input type="text" class="form-control" placeholder="密码...">
</div>
<button type="submit" class="btn btn-default">登录</button>
</form>
</div>-->
</div>
</nav>


<div class="container-fluid">
<div class="row">


<div class="col-sm-3 col-md-2 sidebar">
    <ul class="nav nav-sidebar">
        <li><a href="<%=basePath%>houtai/htmls/addmanager.jsp" target="houtai">管理员管理</a></li>
        <li><a href="<%=basePath%>houtai/htmls/selectuser.jsp" target="houtai">用户信息管理</a></li>
        <li><a href="<%=basePath%>houtai/htmls/addgoods.jsp" target="houtai">商品基本信息管理</a></li>       
        <li><a href="<%=basePath%>houtai/htmls/addgoodsku.jsp" target="houtai">库存信息管理</a></li>
    </ul>
</div>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main a33">	
	<h2 class="page-header">管理控制台</h2>
     <div class="row">
   <!-- --------------------------------------------------------------------------------------------------------->
    
     <iframe  id="houtai" name="houtai" title="houtai" width="1150" height="490" style="border:none;" src="<%=basePath%>houtai/htmls/addgoods.jsp">
      <!--管理员管理-->
     <!--用户信息管理-->
     <!--商品基本信息管理-->
     <!--库存信息管理--> 
     
     </iframe>
   

   <!-- --------------------------------------------------------------------------------------------------------->
     </div>
 </div>	

      </div>



<script src="<%=basePath%>houtai/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>houtai/js/bootstrap.min.js"></script>

</body>
</html>

