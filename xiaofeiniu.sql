SET NAMES UTF8;
CREATE DATABASE xiaofeiniu CHARSET UTF8;
USE xiaofeiniu;

#管理员信息表 xfn_admin
CREATE TABLE xfn_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,            #管理员编号
  ananme VARCHAR(32) UNIQUE,  #管理员姓名
  apwd VARCHAR(64)    #管理员密码
);
INSERT INTO xfn_admin VALUES(NULL,'admin',PASSWORD('123456'));
INSERT INTO xfn_admin VALUES(NULL,'boss',PASSWORD('999999'));

#项目全局设置表：xfn_settings
CREATE TABLE xfn_settings(
  sid INT PRIMARY KEY AUTO_INCREMENT,  #编号
  appName VARCHAR(32), #应用APP名称
  apiUrl  VARCHAR(64), #数据API子系统地址
  adminUrl VARCHAR(64), #管理后台子系统地址
  appUrl  VARCHAR(64),#顾客APP子系统地址
  icp  VARCHAR(64),  #系统备案号
  copyright VARCHAR(128)  #版权声明号
);
INSERT INTO xfn_settings VALUES(NULL,'小肥牛','127.0.0.1:8090','127.0.0.1:8091','127.0.0.0:8092','京ICP备12003709号-3','Copyright © 北京达内金桥科技有限公司版权所有');

#桌台信息表：xfn_table
CREATE TABLE xfn_table(
  tid INT PRIMARY KEY AUTO_INCREMENT,#桌台编号
  tname VARCHAR(64),#桌台昵称
  type VARCHAR(16),#桌台类型
  status INT(1) #桌台状态 1-空闲 2-预定 3-占用 4-其他
);
INSERT INTO xfn_table VALUES(NULL,'周','2人桌','1');
INSERT INTO xfn_table VALUES(NULL,'吴','4人桌','2');
INSERT INTO xfn_table VALUES(NULL,'郑','2人桌','3');
INSERT INTO xfn_table VALUES(NULL,'王','2人桌','4');
INSERT INTO xfn_table VALUES(NULL,'杨','2人桌','1');
INSERT INTO xfn_table VALUES(NULL,'乔','2人桌','2');
INSERT INTO xfn_table VALUES(NULL,'张','2人桌','3');
INSERT INTO xfn_table VALUES(NULL,'李','2人桌','4');
INSERT INTO xfn_table VALUES(NULL,'夏','2人桌','1');

#桌台预定信息表 xfn_reservation
CREATE TABLE xfn_reservation(
  rid INT PRIMARY KEY AUTO_INCREMENT,#桌台编号
  contactName VARCHAR(32),#联系人姓名
  phone VARCHAR(16),#联系人电话
  contactTime BIGINT,#预约时间
  dinnerTime BIGINT #用餐时间
);
INSERT INTO xfn_reservation VALUES(NULL,'dingdng','18711111111','1548407367523','1548407399698');
INSERT INTO xfn_reservation VALUES(NULL,'dangdang','18711111112','1548407367523','1548407399698');
INSERT INTO xfn_reservation VALUES(NULL,'mingming','18711111113','1548407367523','1548407399698');
INSERT INTO xfn_reservation VALUES(NULL,'dongdong','18711111114','1548407367523','1548407399698');
INSERT INTO xfn_reservation VALUES(NULL,'leilei','18711111115','1548407367523','1548407399698');

#菜品分类表：xfn_category
CREATE TABLE xfn_category(
  cid INT PRIMARY KEY AUTO_INCREMENT,#类别编号
  cname VARCHAR(32) #类别名称
);
INSERT INTO xfn_category VALUES('1','肉类');
INSERT INTO xfn_category VALUES('2','蔬菜类');
INSERT INTO xfn_category VALUES('3','豆制品类');
INSERT INTO xfn_category VALUES('4','丸滑类');
INSERT INTO xfn_category VALUES('5','菌菇类');

