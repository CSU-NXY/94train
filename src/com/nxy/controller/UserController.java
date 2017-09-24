package com.nxy.controller;


import com.nxy.model.User;
import com.xgh.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.http.HttpSession;

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
    public String viewUser_information(ModelMap model, HttpSession session)
    {
        User user = UserService.GetUserByUserID((int)session.getAttribute("S_UserID"));
        model.addAttribute("UserID",user.getUserID());
        model.addAttribute("Name",user.getName());
        model.addAttribute("PhoneNum",user.getPhoneNum());
        model.addAttribute("Email",user.getEmail());
        model.addAttribute("ID",user.getID());
        return "User_information";
    }

    @RequestMapping(value="/ChangeEmail.do",method = RequestMethod.POST)
    public String ChangeEmail(@RequestParam("Email") String email,HttpSession session,RedirectAttributesModelMap modelMap)
    {
        int id = (int)session.getAttribute("S_UserID");
        boolean result = UserService.ChangeEmail(id,email);
        if(result)
        {
            modelMap.addFlashAttribute("Msg_S","更改Email成功");
        }
        else
        {
            modelMap.addFlashAttribute("Msg_F","更改Email失败");
        }
        return "redirect:/user/viewUserInfo.do";
    }

    @RequestMapping(value="/ChangePassword.do",method = RequestMethod.POST)
    public String ChangePassword(@RequestParam("NewPassword") String newPassword,@RequestParam("OldPassword")String oldPassword,HttpSession session,RedirectAttributesModelMap modelMap)
    {
        int id = (int)session.getAttribute("S_UserID");
        boolean result = UserService.ChangePassword(id,newPassword,oldPassword);
        if(result)
        {
            modelMap.addFlashAttribute("Msg_S","更改密码成功");
        }
        else
        {
            modelMap.addFlashAttribute("Msg_F","更改密码失败");
        }
        return "redirect:/user/viewUserInfo.do";
    }

    @RequestMapping(value = "/viewBuyTickets.do",method = RequestMethod.GET)
    public String viewBuyTickets(ModelMap model)
    { return "BuyTickets";}

    @RequestMapping(value = "/viewOrderPay.do",method = RequestMethod.GET)
    public String viewOrderPay(ModelMap model)
    { return "OrderPay";}

    @ResponseBody
    @RequestMapping(value = "/viewOrder.do",method = RequestMethod.POST)
    public List<Order> viewOrder2(HttpSession session,HttpServletResponse response) throws Exception{
        int id = (int)session.getAttribute("S_UserID");
        List<Order> list = OrderService.FindOrder(id);
        return list;
    }
}
