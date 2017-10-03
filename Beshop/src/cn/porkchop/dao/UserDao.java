package cn.porkchop.dao;

import cn.porkchop.domain.User;

import java.sql.SQLException;

public interface UserDao {
    /**
     * 查找用户名是否曾在
     *
     * @author porkchop
     * @date 2017/9/22 9:47
     */
    long findUserByUsername(String username) throws SQLException;

    /**
     * 插入user的数据
     *
     * @author porkchop
     * @date 2017/9/22 9:49
     */
    int insertAll(User user) throws SQLException;

    /**
     * 根据激活码更改用户状态
     *
     * @author porkchop
     * @date 2017/9/22 9:49
     */
    int updateUserStateByCode(String activatecode) throws SQLException;

    /**
     * 登陆,返回用户信息
     *
     * @author porkchop
     * @date 2017/9/21 21:04
     */
    User login(User user) throws SQLException;

    /**
     * 根据用户名查询用户状态
     *
     * @author porkchop
     * @date 2017/9/21 21:04
     */
    long findStateByUsername(User user) throws SQLException;
}
