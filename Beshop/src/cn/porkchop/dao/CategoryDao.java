package cn.porkchop.dao;

import cn.porkchop.domain.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryDao {
    /**
     * 获得所有的商品类别
     * @author porkchop
     * @date 2017/9/24 11:47
     */
    List<Category> findAllCategories() throws SQLException;
    /**
     * 根据id查询类别名称
     * @author porkchop
     * @date 2017/10/2 18:31
     */
    Category findCategoryById(String cid) throws SQLException;
    /**
     * 根据id修改类别名称
     * @author porkchop
     * @date 2017/10/2 18:31
     */
    int updateCategoryById(Category cid) throws SQLException;
    /**
     * 根据id删除
     * @author porkchop
     * @date 2017/10/2 21:38
     */
    int delCategoryById(String cid) throws SQLException;
    /**
     * 添加商品
     * @date 2017/10/3 16:38
     * @author porkchop
     */
    int addCategory(Category category) throws SQLException;

}
