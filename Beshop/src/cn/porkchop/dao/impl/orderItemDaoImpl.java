package cn.porkchop.dao.impl;

import cn.porkchop.dao.OrderItemDao;
import cn.porkchop.domain.OrderItem;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @description  插入订单项,由service层关闭连接
 * @author porkchop
 * @date 2017/9/27 13:14
 */
public class orderItemDaoImpl implements OrderItemDao {
    @Override
    public int insertOrderItem(OrderItem orderItem) throws SQLException {
        QueryRunner queryRunner = new QueryRunner();
        String sql = "insert into orderitem values(?,?,?,?,?)";
        return  queryRunner.update(DataSourceUtils.getConnection(), sql, orderItem.getItemId(), orderItem.getCount(), orderItem.getSubtotal(), orderItem.getProduct().getPid(), orderItem.getOrder().getOid());
    }

    @Override
    public List<Map<String, Object>> findOrderItemByOrderId(String oid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT   oi.count,oi.subtotal,p.pimage,p.pname,p.pid,p.shop_price from orderitem oi,product p where oi.oid=? and oi.pid=p.pid";
        return queryRunner.query(sql,new MapListHandler(),oid);
    }
}
