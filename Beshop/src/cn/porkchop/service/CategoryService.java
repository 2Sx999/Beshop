package cn.porkchop.service;

import cn.porkchop.domain.Category;

public interface CategoryService {
    /**
     * 获得所有的商品类别, 保存到redis中或从中获取
     * @author porkchop
     * @date 2017/9/24 11:47
     */
    String findAllCategories();
    /**
     * 根据id修改类别名称
     * @author porkchop
     * @date 2017/10/2 18:31
     */
    boolean updateCategoryById(Category cid);
    /**
     * 根据id删除
     * @author porkchop
     * @date 2017/10/2 21:38
     */
    boolean delCategoryById(String cid);
    /**
     * 添加类别
     * @author porkchop
     * @date 2017/10/2 21:47
     */
    boolean addCategory(Category category);
}
