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
        .a11{
        margin-top:12px;}
		.a22{
		margin-bottom:10px;}
		.a44{
        margin-top:-70px;}
</style>
</head>
<body>
<%
String stockid=(String)request.getParameter("stockid");
String stockname=(String)request.getParameter("stockname");
String stockprice=(String)request.getParameter("stockprice");
String stockimg=(String)request.getParameter("stockimg");
String stockplace=(String)request.getParameter("stockplace");
%>
<div class="col-sm-8 col-sm-offset-4 col-md-4 col-md-offset-8s main a44">

<div class="row">
    <div class="col-lg-10">
    	<div class="panel panel-primary">
    	<div class="panel-heading">
        	<h3 class="panel-title">库存信息管理剩余数量</h3>
        </div>
		<form action="addstockServlet">
		<input type="text" name="stockid" id="stockid" class="form-control a11" value="<%=stockid%>" readonly /><br />
		<input type="text" name="stockname" id="stockname" class="form-control" value="<%=stockname%>" readonly /><br />
		<input type="text" name="stockprice" id="stockprice" class="form-control" value="<%=stockprice%>" readonly /><br />
		<input type="text" name="stockimg" id="stockimg" class="form-control" value="<%=stockimg%>" readonly /><br />
		<input type="text" name="stocknumber" id="stocknumber"  class="form-control"  onblur="fnshuliang();" placeholder="请输入剩余数量 "/><br />
		<input type="text" name="stockplace" id="stockplace" class="form-control" value="<%=stockplace%>" readonly /><br />
		<button type="submit" class="form-control a22" value="添加">正确</button>
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
      function fnshuliang(){
        var zhucename=id("stocknumber");
        var reg=/\d{1,5}/;
        fn(reg,zhucename);
      }
</script>
