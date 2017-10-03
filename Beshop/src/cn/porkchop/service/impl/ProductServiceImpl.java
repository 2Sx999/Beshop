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
import org.apache.commons.beanutils.BeanUtils;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private ProductDao productDao = new ProductDaoImpl();
    private CategoryDao categoryDao = new CategoryDaoImpl();


    @Override
    public List<Product> findNewProductsForIndex() {
        try {
            return productDao.findNewProducts(9);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public List<Product> findHotProductsForIndex() {
        try {
            return productDao.findHotProducts(9);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public Product findProductById(String pid) throws NoSuchProductException, InvocationTargetException, IllegalAccessException {
        try {
            Map<String, Object> map = productDao.findProductById(pid);
            if(map==null){
                throw new NoSuchProductException("没有这个商品");
            }
            Product product = new Product();
            Category category = new Category();
            product.setCategory(category);
            BeanUtils.populate(product,map);
            BeanUtils.populate(category,map);
            return product;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public Category findProductByCategory(PageBean<Product> pageBean, String cid) {
        try {
            pageBean.setTotalCount((int) productDao.findCountByCid(cid));
            pageBean.setTotalPage((int) Math.ceil((double) pageBean.getTotalCount() / pageBean.getCurrentCount()));
            pageBean.setList(productDao.findProductsPaginationByCid(pageBean, cid));
            return categoryDao.findCategoryById(cid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public PageBean<Product> findProductsByPagination(PageBean<Product> pageBean) throws InvocationTargetException, IllegalAccessException {
        try {
            pageBean.setTotalCount((int) productDao.findAllProductCount());
            pageBean.setTotalPage((int) Math.ceil((double) pageBean.getTotalCount() / pageBean.getCurrentCount()));
            List<Map<String, Object>> mapList = productDao.findProductsByPagination(pageBean);
            List<Product> list = new ArrayList<>();
            pageBean.setList(list);
            for(Map<String,Object> map:mapList ){
                Product product = new Product();
                Category category = new Category();
                product.setCategory(category);
                BeanUtils.populate(category,map);
                BeanUtils.populate(product,map);
                list.add(product);
            }
            return pageBean;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean addProduct(Product product) {
        try {
            int i = productDao.addProduct(product);
            return i>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateProductById(Product product) {
        try {
            int i = productDao.updateProductById(product);
            return i>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delProductById(String pid) {
        try {
            int i = productDao.delProductById(pid);
            return i>0?true:false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


}
