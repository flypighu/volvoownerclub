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
 * Date: 13-8-19
 * Time: 下午3:31
 */
public class NewsTopComment20 implements Runnable {

    private static final Logger logger = Logger.getLogger(NewsTopComment20.class);

    @Override
    public void run() {


        List<Record> rlist = Db.find("select n.simple,u.name,u.url,w.title,w.id from t_news_comments n " +
                "left join t_user u on n.user = u.id " +
                "left join t_news w on n.newsid = w.id " +
                "order by n.commenttime desc " +
                "limit 0,20");

        Configuration configuration = FreemarkerUtil.getAppConfiguration();
        Template t;
        File f = new File(WebUtils.getWebInfFullPath() + "ftl" + File.separator + "static" + File.separator + "top_comment20.html");
        Writer out = null;
        try {
            t = configuration.getTemplate("news/top_comment20.ftl");
            t.setEncoding(ContantsUtil.UTF8);


            Map propMap = new HashMap();
            propMap.put("rlist", rlist);
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
