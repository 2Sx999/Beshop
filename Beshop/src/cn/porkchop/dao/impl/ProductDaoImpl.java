package cn.porkchop.dao.impl;

import cn.porkchop.dao.ProductDao;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.Product;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class ProductDaoImpl implements ProductDao {


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
    public Map<String, Object> findProductById(String pid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT p.*,c.cname FROM product p,category c WHERE p.cid=c.cid AND p.pid=?";
        return queryRunner.query(sql, new MapHandler(), pid);
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

    @Override
    public long findAllProductCount() throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select count(*) from product";
        return (long)queryRunner.query(sql,new ScalarHandler(1));
    }

    @Override
    public List<Map<String, Object>> findProductsByPagination(PageBean<Product> pageBean) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select p.*,c.cname from (select * from product order by cid LIMIT ?,?) p,category c where p.cid=c.cid";
        int i = (pageBean.getCurrentPage() - 1) * pageBean.getCurrentCount();
        return queryRunner.query(sql,new MapListHandler(), i, pageBean.getCurrentCount());
    }

    @Override
    public int addProduct(Product product) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into product values(?,?,?,?,?,?,?,?,?,?)";
        return queryRunner.update(sql,product.getPid(),product.getPname(),product.getMarket_price(),product.getShop_price(),product.getPimage(),product.getPdate(),product.getIs_hot(),product.getPdesc(),product.getPflag(),product.getCategory().getCid());

    }

    @Override
    public int updateProductById(Product product) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        if(product.getPimage()==null){
            String sql="update product set pname=?,market_price=?,shop_price=?,pdate=?,is_hot=?,pdesc=?,pflag=?,cid=? where pid=?";
            return queryRunner.update(sql,product.getPname(),product.getMarket_price(),product.getShop_price(),
                    product.getPdate(),product.getIs_hot(),product.getPdesc(),product.getPflag(),product.getCategory().getCid(),product.getPid());
        }else{
            String sql="update product set pname=?,market_price=?,shop_price=?,pdate=?,is_hot=?,pdesc=?,pflag=?,cid=?,pimage=? where pid=?";
            return queryRunner.update(sql,product.getPname(),product.getMarket_price(),product.getShop_price(),
                    product.getPdate(),product.getIs_hot(),product.getPdesc(),product.getPflag(),product.getCategory().getCid(),product.getPimage(),product.getPid());
        }
    }

    @Override
    public int delProductById(String pid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="delete from product where pid=?";
        return queryRunner.update(sql,pid);
    }


}
