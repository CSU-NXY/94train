package com.nxy.controller;

import com.nxy.model.Order;
import com.xgh.service.OrderService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

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

    @ResponseBody
    @RequestMapping(value = "/viewOrder.do",method = RequestMethod.POST)
    public List<Order> viewOrder2(HttpSession session,HttpServletResponse response) throws Exception{
        int id = (int)session.getAttribute("S_UserID");
        List<Order> list = OrderService.FindOrder(id);
        return list;
    }
}
