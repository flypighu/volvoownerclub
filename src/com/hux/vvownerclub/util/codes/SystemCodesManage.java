package com.hux.vvownerclub.util.codes;

import com.hux.vvownerclub.dbmodel.TCode;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.Db;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-5
 * Time: 下午8:51
 */
public class SystemCodesManage {

    private static Logger log = Logger.getLogger(SystemCodesManage.class);

    private static List<TCode> codesList;

    private static boolean flag;

    public static void initCodes() {

        List<TCode> temp = queryALLCodes();
        codesList = temp;
        log.info("刷新代码成功。。。");
    }

    private static List<TCode> queryALLCodes() {

        return TCode.dao.find("select * from t_code order by code asc");
    }

    public static String getValueByCode(String code) {

        if (null == codesList) {
            return "";
        }
        for (TCode c : codesList) {

            if (code.equals(c.getStr("code"))) {

                return c.getStr("name");
            }
        }
        return "";
    }
}
