package com.hux.vvownerclub.service.asyntask;

import java.util.ArrayList;
import java.util.List;

/**
 * 浏览量统计，新闻、帖子
 * User: xiang
 * Date: 13-8-23
 * Time: 下午5:13
 */
public class ClickTask implements Runnable {

    public static final String NEWS = "t_news";

    public static final String DISCUSS = "t_discuss_post";

    private static ArrayList<String> sqllist = new ArrayList<String>();

    private String type;
    private int id;

    public ClickTask(String t, int i) {
        this.type = t;
        this.id = i;
    }

    @Override
    public void run() {

        sqllist.add("update " + type + " set click = click + 1 where id = " + id);
    }

    public static List<String> getSaveSqlList() {

        List<String> re = (ArrayList<String>) sqllist.clone();
        sqllist = new ArrayList<String>();
        return re;
    }
}
