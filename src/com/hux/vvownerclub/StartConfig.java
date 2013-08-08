package com.hux.vvownerclub;

import com.hux.frame.core.activerecord.CaseInsensitiveContainerFactory;
import com.hux.frame.core.controller.StaticController;
import com.hux.frame.core.handler.CommonAttrHandler;
import com.hux.frame.core.interceptor.ExceptionInterceptor;
import com.hux.frame.core.interceptor.FreemarkerInterceptor;
import com.hux.vvownerclub.controller.*;
import com.hux.vvownerclub.dbmodel.*;
import com.hux.vvownerclub.util.codes.SystemCodesManage;
import com.jfinal.config.*;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.spring.IocInterceptor;
import com.jfinal.plugin.spring.SpringPlugin;

import java.util.ArrayList;
import java.util.List;

/**
 * 系统加载类，用于初始化系统
 * User: xiang
 * Date: 13-5-7
 * Time: 上午9:52
 */
public class StartConfig extends JFinalConfig {

    private static Logger log = Logger.getLogger(StartConfig.class);

    @Override
    public void configConstant(Constants constants) {
        constants.setDevMode(true);
        constants.setBaseViewPath("/WEB-INF/ftl/");
    }

    @Override
    public void configRoute(Routes routes) {

        routes.add("/static", StaticController.class, "/");
        routes.add("/", CommonController.class, "/");
        routes.add("/u", MemberController.class, "/");
        routes.add("/dongtan", DongtanController.class, "/");
        routes.add("/admin", AdminController.class, "/");
        routes.add("/news", NewsController.class, "/");
    }

    @Override
    public void configPlugin(Plugins plugins) {
        loadPropertyFile("app_config.txt");
        plugins.add(new SpringPlugin());
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password"), getProperty("driverClass"));
        plugins.add(c3p0Plugin);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        arp.setDialect(new AnsiSqlDialect());
        arp.setContainerFactory(new CaseInsensitiveContainerFactory());
        plugins.add(arp);

        /**
         * 增加所有表的关联
         */
        arp.addMapping("T_USER", TUser.class);
        arp.addMapping("T_NEWS", TNews.class);
        arp.addMapping("T_MOVE", TMove.class);
        arp.addMapping("T_COMMENTS", TComments.class);
        arp.addMapping("T_DISCUSS", TDiscuss.class);
        arp.addMapping("T_DISCUSS_POST", TDiscussPost.class);
        arp.addMapping("T_CAR", TCar.class);
        arp.addMapping("T_CODE", TCode.class);

    }

    @Override
    public void configInterceptor(Interceptors interceptors) {
        interceptors.add(new FreemarkerInterceptor());
        interceptors.add(new ExceptionInterceptor());
        interceptors.add(new IocInterceptor());
    }

    @Override
    public void configHandler(Handlers handlers) {
        handlers.add(new CommonAttrHandler());
    }

    @Override
    public void afterJFinalStart() {
        super.afterJFinalStart();
        SystemCodesManage.initCodes();

        //测试2000条新闻
//        List<String> sqlist = new ArrayList<String>();
//        for (int i = 0; i < 2000; i++) {
//            sqlist.add("insert into t_news(title,content,sim_content,sim_pic,is_index,relman,reltime,status) " +
//                    "values ('test"+i+"','test','test"+i+"','<img src=\"http://localhost:8080/upload/releases/2013/0806/1375795123115_1.jpg\" alt=\"\" />','N',1,sysdate(),'0502')");
//        }
//        Db.batch(sqlist,100);
    }

    @Override
    public void beforeJFinalStop() {
        super.beforeJFinalStop();
    }
}
