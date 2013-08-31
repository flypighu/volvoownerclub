package com.hux.frame.freemarker.method;

import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-19
 * Time: 下午3:46
 */
public class GetUserPicUrlMethod implements TemplateMethodModel {

    @Override
    public Object exec(List list) throws TemplateModelException {
        if (null == list.get(0) || "".equals(list.get(0))) {
            return "/assets/img/portrait.gif";
        }
        return list.get(0);
    }
}
