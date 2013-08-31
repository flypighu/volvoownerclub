package com.hux.frame.util;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang.time.DateUtils;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Date;

/**
 * 日期工具类
 * User: xiang
 * Date: 13-5-7
 * Time: 下午3:34
 * To change this template use File | Settings | File Templates.
 */
public class DateUtil {

    private static String[] pattern = new String[]{"yyyy-MM", "yyyyMM", "yyyy/MM",
            "yyyyMMdd", "yyyy-MM-dd", "yyyy/MM/dd",
            "yyyyMMddHHmmss",
            "yyyy-MM-dd HH:mm:ss",
            "yyyy/MM/dd HH:mm:ss"};

    /**
     * 判断时间是几分钟前、或者几小时前、或者几天前、或者几年前。
     *
     * @param cTime 需要判断的日期
     * @return 几分钟前、或者几小时前、或者几天前、或者几年前
     */
    public static String checkTimeQian(Date cTime) {

        if (null == cTime) {
            return "0分钟前";
        }
        Date now = new Date();
        long sub = now.getTime() - cTime.getTime();
        long m = 1000 * 60;//1分钟=1000*60毫秒
        long h = m * 60;//1小时=1分钟*60
        long d = h * 24;//1天=1小时*24
        long y = d * 365;//1年=1天*356
//        System.out.println(sub / m);
//        System.out.println(sub / h);
//        System.out.println(sub / d);
//        System.out.println(sub / y);

        if (sub / m == 0) {

            return "1分钟前";
        }

        if (sub / m <= 60) {

            return sub / m + "分钟前";
        } else if (sub / h <= 60) {

            return sub / h + "小时前";
        } else if (sub / d <= 24) {

            return sub / d + "天前";
        } else if (sub / y <= 365) {

            return sub / y + "年前";
        }

        return "0分钟前";
    }

    public static Date parseDate(String dateStr) throws ParseException {

        return DateUtils.parseDate(dateStr, pattern);
    }

    public static void main(String[] args) throws Exception {

       // System.out.println(checkTimeQian(DateUtils.parseDate("2013-07-18 14:57:26", pattern)));
        DateFormat format2 = new java.text.SimpleDateFormat("yyyy/MMdd");
        System.out.println(format2.format(new Date()));

        String s = "并行和分布式将支撑起更大的计算平台系统。而更高层和更智能化的交换网络系统也将成asdf";
        System.out.println(s.length());
    }

}
