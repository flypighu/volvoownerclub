package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.FreemarkerUtil;
import com.hux.frame.util.MailSendService;
import com.hux.frame.util.encrypt.TripleDes;
import com.hux.vvownerclub.dbmodel.TUser;
import com.hux.vvownerclub.service.asyntask.EmailTask;
import com.hux.vvownerclub.util.SystemCodes;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;
import com.jfinal.render.Render;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.core.task.TaskExecutor;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
    @Before(AuthInterceptor.class)
    public void index() {

        render("u/index.ftl");
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

        //保存user对象
        TUser user = new TUser();
        user.set("login_email", getPara("email"));
        user.set("name", getPara("username"));
        user.set("password", TripleDes.encrypt(getPara("password"), null));
        user.set("gender", getPara("gender"));
        user.set("province", getPara("province"));
        user.set("city", getPara("city"));
        user.set("regtime", new Date());
        user.set("level", SystemCodes.C_0201);
        user.save();
        user.set("url", user.get("id"));
        user.update();

        Map propMap = new HashMap();
        propMap.put("username", getPara("username"));
        propMap.put("url", "http://localhost:8080/u/regconfirm/" + TripleDes.encrypt(getPara("email"), null));
        taskExecutor.execute(new EmailTask(getPara("email"), "沃沃车友会注册邮件", "common/regconfirm.ftl", propMap));
        renderAKFJsonSuccess();

    }

    /**
     * 注册激活
     * result:1 用户不存子，2 激活 3 用户已经激活过了
     */
    @Before(Tx.class)
    public void regconfirm() {

        String em = TripleDes.decrypt(null == getPara() ? "" : getPara(), null);

        TUser user = TUser.dao.findFirst("select * from t_user where login_email = ?", em);
        if (null == user) {

            setAttr("flag", "1");
        } else {

            setAttr("username", user.getStr("name"));
            if (user.getTimestamp("active_time") == null) {

                setAttr("flag", "2");
                user.set("active_time", new Date());
                user.update();
            } else {

                setAttr("flag", "3");
                setAttr("active_time", user.getTimestamp("active_time"));
            }
        }
        render("u/active.ftl");
    }

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
        TUser user = TUser.dao.findFirst("select * from t_user where login_email = ?", email);
        if (null == user) {
            renderAKFJsonError("用户名：" + email + "不存在！");
        } else {

            //如果密码不一样
            if (!TripleDes.decrypt(user.getStr("password"), null).equals(password)) {

                renderAKFJsonError("密码错误，请重新输入！");
            } else {
                user.set("lastlogintime", new Date());
                user.update();
                setSessionAttr(ContantsUtil._SESSIONOB, user);
                renderAKFJsonSuccess();
            }
        }
    }

    /**
     * 注销
     */
    @Before(AuthInterceptor.class)
    public void logout() {

        this.removeSessionAttr(ContantsUtil._SESSIONOB);
        renderAKFJsonSuccess();
    }
}
