package com.nxy.model;

import java.sql.Time;

// 两个站点间某辆列车数据
public class TrainTable {
    private String StrainID;
    private String StartStation;
    private String EndStation;
    private Time DepartureTime;
    private Time ArrivalTime;
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
    }

    public Time getArrivalTime() {
        return ArrivalTime;
    }

    public void setArrivalTime(Time arrivalTime) {
        ArrivalTime = arrivalTime;
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
}
