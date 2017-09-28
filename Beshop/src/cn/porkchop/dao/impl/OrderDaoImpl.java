package cn.porkchop.dao.impl;

import cn.porkchop.dao.OrderDao;
import cn.porkchop.domain.Order;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

public class OrderDaoImpl implements OrderDao {
    /**
     * @description 插入orders表
     * @author porkchop
     * @date 2017/9/27 16:53
     */
    @Override
    public int insertOrder(Order order) throws SQLException {
        QueryRunner queryRunner = new QueryRunner();
        String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
        return queryRunner.update(DataSourceUtils.getConnection(), sql, order.getOid(), order.getOrderTime(), order.getTotal(), order.getState(), order.getAddress(), order.getName(), order.getTelephone(), order.getUser().getUid());
    }

    @Override
    public int updateOrderById(Order order) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update orders set address=?,name=?,telephone=? where oid=?";
        return queryRunner.update(sql, order.getAddress(), order.getName(), order.getTelephone(), order.getOid());
    }

    @Override
    public int updateOrderStateById(String r6_order) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update orders set state=? where oid=?";
        return queryRunner.update(sql,1,r6_order);
    }
}
