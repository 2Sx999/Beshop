package cn.porkchop.dao;

import cn.porkchop.domain.PageBean;
import cn.porkchop.domain.Product;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ProductDao {
    /**
     * 查询指定数量的新产品
     *
     * @author porkchop
     * @date 2017/9/23 19:39
     */
    List<Product> findNewProducts(int count) throws SQLException;

    /**
     * 查询指定数量的热门产品
     *
     * @author porkchop
     * @date 2017/9/30 14:52
     */
    List<Product> findHotProducts(int count) throws SQLException;

    /**
     * 根据id查询商品
     *
     * @author porkchop
     * @date 2017/9/30 14:52
     */
    Map<String, Object> findProductById(String pid) throws SQLException;

    /**
     * 根据类别id分页查询商品
     *
     * @author porkchop
     * @date 2017/9/30 14:53
     */
    List<Product> findProductsPaginationByCid(PageBean<Product> pageBean, String cid) throws SQLException;

    /**
     * 根据类别id查询商品数量
     *
     * @author porkchop
     * @date 2017/9/30 14:53
     */
    long findCountByCid(String cid) throws SQLException;

    /**
     * @author porkchop
     * @date 2017/10/3 12:37
     * 查询所有商品的数量
     */
    long findAllProductCount() throws SQLException;

    /**
     * @author porkchop
     * @date 2017/10/3 12:42
     * 分页查询所有的商品
     */
    List<Map<String, Object>> findProductsByPagination(PageBean<Product> pageBean) throws SQLException;

    /**
     * 添加商品
     *
     * @date 2017/10/3 18:23
     * @author porkchop
     */
    int addProduct(Product product) throws SQLException;

    /**
     * 修改商品
     *
     * @date 2017/10/3 17:33
     * @author porkchop
     */
    int updateProductById(Product product) throws SQLException;

    /**
     * 根据id删除商品
     *
     * @date 2017/10/3 18:09
     * @author porkchop
     */
    int delProductById(String pid) throws SQLException;



}
