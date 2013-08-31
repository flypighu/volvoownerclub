package com.hux.frame.core.interceptor;

import com.jfinal.aop.InterceptorStack;
import com.jfinal.plugin.activerecord.tx.Tx;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-8-26
 * Time: 下午4:44
 */
public class AuthTxInterceptor extends InterceptorStack {

    @Override
    public void config() {

        addInterceptors(new AuthInterceptor(),new Tx());
    }
}
