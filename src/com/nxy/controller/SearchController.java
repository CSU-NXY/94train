package com.nxy.controller;

import com.nxy.model.TrainTable;
import com.xgh.service.TicketService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/search", method = RequestMethod.GET)
public class SearchController {

    /**
     * @param departure   出发地
     * @param destination 目的地
     * @author 聂欣雨
     * 储存出发地与目的地以供AJAX使用，并跳转到Search.jsp
     */

    @ResponseBody
    @RequestMapping(value = "/searchTrains.do", method = RequestMethod.GET)
    public List<TrainTable> searchByTwoStations(@RequestParam("departure")String departure, @RequestParam("destination")String destination) {
        if (departure.isEmpty() || destination.isEmpty())
            return null;
        return TicketService.SearchByStation(departure, destination);
    }
}
