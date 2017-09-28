package cn.porkchop.util;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @author porkchop
 * @description 数据源工具类
 * @date 2017/9/20 23:11
 */
public class DataSourceUtils {
    private static DataSource dataSource = new ComboPooledDataSource();
    private static ThreadLocal<Connection> threadLocal = new ThreadLocal<Connection>();

    /**
     * @description 获取数据源
     * @author porkchop
     * @date 2017/9/20 23:18
     */
    public static DataSource getDataSource() {
        return dataSource;
    }

    /**
     * @description  获得连接,并且判断是否绑定在threadlocal中
     * @author porkchop
     * @date 2017/9/21 10:21
     */
    public static Connection getConnection() throws SQLException {
        Connection connection = threadLocal.get();
        if (connection == null) {
            connection = getDataSource().getConnection();
            threadLocal.set(connection);
        }
        return connection;
    }
    /**
     * @description  开启事务
     * @author porkchop
     * @date 2017/9/21 10:20
     */
    public static void startTransanction() throws SQLException {
        Connection connection = getConnection();
        if (connection != null) {
            connection.setAutoCommit(false);
        }
    }
    /**
     * @description  回滚
     * @author porkchop
     * @date 2017/9/21 10:21
     */
    public static void rollback() throws SQLException {
        Connection connection = getConnection();
        if (connection != null) {
            connection.rollback();
        }
    }
    /**
     * @description  提交事务,关闭连接,从threadlocal中删除绑定的connecttion
     * @author porkchop
     * @date 2017/9/21 10:19
     */
    public static void commit() throws SQLException {
        Connection connection = getConnection();
        if(connection!=null){
            connection.commit();
        }

    }

    public static  void closeConnection() throws SQLException {
        Connection connection = getConnection();
        if(connection!=null){

            connection.close();
            threadLocal.remove();
        }
    }
}
