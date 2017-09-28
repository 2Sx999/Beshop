package cn.porkchop.dao;

import cn.porkchop.domain.OrderItem;

import java.sql.SQLException;

public interface OrderItemDao {
    int insertOrderItem(OrderItem orderItem) throws SQLException;
}
