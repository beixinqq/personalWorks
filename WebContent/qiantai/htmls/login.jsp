<%@ page language="java" import="java.util.*,jbean.*,java.sql.*,common.*,servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>掌上超市购物商城</title>
    <link href="<%=basePath%>css/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <link media="all" href="<%=basePath%>css/login.css" rel="stylesheet">
    <style type="text/css">
       body { font-family: 'microsoft yahei'; }
       html,body{
         background: rgb(245,245,245);
         width: 100%;
        }
        body{
          margin: 0;
          padding；0;
        }
        html *{
          outline: 0;
        }
          a,a:hover,a:active,a:link{
            text-decoration: none;
            cursor: auto;
            color: #fff;
        }
    </style>
</head>
<body>
  <div id="site-nav"></div>
  <div id="mallpage" class="tms-page w1190">
    <div class="header">
      <a href="index.html" title="掌上超市购物商城"><img class="tm-logo" src="<%=basePath%>qiantai/images/logo.jpg"></a>
    </div>
  </div>
  <div class="content">
    <div class="mui">
      <div class="inner">
        <a href="毕业设计/index.html"><img src="<%=basePath%>qiantai/images/naifen.jpg"></a>
      </div>
    </div>
    <!-- 登录/注册 -->
      <div class="form">
        <div class="form-content">
          <div class="form-head">
            <span class="title">用户登录</span>
          </div>
          <form action="loginServlet">
            <div class="field username-filed">
              <label>用户</label>
              <input type="text" name="userid" id="userid" class="login-text"  onblur="fnuserid();" placeholder="请输入手机号">
            </div>
            <div class="field password-filed">
              <label>密码</label>
              <input type="password" name="userpassword" id="userpassword" onblur="fnpass();" class="login-text"  placeholder="请输入密码">
            </div>

          <button type="submit" class="button1">登录</button>
          </form>
           <form>
          <button type="submit" class="button1 button2"><a href="<%=basePath%>qiantai/htmls/zhuce.jsp">注册</a></button>
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
  function fnuserid(){
    var useridvalue=id("userid");
    var reg=/^1\d{10}$/;
    fn(reg,useridvalue);
  }
  function fnpass(){
    var passvalue=id("userpassword");
    var reg=/\w{7,}/;
    fn(reg,passvalue);
  }
</script>
