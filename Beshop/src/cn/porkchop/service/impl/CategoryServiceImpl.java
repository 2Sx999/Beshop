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
    private CategoryDao categoryDao = new CategoryDaoImpl();
    private JedisDao jedisDao = new JedisDaoImpl();


    @Override
    public String findAllCategories() {
        try {
            String categoriesJson = jedisDao.findAllCategoriesJson();
            if (categoriesJson == null) {
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

    @Override
    public boolean updateCategoryById(Category category) {
        try {
            int i = categoryDao.updateCategoryById(category);
            jedisDao.delCategoryJson();
            return i < 1 ? false : true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delCategoryById(String cid) {
        try {
            int i = categoryDao.delCategoryById(cid);
            jedisDao.delCategoryJson();
            return i<1?false:true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addCategory(Category category) {
        try {
            int i = categoryDao.addCategory(category);
            jedisDao.delCategoryJson();
            return i<1?false:true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
