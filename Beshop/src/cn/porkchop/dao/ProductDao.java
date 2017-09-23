package cn.porkchop.dao;

import cn.porkchop.domain.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {
    List<Product> findNewProducts(int count) throws SQLException;

    List<Product> findHotProducts(int count) throws SQLException;

    Product findProductById(String pid) throws SQLException;
}
