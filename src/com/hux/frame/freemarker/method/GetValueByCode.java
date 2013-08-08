package com.hux.frame.freemarker.method;

import com.hux.vvownerclub.util.codes.SystemCodesManage;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-5
 * Time: 下午9:10
 */
public class GetValueByCode implements TemplateMethodModel {

    @Override
    public Object exec(List list) throws TemplateModelException {
        if (null == list.get(0) || "".equals(list.get(0))) {
            return "";
        }
        return SystemCodesManage.getValueByCode((String) list.get(0));
    }
}
