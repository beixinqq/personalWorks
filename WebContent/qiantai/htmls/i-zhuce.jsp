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
    <meta charset="UTF-8">
    <title>掌上超市购物商城</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimal-ui" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection"content="telephone=no, email=no" />
     <link href="<%=basePath%>css/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
    <link media="all" href="<%=basePath%>css/reset.css" rel="stylesheet">
    <link media="all" href="<%=basePath%>css/i-zhuce.css" rel="stylesheet">
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
        .mlogin .field{
        margin-bottom:1.2rem;
        }
        .label{
        font-weight:300;
        }
        .head{
        margin-bottom:1.4rem;
        }
        .submit button{
        color:white;
        font-weight:700;
        }
        .ii{
          position: relative;
          right: 4.66rem;
          z-index: 100;
        }
        #i_zhucetouch{
        width:103%;
        }
    </style>
</head>
<body>



<!-- <div class="head">
      <a href="i-index.html"><span class="back glyphicon glyphicon-chevron-left"><span></a>
      <span class="title">注册</span>
    </div>
    <form id="loginForm" class="mlogin" action="i-loginServlet">
      <div class="field">
        <div class="label">用户名</div>
        <div class="field-control">
            <input type="text" placeholder="请输入用户名" class="" name="username" id="username">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">真实名字</div>
        <div class="field-control">
            <input type="password" placeholder="请输入真实密码" class="" name="password" id="password">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">密码</div>
        <div class="field-control">
            <input type="password" placeholder="请输入密码" class="" name="password" id="password">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">再次密码</div>
        <div class="field-control">
            <input type="password" placeholder="请再次输入密码" class="" name="password" id="password">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">联系电话</div>
        <div class="field-control">
            <input type="password" placeholder="请输入联系电话" class="" name="password" id="password">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">邮箱</div>
        <div class="field-control">
            <input type="password" placeholder="请输入邮箱" class="" name="password" id="password">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="checkcode-wrap"></div>
      <div class="submit">
       <button type="submit" class="button" id="submit-btn" >注册</button>
   </form>
      </div> -->
<!-- <form action="addi_zhuceServlet">
用户名：<input type="text" name="i_zhuceid" id="i_zhuceid" value="请输入用户名！" /><br />
真实名字：<input type="text" name="i_zhucename" id="i_zhucename" value="请输入真实名字！" /><br />
密码：<input type="text" name="i_zhucepassword" id="i_zhucepassword" value="请输入密码！" /><br />
重输入密码：<input type="text" name="i_zhucepassword1" id="i_zhucepassword1" value="上一个和这一个是否一致！" /><br />
联系电话：<input type="text" name="i_zhucetouch" id="i_zhucetouch" value="请输入联系电话！" /><br />
邮箱：<input type="text" name="i_zhuceemail" id="i_zhuceemail" value="请输入邮箱！" /><br />
<input type="submit" value="提交" />
</form> -->
      <div class="head">
      <a href="http://localhost:8080/chbixin/qiantai/htmls/i-login.jsp"><span class="back glyphicon glyphicon-chevron-left"><span></a>
      <span class="title">注册</span>
    </div>
    <form id="loginForm" class="mlogin" action="addi_zhuceServlet">
      <div class="field">
        <div class="label">用户名</div>
        <div class="field-control">
            <input  placeholder="请输入用户名" type="text" name="i_zhuceid" id="i_zhuceid" onblur="fnuzhuceid();">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">真实名字</div>
        <div class="field-control">
            <input  placeholder="请输入真实密码" type="text" name="i_zhucename" id="i_zhucename" onblur="fnzhucename();">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">密码</div>
        <div class="field-control">
            <input  placeholder="请输入密码" type="text" name="i_zhucepassword" id="i_zhucepassword" onblur="fnzhucepassword();">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">再次密码</div>
        <div class="field-control">
            <input  placeholder="请再次输入密码" type="text" name="i_zhucepassword1" id="i_zhucepassword1" onblur="fnzhucepassword();">
        </div>
        
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="field">
        <div class="label">联系电话</div>
        <div class="field-control">
            <input  placeholder="请输入手机号" type="text" name="i_zhucetouch" id="i_zhucetouch" onblur="fnzhucetouch();">
        </div>
        <i class="ii"></i>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
            <div class="field">
        <div class="label">邮箱</div>
        <div class="field-control">
            <input  placeholder="请输入邮箱" type="text" name="i_zhuceemail" id="i_zhuceemail" onblur="fnzhuceemail();">
        </div>
        <div class="icon-clear"><i class="confont">x</i></div>
      </div>
      <div class="checkcode-wrap"></div>
      <div class="submit">
       <button type="submit" class="button" id="submit-btn" >注册</button>
   </form>
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
    function fnuzhuceid(){
      var zhuceid=id("i_zhuceid");
      var reg=/[a-z|A-Z|0-9]{1,10}/;
      fn(reg,zhuceid);
    }
    function fnzhucename(){
      var zhucename=id("i_zhucename");
      var reg=/\W{2,5}/;
      fn(reg,zhucename);
    }
    var zhucepassword=id("i_zhucepassword");
    function fnzhucepassword(){
      var reg=/\w{5,}/;
      fn(reg,zhucepassword);
    }
    function fnzhucepassword1(){
      var zhucepassword1=id("i_zhucepassword1");
      if(zhucepassword.value==zhucepassword1.value){
        zhucepassword1.style.border="1px solid rgb(1,135,206)";
        return true;
      }else {
        zhucepassword1.style.border="1px solid red";
        return false;
      }
    }

  function fnzhucetouch(){
    var zhucetouch=id("i_zhucetouch");
    var reg=/^1\d{10}$/;
    fn(reg,zhucetouch);
  }

  function fnzhuceemail(){
    var zhuceemail=id("i_zhuceemail");
    var reg=/^\w+((-\w+)|(\.\w+))*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    fn(reg,zhuceemail);
  }
