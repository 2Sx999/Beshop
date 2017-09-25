package cn.porkchop.dao;

public interface JedisDao {
    String findAllCategoriesJson();

    void insertAllCategoriesJson(String categoriesJson);
}
