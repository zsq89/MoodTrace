package com.util;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.po.*;

/**
 * Created by zsq on 24/3/15.
 * User login and registration
 */
public class UserLogSys {
    //login verification
    public static boolean Login(User user){
        Connection conn;
        String tableName = "mt_user";
        PreparedStatement stmt=null;
        ResultSet rs=null;
        String email = user.getEmail();
        String password = user.getPassword();
        try{
            conn=DbHelper.getConnection(tableName);
            String sql="SELECT * FROM users WHERE email='"+email+"' AND password = '"+password+"'";
            stmt=conn.prepareStatement(sql);
            rs=stmt.executeQuery();
            if (rs.next()){
                return true;
            }else {
                return false;
            }
        }catch (Exception ex){
            ex.printStackTrace();
            return false;
        }finally {
            try{
                if (rs!=null){
                    rs.close();
                    rs=null;
                }
            }catch (Exception ex){
                ex.printStackTrace();
            }

            try{
                if (stmt!=null){
                    stmt.close();
                    stmt=null;
                }
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
    }

    //registration
    public static int Register(User newUser, UserProfile profile){
        Connection conn;
        String tableName = "mt_user";
        PreparedStatement stmt=null;
        int i=0;
        String email = newUser.getEmail();
        String password = newUser.getPassword();
        String name = profile.getName();
        String gender = profile.getGender();
        Date birthday = profile.getBirthday();
        try{
            conn=DbHelper.getConnection(tableName);
            String sql="INSERT INTO users(email,password,regdate,userName,gender,birthday) VALUES (?,?,CURRENT_DATE ,?,?,?)";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,email);
            stmt.setString(2,password);
            stmt.setString(3, name);
            stmt.setString(4, gender);
            stmt.setDate(5,birthday);
            i=stmt.executeUpdate();
            return i;
        }catch (Exception ex){
            ex.printStackTrace();
            return 0;
        }finally {

            try{
                if (stmt!=null){
                    stmt.close();
                    stmt=null;
                }
            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
    }
}
