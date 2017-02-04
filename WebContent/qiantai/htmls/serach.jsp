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
    <link rel="shortcut" href="images/favicon.ico">
    <link href="<%=basePath%>css/bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
<link media="all" href="<%=basePath%>css/scrollBox.css" rel="stylesheet">
    <style type="text/css">
    link{
        display: none;
    }
        html,body{
            margin: 0;
            display: block;
        }
        html{
            font-size: 100%;
        }
        body{
            background: #f5f5f5;
            min-width: 1226px;
            font-family:"Helvetica Neue",Helvetica,Arial,"Microsoft Yahei","Hiragino Sans GB","Heiti SC","WenQuanYi Micro Hei",sans-serif;
        }
        a,a:hover,a:active,a:link{
            text-decoration: none;
            cursor: auto;
        }
        ul,ol,li,dl,dt,dd,p{
            list-style: none;
            margin: 0;
            padding: 0;
        }
        img{
            border: 0;
        }
         .p1{display: none;}
        .p2{display: block;}
        .tag1{
            cursor: pointer;
        }

          <!-- ------------------ -->
          .view{
          width:1196px;
          padding-left:5px;
          padding-right:5px;
          margin-top:10px;
          }
          .view .product{
          width:230px;
          margin-right:5px;
          height:285px;
          position:relative;
          float:left;
          margin-bottom:10px;
          line-height:1.5;
          z-index:1;
          border:1px solid rgb(230,232,236);
           background-color:#fff;
          border-radius:3px;
          }
          .product-iwrap{
          position:absolute;
          background-color:#fff;
          margin:0;
          padding:4px;
          padding-bottom:0;
          font-size:0;
          border-radius:3px;
          }
          .productImg-wrap{
          position:relative;
          display:table;
          table-layout:fixed;
          height:205px;
          width:100%;
          padding:0;
          margin:0;
          margin-bottom:5px;
          padding:4px 3px;
          border-radius:3px;
          border:1px solid rgb(230,232,236);

          }
          .productPrice{
          color:#c00;
          font-size:17px;
          height:30px;
          line-height:30px;
          margin:0 0 5px;
          letter-spacing:normal;
          white-space:nowrap;
          display:block;
          font-weight:900;
          margin-left:10px;
          }
          .productTitle{
          	display:block;
          	color:#666;
          	height:14px;
          	line-height:14px;
          	margin-bottom:10px;
          	margin-top:10px;
          	margin-left:5px;
          	word-break:break-all;
          	font-size:0;
          	position:relative;
          	font-size:13px;
          }
          .productPrice .cart{
          	position:relative;
          	top:0;
          	right:4px;
          	float:right;
          	width:30px;
          	background:rgb(1,135,206);
          	color:#fff;
          	font-size:10px;
          	width:80px;
          	padding-left:10px;
          	border-radius:6px;

          }
          #site-header{
            position: fixed;
            background-color: rgb(245,245,245);
          }
          #view{
            position: relative;
            top:100px;
          }
          <!-- ------------------ -->

		.scrollBox{
		padding-top:6px;
		}

    </style>
    <link rel="stylesheet" href="<%=basePath%>css/index.css">
    <link rel="stylesheet" href="<%=basePath%>css/header-nav-menu.css">
      
</head>
<body>
<!--顶部-->
<!-- <div class="site-topbar">
    <div class="container">
        <div class="topbar-nav">
            <a href="">生鲜蔬果</a>
            <span class="sep">|</span>
            <a href="">休闲零食</a>
            <span class="sep">|</span>
            <a href="">粮油调味</a>
            <span class="sep">|</span>
            <a href="">洗化百货</a>
            <span class="sep">|</span>
            <a href="">国产饮料</a>
            <span class="sep">|</span>
            <a href="">南北干货</a>
        </div>
        <div class="topbar-cart">
            <a class="cart-shopping" href="#">
                <span class="iconfont glyphicon glyphicon-shopping-cart"></span>购物车<span class="cart-num">（0）</span>
            </a>
        </div>
        <div class="topbar-info">
            <a href="login.html">
            <span class="link">登录</span>
            <span class="sep">|</span>
            <span class="link">注册</span>
            </a>
        </div>
    </div>
