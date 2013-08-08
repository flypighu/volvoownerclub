package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.DateUtil;
import com.hux.vvownerclub.dbmodel.TMove;
import com.hux.vvownerclub.dbmodel.TUser;
import com.hux.vvownerclub.service.DongtanService;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-19
 * Time: 下午2:31
 */
@Before(AuthInterceptor.class)
public class DongtanController extends BaseController {

    @Inject.BY_TYPE
    private DongtanService dongtanService;

    /**
     * 新增动弹
     */
    public void add() throws Exception {

        String txt = getPara("txt");
        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        TMove move = new TMove();
        move.set("content", txt);
        move.set("user", user.get("id"));
        move.set("rtime", new Date());
        move.save();

        List list = new ArrayList<Map>();
        Map ob = new HashMap();
        ob.put("moveid", move.get("id"));
        ob.put("userid", user.get("id"));
        ob.put("userpic", user.get("pic"));
        ob.put("username", user.get("name"));
        ob.put("userurl", user.get("url"));
        ob.put("txt", txt);
        ob.put("comments", "0");
        ob.put("dTime", DateUtil.checkTimeQian(new Date()));
        list.add(ob);

        setAttr("list", list);
        render("common/template/topTweets.ftl");
    }

    /**
     * 定时刷新top5
     */
    @ClearInterceptor
    public void top5() {

        setAttr("list", dongtanService.getTop5Tweets());
        render("common/template/topTweets.ftl");
    }
}
