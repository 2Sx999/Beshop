package cn.porkchop.service.impl;

import cn.porkchop.dao.OrderDao;
import cn.porkchop.dao.OrderItemDao;
import cn.porkchop.dao.impl.OrderDaoImpl;
import cn.porkchop.dao.impl.orderItemDaoImpl;
import cn.porkchop.domain.Order;
import cn.porkchop.domain.OrderItem;
import cn.porkchop.service.OrderService;
import cn.porkchop.util.DataSourceUtils;

import java.sql.SQLException;

public class OrderServiceImpl implements OrderService {
    OrderDao orderDao = new OrderDaoImpl();
    OrderItemDao orderItemDao = new orderItemDaoImpl();

    /**
     * @description 插入订单与订单项
     * @author porkchop
     * @date 2017/9/27 12:50
     */
    @Override
    public boolean insertOrder(Order order) {
        try {
            DataSourceUtils.startTransanction();
            orderDao.insertOrder(order);
            for (OrderItem orderItem : order.getOrderItemList()) {
                orderItemDao.insertOrderItem(orderItem);
            }
            DataSourceUtils.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                DataSourceUtils.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            try {
                DataSourceUtils.closeConnection();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * @description 改变订单的地址, 收货人, 电话
     * @author porkchop
     * @date 2017/9/27 21:40
     */
    @Override
    public boolean updateOrder(Order order) {
        try {
            orderDao.updateOrderById(order);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateOrderStateById(String r6_order) {

        try {
            orderDao.updateOrderStateById(r6_order);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
