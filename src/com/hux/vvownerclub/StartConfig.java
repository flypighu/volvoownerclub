package com.hux.vvownerclub;

import com.hux.frame.core.activerecord.CaseInsensitiveContainerFactory;
import com.hux.frame.core.controller.StaticController;
import com.hux.frame.core.handler.CommonAttrHandler;
import com.hux.frame.core.interceptor.ExceptionInterceptor;
import com.hux.frame.core.interceptor.FreemarkerInterceptor;
import com.hux.frame.util.SpringContextUtil;
import com.hux.vvownerclub.controller.*;
import com.hux.vvownerclub.dbmodel.*;
import com.hux.vvownerclub.service.job.staticpage.*;
import com.hux.vvownerclub.util.codes.SystemCodesManage;
import com.jfinal.config.*;
import com.jfinal.ext.plugin.cron.Cron4jPlugin;
import com.jfinal.log.Logger;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.spring.IocInterceptor;
import com.jfinal.plugin.spring.SpringPlugin;
import com.jfinal.render.FreeMarkerRender;
import org.springframework.core.task.TaskExecutor;

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
        loadPropertyFile("app_config.txt");
        constants.setDevMode(getPropertyToBoolean("devMode"));
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
        routes.add("/discuss", DiscussController.class, "/");
    }

    @Override
    public void configPlugin(Plugins plugins) {

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
        arp.addMapping("T_NEWS_COMMENTS", TNewsComments.class);
        arp.addMapping("T_DISCUSS_POST", TDiscussPost.class);
        arp.addMapping("T_DISCUSS_COMMENTS", TDiscussComments.class);
        arp.addMapping("T_CAR", TCar.class);
        arp.addMapping("T_CAR_PZ", TCarPz.class);
        arp.addMapping("T_CODE", TCode.class);
        arp.addMapping("T_FOLLOW", TFollow.class);
        arp.addMapping("T_DT_COMMENTS", TDtComments.class);
        arp.addMapping("T_USER_CAR", TUserCar.class);

        //定时任务
        Cron4jPlugin cron4j = new Cron4jPlugin();
        plugins.add(cron4j);
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

        //测试2000条帖子
//        List<String> sqlist = new ArrayList<String>();
//        for (int i = 0; i < 2000; i++) {
//            sqlist.add("insert into t_discuss_post(disid,title,user,rtime,content,reply,click) " +
//                    "values (1,'test"+i+"',1,sysdate(),'test',0,0)");
//        }
//        Db.batch(sqlist, 100);

        //生成所有静态界面
        TaskExecutor taskExecutor = (TaskExecutor) SpringContextUtil.getBean("taskExecutor");
        taskExecutor.execute(new NewsTopComment20());
        taskExecutor.execute(new UsersTop20());
        taskExecutor.execute(new PicTop5());
        taskExecutor.execute(new IndexNews());
        taskExecutor.execute(new IndexDiscuss());
        taskExecutor.execute(new HotNews());
    }

    @Override
    public void beforeJFinalStop() {
        super.beforeJFinalStop();
    }
}
