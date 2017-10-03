package cn.porkchop.service;

import cn.porkchop.domain.User;
import cn.porkchop.exception.EmailInactivatedException;
import cn.porkchop.exception.WrongUorPException;

public interface LoginService {
    /**
     * 登陆
     * @author porkchop
     * @date 2017/9/21 19:25
     */
    User login(User user) throws EmailInactivatedException, WrongUorPException;
}
