package cn.porkchop.service;

import cn.porkchop.domain.Order;

public interface OrderService {
    boolean insertOrder(Order order);

    boolean updateOrder(Order order);

    boolean updateOrderStateById(String r6_order);
}
