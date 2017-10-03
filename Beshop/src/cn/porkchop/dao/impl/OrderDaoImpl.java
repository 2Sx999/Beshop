package cn.porkchop.dao.impl;

import cn.porkchop.dao.OrderDao;
import cn.porkchop.domain.Order;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.User;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class OrderDaoImpl implements OrderDao {

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
        return queryRunner.update(sql, 1, r6_order);
    }


    @Override
    public List<Order> findMyOrdersByPagination(User user, PageBean<Order> pageBean) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from orders where uid=? limit ?,? ";
        int i = (pageBean.getCurrentPage() - 1) * pageBean.getCurrentCount();
        return queryRunner.query(sql, new BeanListHandler<Order>(Order.class), user.getUid(), i, pageBean.getCurrentCount());
    }


    @Override
    public long findMyOrderCount(User user) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from orders where uid=?";
        return (long) queryRunner.query(sql, new ScalarHandler(1), user.getUid());
    }


    @Override
    public long findAllOrderCount() throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from orders";
        return (long) queryRunner.query(sql, new ScalarHandler(1));
    }

    @Override
    public List<Order> findOrderByPagination(PageBean<Order> pageBean) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from orders limit ?,?";
        int i = (pageBean.getCurrentPage() - 1) * pageBean.getCurrentCount();
        return queryRunner.query(sql, new BeanListHandler<Order>(Order.class), i, pageBean.getCurrentCount());
    }
}
