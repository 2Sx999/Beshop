package cn.porkchop.service;

import cn.porkchop.domain.Order;
import cn.porkchop.domain.OrderItem;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.User;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface OrderService {
    /**
     * 插入订单与订单项
     *
     * @author porkchop
     * @date 2017/9/27 12:50
     */
    boolean insertOrder(Order order);

    /**
     * 改变订单的地址, 收货人, 电话
     *
     * @author porkchop
     * @date 2017/9/27 21:40
     */
    boolean updateOrder(Order order);

    /**
     * 根据订单号修改订单状态
     *
     * @author porkchop
     * @date 2017/9/29 19:30
     */
    boolean updateOrderStateById(String r6_order);

    /**
     * 分页查询order, 并且封装product和orderitem
     *
     * @author porkchop
     * @date 2017/9/29 20:25
     */
    PageBean<Order> getMyOrdersByPagination(User user, PageBean<Order> pageBean) throws InvocationTargetException, IllegalAccessException;

    /**
     * 根据id查询订单项
     *
     * @date 2017/10/3 21:55
     * @author porkchop
     * @param oid
     */
    List<OrderItem> findOrderItemsByOid(String oid) throws InvocationTargetException, IllegalAccessException;
    /**
     * 分页获取订单
     * @date 2017/10/3 18:38
     * @author porkchop
     */
    PageBean<Order> findOrderByPagination(PageBean<Order> pageBean);
}
