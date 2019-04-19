<template>
    <div class="app-phone">
        <header class="mui-bar mui-bar-nav" style="background:#009ae4">
			<router-link to="/goodlist" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title" style="color:#fff">婚纱详情</h1>
		</header>
        <div class="mui-card">
            <div class="mui-card-header">婚纱名称:{{info.title}}</div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <img :src="info.img_url" class="img" alt="">
                    <p>销售价:{{info.price}}</p>
                    <p class="name">店铺名称:{{info.lname}}</p>
                </div>
            </div>
            
            <div class="mui-card-footer">
                <mt-button size="small" type="primary" @click="addcart">加入购物车</mt-button>
            </div>
        </div>
    </div>
</template>
<script>
import {Toast} from "mint-ui";
export default {
   data(){
       return {
           lid:this.$route.query.lid,
           info:{}  //显示商品信息          
       }
   },
   created() {
       this.findProduct();
   },
   methods: {
       addcart(){
        //    console.log("456");
        //1.获取三个参数   pid  pname price
        var pid = this.lid;
        var pname = this.info.lname;
        var price = this.info.price; 
        var img_url = this.info.img_url;
        //2.发送ajax
        var url = "http://127.0.0.1:3000/addcart";
        url+= "?pid="+pid;
        url+=" &price="+price;
        url+= " &pname="+pname;
        url+=" &img_url="+img_url;
        this.axios.get(url).then(result=>{
            //  console.log(result.data);
            Toast("添加成功  3s后跳转到购物车");
            setTimeout(function(){
                if(result.data.code==1){   
                    location.href="http://127.0.0.1:6060/#/shopcart";
                }else{
                    Toast("添加失败");
                }
            },3000)
        })
        //3.获取返回结果 提示
       },
       //当组件创建成功后加载信息
       findProduct(){
        //    console.log(123);
        var url= "http://127.0.0.1:3000/findProduct?lid="+this.lid;
        this.axios.get(url).then(result=>{
            // console.log(result);
            this.info = result.data.data[0];
        })
       }
   },
}
</script>
<style>
.app-phone{
    width:100%;
    background:#fff;
    margin:0;
    padding:0;
}
.mui-icon-back:before, .mui-icon-left-nav:before{
        color:#fff;
}
.img{
    width:100%;
    height: 270px;
}
p{
    font-size: 15px;
}
.name{
    padding-top:5px;
    margin-bottom: 5px !important;
}
.mui-card-header{
    color:#666;
    font-family: 'Helvetica Neue', Helvetica, sans-serif;
}
.mui-card-footer{
    float: right;
}
</style>
