package cn.porkchop.dao.impl;

import cn.porkchop.dao.UserDao;
import cn.porkchop.domain.User;
import cn.porkchop.util.DataSourceUtils;
import cn.porkchop.util.Md5Utils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;

public class UserDaoImpl implements UserDao {

    @Override
    public long findUserByUsername(String username) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from user where username=?";
        long count = (long) queryRunner.query(sql, new ScalarHandler(1), username);
        return count;
    }

    @Override
    public int insertAll(User user) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?)";
        int update = queryRunner.update(sql, user.getUid(), user.getUsername(), Md5Utils.encode(user.getPassword()), user.getName(), user.getEmail(), user.getTelephone(), user.getBirthday(), user.getSex(), user.getState(), user.getCode());
        return update;
    }

    @Override
    public int updateUserStateByCode(String code) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update user set state=1 where code=?";
        int update = queryRunner.update(sql, code);
        return update;

    }


    @Override
    public User login(User user) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where username=? and password=?";
        User u = queryRunner.query(sql, new BeanHandler<User>(User.class), user.getUsername(), Md5Utils.encode(user.getPassword()));
        return u;
    }


    @Override
    public long findStateByUsername(User user) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select state from user where username=?";
        Object count = queryRunner.query(sql, new ScalarHandler(1), user.getUsername());
        return count == null ? 0L : (int) count;
    }
}