#/*菜品信息表：xfn_dish*/
CREATE TABLE(
  did INT PRIMARY KEY AUTO_INCREMENT,SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaofeiniu;
CREATE DATABASE xiaofeiniu CHARSET=UTF8;
USE xiaofeiniu;

/*管理员*/
CREATE TABLE xfn_admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  aname VARCHAR(32) UNIQUE,
  apwd VARCHAR(64)
);
INSERT INTO xfn_admin VALUES
(NULL, 'admin', PASSWORD('123456')),
(NULL, 'boss', PASSWORD('999999'));

/*全局设置*/
CREATE TABLE xfn_settings(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  appName VARCHAR(32),
  apiUrl VARCHAR(64),
  adminUrl VARCHAR(64),
  appUrl VARCHAR(64),
  icp VARCHAR(64),
  copyright VARCHAR(128)
);
INSERT INTO xfn_settings VALUES
(NULL, '小肥牛', 'http://127.0.0.1:8090', 'http://127.0.0.1:8091', 'http://127.0.0.1:8092', '京ICP备12003709号-3', 'Copyright © 北京达内金桥科技有限公司版权所有');

/*桌台表*/
CREATE TABLE xfn_table(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  tname VARCHAR(32),
  type VARCHAR(32),
  status INT
);
INSERT INTO xfn_table VALUES
(1, '金镶玉', '2人桌', 1),
(2, '玉如意', '2人桌', 1),
(3, '齐天寿', '6人桌', 3),
(5, '福临门', '4人桌', 2),
(6, '全家福', '6人桌', 3),
(7, '展宏图', '2人桌', 1),
(8, '万年长', '8人桌', 1),
(9, '百事通', '4人桌', 3),
(10, '满堂彩', '10人桌', 2),
(11, '鸿运头', '8人桌', 1),
(12, '福满堂', '12人桌', 1),
(13, '高升阁', '4人桌', 3),
(15, '乐逍遥', '2人桌',3);

/*桌台预定信息*/
CREATE TABLE xfn_reservation(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  contactName VARCHAR(32),
  phone VARCHAR(16),
  contactTime BIGINT,
  dinnerTime BIGINT,
  tableId INT,
  FOREIGN KEY(tableId) REFERENCES xfn_table(tid)
);
INSERT INTO xfn_reservation VALUES
(NULL, '丁丁', '13501234561', '1548311700000', '1549011000000', '1'),
(NULL, '当当', '13501234562', '1548311710000', '1549011100000', '1'),
(NULL, '豆豆', '13501234563', '1548311720000', '1549011200000', '2'),
(NULL, '丫丫', '13501234564', '1548311730000', '1549011300000', '2'),
(NULL, '丁丁', '13501234565', '1548311740000', '1549011400000', '3'),
(NULL, '当当', '13501234566', '1548311750000', '1549011500000', '3'),
(NULL, '豆豆', '13501234561', '1548311760000', '1549011600000', '5'),
(NULL, '丫丫', '13501234562', '1548311770000', '1549011700000', '5'),
(NULL, '丁丁', '13501234563', '1548311780000', '1549011800000', '6'),
(NULL, '当当', '13501234564', '1548311790000', '1549011900000', '6'),
(NULL, '豆豆', '13501234565', '1548311800000', '1549011000000', '7'),
(NULL, '丫丫', '13501234566', '1548311810000', '1549011100000', '8'),
(NULL, '豆豆', '13501234567', '1548311820000', '1549011200000', '9'),
(NULL, '丫丫', '13501234561', '1548311840000', '1549011300000', '10'),
(NULL, '丁丁', '13501234562', '1548311850000', '1549011400000', '10'),
(NULL, '当当', '13501234563', '1548311860000', '1549011500000', '11'),
(NULL, '豆豆', '13501234564', '1548311870000', '1549011600000', '11'),
(NULL, '丫丫', '13501234565', '1548311880000', '1549011600000', '12'),
(NULL, '豆豆', '13501234566', '1548311890000', '1549011500000', '13'),
(NULL, '当当', '13501234567', '1548311900000', '1549011300000', '13'),
(NULL, '丫丫', '13501234568', '1548311910000', '1549011200000', '15');

