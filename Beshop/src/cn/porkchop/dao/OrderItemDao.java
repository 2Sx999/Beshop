package cn.porkchop.dao;

import cn.porkchop.domain.OrderItem;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface OrderItemDao {
    /**
     * 插入订单项,由service层关闭连接
     *
     * @author porkchop
     * @date 2017/9/27 13:14
     */
    int insertOrderItem(OrderItem orderItem) throws SQLException;
    /**
     * 根据订单id查询订单项
     *
     * @date 2017/10/3 21:50
     * @author porkchop
     */
    List<Map<String, Object>> findOrderItemByOrderId(String oid) throws SQLException;
}
