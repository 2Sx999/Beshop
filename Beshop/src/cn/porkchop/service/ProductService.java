package cn.porkchop.service;

import cn.porkchop.domain.Category;
import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.Product;
import cn.porkchop.exception.NoSuchProductException;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public interface ProductService {
    /**
     * 返回首页的最新内容的产品list
     *
     * @author porkchop
     * @date 2017/9/23 19:41
     */
    List<Product> findNewProductsForIndex();

    /**
     * 返回首页的热门产品的list
     *
     * @author porkchop
     * @date 2017/9/23 19:41
     */
    List<Product> findHotProductsForIndex();

    /**
     * 根据id获取产品
     *
     * @author porkchop
     * @date 2017/9/23 20:36
     */
    Product findProductById(String pid) throws NoSuchProductException, InvocationTargetException, IllegalAccessException;

    /**
     * 根据分类,分页显示商品
     *
     * @return 返回的Category
     * @author porkchop
     * @date 2017/9/24 14:34
     */
    Category findProductByCategory(PageBean<Product> pageBean, String cid);

    /**
     * 分页查询所有的商品
     *
     * @author porkchop
     * @date 2017/10/3 12:35
     */
    PageBean<Product> findProductsByPagination(PageBean<Product> pageBean) throws InvocationTargetException, IllegalAccessException;

    /**
     * 添加商品
     *
     * @date 2017/10/3 15:52
     * @author porkchop
     */
    boolean addProduct(Product product);

    /**
     * 修改商品
     *
     * @date 2017/10/3 17:33
     * @author porkchop
     */
    boolean updateProductById(Product product);

    /**
     * 根据id删除商品
     *
     * @date 2017/10/3 18:09
     * @author porkchop
     */
    boolean delProductById(String pid);

}