/*菜品类别*/
CREATE TABLE xfn_category(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(32)
);
INSERT INTO xfn_category VALUES
(1, '肉类'),
(2, '海鲜河鲜'),
(3, '丸滑类'),
(4, '蔬菜豆制品'),
(5, '菌菇类');

/*菜品*/
CREATE TABLE xfn_dish(
  did INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(32),
  imgUrl VARCHAR(128),
  price DECIMAL(6,2),
  detail VARCHAR(128),
  categoryId INT,
  FOREIGN KEY(categoryId) REFERENCES xfn_category(cid)
);
INSERT INTO xfn_dish VALUES
(NULL, '草鱼片', 'r9470.jpg', '35', '选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用', '1'),
(NULL, '脆皮肠', 'r9017.jpg', '15', '锅开后再煮3分钟左右即可食用', '1'),
(NULL, '酥肉', 'r4760.jpg', '25', '选用冷鲜五花肉，加上鸡蛋，淀粉等原料炸制，色泽黄亮，酥软醇香，肥而不腻。锅开后再煮3分钟左右即可食用', '1'),
(NULL, '牛百叶', 'r9302.jpg', '40', '毛肚切丝后，配以调味料腌制而成。锅开后再煮2分钟左右即可食用', '1'),
(NULL, '腰花', 'r9287.jpg', '32', '选用大型厂家冷鲜腰花，经过解冻、清洗、切片而成。锅开后涮30秒左右即可食用', '1'),
(NULL, '猪脑花', 'r9711.jpg', '28', '选用大型厂家冷鲜猪脑经过清洗，过水、撕膜而成。肉质细腻，锅开后再煮8分钟左右即可食用', '1'),
(NULL, '草鱼片', 'r9470.jpg', '35', '选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用', '1'),
(NULL, '脆皮肠', 'r9017.jpg', '15', '锅开后再煮3分钟左右即可食用', '1'),
(NULL, '午餐肉', 'r6110.jpg', '18', '锅开后再煮2分钟左右即可食用', '1'),
(NULL, '牛仔骨', 'r7130.jpg', '43', '牛仔骨又称牛小排，选自资质合格的厂家生产配送。锅开后再煮5分钟左右即可食用', '1'),
(NULL, '新西兰羊肉卷', 'r8110.jpg', '52', '选用新西兰羔羊肉的前胸和肩胛为原料，在国内经过分割、压制成型，肥瘦均匀。锅开后涮30秒左右即可食用', '1'),
(NULL, '捞派嫩羊肉', 'r1238.jpg', '48', '海底捞只选用生长周期达到6—8个月的草原羔羊，肉嫩筋少而膻味少', '1'),
(NULL, '澳洲肥牛', 'r6213.jpg', '68', '百分百澳洲牛肉的前胸部位，口感香嫩，汁浓味厚。锅开后涮30秒即可食用', '1'),
(NULL, '捞派鸭肠', 'r9913.jpg', '19', '捞派鸭肠，选用资质和证件齐全的屠宰场鸭肠。经过掏肠、去大油、结石、抛肠、清洗、刀工去小油、清洗等步骤', '1'),
(NULL, '手切羊肉', 'r1313.jpg', '46', '甄选12月龄以下羔羊后腿以及羊霖，经过切配、装盘而成。锅开后再煮1分钟左右即可食用。', '1'),
(NULL, '猪蹄', 'r7719.jpg', '35', '猪蹄斩成小块，经过清洗，过水，用十余种符合国家食品安全的食材一起炖煮而成。锅开后再煮5分钟即可食用', '1'),
(NULL, '冻虾', 'h3181.jpg', '29', '将活虾冷冻而成。肉质脆嫩，锅开后再煮4分钟左右即可食用', '2'),
(NULL, '青斑', 'h8231.jpg', '36', '经过宰杀、去内脏、清洗、装盘而成。锅开后鱼片煮1分钟左右，鱼头、鱼排煮4分钟即可食用', '2'),
(NULL, '活虾', 'h7112.jpg', '48', '选自广东湛江、北海区域南美白虾，清洗干净装盘，锅开后再煮2分钟左右即可食用', '2'),
(NULL, '鱿鱼须', 'h2133.jpg', '28', '选用鱿鱼触角，速冻保鲜。锅开后再煮5分钟左右即可食用', '2'),
(NULL, '大闸蟹', 'h1375.jpg', '50', '大闸蟹又称河蟹、毛蟹、清水蟹、大闸蟹或螃蟹，顾客可根据情况选择生、熟两种大闸蟹，生的大闸蟹，锅开后再煮8分钟左右即可食用', '2'),
(NULL, '油蛤', 'h7811.jpg', '12', '经过宰杀、去内脏、清洗、装盘而成。锅开后再煮4分钟左右即可食用', '2'),
(NULL, '油条虾', 'h1385.jpg', '36', '油条炸制后，裹入虾滑而成。将油条的香味和虾滑的脆嫩结合在一起，锅开后再煮3分钟左右即可食用', '2'),
(NULL, '扇贝', 'h7715.jpg', '27', '鲜活扇贝，餐前宰杀后上桌。锅开后再煮4分钟左右即可食用', '2'),
(NULL, '无刺巴沙鱼', 'h2881.jpg', '30', '巴沙鱼口味鲜嫩，且无刺无腥味，特别适合老人、小孩食用', '2'),
(NULL, '撒尿牛肉丸', 'w8181.jpg', '35', '选用牛后腿部位牛霖，经过排酸、绞碎、搅打成的牛肉滑，捏成丸子后，里面裹入用老鸡、火腿等精心熬制的汤', '3'),
(NULL, '西式牛肉滑', 'w9910.jpg', '41', '选用牛后腿部位，经过排酸、绞碎、搅打而成的牛肉滑，放入香菇、芹菜粒等原料，配以蛋黄。开锅后由服务员搅拌均匀、做成小丸下入', '3'),
(NULL, '招牌虾滑', 'w7199.jpg', '30', '精选湛江、北海区域出产的南美品种白虾虾仁，配以盐和淀粉等调料制作而成。虾肉含量越高，虾滑口感越纯正', '3'),
(NULL, '精品肉丸', 'w2811.jpg', '19', '选自资质合格的厂家。锅开后浮起来后再煮3分钟左右即可食用', '3'),
(NULL, '手工墨鱼丸', 'w6138.jpg', '28', '墨鱼经破碎、搅拌等工艺，再配以秘制调料混合而成。锅开后再浮起来再煮3分钟即可食用', '1'),
(NULL, '丸类组合', 'w6121.jpg', '31', '丸类组合', '3'),
(NULL, '包心生菜', 'c8813.jpg', '16', '包心生菜', '4'),
(NULL, '蒿子秆', 'c1838.jpg', '20', '经过挑选、清洗、切配、装盘而成，锅开后再煮1分钟左右即可食用', '4'),
(NULL, '竹笋', 'c8811.jpg', '22', '竹笋清洗后对剖切开，装盘，口感脆爽，锅开后再煮4分钟左右即可食用', '4'),
(NULL, '土豆', 'c1834.jpg', '10', '经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用', '4'),
(NULL, '山药', 'c6123.jpg', '18', '经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用', '4'),
(NULL, '冬瓜', 'c8822.jpg', '15', '经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮1分钟即可食用，不宜久煮，否则会煮溶', '4'),
(NULL, '白萝卜', 'c8137.jpg', '9', '经过去泥、挑选、去皮、清洗、切配、装盘而成。锅开后再煮3分钟左右即可食用', '4'),
(NULL, '红薯', 'c1831.jpg', '9.9', '经过去泥、挑选、去皮、清洗、切配、装盘而成。口感香甜，锅开后再煮4分钟左右即可食用', '4'),
(NULL, '小白菜', 'c6333.jpg', '12', '经过挑选、清洗、切配、装盘而成。锅开后再煮2分钟左右即可食用', '4'),
(NULL, '娃娃菜', 'c6188.jpg', '16', '通过挑选、清洗、切配、装盘而成，易吸收锅底汤汁，锅开后再煮2分钟左右即可食用', '4'),
(NULL, '炸豆衣', 'c6111.jpg', '22', '鲜豆皮酿制，豆香味浓郁，锅开后涮30秒左右即可食用', '4'),
(NULL, '捞派豆花', 'c8119.jpg', '19', '采用优质大豆磨浆，经传统手工工艺压制而成。锅开后再煮5分钟左右即可食用。配上豆花蘸碟，口味更突出', '4'),
(NULL, '有机香菇', 'j7712.jpg', '28', '经过挑选、清洗、装盘而成。锅开后再煮2分钟左右即可食用', '5'),
(NULL, '木耳', 'j8181.jpg', '24', '经过浸泡、挑选、装盘而成。锅开后再煮3分钟左右即可食用', '5'),
(NULL, '平菇', 'j5612.jpg', '22', '经过挑选、清洗、装盘而成。脆嫩而肥厚，锅开后再煮5分钟左右即可食用', '5'),
(NULL, '椎茸', 'j7715.jpg', '36', '经过清洗、切配、装盘而成。锅开后再煮4分钟左右即可食用', '5'),
(NULL, '竹荪', 'j7755.jpg', '29', '野生竹荪，口感爽滑、脆嫩，开锅后煮3分钟左右即可食用', '5'),
(NULL, '香菇', 'j6619.jpg', '24', '经过挑选、清洗、切配、装盘而成。锅开后再煮5分钟左右即可食用', '5'),
(NULL, '金针菇', 'j6119.jpg', '28', '经过挑选、清洗、装盘而成。菌盖滑嫩、清脆，锅开后再煮2分钟左右即可食用', '5');

