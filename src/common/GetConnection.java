package common;

import java.sql.*;

public class GetConnection {
       public static final String CLASSNAME="com.mysql.jdbc.Driver";
       public static final String URL="jdbc:mysql://127.0.1.1:3306/qiubeixin?characterEncoding=UTF-8";
       public static final String USER="root";
       public static final String PASSWORD="1111";
       public static Connection conn;
       
       public static Connection getConnection(){
    	   try{
    		   if(null==conn){
    			   Class.forName(CLASSNAME);
    			   conn=DriverManager.getConnection(URL,USER,PASSWORD);
    			   System.out.println("数据库连接成功！");
    		   }
    	   }catch(ClassNotFoundException e){
    		   System.out.println("系统找不到制定类！");
    	   }catch(SQLException e){
    		   System.out.println("数据库连接出现异常！");
    	   }
    	   return conn;
       }
}
