/**
 * Created by Administrator on 2016/5/29.
 */
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