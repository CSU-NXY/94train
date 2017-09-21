package com.xgh.service;
import com.nxy.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserService {
    //
    public  static  boolean Register(User user){
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "INSERT INTO `94train`.`user` (`PhoneNum`, `Password`, `Name`, `ID`, `Email`) VALUES (?, ?, ?, ?, ?);";

        PreparedStatement pstmt=null;
        int i;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, user.getPhoneNum());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getID());
            pstmt.setString(5, user.getEmail());
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            throw new RuntimeException("surprise m****** f***");
        }
        if(i==0)
        {
            return false;
        }
        return true;
    }

    public static int Login(User user){
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "select * from 94train.user where PhoneNum = ? and Password = ?";
        PreparedStatement pstmt;
        int id=-1;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1, user.getPhoneNum());
            pstmt.setString(2,user.getPassword());
            ResultSet rs = pstmt.executeQuery();
            //这才是开头...
            while(rs.next())
            {
                id = rs.getInt("UserID");
            }
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        user.setUserID(id);
        return id;
    }

    public static boolean Update(User user)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "UPDATE `94train`.`user` \n" +
                "SET `PhoneNum`=?, `Password`=?, `Name`=?, `ID`=?, `Email`=? \n" +
                "WHERE `UserID`='1';";

        PreparedStatement pstmt=null;
        int i;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, user.getPhoneNum());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getID());
            pstmt.setString(5, user.getEmail());
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        if(i==0)
        {
            return false;
        }
        return true;
    }
}
