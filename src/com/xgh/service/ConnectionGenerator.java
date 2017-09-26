package com.xgh.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionGenerator {
    private final  static String driver = "com.mysql.jdbc.Driver";
    //URL指向要访问的数据库名mydata
    private final static String url = "jdbc:mysql://localhost:3306/94train";
    //MySQL配置时的用户名
    private final static String user = "root";
    //MySQL配置时的密码
    //不同自己改!!!
    private static String password = "1234";

    public static Connection GetConnetct(){
        //加载驱动程序
        Connection connection = null;
        try {
            Class.forName(driver);
            //1.getConnection()方法，连接MySQL数据库！！
            connection = DriverManager.getConnection(url, user, password);
            return connection;

        }catch (Exception e){
            e.printStackTrace();
        }

        return connection;
    }


}
