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
</head>
<body>
<%
String goodsid=(String)request.getParameter("goodsid"); 

Connection conn=null;
PreparedStatement pst=null;

String sql = "delete from goods where goodsid="+goodsid+"";
conn = GetConnection.getConnection();
pst = conn.prepareStatement(sql);
pst.executeUpdate();

sql = "delete from stock where stockid="+goodsid+"";
conn = GetConnection.getConnection();
pst = conn.prepareStatement(sql);
pst.executeUpdate();
%>
<jsp:include page="addgoods.jsp"/>
</body>
</html>