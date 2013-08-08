package com.hux.frame.util;

import com.jfinal.kit.PathKit;
import com.jfinal.render.FreeMarkerRender;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-13
 * Time: 下午7:39
 */
public class FreemarkerUtil {

    //保存所有参数,js路径,cs路径等
    private static Map<String, Object> releaseParams = new HashMap<String, Object>();

    static{
        //releaseParams.put("csspath", "");

    }
    //配置
    private static Configuration config = null;
    private static Configuration appConfig = null;
    /**
     * appConfig配置所有参数
     * 重写freemarker中的  reader方法，读取该配置文件
     * @return
     */
    public static Configuration getAppConfiguration()
    {
        if(appConfig == null)
        {
            //从freemarker中获取所有配置
            appConfig = (Configuration) FreeMarkerRender.getConfiguration().clone();
            try {
                //设置模板路径
				/*	config.setDirectoryForTemplateLoading(new File(PathKit.getWebRootPath()));
				config.setObjectWrapper(new DefaultObjectWrapper());*/
                appConfig.setDirectoryForTemplateLoading(new File(PathKit.getWebRootPath()+"/WEB-INF/ftl/"));
                appConfig.setObjectWrapper(new DefaultObjectWrapper());
            } catch (IOException e) {
                // TODO log
            }
        }
        return appConfig;
    }
}
