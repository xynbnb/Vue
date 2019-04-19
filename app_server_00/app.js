//app_server_00/app.js
//0:下载mysql express模块
//1.引入两个模块 mysql express
const mysql = require("mysql");
const express = require("express");
//1.1 引入模块 cors
//跨域需要的模块
const cors= require("cors");

//2.创建连接池
const pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    database:"veil",
});
//3:创建express对象
var server = express();
server.listen(3000);
//3.1 配置允许访问列
//配置允许跨域访问
server.use(cors({
    //允许访问的域名列表
    origin:["http://127.0.0.1:6060","http://localhost:6060"],
    //每次访问需要验证
    credentials:true
}));
//3.11:加载模块 express-session
const session = require("express-session");
server.use(session({
    secret:"128位随机字符串",
    resave:false,
    saveUninitialized:true,
    cookie:{
        maxAge:1000*60*60
    }
}))
//3.12:配置模块 

//3.2配置静态资源目录
server.use(express.static("public"));
//3.3配置第三方中间件
const bodyParser = require("body-parser");
//3.4配置json是否是自动转换
server.use(bodyParser.urlencoded(
{extended:false}))

//练习:NewInfo.vue
//0:为发表评论绑定单击时间
//1.获取评论内容
//2.获取新闻编号
//3.发送ajax  post请求
//4.获取返回结果
//5.如果评论成功 清空原有发表内容


//4:为express对象绑定监听端口 3000



//启动 app.js
//测试

//功能四:首页九宫格


//1.用户get 请求路径/login
server.get('/login',(req,res)=>{
    //2.获取两个参数 uname upwd
    //测试 启动node app.js
    // http://127.0.0.1:3000/login?uname=tom&upwd=123
    var u = req.query.uname;
    var p = req.query.upwd;
    //3.创建sql
    var sql = "select id from veil_login where uname=? and upwd=md5(?)";
    //4.执行sql
    pool.query(sql,[u,p],(err,result)=>{
        if(err) throw err;
        //5.获取数据库返回结果
        //res.send(result);
        //6.返回客户数据
            if(result.length==0){
                res.send({code:-1,msg:"用户名或密码有误"})
            }else{
                //登录成功
                //获取用户id
                var uid = result[0].id;
                //保存session对象
                req.session.uid = uid;
                res.send({code:1,msg:"登录成功"});
            }
        })
    });

//婚纱轮播图
server.get('/live',(req,res)=>{
    var sql = "select id,img_url from veil_banner";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});

//九宫格
server.get('/grid',(req,res)=>{
    var sql = "select id,title,img_url from veil_grid";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});

//卡片
server.get('/card',(req,res)=>{
    var sql = "select id,dname,title,img_url from veil_card";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
});


//婚纱列表
server.get('/list',(req,res)=>{
    var pno = req.query.pno;
    var pageSize = req.query.pageSize;
    if(!pno){pno=1}
    if(!pageSize){pageSize=2}
    var sql = "select id,img_url,dname,tel,addr,ctime from veil_goodlist LIMIT ?,?";
    var offset = (pno-1)*pageSize;
    pageSize = parseInt(pageSize);
    pool.query(sql,[offset,pageSize],(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })
})

//婚纱列表详情
server.get("/findProduct",(req,res)=>{
    //1.参数
    var lid = req.query.lid;
    //2.sql   select
    var sql = "select lid,price,title,lname,img_url";
    sql+=" from veil_product where lid = ?";
    //3.json  {code:1,data:[]}
    pool.query(sql,[lid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result})
    })
})
//购物车
server.get("/getShopCart",(req,res)=>{
    //1.参数
     var uid = 1;
    //2.sql
    var sql = " select id,pid,price,uid,pname,img_url";
    sql+= " from veil_shop";
    sql+= " where uid = ?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })
    //3.json
})

//功能十 删除购物车中的某个商品
server.post("/removeItem",(req,res)=>{
    var id=req.body.id;
    var sql="DELETE FROM veil_shop WHERE id = ?";
    id= parseInt(id);
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        //执行sql语句影响行数
        //INSERT UPDATE DELETE 判断条件
        if(result.affectedRows > 0){
            res.send({code:1,msg:"删除成功"});
        }else{
            res.send({code:-1,msg:"删除失败"});
        }
    })
});

