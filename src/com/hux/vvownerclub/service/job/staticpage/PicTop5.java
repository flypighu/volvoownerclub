package com.hux.vvownerclub.service.job.staticpage;

import com.hux.frame.freemarker.method.GetUserPicUrlMethod;
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
 * Time: 下午3:08
 */
public class PicTop5 implements Runnable {

    private static final Logger logger = Logger.getLogger(PicTop5.class);

    @Override
    public void run() {
        List<Record> rlist = Db.find("select id,title,indexpic,indexs from t_news where status = '0502' and IS_INDEX = 'Y' order by reltime desc limit 0,5");

        Configuration configuration = FreemarkerUtil.getAppConfiguration();
        Template t;
        File f = new File(WebUtils.getWebInfFullPath() + "ftl" + File.separator + "static" + File.separator + "top_pic5.html");
        Writer out = null;
        try {
            t = configuration.getTemplate("top_pic5.ftl");
            t.setEncoding(ContantsUtil.UTF8);



            Map propMap = new HashMap();
            propMap.put("_getUserPicUrl", new GetUserPicUrlMethod());
            if(rlist.size() > 0){

                propMap.put("rlist", rlist);
            }
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
