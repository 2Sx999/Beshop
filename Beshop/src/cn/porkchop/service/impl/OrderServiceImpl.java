package cn.porkchop.service.impl;

import cn.porkchop.dao.OrderDao;
import cn.porkchop.dao.OrderItemDao;
import cn.porkchop.dao.impl.OrderDaoImpl;
import cn.porkchop.dao.impl.orderItemDaoImpl;
import cn.porkchop.domain.*;
import cn.porkchop.service.OrderService;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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

    /**
     * @description 根据订单号修改订单状态
     * @author porkchop
     * @date 2017/9/29 19:30
     */
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

    /**
     * @description 分页查询order, 并且封装product和orderitem
     * @author porkchop
     * @date 2017/9/29 20:25
     */
    @Override
    public PageBean<Order> getMyOrdersByPagination(User user, PageBean<Order> pageBean) throws InvocationTargetException, IllegalAccessException {
        try {
            pageBean.setTotalCount((int)orderDao.findMyOrderCount(user));
            pageBean.setCurrentCount(4);
            pageBean.setTotalPage((int) Math.ceil(     pageBean.getTotalCount()*1.0/pageBean.getCurrentCount()        ));
            List<Order> orderList = orderDao.findMyOrdersByPagination(user, pageBean);
            pageBean.setList(orderList);
            for (Order order : orderList) {
                List<Map<String, Object>> mapList = orderItemDao.findOrderItemByOrderId(order.getOid());
                for (Map<String, Object> map : mapList) {
                    OrderItem orderItem = new OrderItem();
                    Product product = new Product();
                    order.getOrderItemList().add(orderItem);
                    orderItem.setProduct(product);
                    //封装到对象中
                    BeanUtils.populate(orderItem, map);
                    BeanUtils.populate(product, map);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
