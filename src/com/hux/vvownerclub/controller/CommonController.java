package com.hux.vvownerclub.controller;

import com.hux.frame.core.controller.BaseController;
import com.hux.frame.core.interceptor.AuthInterceptor;
import com.hux.vvownerclub.dbmodel.TCar;
import com.hux.vvownerclub.dbmodel.TCarPz;
import com.hux.vvownerclub.service.DongtanService;
import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.plugin.spring.Inject;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 常用界面跳转
 * User: xiang
 * Date: 13-6-3
 * Time: 下午10:24
 */
public class CommonController extends BaseController {

    @Inject.BY_TYPE
    private DongtanService dongtanService;

    /**
     * 默认主页
     */
    public void index() {

        setAttr("list", dongtanService.getTop5Tweets());
        setAttr("rel", "index");
        render("index.ftl");
    }


    /**
     * 我的空间，模版
     */
    public void user() {

        render("user.ftl");
    }

    /**
     * 登录
     */
    public void login() {

        render("login.ftl");
    }

    /**
     * 获取车辆选择js
     */
    public void getCarJs() {

        List<TCar> clist = TCar.dao.find("select * from t_car");
        List<Map> mapList = new ArrayList<Map>();
        for (int i = 0; i < clist.size(); i++) {

            TCar car = clist.get(i);
            List<TCarPz> plist = TCarPz.dao.find("select * from t_car_pz where car_id = ? ", car.get("id"));
            Map pzMap = new HashMap();
            pzMap.put("c_type", car.getStr("c_type"));
            StringBuilder sb = new StringBuilder();
            for (int j = 0; j < plist.size(); j++) {

                sb.append("\"").append(plist.get(j).getStr("pz_name")).append("\"");
                if(j < plist.size() - 1){
                    sb.append(",");
                }
            }
            pzMap.put("plist", sb.toString());
            mapList.add(pzMap);
        }
        setAttr("clist", mapList);
        render("common/getcar.ftl");
    }

}
