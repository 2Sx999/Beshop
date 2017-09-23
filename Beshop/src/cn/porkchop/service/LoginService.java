package cn.porkchop.service;

import cn.porkchop.domain.User;
import cn.porkchop.exception.EmailInactivatedException;
import cn.porkchop.exception.WrongUorPException;

public interface LoginService {
    User login(User user) throws EmailInactivatedException, WrongUorPException;
}
