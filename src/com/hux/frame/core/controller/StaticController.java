/**
 * 
 */
package com.hux.frame.core.controller;

import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;

/**
 * 公共的静态化控制器
 * 
 * @author huxiang
 * 
 */
public class StaticController extends BaseController {

	/**
	 * 默认处理html模版文件
	 */
	@ClearInterceptor(ClearLayer.ALL)
	public void html() {
		String rd = this.getPara().replace("_", "/");
		this.render(rd + ".html");
	}
	
	/**
	 * 处理js的模版文件
	 */
	@ClearInterceptor(ClearLayer.ALL)
	public void js(){
		
		String rd = this.getPara().replace("_", "/");
		this.render(rd + ".js");
	}
}
