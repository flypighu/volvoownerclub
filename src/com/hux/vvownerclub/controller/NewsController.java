package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.WebUtils;
import com.hux.vvownerclub.dbmodel.TNews;
import com.hux.vvownerclub.dbmodel.TNewsComments;
import com.hux.vvownerclub.dbmodel.TUser;
import com.hux.vvownerclub.service.asyntask.ClickTask;
import com.hux.vvownerclub.service.asyntask.MemLogTask;
import com.hux.vvownerclub.service.asyntask.ReplyTask;
import com.hux.vvownerclub.util.SystemCodes;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.spring.Inject;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.core.task.TaskExecutor;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-5
 * Time: 下午3:16
 */
public class NewsController extends BaseController {

    @Inject.BY_NAME
    private TaskExecutor taskExecutor;

    private static final int pagesize = 20;//默认每页的新闻数

    public void index() {

        //如果不是host/news?id=xxx、host/news、host/news/{不是数字}，都跳转到首页去
        if (StringUtils.isNotEmpty(getPara("p")) && StringUtils.isNumeric(getPara("p"))) {
            list(getParaToInt("p"));
        } else if (StringUtils.isBlank(getPara()) || !StringUtils.isNumeric(getPara())) {
            list(1);
        } else {
            one(getParaToInt());
        }

    }

    /**
     * 进入首页
     */
    private void list(int page) {

        Page<TNews> result = TNews.dao.paginate(page, pagesize, "select n.*,u.name as username,u.url ",
                " from t_news n left join t_user u on u.id = n.relman where n.status = ? order by n.reltime desc", SystemCodes.C_0502);

        setAttr("result", result);
        setAttr("rel", "news");
        render("news/index.ftl");
    }

    /**
     * 详细新闻界面
     *
     * @param newId
     */
    private void one(int newId) {

        TNews news = TNews.dao.findFirst("select n.*,u.name as relmanname from t_news n left join t_user u on u.id = n.relman where n.id = ?", newId);

        if (null == news || !news.getStr("status").equals(SystemCodes.C_0502)) {

            setAttr("_error", "您要查看的文章不存在！");
            render("common/error.ftl");
        } else {

            TNews prev = TNews.dao.findFirst("select n.id,n.title,n.reltime from t_news n where n.status = ? and id < ? order by n.reltime desc limit 0,1 ",
                    SystemCodes.C_0502, newId);
            TNews next = TNews.dao.findFirst("select n.id,n.title,n.reltime from t_news n where n.status = ? and id > ? order by n.reltime asc limit 0,1 ",
                    SystemCodes.C_0502, newId);

            setAttr("prev", prev);
            setAttr("next", next);
            setAttr("news", news);

            //查询评论
            Page<TNewsComments> comments = TNewsComments.dao.paginate(1, 100, "select n.*,u.name as username,u.URL,u.PIC",
                    " from t_news_comments n left join t_user u on u.id = n.USER where newsid = ? order by n.commenttime asc", newId);

            setAttr("comments", comments);

            taskExecutor.execute(new ClickTask(ClickTask.NEWS, newId));//增加浏览量
            render("news/detail.ftl");
        }
    }

    /**
     * 发布评论
     * 该功能需要登录才能使用，但这里不用全局的登录拦截器，单独判断是否登录
     */
    //@Before(AuthInterceptor.class)
    public void comment() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        if (null == user) {

            renderJson("msg", "nologin");
            return;
        }

        taskExecutor.execute(new MemLogTask(user.getInt("id"), "发表新闻评论"));

        String txt = WebUtils.StringFilter(getPara("txt"));
        TNewsComments c = new TNewsComments();
        c.set("newsid", getParaToInt("newsid"));
        c.set("user", user.get("id"));
        c.set("commenttime", new Date());
        c.set("comment", txt);
        c.set("simple", txt.length() > 40 ? txt.substring(0, 40) : txt);

        c.save();

        List<Map> list = new ArrayList<Map>();
        Map attr = new HashMap();
        attr.put("url", user.get("url"));
        attr.put("pic", user.get("pic"));
        attr.put("username", user.get("name"));
        attr.put("commenttime",
                DateFormatUtils.ISO_DATE_FORMAT.format(c.get("commenttime")) + " " + DateFormatUtils.ISO_TIME_NO_T_FORMAT.format(c.get("commenttime")));
        attr.put("comment", c.get("comment"));
        attr.put("index", getParaToInt("index", 0));
        attr.put("id", c.get("id"));
        list.add(attr);
        setAttr("list", list);

        taskExecutor.execute(new ReplyTask(ReplyTask.NEWS, getParaToInt("newsid")));//记录评论数

        render("news/detail_frag.ftl");
    }

    public void comment_reply() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        if (null == user) {

            renderJson("msg", "nologin");
            return;
        }

        taskExecutor.execute(new MemLogTask(user.getInt("id"), "发表新闻评论回复"));

        String txt = WebUtils.StringFilter(getPara("txt"));
        TNewsComments c = new TNewsComments();
        c.set("newsid", getParaToInt("newsid"));
        c.set("user", user.get("id"));
        c.set("commenttime", new Date());
        c.set("comment", getPara("r") + txt);
        String s = WebUtils.replaceBlank(getPara("rs") + txt);
        c.set("simple", s.length() > 40 ? s.substring(0, 40) : s);
        c.save();

        List<Map> list = new ArrayList<Map>();
        Map attr = new HashMap();
        attr.put("url", user.get("url"));
        attr.put("pic", user.get("pic"));
        attr.put("username", user.get("name"));
        attr.put("commenttime",
                DateFormatUtils.ISO_DATE_FORMAT.format(c.get("commenttime")) + " " + DateFormatUtils.ISO_TIME_NO_T_FORMAT.format(c.get("commenttime")));
        attr.put("comment", getPara("r") + txt);
        attr.put("index", getParaToInt("index", 0));
        attr.put("id", c.get("id"));
        list.add(attr);
        setAttr("list", list);

        taskExecutor.execute(new ReplyTask(ReplyTask.NEWS, getParaToInt("newsid")));//记录评论数
        render("news/detail_frag.ftl");
    }
}
