package cn.porkchop.dao.impl;

import cn.porkchop.dao.ProductDao;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.Product;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class ProductDaoImpl implements ProductDao {

    /**
     * @description 查询指定数量的产品
     * @author porkchop
     * @date 2017/9/23 19:39
     */
    @Override
    public List<Product> findNewProducts(int count) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product order by pdate DESC limit 0,? ";
        List<Product> list = queryRunner.query(sql, new BeanListHandler<Product>(Product.class), count);
        return list;

    }

    @Override
    public List<Product> findHotProducts(int count) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where is_hot=1 limit 0,? ";
        List<Product> list = queryRunner.query(sql, new BeanListHandler<Product>(Product.class), count);
        return list;
    }

    @Override
    public Product findProductById(String pid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where pid=? ";
        Product product = queryRunner.query(sql, new BeanHandler<Product>(Product.class), pid);
        return product;
    }

    @Override
    public List<Product> findProductsPaginationByCid(PageBean<Product> pageBean, String cid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from product where cid=? limit ?,? ";
        int i = (pageBean.getCurrentPage() - 1) * pageBean.getCurrentCount();
        List<Product> list = queryRunner.query(sql, new BeanListHandler<Product>(Product.class), cid, i, pageBean.getCurrentCount());
        return list;

    }

    @Override
    public long findCountByCid(String cid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from product where cid=?";
        return (long) queryRunner.query(sql, new ScalarHandler(1), cid);
    }
}
