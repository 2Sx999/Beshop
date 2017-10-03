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

    @Override
    public List<Category> findAllCategories() throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from category";
        List<Category> list = queryRunner.query(sql, new BeanListHandler<Category>(Category.class));
        return list;
    }

    @Override
    public Category findCategoryById(String cid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from category where cid = ?";
        return queryRunner.query(sql, new BeanHandler<Category>(Category.class),cid);

    }

    @Override
    public int updateCategoryById(Category category) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update category set cname=? where cid=?";
        return queryRunner.update(sql, category.getCname(), category.getCid());
    }

    @Override
    public int delCategoryById(String cid) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from category where cid = ?";
        return queryRunner.update(sql, cid);
    }

    @Override
    public int addCategory(Category category) throws SQLException {
        QueryRunner queryRunner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into category values(?,?)";
        return queryRunner.update(sql, category.getCid(),category.getCname());
    }
}
