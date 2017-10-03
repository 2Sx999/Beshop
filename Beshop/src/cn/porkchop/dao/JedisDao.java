package cn.porkchop.dao;

public interface JedisDao {
    /**
     * 查询类型的缓存
     * @return null表示为空
     * @author porkchop
     * @date 2017/9/24 13:16
     */
    String findAllCategoriesJson();
    /**
     * 把类别的json放到redis中
     * @author porkchop
     * @date 2017/10/2 18:58
     */
    void insertAllCategoriesJson(String categoriesJson);
    /**
     * category表发生改变, 删除类别json
     * @author porkchop
     * @date 2017/10/2 18:59
     */
    void delCategoryJson();
}