/*订单*/
CREATE TABLE xfn_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  startTime BIGINT,
  endTime BIGINT,
  customerCount INT,
  tableId INT,
  FOREIGN KEY(tableId) REFERENCES xfn_table(tid)
);
INSERT INTO xfn_order VALUES
(100000, '1547800000000', '1547814918000', '2', '1'),
(NULL, '1547801000000', '1547824918000', '4', '2'),
(NULL, '1547802000000', '1547834918000', '3', '3'),
(NULL, '1547803000000', '1547844918000', '5', '5'),
(NULL, '1547804000000', '1547854918000', '8', '6'),
(NULL, '1547805000000', '1547864918000', '2', '7'),
(NULL, '1547806000000', '1547874918000', '1', '8'),
(NULL, '1547807000000', '1547884918000', '2', '9'),
(NULL, '1547808000000', '1547894918000', '6', '10'),
(NULL, '1547809000000', '1547804918000', '3', '11'),
(NULL, '1547800000000', '1547814918000', '10', '12'),
(NULL, '1547801000000', '1547824918000', '2', '13'),
(NULL, '1547802000000', '1547834918000', '4', '15'),
(NULL, '1547800000000', '1547814918000', '2', '1'),
(NULL, '1547801000000', '1547824918000', '4', '2'),
(NULL, '1547802000000', '1547834918000', '3', '3'),
(NULL, '1547803000000', '', '5', '5'),
(NULL, '1547804000000', '1547854918000', '8', '6'),
(NULL, '1547805000000', '', '2', '7'),
(NULL, '1547806000000', '1547874918000', '1', '8'),
(NULL, '1547807000000', '1547884918000', '2', '9'),
(NULL, '1547808000000', '', '6', '10'),
(NULL, '1547809000000', '1547804918000', '3', '11'),
(NULL, '1547800000000', '', '10', '12'),
(NULL, '1547801000000', '1547824918000', '2', '13'),
(NULL, '1547802000000', '', '4', '15');

