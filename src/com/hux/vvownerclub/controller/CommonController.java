package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.vvownerclub.service.DongtanService;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.plugin.spring.Inject;
import org.apache.commons.lang.StringUtils;

/**
 * 常用界面跳转
 * User: xiang
 * Date: 13-6-3
 * Time: 下午10:24
 */
public class CommonController extends BaseController {

    @Inject.BY_TYPE
    private DongtanService dongtanService;

    /**
     * 默认主页
     */
    public void index() {


        setAttr("list", dongtanService.getTop5Tweets());
        setAttr("rel", "index");
        render("index.ftl");
    }

    /**
     * 讨论区
     */
    public void discuss() {

        String url = getPara();
        if (StringUtils.isBlank(url) || "question".equals(url.trim())) {
            setAttr("rel", "question");
            this.question();
            return;
        }
        setAttr("rel", url);
        if ("repair".equals(url.trim())) {
            this.repair();
            return;
        }
        if ("selfdriving".equals(url.trim())) {
            this.selfdriving();
            return;
        }
        if ("photography".equals(url.trim())) {
            this.photography();
            return;
        }
        if ("advice".equals(url.trim())) {
            this.advice();
            return;
        }
        render404();
    }

    /**
     * 我的空间，模版
     */
    public void user() {

        render("user.ftl");
    }

    /**
     * 登录
     */
    public void login() {

        render("login.ftl");
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
}
