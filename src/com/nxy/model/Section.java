package com.nxy.model;

import java.sql.Time;

public class Section {
    private int SectionID;
    private String TrainID;
    private int StationID;
    private int Index;
    private int Count;
    private Time ArrivalTime;
    private Time DepatureTime;
    private Double Price;

    public int getSectionID() {
        return SectionID;
    }

    public void setSectionID(int sectionID) {
        SectionID = sectionID;
    }

    public String getTrainID() {
        return TrainID;
    }

    public void setTrainID(String trainID) {
        TrainID = trainID;
    }

    public int getStationID() {
        return StationID;
    }

    public void setStationID(int stationID) {
        StationID = stationID;
    }

    public int getIndex() {
        return Index;
    }

    public void setIndex(int index) {
        Index = index;
    }

    public int getCount() {
        return Count;
    }

    public void setCount(int count) {
        Count = count;
    }

    public Time getArrivalTime() {
        return ArrivalTime;
    }

    public void setArrivalTime(Time arrivalTime) {
        ArrivalTime = arrivalTime;
    }

    public Time getDepatureTime() {
        return DepatureTime;
    }

    public void setDepatureTime(Time depatureTime) {
        DepatureTime = depatureTime;
    }

    public Double getPrice() {
        return Price;
    }

    public void setPrice(Double price) {
        Price = price;
    }
}
