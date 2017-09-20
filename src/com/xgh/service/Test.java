package com.xgh.service;

import com.nxy.model.TrainTable;
import com.nxy.model.User;
import  com.xgh.service.*;
import java.sql.SQLException;
import java.util.List;

public class Test {
    public static void main(String args[]) throws SQLException, ClassNotFoundException {
        List<TrainTable> temp = TicketService.SearchByStation("金华","长沙南");
//        List<TrainTable> temp2 = TicketService.SearchByID("G2306");
//        User user = new User();
//        user.setPhoneNum("Ezio");
//        user.setPassword("1234");
//        int o = UserService.Login(user);
//        //boolean result = UserService.Register(user);
//        boolean result2 = TicketService.BuyTicket(user.getUserID(),temp.get(0));
    }
}
