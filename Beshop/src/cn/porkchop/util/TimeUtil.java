package cn.porkchop.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
    /**
     * 格式:yyyy-MM-dd HH:mm:ss
     * @date 2017/10/3 15:42
     * @author porkchop
     */
    public static String getFormattedTime(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return formatter.format(date);
    }
    /**
     * 格式:yyyyMMddHHmmss
     * @date 2017/10/3 15:42
     * @author porkchop
     */
    public static String getFormattedContinueousTime(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        return formatter.format(date);
    }
}
