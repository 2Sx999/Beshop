package cn.porkchop.dao;

import cn.porkchop.domain.OrderItem;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface OrderItemDao {
    int insertOrderItem(OrderItem orderItem) throws SQLException;
    List<Map<String, Object>> findOrderItemByOrderId(String oid) throws SQLException;
}
