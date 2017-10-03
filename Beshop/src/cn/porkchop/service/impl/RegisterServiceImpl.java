package cn.porkchop.service.impl;

import cn.porkchop.dao.UserDao;
import cn.porkchop.dao.impl.UserDaoImpl;
import cn.porkchop.domain.User;
import cn.porkchop.service.RegisterService;
import cn.porkchop.util.MailUtils;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.SQLException;

public class RegisterServiceImpl implements RegisterService {
    private UserDao userDao = new UserDaoImpl();


    @Override
    public boolean checkUserName(String username) {
        try {
            long count = userDao.findUserByUsername(username);
            return count > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }


    @Override
    public boolean register(User user, HttpServletRequest request) {
        try {
            int i = userDao.insertAll(user);
            if (i > 0) {
                //插入成功,发送邮件
                MailUtils.sendMail("714772696@qq.com", "aflagphjgxcvbehg", user.getEmail(),
                        "恭喜您注册成功,<a href=\"http://"+InetAddress.getLocalHost().getHostAddress()+request.getContextPath()+"/register.php?method=activate&activatecode="+user.getCode()+"\">点击激活</a>");
            }
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (UnknownHostException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean activate(String activatecode) {
        try {
            int i = userDao.updateUserStateByCode(activatecode);
            return i > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
