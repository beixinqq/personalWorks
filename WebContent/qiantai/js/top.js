 var goto=document.getElementById("scrollBox");
  var curH=document.documentElement.clientHeight||document.body.clientHeight;
  window.onscroll=function(){
    var curT=document.documentElement.scrollTop||document.body.scrollTop;
      goto.style.display=curT>curH?"block":"none";
  }
  goto.onclick=function(){
    var curT=(document.documentElement.scrollTop||document.body.scrollTop)-0;
    var step=(curT/1000)*10;
    var timer=window.setInterval(function () {
      document.documentElement.scrollTop-=step;
      document.body.scrollTop-=step;
      if((document.documentElement.scrollTop||document.body.scrollTop)<=0){
        window.clearInterval(timer);
      }
    }, 2);

  }