delete from t_code;
insert into t_code values('0101','男');
insert into t_code values('0102','女');
insert into t_code values('0201','级别1');
insert into t_code values('0202','级别2');
insert into t_code values('0203','级别3');
insert into t_code values('0301','动弹');
insert into t_code values('0302','资讯');
insert into t_code values('0303','讨论区');
insert into t_code values('0304','博客');
insert into t_code values('0501','未审核');
insert into t_code values('0502','已审核');
insert into t_code values('0503','已删除');
insert into t_code values('0504','已退回');
commit;

delete from t_car;
delete from t_car_pz;
insert into t_car values(1,'沃尔沃C30','http://www.autohome.com.cn/494/','http://www.autoimg.cn/upload/spec/10576/t_201108021641288703655.jpg');
insert into t_car_pz
values(1,1,'2013款 2.0L','http://www.autohome.com.cn/spec/13848/?pvareaid=101605','http://img.autoimg.cn/upload/2012/9/11/t_201209111950250443686.jpg');
insert into t_car_pz
values(2,1,'2008款 2.4i','http://www.autohome.com.cn/spec/4564/?pvareaid=101605','http://img.autoimg.cn/upload/spec/4564/t_456475268604.jpg');
insert into t_car_pz
values(3,1,'2006款 2.4i','http://www.autohome.com.cn/spec/2670/?pvareaid=101605','http://img.autoimg.cn/upload/spec/2670/t_267017463464.jpg');
insert into t_car_pz
values(4,1,'2006款 2.5 T5','http://www.autohome.com.cn/spec/2688/?pvareaid=101605','http://img.autoimg.cn/upload/spec/2688/t_2688810654563.jpg');

insert into t_car values(2,'沃尔沃C70','http://www.autohome.com.cn/406/','http://www.autoimg.cn/upload/spec/5965/t_20100630201352597272.jpg');
insert into t_car_pz
values(5,2,'2010款 2.5T T5','http://www.autohome.com.cn/spec/5965/?pvareaid=101605','http://img.autoimg.cn/upload/spec/5965/t_20100630201352597272.jpg');
insert into t_car_pz
values(6,2,'2008款 2.4i','http://www.autohome.com.cn/spec/4069/?pvareaid=101605','http://img.autoimg.cn/upload/spec/2759/t_2759553723891.jpg');
insert into t_car_pz
values(7,2,'2008款 2.5T T5','http://www.autohome.com.cn/spec/2759/?pvareaid=101605','http://img.autoimg.cn/upload/spec/2759/t_2759236298609.jpg');
insert into t_car_pz
values(8,2,'2004款 2.3T Convertible','http://www.autohome.com.cn/spec/1575/?pvareaid=101605','http://img.autoimg.cn/upload/spec/1575/t_1575127591323.jpg');

insert into t_car values(3,'沃尔沃S40','http://www.autohome.com.cn/463/','http://www.autoimg.cn/upload/spec/12759/t_201207201944556834122.jpg');
insert into t_car_pz
values(9,3,'2012款 2.0L 自动典雅版','http://www.autohome.com.cn/spec/12758/','http://img.autoimg.cn/upload/spec/8974/t_201011171736259313686.jpg');

insert into t_car values(4,'沃尔沃S60','http://www.autohome.com.cn/404/','http://www.autoimg.cn/upload/2013/7/31/t_201307311641282174178.jpg');
insert into t_car_pz
values(10,4,'2014款 2.0T T5','http://www.autohome.com.cn/spec/16590/?pvareaid=101605','http://img.autoimg.cn/upload/2013/7/31/t_201307311641282174178.jpg');
insert into t_car_pz
values(11,4,'2013款 2.0T T5','http://www.autohome.com.cn/spec/13931/?pvareaid=101605','http://img.autoimg.cn/upload/2013/1/2/t_201301021537445374136.jpg');
insert into t_car_pz
values(12,4,'2013款 3.0T T6 AWD','http://www.autohome.com.cn/spec/13937/?pvareaid=101605','http://img.autoimg.cn/upload/2012/9/21/t_20120921220116028264.jpg');
insert into t_car_pz
values(13,4,'2011款 1.6T T4','http://www.autohome.com.cn/404/2022/','http://www.autoimg.cn/upload/spec/9647/t_20110524175810232272.jpg');

