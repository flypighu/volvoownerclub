package com.hux.vvownerclub.service.job;

import com.hux.vvownerclub.service.asyntask.MemLogTask;
import com.jfinal.plugin.activerecord.Db;
import org.apache.log4j.Logger;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-22
 * Time: 下午10:26
 */
public class MemLogSave implements Runnable {

    private static final Logger logger = Logger.getLogger(MemLogSave.class);

    @Override
    public void run() {

        List<String> sqllist = MemLogTask.getSaveSqlList();

        if (sqllist.size() > 0) {

            Db.batch(sqllist, 500);
        }
        logger.info("更新用户行为记录数:" + sqllist.size());
    }
}
