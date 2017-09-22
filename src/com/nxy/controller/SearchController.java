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
     * ！！！ 重要 @ResponseBody 会把类属性的第一个字母变成小写 ！！！
     */
    @ResponseBody
    @RequestMapping(value = "/searchTrains.do", method = RequestMethod.GET)
    public List<TrainTable> searchByTwoStations(@RequestParam("departure")String departure, @RequestParam("destination")String destination) {
        if (departure.isEmpty() || destination.isEmpty())
            return null;
        return TicketService.SearchByStation(departure, destination);
    }
}
