<template>
    <div class="app-shopcart">
        <!-- 
            1.添加card.html卡片
            2.添加媒体头目
            3.发送请求获取购物车列表
            4.保存显示
         -->
         <header class="mui-bar mui-bar-nav" style="background:#009ae4">
			<router-link to="/goodlist" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
			<h1 class="mui-title" style="color:#fff">购物车</h1>
		</header>
         <div class="mui-card">
            <div class="mui-card-header">          
                <!-- 
                    1.添加复选框
                    2.为复选框绑定点击事件
                    3.如果选中状态 所有商品选中
                    4.如果清除状态 所有商品清除
                 -->
                <div>
                全选
                <input type="checkbox" @click="selectAll" :checked="allcb">
                </div>
            </div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <!--商品信息开始  -->
                    <ul class="mui-table-view">
                        <li v-for="(item,i) of list" class="mui-table-view-cell mui-media shop-li" :key="item.id">
                            <a href="javascript:;">
                                <img class="mui-media-object mui-pull-left" :src="item.img_url">
                                <div class="mui-media-body">
                                    <p class='mui-ellipsis'>
                                        <!-- 商品前复选框 -->
                                        <input type="checkbox" :data-id="item.id" :checked="item.cb" @click="modifyItem" :data-i="i">
                                        <!--  -->
                                        {{item.pname}}&nbsp;&nbsp;&nbsp;&nbsp;
                                        价格:{{item.price}}
                                        <input class="del" type="button" value="删除" :data-id="item.id"      :data-idx="i" @click="removeItem"/>
                                    </p>
                                </div>
                            </a>
                        </li>
                    </ul>
                <!--商品信息结束  -->
                </div>
            </div>
            <div class="mui-card-footer">
                <input type="button" value="删除选中商品" @click="delItem">
            </div>
		</div>
    </div>
</template>
<script>
import {Toast} from "mint-ui"
export default {
    data(){
        return {
            list:[], //购物车列表
            allcb:false  //全选的状态 默认是未选中false
        }
    },
    created() {
        this.loadMore();
    },
    methods: {
        //全选按钮
        selectAll(e){
            //console.log(123);
            //1.获取全选按钮选中状态
            var rs=e.target.checked;
            //2:遍历数据所有元素
            for(var item of this.list){
                item.cb=rs;
            }
            //3.item.cb = 全选状态
            //4 修改全选框的状态
            item.allcb= rs;
        },
            //1:当前购物车商品内容前添加复选框
            //2:为复选框添加自定义属性id
            //3:cart-footer 添加按钮 删除指定商品
            //4:为按钮绑定时间获取选中商品id "4,6,8"
        //修改复选框状态 选中 取消
        modifyItem(e){
            //1:获取当前元素选中状态 true  false
            var rs = e.target.checked;
            //console.log(rs)
            //2:当前元素在数组中下标
            var i = e.target.dataset.i;
            //console.log(rs+":"+i);
            //3.将状态赋值当前数组下标中对象cb值
            this.list[i].cb = rs;
            //console.log(this.list);
            //判断全选复选框状态  true false
            //1.获取数组个数
            var size1=this.list.length;
            //console.log(list);
            //2.计算数组中cb true 元素个数
            var count = 0;
            for(var item of this.list){
                if(item.cb){
                    count++;
                }
            }
            //console.log(size1+":"+count);
            //3.数组个数==撤吧true 个数 [累加和]
            if( size1 == count){
                this.allcb = true;
            }else{
                this.allcb = false;
            }
            //4. 将allcb = true
            //5. 否则allcb==false
        },
        //删除选中多个商品
        delItem(){
            //[{cb:true,id:1},{cb:true,id:3}]
            //"1,3"
            //1:创建空字符串
            var html=""; 
            //2:遍历数据中元素
            for(var item of this.list){
            //3:判断cb==true
                if(item.cb){
            //4:保存id拼接字符串 "1,6,7"
                    html+=item.id+","
                }
            }
            //console.log("|"+html+"|");
            //return
            if(html.length==0){
                Toast("请选中你需要删除的商品");
                return;
            }
            //5:截取字符串去除最后,  "1,6,7"
            //substring(?,?)
            //?截取起始下标
            //?截取几个字符
            html=html.substring(0,html.length-1);
            console.log(html);
            //6:发送ajax ids=1,6,7
            var url="http://127.0.0.1:3000";
            url+="/removeMItem?ids="+html;
            this.axios.get(url).then(result=>{
                if(result.data.code==1){
                    Toast("删除成功");
                    this.loadMore();
                }else{
                    Toast("删除失败");
                }
            })
            //7:获取返回数据提示  删除成功或失败
        },
        removeItem(e){
            //1.获取购物车商品id
           var id=e.target.dataset.id;
           var idx=e.target.dataset.idx;
           console.log(id);
            //2.创建url
            var url="http://127.0.0.1:3000/removeItem";
            var postData = this.qs.stringify({
                id:id
            });
            //3.发送ajax请求
            this.axios.post(url,postData).then(result=>{
                if(result.data.code==1){
                    //删除对应数据中值
                    //1:获取下标
                    //2:依据下标删除指定数组商品
                    //删除数组中对应下标商品
                    //splice(数组下标,个数)
                    this.list.splice(idx,1);
                    Toast("删除成功");
                }else{
                    Toast("删除失败");
                }
            })
            //4.获取返回结果
            //5.提示删除结果
            //6.list对应商品项删除?
        },
        //加载当前用户购物车列表
        loadMore(){
            //1.创建url地址
            var url="http://127.0.0.1:3000/getShopCart";
            //2.发送ajax请求
            this.axios.get(url).then(result=>{
            //?3.获取返回数据
            //console.log(result.data.data);
            //?4.保存list
                //this.list=result.data.data;
                //console.log(this.list);
            //?5.循环显示
            //新添加功能:复选状态
            //6.获取返回数组
            var rows= result.data.data;
            //7.为数组中每个对象添加属性cb初始值false
            for(var item of rows){
                item.cb=false;
            }
            //8.将数据保存list中
            this.list=rows;
            //console.log(this.list);
            });
        }
    }
}
//选中某个商品 * 将对应数组对象cb=true
//             清空将对应数组对象cb=false
</script>
<style scoped>
    .mui-table-view .mui-media-object{
        max-width: 60px;
        max-height:60px;
    }
    .mui-ellipsis{
        margin-top:10px;
    }
    .del{
        float:right;
    }
    .shop-li{
        height:75px;
    }
</style>