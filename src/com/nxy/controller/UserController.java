package com.nxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Monarch on 2017/9/17.
 */

@Controller
@RequestMapping(value = "/user", method = RequestMethod.GET)
public class UserController {

    @RequestMapping(value = "/viewUserInfo.do", method = RequestMethod.GET)
    public String viewUser_information(ModelMap model) { return "User_information";}

    @RequestMapping(value = "/viewBuyTickets.do",method = RequestMethod.GET)
    public String viewBuyTickets(ModelMap model){ return "BuyTickets";}

    @RequestMapping(value = "/viewOrderPay.do",method = RequestMethod.GET)
    public String viewOrderPay(ModelMap model){ return "OrderPay";}
}