insert into t_car values(5,'沃尔沃S80L','http://www.autohome.com.cn/693/','http://www.autoimg.cn/upload/spec/12557/t_201205151719372103655.jpg');
insert into t_car_pz
values(14,5,'2012款 2.0T T5','http://www.autohome.com.cn/spec/12553/?pvareaid=101605','http://img.autoimg.cn/upload/spec/12553/t_20120416154951510264.jpg');
insert into t_car_pz
values(15,5,'2012款 3.0T T6 AWD','http://www.autohome.com.cn/spec/12556/?pvareaid=101605','http://img.autoimg.cn/upload/spec/12556/t_20120416155020136264.jpg');
insert into t_car_pz
values(16,5,'2011款 2.0T T5','http://www.autohome.com.cn/spec/12553/?pvareaid=101605','http://img.autoimg.cn/upload/spec/12553/t_20120416154951510264.jpg');
insert into t_car_pz
values(17,5,'2011款 3.0T T6 AWD','http://www.autohome.com.cn/spec/12556/?pvareaid=101605','http://img.autoimg.cn/upload/spec/12556/t_20120416155020136264.jpg');

insert into t_car values(6,'沃尔沃XC60','http://www.autohome.com.cn/585/','http://www.autoimg.cn/upload/2013/7/31/t_201307311611509234178.jpg');
insert into t_car_pz
values(18,6,'2014款 2.0T T5','http://www.autohome.com.cn/spec/16609/?pvareaid=101605','http://img.autoimg.cn/upload/2013/8/5/t_20130805112339526264.jpg');
insert into t_car_pz
values(19,6,'2014款 3.0T T6 AWD','http://www.autohome.com.cn/spec/16613/?pvareaid=101605','http://img.autoimg.cn/upload/2013/8/9/t_201308091848206084435.jpg');
insert into t_car_pz
values(20,6,'2013款 2.0T T5','http://www.autohome.com.cn/spec/14014/?pvareaid=101605','http://img.autoimg.cn/upload/2013/3/6/t_201303061831594774136.jpg');
insert into t_car_pz
values(21,6,'2013款 3.0T T6 AWD','http://www.autohome.com.cn/spec/14017/?pvareaid=101605','http://img.autoimg.cn/upload/2012/9/21/t_20120921220116028264.jpg');
insert into t_car_pz
values(22,6,'2012款 2.0T T5','http://www.autohome.com.cn/spec/14014/?pvareaid=101605','http://img.autoimg.cn/upload/2013/3/6/t_201303061831594774136.jpg');
insert into t_car_pz
values(23,6,'2012款 3.0T T6 AWD','http://www.autohome.com.cn/spec/14017/?pvareaid=101605','http://img.autoimg.cn/upload/2012/9/21/t_20120921220116028264.jpg');

insert into t_car values(7,'沃尔沃XC90','http://www.autohome.com.cn/177/','http://www.autoimg.cn/upload/2013/4/8/t_201304081823350684435.jpg');
insert into t_car_pz
values(24,7,'2013款 2.5T T5','http://www.autohome.com.cn/spec/14393/?pvareaid=101605','http://img.autoimg.cn/upload/2012/11/16/t_20121116203211509264.jpg');

insert into t_car values(8,'沃尔沃V40','http://www.autohome.com.cn/2678/','http://www.autoimg.cn/upload/2013/4/23/t_201304231749082454178.jpg');
insert into t_car_pz
values(25,8,'2013款 2.0T','http://www.autohome.com.cn/spec/15339/?pvareaid=101605','http://img.autoimg.cn/upload/2013/3/18/t_20130318193003207264.jpg');
insert into t_car_pz
values(26,8,'2013款 2.0T T5','http://www.autohome.com.cn/spec/15339/?pvareaid=101605','http://img.autoimg.cn/upload/2013/3/18/t_20130318193003207264.jpg');

insert into t_car values(9,'沃尔沃V60','http://www.autohome.com.cn/2190/','http://www.autoimg.cn/upload/spec/13450/t_201208021842298554122.jpg');
insert into t_car_pz
values(27,9,'2014款 2.0T T5','http://www.autohome.com.cn/spec/16593/?pvareaid=101605','http://img.autoimg.cn/upload/2013/7/31/t_201307311656429714122.jpg');
insert into t_car_pz
values(28,9,'2013款 2.0T T5','http://www.autohome.com.cn/spec/13447/?pvareaid=101605','http://img.autoimg.cn/upload/2013/1/16/t_201301161743489103686.jpg');
insert into t_car_pz
values(29,9,'2012款 3.0 T6 AWD','http://www.autohome.com.cn/spec/12773/?pvareaid=101605','http://img.autoimg.cn/upload/spec/8610/t_20120406153750478240.jpg');

delete from t_user;
insert into t_user(login_email,`name`,password,gender,province,city,url,regtime,active_time,active_man,`level`,follow,befollowed,car_no,flag_no)
values('flypighu@163.com','小胡','D72E13C93AF1171332DB460614D4BDFF','0101','福建','福州','1',sysdate(),sysdate(),1,'0203',0,0,'闽ALD215','929');

commit;





