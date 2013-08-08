/**
 *
 */
package com.hux.frame.util;

import com.hux.vvownerclub.dbmodel.TUser;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * web常用类
 *
 * @author huxiang
 */
public class WebUtils {

    /**
     * Check the given request for a session attribute of the given name.
     * Returns null if there is no session or if the session has no such
     * attribute. Does not create a new session if none has existed before!
     *
     * @param request current HTTP request
     * @param name    the name of the session attribute
     * @return the value of the session attribute, or <code>null</code> if not
     *         found
     */
    public static Object getSessionAttribute(HttpServletRequest request,
                                             String name) {
        Assert.notNull(request, "Request must not be null");
        HttpSession session = request.getSession(false);
        return (session != null ? session.getAttribute(name) : null);
    }

    /**
     * 判断是否为Ajax请求
     *
     * @param request HttpServletRequest
     * @return 是true, 否false
     */
    public static boolean isAjaxRequest(HttpServletRequest request) {
        String requestType = request.getHeader("X-Requested-With");
        if (requestType != null && requestType.equals("XMLHttpRequest")) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 用来获取当前应用WEB-INF目录的绝对路径
     *
     * @return
     */
    public static String getWebInfFullPath() {
        return PathKit.getWebRootPath() + "/WEB-INF/";
    }

    /**
     * 获取客户端IP地址，此方法用在proxy环境中
     *
     * @param req
     * @return
     */
    public static String getRemoteAddr(HttpServletRequest req) {
        String ip = req.getHeader("X-Forwarded-For");
        if (StringUtils.isNotBlank(ip)) {
            String[] ips = StringUtils.split(ip, ',');
            if (ips != null) {
                for (String tmpip : ips) {
                    if (StringUtils.isBlank(tmpip))
                        continue;
                    tmpip = tmpip.trim();
                    if (isIPAddr(tmpip) &&
                            !tmpip.startsWith("10.") &&
                            !tmpip.startsWith("192.168.") && !"127.0.0.1".equals(tmpip)) {
                        return tmpip.trim();
                    }
                }
            }
        }
        ip = req.getHeader("x-real-ip");
        if (isIPAddr(ip))
            return ip;
        ip = req.getRemoteAddr();
        if (isIPAddr(ip))
            return ip;
        return "127.0.0.1";
    }

    /**
     * 判断字符串是否是一个IP地址
     *
     * @param addr
     * @return
     */
    public static boolean isIPAddr(String addr) {
        if (StringUtils.isEmpty(addr))
            return false;
        String[] ips = StringUtils.split(addr, '.');
        if (ips.length != 4)
            return false;
        try {
            int ipa = Integer.parseInt(ips[0]);
            int ipb = Integer.parseInt(ips[1]);
            int ipc = Integer.parseInt(ips[2]);
            int ipd = Integer.parseInt(ips[3]);
            return ipa >= 0 && ipa <= 255 && ipb >= 0 && ipb <= 255 && ipc >= 0
                    && ipc <= 255 && ipd >= 0 && ipd <= 255;
        } catch (Exception e) {
        }
        return false;
    }

}
