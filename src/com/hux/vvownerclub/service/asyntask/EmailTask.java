package com.hux.vvownerclub.service.asyntask;

import com.hux.frame.util.FreemarkerUtil;
import com.hux.frame.util.MailSendService;
import com.hux.frame.util.SpringContextUtil;
import com.jfinal.aop.Before;
import com.jfinal.plugin.spring.Inject;
import com.jfinal.plugin.spring.IocInterceptor;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

/**
 * 异步发送邮件任务，
 * User: xiang
 * Date: 13-7-22
 * Time: 下午3:25
 */
public class EmailTask implements Runnable {

    private MailSendService mailSendService;

    private String email;//收件人
    private String emailTitle;//邮件标题
    private String emailFtl;//邮件内容模版
    private Map propMap;//freemarker上下文内容

    public EmailTask(String email, String emailTitle, String emailFtl, Map propMap) {

        this.email = email;
        this.emailTitle = emailTitle;
        this.emailFtl = emailFtl;
        this.propMap = propMap;
        this.mailSendService = (MailSendService) SpringContextUtil.getBean("mailSendService");
    }

    @Override
    public void run() {

        //发送邮件
        Configuration configuration = FreemarkerUtil.getAppConfiguration();
        Template t = null;
        try {
            t = configuration.getTemplate(this.emailFtl);
            t.setEncoding("UTF-8");
            Writer out = new StringWriter();
            t.process(this.propMap, out);
            mailSendService.sendHtmlEmail(email, this.emailTitle, out.toString());
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

    }
}
