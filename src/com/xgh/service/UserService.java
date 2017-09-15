package com.xgh.service;
import com.nxy.model.User;
import com.xgh.service.ConnectionGenerator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
            e.printStackTrace();
            return false;
        }
        if(i==0)
        {
            return false;
        }
        return true;
    }

    public static boolean Login(User user){
        Connection conn = ConnectionGenerator.GetConnetct();
        int col=0;
        String sql = "select count(*) from 94train.user where PhoneNum = ? and Password = ?";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1, user.getPhoneNum());
            pstmt.setString(2,user.getPassword());
            ResultSet rs = pstmt.executeQuery();
            //这才是开头...
            rs.next();
            col = rs.getInt("count(*)");
            System.out.println(col);
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(col==1)
            return true;
        return false;
    }
}
