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
<div class="col-sm-10 col-sm-offset-2 col-md-11 col-md-offset-1 main a44">

<div class="row">
    <div class="col-lg-10">
    	<div class="panel panel-primary">
    	<div class="panel-heading">
        	<h3 class="panel-title">商品基本信息管理</h3>
        </div>
         <div class="panel-body">
			<table  class="table table-striped" >
			<thead>
			<tr>
			<th>编号</th>
			<th>商品名称</th>
			<th>商品单价</th>
			<th>图片</th>
			<th>上架时间</th>
			<th>商品产地</th>
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
			    sql = "select * from goods ";
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
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><a href="<%=basePath%>houtai/htmls/delegoods.jsp?goodsid=<%=rs.getString(1)%>"><input type="submit" value="删除" /></a></td>
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
            <div class="row">
	<div class="col-lg-10">
    <form action="addgoodsServlet" class="navbar-form navbar-right" role="search">
    <div class="form-group">
	<input type="text" style="width:110px;" name="goodsid" id="goodsid"  onblur="fngoodsid();"  class="form-control" placeholder="商品编号"/>
	<input type="text" style="width:220px;" name="goodsname" id="goodsname" onblur="fngoodsname();"   class="form-control" placeholder="商品名称"/>
	<input type="text" style="width:100px;" name="goodsprice" id="goods" onblur="fngoods();"  class="form-control" placeholder="商品单价"/>
	<input type="file" style="width:200px;" name="goodsimg" id="goodsimg"  onblur="fngoodsimg();" class="form-control" placeholder="图片"/>
	<input type="date" style="width:150px;" name="goodstime" id="goodstime" onblur="fngoodstime();" class="form-control" placeholder="上架时间"/>
	<input type="text" style="width:80px;" name="goodsplace" id="goodsplace" onblur="fngoodsplace();"   class="form-control" placeholder="商品产地"/>
	<button  type="submit" value="提交"  class="form-control" />提交</button>
	<button type="reset" value="重置"  class="form-control" />重置</button>
	  </div>
	</form>
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
    function fngoodsid(){
      var zhuceid=id("goodsid");
      var reg=/\d{3,5}/;
      fn(reg,zhuceid);
    }
    function fngoodsname(){
      var goodsname=id("goodsname");
        var reg=/\d{3,20}/;
        fn(reg,goodsname);
    }
    function fngoods(){
      var zhucename=id("goods");
      var reg=/(\d+)[.](\d+)/;
      fn(reg,zhucename);
    }


  function fngoodsplace(){
    var goodsplace=id("goodsplace");
    var reg=/\W{2,5}/;
    fn(reg,goodsplace);
  }


</script>
