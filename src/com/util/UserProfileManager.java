package com.util;

import com.po.UserProfile;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by zsq on 26/3/15.
 */
public class UserProfileManager {
    public static UserProfile getProfile(String email){
        UserProfile profile=new UserProfile();
        Connection conn;
        String tableName = "mt_user";
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try{
            conn=DbHelper.getConnection(tableName);
            String sql="SELECT * FROM users WHERE email='"+email+"'";
            stmt=conn.prepareStatement(sql);
            rs=stmt.executeQuery();
            if (rs.next()){
                profile.setName(rs.getString("userName"));
                profile.setGender(rs.getString("gender"));
                profile.setBirthday(rs.getDate("birthday"));
                profile.setRegisterDate(rs.getDate("regdate"));
                return profile;
            }else {
                return null;
            }
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
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

    public static boolean setProfile(String email, UserProfile profile){
        Connection conn;
        String tableName = "mt_user";
        PreparedStatement stmt=null;
        int i=0;
        try{
            conn=DbHelper.getConnection(tableName);
            String sql= "UPDATE users SET userName=?,gender=?,birthday=? WHERE email=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,profile.getName());
            stmt.setString(2,profile.getGender());
            stmt.setDate(3, (Date) profile.getBirthday());
            stmt.setString(4,email);
            i=stmt.executeUpdate();
            if (i!=0){
                return true;
            }else {
                return false;
            }
        }catch (Exception ex){
            ex.printStackTrace();
            return false;
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
