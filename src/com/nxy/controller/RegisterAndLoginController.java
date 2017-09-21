package com.nxy.controller;

import com.nxy.model.User;
import com.xgh.service.UserService;
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
    public String viewLogin() {
        return "Login";
    }

    User tempUser = null;
    @RequestMapping(value = "/noJump.do",method = RequestMethod.POST)
    public void Register(@ModelAttribute("User")User user){
        tempUser = user;
    }

    @RequestMapping(value = "/noJump2.do",method = RequestMethod.POST)
    public void Register2(@ModelAttribute("User")User user2){
        User user = new User(tempUser,user2);
        UserService.Register(user);
    }
}
