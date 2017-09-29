package cn.porkchop.dao;

import cn.porkchop.domain.Order;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.User;

import java.sql.SQLException;
import java.util.List;

public interface OrderDao {
    int insertOrder(Order order) throws SQLException;

    int updateOrderById(Order order) throws SQLException;

    int updateOrderStateById(String r6_order) throws SQLException;

    List<Order> findMyOrdersByPagination(User user, PageBean<Order> pageBean) throws SQLException;

    long findMyOrderCount(User user) throws SQLException;
}
