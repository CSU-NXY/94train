package com.nxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/protocol")
public class ProtocolController {
    @RequestMapping("/viewProtocol")
    public String viewProtocol() {
        return "Protocol";
    }
}
