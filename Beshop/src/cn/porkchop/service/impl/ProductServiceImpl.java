package cn.porkchop.service.impl;

import cn.porkchop.dao.CategoryDao;
import cn.porkchop.dao.ProductDao;
import cn.porkchop.dao.impl.CategoryDaoImpl;
import cn.porkchop.dao.impl.ProductDaoImpl;
import cn.porkchop.domain.Category;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.Product;
import cn.porkchop.exception.NoSuchProductException;
import cn.porkchop.service.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    ProductDao productDao = new ProductDaoImpl();
    CategoryDao categoryDao = new CategoryDaoImpl();

    /**
     * @description 返回首页的最新内容的产品list
     * @author porkchop
     * @date 2017/9/23 19:41
     */
    @Override
    public List<Product> findNewProductsForIndex() {
        try {
            return productDao.findNewProducts(9);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @description 返回首页的热门产品的list
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
     * @description 根据id获取产品
     * @author porkchop
     * @date 2017/9/23 20:36
     */
    @Override
    public Product findProductById(String pid) throws NoSuchProductException {
        try {
            Product product = productDao.findProductById(pid);
            if(product==null){
                throw new NoSuchProductException("没有这个商品");
            }
            return product;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @description  根据分类,分页显示商品
     * @author porkchop
     * @date 2017/9/24 14:34
     * @return 返回的Category
     */
    @Override
    public Category findProductByCategory(PageBean<Product> pageBean, String cid) {
        try {
            pageBean.setTotalCount((int) productDao.findCountByCid(cid));
            pageBean.setTotalPage((int) Math.ceil((double) pageBean.getTotalCount() / pageBean.getCurrentCount()));
            pageBean.setList(productDao.findProductsPaginationByCid(pageBean, cid));
            return categoryDao.findAllCategoryById(cid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
