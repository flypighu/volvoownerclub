package com.hux.vvownerclub.service.impl;

import com.hux.frame.util.DateUtil;
import com.hux.vvownerclub.service.DongtanService;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-22
 * Time: 下午2:45
 */
@Service
public class DongtanServiceImpl implements DongtanService {

    /**
     * 获取最新的5条动弹
     *
     * @return
     */
    public List getTop5Tweets() {


        Page<Record> lists = Db.paginate(1, 5, "select a.*,b.pic,b.name,b.url ",
                " from t_move a left join t_user b on a.user = b.id order by a.rtime desc");

        List list = new ArrayList<Map>();
        for (int i = 0; i < lists.getList().size(); i++) {
            Record record = lists.getList().get(i);
            Map ob = new HashMap();
            ob.put("moveid", record.get("id"));
            ob.put("userid", record.get("user"));
            ob.put("userpic", record.get("pic"));
            ob.put("username", record.get("name"));
            ob.put("userurl", record.get("url"));
            ob.put("txt", record.get("content"));
            ob.put("dTime", DateUtil.checkTimeQian(record.getTimestamp("rtime")));
            ob.put("comments", record.get("comments"));
            list.add(ob);
        }
        return list;
    }
}
