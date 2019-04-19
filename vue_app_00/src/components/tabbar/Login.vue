<template>
    <div class="app-login">
        <header class="mui-bar mui-bar-nav" style="background:#009ae4">
			<router-link to="/home" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title" style="color:#fff">用户注册</h1>
		</header>
        <form>
            <input type="text" v-model="uname" name="uname" placeholder="请输入您的用户名"><br>
            <input type="password" v-model="upwd" name="upwd" placeholder="请输入您的用户密码"><br>
            <div class="jump">
                <router-link class="upwd" to="/goodupwd">重置密码</router-link>
                <router-link class="zc" to="">注册</router-link>
            </div>
            <input type="button" @click="btnLogin" value="登录" class="dl">
        </form>
        
    </div>
</template>
<script>
//1:引入mint-ui Toast 局部使用
import {Toast} from "mint-ui"
export default {
    data(){
        return{ uname:"",
                upwd:"",
        }
    },
    methods: {
        btnLogin(){
           //console.log("123");
            //1.获取用户输入用户名和密码
            var u = this.uname;
            var p = this.upwd;
            //console.log(u+":"+p);
            //2.创建正则表达式验证用户名和密码格式是否正确
            var reg=/^[a-z0-9_]{3,8}$/i;
            if(!reg.test(u)){
                //提示信息不是 alert();
                Toast("用户名格式不正确,请检查");
                return;
            }
            if(!reg.test(p)){
                Toast("密码格式不正确,请检查");
                return;
            }
            //3.发送ajax
            //console.log(3);
            var url = "http://127.0.0.1:3000/login?uname="+u+"&upwd="+p;
            this.axios.get(url).then(result=>{
                //console.log(result.data.code);
                //console.log(result.data.msg);
                if(result.data.code==1){
                    Toast("登录成功 3s后跳转首页");
                        setTimeout(function(){
                        location.href="http://127.0.0.1:6060/#/home";
                        },3000)
                    }else{
                        Toast("用户名或密码有误");
                    }
            })
            //4.获取服务器返回结果
            //5.提示用户
        }
    }
}
</script>
<style scoped>
    .app-login{
        margin-top: -40px;
    }
    form{
        margin-top:75px;
    }
    .dl{
        margin-left:40%;
        width:95px;
        border-radius: 4px;
        font-size: 17px;
        background:#26a2ff !important;
        color:#fff;
    }
    .jump{
        height:40px;
        line-height:.8rem;
        margin:0 auto;
        margin-top:20px;
    }
    .upwd{
        float: left;
        font-size:20px;
        color:#009ae4;
        display: block;
        margin-left:5px;
    }
    .zc{
        float: right;
        margin-right:5px;
        color:#009ae4;
        display: block;
        font-size: 20px;
    }
    .mui-icon-back:before, .mui-icon-left-nav:before{
        color:#fff;
    }
</style>