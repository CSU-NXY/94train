package com.xgh.service;

import com.nxy.model.Order;
import com.nxy.model.TrainTable;
import com.xgh.service.*;

import javax.print.DocFlavor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//TRY-CATCH 和 各种CLOSE() 有问题!!!!!!!!!!!!
public class TicketService {
    public static List<TrainTable> SearchByID(String TrainID) throws SQLException, ClassNotFoundException {
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
                temp.setRepatureTime(rs.getTime("DepartureTime"));
                temp.setCountLeft(rs.getInt("Count"));
                temp.setPrice(rs.getDouble("Price"));
                temp.setStartStation(GetStationNameByID(rs.getInt("StationID")));
                list.add(temp);
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    public static List<TrainTable> SearchByStation(String StartStation,String EndStation) throws SQLException, ClassNotFoundException {
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
                temp.setEndStartion(EndStation);
                temp.setArrivalTime(rs.getTime("e.ArrivalTime"));
                temp.setRepatureTime(rs.getTime("s.DepartureTime"));

                //大工程~~~~
                CalSumAndTicketCount(conn,temp,rs.getInt("s.Index"),rs.getInt("e.Index"),temp.getStrainID());

                list.add(temp);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            conn.close();
        }
        return list;

    }


    private static void CalSumAndTicketCount(Connection conn,TrainTable temp,int s,int e,String TrainID) throws SQLException, ClassNotFoundException {
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
        }
        catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    private static String GetStationNameByID(int id) throws SQLException {
        String name = null;
        String sql = "SELECT StationName\n" +
                "FROM 94train.station\n" +
                "where StationID = ?";
        PreparedStatement pstmt;

        try {
            Connection conn = ConnectionGenerator.GetConnetct();
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            name = rs.getString(1);
            pstmt.close();
            rs.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return name;
    }

    private static int GetStationIDByName(String name) throws SQLException, ClassNotFoundException {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "SELECT StationID"+
        "FROM 94train.station"+
        "where StationName = ?";
        PreparedStatement pstmt;
        int id = 0;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            id = rs.getInt(1);
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return  id;
    }

    public  static boolean BuyTicket(int UserID,TrainTable trainTable,int count)
    {
        Order order = new Order();
        order.setUserID(UserID);
        order.setTrainID(trainTable.getStrainID());
        order.setStartStation(trainTable.getStartStation());
        order.setEndStation(trainTable.getEndStartion());
        order.setDepartureTime(trainTable.getRepatureTime());
        order.setArrivalTime(trainTable.getArrivalTime());
        order.setStatus(0);
        order.setType(0);
        order.setPrice(trainTable.getPrice());
        return false;
    }

    public static List<Order> FindOrder(int UserID)
    {
        List<Order> list = new ArrayList<>();

        return list;
    }

}

