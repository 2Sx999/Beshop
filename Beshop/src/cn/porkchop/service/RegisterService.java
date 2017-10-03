package cn.porkchop.service;

import cn.porkchop.domain.User;

import javax.servlet.http.HttpServletRequest;

public interface RegisterService {
    /**
     * 查询用户名是否重复
     *
     * @param username
     * @return 返回true为有一样的username, false为没有一样的username
     * @author porkchop
     * @date 2017/9/21 11:08
     */
    boolean checkUserName(String username);

    /**
     * 注册
     *
     * @return ture为注册成功
     * @author porkchop
     * @date 2017/9/21 13:06
     */
    boolean register(User user, HttpServletRequest request);

    /**
     * 用激活码激活邮箱
     *
     * @author porkchop
     * @date 2017/9/21 19:05
     */
    boolean activate(String activatecode);
}
