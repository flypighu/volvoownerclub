package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.frame.core.interceptor.AuthTxInterceptor;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.FreemarkerUtil;
import com.hux.frame.util.MailSendService;
import com.hux.frame.util.encrypt.TripleDes;
import com.hux.vvownerclub.dbmodel.*;
import com.hux.vvownerclub.service.asyntask.EmailTask;
import com.hux.vvownerclub.service.asyntask.MemLogTask;
import com.hux.vvownerclub.util.SystemCodes;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;
import com.jfinal.render.Render;
import freemarker.template.Configuration;
import freemarker.template.Template;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.core.task.TaskExecutor;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.*;

/**
 * 用户管理控制器
 * User: xiang
 * Date: 13-7-6
 * Time: 下午6:26
 */

public class MemberController extends BaseController {

    @Inject.BY_NAME
    private TaskExecutor taskExecutor;

    /**
     * 进入index默认的界面是用户的个人主页
     */
    // @Before(AuthInterceptor.class)
    public void index() {

        if (StringUtils.isBlank(getPara())) {
            render404();
        } else {
            TUser u = TUser.dao.findFirst("select * from t_user where url = ?", getPara());
            if (null == u) {
                render404();
            } else {

                List<Record> f = null;
                if (u.getInt("follow").intValue() > 0) {

                    f = Db.find("select u.id,u.url,u.pic,u.name " +
                            "from t_follow f " +
                            "INNER JOIN t_user u on f.befollowed = u.ID and f.follow = ? " +
                            "order by f.rtime desc", u.getInt("id"));
                    setAttr("follow", f);
                }

                List<Record> bf = null;
                if (u.getInt("befollowed").intValue() > 0) {

                    bf = Db.find("select u.id,u.url,u.pic,u.name " +
                            "from t_follow f " +
                            "INNER JOIN t_user u on f.follow = u.ID and f.befollowed = ? " +
                            "order by f.rtime desc", u.getInt("id"));
                    setAttr("befollowed", bf);
                }
                setAttr("u", u);

                StringBuilder sb = new StringBuilder();
                sb.append(u.get("id"));
                if (null != f && f.size() > 0) {
                    sb.append(",");
                    for (int i = 0; i < f.size(); i++) {

                        if (i != f.size() - 1) {

                            sb.append(",");
                        }
                        sb.append(f.get(i).get("id"));
                    }
                }

                //查询车型信息
                List<TUserCar> carList = TUserCar.dao.find("select u.ctype,u.cpz,p.PZ_URL,p.PZ_PIC from t_user_car u " +
                        "inner join t_car c on u.ctype = c.C_TYPE " +
                        "inner join t_car_pz p on u.cpz = p.PZ_NAME and c.ID = p.CAR_ID " +
                        "where u.user_id = ? ", u.get("id"));
                if (carList.size() > 0) {

                    setAttr("carList", carList);
                }

                int p = getParaToInt("p", 1);
                if (StringUtils.isEmpty(getPara("t"))) {

                    Page<TMove> re = TMove.dao.paginate(p, 20, "select m.*,u.id as uid,u.name,u.url,u.pic,u.title ",
                            "from t_move m inner join t_user u on m.user = u.id and m.user in(" + sb.toString() + ") order by m.rtime desc ");
                    setAttr("rlist", re);
                    render("u/index.ftl");
                } else if ("discuss".equals(getPara("t"))) {

                    Page<TDiscussPost> re = TDiscussPost.dao.paginate(p, 20, "select p.id,p.disid,p.title as ptitle,p.rtime,p.content,p.reply,u.id as uid,u.name,u.url,u.pic,u.title",
                            "from t_discuss_post p inner join t_user u on p.user = u.id and p.user in (" + sb.toString() + ") order by p.rtime desc ");
                    setAttr("rlist", re);
                    render("u/index_discuss.ftl");
                } else if ("news".equals(getPara("t"))) {

                    Page<TNews> re = TNews.dao.paginate(p, 20, "select n.id,n.title as ntitle,n.sim_content,n.reltime,n.reply,u.id as uid,u.name,u.url,u.pic,u.title",
                            "from t_news n inner join t_user u on n.relman = u.id and n.relman in (" + sb.toString() + ") where n.status = '0502' order by n.reltime desc");
                    setAttr("rlist", re);
                    render("u/index_news.ftl");
                } else {
                    render404();
                }

            }
        }

    }

    /**
     * 进入注册界面
     */
    public void register() {

        render("u/register.ftl");
    }

