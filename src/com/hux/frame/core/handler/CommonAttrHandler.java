/**
 *
 */
package com.hux.frame.core.handler;

import com.hux.frame.freemarker.method.GetUserPicUrlMethod;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.WebUtils;
import com.jfinal.handler.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 常用属性，每个页面都可以通过freemarker来调用。
 *
 * @author huxiang
 * @todo 后续需要从缓存中来获取。
 */
public class CommonAttrHandler extends Handler {

    public void handle(String target, HttpServletRequest request,
                       HttpServletResponse response, boolean[] isHandled) {
        request.setAttribute("_BASE_PATH", request.getContextPath());
        request.setAttribute(ContantsUtil._SESSIONOB,
                WebUtils.getSessionAttribute(request, ContantsUtil._SESSIONOB));
        request.setAttribute("_ISLOGIN",
                WebUtils.getSessionAttribute(request, ContantsUtil._SESSIONOB) == null ? "false" : "true");
        request.setAttribute("_getUserPicUrl", new GetUserPicUrlMethod());
       // System.out.println("CommonAttrHandler ++");
        nextHandler.handle(target, request, response, isHandled);
    }

}
