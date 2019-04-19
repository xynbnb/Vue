<template>
    <div class="list-header">
        <header class="mui-bar mui-bar-nav" style="background:#009ae4">
			<router-link to="/home" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title" style="color:#fff">婚纱详情</h1>
		</header>
        <div class="app-goodlist">
            <!-- 商品的详细信息 start -->
            <section class="love-pic">
                <div class="love-top">
                    <ul class="love-ul">
                        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3 li-view" v-for="item of list" :key="item.id">
                            <div class="cont">
                                <div class="cont-img">
                                    <router-link to="javascript:;">
                                        <img :src="item.img_url" @click.prevent="jumpInfo"  :data-id="item.id" alt="">
                                    </router-link>
                                </div>
                                
                                <div class="cont-text">
                                <h4>{{item.dname}}</h4>
                                </div>
                                <div class="cont-addr">
                                    <h4>{{item.addr}}</h4>
                                </div>
                                <div class="cont-ctime">
                                <h4>工作时间:{{item.ctime}}</h4>
                                </div>
                                <div class="cont-tel">
                                    <h4>联系电话:{{item.tel}}</h4>
                                </div>
                                
                            </div>
                        </li>
                    </ul>
                    <mt-button class='button' @click="loadMore" size="large" type="primary">加载更多</mt-button>
                </div>    
            </section> 
            <!-- 商品详细信息 -->
            <!-- 加载更多… -->
            
        </div>
    </div>
</template>>
<script>

export default {
    data(){
        return{
            list:[],  //模板中显示商品列表
            pno:0     //第几页   初始值是0
        }
        window.onscroll = ()=>{
  //变量scrollTop是滚动条滚动时，距离顶部的距离
  var scrollTop = document.documentElement.scrollTop||document.body.scrollTop;
  //变量windowHeight是可视区的高度
  var windowHeight = document.documentElement.clientHeight || document.body.clientHeight;
  //变量scrollHeight是滚动条的总高度
  var scrollHeight = document.documentElement.scrollHeight||document.body.scrollHeight;
   //滚动条到底部的条件
   if(scrollTop+windowHeight==scrollHeight){
    //写后台加载数据的函数
    if(this.num/(this.pag)>12){
    this.pag++;
    this.dataut()
    }else{
    Toast("暂无跟多数据");
    } 
   } 
}
    },
    created() {
        //当组件创建成功后立即调用加载下一页方法
        this.loadMore();
    }, 
    methods:{
         //跳转商品详情组件
       jumpInfo(e){
           var id= e.target.dataset.id;
           console.log(id);
           this.$router.push("/GoodInfo?lid="+id);
       },
     //加载下一页数据并且将数据显示在模块上
       loadMore(){
        //0:获取当前页码
        this.pno++;
        //1:创建变量url请求地址
        var url="http://127.0.0.1:3000/list?pno="+this.pno;
        //2:发送ajax请求
        this.axios.get(url).then(result=>{
            //3：获取服务器返回结果保存data
            //this.list=result.data.data;
            //console.log(this.list);
            //3.1:获取服务器返回结果 追加list
            //使用 concat 拼接数组
            var rows=this.list.concat(result.data.data);
            this.list=rows;
        })
        //3:获取服务器返回结果保存data       
       } 
    },
}
</script>
<style scoped>
.list-header{
    margin-top:-30px;
}
/* 外层父元素 */
.app-container{
    padding-top:0 !important;
}
.app-goodlist{
    display:flex;/* 弹性布局 */
    flex-wrap: wrap;   /*子对象换行*/
    justify-content: center;   /*两端对齐*/
    padding:4px;
} 
h4{
    margin-top:5px;
    font-size:16px;
    color:#0b0b0b;
    line-height: 10px;
    text-align: center;
}
.button{
    margin-bottom:25px !important;
}
.mui-icon-back:before, .mui-icon-left-nav:before{
        color:#fff;
    }
/* 商品名称 */
/* 商品价格 */
 .love-pic{
  margin-top:20px;
  height:600px;
  background-color: #fff;
  text-align: center;
  display: block;
}
.love-top{
  height:300px;
  padding:0 6px;
  box-sizing: border-box;
}
.love-ul{
  width:345px;
  height:auto;
  list-style: none;
  margin:0 auto;
  padding: 0;
}
.cont{
  width:340px;
  height: 300px;
  margin: 0 auto;
  border-radius:20px;
  position: relative;
  box-shadow: 0 0 12px rgba(0, 0, 0, .4);
  background: #fff !important;
}
.cont-img img{
  width:100%;
  height:226px;
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
}
.cont-text{
  width:304px;
  height:36.5px;
  text-align: left;
  padding:12px 18px 20px;
}
.cont-text h4{
  font-size: 17px;
  color:#0b0b0b;
  font-weight: 400;
  float: left;
  font-family: 'Helvetica Neue', Helvetica, sans-serif;
}
.li-view{
  width:100%;
  margin-top:13px;
}
.cont-addr{
  height:36.5px;
  text-align: left;
  padding:6px 30px 20px;
}
.cont-addr h4{
  font-size: 15px;
  color:#111;
  font-weight: 400;
  float: left;
  font-family: 'Helvetica Neue', Helvetica, sans-serif;
}
.mui-table-view-cell{
    padding:11px 5px !important;
}
.cont-ctime{
    position:relative;
    top:-60px;
    right:-90px;
} 
.cont-ctime h4{
    font-size:13px;
    color:#111;
}
.cont-tel{
    position:relative;
    top:-45px;
    right:-85px;
}
.cont-tel h4{
    font-size:13px;
    color:#111;
}
</style>