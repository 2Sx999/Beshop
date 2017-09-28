package cn.porkchop.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @description  md5加密工具类
 * @author porkchop
 * @date 2017/9/20 23:11
 */
public class Md5Utils {
    /**
     * @param str 需要加密的字符串
     * @return 字符串加密后的md5值
     */
    public static String encode(String str) {
        String res = "";
        String s = "";
        //javase api
        try {
            MessageDigest md = MessageDigest.getInstance("md5");
            //MD5加密后的字节数组
            byte[] digest = md.digest(str.getBytes());
            //把字节数组转成字符串
            // byte 8bit  4bit 十六进制   2位十六进制
            for (byte b : digest) {//数组 Iterable
                //把一个字节转成十六进制 8 >> 2
                //去掉一个int类型前3个字节 0a
                int d = b & 0x000000ff;
                s = Integer.toHexString(d);
                if (s.length() == 1) {
                    s = "0" + s;
                }
                res = res + s;
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return res;
    }
}
