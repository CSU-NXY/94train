package com.nxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.nxy.model.*;



@Controller
@RequestMapping(value = "/hello", method = RequestMethod.GET)
public class RegisterAndLoginController {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String printHello(ModelMap model) {
        model.addAttribute("msg", "Spring MVC Hello World");
        // model.addAttribute("name", "nxy");
        String name = (String)model.get("name");
        model.addAttribute("name", name);
        return "login";
    }

    @RequestMapping("/haha.do")
    public String regiset(ModelMap model, @ModelAttribute("form") user u, @RequestParam("name")String name) {
        model.addAttribute("name", u.getName());

        return "a/aa";
    }

    @RequestMapping("/haha1.do")
    public String regiset1(ModelMap model, @ModelAttribute("form") user u) {
        model.addAttribute("name", u.getName());
        return "a/aa";
    }
}
