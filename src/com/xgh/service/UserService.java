package com.xgh.service;
import com.nxy.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    //
    public  static  boolean Register(User user)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "INSERT INTO `94train`.`user` (`PhoneNum`, `Password`, `Name`, `ID`, `Email`) VALUES (?, ?, ?, ?, ?);";

        PreparedStatement pstmt=null;
        int i = 0;
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
        }
        if(i==0)
        {
            return false;
        }
        return true;
    }

    public static int Login(User user)
    {
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
                "SET `PhoneNum`=?,`Name`=?, `ID`=?, `Email`=? \n" +
                "WHERE `UserID`=?;";

        PreparedStatement pstmt=null;
        int i;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, user.getPhoneNum());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getID());
            pstmt.setString(5, user.getEmail());
            pstmt.setInt(6,user.getUserID());
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

    public static boolean ChangePassword(int UserID,String password,String oldPassword)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "UPDATE `94train`.`user` \n" +
                "SET `Password`=?" +
                "WHERE `UserID`=? and `Password` =?;";

        PreparedStatement pstmt=null;
        int i;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, password);
            pstmt.setInt(2,UserID);
            pstmt.setString(3,oldPassword);
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

    public static boolean ChangeEmail(int UserID,String email)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "UPDATE `94train`.`user` \n" +
                "SET `Email`=?" +
                "WHERE `UserID`=?;";
        PreparedStatement pstmt=null;
        int i;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setInt(2,UserID);
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

    public static boolean IsContainPhoneNum(String PhoneNum)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "select count(*) as count from 94train.user where PhoneNum = ?";

        PreparedStatement pstmt=null;
        int i = -1;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, PhoneNum);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                i = rs.getInt("count");
            }
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

    public static boolean IsContainEmail(String Emial)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "select count(*) as count from 94train.user where Email = ?";

        PreparedStatement pstmt=null;
        int i = -1;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, Emial);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                i = rs.getInt("count");
            }
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

    public static User GetUserByUserID(int UserID)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "select UserID,PhoneNum,Name,ID,Email\n" +
                "from 94train.user\n" +
                "where user.UserID = ?";
        PreparedStatement pstmt;
        User user = new User();
        user.setUserID(UserID);
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setInt(1, UserID);
            ResultSet rs = pstmt.executeQuery();
            //这才是开头...
            if(rs.next())
            {
                user.setPhoneNum(rs.getString("PhoneNum"));
                user.setName(rs.getString("Name"));
                user.setID(rs.getString("ID"));
                user.setEmail(rs.getString("Email"));
            }
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static List<String> GetUserPhones(){
        List<String> phones = new ArrayList();
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "select PhoneNum from 94train.user";
        PreparedStatement pstmt = null;
        try{
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()){
                phones.add(rs.getString("PhoneNum"));
            }
            pstmt.close();
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return phones;
    }
}