</script>

<script type="text/javascript">
(function(){
    //把对象格式化为URL格式的字符串
    var encode=function(obj){

        if(typeof obj=='string')
            return obj;

        var arr=[];
        for(var n in obj){
         if(!obj.hasOwnProperty(n)) continue;
         arr.push(encodeURIComponent(n)+"="+encodeURIComponent(obj[n]));
        }
        //if(arr.length){
        //    return arr.join('&');
        //}
        //return '';
        return arr.join('&');
    };
    //最终目的：
    //不需要每次请求jsonp接口都创建script元素，并且不需要自己创建全局函数

    /**
     * @description jsonp请求核心函数
     * @param url {string} 请求的jsonp接口
     * @param data {string|object}  被发送的参数
     * @param callback {function} 回调函数
     * @param jsonpcallback {string} 约定的jsonpcallback
     * @type {Function}
     */
    var j=this.JSONP=function(url,data,callback,jsonpcallback) {
        //依附于window.JSONP的函数名
        var count = 'cb' + j.count++;//cb1  cb2  cb3 cb4
        //供调用的全局函数名
        var cbname = 'window.JSONP.' + count;
        //既然上面声明了一个全局函数名，所以下面要声明一个全局函数，可以通过上面的
        //用全局函数名来调用此函数
        /**
         *
         * @param data {object|undefined} 服务器发送过来的参数
         */
        window.JSONP[count] = function (data) {
            try{
                callback(data);
            }finally {
                //防止造成DOM冗余和JSONP静态方法的冗余
                script.parentNode.removeChild(script);
                delete  window.JSONP[count];
            }

        };
        //data就是给对方服务器传的参数
        //如果data是object则格式化为URL格式字符串
        var _encode=encode(data);
        if(_encode){
            url+=(/\?/.test(url) ? "&" : "?")+_encode;
        }

        var script = document.createElement('script');
        //jsonpcallback后面跟的函数名必须是全局下的
        //<script src="httph://localhost:3015/cross?name=zxxx">
        script.src = url + (/\?/.test(url) ? "&" : "?") + jsonpcallback + '=' + cbname;

        document.body.appendChild(script);

    };
    //为了防止缓存  每次都累加
    j.count = 1;
})();
</script>
<script type="text/javascript">
var oinput=document.querySelector('#i_zhucetouch');
var ii=document.querySelector(".ii");
 oinput.onblur=function(){           
                  var zhucetouch=id("i_zhucetouch");
                  var reg=/^1\d{10}$/;
                  fn(reg,zhucetouch);        
                var val=oinput.value;
                if(/^1\d{10}$/.test(val)){
                    JSONP('http://tcc.taobao.com/cc/json/mobile_tel_segment.htm',{'tel':val},function(data){
                       // console.log(data);
                       console.log(data['province']);
                       ii.style.color="rgb(1,135,206)";
                       ii.innerHTML=data['province']+" "+data['catName'];
                    },'callback');
                }else{
                  ii.style.color="red";
                  ii.innerHTML='不存在';
                }
        }       
</script>
