#设置客户端连接服务器使用的编码为UTF8
SET NAMES UTF8;
#丢弃数据库veil，如果存在
DROP DATABASE IF EXISTS veil;
#创建数据库时，设置存储的编码为UTF8
CREATE DATABASE veil CHARSET=UTF8;
#进入该数据库
USE veil;

#创建轮播表
#veil_banner_news
#   id INT
#   img_url VARCHAR(255)

CREATE TABLE veil_banner(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255)
);
INSERT INTO veil_banner VALUES(null,'http://127.0.0.1:3000/img/index/7240a28283ca1ca01230e08f16649a2e.jpg');
INSERT INTO veil_banner VALUES(null,'http://127.0.0.1:3000/img/index/e3acce3ccc0e294098db90a01c3b79a0.jpg');
INSERT INTO veil_banner VALUES(null,'http://127.0.0.1:3000/img/index/91da95abb33e8ed461a8570d4fac7aea.jpg');
INSERT INTO veil_banner VALUES(null,'http://127.0.0.1:3000/img/index/6894f9ea4738fea90f28df2767c2a510.jpg');
INSERT INTO veil_banner VALUES(null,'http://127.0.0.1:3000/img/index/5635e96af1f52002b7f0d672f57fbc76.jpg');


#创建九宫格表
#veil_grid_news
#   id INT
#   img_url VARCHAR(255)


CREATE TABLE veil_grid(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  img_url VARCHAR(255)
);
INSERT INTO veil_grid VALUES(null,'最新样式','http://127.0.0.1:3000/img/grid/worimg1.png');
INSERT INTO veil_grid VALUES(null,'最美客片','http://127.0.0.1:3000/img/grid/worimg2.png');
INSERT INTO veil_grid VALUES(null,'人气活动','http://127.0.0.1:3000/img/grid/worimg3.png');
INSERT INTO veil_grid VALUES(null,'品牌介绍','http://127.0.0.1:3000/img/grid/worimg4.png');
INSERT INTO veil_grid VALUES(null,'新闻动态','http://127.0.0.1:3000/img/grid/worimg5.png');
INSERT INTO veil_grid VALUES(null,'风格样片','http://127.0.0.1:3000/img/grid/worimg6.png');
INSERT INTO veil_grid VALUES(null,'报价咨询','http://127.0.0.1:3000/img/grid/worimg7.png');
INSERT INTO veil_grid VALUES(null,'客户评价','http://127.0.0.1:3000/img/grid/worimg8.png');


#卡片
CREATE TABLE veil_card(
  id INT PRIMARY KEY AUTO_INCREMENT,
  dname VARCHAR(255),
  title VARCHAR(32),
  img_url VARCHAR(255)
);
INSERT INTO veil_card VALUES(null,'合约恋人','韩式婚照品质之选','http://127.0.0.1:3000/img/vueCard/1-1P3101356264Z.jpg');
INSERT INTO veil_card VALUES(null,'清晨','韩式婚照品质之选','http://127.0.0.1:3000/img/vueCard/1-1P310140621X4.jpg');
INSERT INTO veil_card VALUES(null,'风筝','韩式婚照品质之选','http://127.0.0.1:3000/img/vueCard/1-1P310140345460.jpg');
INSERT INTO veil_card VALUES(null,'浪漫邂逅','韩式婚照品质之选','http://127.0.0.1:3000/img/vueCard/1-1P31014495I20.jpg');


#好评列表
CREATE TABLE veil_goodlist(
   id INT PRIMARY KEY AUTO_INCREMENT,
   img_url VARCHAR(255),
   dname VARCHAR(255),
   tel   VARCHAR(25),
   addr  VARCHAR(255),
   ctime VARCHAR(25)
);
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-1.jpg","爱在绿意","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-2.jpg","乡村气息","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-3.jpg","唯美瞬间","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-4.jpg","美的行踪","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-5.jpg","恬静美丽","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-6.jpg","美丽依然","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-7.jpg","灯火阑珊","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-8.jpg","暖暖心意","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-9.jpg","天真可爱","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-10.jpg","夏日午茶","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-11.jpg","情话微甜","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-12.jpg","校园时光","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-13.jpg","花样年华","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-14.jpg","满园春色","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-15.jpg","校园简信","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-16.jpg","江南小城","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-17.jpg","青春飞扬","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-18.jpg","爱在绿意","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-19.jpg","唯美信号","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-20.jpg","冬日恋歌","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-21.jpg","恋人絮语","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-22.jpg","星夜之空","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-23.jpg","一起看海","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-24.jpg","唯美物语","13999999999","北京","9:00~18:00");
INSERT INTO veil_goodlist VALUES(null,"http://127.0.0.1:3000/img/vueList/list-25.jpg","香草恋人","13999999999","北京","9:00~18:00");

