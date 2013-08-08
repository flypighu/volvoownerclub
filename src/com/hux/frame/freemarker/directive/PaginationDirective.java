package com.hux.frame.freemarker.directive;

import com.hux.frame.freemarker.DirectiveUtils;
import com.hux.frame.util.ContantsUtil;
import com.jfinal.plugin.activerecord.Page;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-7
 * Time: 下午8:59
 */
public class PaginationDirective implements TemplateDirectiveModel {

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars,
                        TemplateDirectiveBody body) throws TemplateException, IOException {
        // Page page = (Page) params.get("page");
       // String url = (String) params.get("url");
        DirectiveUtils.addParamsToVariable(env, params);
        env.include("/WEB-INF/ftl/common/paginate.ftl", ContantsUtil.UTF8, true);
    }
}
