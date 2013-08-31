package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.WebUtils;
import com.hux.vvownerclub.dbmodel.TDiscussComments;
import com.hux.vvownerclub.dbmodel.TDiscussPost;
import com.hux.vvownerclub.dbmodel.TUser;
import com.hux.vvownerclub.service.asyntask.ClickTask;
import com.hux.vvownerclub.service.asyntask.MemLogTask;
import com.hux.vvownerclub.service.asyntask.ReplyTask;
import com.hux.vvownerclub.service.job.staticpage.IndexDiscuss;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.plugin.spring.Inject;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.core.task.TaskExecutor;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-19
 * Time: 下午4:37
 */
public class DiscussController extends BaseController {

    @Inject.BY_NAME
    private TaskExecutor taskExecutor;

    private static final int pagesize = 20;//默认每页的帖子数

    public void index() {

        //如果是/X_X的样式URL的话，则是查看帖子明细
        if (StringUtils.isNotEmpty(getPara())) {
            detail();
        } else {
            navigate();
        }

    }

    /**
     * 默认导航方法
     */
    private void navigate() {

        int c = getParaToInt("c", 1);
        setAttr("rel", c);

        Page<Record> rlist = Db.paginate(getParaToInt("p", 1), pagesize,
                "select p.id,p.title,p.rtime,u.name,u.url,u.pic,p.reply,p.click,p.last_man,p.last_reply,p.last_id,r.name as lastname",
                "from t_discuss_post p left join t_user u on p.user = u.id " +
                "left join t_user r on p.last_man = r.id  where p.disid = ? order by p.rtime desc", c);

        setAttr("rlist", rlist);

        if (c == ContantsUtil.QUESTION) {
            this.question();
            return;
        }
        if (c == ContantsUtil.REPAIR) {
            this.repair();
            return;
        }
        if (c == ContantsUtil.SELFDRIVING) {
            this.selfdriving();
            return;
        }
        if (c == ContantsUtil.PHOTOGRAPHY) {
            this.photography();
            return;
        }
        if (c == ContantsUtil.ADVICE) {
            this.advice();
            return;
        }
        render404();
    }

    /**
     * 沃沃问答
     */
    private void question() {

        render("discuss/question.ftl");
    }

    /**
     * 维修改装
     */
    private void repair() {


        render("discuss/repair.ftl");
    }

    /**
     * 自驾游
     */
    private void selfdriving() {

        render("discuss/selfdriving.ftl");
    }

    /**
     * 沃友摄影
     */
    private void photography() {

        render("discuss/photography.ftl");
    }

    /**
     * 站务/建议
     */
    private void advice() {

        render("discuss/advice.ftl");
    }

    /**
     * 发帖界面
     */
    @Before(AuthInterceptor.class)
    public void post() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "进入发帖界面"));

        setAttr("c", getParaToInt("c", 1));
        render("discuss/newPost.ftl");
    }

    /**
     * 新增发帖
     */
    @Before(AuthInterceptor.class)
    public void addPost() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "发布新帖"));

        TDiscussPost post = new TDiscussPost();
        post.set("disid", getParaToInt("c", 0));
        post.set("title", getPara("title"));
        post.set("user", user.get("id"));
        post.set("rtime", new Date());
        post.set("content", getPara("html"));
        post.set("reply", 0);
        post.set("click", 0);
        post.save();

        taskExecutor.execute(new IndexDiscuss());
        renderAKFJsonSuccess();
    }

    /**
     * 进入帖子明细界面
     */
    private void detail() {

        if (getPara().indexOf("_") == -1) {
            navigate();
            return;
        }

        String[] para = getPara().split("_");
        int c = StringUtils.isNumeric(para[0]) ? new Integer(para[0]).intValue() : 1;

        int postid = StringUtils.isNumeric(para[1]) ? new Integer(para[1]).intValue() : 0;

        TDiscussPost post = TDiscussPost.dao.findFirst("select p.*,u.name,u.url,u.pic from t_discuss_post p " +
                "left join t_user u on p.user = u.id " +
                "where p.id = ? and p.disid = ? ", postid, c);

        Page<TDiscussComments> comments = TDiscussComments.dao.paginate(1, 100, "select n.*,u.name as username,u.URL,u.PIC ",
                "from t_discuss_comments n left join t_user u on u.id = n.user where n.postid = ? order by n.commenttime asc", postid);
        setAttr("comments", comments);
        setAttr("post", post);
        setAttr("c", c);

        taskExecutor.execute(new ClickTask(ClickTask.DISCUSS, post.getInt("id")));//增加浏览量
        render("discuss/detail.ftl");
    }

    /**
     * 发表评论
     */
    @Before(Tx.class)
    public void comment() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        if (null == user) {

            renderJson("msg", "nologin");
            return;
        }
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "发表帖子评论"));

        String txt = WebUtils.StringFilter(getPara("txt"));
        TDiscussComments c = new TDiscussComments();
        c.set("postid", getParaToInt("postid"));
        c.set("user", user.get("id"));
        c.set("commenttime", new Date());
        c.set("comment", txt);
        c.save();

        TDiscussPost post = TDiscussPost.dao.findById(getParaToInt("postid"));
        post.set("last_id", c.get("id"));
        post.set("last_man", c.get("user"));
        post.set("last_reply", c.get("commenttime"));
        post.update();

        List<Map> list = new ArrayList<Map>();
        Map attr = new HashMap();
        attr.put("url", user.get("url"));
        attr.put("pic", user.get("pic"));
        attr.put("username", user.get("name"));
        attr.put("commenttime",
                DateFormatUtils.ISO_DATE_FORMAT.format(c.get("commenttime")) + " " + DateFormatUtils.ISO_TIME_NO_T_FORMAT.format(c.get("commenttime")));
        attr.put("comment", txt);
        attr.put("index", getParaToInt("index", 0));
        attr.put("id", c.get("id"));
        list.add(attr);
        setAttr("list", list);

        taskExecutor.execute(new ReplyTask(ReplyTask.DISCUSS, getParaToInt("postid")));//记录评论数
        render("discuss/detail_frag.ftl");
    }

    /**
     * 发表回复
     */
    @Before(Tx.class)
    public void comment_reply() {

        TUser user = getSessionAttr(ContantsUtil._SESSIONOB);

        if (null == user) {

            renderJson("msg", "nologin");
            return;
        }
        taskExecutor.execute(new MemLogTask(user.getInt("id"), "发表帖子评论回复"));

        String txt = WebUtils.StringFilter(getPara("txt"));
        TDiscussComments c = new TDiscussComments();
        c.set("postid", getParaToInt("postid"));
        c.set("user", user.get("id"));
        c.set("commenttime", new Date());
        c.set("comment", getPara("r") + txt);
        c.set("comid", getParaToInt("commentid"));
        c.save();

        TDiscussPost post = TDiscussPost.dao.findById(getParaToInt("postid"));
        post.set("last_id", c.get("id"));
        post.set("last_man", c.get("user"));
        post.set("last_reply", c.get("commenttime"));
        post.update();

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

        taskExecutor.execute(new ReplyTask(ReplyTask.DISCUSS, getParaToInt("postid")));//记录评论数
        render("discuss/detail_frag.ftl");
    }
}
