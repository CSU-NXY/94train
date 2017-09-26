package com.nxy.model;

import java.sql.Date;
import java.sql.Time;

// 两个站点间某辆列车数据
public class TrainTable {
    private String StrainID;
    private String StartStation;
    private String EndStation;
    private Time DepartureTime;
    private Time ArrivalTime;
    private Time TimeSpent;
    private int CountLeft;  // 剩余票数
    private double price;

    public String getStrainID() {
        return StrainID;
    }

    public void setStrainID(String strainID) {
        StrainID = strainID;
    }

    public String getStartStation() {
        return StartStation;
    }

    public void setStartStation(String startStation) {
        StartStation = startStation;
    }

    public String getEndStation() {
        return EndStation;
    }

    public void setEndStation(String endStation) {
        EndStation = endStation;
    }

    public Time getDepartureTime() {
        return DepartureTime;
    }

    public void setDepartureTime(Time departureTime) {
        DepartureTime = departureTime;
        if (ArrivalTime != null&&DepartureTime!=null) {
            int arrivalHours = ArrivalTime.getHours();
            int arrivalMinutes = ArrivalTime.getMinutes();
            int arrivalSeconds = ArrivalTime.getSeconds();
            int departureHours = DepartureTime.getHours();
            int departureMinutes = DepartureTime.getMinutes();
            int departureSeconds = DepartureTime.getSeconds();
            TimeSpent = new Time(arrivalHours-departureHours, arrivalMinutes-departureMinutes, arrivalSeconds - departureSeconds);
        }
    }

    public Time getArrivalTime() {
        return ArrivalTime;
    }

    public void setArrivalTime(Time arrivalTime) {
        ArrivalTime = arrivalTime;
        if (DepartureTime != null)
            TimeSpent = new Time(ArrivalTime.getTime() - DepartureTime.getTime());
    }

    public int getCountLeft() {
        return CountLeft;
    }

    public void setCountLeft(int countLeft) {
        CountLeft = countLeft;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Time getTimeSpent() {
        return TimeSpent;
    }
}
