package com.nxy.controller;

import com.nxy.model.TrainTable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.sql.Time;
import java.text.SimpleDateFormat;

@Controller
@SessionAttributes({"strainID","startStation","endStation","departureTime","arrivalTime","timeSpent","countLeft","price", "trainTable"})

@RequestMapping(value = "/buyTickets", method = RequestMethod.GET)
public class BuyTicketsController {

    @RequestMapping("/viewBuyTickets.do")
    public String viewBuyTickets() {
        return "BuyTickets";
    }

    @RequestMapping(value = "/buyTickets.do")
    public String BuyTickets(@RequestParam("strainID") String strainID, @RequestParam("startStation") String startStation,
                           @RequestParam("endStation") String endStation, @RequestParam("departureTime") String departureTime,
                           @RequestParam("arrivalTime") String arrivalTime, @RequestParam("timeSpent") String timeSpent,
                           @RequestParam("countLeft") String countLeft, @RequestParam("price") String price,
                           ModelMap model) {
        model.addAttribute("strainID", strainID);
        model.addAttribute("startStation", startStation);
        model.addAttribute("endStation", endStation);
        model.addAttribute("departureTime", departureTime);
        model.addAttribute("arrivalTime", arrivalTime);
        model.addAttribute("timeSpent", timeSpent);
        model.addAttribute("countLeft", countLeft);
        model.addAttribute("price", price);

        SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
        TrainTable trainTable = new TrainTable();
        try {
            trainTable.setArrivalTime(new Time(sdf.parse(arrivalTime).getTime()));
            trainTable.setDepartureTime(new Time(sdf.parse(departureTime).getTime()));
            trainTable.setCountLeft(Integer.valueOf(countLeft));
            trainTable.setPrice(Integer.valueOf(price));
            trainTable.setStrainID(strainID);
            trainTable.setStartStation(startStation);
            trainTable.setEndStation(endStation);
            model.addAttribute("trainTable", trainTable);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "BuyTickets";
    }


}
