package com.nxy.controller;

import com.nxy.model.TrainTable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/search", method = RequestMethod.GET)
public class SearchController {
    @RequestMapping(value = "/viewSearch.do", method = RequestMethod.GET)
    public String viewSearch() {
        return "Search";
    }

    @RequestMapping(value = "/getTrainsByTwoStation.do", method = RequestMethod.GET)
    public List<TrainTable> getTrainsByTwoStation(String departure, String destination) {

    }
}
