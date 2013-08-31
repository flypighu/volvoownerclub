package com.hux.vvownerclub.service.asyntask;

import org.apache.commons.lang.time.DateFormatUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 记录用户行为
 * User: xiang
 * Date: 13-8-22
 * Time: 下午10:20
 */
public class MemLogTask implements Runnable {

    private static ArrayList<String> sqllist = new ArrayList<String>();

    private int userid;
    private String log;

    public MemLogTask(int uid, String l) {
        this.userid = uid;
        this.log = l;
    }

    @Override
    public void run() {

        Date now = new Date();
        String ndate = DateFormatUtils.ISO_DATE_FORMAT.format(now) + " " + DateFormatUtils.ISO_TIME_NO_T_FORMAT.format(now);
        sqllist.add("insert into t_mem_log values(" + userid + ",str_to_date(\"" + ndate + "\",'%Y-%m-%d %H:%i:%s'),'" + log + "')");
    }

    public static List<String> getSaveSqlList() {

        List<String> re = (ArrayList<String>) sqllist.clone();
        sqllist = new ArrayList<String>();
        return re;
    }
}
