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
    <title>掌上超市购物商城</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection"content="telephone=no, email=no" />
     <link href="<%=basePath%>css/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <link media="all" href="<%=basePath%>css/reset.css" rel="stylesheet">
    <link media="all" href="<%=basePath%>css/i-login.css" rel="stylesheet">
    <style type="text/css">
       body { font-family: 'microsoft yahei'; }
       html,body{
         background: rgb(240,240,240);
         width: 100%;
        }
        body{
          margin: 0;
          padding；0;
        }
        html *{
          outline: 0;
          -webkit-text-size-adjust:none;
          -webkit-tap-highlight-color:rgba(0,0,0,0);
        }
          a,a:hover,a:active,a:link{
            text-decoration: none;
            cursor: auto;
        }
        .submit button{
        color:white;
        }
        .head .title{
        margin-left:35%;}
        /*.field .field-control input{
          padding-top: 1rem;
          padding-bottom: 1rem;
        }*/
        #www,#www:hover{
          color: white;
        }
    </style>
</head>
<body>
    <div class="head">
      <a href="http://localhost:8080/chbixin/qiantai/htmls/i-index.html"><span class="back glyphicon glyphicon-chevron-left"><span></a>
      <span class="title">登录</span>
    </div>
    <form id="loginForm" class="mlogin" action="i-loginServlet">
      <div class="field">
        <div class="label">账户</div>
        <div class="field-control" >
            <input type="text" placeholder="手机号" class="" onblur="fnuserid();" name="username" id="username">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">密码</div>
        <div class="field-control"  >
            <input type="password" placeholder="请输入密码" class="" onblur="fnpass();" name="password" id="password">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="checkcode-wrap"></div>
      <div class="submit">
        <button type="submit" class="button" id="submit-btn button1"  >登录</button></form>
        <form>
        <button type="submit" class="button" id="submit-btn" ><a id="www" href="http://localhost:8080/chbixin/qiantai/htmls/i-zhuce.jsp">注册</a></button></form>
      </div>


</body>
</html>

<script type="text/javascript">
    (function (doc, win) {
        var docEI = doc.documentElement;
        var resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize';
        var recalc = function () {
            var clientWidth = docEI.clientWidth;
            if (!clientWidth)return;
            docEI.style.fontSize = 14* (clientWidth / 320) + 'px';
        };
        if (!doc.addEventListener)return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);

</script>
<script type="text/javascript">
  function fn(reg,str){
      if(reg.test(str.value)){
    	  str.style.border="none";
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
    var useridvalue=id("username");
    var reg=/^1\d{10}$/;
    fn(reg,useridvalue);
  }
  function fnpass(){
    var passvalue=id("password");
    var reg=/\w{7,}/;
    fn(reg,passvalue);
  }
</script>
