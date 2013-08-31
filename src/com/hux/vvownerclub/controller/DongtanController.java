package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.frame.core.interceptor.AuthTxInterceptor;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.DateUtil;
import com.hux.frame.util.WebUtils;
import com.hux.vvownerclub.dbmodel.TDtComments;
import com.hux.vvownerclub.dbmodel.TMove;
import com.hux.vvownerclub.dbmodel.TUser;
import com.hux.vvownerclub.service.DongtanService;
import com.hux.vvownerclub.service.asyntask.MemLogTask;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;
import org.apache.commons.lang.StringUtils;
import org.springframework.core.task.TaskExecutor;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-19
 * Time: 下午2:31
 */

public class DongtanController extends BaseController {

    @Inject.BY_TYPE
    private DongtanService dongtanService;

    @Inject.BY_NAME
    private TaskExecutor taskExecutor;

    /**
     * 默认动弹首页
     */
    public void index() {

        if (StringUtils.isBlank(getPara())) {
            int p = getParaToInt("p", 1);
            Page<Record> lists = Db.paginate(p, 20, "select a.*,b.pic,b.name,b.url,b.id as uid ",
                    " from t_move a left join t_user b on a.user = b.id order by a.rtime desc");
            setAttr("rlist", lists);
            render("dongtan/index.ftl");
        } else {

            Record rd = Db.findFirst("select m.*,u.id as uid,u.name,u.url,u.pic,u.title from t_move m inner join t_user u on m.user = u.id and m.id = ?",
                    getParaToInt());

            if (rd.getInt("comments") > 0) {
                List<Record> rlist = Db.find("select c.*,u.id as uid,u.name,u.url,u.pic,u.title " +
                        "from t_dt_comments c inner join t_user u on c.user = u.id and c.dtid = ?  order by c.commenttime desc",
                        rd.get("id"));
                setAttr("rlist", rlist);
            }
            setAttr("rd", rd);
            render("dongtan/detail.ftl");
        }

    }

    /**
     * 新增动弹
     */
    @Before(AuthInterceptor.class)
    public void add() throws Exception {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "新增动弹"));

        String txt = getPara("txt");
        TMove move = new TMove();
        move.set("content", txt);
        move.set("user", user.get("id"));
        move.set("rtime", new Date());
        move.set("comments", 0);
        move.save();

        List list = new ArrayList<Map>();
        Map ob = new HashMap();
        ob.put("moveid", move.get("id"));
        ob.put("userid", user.get("id"));
        ob.put("userpic", user.get("pic"));
        ob.put("username", user.get("name"));
        ob.put("userurl", user.get("url"));
        ob.put("txt", txt);
        ob.put("dTime", DateUtil.checkTimeQian(new Date()));
        ob.put("comments", 0);
        list.add(ob);

        setAttr("list", list);
        render("common/template/topTweets.ftl");
    }

    /**
     * 定时刷新top5
     */
    @Before(AuthInterceptor.class)
    public void top5() {

        setAttr("list", dongtanService.getTop5Tweets());
        render("common/template/topTweets.ftl");
    }

    /**
     * 发表评论
     */
    @Before(AuthTxInterceptor.class)
    public void comment() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "发布动弹评论"));

        TDtComments comments = new TDtComments();
        comments.set("dtid", getPara("dongtanid"));
        comments.set("user", user.get("id"));
        comments.set("commenttime", new Date());
        comments.set("comment", getPara("html"));
        comments.save();

        TMove move = TMove.dao.findById(getParaToInt("dongtanid"));
        int c = move.getInt("comments");
        move.set("comments", c + 1);
        move.update();

        renderAKFJsonSuccess();
    }
}