</div> -->
<!--logo、搜索、二维码-->
<div id="site-header" class="site-header">
    <div class="container">
        <div class="header-logo"><img src="<%=basePath%>qiantai/images/logo.jpg" width="200" height="80" alt=""></div>
        <div class="header-search">
            <form action="" class="search-form clearfix">
                <input id="search-text" class="search-text" type="search">
                <button type="submit" id="search-btn" class="search-btn glyphicon glyphicon-search" value=""></button>
                <div class="search-hot-words">
                    <a href="">薯片</a>
                    <a href="">成人奶粉</a>
                    <a href="">蒙牛饼干</a>
                </div>
            </form>
        </div>
        <div class="header-codes">
            <img class="codes-img" src="<%=basePath%>qiantai/images/codes.png" width="80" height="80" alt="">
        </div>
        <div class="header-ren">
            <img class="ren-img" src="<%=basePath%>qiantai/images/ren.png"  alt="">
        </div>
    </div>
</div>


<!-- 搜索商品 -->  <!-- 可删就按照你的想法去做-->
<div class="page-main" id="view">
    <div class="container">
        <div class="home-recm-box home-brick-box home-brick-row-1-box xm-plain-box">
            <div class="box-bd xm-carousel-continer">
                <div class="xm-recommend">
                    <div class="xm-carousel-wrapper">
                        <!-- ------------------ -->
 <!-- ------------------ -->


<div class="view" >
 <%
 int i=0;
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
				 i++;
    %>

	<div class="product">
		<div class="product-iwrap">
			<div class="productImg-wrap"> <img id="img<%=i %>" src="<%=basePath%>houtai/images/<%=rs.getString(4)%>" width="210" height="195" ></img></div>
			<p id="title<%=i %>" class="productTitle" name="productTitle"><%=rs.getString(2) %></p>
			<p class="productPrice"><span id="price<%=i %>"><%=rs.getString(3) %></span>元<a href="javascript:;" class="cart" onclick="save<%=i %>();">加入购物车</a></p>
		</div>
	</div>

	 <%
	}
			}
			catch (SQLException e) {
			System.out.println("数据库操作出现异常");
			e.printStackTrace();
		}

	%>

</div>

<!-- ------------------ -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</div>
 <!-- 购物车 -->
    <div class="scrollBox" id="cart" style="display:block;">
         <a href="http://localhost:8080/chbixin/qiantai/htmls/shopping.html"><span id="glyphicon1" class="glyphicon glyphicon-shopping-cart a11"></span></a>
    </div>
