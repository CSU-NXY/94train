package com.nxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping(value = "/registerAndLogin", method = RequestMethod.GET)
public class RegisterAndLoginController {

    @RequestMapping(value = "/viewRegister.do", method = RequestMethod.GET)
    public String viewRegister(ModelMap model) {
        return "Register";
    }

    @RequestMapping(value = "/viewLogin.do", method = RequestMethod.GET)
    public String viewLogin(ModelMap model) {
        return "Login";
    }
}
