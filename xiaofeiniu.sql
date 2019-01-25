SET NAMES UTF8;
DROP DATABASES IF EXISTS xiaofeiniu;
CREATE DATABASES xiaofeiniu CHARSET UTF8;
USE xiaofeiniu;

#管理严信息表 xfn_admin
CREATE TABLE xfn_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,            #管理员编号
  ananme VARCHAR(32),  #管理员姓名
  apwd VARCHAR(64),    #管理员密码
  role
);
INSERT INTO xfn_admin VALUES(NULL,'tom','123456',null);
INSERT INTO xfn_admin VALUES(NULL,'tt','123456',null);
INSERT INTO xfn_admin VALUES(NULL,'zz','123456',null);
INSERT INTO xfn_admin VALUES(NULL,'dd','123456',null);
INSERT INTO xfn_admin VALUES(NULL,'zl','123456',null);

#项目全局设置表：xfn_settings
CREATE TABLE xfn_settings(
  sid INT ,  #编号
  appName VARCHAR(32), #应用APP名称
  apiUrl  VARCHAR(64), #数据API子系统地址
  adminUrl VARCHAR(64), #管理后台子系统地址
  appUrl  VARCHAR(64),#顾客APP子系统地址
  icp  VARCHAR(64),  #系统备案号
  copyright VARCHAR(128)  #版权声明号
)
INSERT INTO xfn_settings('1','小肥牛','127.0.0.0:3000','127.0.0.0:8080','127.0.0.0:8100',null,null);

#桌台信息表：xfn_table
CREATE TABLE xfn_table(
  tid INT PRIMARY KEY AUTO_INCREMENT,#桌台编号
  tname VARCHAR(64),#桌台昵称
  type VARCHAR(16),#桌台类型
  status INT(1) #桌台状态 1-空闲 2-预定 3-占用 4-其他
)
INSERT INTO(null,'周','2','1');
INSERT INTO(null,'吴','4','2');
INSERT INTO(null,'郑','2','3');
INSERT INTO(null,'王','2','4');
INSERT INTO(null,'杨','2','1');
INSERT INTO(null,'乔','2','2');
INSERT INTO(null,'张','2','3');
INSERT INTO(null,'李','2','4');
INSERT INTO(null,'夏','2','1');

#桌台预定信息表 xfn_reservation
CREATE TABLE xfn_reservation(
  rid INT PRIMARY KEY,#桌台编号
  contactName VARCHAR(32),#联系人姓名
  phone VARCHAR(16),#联系人电话
  contactTime BIGINT,#预约时间
  dinnerTime BIGINT #用餐时间
)
INSERT INTO('1','dingdng','18711111111','2019-1-1','2019-1-1');
INSERT INTO('1','dangdang','18711111112','2019-1-1','2019-1-1');
INSERT INTO('1','mingming','18711111113','2019-1-1','2019-1-1');
INSERT INTO('1','dongdong','18711111114','2019-1-1','2019-1-1');
INSERT INTO('1','leilei','18711111115','2019-1-1','2019-1-1');

#菜品分类表：xfn_category
CREATE TABLE xfn_category(
  cid INT PRIMARY KEY,#类别编号
  cname VARCHAR(32) #类别名称
)
INSERT INTO('1','肉类');
INSERT INTO('2','蔬菜类');
INSERT INTO('3','豆制品类');
INSERT INTO('4','丸滑类');
INSERT INTO('5','水果类');

#菜品信息表：xfn_dish
CREATE TABLE(
  did INT PRIMARY KEY,
  title VARCHAR(32),
  imageUrl VARCHAR(128),
  price DECIMAL(6,2),
  detail VARCHAR(128),
  categropid INT
)
INSERT INTO('1','牛肉','','199','aaaaaaaa',)