</body>
</html>
<script type="text/javascript">
   //打开数据库
    var db=openDatabase('contactdb5511','','local database demo',204800);
    //保存数据
    function save1(){
       var img1=document.getElementById("img1").src;
       var mingcheng1=document.getElementById("title1").innerHTML;
       var price1=document.getElementById("price1").innerHTML;
        //创建时间
       var time = new Date().getTime();
       db.transaction(function(tx){
        tx.executeSql('insert into contact values(?,?,?,?)',[img1,mingcheng1,price1,time],onSuccess,onError);
    });
}
    function save2(){
        var img2=document.getElementById("img2").src;
        var mingcheng2=document.getElementById("title2").innerHTML;
        var price2=document.getElementById("price2").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img2,mingcheng2,price2,time],onSuccess,onError);
     });
 }
    function save3(){
        var img3=document.getElementById("img3").src;
        var mingcheng3=document.getElementById("title3").innerHTML;
        var price3=document.getElementById("price3").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img3,mingcheng3,price3,time],onSuccess,onError);
     });
 }
    function save4(){
        var img4=document.getElementById("img4").src;
        var mingcheng4=document.getElementById("title4").innerHTML;
        var price4=document.getElementById("price4").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img4,mingcheng4,price4,time],onSuccess,onError);
     });
 }
    function save5(){
        var img5=document.getElementById("img5").src;
        var mingcheng5=document.getElementById("title5").innerHTML;
        var price5=document.getElementById("price5").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img5,mingcheng5,price5,time],onSuccess,onError);
     });
 }
    function save5(){
        var img5=document.getElementById("img5").src;
        var mingcheng2=document.getElementById("title5").innerHTML;
        var price5=document.getElementById("price5").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img5,mingcheng5,price5,time],onSuccess,onError);
     });
 }
    function save6(){
        var img6=document.getElementById("img6").src;
        var mingcheng6=document.getElementById("title6").innerHTML;
        var price6=document.getElementById("price6").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img6,mingcheng6,price6,time],onSuccess,onError);
     });
 }
    function save7(){
        var img7=document.getElementById("img7").src;
        var mingcheng7=document.getElementById("title7").innerHTML;
        var price7=document.getElementById("price7").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img7,mingcheng7,price7,time],onSuccess,onError);
     });
 }
    function save8(){
        var img8=document.getElementById("img8").src;
        var mingcheng8=document.getElementById("title8").innerHTML;
        var price8=document.getElementById("price8").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img8,mingcheng8,price8,time],onSuccess,onError);
     });
 }
    function save9(){
        var img9=document.getElementById("img9").src;
        var mingcheng9=document.getElementById("title9").innerHTML;
        var price9=document.getElementById("price9").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img9,mingcheng9,price9,time],onSuccess,onError);
     });
 }
    function save10(){
        var img10=document.getElementById("img10").src;
        var mingcheng10=document.getElementById("title10").innerHTML;
        var price10=document.getElementById("price10").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img10,mingcheng10,price10,time],onSuccess,onError);
     });
 }
    function save11(){
        var img11=document.getElementById("img11").src;
        var mingcheng11=document.getElementById("title11").innerHTML;
        var price11=document.getElementById("price11").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img11,mingcheng11,price11,time],onSuccess,onError);
     });
 }
    function save12(){
        var img12=document.getElementById("img12").src;
        var mingcheng12=document.getElementById("title12").innerHTML;
        var price12=document.getElementById("price12").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img12,mingcheng12,price12,time],onSuccess,onError);
     });
 }
    function save13(){
        var img13=document.getElementById("img13").src;
        var mingcheng13=document.getElementById("title13").innerHTML;
        var price13=document.getElementById("price13").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img13,mingcheng13,price13,time],onSuccess,onError);
     });
 }
    function save14(){
        var img14=document.getElementById("img14").src;
        var mingcheng14=document.getElementById("title14").innerHTML;
        var price14=document.getElementById("price14").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img14,mingcheng14,price14,time],onSuccess,onError);
     });
 }
    function save15(){
        var img15=document.getElementById("img15").src;
        var mingcheng15=document.getElementById("title15").innerHTML;
        var price15=document.getElementById("price15").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img15,mingcheng15,price15,time],onSuccess,onError);
     });
 }
    function save16(){
        var img16=document.getElementById("img16").src;
        var mingcheng16=document.getElementById("title16").innerHTML;
        var price16=document.getElementById("price16").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img16,mingcheng16,price16,time],onSuccess,onError);
     });
 }
    function save17(){
        var img17=document.getElementById("img17").src;
        var mingcheng17=document.getElementById("title17").innerHTML;
        var price17=document.getElementById("price17").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img17,mingcheng17,price17,time],onSuccess,onError);
     });
 }
    function save18(){
        var img18=document.getElementById("img18").src;
        var mingcheng18=document.getElementById("title18").innerHTML;
        var price18=document.getElementById("price18").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img18,mingcheng18,price18,time],onSuccess,onError);
     });
 }
    function save19(){
        var img19=document.getElementById("img19").src;
        var mingcheng19=document.getElementById("title19").innerHTML;
        var price19=document.getElementById("price19").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img19,mingcheng19,price19,time],onSuccess,onError);
     });
 }
    function save20(){
        var img20=document.getElementById("img20").src;
        var mingcheng20=document.getElementById("title20").innerHTML;
        var price20=document.getElementById("price20").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img20,mingcheng20,price20,time],onSuccess,onError);
     });
 }
    function save21(){
        var img21=document.getElementById("img21").src;
        var mingcheng21=document.getElementById("title21").innerHTML;
        var price21=document.getElementById("price21").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img21,mingcheng21,price21,time],onSuccess,onError);
     });
 }
    function save22(){
        var img22=document.getElementById("img22").src;
        var mingcheng22=document.getElementById("title22").innerHTML;
        var price22=document.getElementById("price22").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img22,mingcheng22,price22,time],onSuccess,onError);
     });
 }
  function save23(){
        var img23=document.getElementById("img23").src;
        var mingcheng23=document.getElementById("title23").innerHTML;
        var price23=document.getElementById("price23").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img23,mingcheng23,price23,time],onSuccess,onError);
     });
 }
  function save24(){
        var img24=document.getElementById("img24").src;
        var mingcheng24=document.getElementById("title24").innerHTML;
        var price24=document.getElementById("price24").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img24,mingcheng24,price24,time],onSuccess,onError);
     });
 }
  function save25(){
        var img25=document.getElementById("img25").src;
        var mingcheng25=document.getElementById("title25").innerHTML;
        var price25=document.getElementById("price25").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img25,mingcheng25,price25,time],onSuccess,onError);
     });
 }
  function save26(){
        var img26=document.getElementById("img26").src;
        var mingcheng26=document.getElementById("title26").innerHTML;
        var price26=document.getElementById("price26").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img26,mingcheng26,price26,time],onSuccess,onError);
     });
 }
  function save27(){
        var img27=document.getElementById("img27").src;
        var mingcheng27=document.getElementById("title27").innerHTML;
        var price27=document.getElementById("price27").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img27,mingcheng27,price27,time],onSuccess,onError);
     });
 }
  function save28(){
        var img28=document.getElementById("img28").src;
        var mingcheng28=document.getElementById("title28").innerHTML;
        var price28=document.getElementById("price28").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img28,mingcheng28,price28,time],onSuccess,onError);
     });
 }
  function save29(){
        var img29=document.getElementById("img29").src;
        var mingcheng29=document.getElementById("title29").innerHTML;
        var price29=document.getElementById("price29").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img29,mingcheng29,price29,time],onSuccess,onError);
     });
 }
  function save30(){
        var img30=document.getElementById("img30").src;
        var mingcheng30=document.getElementById("title30").innerHTML;
        var price30=document.getElementById("price30").innerHTML;
         //创建时间
        var time = new Date().getTime();
        db.transaction(function(tx){
         tx.executeSql('insert into contact values(?,?,?,?)',[img30,mingcheng30,price30,time],onSuccess,onError);
     });
 }
    //sql语句执行成功后执行的回调函数
    function onSuccess(tx,rs){
        alert("加入成功");
        loadAll();
    }
