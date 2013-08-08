package com.hux.vvownerclub.service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: xiang
 * Date: 13-7-22
 * Time: 下午2:47
 */
public interface DongtanService {

    /**
     * 获取最新的5条动弹
     * @return
     */
    List getTop5Tweets();
}
