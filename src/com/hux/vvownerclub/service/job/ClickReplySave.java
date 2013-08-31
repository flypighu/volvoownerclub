package com.hux.vvownerclub.service.job;

import com.hux.frame.util.SpringContextUtil;
import com.hux.vvownerclub.service.asyntask.ClickTask;
import com.hux.vvownerclub.service.asyntask.ReplyTask;
import com.hux.vvownerclub.service.job.staticpage.IndexDiscuss;
import com.hux.vvownerclub.service.job.staticpage.IndexNews;
import com.jfinal.plugin.activerecord.Db;
import org.apache.log4j.Logger;
import org.springframework.core.task.TaskExecutor;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-20
 * Time: 下午5:14
 */
public class ClickReplySave implements Runnable {

    private static final Logger logger = Logger.getLogger(ClickReplySave.class);

    @Override
    public void run() {

        List<String> sqllist1 = ClickTask.getSaveSqlList();
        if (sqllist1.size() > 0) {

            Db.batch(sqllist1, 500);
        }
        logger.info("更新浏览量:" + sqllist1.size());

        List<String> sqllist2 = ReplyTask.getSaveSqlList();
        if (sqllist2.size() > 0) {

            Db.batch(sqllist2, 500);
        }
        logger.info("更新评论数:" + sqllist2.size());

        //更新所有和浏览量和评论数的html
        TaskExecutor taskExecutor = (TaskExecutor) SpringContextUtil.getBean("taskExecutor");
        taskExecutor.execute(new IndexNews());
        taskExecutor.execute(new IndexDiscuss());
    }
}
