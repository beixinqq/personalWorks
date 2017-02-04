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
<title>注册</title>
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
<style>
 .a11{
        margin-top:12px;}
		.a22{
		margin-bottom:10px;}
		.a44{
        margin-top:70px;}
         .ii{
     position: relative;
     top:-166px;
     right: -231px;
     color: rgb(1,135,206);
     font-size: 12px;
     } 
        </style>

</head>
<body>
<!-- <form action="addzhuceServlet">
用户名：<input type="text" name="zhuceid" id="zhuceid" value="请输入用户名！" /><br />
真实名字：<input type="text" name="zhucename" id="zhucename" value="请输入真实名字！" /><br />
密码：<input type="text" name="zhucepassword" id="zhucepassword" value="请输入密码！" /><br />
重输入密码：<input type="text" name="zhucepassword1" id="zhucepassword1" value="上一个和这一个是否一致！" /><br />
联系电话：<input type="text" name="zhucetouch" id="zhucetouch" value="请输入联系电话！" /><br />
邮箱：<input type="text" name="zhuceemail" id="zhuceemail" value="请输入邮箱！" /><br />
<input type="submit" value="提交" />
</form> -->



<div class="col-sm-8 col-sm-offset-4 col-md-4 col-md-offset-8s main a44">

<div class="row">
    <div class="col-lg-10">
    	<div class="panel panel-primary">
    	<div class="panel-heading">
        	<h3 class="panel-title">注册</h3>
        </div>
		<form action="addzhuceServlet">
		<input type="text" name="zhuceid" id="zhuceid" onblur="fnuzhuceid();" class="form-control a11" placeholder="请输入用户名"/><br />
		<input type="text" name="zhucename" id="zhucename" onblur="fnzhucename();" class="form-control" placeholder="请输入真实名字！" /><br />
		<input type="text" name="zhucepassword" id="zhucepassword" onblur="fnzhucepassword();" class="form-control"  placeholder="请输入密码！" /><br />
		<input type="text" name="zhucepassword1" id="zhucepassword1" onblur="fnzhucepassword1();" class="form-control" placeholder="请再一次密码" /><br />
		<input type="text" name="zhucetouch" id="zhucetouch" onblur="fnzhucetouch();"  class="form-control"  placeholder="请输入手机号"/><br />
		<input type="text" name="zhuceemail" id="zhuceemail" onblur="fnzhuceemail();" class="form-control"  placeholder="请输入邮箱" /><br />
		<button type="submit" class="form-control a22">提交</button>
		</form>
	    </div>
	</div>
</div>
<i class="ii"><i>
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
  function fnuzhuceid(){
    var zhuceid=id("zhuceid");
    var reg=/\W{1,10}/;
    fn(reg,zhuceid);
  }
  function fnzhucename(){
    var zhucename=id("zhucename");
    var reg=/\W{2,5}/;
    fn(reg,zhucename);
  }
  var zhucepassword=id("zhucepassword");
  function fnzhucepassword(){
    var reg=/\w{7,}/;
    fn(reg,zhucepassword);
  }
  function fnzhucepassword1(){
    var zhucepassword1=id("zhucepassword1");
    if(zhucepassword.value==zhucepassword1.value){
      zhucepassword1.style.border="1px solid rgb(1,135,206)";
      return true;
    }else {
      zhucepassword1.style.border="1px solid red";
      return false;
    }
  }

function fnzhucetouch(){
  var zhucetouch=id("zhucetouch");
  var reg=/^1\d{10}$/;
  fn(reg,zhucetouch);
}

function fnzhuceemail(){
  var zhuceemail=id("zhuceemail");
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
var oinput=document.querySelector('#zhucetouch');
var ii=document.querySelector(".ii");
 oinput.onblur=function(){           
                  var zhucetouch=id("zhucetouch");
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
