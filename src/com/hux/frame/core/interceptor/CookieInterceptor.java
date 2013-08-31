package com.hux.frame.core.interceptor;

import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.encrypt.TripleDes;
import com.hux.vvownerclub.dbmodel.TUser;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import org.apache.commons.lang.StringUtils;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-31
 * Time: 下午5:10
 */
public class CookieInterceptor implements Interceptor {
    @Override
    public void intercept(ActionInvocation actionInvocation) {

        Controller c = actionInvocation.getController();

        //如果cookie里有记住我，就校验
        String vvid = c.getCookie("vvid");
        if (!StringUtils.isBlank(vvid)) {

            vvid = TripleDes.decrypt(vvid, null);
            String[] v = vvid.split("_");
            String un = v[0];
            String p = v[1];
            TUser user = TUser.dao.findFirst("select * from t_user where login_email = ? and password = ?", un, p);
            c.setSessionAttr(ContantsUtil._SESSIONOB, user);
        }
        actionInvocation.invoke();
    }
}
