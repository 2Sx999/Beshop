package cn.porkchop.dao;

import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    List<Product> findNewProducts(int count) throws SQLException;

    List<Product> findHotProducts(int count) throws SQLException;

    Product findProductById(String pid) throws SQLException;

    List<Product> findProductsPaginationByCid(PageBean<Product> pageBean, String cid) throws SQLException;

    long findCountByCid(String cid) throws SQLException;

}
