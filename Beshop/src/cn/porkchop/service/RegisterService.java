package cn.porkchop.service;

import cn.porkchop.domain.User;

import javax.servlet.http.HttpServletRequest;

public interface RegisterService {

    boolean checkUserName(String username);

    boolean register(User user, HttpServletRequest request);

    boolean activate(String activatecode);
}
