package com.nxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.nxy.model.*;



@Controller
@RequestMapping(value = "/registerAndLogin", method = RequestMethod.GET)
public class RegisterAndLoginController {

    @RequestMapping(value = "/viewLogin.do", method = RequestMethod.GET)
    public String printHello(ModelMap model) {
        return "login";
    }
}
