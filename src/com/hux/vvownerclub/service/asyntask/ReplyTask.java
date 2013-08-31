package com.hux.vvownerclub.service.asyntask;

import java.util.ArrayList;
import java.util.List;

/**
 * 评论数统计，新闻、帖子
 * User: xiang
 * Date: 13-8-23
 * Time: 下午8:20
 */
public class ReplyTask implements Runnable {

    public static final String NEWS = "t_news";

    public static final String DISCUSS = "t_discuss_post";

    private static ArrayList<String> sqllist = new ArrayList<String>();

    private String type;
    private int id;

    public ReplyTask(String t, int i) {
        this.type = t;
        this.id = i;
    }

    @Override
    public void run() {

        sqllist.add("update " + type + " set reply = reply + 1 where id = " + id);
    }

    public static List<String> getSaveSqlList() {

        List<String> re = (ArrayList<String>) sqllist.clone();
        sqllist = new ArrayList<String>();
        return re;
    }
}
