package com.util;

import com.po.*;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by zsq on 29/3/15.
 */
public class MoodManager {
    public static boolean moodTrace(String email, MoodCard card){
        Connection conn;
        String dbName = "mt_user";
        PreparedStatement stmt=null;
        ResultSet rs=null;
        int i=0;
        try{
            conn=DbHelper.getConnection(dbName);
            String sql= "SELECT id FROM users WHERE email=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,email);
            rs=stmt.executeQuery();
            if (rs.next()){
                int id = rs.getInt(1);
                int[] mood=card.getMood();
                String newSql="INSERT INTO moodData(recordDate,recordTime,p_ind,h_ind,s_ind,a_ind,remark,user_id) VALUES " +
                        "(CURRENT_DATE,CURRENT_TIME,?,?,?,?,?,?)";
                stmt=conn.prepareStatement(newSql);
                int j;
                for(j=0;j<mood.length;j++){
                    stmt.setInt(j+1,mood[j]);
                }
                stmt.setString(j + 1, card.getRemark());
                stmt.setInt(j+2,id);
                i=stmt.executeUpdate();
                if (i!=0)
                    return true;
                else
                    return false;
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

    public static ArrayList<MoodCard> getMoodCard(String email, Date startDate, Date endDate){
        ArrayList<MoodCard> list=new ArrayList<MoodCard>();
        Connection conn;
        String dbName = "mt_user";
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try{
            conn=DbHelper.getConnection(dbName);
            String sql= "SELECT m.* FROM moodData AS m " +
                        "LEFT JOIN users AS u " +
                        "ON u.id = m.user_id " +
                        "WHERE u.email=? AND m.recordDate BETWEEN ? AND ?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1,email);
            stmt.setDate(2,startDate);
            stmt.setDate(3,endDate);
            rs=stmt.executeQuery();
            while (rs.next()){
                MoodCard card=new MoodCard();
                int[] mood=new int[4];
                mood[0]=rs.getInt("p_ind");
                mood[1]=rs.getInt("h_ind");
                mood[2]=rs.getInt("s_ind");
                mood[3]=rs.getInt("a_ind");
                card.setMood(mood);
                card.setRecordDate(rs.getDate("recordDate"));
                card.setRecordTime(rs.getTime("recordTime"));
                card.setRemark(rs.getString("remark"));
                list.add(card);
            }
            return list;
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

    public static MoodCard getMoodCard(String email){
        MoodCard card =new MoodCard();
        Connection conn;
        String dbName = "mt_user";
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try{
            conn=DbHelper.getConnection(dbName);
            String sql= "SELECT m.* FROM moodData AS m " +
                    "LEFT JOIN users AS u " +
                    "ON u.id = m.user_id " +
                    "WHERE u.email=? " +
                    "ORDER BY m.recordDate DESC, m.recordTime DESC " +
                    "limit 1";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs=stmt.executeQuery();
            if (rs.next()){
                int[] mood=new int[4];
                mood[0]=rs.getInt("p_ind");
                mood[1]=rs.getInt("h_ind");
                mood[2]=rs.getInt("s_ind");
                mood[3]=rs.getInt("a_ind");
                card.setMood(mood);
                card.setRecordDate(rs.getDate("recordDate"));
                card.setRecordTime(rs.getTime("recordTime"));
                card.setRemark(rs.getString("remark"));
                return card;
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

    public static int countRecord(String email){
        Connection conn;
        String dbName = "mt_user";
        PreparedStatement stmt=null;
        ResultSet rs=null;
        try{
            conn=DbHelper.getConnection(dbName);
            String sql= "SELECT COUNT(m_id) AS recordNumber FROM moodData AS m " +
                    "LEFT JOIN users AS u " +
                    "ON u.id = m.user_id " +
                    "WHERE u.email=?";
            stmt=conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs=stmt.executeQuery();
            int count=0;
            if (rs.next()){
                count=rs.getInt("recordNumber");
            }
            return count;
        }catch (Exception ex){
            ex.printStackTrace();
            return 0;
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

}
