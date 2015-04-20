package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by zsq on 23/3/15.
 */
public class DbHelper {
    private static final String driver="com.mysql.jdbc.Driver";
    private static final String url="jdbc:mysql://localhost:3306/";
    private static final String username="root";
    private static final String password="";

    private static Connection conn=null;

    static {
        try{
            Class.forName(driver);
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public static Connection getConnection(String tableName){
        try {
            if (conn == null) {
                String newUrl = url + tableName;
                conn = DriverManager.getConnection(newUrl, username, password);
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args){
        try{
            String tableName = "mt_user";
            Connection conn=DbHelper.getConnection(tableName);
            if (conn!=null){
                System.out.println("Database connection successful.");
            }else {
                System.out.println("Database connection failed.");
            }
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
}