//功能十一:删除用户选中(多个)商品
server.get("/removeMItem",(req,res)=>{
    //1.参数
    var ids=req.query.ids;
    //2.sql
    var sql="DELETE FROM veil_shop WHERE id IN ("+ids+")";
    //3. json
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"成功删除多个商品"});
        }else{
            res.send({code:-1,msg:"删除失败"});
        }
    })
});

//功能十二:用户点击添加购物车按钮
server.get("/addcart",(req,res)=>{
    //0:向数据表 xz_cart 添加一列count INT
    //ALTER TABLE xz_cart ADD count INT;
    //UPDATE xz_cart SET count = 1;
    //1:获取参数 uid pid pname price
    var uid = 1;
    var pid =    req.query.pid;
    var pname =  req.query.pname;
    var price =  req.query.price;
    var img_url =req.query.img_url;
    //2:判断用户是否登录
    //3:如果当前用户未登录 程序停止
    //  返回出错信息  请登录
    //4:创建sql语句查询当前用户是否添加过此商品
    var sql = "SELECT id FROM veil_shop";
    sql+=" WHERE uid = ? AND pid = ?";
    pool.query(sql,[uid,pid],(err,result)=>{
       if(err)throw err;
       //回调函数:什么时候执行函数
       //sql语句执行完毕并且返回结果
       if(result.length==0){
         var sql = `INSERT INTO veil_shop`;
         sql+=` VALUES(null,${uid},${pid},${price},'${pname}','${img_url}',1)`;
       }else{//10:34
         var sql = `UPDATE veil_shop SET`;
         sql+=` count=count+1`;
         sql+=` WHERE uid = ${uid} AND pid=${pid}`;
       }
       pool.query(sql,(err,result)=>{
         if(err)throw err;
         res.send({code:1,msg:"添加成功"})
       }); 
    })
});





  //功能六:新闻详细显示
server.get("/newsInfo",(req,res)=>{
    //1.获取客户参数
    var nid = req.query.nid;
    //2. 拦截用户非常参数
    var reg = /^[0-9]{1,}$/;
    if(!reg.test(nid)){
        res.send({code:-1,msg:"参数格式不正确"});
        return;
    };
    //2.SELECT id,content,ctime,img_url FROM xz_news WHERE id=?
    var sql = "SELECT id,content,ctime,img_url FROM xz_news WHERE id=?";
    nid =parseInt(nid);
    pool.query(sql,[nid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })
    //3.{code:1,data[]
})

//功能七:发送评论
server.post("/addcomment",(req,res)=>{
    //1.获取参数 nid 新闻编号 content评论内容
    var nid = req.body.nid;
    var content = req.body.content;
    //2.sql
    var sql="INSERT INTO xz_comment VALUES (null,?,?,now())";
    pool.query(sql,[nid,content],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"添加成功"})
    })
    //3.json
});

//功能八:评论列表
server.get("/getComment",(req,res)=>{
    //1:参数 
    var nid = req.query.nid;
    var pno = req.query.pno;
    var pageSize = req.query.pageSize;
    if(!pno){
      pno = 1;
    }
    if(!pageSize){
      pageSize = 5;
    }
    //2:sql
    var sql = " SELECT id,nid,content,ctime";
    sql+=" FROM xz_comment";
    sql+=" WHERE nid = ?";
    sql+=" LIMIT ?,?";
    var offset = (pno-1)*pageSize;
    pageSize = parseInt(pageSize);
    pool.query(sql,[nid,offset,pageSize],(err,result)=>{
      if(err)throw err;
      res.send({code:1,data:result});
    })
    //3:result
  })

//功能九:查询购物车列表
server.get("/getShopCart",(req,res)=>{
    //拦截没有登录用户
    if(!req.session.uid){
        res.send({code:-1,data:[],msg:"请登录"});
        return;
    }
    //1.参数 uid用户登录成功保存服务器
    //node.js 程序不是保存脚手架
    //服务器对象 session
    var uid = req.session.uid;  //后面会用session替换

    //2.sql
    var sql = "SELECT id,pid,price,uid,pname FROM xz_cart WHERE uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })
    //3.json
});


//功能十三:用户点击商品列表显示商品详细信息
server.get("/findProduct",(req,res)=>{
    //1:参数 lid 商品编号
    var lid = req.query.lid;
    //2:sql  select
    var sql = "SELECT lid,price,title,lname";
    sql+=" FROM veil_laptop WHERE lid = ?"; 
    //3:json {code:1,data:[]}
    pool.query(sql,[lid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,data:result})
    })
})