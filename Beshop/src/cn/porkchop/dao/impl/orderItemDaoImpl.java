package cn.porkchop.dao.impl;

import cn.porkchop.dao.OrderItemDao;
import cn.porkchop.domain.OrderItem;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;
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
}
