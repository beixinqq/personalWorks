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
    			   System.out.println("���ݿ����ӳɹ���");
    		   }
    	   }catch(ClassNotFoundException e){
    		   System.out.println("ϵͳ�Ҳ����ƶ��࣡");
    	   }catch(SQLException e){
    		   System.out.println("���ݿ����ӳ����쳣��");
    	   }
    	   return conn;
       }
}
