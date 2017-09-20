package com.nxy.controller;

import com.nxy.model.User;
import com.xgh.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;


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

    @RequestMapping(value = "/Login.do",method = RequestMethod.POST)
    public  String Login(@ModelAttribute("User")User user,RedirectAttributesModelMap model)
    {
        int userid  = UserService.Login(user);
        if(userid==-1)
        {
            model.addFlashAttribute("Msg","登录失败!");
            return "redirect:/registerAndLogin/viewLogin.do";
        }
        else
        {
            user.setUserID(userid);
            return  "redirect:/index/viewIndex.do";
        }
    }
}
