package cn.porkchop.exception;

public class WrongCaptchaException extends Throwable {
    public WrongCaptchaException(String s) {
        super(s);
    }
}
