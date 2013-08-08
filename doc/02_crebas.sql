DROP TABLE IF EXISTS T_CAR;

DROP TABLE IF EXISTS T_COMMENTS;

DROP TABLE IF EXISTS T_DISCUSS;

DROP TABLE IF EXISTS T_DISCUSS_POST;

DROP TABLE IF EXISTS T_MOVE;

DROP TABLE IF EXISTS T_NEWS;

DROP TABLE IF EXISTS T_USER;

CREATE TABLE T_CAR
(
   ID                   INT NOT NULL,
   PRIMARY KEY (ID)
);

ALTER TABLE T_CAR COMMENT '车信息';

CREATE TABLE T_COMMENTS
(
   ID                   INT NOT NULL,
   TYPE                 CHAR(4) NOT NULL COMMENT '0301：动弹
            0302：资讯
            0303：讨论区
            0304：博客',
   TYPEID               INT NOT NULL,
   USER                 INT NOT NULL,
   COMMENTTIME          DATETIME NOT NULL,
   COMMENT              TEXT NOT NULL,
   PRIMARY KEY (ID)
);

ALTER TABLE T_COMMENTS COMMENT '系统所有相关资讯、动弹、讨论区回帖的评论都在这里维护。';

CREATE TABLE T_DISCUSS
(
   ID                   INT NOT NULL,
   NAME                 VARCHAR(20) NOT NULL,
   PRIMARY KEY (ID)
);

CREATE TABLE T_DISCUSS_POST
(
   ID                   INT NOT NULL,
   TITLE                VARCHAR(200) NOT NULL,
   USER                 INT NOT NULL,
   RTIME                DATETIME NOT NULL,
   CONTENT              LONGTEXT NOT NULL,
   REPLY                INT NOT NULL,
   CLICK                INT NOT NULL,
   LAST_REPLY           DATETIME,
   PRIMARY KEY (ID)
);

ALTER TABLE T_DISCUSS_POST COMMENT '存储所有讨论区的帖子';

CREATE TABLE T_MOVE
(
   ID                   INT NOT NULL,
   CONTENT              TEXT NOT NULL,
   USER                 INT NOT NULL,
   RTIME                DATETIME NOT NULL,
   PRIMARY KEY (ID)
);

ALTER TABLE T_MOVE COMMENT '每个人都可以发布动弹。';

CREATE TABLE T_NEWS
(
   ID                   INT NOT NULL AUTO_INCREMENT,
   TITLE                VARCHAR(100) NOT NULL,
   SOURCE               VARCHAR(100),
   CONTENT              LONGTEXT NOT NULL,
   IS_INDEX             CHAR(1) NOT NULL COMMENT '是：Y
            否：N',
   INDEXPIC             VARCHAR(100),
   RELMAN               INT NOT NULL,
   RELTIME              DATETIME NOT NULL,
   STATUS               CHAR(4) NOT NULL COMMENT '0501 未审核
            0502 已审核
            0503 已删除',
   REVIEWMAN            INT,
   REVIEWTIME           DATETIME,
   DELMAN               INT,
   DELTIME              DATETIME,
   COMMENTNUM           INT NOT NULL,
   PRIMARY KEY (ID)
);

CREATE TABLE T_USER
(
   ID                   INT NOT NULL AUTO_INCREMENT,
   LOGIN_EMAIL          VARCHAR(20) NOT NULL COMMENT '唯一',
   NAME                 VARCHAR(20) COMMENT '唯一',
   PASSWORD             VARCHAR(50) NOT NULL,
   GENDER               CHAR(4) NOT NULL COMMENT '代码：
            0101：男
            0102：女',
   PROVINCE             VARCHAR(10) NOT NULL,
   CITY                 VARCHAR(10) NOT NULL,
   URL                  VARCHAR(10),
   SIGN                 VARCHAR(500),
   TITLE                VARCHAR(100),
   REGTIME              DATETIME NOT NULL,
   LASTLOGINTIME        DATETIME,
   PIC                  VARCHAR(100),
   TEL                  VARCHAR(20),
   QQ                   VARCHAR(20),
   ACTIVE_TIME          DATETIME,
   PRIMARY KEY (ID)
);

ALTER TABLE T_USER COMMENT '注册用户';

