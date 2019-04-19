<template>
 <div class="app-container">
    <!-- App.vue 组件 -->
    <!-- 1.公共顶部导航条 -->
    <!-- <mt-header title="学子商城" fixed></mt-header> -->
    <!-- 2.容器显示其他组件 -->
    <router-view></router-view>
    <!-- 3.底部tabbar -->
    <nav class="mui-bar mui-bar-tab">
      <router-link class="mui-tab-item" to="/home">
         <span class="mui-icon mui-icon-home"></span>
         <span class="mui-tab-label">首页</span>
      </router-link>
      <router-link class="mui-tab-item" to="/goodlist">
         <span class="mui-icon mui-icon-plus"></span>
         <span class="mui-tab-label">好评列表</span>
      </router-link>
      <router-link class="mui-tab-item" to="/shopcart">
         <span class="mui-icon mui-icon-phone"></span>
         <span class="mui-tab-label">购物车</span>
      </router-link>
      <router-link class="mui-tab-item" to="/login">
        <span class="mui-icon mui-icon-contact"></span>
         <span class="mui-tab-label">个人中心</span>
      </router-link>
	</nav>
 </div>
</template>

<style> 
    .app-container{
     padding-top:40px;
     padding-bottom:0px;
     overflow-x:hidden;
     background:#fff !important;
   } 
</style>
