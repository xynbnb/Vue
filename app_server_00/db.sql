#app_server_00/db.sql
#完成任务用户登录
#创建用户表 xz_login
#添加一行数据
INSERT INTO 表名 VALUES(新值1,..)
#更新数据
UPDATE 表名 SET 列=新值 WHERE 条件
#删除指定数据(少用)
DELETE FROM 表名 WHERE 条件;
#查询(不要用*号) 需要哪列查询哪列
SELECT * FROM 表名

#示例:
SELECT id,uname,upwd FROM xz_login;
INSERT INTO xz_login VALUES(null,'kk',md5('123'));
#将id=2用户密码修改 456
UPDATE xz_login SET upwd=md5('456')
WHERE id = 2;
DELETE FROM xz_login WHERE id = 2;

CREATE TABLE xz_login(
  id   INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(25),
  upwd  VARCHAR(32)
);
INSERT INTO xz_login
 VALUES(null,'tom',md5('123'));


#创建新闻表
#xz_news
#   id INT
#   img_url VARCHAR(255)
#   title   VARCHAR(225)
#   ctime  DATETIME
#   point   INT
#   content VARCHAR(20000)
CREATE TABLE xz_news(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(255),
  title VARCHAR(255),
  ctime DATETIME,
  point INT,
  content VARCHAR(2000)
);
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'111',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'112',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'113',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'114',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'115',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'116',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'117',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'118',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'119',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1110',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1111',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1112',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1113',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1114',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1115',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1116',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1117',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1118',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'1119',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'11120',now(),0,'111');
INSERT INTO xz_news VALUES(null,
'http://127.0.0.1:3000/img/1.png',
'11121',now(),0,'111');


#创建新闻评论表
CREATE TABLE xz_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nid INT,
  content VARCHAR(120),
  ctime DATETIME
);

#创建购物车表
#货币误差 小数 1-0.99=0.100000000001
#price INT 要求精度高不允许
#1.99*100=199 单位分 200/100=2.00
CREATE TABLE xz_cart(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  pid INT,
  price DECIMAL(10,2),
  pname VARCHAR(255)
);
INSERT INTO xz_cart VALUES(null,1,11,100,'茶');
INSERT INTO xz_cart VALUES(null,1,12,200,'烟');
INSERT INTO xz_cart VALUES(null,1,13,300,'酒');
INSERT INTO xz_cart VALUES(null,1,14,100,'茶');
INSERT INTO xz_cart VALUES(null,1,15,200,'烟');
INSERT INTO xz_cart VALUES(null,1,16,300,'酒');
INSERT INTO xz_cart VALUES(null,1,17,100,'茶');
INSERT INTO xz_cart VALUES(null,1,18,200,'烟');
INSERT INTO xz_cart VALUES(null,1,19,300,'酒');
INSERT INTO xz_cart VALUES(null,1,20,100,'茶');
INSERT INTO xz_cart VALUES(null,1,21,200,'烟');
INSERT INTO xz_cart VALUES(null,1,22,300,'酒');
INSERT INTO xz_cart VALUES(null,1,23,300,'酒');
INSERT INTO xz_cart VALUES(null,1,24,100,'茶');
INSERT INTO xz_cart VALUES(null,1,25,200,'烟');
INSERT INTO xz_cart VALUES(null,1,26,300,'酒');