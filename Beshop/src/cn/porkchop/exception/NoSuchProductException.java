package cn.porkchop.exception;

/**
 * @description  邮箱未激活异常
 * @author porkchop
 * @date 2017/9/22 10:03
 */
public class NoSuchProductException extends Exception {
    public NoSuchProductException(String string) {
        super(string);
    }
}
