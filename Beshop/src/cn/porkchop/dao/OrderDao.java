package cn.porkchop.dao;

import cn.porkchop.domain.Order;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.User;

import java.sql.SQLException;
import java.util.List;

public interface OrderDao {
    /**
     * 插入orders表
     *
     * @author porkchop
     * @date 2017/9/27 16:53
     */
    int insertOrder(Order order) throws SQLException;

    /**
     * 根据id更新电话, 收货人, 收货地址
     *
     * @author porkchop
     * @date 2017/9/29 20:29
     */
    int updateOrderById(Order order) throws SQLException;

    /**
     * 根据id更改订单状态
     *
     * @author porkchop
     * @date 2017/9/29 20:29
     */
    int updateOrderStateById(String r6_order) throws SQLException;

    /**
     * 分页查询本用户的订单
     *
     * @author porkchop
     * @date 2017/9/29 20:28
     */
    List<Order> findMyOrdersByPagination(User user, PageBean<Order> pageBean) throws SQLException;

    /**
     * 查询本用户的order数量
     *
     * @author porkchop
     * @date 2017/9/29 20:28
     */
    long findMyOrderCount(User user) throws SQLException;


    /**
     * 分页获取订单
     *
     * @date 2017/10/3 18:45
     * @author porkchop
     */
    List<Order> findOrderByPagination(PageBean<Order> pageBean) throws SQLException;

    /**
     * 获取所有的订单数量
     *
     * @date 2017/10/3 18:44
     * @author porkchop
     */
    long findAllOrderCount() throws SQLException;

}