/*订单详情*/
CREATE TABLE xfn_order_detail(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  dishId INT,       /*菜品编号*/
  dishCount INT,    /*份数*/
  customerName VARCHAR(32),    /*顾客名称*/
  orderId INT,      /*订单编号*/
  FOREIGN KEY(dishId) REFERENCES xfn_dish(did),
  FOREIGN KEY(orderId) REFERENCES xfn_order(oid)
);
INSERT INTO xfn_order_detail VALUES
(NULL, '50', '2', '丁丁', '100000'),
(NULL, '24', '2', '丁丁', '100001'),
(NULL, '37', '1', '当当', '100002'),
(NULL, '18', '3', '豆豆', '100003'),
(NULL, '22', '1', '丫丫', '100004'),
(NULL, '21', '2', '丁丁', '100005'),
(NULL, '36', '1', '当当', '100006'),
(NULL, '1', '2', '豆豆', '100007'),
(NULL, '3', '2', '丫丫', '100008'),
(NULL, '11', '2', '丁丁', '100000'),
(NULL, '14', '2', '丁丁', '100001'),
(NULL, '27', '1', '当当', '100002'),
(NULL, '8', '3', '豆豆', '100003'),
(NULL, '42', '1', '丫丫', '100004'),
(NULL, '11', '2', '丁丁', '100005'),
(NULL, '16', '1', '当当', '100006'),
(NULL, '1', '2', '豆豆', '100007'),
(NULL, '3', '2', '丫丫', '100008'),
(NULL, '15', '2', '丁丁', '100009'),
(NULL, '4', '1', '当当', '100010'),
(NULL, '12', '3', '豆豆', '100011'),
(NULL, '9', '1', '丫丫', '100012'),
(NULL, '33', '2', '丁丁', '100013'),
(NULL, '24', '1', '当当', '100014'),
(NULL, '30', '3', '豆豆', '100015'),
(NULL, '20', '2', '丫丫', '100016'),
(NULL, '16', '4', '当当', '100017'),
(NULL, '8', '2', '丫丫', '100018'),
(NULL, '6', '2', '丁丁', '100019'),
(NULL, '5', '1', '当当', '100020'),
(NULL, '29', '1', '豆豆', '100021'),
(NULL, '27', '1', '丫丫', '100022'),
(NULL, '19', '5', '丁丁', '100023'),
(NULL, '16', '1', '当当', '100024'),
(NULL, '11', '1', '豆豆', '100025'),
(NULL, '8', '2', '丫丫', '100016'),
(NULL, '16', '1', '当当', '100017'),
(NULL, '2', '3', '丫丫', '100018'),
(NULL, '1', '2', '丁丁', '100019'),
(NULL, '3', '1', '当当', '100020'),
(NULL, '29', '2', '豆豆', '100021'),
(NULL, '8', '1', '丫丫', '100022'),
(NULL, '7', '4', '丁丁', '100023'),
(NULL, '16', '6', '当当', '100024'),
(NULL, '28', '3', '豆豆', '100025'),
(NULL, '2', '3', '丫丫', '100018'),
(NULL, '42', '2', '丁丁', '100019'),
(NULL, '11', '1', '当当', '100020'),
(NULL, '19', '2', '豆豆', '100021'),
(NULL, '17', '1', '丫丫', '100022'),
(NULL, '12', '4', '丁丁', '100023'),
(NULL, '35', '6', '当当', '100024'),
(NULL, '31', '3', '豆豆', '100025'),
(NULL, '1', '3', '丫丫', '100018'),
(NULL, '2', '1', '丁丁', '100019'),
(NULL, '3', '1', '当当', '100020'),
(NULL, '32', '4', '丁丁', '100023'),
(NULL, '47', '6', '当当', '100024'),
(NULL, '41', '3', '豆豆', '100025'),
(NULL, '2', '3', '丫丫', '100018'),
(NULL, '42', '2', '丁丁', '100019'),
(NULL, '43', '1', '当当', '100020'),
(NULL, '44', '2', '豆豆', '100021'),
(NULL, '48', '1', '丫丫', '100022'),
(NULL, '46', '4', '丁丁', '100023'),
(NULL, '49', '2', '当当', '100024'),
(NULL, '40', '3', '豆豆', '100025'),
(NULL, '31', '1', '丫丫', '100022'),
(NULL, '37', '2', '丁丁', '100023'),
(NULL, '7', '1', '当当', '100024'),
(NULL, '10', '3', '豆豆', '100025'),
(NULL, '39', '1', '丫丫', '100022'),
(NULL, '32', '2', '丁丁', '100023'),
(NULL, '35', '2', '丁丁', '100023'),
(NULL, '9', '1', '当当', '100024'),
(NULL, '50', '3', '豆豆', '100025'),
(NULL, '39', '1', '丫丫', '100022'),
(NULL, '4', '2', '丁丁', '100023'),
(NULL, '31', '2', '丁丁', '100023'),
(NULL, '7', '1', '当当', '100024'),
(NULL, '30', '3', '豆豆', '100025'),
(NULL, '32', '1', '丫丫', '100022'),
(NULL, '41', '2', '丁丁', '100023'),
(NULL, '17', '1', '当当', '100024'),
(NULL, '20', '3', '豆豆', '100025'),
(NULL, '3', '1', '丫丫', '100022'),
(NULL, '4', '2', '丁丁', '100023'),
(NULL, '8', '1', '当当', '100024'),
(NULL, '29', '3', '豆豆', '100025');

  title VARCHAR(32),
  imageUrl VARCHAR(128),
  price DECIMAL(6,2),
  detail VARCHAR(128),

  categropId INT,
  FOREIGN KEY(categropId) REFERENCES xfn_category(cid)
);
INSERT INTO xfn_dish VALUES(10000,'草鱼片','r9470.2975695e.jpg','199','味道鲜美',1);
INSERT INTO xfn_dish VALUES(NULL,'脆皮肠','r9470.2975695e.jpg','199','锅开后煮沸3分钟后即可使用',1);
INSERT INTO xfn_dish VALUES(NULL,'小酥肉','r9470.2975695e.jpg','199','味道鲜美',1);
INSERT INTO xfn_dish VALUES(NULL,'牛百叶','r9302.e0b0e236.jpg','199','锅开后煮沸3分钟后即可使用',1);
INSERT INTO xfn_dish VALUES(NULL,'腰花','r9470.2975695e.jpg','199','锅开后煮沸3分钟后即可使用',1);
INSERT INTO xfn_dish VALUES(NULL,'草鱼片','r9470.2975695e.jpg','199','味道鲜美',1);
INSERT INTO xfn_dish VALUES(NULL,'脆皮肠','r9470.2975695e.jpg','199','锅开后煮沸3分钟后即可使用',1);
INSERT INTO xfn_dish VALUES(NULL,'小酥肉','r9470.2975695e.jpg','199','味道鲜美',1);
INSERT INTO xfn_dish VALUES(NULL,'牛百叶','r9302.e0b0e236.jpg','199','锅开后煮沸3分钟后即可使用',1);
INSERT INTO xfn_dish VALUES(NULL,'腰花','r9470.2975695e.jpg','199','锅开后煮沸3分钟后即可使用',1);

/*订单表：xfn_order*/
CREATE TABLE(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  startTime BIGINT,
  endTime BIGINT,
 customerCount INT
 
);
INSERT INTO xfn_order VALUES(1,1548484810420,1548405810420,3,1)


/*订单详情表：xfn_detail*/
CREATE TABLE(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  dishld INT,
  dishCount INT,
 customerName VARCHAR(64),
 orderId INT,
 FOREIGN KEY(dishId)REFERENCES xfn_dish(did),
 FOREIGN KEY(orderId)REFERENCES xfn_order(oid)
);
INSERT INTO xfn_detail VALUES(1,1548484810420,1548405810420,3,1)

...