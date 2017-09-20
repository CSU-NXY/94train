package com.nxy.controller;

import com.nxy.model.User;
import com.xgh.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;


@Controller
@SessionAttributes({"S_UserID","S_Username"})

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
    public  String Login(@ModelAttribute("User")User user,RedirectAttributesModelMap model,ModelMap modelMap)
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
            modelMap.addAttribute("S_UserID",user.getUserID());
            modelMap.addAttribute("S_Username",user.getPhoneNum());
            return  "redirect:/index/viewIndex.do";
        }
    }
}
