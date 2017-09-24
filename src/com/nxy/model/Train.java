package com.nxy.model;

public class Train {
    private String TrainID;
    private int Seats;
    private int StationCount;

    public String getTrainID() {
        return TrainID;
    }

    public void setTrainID(String trainID) {
        TrainID = trainID;
    }

    public int getSeats() {
        return Seats;
    }

    public void setSeats(int seats) {
        Seats = seats;
    }

    public int getStationCount() {
        return StationCount;
    }

    public void setStationCount(int stationCount) {
        StationCount = stationCount;
    }
}
