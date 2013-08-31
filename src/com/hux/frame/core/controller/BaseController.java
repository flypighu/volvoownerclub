/**
 *
 */
package com.hux.frame.core.controller;

import com.jfinal.core.Controller;
import net.sf.json.JSONObject;

/**
 * 继承了公共controller，提供一些公共需要调用的方法
 *
 * @author huxiang
 */
public class BaseController extends Controller {

    protected void render404() {

       // render("common/404.ftl");
        render500();
    }

    protected void render500() {

        render("common/500.ftl");
    }

    /**
     * 成功的akf结果为akfstate=1,result为结果的内容
     * @param json
     */
    protected void renderAKFJson(String json) {

        JSONObject ob = new JSONObject();
        ob.put("akfstate", "1");
        ob.put("result", json);
        renderJson(ob);
    }

    /**
     * 常用的返回正确字符串
     * 成功的akf结果为akfstate=1,result为success
     */
    protected void renderAKFJsonSuccess() {
        this.renderAKFJson("success");
    }

    /**
     * 错误的akf结果为akfstate=0,result为结果的内容
     * @param errormsg
     */
    protected void renderAKFJsonError(String errormsg) {
        JSONObject ob = new JSONObject();
        ob.put("akfstate", "0");
        ob.put("result", errormsg);
        renderJson(ob);
    }
}
