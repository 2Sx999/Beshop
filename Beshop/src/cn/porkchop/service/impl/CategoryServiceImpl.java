package cn.porkchop.service.impl;

import cn.porkchop.dao.CategoryDao;
import cn.porkchop.dao.JedisDao;
import cn.porkchop.dao.impl.CategoryDaoImpl;
import cn.porkchop.dao.impl.JedisDaoImpl;
import cn.porkchop.domain.Category;
import cn.porkchop.service.CategoryService;
import com.google.gson.Gson;

import java.sql.SQLException;
import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    CategoryDao categoryDao = new CategoryDaoImpl();
    JedisDao jedisDao = new JedisDaoImpl();

    /**
     * @description 获得所有的商品类别, 保存到redis中或从中获取
     * @author porkchop
     * @date 2017/9/24 11:47
     */
    @Override
    public String findAllCategories() {
        try {
            String categoriesJson = jedisDao.findAllCategoriesJson();
            if (categoriesJson == null) {
                System.out.println("没有缓存");
                List<Category> list = categoryDao.findAllCategories();
                Gson gson = new Gson();
                categoriesJson = gson.toJson(list);
                jedisDao.insertAllCategoriesJson(categoriesJson);
            }
            return categoriesJson;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
