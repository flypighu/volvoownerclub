package com.hux.frame.freemarker.method;

import com.hux.frame.util.DateUtil;
import freemarker.template.TemplateMethodModel;
import freemarker.template.TemplateModelException;

import java.text.ParseException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-23
 * Time: 下午4:10
 */
public class CheckTimeQian implements TemplateMethodModel {

    @Override
    public Object exec(List list) throws TemplateModelException {
        String time = (String) list.get(0);

        try {
            return DateUtil.checkTimeQian(DateUtil.parseDate(time));
        } catch (ParseException e) {
        }
        return "";
    }
}
