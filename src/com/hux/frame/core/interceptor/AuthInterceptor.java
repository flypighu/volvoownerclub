package com.hux.frame.core.interceptor;

import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.WebUtils;
import com.hux.vvownerclub.dbmodel.TUser;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import net.sf.json.JSONObject;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-22
 * Time: 下午4:46
 */
public class AuthInterceptor implements Interceptor {
    @Override
    public void intercept(ActionInvocation ai){

        Controller c = ai.getController();
        TUser user = c.getSessionAttr(ContantsUtil._SESSIONOB);
        if (user == null) {//没有登录

            //如果是ajax请求
            if (WebUtils.isAjaxRequest(c.getRequest())) {

                JSONObject ob = new JSONObject();
                ob.put("_nomsg","nologin");
                c.renderJson(ob);
            } else {
                c.redirect("/");
            }
        } else {
            ai.invoke();
        }
    }
}
