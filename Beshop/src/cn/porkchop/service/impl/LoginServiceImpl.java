package cn.porkchop.service.impl;

import cn.porkchop.dao.UserDao;
import cn.porkchop.dao.impl.UserDaoImpl;
import cn.porkchop.domain.User;
import cn.porkchop.exception.EmailInactivatedException;
import cn.porkchop.exception.WrongUorPException;
import cn.porkchop.service.LoginService;

import java.sql.SQLException;

public class LoginServiceImpl implements LoginService {
    UserDao userDao = new UserDaoImpl();
    /**
     * @description  登陆
     * @author porkchop
     * @date 2017/9/21 19:25
     */
    @Override
    public User login(User user) throws EmailInactivatedException, WrongUorPException {
        try {
            User u = userDao.login(user);
            if(u==null){
                throw new WrongUorPException("账号或密码错误");
            }
            if(!checkEmailAcitate(user)){
                throw new EmailInactivatedException("邮箱未激活");
            }
            return u;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

    }
    /**
     * @description  检查账号是否激活
     * @return true为激活 ,false未激活
     * @author porkchop
     * @date 2017/9/21 20:16
     */
    private boolean checkEmailAcitate(User user) throws SQLException {
        long l = userDao.findStateByUsername(user);
        return l>0;
    }



}
