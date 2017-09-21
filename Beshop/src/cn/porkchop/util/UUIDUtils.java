package cn.porkchop.util;

import java.util.UUID;

public class UUIDUtils {
    //生成uuid方法
    public static String getUUID(){
        String s = UUID.randomUUID().toString();
        String[] split = s.split("-");
        StringBuilder sb = new StringBuilder();
        for (int i=0;i<split.length;i++){
            sb.append(split[0]);
        }
        return sb.toString();
    }
}