    /**
     * 进行注册
     */
    public void doRegister() {

        if (null != TUser.dao.findFirst("select 1 from t_user where login_email = ?", getPara("email"))) {

            renderJson("error", "邮箱[" + getPara("email") + "]已经被注册，请换一个！");
            return;
        }
        if (null != TUser.dao.findFirst("select 1 from t_user where name = ?", getPara("username"))) {
            renderJson("error", "姓名[" + getPara("username") + "]已经被注册，请换一个！");
            return;
        }

        int password = (int) ((Math.random() * 9 + 1) * 100000);

        //保存user对象
        TUser user = new TUser();
        user.set("login_email", getPara("email"));
        user.set("name", getPara("username"));
        user.set("password", TripleDes.encrypt(Integer.valueOf(password).toString(), null));
        user.set("gender", getPara("gender"));
        user.set("province", getPara("province"));
        user.set("city", getPara("city"));
        user.set("regtime", new Date());
        user.set("level", SystemCodes.C_0201);
        user.set("follow", 0);
        user.set("befollowed", 0);
        user.set("car_no", getPara("carNo"));
        user.set("flag_no", getPara("flagNo", null));
        user.save();
        user.set("url", user.get("id"));
        user.update();

        TUserCar userCar = new TUserCar();
        userCar.set("user_id", user.get("id"));
        userCar.set("ctype", getPara("cType"));
        userCar.set("cpz", getPara("carPz"));
        userCar.save();

        Map propMap = new HashMap();
        propMap.put("user", user);
        propMap.put("cType", getPara("cType"));
        propMap.put("carPz", getPara("carPz"));

        taskExecutor.execute(new EmailTask("flypighu@163.com", getPara("username") + " - 沃沃车友会新用户注册邮件", "common/regconfirm.ftl", propMap));
        renderAKFJsonSuccess();

    }

    /**
     * 注册激活
     * result:1 用户不存子，2 激活 3 用户已经激活过了
     * 注销掉该功能，用户激活由管理员手动干预
     */
//    @Before(Tx.class)
//    public void regconfirm() {
//
//        String em = TripleDes.decrypt(null == getPara() ? "" : getPara(), null);
//
//        TUser user = TUser.dao.findFirst("select * from t_user where login_email = ?", em);
//        if (null == user) {
//
//            setAttr("flag", "1");
//        } else {
//
//            setAttr("username", user.getStr("name"));
//            if (user.getTimestamp("active_time") == null) {
//
//                setAttr("flag", "2");
//                user.set("active_time", new Date());
//                user.update();
//            } else {
//
//                setAttr("flag", "3");
//                setAttr("active_time", user.getTimestamp("active_time"));
//            }
//        }
//        render("u/active.ftl");
//    }

    /**
     * 进入登录界面
     */
    public void login() {

        render("u/login.ftl");
    }

    /**
     * 登录
     */
    @Before(Tx.class)
    public void doLogin() {

        String email = getPara("email");
        String password = getPara("password");
        String remindme = getPara("remindme", "false");
        TUser user = TUser.dao.findFirst("select * from t_user where login_email = ?", email);
        if (null == user) {
            renderAKFJsonError("用户名：" + email + "不存在！");
        } else {

            taskExecutor.execute(new MemLogTask(user.getInt("id"), "登录"));


            //如果密码不一样
            if (!TripleDes.decrypt(user.getStr("password"), null).equals(password)) {

                renderAKFJsonError("密码错误，请重新输入！");
            } else if (null == user.get("active_time")) {

                renderAKFJsonError("帐号还没有被激活！");
            } else {

                user.set("lastlogintime", new Date());
                user.update();
                setSessionAttr(ContantsUtil._SESSIONOB, user);

                if (remindme.equals("true")) {

                    String vvid = TripleDes.encrypt(email + "_" + user.getStr("password"), null);
                    setCookie("vvid", vvid, 60 * 60 * 24 * 30);
                }
                renderAKFJsonSuccess();
            }
        }
    }

    /**
     * 注销
     */
    @Before(AuthInterceptor.class)
    public void logout() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "注销"));

        this.removeSessionAttr(ContantsUtil._SESSIONOB);
        removeCookie("vvid");
        renderAKFJsonSuccess();
    }

    /**
     * 关注某人
     */
    @Before(AuthTxInterceptor.class)
    public void follow() {
        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "添加关注"));

        List<Record> rlist = Db.find("select 1 from t_follow f where f.follow = ? and f.befollowed = ?", user.get("id"), getParaToInt("fid"));
        if (null != rlist && rlist.size() > 0) {

            renderJson("msg", "您已经关注了该用户，请勿重复关注！");

        } else {
            int follow = user.getInt("follow");
            user.set("follow", follow + 1);
            user.update();

            TUser fuser = TUser.dao.findById(getParaToInt("fid"));
            int befollowed = fuser.getInt("befollowed");
            fuser.set("befollowed", befollowed + 1);
            fuser.update();

            TFollow tFollow = new TFollow();
            tFollow.set("follow", user.getInt("id"));
            tFollow.set("befollowed", fuser.getInt("id"));
            tFollow.set("rtime", new Date());
            tFollow.save();

            JSONObject ob = new JSONObject();
            ob.put("newfollow", user.get("follow"));
            ob.put("f_id", fuser.get("id"));
            ob.put("f_url", fuser.get("url"));
            ob.put("f_name", fuser.get("name"));
            ob.put("f_pic", fuser.get("pic"));
            renderJson(ob);
        }

    }
}
