package cn.porkchop.dao.impl;

import cn.porkchop.dao.ProductDao;
import cn.porkchop.domain.Product;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ProductDaoImpl implements ProductDao {

    /**
     * @description  查询指定数量的产品
     * @author porkchop
     * @date 2017/9/23 19:39
     */
    @Override
    public List<Product> findNewProducts(int count) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql  ="select * from product order by pdate DESC limit 0,? ";
        List<Product> list = queryRunner.query(sql, new BeanListHandler<Product>(Product.class), count);
        return list;

    }

    @Override
    public List<Product> findHotProducts(int count) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql  ="select * from product where is_hot=1 limit 0,? ";
        List<Product> list = queryRunner.query(sql, new BeanListHandler<Product>(Product.class), count);
        return list;
    }

    @Override
    public Product findProductById(String pid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql  ="select * from product where pid=? ";
        Product product = queryRunner.query(sql, new BeanHandler<Product>(Product.class), pid);
        return product;
    }
}
