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
String zhuceid=(String)request.getParameter("zhuceid"); 

Connection conn=null;
PreparedStatement pst=null;

String sql = "delete from zhuceuser where zhuceid="+zhuceid+"";
conn = GetConnection.getConnection();
pst = conn.prepareStatement(sql);
pst.executeUpdate();

sql = "delete from user where userid="+zhuceid+"";
conn = GetConnection.getConnection();
pst = conn.prepareStatement(sql);
pst.executeUpdate();
%>
<jsp:include page="selectuser.jsp"/>
</body>
</html>