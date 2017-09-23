package cn.porkchop.service.impl;

import cn.porkchop.dao.ProductDao;
import cn.porkchop.dao.impl.ProductDaoImpl;
import cn.porkchop.domain.Product;
import cn.porkchop.service.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    ProductDao productDao = new ProductDaoImpl();
    /**
     * @description   返回首页的最新内容的产品list
     * @author porkchop
     * @date 2017/9/23 19:41
     */
    @Override
    public List<Product> findNewProductsForIndex() {
        try {
            return  productDao.findNewProducts(9);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * @description   返回首页的热门产品的list
     * @author porkchop
     * @date 2017/9/23 19:41
     */
    @Override
    public List<Product> findHotProductsForIndex() {
        try {
            return productDao.findHotProducts(9);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * @description  根据id获取产品
     * @author porkchop
     * @date 2017/9/23 20:36
     */
    @Override
    public Product findProductById(String pid) {
        try {
            return productDao.findProductById(pid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
