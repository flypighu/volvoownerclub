package com.hux.frame.core.interceptor;

import com.hux.frame.freemarker.directive.PaginationDirective;
import com.hux.frame.freemarker.method.CheckTimeQian;
import com.hux.frame.freemarker.method.GetUserPicUrlMethod;
import com.hux.frame.freemarker.method.GetValueByCode;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;

/**
 * 用来加载自定义的方法和标签
 * User: xiang
 * Date: 13-5-20
 * Time: 下午3:57
 */
public class FreemarkerInterceptor implements Interceptor {

    @Override
    public void intercept(ActionInvocation ai) {

        Controller c = ai.getController();
        c.setAttr("_getUserPicUrl", new GetUserPicUrlMethod());
        c.setAttr("_getValueByCode", new GetValueByCode());
        c.setAttr("_checkTimeQian", new CheckTimeQian());
        c.setAttr("_pagination",new PaginationDirective());
        ai.invoke();

    }
}
