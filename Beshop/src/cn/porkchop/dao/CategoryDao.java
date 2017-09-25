package cn.porkchop.dao;

import cn.porkchop.domain.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryDao {
    List<Category> findAllCategories() throws SQLException;

    Category findAllCategoryById(String cid) throws SQLException;
}
