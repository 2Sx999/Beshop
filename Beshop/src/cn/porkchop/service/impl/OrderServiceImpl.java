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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao = new OrderDaoImpl();
    private OrderItemDao orderItemDao = new orderItemDaoImpl();


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


    @Override
    public PageBean<Order> getMyOrdersByPagination(User user, PageBean<Order> pageBean) throws InvocationTargetException, IllegalAccessException {
        try {
            pageBean.setTotalCount((int) orderDao.findMyOrderCount(user));
            pageBean.setCurrentCount(4);
            pageBean.setTotalPage((int) Math.ceil(pageBean.getTotalCount() * 1.0 / pageBean.getCurrentCount()));
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

    @Override
    public List<OrderItem> findOrderItemsByOid(String oid) throws InvocationTargetException, IllegalAccessException {
        try {
            List<OrderItem> list = new ArrayList<>();
            List<Map<String, Object>> mapList = orderItemDao.findOrderItemByOrderId(oid);
            for (Map<String, Object> map : mapList) {
                OrderItem orderItem = new OrderItem();
                Product product = new Product();
                orderItem.setProduct(product);
                //封装到对象中
                BeanUtils.populate(orderItem, map);
                BeanUtils.populate(product, map);
                list.add(orderItem);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public PageBean<Order> findOrderByPagination(PageBean<Order> pageBean) {
        try {
            pageBean.setTotalCount((int) orderDao.findAllOrderCount());
            pageBean.setTotalPage((int) Math.ceil((double) pageBean.getTotalCount() / pageBean.getCurrentCount()));
            List<Order> list = orderDao.findOrderByPagination(pageBean);
            pageBean.setList(list);
            return pageBean;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
