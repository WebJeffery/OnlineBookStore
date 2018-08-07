package com.bookStore.goods.Utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;


public class JdbcUtils {
    private static DataSource ds = new ComboPooledDataSource();//ComboPooledDataSource类使用的是c3p0数据源
    private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
    public static DataSource getDataSource() {
        return ds;
    }

    //dao使用本方法来获取连接
    public static Connection getConnection() throws SQLException {
        Connection con = tl.get();//获取当前线程的事务连接
        if(con != null) return con;
        return ds.getConnection();
    }

    // 开启事务
    public static void beginTransaction() throws SQLException {
        Connection con = tl.get();//获取当前线程的事务连接
        if(con != null) throw new SQLException("已经开启了事务，不能重复开启！");
        con = ds.getConnection();//给con赋值，表示开启了事务
        con.setAutoCommit(false);//设置为手动提交
        tl.set(con);//把当前事务连接放到tl中
    }

    //提交事务
    public static void commitTransaction() throws SQLException {
        Connection con = tl.get();//获取当前线程的事务连接
        if(con == null) throw new SQLException("没有事务不能提交！");
        con.commit();//提交事务
        con.close();//关闭连接
        con = null;//表示事务结束！
        tl.remove();
    }

    //回滚事务
    public static void rollbackTransaction() throws SQLException {
        Connection con = tl.get();//获取当前线程的事务连接
        if(con == null) throw new SQLException("没有事务不能回滚！");
        con.rollback();
        con.close();
        con = null;
        tl.remove();
    }

    // 释放Connection
    public static void releaseConnection(Connection connection) throws SQLException {
        Connection con = tl.get();//获取当前线程的事务连接
        if(connection != con) {//如果参数连接，与当前事务连接不同，说明这个连接不是当前事务，可以关闭！
            if(connection != null &&!connection.isClosed()) {//如果参数连接没有关闭，关闭之！
                connection.close();
            }
        }
    }
}
