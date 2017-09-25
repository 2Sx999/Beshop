package cn.porkchop.dao.impl;

import cn.porkchop.dao.CategoryDao;
import cn.porkchop.domain.Category;
import cn.porkchop.util.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {
    /**
     * @description  获得所有的商品类别
     * @author porkchop
     * @date 2017/9/24 11:47
     */
    @Override
    public List<Category> findAllCategories() throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from category";
        List<Category> list = queryRunner.query(sql, new BeanListHandler<Category>(Category.class));
        return list;
    }

    @Override
    public Category findAllCategoryById(String cid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from category where cid = ?";
        return queryRunner.query(sql, new BeanHandler<Category>(Category.class),cid);

    }
}
