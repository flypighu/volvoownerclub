package com.hux.vvownerclub.service.job.staticpage;

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
 * Date: 13-8-25
 * Time: 下午8:47
 */
public class HotNews implements Runnable {

    private static final Logger logger = Logger.getLogger(HotNews.class);

    @Override
    public void run() {

        List<Record> benzhou = Db.find("select n.id,n.title,n.click,n.reply,(n.click + n.reply) as total,n.RELTIME " +
                "from t_news n where n.status = '0502' and n.reltime between DATE_ADD(NOW(),  INTERVAL -7 DAY) and now() " +
                "order by total desc limit 0,10");

        List<Record> benyue = Db.find("select n.id,n.title,n.click,n.reply,(n.click + n.reply) as total,n.RELTIME " +
                "from t_news n where n.status = '0502' and n.reltime between DATE_ADD(NOW(),  INTERVAL -30 DAY) and now() " +
                "order by total desc limit 0,10");

        Configuration configuration = FreemarkerUtil.getAppConfiguration();
        Template t;
        File f = new File(WebUtils.getWebInfFullPath() + "ftl" + File.separator + "static" + File.separator + "hotnews.html");
        Writer out = null;
        try {
            t = configuration.getTemplate("news/hotnews.ftl");
            t.setEncoding(ContantsUtil.UTF8);


            Map propMap = new HashMap();
            propMap.put("bz", benzhou);
            propMap.put("by",benyue);
            out = new OutputStreamWriter(new FileOutputStream(f), ContantsUtil.UTF8);
            t.process(propMap, out);

            logger.info("生成文件：" + f.getAbsolutePath());
        } catch (Exception e) {
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