//sql语句执行失败后执行的回调函数
    function onError(tx,error){
        alert("操作失败，失败信息："+ error.message);
    }

    //将所有存储在sqlLite数据库中的购物车全部取出来
    function loadAll(){
    var list = document.getElementById("list");
    db.transaction(function(tx){
        //如果数据表不存在，则创建数据表
        tx.executeSql('create table if not exists contact(imgsrc text,mingcheng text,price text,createtime INTEGER)',[]);
        //查询所有联系人记录
        tx.executeSql('select * from contact',[],function(tx,rs){
           if(rs.rows.length>0){
                var result = "<table>";
                // result += "<tr><th>序号</th><th>商品图片</th><th>商品名称</th><th>价格</th><th>商品商家</th><th>操作</th></tr>";
                result+="<thead><tr><th><label><input class='check-all check' type='checkbox'/>&nbsp;全选</label></th><th>商品</th><th>单价</th><th>数量</th><th>小计</th><th>操作</th></tr></thead><tbody>";
                for(var i=0;i<rs.rows.length;i++){
                    var row = rs.rows.item(i);
                    //转换时间，并格式化输出
                    var time = new Date();
                    time.setTime(row.createtime);
                    var timeStr = time.format("yyyy-MM-dd hh:mm:ss");
                    //拼装一个表格的行节点
                    // result += "<tr><td>"+(i+1)+"</td><td>"+"<img src="+row.imgsrc+" width=\"50\" height=\"50\"/>"+"</td><td>"+row.mingcheng+"</td><td>"+row.price+"</td><td>"+timeStr+"</td><td><input type='button' value='删除' onclick='del("+row.mingcheng+")'/></td></tr>";

                    result+="<tr><td class='checkbox'><input class='check-one check' type='checkbox'/></td><td class='goods'><img src="+row.imgsrc+" width=\"50\" height=\"50\" /><span>"+row.mingcheng+"</span></td><td class='price'>"+row.price+"</td><td class='count'><span class='reduce'></span><input class='count-input' type='text' value='1'/><span class='add'>+</span></td><td class='subtotal'>"+row.price+"</td><td class='operation'><span class='delete'>删除</span></td></tr>";
                }
                list.innerHTML=result+'</tbody></table><div class="foot" id="foot"><label class="fl select-all"><input type="checkbox" class="check-all check"/>&nbsp;全选</label><a class="fl delete" id="deleteAll" href="javascript:;">删除</a><div class="fr closing">结 算</div><div class="fr total">合计：￥<span id="priceTotal">0.00</span></div><div class="fr selected" id="selected">已选商品<span id="selectedTotal">0</span>件<span class="arrow up">︽</span><span class="arrow down">︾</span></div><div class="selected-view"><div id="selectedViewList" class="clearfix"><div><img src="images/1.jpg"><span>取消选择</span></div></div><span class="arrow">◆<span>◆</span></span></div></div>';
           }else{
                list.innerHTML = "目前数据为空，赶紧开始加入联系人吧";
           }
        });
    });
}

