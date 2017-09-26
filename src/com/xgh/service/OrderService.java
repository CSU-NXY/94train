package com.xgh.service;

import com.nxy.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderService {

    public static List<Order> FindOrder(int UserID)
    {
        List<Order> list = new ArrayList<>();


        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "SELECT * FROM 94train.order WHERE UserID = ?";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setInt(1,UserID);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                Order temp = new Order();
                temp.setOrderID(rs.getInt("OrderID"));
                temp.setUserID(rs.getInt("UserID"));
                temp.setTrainID(rs.getString("TrainID"));
                temp.setStartStation(rs.getString("StartStation"));
                temp.setEndStation(rs.getString("EndStation"));
                temp.setDepartureTime(rs.getTime("DepartureTime"));
                temp.setArrivalTime(rs.getTime("ArrivalTime"));
                temp.setType(rs.getInt("Type"));
                temp.setStatus(rs.getInt("Status"));
                temp.setPrice(rs.getDouble("Price"));
                temp.setOrderDate(rs.getDate("OrderDate"));
                list.add(temp);
            }
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean ChangeOrder(Order order)
    {
        int i =0;
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "UPDATE 94train.order SET Status = ? \n" +
                "WHERE 94train.order.OrderID = ?";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setInt(1,order.getStatus());
            pstmt.setInt(2,order.getOrderID());
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(i==1)
            return true;
        return false;
    }

    public static boolean ChangeOrder(int orderID,int status){
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "update 94train.order set Status = ? where 94train.order.OrderID = ?";
        PreparedStatement pstmt;
        int i = 0;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setInt(1,status);
            pstmt.setInt(2,orderID);
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(i==1)
            return true;
        return false;
    }

    public static boolean DeleteOrder(int orderID){
        int count = 0;
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "delete from 94train.order where 94train.order.OrderId = ?";
        PreparedStatement pstmt;

        try{
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1,orderID);
            count = pstmt.executeUpdate();

        }catch (Exception e){
            throw new RuntimeException("emmmm");
        }

        if(count == 1)
            return true;

        return false;
    }
}
