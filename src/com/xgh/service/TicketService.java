package com.xgh.service;

import com.nxy.model.*;
import com.xgh.service.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//TRY-CATCH 和 各种CLOSE() 有问题!!!!!!!!!!!!
public class TicketService {
    public static List<TrainTable> SearchByID(String TrainID){
        List<TrainTable> list = new ArrayList<>();
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "Select * \n" +
                "From 94train.section\n" +
                "where section.TrainID = ?\n" +
                "order by section.Index";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, TrainID);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                TrainTable temp = new TrainTable();
                temp.setStrainID(rs.getString("TrainID"));
                temp.setArrivalTime(rs.getTime("ArrivalTime"));
                temp.setDepartureTime(rs.getTime("DepartureTime"));
                temp.setCountLeft(rs.getInt("Count"));
                temp.setPrice(rs.getDouble("Price"));
                temp.setStartStation(GetStationNameByID(rs.getInt("StationID")));
                //终点站为空
                list.add(temp);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    public static List<TrainTable> SearchByStation(String StartStation,String EndStation){
        //返回的结果
        List<TrainTable> list = new ArrayList<>() ;

        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "SELECT * \n" +
                "FROM (SELECT *\n" +
                "from 94train.section \n" +
                "where section.StationID =(SELECT StationID FROM 94train.station where 94train.station.StationName=?)) as s  join (SELECT *\n" +
                "from 94train.section \n" +
                "where section.StationID =(SELECT StationID FROM 94train.station where 94train.station.StationName=?)) as e on s.TrainID = e.TrainID\n" +
                "where s.index < e.index";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, StartStation);
            pstmt.setString(2, EndStation);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                TrainTable temp = new TrainTable();
                temp.setStrainID(rs.getString("s.TrainID"));
                temp.setStartStation(StartStation);
                temp.setEndStation(EndStation);
                temp.setArrivalTime(rs.getTime("e.ArrivalTime"));
                temp.setDepartureTime(rs.getTime("s.DepartureTime"));
                //大工程~~~~?
                CalSumAndTicketCount(temp,rs.getInt("s.Index"),rs.getInt("e.Index"),temp.getStrainID());
                list.add(temp);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }


    private static void CalSumAndTicketCount(TrainTable temp,int s,int e,String TrainID){
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "SELECT sum(Price),min(count)\n" +
                "From 94train.section\n" +
                "where 94train.section.Index>=? and 94train.section.Index<? and section.TrainID = ?";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, s);
            pstmt.setInt(2, e);
            pstmt.setString(3, TrainID);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            temp.setPrice(rs.getDouble(1));
            temp.setCountLeft(rs.getInt(2));
            pstmt.close();
            rs.close();
            conn.close();
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private static String GetStationNameByID(int id){
        Connection conn = ConnectionGenerator.GetConnetct();
        String name = null;
        String sql = "SELECT StationName\n" +
                "FROM 94train.station\n" +
                "where StationID = ?";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            name = rs.getString(1);
            pstmt.close();
            rs.close();
            conn.close();
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        return name;
    }

    public  static boolean BuyTicket(int UserID,TrainTable trainTable)
    {
        Order order = new Order();
        order.setUserID(UserID);
        order.setTrainID(trainTable.getStrainID());
        order.setStartStation(trainTable.getStartStation());
        order.setEndStation(trainTable.getEndStation());
        order.setDepartureTime(trainTable.getDepartureTime());
        order.setArrivalTime(trainTable.getArrivalTime());
        order.setStatus(0);
        order.setType(0);
        order.setPrice(trainTable.getPrice());
        int i = 0;
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "INSERT INTO `94train`.`order` (`UserID`, `TrainID`, `StartStation`, `EndStation`,`DepartureTime`,`ArrivalTime`,`Type`, `Price`, `Status`,`OrderDate`) "+
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? , ?);";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, order.getUserID());
            pstmt.setString(2, order.getTrainID());
            pstmt.setString(3, order.getStartStation());
            pstmt.setString(4, order.getEndStation());
            pstmt.setTime(5, order.getDepartureTime());
            pstmt.setTime(6, order.getArrivalTime());
            pstmt.setInt(7,order.getType());
            pstmt.setDouble(8,order.getPrice());
            pstmt.setInt(9,order.getStatus());
            java.util.Date date=new java.util.Date();
            pstmt.setDate(10,new Date(date.getTime()));
            i = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }
        if(i==1)
            return true;
        return false;
    }

}