#登录用户表
CREATE TABLE veil_login(
  id   INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),
  upwd  VARCHAR(32)
);
INSERT INTO veil_login VALUES(null,'tom',md5('123'));
INSERT INTO veil_login VALUES(null,'hxy',md5('456'));

#商品详情表

CREATE TABLE veil_product(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  price DECIMAL(10,2),
  title VARCHAR(128),
  lname VARCHAR(32),
  img_url VARCHAR(255)
);
INSERT INTO veil_product VALUES(1,2999,"爱在绿意","纯色摄影","http://127.0.0.1:3000/img/vueList/list-1.jpg");
INSERT INTO veil_product VALUES(2,3466,"乡村气息","纯色摄影","http://127.0.0.1:3000/img/vueList/list-2.jpg");
INSERT INTO veil_product VALUES(3,3333,"唯美瞬间","纯色摄影","http://127.0.0.1:3000/img/vueList/list-3.jpg");
INSERT INTO veil_product VALUES(4,1999,"美的行踪","纯色摄影","http://127.0.0.1:3000/img/vueList/list-4.jpg");
INSERT INTO veil_product VALUES(5,2999,"恬静美丽","纯色摄影","http://127.0.0.1:3000/img/vueList/list-5.jpg");
INSERT INTO veil_product VALUES(6,4998,"美丽依然","纯色摄影","http://127.0.0.1:3000/img/vueList/list-6.jpg");
INSERT INTO veil_product VALUES(7,5248,"灯火阑珊","纯色摄影","http://127.0.0.1:3000/img/vueList/list-7.jpg");
INSERT INTO veil_product VALUES(8,5210,"暖暖心意","纯色摄影","http://127.0.0.1:3000/img/vueList/list-8.jpg");
INSERT INTO veil_product VALUES(9,1314,"天真可爱","纯色摄影","http://127.0.0.1:3000/img/vueList/list-9.jpg");
INSERT INTO veil_product VALUES(10,1990,"夏日午茶","纯色摄影","http://127.0.0.1:3000/img/vueList/list-10.jpg");
INSERT INTO veil_product VALUES(11,2666,"情话微甜","纯色摄影","http://127.0.0.1:3000/img/vueList/list-11.jpg");
INSERT INTO veil_product VALUES(12,1999,"校园时光","纯色摄影","http://127.0.0.1:3000/img/vueList/list-12.jpg");
INSERT INTO veil_product VALUES(13,1998,"花样年华","纯色摄影","http://127.0.0.1:3000/img/vueList/list-13.jpg");
INSERT INTO veil_product VALUES(14,2999,"满园春色","纯色摄影","http://127.0.0.1:3000/img/vueList/list-14.jpg");
INSERT INTO veil_product VALUES(15,2666,"校园简信","纯色摄影","http://127.0.0.1:3000/img/vueList/list-15.jpg");
INSERT INTO veil_product VALUES(16,2555,"江南小城","纯色摄影","http://127.0.0.1:3000/img/vueList/list-16.jpg");
INSERT INTO veil_product VALUES(17,2444,"青春飞扬","纯色摄影","http://127.0.0.1:3000/img/vueList/list-17.jpg");
INSERT INTO veil_product VALUES(18,4646,"爱在绿意","纯色摄影","http://127.0.0.1:3000/img/vueList/list-18.jpg");
INSERT INTO veil_product VALUES(19,3344,"唯美信号","纯色摄影","http://127.0.0.1:3000/img/vueList/list-19.jpg");
INSERT INTO veil_product VALUES(20,9999,"冬日恋歌","纯色摄影","http://127.0.0.1:3000/img/vueList/list-20.jpg");
INSERT INTO veil_product VALUES(21,6666,"恋人絮语","纯色摄影","http://127.0.0.1:3000/img/vueList/list-21.jpg");
INSERT INTO veil_product VALUES(22,6161,"星夜之空","纯色摄影","http://127.0.0.1:3000/img/vueList/list-22.jpg");
INSERT INTO veil_product VALUES(23,5555,"一起看海","纯色摄影","http://127.0.0.1:3000/img/vueList/list-23.jpg");
INSERT INTO veil_product VALUES(24,4444,"唯美物语","纯色摄影","http://127.0.0.1:3000/img/vueList/list-24.jpg");
INSERT INTO veil_product VALUES(25,7777,"香草恋人","纯色摄影","http://127.0.0.1:3000/img/vueList/list-25.jpg");

#购物车列表
CREATE TABLE veil_shop(
  id INT PRIMARY key AUTO_INCREMENT,
  uid INT,
  pid INT,
  price DECIMAL(10,2),
  pname VARCHAR(255),
  img_url VARCHAR(255),
  count INT
);
