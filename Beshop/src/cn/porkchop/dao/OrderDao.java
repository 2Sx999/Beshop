package cn.porkchop.dao;

import cn.porkchop.domain.Order;

import java.sql.SQLException;

public interface OrderDao {
    int insertOrder(Order order) throws SQLException;

    int updateOrderById(Order order) throws SQLException;

    int updateOrderStateById(String r6_order) throws SQLException;
}
