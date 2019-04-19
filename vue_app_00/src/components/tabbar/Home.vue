<template>
  <div class="app-Home">
    <nav class="nav-big">
      <router-link to="/home" class="room">
        <img class="room-img" src="../../img/room.png" alt="">
      </router-link>
      <router-link to="/home">
        <img class="nav-img" src="../../img/logo.png" alt="">
      </router-link>
      <div class="menubtn">
        <!-- <router-link to="/login"><span class="mui-icon mui-icon-bars"></span></router-link> -->
        <router-link to="/login" class="login">登录</router-link>
      </div>
    </nav>
    <!-- 轮播图 -->
    <div class="banner">
      <mt-swipe>
      <mt-swipe-item v-for="item of navlist" :key="item.id">
        <img :src="item.img_url" alt="">
      </mt-swipe-item>
    </mt-swipe>
    </div>
    <div class="view-conten">
      <ul class="mui-table-view mui-grid-view mui-grid-9 ul-flex">
        <li v-for="item of gridlist" class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3 li-view" :key="item.id">
          <router-link to="javascript:;">
            <div class="view-div">
              <img class="view-img" :src="item.img_url">
            </div>
          <div class="mui-media-body view-title">{{item.title}}</div></router-link>
        </li>
      </ul>
    </div>
    <section class="love-pic" >
      <div class="love-top">
        <div class="tit">
          <h3>
            <img src="../../img/pic1.jpg" alt="">
          </h3>
          <h4>
            <img src="../../img/pic2.png" alt="">
          </h4>
          <h5>
            <img src="../../img/pic3.png" alt="">
          </h5>
        </div>
        <ul class="love-ul">
          <h6>湖南婚照品质之选</h6>
          <li class="love-li" v-for="item of gridcard" :key="item.id">
          <h6>
              <img src="../../img/pic6.png" alt="">
            </h6>
            <div class="cont">
              <div class="cont-img">
                <router-link to="javascript:;">
                  <img :src="item.img_url" alt="">
                </router-link>
              </div>
              <div class="cont-text">
                <h4>{{item.dname}}</h4>
                <h6>{{item.title}}</h6>
              </div>
            </div>
          </li>
          <li class="love-li">
            <h6>
              <img src="../../img/pic6.png" alt="">
            </h6>
            <div class="anniu">
              <a href="javascript:;">&gt;查看更多客照&lt;</a>
            </div>
          </li>
        </ul>
      </div>
    </section>
  </div>
