package cn.porkchop.exception;

/**
 * @description  邮箱未激活异常
 * @author porkchop
 * @date 2017/9/22 10:03
 */
public class EmailInactivatedException extends Exception {
    public EmailInactivatedException(String string) {
        super(string);
    }
}
