package com.nxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/search", method = RequestMethod.GET)
public class SearchController {
    @RequestMapping(value = "/viewSearch.do", method = RequestMethod.GET)
    public String viewSearch() {
        return "Search";
    }
}
