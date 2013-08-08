package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.vvownerclub.dbmodel.TNews;
import com.hux.vvownerclub.util.SystemCodes;
import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.spring.IocInterceptor;
import org.apache.commons.lang.StringUtils;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-5
 * Time: 下午3:16
 */
public class NewsController extends BaseController {

    private static final int pagesize = 20;//默认每页的新闻数

    public void index() {

        //如果不是host/news?id=xxx、host/news、host/news/{不是数字}，都跳转到首页去
        if (StringUtils.isNotEmpty(getPara("p")) && StringUtils.isNumeric(getPara("p"))) {
            list(getParaToInt("p"));
        } else if (StringUtils.isBlank(getPara()) || !StringUtils.isNumeric(getPara())) {
            list(1);
        } else {
            TNews news = TNews.dao.findById(getParaToInt());

            if (null == news || !news.getStr("status").equals(SystemCodes.C_0502)) {

                setAttr("_error", "您要查看的文章不存在！");
                render("common/error.ftl");
            } else {
                setAttr("new", news);
                render("news/detail.ftl");
            }
        }


    }

    /**
     * 进入首页
     */
    public void list(int page) {

        Page<TNews> result =  TNews.dao.paginate(page, pagesize,"select n.*,u.`name` as username ",
                " from t_news n left join t_user u on u.id = n.relman where n.`status` = ? order by n.reltime desc", SystemCodes.C_0502);
        setAttr("result", result);
        setAttr("rel", "news");
        render("news/index.ftl");
    }
}
