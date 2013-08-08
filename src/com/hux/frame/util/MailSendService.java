package com.hux.frame.util;

import org.apache.log4j.Logger;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-10
 * Time: 下午8:52
 */
public class MailSendService {

    private static Logger logger = Logger.getLogger(MailSendService.class);

    private String form;

    private JavaMailSender mailSender;

    /**
     * 以普通文本的格式发送Email
     *
     * @param to      发送给谁，对应的email
     * @param title   邮件主题
     * @param message 邮件内容  支持普通文本
     * @throws Exception
     */
    public void sendSimpleEmail(String to, String title, String message) throws Exception {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom(form);
        msg.setTo(to);
        msg.setSubject(title);
        msg.setText(message);
        try {
            mailSender.send(msg);
            logger.info(form + ",文本格式内容邮件已发送至:" + to);
        } catch (Exception e) {
            logger.error("发送邮件失败", e);
            throw e;
        }
    }

    /**
     * 支持HTML脚本的格式发送Email
     *
     * @param to      发送给谁，对应的email
     * @param title   邮件主题
     * @param message 邮件内容  支持HTML脚本
     * @throws Exception
     */
    public void sendHtmlEmail(String to, String title, String message) throws Exception {
        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(msg, true, "GB2312");
        helper.setTo(to);
        helper.setFrom(form);
        helper.setSubject(title);
        helper.setText(message, true);

        try {
            mailSender.send(msg);
            logger.info(form + ",HTML格式内容邮件已发送至:" + to);
        } catch (Exception e) {
            logger.error("发送邮件失败", e);
            throw e;
        }
    }

    public String getForm() {
        return form;
    }

    public void setForm(String form) {
        this.form = form;
    }

    public JavaMailSender getMailSender() {
        return mailSender;
    }

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
}
