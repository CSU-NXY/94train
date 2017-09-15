package com.xgh.service;

import com.nxy.model.TrainTable;
import com.nxy.model.User;

import java.sql.Connection;
import java.util.List;

public interface TicketService {
    public List<TrainTable> SearchByID(String TrainID);
    public List<TrainTable> SearchByStation(String StartStation,String EndStation);
}
