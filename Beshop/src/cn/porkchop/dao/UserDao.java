package cn.porkchop.dao;

import cn.porkchop.domain.User;

import java.sql.SQLException;

public interface UserDao {

    long findUserByUsername(String username) throws SQLException;

    int insertAll(User user) throws SQLException;

    int updateUserStateByCode(String activatecode) throws SQLException;

    User login(User user) throws SQLException;

    long findStateByUsername(User user) throws SQLException;
}
