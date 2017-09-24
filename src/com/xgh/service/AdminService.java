package com.xgh.service;
import com.nxy.model.*;
import com.sun.org.apache.regexp.internal.RE;
import net.sf.json.JSON;

import java.rmi.server.ExportException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class AdminService {
    public static List<Train> GetTrainList()
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        List<Train> ls = new ArrayList<>();
        String sql = "SELECT * FROM 94train.train;";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                Train temp = new Train();
                temp.setTrainID(rs.getString("TrainID"));
                temp.setStationCount(rs.getInt("StationCount"));
                temp.setSeats(rs.getInt("Seats"));
                ls.add(temp);
            }
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;
    }

    public  static Boolean DeleteTrain(String TrainID)
    {
        int i =0;
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "DELETE FROM `94train`.`train` WHERE `TrainID`=?;\n";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1,TrainID);
            i= pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(i==0)
            return false;
        return true;
    }

    public static Boolean AddTrain(Train train)
    {
        int rs = 0;
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "INSERT INTO `94train`.`train` (`TrainID`, `Seats`, `StationCount`) VALUES (?, ?, ?);\n";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1,train.getTrainID());
            pstmt.setInt(2,train.getSeats());
            pstmt.setInt(3,train.getStationCount());
            rs = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(rs==1)
            return true;
        return false;
    }

    public static Boolean AddSections(List<TrainTable> ls,String TrainID,int seats)
    {
        CleanSections(TrainID);
        if(!UpdateTrain(TrainID,ls.size(),seats))
            return false;
        for(int i = 0;i<ls.size();i++)
        {
            AddSection(ToSection(ls.get(i),i));
        }
        return true;
    }

    private static Boolean UpdateTrain(String TrainID,int count,int seats)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        PreparedStatement pstmt;
        String sql = "SELECT * FROM 94train.train where TrainID = ?;";
        String sql2 = "UPDATE `94train`.`train` SET `Seats`=?, `StationCount`=? WHERE `TrainID`=?;\n";
        String sql3 = "INSERT INTO `94train`.`train` (`TrainID`, `Seats`, `StationCount`) VALUES (?, ?, ?);\n";
        try{
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1,TrainID);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
            {
                rs.close();
                pstmt.close();
                pstmt = (PreparedStatement)conn.prepareStatement(sql2);
                pstmt.setInt(1,seats);
                pstmt.setInt(2,count);
                pstmt.setString(3,TrainID);
                pstmt.executeUpdate();
                pstmt.close();
            }
            else
            {
                rs.close();
                pstmt.close();
                pstmt = (PreparedStatement)conn.prepareStatement(sql3);
                pstmt.setString(1,TrainID);
                pstmt.setInt(2,seats);
                pstmt.setInt(3,count);
                pstmt.executeUpdate();
                pstmt.close();
            }
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean AddSection(Section sec)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "INSERT INTO `94train`.`section` (`TrainID`, `StationID`, `Index`, `Count`, `ArrivalTime`, `DepartureTime`, `Price`) VALUES (?, ?, ?, ?, ?, ?, ?);\n";
        int i = -1;
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1,sec.getTrainID());
            pstmt.setInt(2,sec.getStationID());
            pstmt.setInt(3,sec.getIndex());
            pstmt.setInt(4,sec.getCount());
            pstmt.setTime(5,sec.getArrivalTime());
            pstmt.setTime(6,sec.getDepatureTime());
            pstmt.setDouble(7,sec.getPrice());
            i= pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(i==1)
            return true;
        return false;
    }

    public static int GetStationID(String StationName)
    {
        int id =-1;
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "SELECT StationID FROM 94train.station where station.StationName = ?;";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1,StationName);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
                id = rs.getInt(1);
            else
            {
                id = CreateStation(StationName);
            }
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    private static int CreateStation(String StationName)
    {
        int id =-1;
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql = "INSERT INTO `94train`.`station` (`StationName`) VALUES (?)";
        String sql2 = "SELECT StationID FROM 94train.station where station.StationName = ?;";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1,StationName);
            id = pstmt.executeUpdate();
            pstmt = (PreparedStatement)conn.prepareStatement(sql2);
            pstmt.setString(1,StationName);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next())
                id = rs.getInt(1);
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    private static Section ToSection(TrainTable trainTable,int index)
    {
        Section temp = new Section();
        temp.setTrainID(trainTable.getStrainID());
        temp.setArrivalTime(trainTable.getArrivalTime());
        temp.setDepatureTime(trainTable.getDepartureTime());
        temp.setCount(trainTable.getCountLeft());
        temp.setIndex(index);
        temp.setPrice(trainTable.getPrice());
        temp.setStationID(GetStationID(trainTable.getStartStation()));
        return temp;
    }

    public static List<TrainTable> JsonObjectToTrainTable(JsonObject[] jsonObjects,String trainID)
    {
        List<TrainTable> ls = new ArrayList<>();
        TrainTable temp = null;
        for (int i = 0;i<jsonObjects.length;i++)
        {
            temp = new TrainTable();
            temp.setStrainID(trainID);
            temp.setStartStation(jsonObjects[i].Station);
            temp.setPrice(jsonObjects[i].Price);
            temp.setArrivalTime(strToTime(jsonObjects[i].ArrivalTime));
            temp.setDepartureTime(strToTime(jsonObjects[i].DepartureTime));
            temp.setCountLeft(jsonObjects[i].Count);
            ls.add(temp);
        }
        return  ls;
    }

    public static java.sql.Time strToTime(String strDate) {
        if(strDate=="")
            return null;
        String str = strDate;
        SimpleDateFormat format = new SimpleDateFormat("hh:mm:ss");
        java.util.Date d = null;
        try {
            d = format.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        java.sql.Time time = new java.sql.Time(d.getTime());
        return time.valueOf(str);
    }

    public static void CleanSections(String TrainID)
    {
        Connection conn = ConnectionGenerator.GetConnetct();
        String sql ="DELETE FROM `94train`.`section` WHERE `TrainID`=?;";
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement)conn.prepareStatement(sql);
            pstmt.setString(1,TrainID);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
