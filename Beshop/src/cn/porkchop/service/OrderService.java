package cn.porkchop.service;

import cn.porkchop.domain.Order;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.User;

import java.lang.reflect.InvocationTargetException;

public interface OrderService {
    boolean insertOrder(Order order);

    boolean updateOrder(Order order);

    boolean updateOrderStateById(String r6_order);

    PageBean<Order> getMyOrdersByPagination(User user, PageBean<Order> pageBean) throws InvocationTargetException, IllegalAccessException;
}
