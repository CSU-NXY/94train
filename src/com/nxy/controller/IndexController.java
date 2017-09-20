package com.nxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/index", method = RequestMethod.GET)
public class IndexController {
    @RequestMapping("/viewIndex.do")
    public String viewIndex() {
        return "Index";
    }
}
