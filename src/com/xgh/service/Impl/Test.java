package com.xgh.service.Impl;

import com.nxy.model.TrainTable;

import java.sql.SQLException;
import java.util.List;

public class Test {
    public static void main(String args[]) throws SQLException, ClassNotFoundException {
        TicketServiceImpl ticketService = new TicketServiceImpl();

        List<TrainTable> temp = ticketService.SearchByStation("温州南","长沙南");
        List<TrainTable> temp2 = ticketService.SearchByID("G2306");
    }
}