</template>
<script>
import {Toast} from "mint-ui";
export default {
  data(){
    return{
      navlist:[],    //轮播图列表 
      gridlist:[],   //保存九宫格数组
      gridcard:[]   //保存卡片的数组
      }
  },
  created() {
    this.handleImage();
    this.handleGrid();
    this.handleCard();

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
  methods: {
      jump(e){
      var id = e.target.dataset.id;
      var path = "/";
      if(id==1){
        path = "/NewsList"
      }else if(id == 2){
        path = "/GoodList"
      }else{
        path = "/"
      }
      //console.log(id);
      //console.log(123);
      this.$router.push(path);
    },
    handleCard(){
      //1.发送ajax获取卡片数据
      var url = "http://127.0.0.1:3000/card";
      this.axios.get(url).then(result=>{
        //保存gridcard
        this.gridcard = result.data;
        //console.log(this.gridcard);
      })
    },
    handleGrid(){
      //1.发送ajax获取九宫格数据
      var url = "http://127.0.0.1:3000/grid";
      this.axios.get(url).then(result=>{
        //2.获取返回数据

      //3.保存gridlist
      this.gridlist = result.data;
      //console.log(result.data);
      });
    },
    //加载轮播图的数据
    handleImage(){
      //1.发送ajax获取轮播数据
      var url = "http://127.0.0.1:3000/live";
      this.axios.get(url).then(result=>{
        //2.获取返回结果
      //console.log(result.data.data);
      //3.保存data属性中
      this.navlist=result.data;
      //console.log(result.data);
      })
    }  
  },
}
</script>
<style scoped>
body{
  color:#333333; 
  text-decoration: none !important;
  margin:0 auto;
   background-color: #fff;
}
ul li{
  list-style: none;
}
.app-Home{
  outline: 0 none;
  width:100%;
  top:0;
  left:0;
  z-index: 100;
  background-color: #fff;
  padding-top:1px;
  margin-top: -42px;
}
.nav-big{
  width:100%;
  height: 60px;
  max-width: 100%;
  background: #fff;
  position: absolute;
  z-index: 10;
  position: fixed;
}
.room{
  width:7px;
  height:7px;
  text-decoration: none;
  float: left;
}
.room-img{
  width: 45px;
  height:45px;
  margin-top:8px;
  margin-left:20px;
}
.nav-img{
  width:121px;
  height:31px;
  margin-top: 14px;
  margin-left: 35%;
}
.menubtn{
  position: absolute;
  right:6%;
  top:35%;
  width:35px;
  height:35px;
  color:#000;
  font-size:16px;
}
.login{
  color:#000;
  font-size:17px;
}
.mui-icon-bars{
  font-size: 35px;
  color:#333333;
}
.banner{
  width:100%;
}
.mint-swipe{
  height:260px;
  margin-top: 60px;
}
.mint-swipe img{
  width:100%;
  height:100%;
}
.view-conten{
  margin-top:1px;
}
.ul-flex{
  width:345px;
  height:220px;
  display: flex;
  flex-wrap: wrap;
  justify-content: left;
  background: #fff !important;
}
.li-view{
  width:25%;
  margin-top:13px;
}
.view-div{
  width:46px;
  height:46px;
  margin: 0 auto;
  overflow: hidden;
  display: flex;
  align-items: center;
}
.view-img{
  width:100%;
}
.view-title{
  font-size:24px;
  color:#000;
}
.love-pic{
  margin-top:20px;
  height:500px;
  background-color: #fff;
  text-align: center;
  display: block;
}
.love-top{
  height:300px;
  padding:0 15px;
  box-sizing: border-box;
}
.tit{
  padding-bottom:15px; 
  font-family: "思源, microsoft yahei",Arial,Helvetica,sans-serif;
}
.tit h3 img{
  width:235px;
  height: 21px;
  margin:38px auto 0;
}
.tit h4 img{
  width:168px;
  height:10px;
}
.tit h5 img{
  width:79px;
  height:26px;
  margin: 0 auto;
}
.love-ul{
  width:345px;
  height:auto;
  list-style: none;
  margin:0 auto;
  padding: 0;
 
}
.love-ul h6{
  font-size: 14px;
  margin: 0;
  padding: 0;
  font-family: "思源, microsoft yahei",Arial,Helvetica,sans-serif;
  box-sizing: border-box;
  color:#000;
}
.love-li{
  vertical-align: middle;
  box-sizing: border-box;
  margin: 0;
  padding:0;
}
.love-li>h6{
  margin: 0;
  padding:15px 0 20px;
}
.love-li>h6>img{
  width:150px;
  height:30px;
  display: block;
  margin:0 auto;
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
  border-top-left-radius: 20px;
  border-top-right-radius: 20px;
}
.cont-text{
  width:304px;
  height:36.5px;
  text-align: left;
  padding:5px 18px 20px;
}
.cont-text h4{
  font-size: 16px;
  color:#0b0b0b;
  font-weight: 400;
  line-height: 2;
}
.cont-text h6{
  font-size:8px;
  color:#aaa;
  font-weight: 400;
  line-height: 11px;
  padding:0;
}
.anniu{
  height:17px;
}
.anniu a{
  font-size:16px;
  color:#0b0b0b;
  text-decoration:underline;
}
.mui-bar-tab{
  height:55px;
}
.mui-tab-label{
  padding-top:2px;
}
</style>





