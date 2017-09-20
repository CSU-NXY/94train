package com.nxy.model;

import java.sql.Time;

// 两个站点间某辆列车数据
public class TrainTable {
    private String StrainID;
    private String StartStation;
    private String EndStartion;
    private Time RepatureTime;
    private Time ArrivalTime;
    private int CountLeft;
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

    public String getEndStartion() {
        return EndStartion;
    }

    public void setEndStartion(String endStartion) {
        EndStartion = endStartion;
    }

    public Time getRepatureTime() {
        return RepatureTime;
    }

    public void setRepatureTime(Time repatureTime) {
        RepatureTime = repatureTime;
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