//删除购物车信息
function del(mingcheng){
     db.transaction(function(tx){
        //注意这里需要显示的将传入的参数phone转变为字符串类型
        tx.executeSql('delete from contact where mingcheng=?',[String(mingcheng)],onSuccess,onError);
    });
}
//格式化时间的format函数
Date.prototype.format = function(format)
{
    var o = {
    "M+" : this.getMonth()+1, //month
    "d+" : this.getDate(),    //day
    "h+" : this.getHours(),   //hour
    "m+" : this.getMinutes(), //minute
    "s+" : this.getSeconds(), //second
    "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
    "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
    (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)if(new RegExp("("+ k +")").test(format))
    format = format.replace(RegExp.$1,
    RegExp.$1.length==1 ? o[k] :
    ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}

</script>
<script>
window.onload=function(){
	var productTitle=document.getElementsByName("productTitle");//商品名称
	var inputText=document.getElementById("search-text");//输入文本框
	var botton=document.getElementById("search-btn");//按钮搜索商品名称
	botton.onmouseover=function(){
		for(var i=0;i<productTitle.length;i++){
			var str1=productTitle[i].innerHTML.toUpperCase();
			var str2=inputText.value.toUpperCase();
			//JS实现模糊搜索
			if(str1.search(str2)!=-1 && str2!=""){
				productTitle[i].parentNode.style.backgroundColor="rgba(1,135,206,0.3)";
			}else{
				productTitle[i].parentNode.style.backgroundColor="";
			}
			
		}
	}

	botton.onmouseout=function(){
	    for(var i=0;i<productTitle.length;i++){
	      productTitle[i].parentNode.parentNode.style.backgroundColor="";
	    }
	  }
}
  
</script>
