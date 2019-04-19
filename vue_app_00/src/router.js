import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
//1:引入Test组件
import Login from "./components/tabbar/Login.vue"
import GoodList from "./components/tabbar/GoodList.vue"
import Home from "./components/tabbar/Home.vue"
import ShopCart from "./components/tabbar/ShopCart.vue"
import GoodInfo from "./components/tabbar/GoodInfo.vue"
import GoodUpwd from "./components/tabbar/GoodUpwd.vue"
Vue.use(Router)
//2:为Test组件配置访问路径 http://http://127.0.0.1:8080/#/名字
export default new Router({
  routes: [ 
    {path:'/GoodInfo',component:GoodInfo},
    {path:'/GoodUpwd',component:GoodUpwd},
    {path:'/',redirect:"/Home"},
    {path:'/Login',component:Login},
    {path:'/GoodList',component:GoodList},
    {path:'/Home',component:Home},
    {path:'/ShopCart',component:ShopCart}
  ]
})
