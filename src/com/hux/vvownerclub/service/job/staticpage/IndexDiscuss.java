package com.hux.vvownerclub.service.job.staticpage;

import com.hux.frame.freemarker.method.CheckTimeQian;
import com.hux.frame.util.ContantsUtil;
import com.hux.frame.util.FreemarkerUtil;
import com.hux.frame.util.WebUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.log4j.Logger;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-23
 * Time: 下午4:43
 */
public class IndexDiscuss implements Runnable {

    private static final Logger logger = Logger.getLogger(IndexDiscuss.class);

    @Override
    public void run() {

        List<Record> p1 = Db.find("select p.id,p.disid,p.title,p.reply,p.click,p.rtime,u.`name`from t_discuss_post p " +
                "left join t_user u on p.user = u.id " +
                "order by p.rtime desc " +
                "limit 0,15");

        List<Record> p2 = Db.find("select p.id,p.disid,p.title,p.reply,p.click,p.rtime,u.`name`from t_discuss_post p " +
                "left join t_user u on p.user = u.id " +
                "order by p.rtime desc " +
                "limit 15,15");

        List<Record> p3 = Db.find("select p.id,p.disid,p.title,p.reply,p.click,p.rtime,u.`name`from t_discuss_post p " +
                "left join t_user u on p.user = u.id " +
                "order by p.rtime desc " +
                "limit 30,15");

        Configuration configuration = FreemarkerUtil.getAppConfiguration();
        Template t;
        File f = new File(WebUtils.getWebInfFullPath() + "ftl" + File.separator + "static" + File.separator + "index_discuss.html");
        Writer out = null;
        try {
            t = configuration.getTemplate("index_discuss.ftl");
            t.setEncoding(ContantsUtil.UTF8);


            Map propMap = new HashMap();
            propMap.put("_checkTimeQian", new CheckTimeQian());
            propMap.put("p1", p1);
            propMap.put("p2", p2);
            propMap.put("p3", p3);
            out = new OutputStreamWriter(new FileOutputStream(f), ContantsUtil.UTF8);
            t.process(propMap, out);

            logger.info("生成文件：" + f.getAbsolutePath());
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e);
        } finally {
            if (out != null) {

                try {
                    out.flush();
                    out.close();
                } catch (IOException e) {
                    logger.error(e);
                }
            }
        }
    }
}
