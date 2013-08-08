package com.hux.frame.core.interceptor;

import com.hux.frame.util.WebUtils;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-6-25
 * Time: 上午9:02
 */
public class ExceptionInterceptor implements Interceptor {

    private static Logger log = Logger.getLogger(ExceptionInterceptor.class);


    public void intercept(ActionInvocation ai) {
        try {
            ai.invoke();
        } catch (Exception e) {

            e.printStackTrace();
            log.error(e.getMessage());
            Controller c = ai.getController();

            //如果是ajax请求
            if (WebUtils.isAjaxRequest(c.getRequest())) {

                c.renderJson(e.getMessage());
            } else {
                c.setAttr("_error", e.getMessage());
                c.render("common/500.ftl");
            }
        }
    }
}
