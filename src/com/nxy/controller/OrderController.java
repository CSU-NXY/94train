package com.nxy.controller;

import com.xgh.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/order", method = RequestMethod.GET)
public class OrderController {

    @ResponseBody
    @RequestMapping(value = "/deleteOrder.do",method = RequestMethod.POST)
    public void deleteOrder(int id){
        OrderService.DeleteOrder(id);
    }
}
